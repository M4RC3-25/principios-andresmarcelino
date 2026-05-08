import 'package:flutter/material.dart';
import 'services/tweet_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlantApp',
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: const AuthPage(),
    );
  }
}

// ─────────────────────────────────────────
// LOGIN
// ─────────────────────────────────────────
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _esLogin = true, _cargando = false;
  String _error = '';

  Future<void> _submit() async {
    setState(() { _cargando = true; _error = ''; });
    final u = _userCtrl.text.trim(), p = _passCtrl.text.trim();
    if (u.isEmpty || p.isEmpty) {
      setState(() { _error = 'Completa todos los campos'; _cargando = false; });
      return;
    }
    try {
      final res = _esLogin ? await login(u, p) : await register(u, p);
      if (res.containsKey('error')) {
        setState(() { _error = res['error']; });
      } else if (_esLogin) {
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => TweetPage(username: u)));
      } else {
        setState(() { _esLogin = true; _error = '¡Cuenta creada! Inicia sesión.'; });
      }
    } catch (_) { setState(() { _error = 'Error de conexión'; }); }
    setState(() => _cargando = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(child: Card(
        margin: const EdgeInsets.all(32),
        child: Padding(padding: const EdgeInsets.all(24), child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🌱 PlantApp', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            TextField(controller: _userCtrl,
              decoration: const InputDecoration(labelText: 'Usuario', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: _passCtrl, obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            if (_error.isNotEmpty) Text(_error, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 8),
            SizedBox(width: double.infinity, child: ElevatedButton(
              onPressed: _cargando ? null : _submit,
              child: _cargando
                ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                : Text(_esLogin ? 'Iniciar sesión' : 'Registrarse'),
            )),
            TextButton(
              onPressed: () => setState(() { _esLogin = !_esLogin; _error = ''; }),
              child: Text(_esLogin ? '¿No tienes cuenta? Regístrate' : '¿Ya tienes cuenta? Inicia sesión'),
            ),
          ],
        )),
      )),
    );
  }
}

// ─────────────────────────────────────────
// PANTALLA PRINCIPAL
// ─────────────────────────────────────────
class TweetPage extends StatefulWidget {
  final String username;
  const TweetPage({super.key, required this.username});
  @override
  State<TweetPage> createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  List<dynamic> tweets = [];

  @override
  void initState() { super.initState(); _cargarTweets(); }

  Future<void> _cargarTweets() async {
    final data = await getTweets();
    setState(() => tweets = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🌱 PlantApp — @${widget.username}'),
        actions: [IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const AuthPage())),
        )],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => NuevoTweetPage(username: widget.username)))
            .then((_) => _cargarTweets()),
        icon: const Icon(Icons.add),
        label: const Text('Nueva planta'),
      ),
      body: tweets.isEmpty
        ? const Center(child: Text('No hay plantas aún'))
        : ListView.builder(
            itemCount: tweets.length,
            itemBuilder: (context, index) {
              final t = tweets[tweets.length - 1 - index];
              return TweetCard(tweet: t, username: widget.username,
                onDeleted: _cargarTweets);
            },
          ),
    );
  }
}

// ─────────────────────────────────────────
// CARD DE TWEET
// ─────────────────────────────────────────
class TweetCard extends StatefulWidget {
  final dynamic tweet;
  final String username;
  final VoidCallback onDeleted;
  const TweetCard({super.key, required this.tweet, required this.username, required this.onDeleted});
  @override
  State<TweetCard> createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  List<dynamic> reacciones = [];
  List<dynamic> comentarios = [];
  bool _mostrarComentarios = false;
  final _comentCtrl = TextEditingController();

  static const emojis = {
    'LIKE':  '👍',
    'LOVE':  '❤️',
    'HAHA':  '😂',
    'WOW':   '😮',
    'SAD':   '😢',
    'ANGRY': '😡',
  };

  @override
  void initState() { super.initState(); _cargar(); }

  Future<void> _cargar() async {
    final r = await getReacciones(widget.tweet['id']);
    final c = await getComentarios(widget.tweet['id']);
    setState(() { reacciones = r; comentarios = c; });
  }

  Map<String, int> get _conteo {
    final map = <String, int>{};
    for (final r in reacciones) {
      final t = r['tipo'] as String;
      map[t] = (map[t] ?? 0) + 1;
    }
    return map;
  }

  String? get _miReaccion {
    for (final r in reacciones) {
      if (r['autor'] == widget.username) return r['tipo'];
    }
    return null;
  }

  Future<void> _reaccionar(String tipo) async {
    await reaccionar(widget.tweet['id'], widget.username, tipo);
    await _cargar();
  }

  Future<void> _comentar() async {
    if (_comentCtrl.text.trim().isEmpty) return;
    await crearComentario(widget.tweet['id'], widget.username, _comentCtrl.text.trim());
    _comentCtrl.clear();
    await _cargar();
  }

  Future<void> _borrarComentario(int id) async {
    await borrarComentario(id, widget.username);
    await _cargar();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.tweet;
    final esPropio = t['autor'] == widget.username;
    final conteo = _conteo;
    final miReaccion = _miReaccion;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Autor ──
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                const CircleAvatar(child: Icon(Icons.person), radius: 14),
                const SizedBox(width: 8),
                Text('@${t['autor'] ?? 'anon'}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              ]),
              if (esPropio) IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  await deleteTweet(t['id'], widget.username);
                  widget.onDeleted();
                },
              ),
            ]),
            const Divider(),

            // ── Nombre ──
            Text(t['nombre'] ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // ── Imagen ──
            if (t['imagenUrl'] != null && t['imagenUrl'].toString().isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(t['imagenUrl'],
                  height: 250, width: double.infinity, fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Text('⚠️ No se pudo cargar la imagen',
                    style: TextStyle(color: Colors.grey))),
              ),
            const SizedBox(height: 8),

            // ── Campos ──
            if (t['descripcion']?.toString().isNotEmpty == true) ...[
              const Text('Descripción', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
              Text(t['descripcion']), const SizedBox(height: 6),
            ],
            if (t['ataque']?.toString().isNotEmpty == true) ...[
              const Text('Ataque', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
              Text(t['ataque']), const SizedBox(height: 6),
            ],
            if (t['biografia']?.toString().isNotEmpty == true) ...[
              const Text('Biografía', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
              Text(t['biografia']), const SizedBox(height: 6),
            ],
            Row(children: [
              if (t['precio'] != null) ...[
                const Icon(Icons.attach_money, size: 16, color: Colors.green),
                Text('${t['precio']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 16),
              ],
              if (t['recarga']?.toString().isNotEmpty == true) ...[
                const Icon(Icons.bolt, size: 16, color: Colors.orange),
                Text('Recarga: ${t['recarga']}'),
              ],
            ]),

            const Divider(),

            // ── Reacciones ──
            // Conteo visual
            if (conteo.isNotEmpty)
              Wrap(
                spacing: 8,
                children: conteo.entries.map((e) => Chip(
                  label: Text('${emojis[e.key]} ${e.value}'),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                )).toList(),
              ),

            // Botones de reacción
            Row(children: emojis.entries.map((e) {
              final activo = miReaccion == e.key;
              return Tooltip(
                message: e.key,
                child: InkWell(
                  onTap: () => _reaccionar(e.key),
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(e.value,
                      style: TextStyle(
                        fontSize: activo ? 24 : 18,
                        shadows: activo ? [const Shadow(color: Colors.blue, blurRadius: 8)] : null,
                      )),
                  ),
                ),
              );
            }).toList()),

            const Divider(),

            // ── Comentarios ──
            TextButton.icon(
              onPressed: () => setState(() => _mostrarComentarios = !_mostrarComentarios),
              icon: const Icon(Icons.comment),
              label: Text('${comentarios.length} comentario${comentarios.length == 1 ? '' : 's'}'),
            ),

            if (_mostrarComentarios) ...[
              // Lista de comentarios
              ...comentarios.map((c) => ListTile(
                dense: true,
                leading: const CircleAvatar(child: Icon(Icons.person, size: 14), radius: 12),
                title: Text('@${c['autor']}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                subtitle: Text(c['contenido'] ?? ''),
                trailing: c['autor'] == widget.username
                  ? IconButton(
                      icon: const Icon(Icons.close, size: 16, color: Colors.red),
                      onPressed: () => _borrarComentario(c['id']),
                    )
                  : null,
              )),

              // Campo nuevo comentario
              Row(children: [
                Expanded(child: TextField(
                  controller: _comentCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Escribe un comentario...',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                )),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: _comentar,
                ),
              ]),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// FORMULARIO NUEVA PLANTA
// ─────────────────────────────────────────
class NuevoTweetPage extends StatefulWidget {
  final String username;
  const NuevoTweetPage({super.key, required this.username});
  @override
  State<NuevoTweetPage> createState() => _NuevoTweetPageState();
}

class _NuevoTweetPageState extends State<NuevoTweetPage> {
  final _nombreCtrl  = TextEditingController();
  final _imagenCtrl  = TextEditingController();
  final _descripCtrl = TextEditingController();
  final _ataqueCtrl  = TextEditingController();
  final _bioCtrl     = TextEditingController();
  final _precioCtrl  = TextEditingController();
  final _recargaCtrl = TextEditingController();
  bool _cargando = false;
  String _error = '';

  Future<void> _publicar() async {
    if (_nombreCtrl.text.trim().isEmpty) {
      setState(() => _error = 'El nombre es obligatorio');
      return;
    }
    setState(() => _cargando = true);
    await createTweet({
      'nombre':      _nombreCtrl.text.trim(),
      'imagenUrl':   _imagenCtrl.text.trim(),
      'descripcion': _descripCtrl.text.trim(),
      'ataque':      _ataqueCtrl.text.trim(),
      'biografia':   _bioCtrl.text.trim(),
      'precio':      double.tryParse(_precioCtrl.text.trim()) ?? 0,
      'recarga':     _recargaCtrl.text.trim(),
      'autor':       widget.username,
    });
    setState(() => _cargando = false);
    if (mounted) Navigator.pop(context);
  }

  Widget _campo(String label, TextEditingController ctrl,
      {int maxLines = 1, TextInputType tipo = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(controller: ctrl, maxLines: maxLines, keyboardType: tipo,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva planta 🌱')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          _campo('Nombre', _nombreCtrl),
          _campo('Fotografía de planta (URL)', _imagenCtrl),
          _campo('Descripción', _descripCtrl, maxLines: 2),
          _campo('Ataque', _ataqueCtrl, maxLines: 2),
          _campo('Biografía', _bioCtrl, maxLines: 3),
          _campo('Precio', _precioCtrl, tipo: TextInputType.number),
          _campo('Recarga', _recargaCtrl),
          if (_error.isNotEmpty) Text(_error, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 8),
          SizedBox(width: double.infinity, child: ElevatedButton.icon(
            onPressed: _cargando ? null : _publicar,
            icon: _cargando
              ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.check),
            label: const Text('Publicar planta'),
          )),
        ]),
      ),
    );
  }
}

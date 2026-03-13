package com.example.demo.controllers;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.example.demo.models.Tweet;
import com.example.demo.repository.TweetRepository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/tweets")
public class TweetController {

    @Autowired
    private TweetRepository tweetRepository;

    @GetMapping("")
    public Page<Tweet> getTweet(Pageable pageable) {
        return tweetRepository.findAll(pageable);
    }

    @PostMapping("")
    public Tweet createTweet(@Valid @RequestBody Tweet tweet) {
        Tweet myTweet = new Tweet(tweet.getTweet());
        tweetRepository.save(myTweet);
        return myTweet;
    }
}

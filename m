Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B77431A3C
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725392; cv=none; b=uY8DMw4WEUXID/xdj7/hEXQ4Hfpei/+usq4MOySRq2PAvV+BaN02h86KkRdYSbh5yD14CWvjmv3tI9+pamlJhgswe3Rt9yGT9lEMEfSR3FBQBZnafRnjMhtT9j1curstC8Jbp6LTXfhVFEpMB14z7BezSRwt+F2TYa7IzVi0vZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725392; c=relaxed/simple;
	bh=zqlWQDmwaIOgQkR91IuTGpH5Px5j9vUjOg0+ay+C7Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBePwYCsamBKXVj9KHcZtbLxgT0Uh0KT+IIQK7x7D7coTaTucHSIoh744M6PGHWNxoxsY7eM7D1uj4VTGme8Oj3sgjC7xZoCskKOgs+VcTTKO87NrVV/6xOyrhXKDvNkEjDfreKlbzU2P3QauKz1p11alIAvP503OrHBFthR+wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bJVqEW7H; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bJVqEW7H"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso410321f8f.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789725388; x=1790330188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pwt6VmdbigODlTJ+4GTZarReJSK6366BuVdXf1H3UUQ=;
        b=bJVqEW7HBbaGeip5VED0w32lHpimsAOSM6HtYXzyzO7ISRJ5zev72qGGN1IVPLDazw
         5MIDdnMoUHr7JsmsY0oiVNvsYQlOlo6HRg8XgDCbp+h6g8quloJab1DtKl0pfH1YTg/a
         ocAXb8YLWdYqyt7+dfMIEhNIA4AT0JFtUA1and72VMWKwXf9cY9RJhs1gJW833cJUW/F
         tXM3yV/fXQG51p9A9GwhWX4zLx2u2CQy/aFaL9AE+qZ/+4TDhQuLr4OKOWu4bNX48Ndn
         0TzLS/bjHl8/eAvk5fiXDvspsl/dNwe6UN2uzYcWWbVoXHHPdLgI2FIeCTM0yDU7SXHy
         x3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725388; x=1790330188;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pwt6VmdbigODlTJ+4GTZarReJSK6366BuVdXf1H3UUQ=;
        b=NIQYhpF4tBwxToFUwqYRefJr/1RQjvP2nJXuJxjrVOEEvbQclXLwJo1DgemFRRSV1+
         iP25tpTGJBAUyIO8l16+Li1cUQLpRaJVg8XH1cT8qvD8oux+J7HN/1OQqD/k0my+NT+T
         8DnVCYJSllNSWUaSTMsS2qfifYlvIpMtiv8V0Zpnt1ttLQfNHl4YKoj94NVNrc31rulb
         qLzI224HwAL+VM705dhPOxpxZ+0MFl7DnoMBw2kqRN0gKTTj+wRXM74nrvA/3qi2nILZ
         W+W23/OLVK3CDgFyqH/cXFaV10u+brbfWUCiIJGsJzy7wSMUQXLvnlZz6oiJa+iu4LNb
         JCsA==
X-Forwarded-Encrypted: i=1; AKwUvByjKsnFvueQAAv93l8eGnRj0pXIHoVSGzvpeS++c/bhTuAkvBfDB+hEsRt3/sdSB57vnq1oSJcP525P@vger.kernel.org
X-Gm-Message-State: AFuF++loYGwtkzb3/WLq0AGnBDzfdZIG9PhYU+MOGiP7jR7niRhlubho
	WvdgAOYAwGxnY6qRMdGJVhiatS1E2mKQbCBMSiPTHL2++0y7TfneD3xQ5l7if/boFFA=
X-Gm-Gg: AYBFou0mCWRwTm2djjm5tscIPx2KXUSIHQp81crgNDsllGa6805JLPvvN6o8Apa2Izj
	Zk29r3vykZ39FOegyrsWlWrIoGK8tzrf+S6nJUqj2d3JEB71hbQpxBzg9xN5s6r2/O8MOjHqp7v
	MdOnrAhenJMKvtMkj3ATMPqJV6DQaVXfBPJhabRJokVGW2Il1NJrJNRJVzVSLJFRm7Gsq3bNtfE
	5tX1Rtqwqpmroxg7WdJWW6UOTtp/PRKZ+CYUmz7GNa6Vnlo/NrkuYzmWtkKhM3uA845yZTEHM/p
	7gEBynXJtIV4PcuJhoSA4/WcYhCtBLvVehLuIHQro0qc3DTWB7QIwSiTCA5E6YUaomT91fMigD4
	VYLfCClNF0IDlRtfX9GXA/8YECk6pHEB9sxk42J8vE8ADYU5Acmi8rRWK0uoWi0HdJjySWnZU81
	s8xGLFmzluEHOoXJOpRSGMSmxthYbCqhnWXdrhSaZek2ag5kvttWwIigKBFftKZyVdV1ir3Wg=
X-Received: by 2002:adf:e011:0:20b0:487:219e:5e20 with SMTP id ffacd0b85a97d-487219e5fe1mr667041f8f.51.1789725387833;
        Fri, 18 Sep 2026 02:56:27 -0700 (PDT)
Received: from [192.168.3.100] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008fe3csm2829597f8f.37.2026.09.18.02.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:56:27 -0700 (PDT)
Message-ID: <7da24c37-3f6a-4a85-a06c-3d587f6ed4e5@baylibre.com>
Date: Fri, 18 Sep 2026 11:56:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: meson: aiu: add I2S Capture DAI
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-amlogic@lists.infradead.org,
 neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
 <20260917-audin-v2-4-38de4bc1de34@baylibre.com>
 <20260917212019.4ECE61F00893@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260917212019.4ECE61F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> 
> [Severity: High]
> Does adding this capture stream introduce a permanent clock divider leak when
> hw_free is explicitly called?
> 
> Now that both playback and capture streams can be active simultaneously,
> snd_soc_dai_active(dai) can evaluate to 2.
> 
> In sound/soc/meson/aiu-encoder-i2s.c:aiu_encoder_i2s_hw_free():
> 
>      if (snd_soc_dai_active(dai) <= 1)
>          aiu_encoder_i2s_divider_enable(component, 0);
> 
> If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2, and
> explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
> snd_soc_dai_active(dai) remains 2. This skips disabling the clock divider.
> 
> When the streams are subsequently closed, the ALSA core skips invoking hw_free
> again because the state was already changed to SNDRV_PCM_STATE_OPEN. This
> would leave the clock divider permanently enabled, potentially draining battery
> or blocking system suspend.
> 

Oh, this seems to be a right claim. I can use 'ts->clk_enabled' for this 
and gate the call to 'aiu_encoder_i2s_divider_enable' based on what both 
streams are doing.

Let's wait a bit for other comments (if any) to show up, then I can 
prepare a v3 to fix this.

-- 
Valerio


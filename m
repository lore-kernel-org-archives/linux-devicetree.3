Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0A14048A3
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742515; cv=none; b=B5QHuuIbPdYgj2KvQjEu4zYuBngpJXBfii8npQysy54UrMcxmY5QkyA5gXi/WBd8iRio0yQc99aPK8wtvpvZN7d3ZF3DA4sPGHDHCePuC/J5VjFXe+fOsddx5MQr9Ln4htruc4IyCd0HLx9Bpk6qm09nGU17UT9dlgVCBL16U4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742515; c=relaxed/simple;
	bh=5p/McKl0At+a6VAzKcOjx3RuZRzgCfxMKqmXtggVLuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F1m1LddYE1QOFyP48Dvn1TJyqRnZ3CtxEwlaiPstjJkWqaiDdAfmz6D+V+Z6OYGG4g4rCuMHWzud8asM7le7zqT9Fs77bh9qLw9o9aGcxqkL/+w2QsyqGMtAvQARCL3CHhH0XL4hmQfobB7S7MdmcfmP6tWpLoGbnkLkLbqt0NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YriLaAzl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YriLaAzl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b29be0d6so7498865e9.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782742510; x=1783347310; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RlSGFWS4+pKKIa8x4IUZ9wzt88PH868TUMMVsj+F2xg=;
        b=YriLaAzlx7/8xuxqqtX5jObQuQD5HA5lIE7nD7c6SyoTonvguk1OT8gnFfJBzgEVDS
         NRZfAr/uN9yM7JDQ5fXD0PXrlWWYp2fB2KGWuL1VE62+LYj7rk4KGESN7q7P3AuHsxBx
         nB0tdWDOTUgcrLliCBZ5EZKPoNwNNRUIrJFZvwtNhe8HR0Qx8xVNBqQ54nmmGWpUTERS
         anAcA+uy0BzWmaaCTQ1m6Jl3vrKShtOSgGOh4SFa45OcduGmgYWfcTWNi3J7w2SiXT0A
         RjTKLj4XZavhzIKaO7j+IPsTwQuyo3Vuimnc0+2+AP4dGcq/qi2fZMBcqsTBYhIh/kDZ
         Lt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742510; x=1783347310;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RlSGFWS4+pKKIa8x4IUZ9wzt88PH868TUMMVsj+F2xg=;
        b=qgjz9zmEyQZFUxiYTHYstxVXtE0B1PTWyr/4Rt+V2gP5ZlUwErKCPuUAiTtK5duDdp
         MmprzDaZUB6KN+n/mVTJc96tCyX1oZF2TSQBd+M9tCtf4YT7vAVQWBheq7KCQYHVI2Qw
         20173d8onZxHHd1guJBizIABzvRRZmZxYiZZ/XsfDyDpPoRhmvUlYZOF4uWlgernejgB
         oyn4/w3S3pWTv1y6uszhdfUY0911CcIaY8FY9yWU7HzsMcXlMs2vd1RuXtqgWfHx4d8J
         5bbB21Ea+9hrKCeVAXw8VkaVDil40X+4438f2R4bX/DtNIF01IVM8CAOpmX4ACWT+A+9
         xuIA==
X-Forwarded-Encrypted: i=1; AFNElJ/In30j29bMTbTFE4TFQW+/KrSW4pbucHSuqoTtmGjR7nylYsfD/EYpChce1/C61nBqw9V2p8q1R3MF@vger.kernel.org
X-Gm-Message-State: AOJu0YwPnkAjew+YReh94geRQd1VJwOBfIKBZI/El2yeojH5zldGzoWj
	LtoRX23+FEmQsZKIUI7E3W++hoTC0maSjZamM9G7d57CaxrOFLNB2A7Jicri5eQjRXE=
X-Gm-Gg: AfdE7clp/Rr2sAPa3mBSPGIAejd7QPz78dAiDCTqAJIpvtVW4SZs+9IiW3jHX+0j69p
	bEcXt9ZEMDFcVOJdOM0+4lpm3tHTJtv+AhfAHJdVICLP6AJQeKDtHhyotPM+ieoypnUZ6lgV4vP
	MFmNkd+aYfXy9CHafmM/a7M1Cc3YOC1y6grBnS6h45p7eImtOO/RoL3Bxn44y2gwjMr+O3uWrJr
	XFGw4ZmcZRGpXpHKXyiLE1bWH5Hua2RkmzLsKet0Vpgi0KHdBhj0s2cD0J86BKukN7sWWn6eQdU
	10gC3yfS3y1NXG3Pd4wffzbEHSfI0tzXaijeKVKpl8rTGZS7gzkQiyrHM63Dudt1JlO51iOCywF
	Xc5tLwgESFIkL0ZAFgIc+F87pyYubSZTs9bb1l9KMzk5IJppmCUUGwGcj7K822MmIXRWjG1TSRW
	69RjCdatJ3em6Yrp6NoY2NDQ==
X-Received: by 2002:a7b:ce19:0:b0:490:ae36:4835 with SMTP id 5b1f17b1804b1-4925a208424mr287672525e9.17.1782742510488;
        Mon, 29 Jun 2026 07:15:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46f86c34d76sm25027622f8f.3.2026.06.29.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:15:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  linux-sunxi@lists.linux.dev,
  conor+dt@kernel.org,  robh@kernel.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] clk: sunxi-ng: sun6i-rtc: split main oscillator
 div and gate.
In-Reply-To: <20260629131254.7E34C1F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 29 Jun 2026 13:12:54
	+0000")
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
	<20260629-a733-rtc-v2-5-7b72112784f8@baylibre.com>
	<20260629131254.7E34C1F00A3A@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 16:15:08 +0200
Message-ID: <1j7bnha0wj.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 29 juin 2026 at 13:12, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the error path
> in `sunxi_ccu_probe` unregisters clocks using the wrong loop limit, causing
> either memory leaks or out-of-bounds array reads depending on the struct
> array sizes of the specific CCU driver.
> --
>
> commit fe4850822f9e2e522aaac703e02ecb786fb47f26
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate.
>
> This commit splits the oscillator divider and gate into two separate clock 
> entities to support the A733 SoC. It introduces a new read-only divider 
> based on the oscillator rate to replace the fixed 750 divider.
>
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
>> index b24c8b196e664..25dd87e78eb7a 100644
>> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
>> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
>
> [ ... ]
>
>> @@ -286,6 +287,7 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
>>  		[CLK_EXT_OSC32K_GATE]	= &ext_osc32k_gate_clk.common.hw,
>>  		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
>>  		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
>> +		[CLK_OSC24M_32K_DIV]	= &osc24M_32k_div_clk.hw,
>>  	},
>>  };
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does adding an extra clock
> here expose an issue in the error handling path of sunxi_ccu_probe()?
>
> In drivers/clk/sunxi-ng/ccu_common.c:sunxi_ccu_probe(), the err_clk_unreg
> path unregisters clocks using a loop limit that appears incorrect:
>
> err_clk_unreg:
> 	while (--i >= 0) {
> 		struct clk_hw *hw = desc->hw_clks->hws[i];
>
> The variable 'i' incorrectly retains the value of 'desc->num_ccu_clks' from
> the preceding loop, rather than using the correct bound 'desc->hw_clks->num'.
>
> For drivers where num_ccu_clks < hw_clks->num (such as sun6i-rtc after this
> patch), will this skip unregistering the extra clocks if probe fails? And for
> drivers where num_ccu_clks > hw_clks->num, could this read past the end of
> the hws array?

Good catch, using a different iterator should fix the problem

-- 
Jerome

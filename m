Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70714438FEE
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745473; cv=none; b=NQVCml619LLViNGruYUY8j+V/epFY9eAIkNBqkWQogQvwL2y/YPwaO5LPQzWw71fBDx2l07W+UUMEWwN2VkAYkE4RRleoo5IsIhuOtiaFYkW2EA7gHJBa/lYuq5vNVjXjNCoyDSFVq6gnf73Uob2mcXaVkOkmY2sqHnL4nU57gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745473; c=relaxed/simple;
	bh=mLbyaEAgqepNN61bWeIhuKu91cbHIs1TgT0DiSEwuG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E3cxpFtXEKZQ6KqKvt403v59qwulFgiUOINB1D/UQzkJDalyNUOJkydfwYNntWUEE+btaRbctv3y4rrdPFNva9eo1eF9UisbkgI1xUKyrNvdmo4eStClyKm7Sjc1PVoydIiSjQsKTvVkmQe6Rk4GZlXYP/aWlYdf36r9oTz+4Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WTSkdzLW; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WTSkdzLW"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6a0e55e82d0so2003704eaf.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782745470; x=1783350270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKC86SBllWMC5DazOx7jxMwvHWS3vvb7786WkQz0OjY=;
        b=WTSkdzLWZFj3XvffUCor6PD83mAixGrmyrRS+WHPILF6lvxKDB4/yNU8kWfmrTpVYD
         o694SCilIQO2xrBhE3ZBbwM+ZQWUotrQGGvUtwbu+0fUHD3HwyTbQOFzBq3x7DibI0y9
         ESxSjsJyGs7RPFGRk60kNc0jF1Ar6QOlLCYr9Dq+mPpntxmdjgnNLcRy5eDZ2910F/X2
         8tSuCL43GtR7LgggGvVrweXz55IIV93Vh7FanbIpjtw4g2/p1U3GFSq4ktzNA2Ag9sTd
         dfbrTAQzfDaUnSbB6bm3t9iv7cja12yj+IOPqEuxsNouQu0kDnAOz/ZRKQDNK+J2uQRl
         tJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745470; x=1783350270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKC86SBllWMC5DazOx7jxMwvHWS3vvb7786WkQz0OjY=;
        b=IcbAc3qRaEW0BVclIRTxwOiaCrJw1rueCJ+lIksLjk9J5aUmxKoB4W5B4D5T5AqJYb
         Z5Anb0k7Zz7CbwAAjvKOuY0tkXG4bEp+Y/i/uJg1i0jKz6lzkMslSIg+WvyDqEESiaQs
         tQR6U4TG+eStF33u53zv6G+YNzmlqtPIfEyBhZQAVvGXIWOZlM9ajWYzm5b1qHfiU22X
         yP+643DFmmzcSqqWnLPFBFJdrCXFbfAJfpGeELp+jYyuZb9Vsqz2sctQcFqBI2SiGVP9
         EIh0AZLGo5eWtnUH4PFgyQbJBJ+7hnuh9LKakPdXpt1h1/ac+OrOeMeF3Y+J/bnwoh11
         J2fA==
X-Forwarded-Encrypted: i=1; AFNElJ+AuOxS3xoK3smaQxohMW7fIrkvOFNF0KVr2DZaELS/ZLFhn8ZR++l1Po7ppRR230B1Oneo88fn+Xqj@vger.kernel.org
X-Gm-Message-State: AOJu0YwctWgT9QZSYPo4mWZMDXmAV30knCUPhFo4E7Ye4ZTsyVb+17tA
	BRH1mTnflT5G0K8jEDzxBN0DLJ4PekGFpgnrH4xRPucZy41ym+fMjXmrQDpwWkLDY20=
X-Gm-Gg: AfdE7cnzSUkMvdnuKAz7s+gimHys8IL1uChBq35oVqWGLAQg/gbqEwKpkfPpifmRu/x
	x6Sb2rTdgNHRm29dkCNM8Si4YIwILfMeurTvSsXP3dGNDkwrk46HVjhk+1pCf7RdHNqQG/Fd1N1
	R+xuQzHLd7Wz0O0ez4DNbJVRMgLySwiN+EgEp//twfbVp0Wde3kUxApqaL2RRMDUpkIsqRsHTIE
	ztpuuxlotKoyFPwUYX4GnUVdkZWRU00mGu82K2yDP2L7JEwVQX/HckVpp7+D33a5uw4hALGs8hF
	tOwvmAhhGxvoaQQPPCvN/DyGFxWhxoCNpF+Hsv127FXG8RT7ljPTrSVwgtmvhsjCatmLOQrN5ck
	eUOKxIWbzk54DYIRP7631CK6JwxfEgfUWFhqJOzdFp95xyGA6r2QSms55CV2QMugg9m8mQmLzSJ
	w50UEcnHC/EBsqGNBy4eJ5BxLsUH6wdcayGxPztnXxZFfEFY+4ZFJsMNSSeM52/x8KdbVHGkGuL
	A==
X-Received: by 2002:a05:6820:55d0:20b0:6a1:82f5:b009 with SMTP id 006d021491bc7-6a18910d066mr33242eaf.13.1782745470465;
        Mon, 29 Jun 2026 08:04:30 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448db92c113sm26526fac.4.2026.06.29.08.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:04:29 -0700 (PDT)
Message-ID: <2f01a3a0-3698-41e6-8fee-1d2e1629726c@baylibre.com>
Date: Mon, 29 Jun 2026 10:04:29 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Chi-Wen Weng <cwweng.linux@gmail.com>, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-2-cwweng.linux@gmail.com>
 <40485b4e-6585-42a1-9b84-3019328574c5@baylibre.com>
 <7e96cc1a-eb60-4eeb-937d-64e83bc35279@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <7e96cc1a-eb60-4eeb-937d-64e83bc35279@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/29/26 2:11 AM, Chi-Wen Weng wrote:


>> Should there be a dmas property? Datasheet says it supports PDMA transfer.
> 
> The hardware does support PDMA, but DMA support is intentionally not
> included in this initial upstream version. The initial driver will only
> support interrupt-driven direct raw reads, and the MA35D1 PDMA provider
> is not upstream yet.
> 
> I would prefer to leave dmas/dma-names out of the initial binding and
> add them later together with DMA support. Please let me know if you
> would prefer optional DMA properties to be described now.

We always want the devicetree to be as complete as possible even
if the drier doesn't use all of the information.

So for trivial/well-known bindings like dmas, we should be able to
add it now.

> 
>> I assume 8 is for the internal batter voltage channel? Often, we don't
>> include fixed internal channels like this in the devicetree since they
>> are always the same and don't depend on external wiring.
> 
> Correct. Channels 0 to 7 are the external ADC input pins, while channel
> 8 is the internal VBAT input. I will limit the DT child channel nodes to
> external channels 0 to 7.
> 
> If VBAT support is added later, it can be exposed by the driver as a
> fixed internal channel rather than being described by devicetree.
> 
>> adc.yaml already specifies minItems and maxItems, so we don't need to
>> repeat it.
> 
> Since I plan to simplify v2 and drop differential channel support from
> the initial submission, I will remove diff-channels from the initial
> binding.

Same reasoning as above, we want the binding to be as complete as
possible, so we should not omit diff-channels since we know what
the bindings should look like already.

> 
> Differential input support can be added later once the fixed hardware
> pair constraints and signed output handling are implemented in the
> driver.
> 

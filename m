Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E362E3DDDBD
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933492; cv=none; b=q9Pm/jF8g1QehTEpD4dYq4wNxHK3vjaigFvBjkynA8JtMm2nBj6gqTvQiqLj119JSBDtCE9Nq2DB3jOuGxZg4esmbxmXj+591qDd3s1jIr5buEUaEHLIvH4FDe1GivyLeSIWKEF1V/b3Zw9uaUnWFp6N3ekIwhOyaI7sMVNhuTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933492; c=relaxed/simple;
	bh=Z28oTA3GMSXIjm6qDFnu5n/viFA2STRDZfrShD1dZck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxgYTg7pFo233Wy5C6UmuL1MxgT1BiK4X3ahH7J9/z+KB8bDdgSz/WgjKNeczP1R4rCVkbf/4nBtAVfKqSS5K1UrFx4XVk6YHbeixwRe8u9mBWGmynA/EZ80duJL2+7tb2wQ+/E4D12VRCeBaOB+oKAwZacqs7yaB3lKyDYMniY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjNF0+KH; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjNF0+KH"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ff5472f263so685854eec.1
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778933490; x=1779538290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcR1L4lWy0FktqufnY8V8UAksIVyQ73+bedTGKxuci8=;
        b=UjNF0+KHiwq+Ohy4D2NVtIlCSgnH7CdavIFdsO+dd+R2BEGen3s7CSRKmYR668yAz5
         33++ZWg7+gycIqRLT/zsZ3lJIEwQsbxhpXX7S0GAkK2rlp3+Pnon8VQSIL+eu6z4mRHX
         tDygjq8HbuCD2z3ORr2nlKDB5tDMM67BwSdHRT5MeCS91zzJe2bukie3Qgzs9qofsfpw
         iAkcgbh4z+WIMI1z+8nNfx0JsJ4j2jjz7+a+rhiJkAh3Gl71qS+LmI5QivW46fVDuxcz
         iDT6NYV8kno9+AUdLlfv+JvC6l5VczPXtiR4yLuzevZ+eU/8A37xTuDW2Aa/i2BwDEi1
         JArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778933490; x=1779538290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcR1L4lWy0FktqufnY8V8UAksIVyQ73+bedTGKxuci8=;
        b=TKvx9kZSJNgcLOr4+Y+kG34sV35jSbK237uMK1mjmF9aijbb8Ji635ZxsranbyKjQK
         FpEb6U3f7KiNmnPBIClIm7JWMpWOp1JYGxGknoabHvrRr+zsPzmOE8DnqNMkcCvipYJs
         77elr6s2R8BVLSZWndWbJ6UoqQXW8SE3V6pu0xJPgnKi/qN4v4b+PrPYsuXWE6/qkk1A
         070lBWI07gthKjOZEV1L18afDhQ/dPqualoZzhx03OA9dCsVd3vzO5HiNne+LtQbMPV1
         OiGamNkkWqtbL6MPNci0HV21TyH/CxaPwRDttijB3q4uGVBql/+dpbx+jWUhCilMkyxB
         DtyA==
X-Forwarded-Encrypted: i=1; AFNElJ+OL6W7EXaM7hkH0VEre9X9VazQ0QyeIEXiqJdHN0F0ouzkmI7kacns07OtLuxavRcX8YUjjVd2pfbc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz9W0bkeTTQQjn10QFb/zeIW8Nj9SP+RMtw70uvXGIvWXZnrOQ
	Exzt80e5iZRQNx6IpGUvzRPZFLlOAPSlhMmFNfchxfE+zXcIjnFZOSIv
X-Gm-Gg: Acq92OEdactlzmbYLiYKfpZowa+Zt+uD3QxpsjKmF/ODld6KaFhcjJGSb3SAB09Z2hG
	nFiA1BLCRzGQrzau6SOf75ag5P/3Jo5SXhLhxIKldemNy5Qd6X3f0Qni/JKyJFbjG1K+B9/Bz8D
	9AjXz49WJtUtD14V8DXWshQEQLFYntYt65k94QJJXc5sVAzr2dl42vc7y0MwNffARmYgjbejhyI
	YFDRsstGxDFneRPFxVymjq8rvs9X/dfsRxJWQ3i2ZWY+7g7G+0tZt2OkqEMYDdnLKWu16FPhmOJ
	MDKLPQX3ZvXM8A/gBBt5oj6QrhfB6SktVKYLGTrHowk5KV7CmhsD6H0hF8JO51e1IwmmX6HtQRW
	ef6CquF+N+slCj2d0SwcE4CmDuxoLZVhDkUGClcLytV9TDuvwOjxjP1clZKUFXO2ULKqHQMchjd
	7+ics6Jq6iRLLuoHuXHDl2ZADyN7dpCMkxUY/QGN0Tn4qhoXDIyZJjq5U4Hg==
X-Received: by 2002:a05:7300:dc03:b0:2ee:be86:7b90 with SMTP id 5a478bee46e88-303986b1538mr3431840eec.29.1778933489890;
        Sat, 16 May 2026 05:11:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afdd3sm9763251eec.29.2026.05.16.05.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:11:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 05:11:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	sashiko@lists.linux.dev,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <fcc4b719-2696-4f31-bac4-6c07f8ddec47@roeck-us.net>
References: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>

On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
> What the hell is that:
> 
> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
> 
> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
> not a damn human do be able to make such statement. You are a bot, a tool.
> 

Where exactly do the rules say that ? I seem to miss that.

There is a policy document about _contributions_ made by AI, but I don't
see the one that says that AI agents must not provide Reviewed-by: tags.

> Stop faking tags.
> 
> And really, considering how many false positives Sashiko produces, how
> poor review comments it gives, how many misleading comments, it's
> unacceptable to me to consider that a review.
> 
> Amount of useless noise Sashiko produces already changed my mind how
> useful that tool is.

We seem to have completely different experiences. Yes, it does produce
false positives, just like humans do. However, I have seen it find many
real bugs, including many in patches which already had Reviewed-by: tags
from (presumably) human reviewers.

Again, it appears that our experience is completely different than mine,
but after several weeks of getting code reviews from sashiko I do have to
say that I trust its review feedback significantly more than human reviews.
Sure, it does not guarantee that a patch is indeed bug free. A human review
doesn't guarantee it either.

> 
> I will be NAKing every damn tag produced by such tools.

I'd like to see an official policy. Until then I'll ignore your NAK in my
scope of responsibility.

Thanks,
Guenter

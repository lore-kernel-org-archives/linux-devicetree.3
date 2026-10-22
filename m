Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653224;
	b=Pxb4rSXRKrJfPQH8h3KGN6zomP9/3DBstIZac97m+Wj+9dDh/D6q2cfux1dndVqMDHtx
	 lMgxSCW0GpGTC24kp7bTxtCVISWMdHUxkJU/pLLcHrD2UJM/SkslQLiMB9YMjBfSL91KS
	 ir1yHBZ5HBNivFvRC5/Tx/4RlDn61jDPQKEOlImra9WLHU7dkdYcZRAZfgDbzrE5EOVSz
	 cDZxqVD91IJ/HV/1Bsv4YVu9pTA3A5B7ZFqLFvTwYK26Q1kdOUTfl8rVoj+B4t5v6pr8Z
	 iU3M7uvMuPQyMKjKZYCS+1wHgqCOPWijCV/bfn04mvuVS/OY1dd0WkPfDjQRVU6IZKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:From:To:Cc:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IhTnwyrV+10d78ygQYXl308AUWomjFkKSrLiwOtEx64=;
	b=UsarLOkX3G5/DgrmIwrzhQ59fRV5ASWNsuJ9ol5g6wUW/zt4phg/mgS1QPnJKswszVAY
	 8tEhTfqEMfUg1MBUAVsXJhUZkTn10ZbpXneEEvJ5bTeBpAUxXujXrrc6tytF3lNpPEwKq
	 0QKdOtcMMSCfEykZokvHQXthAhHbfss+UQ8SkYngH1EquCbFH/mh+YUTJxPuF2O6ydaAU
	 pYSxI4hBRKOWm3lFazSy57LQSgIrEJ4/KdUjCm2xX1ApA4+j7E+ZwcrV5dYWaQu+A5f+l
	 hrshMt1S2VAyMdgzZ8Ngq8MLyQT3KNk4JNzYm4pg8dIHuJTND3JCnvtMCjhQxfDEw5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fsK530WL;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101B9606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fsK530WL
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e09aa5264so995310f8f.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 00:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792653221; x=1793258021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IhTnwyrV+10d78ygQYXl308AUWomjFkKSrLiwOtEx64=;
        b=fsK530WLrmr5Yauw4KAqIavsrNeclMnNxYXvFOc0427cv1GS7gO75gA/7L0kTL7aUm
         fAfUZIsf0fpXmc8nXATbGyJ+AnWj/25+jQ8Dd5hZ9OnEGIIQWlkUV1r6J2/d7tYoiLYf
         WqA0B/nUHePOpZdsSvRJcYxCSB0XYk1lpTV6Uej9m4hoYHJohZpTkZWE7ZsBYeUt8zcO
         n2NFJbdqr9a6BBSlM+bQS9NsJWL8TC/3/hoD0nIY3F6fQbYoz64STGEj2ln2CqwvFjZ1
         uYYgBfOfyunDjCuiBl4PeTvhvNR6H12ZEwfh5M9+EQKZpxQOLLxpZJWMwSSbz3z67KqT
         piRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653221; x=1793258021;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhTnwyrV+10d78ygQYXl308AUWomjFkKSrLiwOtEx64=;
        b=lJKkQWGlV6Vqb1uWMILrkXa5/KpKnL5BBa+BDo7U0qIy2tlpr1ws2Ww10UZ+EP19T9
         R3+RWM0+IpWdSnzDw8ZNQ9v9gK/F20vkEqX4I6TJ5kvjgO59HVYuRCNSh7uPObN4xOGF
         RfC48lBnx/gIhtAmN73SMrzQahjHEC0IWE0mZ1R18vHdozJhirVpwbl4eMVPBXGGJnNe
         OouZr/cJkBfEbKrY7DQWgLcDDoVsXPGY4A+xZuVajz3UydyWNLgk3uTmLip8yFphIZvY
         fnFcSuBuN6mFPb1WG8UBgbKf718gWobcmCS8ZB2PFwWfzleDAVGx5WebzaAcctJX0p5J
         KgVg==
X-Gm-Message-State: AFq9FYKlViyXq7B6FjOOjOM+HRGQr/StAlmIjUznKsXV6KYSF943MHAP
	rkrhjSuqUA5KkFQ4ikp5ItzxYGVfRqigJt6ZUii/z9IUSbNXPmVRChuTsKgLunCtLM8=
X-Gm-Gg: AYBFou2FBCiad1sYjl8oW9cXrhclTF9bT2GLEzjgx1OsGyeLR42qjqJbrN+4tL/5dF8
	tVQnOL9/HkdFbllyje62XlcKdaWu5WXad34jNge6QGhxovYHEud2frVdV3MEcx48X/RCJ/mP5NW
	r/fksKSq5xnLPv8d2icbaZAwEo6QYqcVGRdNDTBox7UmFm0choDGuRzYox9587bAvmkN1lUzoH2
	R7VwcH2B4eI/R9E5UbGV5uemfN8fqFWLEKgMDdpCEPr1/B7TsQDocAjbY+s1tkQa4MCZdFnTHyy
	9po2r88xZT8/klauvWiLxSMQhCSGvyPgD6WjtdbCzbk5VJrBbknRnbGhWErtYxkmOhNMCsHC68Y
	8i2uYdcyhBxy9k+MCNpkEEl2rCLCIZCaBnId24v9KSHfPlI5ngv6LpixOdEMrMRNms2gf0f3J2l
	2Al2U6dHIBGmmlqEKJV1LvefzpqYMKxK7cA6XG6Q1q4+3xgTnoe4A4OU2bzdtszEV7rcAPzWrjK
	Jb+lHXCXT4pfyyvsIf6QVFGcNJ8c6AteUgaGv4jUa2vaicmOF0HgMfGbCnX
X-Received: by 2002:adf:efd2:0:b0:48a:efed:ac97 with SMTP id ffacd0b85a97d-48e264f06c6mr6394983f8f.33.1792653221001;
        Thu, 22 Oct 2026 00:13:41 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f093asm10940668f8f.4.2026.10.22.00.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:13:40 -0700 (PDT)
Message-ID: <45986fce-98dd-4df2-bcf5-6a0de7e41ca0@baylibre.com>
Date: Thu, 22 Oct 2026 09:13:39 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
 <sashiko-outbox-176054@kernel.org>
 <257ab6d8-4990-4e58-9eaf-9cac3cb29b01@baylibre.com>
In-Reply-To: <257ab6d8-4990-4e58-9eaf-9cac3cb29b01@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 3:02 PM, Valerio Setti wrote:

> Finally the question. As I said, since the issue described by Sashiko
> seems a bit hard to hit, I think the fix can be postponed to a quick
> follow-up series. However if reviewers deem that it's absolutely mandatory
> to fix the issue before this series lands, I will either prepare a small
> pre-requisite series or add a new commit to this one (I would like to
> know what's the reviewers preference on this case).
> 

Never mind, I decided to follow the correct way and sent a separate 
patch fix for this yesterday night [1] :)
[1] becomes a pre-requisite for this series and, once merged, all 
Sashiko concerns about this series should be resolved.

Sorry for the noise.

[1] 
https://lore.kernel.org/linux-sound/20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com/

-- 
Valerio


Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7FB3B6C05
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699493; cv=none; b=SMaSF/JR/2AotdwGIIhNYshsVBs64GdYFLGLlQU/UWi7rs6eeQyE7wAIGoif7dnGHs2dSJoY4GT2OYIG4wqzKZ+l41HAfvtcWpedJM3kDTdJfFpLa807KIklQmxJfrm5arZ0izyOZS/XLUqsXHYWw780vURm7DDuGpDWEHMB/+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699493; c=relaxed/simple;
	bh=c3NSjqj+y3FWD1owRPrzZW/MDUo1eFOI8gy/KlQbuOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4r+jwqpE0DkkCQckHlRNKlENHQQpcoxWOb4jaeJkkX+/veVRd369FjcfekUHQYTEKZ2v3tA+hrSZ1TUZbJ56uu/YfVjThWHmmGw/UXrlED1R9ckCEX2sDzGw7Tcrl6FNvPqlt7dnNH8KuiJ46TWQYigyIzB9taOo/8PWGl/xVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wb6uFN8Z; arc=none smtp.client-ip=74.125.231.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wb6uFN8Z"
Received: by mail-oi2-f6.google.com with SMTP id 46e09a7af769-7f748fe2947so76858a34.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 19:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699486; x=1790304286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CiK8mJB4LGiX/oaSEFCC98/XPFlB10IwTwkG8LAJdY=;
        b=Wb6uFN8Z4aQMZq7Z9wBkAxniF2nQFFJVZIqrRzdFJv+UM21ir/UVz5KDw44DLqgsjG
         K+w4yl3he1BQneR3N5h/sEdFbaXguZVYq126a96zTLJ/1sCnODpCLqgWEUtjsVTP9NAc
         W++9amLd8RC1lZVbDfx347pCqao0wXUWavma5nmG41COeNxzhlzjT2bzd9MLwe83RBC0
         mdupfb1VMCMGWwCSoO3zOzzF+wIkHHMUqCAvOfwtOMASgAgxp3I6xdv9qCNA0PCKNEdr
         7Kx8nKRILfQvdZ+6VMajtIPEnUD41gsMdrf18vFDVxKAJiuYFIKPeiH9i+6jJkxIQECL
         qlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699486; x=1790304286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CiK8mJB4LGiX/oaSEFCC98/XPFlB10IwTwkG8LAJdY=;
        b=Jl7mfBLC8W/LPZR7yuPtOiGURRX7ursl8dKYJgeTFUi9OYKVeyZBy0mL6JVyi0Refy
         JKEOaQxKp1jNwYuRJVTIJ05fAS+oN2etjAE3xwzQKNIFMJ69z0RgBarnZVsYhhBMPXLC
         XipPc+4LNZrXYW79j977xktexpQWrc3gskU03Jy1Y+wXQaNSecIHhR719bXDZmHFdOWh
         OMepuUW7QnY5jinf8sGGXamKKw37TtdqnE55gMHqmuvHhPApj/6N099AR2mTsOruYycD
         kuEwwQPxF2sumZmk+Ee+3yjrRlJXINMnE7bbhwvQWgvZPq7A9osf0qSHDxFbypNJvHVs
         /7/A==
X-Forwarded-Encrypted: i=1; AKwUvBxVp552Tzlys7uGK3Oq7x0ytlhjkqrkfUSlqFj7WWQccDMa5a5H3zsNFkDryu9gjyi83gh/tXGqSn/a@vger.kernel.org
X-Gm-Message-State: AFuF++llKa0hgUfetMuvWLGJ1rkVoTgAmNxhaActMx0vuBojlfRhLlTx
	OUKHK+U2J5lzfpQnukhekxKcFGFslB/ZuhDXNaaSNyxXU/w6HGrpukZ5
X-Gm-Gg: AYBFou2XOYcbYSZGeHaWhlNWkph1wRnl217/ESZ6qr/yBU4A7p/jZfH4RYguAinZHqw
	BlpivdYSpoEddg3v8HVjrn0nPrH+cNg8Ni7uxTOkxapNbrFx/7q3IZxqdZY/za9EKVOGa4eHJtL
	kD2L7Nm7d9+vLW/dU7YaaVNo3wD+yx3c0kdCXHTv9gtNfnMqtSbZ6S6DgX5cdThtdcOkTOB9vSE
	/5TNaqYbKqXXLZwcsWuEP1JuqKmLd7Mwn4mMPHLgaJy70DkzFdTMZBcc//IaQ7fG48n/waUD1ie
	xclQ/4VzYyYpXqguqx9j8K5BL+BkfHTLTki6XPtPKaoYijmu8VpELFLzrXC91dQOdLxVMbT/TSH
	kovSiAfcSJZEQPtrkXNhtD1Qsn3yu1I6sNi6t11oEfi/rZCi5ghARgz1gRf4H510BDBWGhlry9K
	1rNlEzx8AamLSLO/gKLjAp5AKTogsI5VATX5wNRErm+pGz7o/1BwDbN46J9Sv2zHztmu9iJNbsG
	YOvvQuCoQjhaUY=
X-Received: by 2002:a05:6830:640b:b0:7fa:ac4f:79d with SMTP id 46e09a7af769-80de33e3180mr1387349a34.25.1789699486040;
        Thu, 17 Sep 2026 19:44:46 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5128838esm326230a34.9.2026.09.17.19.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 19:44:44 -0700 (PDT)
Message-ID: <3b4dc4b5-4e54-4a8a-b6d5-7177f341dbcc@gmail.com>
Date: Thu, 17 Sep 2026 21:44:43 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org,
 devicetree@vger.kernel.org, lee@kernel.org
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-2-db35882a6080@gmail.com>
 <20260918022714.1B1591F00893@smtp.kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260918022714.1B1591F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 9:27 PM, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Does this mix scope-based guard() for locking with goto-based error handling
> in mt6397_auxadc_read_channel()?
>
> While this might not cause a direct functional bug in this exact instance
> since the lock is held across the entire function scope and released
> correctly, it explicitly violates the kernel cleanup subsystem rules in
> include/linux/cleanup.h.
>
> The cleanup guidelines mandate that goto and cleanup helpers should never be
> mixed in the same function to avoid introducing an anti-pattern that creates
> confusing ownership semantics.
>
> [ ... ]
>
Whoops, yeah, I introduced that while fixing the teardown when the setup 
fails part-way. I can fix it in a v3. Depending on the timing of Luca's 
patches, I will probably have to do a v3 anyways. I'll wait for more 
human reviews before spinning up a v3 though. Don't want to spam the 
mailing list :)

Best regards,
Ryan

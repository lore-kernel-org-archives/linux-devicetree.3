Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5152E9729
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510571; cv=none; b=H8usxc4/7Y2LuBxTcrjRu4oGHTENLdofZn+7h8N+P+8qdlIZp/9aMJWR5WmMiKyWYO75h7F/dklbIg4lmXUtSblSa4fWJ075HfkaBeWevCT3sgLYiyrwboHEVEq1nJlrBDbd2wOnrMydK3OmUoenGJwHvGEp6UZiZM8IJPknR+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510571; c=relaxed/simple;
	bh=H0PtDtMH7fhKXYVLHdaggAQU9rhUC69jlh+BkXkBf9g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cy7UpvisaRGb65OlTPYmF+zDmhdXUM/w8NMclt/KA6bhadL2A/MOC2GLxZBr66idEm1nD8qJimpw5Bo0j5RNzGd1L7TqVNcLM5Uggf6e1dmxzhb+raPaP8HYR3Iwy5x6vwsU9/ELCnAxFpubuRZLw9wMh+Q8f6clY9XCch6NfNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bUvjqg6T; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bUvjqg6T"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb787dec99so811424a34.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785510559; x=1786115359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7B/qtQQs7zBLF1wHpifwjnC8NO3TVJxvfEFMj9bRfo=;
        b=bUvjqg6TJ19WEzFCXJsl+kt5Zb3Ppxgv/JgEzHlfLWB8jlT60ChmpBGNE/s542p32T
         XT5vkPKx5LRCyuBYxqbV85xvb0kBM1IAqiDw3qQgwCTddCJjnyXRLL6xuviMkJvESvPR
         sZwBUn8I2vV1m42PCbzGg2vtwv0Rqbx4WbXyR9qf8fH+7kRch0WJFlVq8IoSFUb2i+nE
         GC8o4tWzQs+YQ08+n0Gz4tI3thbK812bAy8Fa9mcvIJbmHjYfRHYWVTyrSrdCp9trdYh
         UB0vunTMOdsz77oOXBY2jz6Lc0T5a9ReuKAV0j0JIqbnGwl5cc+5t8wD+DvzNZqPlol0
         4l6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510559; x=1786115359;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7B/qtQQs7zBLF1wHpifwjnC8NO3TVJxvfEFMj9bRfo=;
        b=gWR0QAL2OzqM1pUmMJ12sGzC9YnmjN6ajpERAaL3/sOTwA4w+AONBXzQsutiAWsU94
         at6V7BXA2aMR4VJn187pC3fVIaN1SJvWJyD5MHtI80ww/aBgZAGZsZVos5Vf9ST6pT5y
         TfIQFWWujqiE5lHfYB8d7R2mfF9SoE+zuZw+0+QHDwhKG8h22qIS/Pt62I0zXEMxyhFg
         M/zAIWjWybPwgXfGRFOQUFvd7fOeKSUTSRTC6hHk6o4UuClSN93Y/0wMNhVMU0GkAq6d
         wM4XQhMgZJe2gLEUjDf+F7EN8EUB5jwODISXZ09xdEYW5MHRiwDFXLZZPqnO3dlq5PpS
         xc0A==
X-Forwarded-Encrypted: i=1; AHgh+Rqc/4HmBiufrXE2DUZvoc5eSO6rzS2jsUtnntCH+nWhK4zh6OwEFWQqaBOWfa6s32LcAPdCkLo4ABg4@vger.kernel.org
X-Gm-Message-State: AOJu0YwVD15wclLm4QwQmOmNEoftYE6kQR0XnYMg76oKm8nvbU3SzHza
	doi7d4YiTnRGJTBBp/yLE73bJTm8sKmBLlVtVBqbOljLb1dlOq20TYrJXrea+iN5XoJ17SzTkcP
	0ZpHO
X-Gm-Gg: AR+sD11pOFDPPBqWF2T4eIJjZ8RHRRITI0fhEGQMPPBYm4mRWQCMxOEw3PlNFRAThUF
	WKlpmuU1MFnrIhDkN6J5voIUqHMYhbgZlBXqKiPZzdeO7Dt7veZpLqID/lFBWvZTfcZ4vMeHNnE
	N3TWndJGsF78A/XtETWlUJnYVVy0X81sN/oySGMkMY3shqsX4JIEda5gaoexzOWxbNsT8DK5olY
	ejlPYO521+eYndqMVjgfElwDUtebXWs5mj7quJkO/JujPdpu3kUCpCHaYesXq5mZY+pg44e+9+H
	kIHMv5nhqDlTCjImU7cKz9JMsRXNY1BSQi4+o6rLIMrNFjWq5in4isXBUHr85EbTcjLSHeZOy4s
	UISg+AlqF3+nMipm5t2IjVrubFe+Oqdx6xw1od+lCXo4c1XD2KE/9IToS4H+/EP29EbbfFLWAxb
	8+3wtYbqBVsSnfiuthoXSrMqsoRQQR1nK8+IFUuvmfuLm8xvjwzRewtOkft3Uodg8cho9uv3KpM
	yRigNuWzK4EwW7EeyBiSqxELGvMpNrPYknwZcl+gC6IqpgG6eA=
X-Received: by 2002:a05:6808:198d:b0:485:48da:133d with SMTP id 5614622812f47-4af5e29c73bmr445224b6e.10.1785510559180;
        Fri, 31 Jul 2026 08:09:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:fa40:746f:401a:3b75? ([2600:8803:e7e4:500:fa40:746f:401a:3b75])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58f2a635sm795191b6e.16.2026.07.31.08.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 08:09:18 -0700 (PDT)
Message-ID: <feb422c5-a1c2-427b-9585-1f796d61fb3d@baylibre.com>
Date: Fri, 31 Jul 2026 10:09:16 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c04: Add support for TI
 ADS112C04
From: David Lechner <dlechner@baylibre.com>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260731-ti-ads112c04-driver-v2-0-aab0168c3c01@gmail.com>
 <20260731-ti-ads112c04-driver-v2-2-aab0168c3c01@gmail.com>
 <0f092382-416e-43ac-b58f-b915165e29ba@baylibre.com>
Content-Language: en-US
In-Reply-To: <0f092382-416e-43ac-b58f-b915165e29ba@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/26 9:54 AM, David Lechner wrote:
> On 7/30/26 9:58 PM, Kyle Hsieh wrote:
>> Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
>> delta-sigma ADCs.
>>

...

>> +	st->config0 = 0x01;
> 
> Needs a macro and FIELD_PREP().

Correction: This one is a bit, so FIELD_PREP() is not needed.

> 
> Also, since we are parsing channels now, can/should we leave PGA enabled
> for diff-channels? Otherwise add a comment explaining current choice.
> 

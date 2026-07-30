Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BC844213E
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422862; cv=none; b=X4jLowpBiuNeT9tM7YUVSYa4UQ/YMLiGSXl635DB7AIi1Hf8BuZbutsIxioieQ28xtlFTLP81EbtX/b3hLyYQXH3QucKMxIbBABgrNdlmmJYkZYh+mcCJukfu8893KO2Gbid5BGL0oDUzCjjrjzXMv5xExNtsmVbtzOK6IwKd0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422862; c=relaxed/simple;
	bh=CHo4TkZ2Bd0FHGa4s2+Qmzp6HvTJtts3VaNH04a18wM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZGJoEIRuSvTsajc9lH38P787R5kYBKIJIwKPsb0JCpEqYnC4jV5DxkCI1FBJCPkpbRKSeYpSYl2FNMWEqGv3QGQ+Mr+ZV5EfWSWl7F16i40po+if+Jh9mJe5zjTJJZOru4KwLEpAlf1G9/OYHS67v5q84ovbzcSi9+wODYD3vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5yKZXPA; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5yKZXPA"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848643382fcso2294763b3a.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785422860; x=1786027660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgJDW0G4Wf9hrZ+tf3vu9dcGivf87Rv9XeyNRhNIlM8=;
        b=Z5yKZXPA2FsCekA/b1tSQfhrq6jVZ64fyiL7vpNI+m0fl5EjmG+zgg38j24nm684TZ
         p+H3GW4qTLzrIexrPad1cNUOZBUB7zjY7jXKvxhxjnAaqWVCD37bc9lVG4bd4LcBkK9u
         YqDaWNS4wwSST/ZuKkNjc22ESpQBFfYyd/q3KMFMpfYJ9VHtlkNZvl4QNk6M7EXWZiNk
         ckZ0zYcXGyQKcw6Zb61ufigOog/GGlgEL+Z2fRq47h51sFzQGDcNX5yYjo9h/R0s6rRz
         knKy4powu+8vWK5mPHBVfdjHVQj5Wx8FjrXHQuGEUJfNH/NSODNhn08JAGICFMaLihWj
         s5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785422860; x=1786027660;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WgJDW0G4Wf9hrZ+tf3vu9dcGivf87Rv9XeyNRhNIlM8=;
        b=Uhopy3vH7DDLcMXB6Qtj1IF7XOImRjdSVIK+LT9/oxzgeHRc0ePYmx3tb1NPlWrgVT
         8veKryDSqSomqP+boB2A4vXDN84CHjsbPEXGII0jvwo8HLfYMdaeHhq8Q1SbzPGIW4ir
         A5Rpo7jcsrxILI0Fw92tsBRtLVL11ZhvmCYtL92fUSRNJABMBzYsJ/EPRmYCNMvRqYFB
         az4FOzI6krj4od7flfZVMrGUury//DrL1QivvnBBmjshu5X8vdg5CSGltu/j0YzL2rzA
         mlbI7JERfI64V6WCINZhHS1BOM5nlUBop1Mx0M1WVSGfsU90xI7Iadb8cq0WQYv4KpG+
         p2pQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHO6k2sKGuwVy8tGn9HW2oaXJ94L1v8BFyBKPQW9nzagnI2O81dpemKJbzduMXB+o1qCsZ7aBcsddi@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMkKF1RivJ4BYKTpOaHAihMzsagpa9Eh+W04R3pSsPY9pMCej
	K4NTFTQiPJQ+Odu7dK8dydheV0yDmU8/8+YSum+VwqjQKLF7pe4qdHLQ
X-Gm-Gg: AR+sD13/xcjYp+pIwjc/iWoblCdhp+oTYty0AeAe7B7NnWR6Seg5W6F9wduxOlsVgqT
	jUw+NxjDj8TZBCv1ONoC11k4Tyhs21DrbAZDMSk+OFDAtmlenDuWTUjAWL1AaSksUzfpehBOrss
	yBsHBnGflm2cGwj1TaOLad/p+JcMPH0boZh36VVD06JpWVM7Z9SsiUoHF09JXoJc0h/jvLBzMdl
	KqYpVF4vDPW9+Zf2qeEiUSRo2I8R0fXHVCzr2RgK8WG6/Kw1dh9uJAhJGX9rcx6vDT1geeNNr3d
	KubRBjQnpSOJ/bp9lvPtmrH7QqfdLCHm/kggXYrdb4eLbr0tIwuyYUyAQk3tzkzudrnJWcGBBAm
	sY9Qi6Qg4FdxTtHv0yRcsfZ5Ak7HBQ8FVpBNOXoFv1qfpC9M4fsRdByoO0A8gkVLzmrhQoojVYn
	gBpzM4pUvA65gX017hO00tcY1Nd6fvZugVQVjfvF3mILpim7BxQ2jqW2WrIwgU9ajp32pzUXImP
	8xuXndrzBWgqjFXnydLk55gZoN/AoeqfmffPw==
X-Received: by 2002:a05:6a21:6118:b0:3bf:e761:6285 with SMTP id adf61e73a8af0-3c90d44c4fcmr610337637.29.1785422859869;
        Thu, 30 Jul 2026 07:47:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b6d14bsm20653283eec.10.2026.07.30.07.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:47:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e37df572-1ca9-4c56-a16e-faa44f1ff1cd@roeck-us.net>
Date: Thu, 30 Jul 2026 07:47:37 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Alan Tull <atull@opensource.altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <c3e143ed-af08-4a0f-a630-96a255df838d@roeck-us.net> <amtewh9lOgWz0-Nh@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <amtewh9lOgWz0-Nh@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/30/26 07:27, Nuno Sá wrote:
> On Tue, Jul 28, 2026 at 02:05:53PM -0700, Guenter Roeck wrote:
>> On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
>>> From: Nuno Sá <nuno.sa@analog.com>
>>>
>>> This is in preparation for adding support to a device which needs to
>>> use it's own read_block implementation.
>>>
>>
>> The chip-specific implementation calls i2c_smbus_read_i2c_block_data().
>> I'll need to know if this is a chip limit or a controller limit.
>> If it is a controller limit, a chip specific override would be
>> inappropriate.
> 
> I'll reply from top of my head (did not looked at the driver again).
> IIRC, the biggest reason we need the chip-specific implementation is because of
> the RAIL selection logic (mainly when not in page mode).
> 

Yes, I have seen that. Question is why you use i2c_smbus_read_i2c_block_data()
instead of i2c_smbus_read_block_data(). The rail selection logic would not
require that.

Thanks,
Guenter


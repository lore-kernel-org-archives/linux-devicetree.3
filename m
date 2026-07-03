Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088833B47F0
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072905; cv=none; b=CISU4rfiRUKJmd/0MTrsAIRm0yBqQofaTRy8uJme8GIvpdsAzjF5m37CuaUePRHoiCtCHB97niCGgt3JQw7TrnN2+fcUIZaqJD+eIpy9+QaecvGJNCdQH/vn5P8JcegF1QoUl2JE4hJ7hHBL5pY4wB8yQMrtfpdsTfWs3nmA1gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072905; c=relaxed/simple;
	bh=RYeeLX2JG8dp87oYPPrNDLM4wRbMmmAVowH6Gs/X6vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dd+WZULQ0etCyG8i3Dii3fzM4IdsCNQvwQtylEHUWnmTEtz/57Y6RB2C28AktTP62pM8AJz7bS3P+5IXkJcUq9nOFICOk/JxYsyaerWAfwVXxlstsauHeO2IwaZc3wotepG161eW5i1v76YiwtnOS6+ddeYhWNUKs+Cvd4gO950=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7V9YHX/; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7V9YHX/"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba320so287170a12.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783072899; x=1783677699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iphKavMyEGyoKkZ7flBVPKctJFRcurdGeTwbxLH/hOs=;
        b=A7V9YHX/6P5OlAht23tj0RMGPFoSinD9l1uXNrDG4TPTQp7WTHxT8tXxV+iZlehnoa
         lPLc48BQEtflxSDW3TSmiC2M3IoGKKqoI8Wr1qollpaU81PrGqSz+Qr7AMC06BMOK+BL
         R1rYxp0yzuGoHOnWQjQrMqJ+0MBwn/aMKS8iGmuVDhdxtDTVLz5JrH+QXfJmvwnudQAo
         yLcriQBv8FQy7WbBR8+K7UH/35OSk3PAqDSdcBZ8qKgg1wumB/gX20RXu6xb9thFeZzM
         d0RIaLgusB8tjNciytWwZmzyX8va4aT4orP2S7LqxVeTpWHBURkm4S5y6WrCopp1c308
         GhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072899; x=1783677699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iphKavMyEGyoKkZ7flBVPKctJFRcurdGeTwbxLH/hOs=;
        b=P6WAoJVPGHjOtVAfg3THk5LlyFkcSxBI6Gf04qqThfYpapYw34fJMPGTSp94ha0GNe
         JPwdIyVRe345KuRudLVkXq0TlLHsxyDK5zdmzWckjpa2OzxX2t8GypUXae0bkE1cbQ4V
         sgPEFLm3CUOxYWLHiEJbAPGnnMUKuIrUoGowdxLEowbi9Dp2BQ7UlpyVPvko633FMnaR
         Ay7Z6SJL1x3vSXEjyn7VcA+30IxCMM0X6my34iZ6pAXPsSM8dNqEHaS9YcnfXwdLB5EM
         twxRYafSmVtlV4Dd7pP4qhBMi1c/X7VwSWgdV3KYfV9dMjoIHmrViBUIGG0tWEzq3HMC
         FzFg==
X-Forwarded-Encrypted: i=1; AHgh+RoTTEuO3m1bxmqt7Wi/3bQsW8tIU/L2NI2t0ORoVuCcJipSHLvV5uAc/s/tn0FYuLQzeRe36nz9qxCN@vger.kernel.org
X-Gm-Message-State: AOJu0YwXLdm+xcBe04D7yJVLSU1mYVbCpFU6TjkYG+bxtDDXLTA9gjYi
	UmeMnXYdJxRUUt0ZsDQqTpIXKs+AZh61t7BBVqIKyhXeP4Ouw07MYdTN
X-Gm-Gg: AfdE7ckSd/eGbwbZRdDhNeo0uy7cR9Iyf/8HdFeVW/PXFG8lXbRUdPE4bxAatMZrGK9
	HWqW6/7MGNaKyY79sPB4RhB7C5TFQDg+WvmnUlm9Zk8OuCUsuhtZolsvTAn4miSfNx8egmr4XWf
	JBf0VW9V804hVA7SbR4zIIpivrKl3qIwiHwdTg4SR1j7Z7m44f7d/ISVgnzU8vrGgPsW5CYSiIJ
	RXDBsFK9l+0maJFGYn+GGaICGjC56bMHIZvYQD5S6IqyOuYzdNaE9IahruxWHrXbHMvdAZrX0Ua
	PFIIDdntw5m9AF9GItAnBW0OUh9FdfO3sOymFrjLZb0qyS6LGUNic2/RpY8CxrHFUeFHkIcblKM
	bipsG6w9JAlXYCKbpwAsy7e7Ky4wPb89fV3dEhp9JLKYeMGZwIVbqevLCqUorKrj9cvzKOSLuPS
	YkeZpKtnEcZpjql/Zz0yEFRMqiTX74IheisyZAJGEJU7YfXer+Ug5G1A==
X-Received: by 2002:aa7:c68e:0:b0:698:ff3:85ea with SMTP id 4fb4d7f45d1cf-698c104c5f8mr1030271a12.5.1783072898947;
        Fri, 03 Jul 2026 03:01:38 -0700 (PDT)
Received: from ?IPV6:2a00:1e:db84:b301:ed61:1b51:c39f:49c? ([2a00:1e:db84:b301:ed61:1b51:c39f:49c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad118f43sm2162762a12.25.2026.07.03.03.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:01:37 -0700 (PDT)
Message-ID: <3e094744-8603-443e-8027-8fc2f2817879@gmail.com>
Date: Fri, 3 Jul 2026 12:01:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: dac: Add AD5529R
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-spi@vger.kernel.org
References: <20260701-ad5529r-driver-v5-0-ed087900e642@analog.com>
 <20260701-ad5529r-driver-v5-2-ed087900e642@analog.com>
 <20260701194103.45541cbe@jic23-huawei>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <20260701194103.45541cbe@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/1/26 20:41, Jonathan Cameron wrote:
> On Wed, 1 Jul 2026 08:40:40 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
>
>
>> +      adi,output-range-microvolt:
>> +        description: |
>> +          Output voltage range for this channel as [min, max] in microvolts.
>> +          If not specified, defaults to 0V to 5V range.
> No way to specify the default as part of the binding rather than a comment?
> I haven't checked but does
>         default: [0 5000000]
> not work?

Tried that approach. But the dt binding check does not accept default for this DT cell-array property.


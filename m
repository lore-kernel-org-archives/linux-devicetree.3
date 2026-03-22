Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC680364949
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 00:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774139885; cv=none; b=JAfCL8Ipyf54tXuwU+GvThGQHBB9iubVAsuoEh3uYJjMf/g1982ers0us68izM3Ll1EADnDjlOB3sidTTzOWxvenQ9Gx0OUqjm9MnBA7rEateX1rZUsDNz6MXrGvYrz4QmCIwxO5tW9I4LnBgnIZUjJgNRz052a9ZaKMc3JarDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774139885; c=relaxed/simple;
	bh=6dLhB2ydoQBAqJPB1raZlJyeJqk0XqP+WELLlaK0rKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWa9Ru48M6t3FnIpggBwNxQVmomWLEi46llyKTJWz6vRNJvr4kYF7fob1vSfhMwwmzuP4DvvB7cPdVHuTsiZhNjX1uBT0nMb/MjHmQbBhAnwyhHwhyxKcj77ffB6mGTSPT+YVvuK+PUzLuNSjQ5pzL5q2iBMiCccO1a/DQFzi1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=m20yiiym; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="m20yiiym"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-46704177508so1053473b6e.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 17:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774139883; x=1774744683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ZkURIzaUVIDe1R8WHRcSdusVPoS3d/IbkclZRm0aAU=;
        b=m20yiiymSwTNb5PCtfbOHTPDJwyRUu81ZGCoAiLBlO9tP/GemtwbjWh4LJqIbMd5ps
         Hdbvf+8lZ79Bz1EC8BgOx1jhgAgyaPhYtUNhV/azDXqr85lbMpIDQPwMyPcHoHI1jrEQ
         I8gKyKiGeOF8Yr08ik45Vj6Bj2NTBsEHuEZuOVtwsa+/K/CrMiCDiFxaKW/ap0WOPemd
         2wVBL7gbn/kaHkcy3ETvNdErTI2y9vMsXuDNzegwKepsSBVHFWsoBRLdVl30PmbkFfCT
         W6NMSDurky8EuPKCjOL8YwVUxrDMJDsz48gawrXQi2djNewXwhi3njA6TxsfnFBNvEnl
         KZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774139883; x=1774744683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZkURIzaUVIDe1R8WHRcSdusVPoS3d/IbkclZRm0aAU=;
        b=ffUK351eq5oSRMUNh47k2YoUUdHkxJdhQehJ/2sGcPR24QNOSjERyv0mxDXyfuh8NA
         e0zxe++jTzhO6yZaip5SX9hIZXnrD3oAR+EKnru0oR35nGlWfTRF2I2j2/naPQjQ7P88
         hAm0ZDD1suqszcI9Ecxdf+soSZ+0MKbwXPpvbpEzYe6oxFeexWZqSNlFWzXrFq1jGbst
         HWgisTJao+LeraGu0lS1ZDadLcSTyOZGE8gY7STPLNCm9igYLPdRfKyTfHMaX63Lap8d
         /tEXwGfFPpgfRBnD5jHAo93Z9HRhIBxtbQobGEUGi3bL+HlbH66+qZ8YGYoJ4lfrgVua
         fG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmodAYNGhsxBb2BMOGm/d/X8XH1iZZf7saOO/Z62KT1ydgKrVDvLxWPXA45EN8Jh4i1YBbXszKTCpE@vger.kernel.org
X-Gm-Message-State: AOJu0YxcPPd6F5cVxe/ug2bcK0NsxoGvjxUUp9TGjVScUeKbdJdWkzL/
	u1Ve4kVwrqsa6tNi82HCWNIuzQ4XTQCcu143krmvJi5ET5JTqdMEw4uYjN7SdR5y7hg=
X-Gm-Gg: ATEYQzzQm1rgmRED65rpzcTV/yZ4fD7P+232tfz74RxmexLu+ralGvFcA+WRjE8JL9U
	5ChPI+jUxUvEU8aVzYyGYq0Y5QHz+Ryn2LQvdOyNICXGlRoJTvmebQyXlyf2xfvVGxf1Asm+lE2
	TRnzA1Tbn8Fh3h2TuAmlTzUYJcrFBstnUlCdG/aH1k6t9rMB5deDnF8n7/95HnsuscnlYszFIEr
	G4TIMIYxNoae2UGcTJpSoUvMG5zw/gHZ6i4k1qHr1vZHLE5ONsN1+wjLye/Hb47TII+NnLTD84X
	wRrC95SMjW7kdBVOLVtqG/3UHNulwS0oXKnIpUOvMYPWax5BHaKOkcXJrpl8t8+pqvTUHQHiNtA
	wf8VtykZDCEx+FmqG5XxfhcdrOQprRXW5k1P06FEsaOUXnhFjYp89YNxJRLPG4g5eoEVXwtibT/
	wVo9k8UN997A4aV1rFaK0C0tWwE4POf6dzwvA7G1mUQzzLXsqaCEeDZMBJra4KVOVESnUC70w=
X-Received: by 2002:a05:6870:45a6:b0:3ec:4f31:42a with SMTP id 586e51a60fabf-41c10eff5ddmr5416367fac.7.1774139882771;
        Sat, 21 Mar 2026 17:38:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:fb84:df2:aafb:553d? ([2600:8803:e7e4:500:fb84:df2:aafb:553d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41c14d63aa9sm5915411fac.10.2026.03.21.17.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 17:38:01 -0700 (PDT)
Message-ID: <b1da32d2-e1f7-4fea-82a7-a40e8073a100@baylibre.com>
Date: Sat, 21 Mar 2026 19:37:58 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] iio: proximity: add driver for ST VL53L1X ToF
 sensor
To: Sirat <email@sirat.me>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260319190738.151614-1-email@sirat.me>
 <20260319190738.151614-3-email@sirat.me>
 <8502eb51-53c9-4f1b-92d0-21b06fa4802e@baylibre.com>
 <CANn+LWJEJJoGQU7p2P2GrOcA_g2x7jEnvjcTJYG1hDRUnRw3UA@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CANn+LWJEJJoGQU7p2P2GrOcA_g2x7jEnvjcTJYG1hDRUnRw3UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/21/26 5:39 PM, Sirat wrote:
> On Sat, Mar 21, 2026 at 11:09 PM David Lechner <dlechner@baylibre.com> wrote:
>>
>> On 3/19/26 2:07 PM, Siratul Islam wrote:
>>> Add support for the STMicroelectronics VL53L1X Time-of-Flight
>>> ranging sensor with I2C interface.
>>>
...

>>> +
>>> +     ret = vl53l1x_start_ranging(data);
>>> +     if (ret)
>>> +             return ret;
>>
>> Why start ranging here? It looks like this is controlled during buffer
>> enable/disable.
>>
> The VL53L1X (unlike L0X) does not have a single-shot mode. So every
> measurement requires the device
> to be running (Autonomous mode according to the datasheet). Starting
> ranging once
> in probe allows the direct read path to work without any additional
> start/stop logic inside read_raw().
> This keeps that path simple and low-latency. The buffered/triggered
> path independently controls
> ranging via postenable/predisable, so there is no conflict.

If you do a buffered read, which stop ranging when it is done,
then how can the direct read work after that?

Can we just start and stop ranging momentarily for a direct
read?

Otherwise, is seems like we would want to have ranging always
enabled.

>>
>>
> I will address the rest of your review in the next version.
> 
> Thanks,
> Sirat


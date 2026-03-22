Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E364236495B
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 00:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774139992; cv=none; b=pMA8+6FmcoKs7OjjAUNo1ArxjvSuJNI5gRpKROhUQnk6aYxeC/IgxuTRdn7E762KZGvrFh+6ag0kIqzMkfwRtalgkegwb+gp5WL3ShNcPxUDIUT43H6TVlURS1UKrY4IveNT2HB2ct2nuBbo0CbDJWYG4k9ZOQoZYfmswRHBLUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774139992; c=relaxed/simple;
	bh=CL2yetUDApoUW5IHkiVF7crdPEfYmediFopWU4E+gZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVO5HK13r9gLhkN5a+mvza1PhALudJ5pmTyrQ+weQYXX2JHgn6dho/3Hp2xNE0yg0raRbXEk7hhsOsqHwJZVN0pG1Cg5fHugvkFCrfdKcpYnnU2R0dFUMbMnaPaHA+8IU3Y5OdPHlAO7iYBbT9Q4falP+gVFhFNvM1RsOPum/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mo85NOFu; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mo85NOFu"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d4c383f2fcso2695340a34.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 17:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774139990; x=1774744790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q67F6wsbJFmv8Xdsauv+9sKsKQWsiG7VuUuAqPJNxsQ=;
        b=mo85NOFu2koCIh8R6GjhxiklarmpC7Ooaqn6Id2SIRXAWP12aQAPo/DJbwRT5UR5jD
         rIIOr7fmURKluZkiLPrRL385BsCHqhElrLeTCxBXEnJo9gjK9iMsFP7lP9uYvpjLIWwR
         dXrNgkMhneoVPBjcUYutjKY1dyUU/cHY5EeIevYhL8T1gK2VcQU44FH3EH/2YjocOf1W
         WmRAzZu/WcNE4X/9zpiCaMk0Gu8J8eDKkx1NUfYusUuKKo3xc6VWdlGCTFv5FmzX9yOh
         hxmNQKUqRLVMOMaIQ405eJUUuviwivU7VYhuFhZPlvW3RJQKswkJXttEnWZV1dXLLcWT
         9Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774139990; x=1774744790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q67F6wsbJFmv8Xdsauv+9sKsKQWsiG7VuUuAqPJNxsQ=;
        b=Lm7kkbVjORSa/Udz3Qlps5foOdJQfLfRrvsa+OYxnp5dEgLSIanb7ZDsglfQcNxU9m
         lYqprV8eya3GmuOWStK2xtb5y3J+zblk9A8AUESnNMS4VL0ey+s0xBWLlR1va46XMQHg
         K28xm7BUtiFqpqeQcJjcKJbweX2IpblONZPj92w5b0XFujmDMxXGGzV3t0QWg953Ar8S
         9AqWEho2g9I6JTyvP1pldOE1/h4iCQyffnm89R9Fywrj2/QcDsNIhgg0G+0YuUFajiRE
         6WMKYQtio9MCN0uAQBfxWtF8dW88yXO5HQtoEOn4atH4YQS1bvavn9JMgcpI87BA1+g4
         4uxg==
X-Forwarded-Encrypted: i=1; AJvYcCVuta5rE6JwVvCUi8BFdTh0r5zC12LWO7l4y3rhDGT6xdFKfHtZ0+eZ1LzrLyNHV3/H1CXAXesyWB3S@vger.kernel.org
X-Gm-Message-State: AOJu0YxoS52iZRmwVwtDczgthamxqTi/STFhxSq30l/71ofeqZ1JlyZ6
	tX3V302SAp03LGRJKQj2zqZhxXfq3kjEoyAouLIwNyyLhSUwARcVeGZpMA48hX2+34A=
X-Gm-Gg: ATEYQzzd/cEyhoarXcTrgEBMwjiDaAaDQulin1cS/DJjjwbw34RMasg2BnvwH52Oyo+
	5xDBM9cFO2J/WghigW0PyMMVPdW9QIjKzCyc6x1KT9XQfbOYmIfHv+aaF+NuycQhqeRsMZuPXge
	m2ML65WGFB/mnzxhUbdD/u7Zb1Etufw8rtCJzr99QvenAotD4YrXKelRkoypVRVV5/XPx343Jgt
	od02v0hHx9uC5MS4fpzUsPPxK2d9p/evjBKItHQl4A13ZCJlqE96XVu7pyU4DJLvBVi7hB5nErk
	8T1ricG29Ac47HrAEBHNCLQ3ie1lApvbZ2f2l/bcmwKezRVX8CwfJORuNNBjNU9grqGEsiK8AHJ
	1abw2q1eAXRp7xk/Imy9b6/vA+xsZdtN2r34+6iuuMId0IdMl5JgObcdjVAqIN8ZHdaTfUmpyTD
	e6TWz0TRmIHtU0juiCKkcvdS4dlCgnVyKyPK8xi8IYLDTI0k+2zJQgm6ns6aHyUiOiA1+0REg=
X-Received: by 2002:a05:6830:7317:b0:7d7:bf70:af2 with SMTP id 46e09a7af769-7d7eae1c92dmr5186748a34.1.1774139989828;
        Sat, 21 Mar 2026 17:39:49 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:fb84:df2:aafb:553d? ([2600:8803:e7e4:500:fb84:df2:aafb:553d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eadfc678sm5832938a34.19.2026.03.21.17.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 17:39:49 -0700 (PDT)
Message-ID: <55e92148-b5de-4fb8-af0b-9476235341bc@baylibre.com>
Date: Sat, 21 Mar 2026 19:39:47 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] iio: proximity: add driver for ST VL53L1X ToF
 sensor
To: Sirat <email@sirat.me>, Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260319190738.151614-1-email@sirat.me>
 <20260319190738.151614-3-email@sirat.me>
 <20260321172151.1f434680@jic23-huawei>
 <CANn+LW+FNy+oCr+XskZoVS=eeCwnYvoKkFyX5fX2fbv8NbALGQ@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CANn+LW+FNy+oCr+XskZoVS=eeCwnYvoKkFyX5fX2fbv8NbALGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/21/26 6:40 PM, Sirat wrote:
> On Sat, Mar 21, 2026 at 11:22 PM Jonathan Cameron <jic23@kernel.org> wrote:
>>
>> On Fri, 20 Mar 2026 01:07:14 +0600
>> Siratul Islam <email@sirat.me> wrote:
>>
>>> Add support for the STMicroelectronics VL53L1X Time-of-Flight
>>> ranging sensor with I2C interface.
>>>
>>> Signed-off-by: Siratul Islam <email@sirat.me>
>> Hi Siratul
>>
>> Just a few minor things seeing as you are going to v7 anyway.
>> If you weren't I'd have applied some or maybe all of these as tweaks
>> whilst picking the driver up.
>>
> No problem at all.
>>
>>> diff --git a/drivers/iio/proximity/vl53l1x-i2c.c b/drivers/iio/proximity/vl53l1x-i2c.c
>>> new file mode 100644
>>> index 000000000000..771598b92e04
>>> --- /dev/null
>>> +++ b/drivers/iio/proximity/vl53l1x-i2c.c
>>> @@ -0,0 +1,820 @@
>>
> ---
>>> +     /*
>>> +      * vdd-supply is required in the DT binding but we
>>> +      * continue if it is missing to support older DTs.
>>
>> Given the driver does nothing different for an auto provided fake regulator
>> and one from DT, I'm not seeing the comment as particularly useful.
>>
>> Drop it.
>>
> Considering there is zero difference between the fake and real regulators
> in terms of functionality of this driver, should we just drop the hard
> requirement in the binding?

No, bindings should not depend on driver implementation.

>>
> 
> Thanks,
> Sirat


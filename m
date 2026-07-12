Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFBD364934
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783873981; cv=none; b=WvaH+NToVHsnPAMcBC2UXKaTJM/E69745EPC0HBtLOs/FHNbAvWjIISTpk/SOMsj0XeGZad+fxf+Sz5A8n2+MCvXFGGhIBySKwfSOjfBRRIBg/kxm4ms4Xdd21T1x7RqBCXvpJOCUEOo9eEK1CchNhA+WG69UY3GOQQLw6Py7zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783873981; c=relaxed/simple;
	bh=+dTi5tf4M1Cu35CMA/uejmB9UH7tBrnqtx64FToKziY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWhGf/omExDMvF2BgwdiszPCa08TgOvDmrl+KIKJDHmczV1OUYaC+e1pEtKZKRlf32jKwk38Uy4ykaP1R86zjc9AKAfCAEuL22utohLWmq0y1bRsu5BRc8ycoPEnuuK5zuy2FvO2hW8yvA9VFCmfZHn0PCuM/WtkMM0JINqbbFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=U07GY39O; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="U07GY39O"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6a31b9a492aso1612450eaf.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783873978; x=1784478778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bhv8nBZOSQkij2eTvBP/0gy+hNIJSzm9ajAyaRKMo/s=;
        b=U07GY39OtTx7LRnWyW5F2yktEjKs605PVditFSCiw1xxtG2YCM95pCUEXU8AiAAjjN
         zpFO1R3NdJAHgjIJTQWzzzpf3HHL0SGm0U+5GTFY2T8L/P8Xcn4aoZQ+UQ2YwjVTL5hI
         +2qxe3dLuajgbjSUf1DcrWwSVSG1tEKpJNOpcJixUEQ/eiGorrCFa22utJpKzaFmjz08
         ckl3JsNJAYnIU6Kzab2R0zEGe7ffbLN7t51S4t4tdcG13xq4dTO3kBQ3zxmnQsk7yFVp
         8YyDx60uJfJVVr1bbFolyvURhKhcyzcxgEncsodGdS8sjFVSSy7Q8Jtli0/BXJdxBDet
         HbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783873978; x=1784478778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bhv8nBZOSQkij2eTvBP/0gy+hNIJSzm9ajAyaRKMo/s=;
        b=T3ezg8jUhMzoHTIg1TuxR0h+t/tv3Fno5lwjL/JEDRaGcO4DZEjWAnHJ6smJP5Zpj2
         thcs4JjQJ2iXLVzfvvknIEfMOzd2pt360pCG4DRRX9qY4JjRIoYYRg1tdvRX7FKrnXA0
         TfSfJXkQCmTble40Fq3P9+MlAszVv+SGaf6Y5ZpT1Re+N2KeEEi5Ozp2dUVZJ8/0r7Th
         Ed+INab2BYEt5OtXfAOWGtrX2FR8t51nk6zzUyW2hihr5rZESJriLeP1WYftIadm0KOJ
         V0t0I+WXrhWNzw05b305Dt2Vu8dt9W07x9GJBvnuHZYRinL5O7ANHqWJU4sSo0SibUT8
         MjsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9627UO3ame81PSgZRbyrH3QhZAEx5bU8ejXpjTwCfmUF0EWnl2P8E2kmlOi4Ko/MmL4a2/nsp0dbJt@vger.kernel.org
X-Gm-Message-State: AOJu0YxH855yHtnhkLZrtk2sMMNqegAZSqdeKlkuwkQg4TyBW4Rc5nw8
	W+OMqHgm9ubuD4tyIHdhcZ4pxO/3YVeqhovRzcmCT7ivuhT1VfBJLJbK6E6U31Q9g0U=
X-Gm-Gg: AfdE7ck1nWlkD/EENX+tNgaD9stNBB07r3lDQn/O0R5k8a97hBNPdDtc12f/2gJF99R
	8iUuJ30upjqfnZNEOtyc/plVMnMpwsMhped72N+OJxlTMYHRWz1rhDVNgCGMn/4DWCuID+QH7SY
	owodajw4c0T/ab5aN832QHiUWQQ3GidaqdwfjY5nMC/nAMbtwkj8ZyaCtixWvDwO7+9d4VMWSY7
	nm2wtOL+E1eWtzoY3n5pvKamBCZckKFsBBV8/sTCTIZs7Gkd0ohkCxXSdC5qq0RdpNQgEk8Qpdq
	S3UJsxdoWkM9N25jvxP6JR2k+hnUSQLJ6RQB/CZUwdmDGO4owLAA7CjzebXENxV73c3oKLltXXJ
	LxOQa6A0ZRiATgJ/4qR8pUfmKEEl5HtOMK1IHWqEOih+29Mhe29J8RsesJKHQC1NAdTwL710Ur6
	S7ooQXptSC3XOmOMugXLa9zGag0qW8B5E+zBdVuQDnJ3Pm9DKL1RxFpeOwc0MBjrM=
X-Received: by 2002:a05:6820:81d3:b0:6a1:18f3:ed40 with SMTP id 006d021491bc7-6a39a6cee93mr3262976eaf.44.1783873978654;
        Sun, 12 Jul 2026 09:32:58 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3af7:75b0:bf02:8cf8? ([2600:8803:e7e4:500:3af7:75b0:bf02:8cf8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm5178034eaf.2.2026.07.12.09.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 09:32:58 -0700 (PDT)
Message-ID: <08e3f5de-3dd7-4578-8036-f3c14a77b537@baylibre.com>
Date: Sun, 12 Jul 2026 11:32:56 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] iio: adc: Add ti-ads1110 support to ti-ads1100
 driver
To: =?UTF-8?Q?Jakub_Szczud=C5=82o?= <jakubszczudlo40@gmail.com>
Cc: linux-iio@vger.kernel.org, andy@kernel.org, antoniu.miclaus@analog.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, duje@dujemihanovic.xyz,
 Jonathan Cameron <jic23@kernel.org>, jishnu.prakash@oss.qualcomm.com,
 jorge.marques@analog.com, joshua.crofts1@gmail.com, krzk+dt@kernel.org,
 linusw@kernel.org, marcelo.schmitt@analog.com,
 Matti Vaittinen <mazziesaccount@gmail.com>, mike.looijmans@topic.nl,
 nuno.sa@analog.com, robh@kernel.org, sakari.ailus@linux.intel.com,
 wens@kernel.org
References: <20260711184414.1013686-1-jakubszczudlo40@gmail.com>
 <20260711184414.1013686-4-jakubszczudlo40@gmail.com>
 <35c47ff5-0a8b-4c99-8e5b-d86c04039e17@baylibre.com>
 <CA+gq5JjrNzZHFhPeSM=AEpevHgStV2T6dEGHTUpnvzAbSeO1FQ@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CA+gq5JjrNzZHFhPeSM=AEpevHgStV2T6dEGHTUpnvzAbSeO1FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/12/26 5:16 AM, Jakub Szczudło wrote:
> sob., 11 lip 2026, 22:01 użytkownik David Lechner
> <dlechner@baylibre.com> napisał:
>>
>> On 7/11/26 1:44 PM, Jakub Szczudlo wrote:
>>> Add ADS1110 support that have faster datarate than ADS1100, it also uses
>>> internal voltage reference of 2.048V for measurement.
>>>
>>
>> ...
>>
>>> +static int ads1100_get_vref_milivolts(struct ads1100_data *data)
>>> +{
>>> +     int voltage_uV;
>>> +
>>> +     if (data->ads_config->has_internal_vref_only)
>>> +             return ADS1110_INTERNAL_REF_mV;
>>> +
>>> +     voltage_uV = regulator_get_voltage(data->reg_vdd);
>>> +     if (voltage_uV < 0)
>>> +             return voltage_uV;
>>> +
>>> +     return voltage_uV / (MICRO / MILLI);
>>> +}
>>> +
>>
>> ...
>>
>> T;
>>> @@ -276,6 +310,7 @@ static int ads1100_read_raw(struct iio_dev *indio_dev,
>>>                           int *val2, long mask)
>>>  {
>>>       int ret;
>>> +     int data_rate_index;
>>>       struct ads1100_data *data = iio_priv(indio_dev);
>>>
>>>       guard(mutex)(&data->lock);
>>> @@ -292,12 +327,12 @@ static int ads1100_read_raw(struct iio_dev *indio_dev,
>>>               return IIO_VAL_INT;
>>>       case IIO_CHAN_INFO_SCALE:
>>>               /* full-scale is the supply voltage in millivolts */
>>> -             *val = ads1100_get_vdd_millivolts(data);
>>> +             *val = ads1100_get_vref_milivolts(data);
>>
>> Obviously, the existing code was getting away without checking for
>> error here. Since the ads1100_get_vref_milivolts() function handles
>> the error case now, seems like we should be checking the return value
>> here as well.
>>
>>>               *val2 = 15 + FIELD_GET(ADS1100_PGA_MASK, data->config);
>>>               return IIO_VAL_FRACTIONAL_LOG2;
>>>       case IIO_CHAN_INFO_SAMP_FREQ:
>>> -             *val = ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK,
>>> -                                                data->config)];
>>> +             data_rate_index = FIELD_GET(ADS1100_DR_MASK, data->config);
>>> +             *val = data->ads_config->available_data_rate_hz[data_rate_index];
>>>               return IIO_VAL_INT;
>>>       default:
>>>               return -EINVAL;
> 
> 
> I'm thinking about next patchset where I will address voltage
> regulator stuff, adding it to struct and taking it voltage just once
> in probe. Can we leave it as it is for now?

Sure. Just mention that again in the cover letter if you
do a v7 to remind us.

> 
> Best regards,
> Jakub Szczudlo


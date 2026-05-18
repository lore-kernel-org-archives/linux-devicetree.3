Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61D262D0B
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115725; cv=none; b=rXCBTSk64JU4R60uQg+oUn6EhcWBWEtXf16YVp1P6kIX2WLjcUfILKyD+8GgtSMN/ti5bhDECmPo224SrL2rprxOjXEoPUV+cKHieUMTvg9botqRJa/0kzfftBsnWgjnSPLofzHfu8cWaVL7Hn38AfkfhClkBF2+F2FBnqY8j84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115725; c=relaxed/simple;
	bh=694/ZdiavJ7DydhU+SVNbEbk/6jkXDD+6gREkL+zvQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGeSSptSpvRGNqerFIeb9WTl74u+ovJaFVMQL9orxjb+yAiteYas/5A723TyEYax6CztIbk4c+6OVH8j6BczuxI5a9DcoMffjE+d363lbLZG6MQMZA9HMTY0QpSv7jwi2iCcR1I4xmTn/p3kuiRAc2rRyC/Q4QE2t97RnacgzPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CU1MVzeQ; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CU1MVzeQ"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dca4debedaso2560683a34.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779115721; x=1779720521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwdgIOicbMMbCteOkWbKsZaB7QekYyPKrlRSTDWJHvY=;
        b=CU1MVzeQBnBqlIN79WLO1HAuRSfweQ92N84yXW4yHo2dQbPZf1D7GnOgBwkEHYdHis
         GVgB+A40oL2sA4qgCZZnqVrfQtzcW6ZaL3UA+PX9AFzV9tNK1GDHbthGi/Xjm7xGuxVq
         W1YnQi+8o60qPLl0SHoGeW8R0heIINNaHUZjnq7vvjM7E4JfRlyYZnvqMaKPy+DoT7Gt
         +td9xZNp81LYNYBopsxE9GhIraVTvKKUqiLb0GVCeXPPDGqAnQw6kqtjFqVUbAVezXiN
         zhwnMn6NrGvbDmh9FIZLKe3duFytCCO8oQELZK/UtdiAmGIc2cZrA8W2vh7EvKHqlzyC
         DD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779115721; x=1779720521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwdgIOicbMMbCteOkWbKsZaB7QekYyPKrlRSTDWJHvY=;
        b=LW6MrHFKVuvtZOyzlGWaPfHAynIisjqYlFdoOcNgCMf8xtKMjX0n09r+Slh6r3UQpp
         NA8N/TTt4U+xYE8SnZcV1O16ftOflDgbsWLU9My3NTnD1wHT3TuPK3+aVhLIRteh24gT
         Iv6yNudMR3QfyOXXIBT8f4OZErcDgmEKS/bSD/qyQlMnTeDFKokN0qYGbGWGIIVb9SxK
         wDJ/XkgC+jy4sfNkPjGYIm6t58Yfx3HjoQC3Cr6ZyckH4QdHoXFQny6Ysim4ruJqW6S2
         Ystknq8WgF2FYtKpyJv73nj39SPRUTwQdiRIRsBDFThd5NEqB1m7U0MsGK8FyZJp72kY
         fjXw==
X-Forwarded-Encrypted: i=1; AFNElJ/nnmyUgKZJDMyHo5ioukXtJWLRzd3cmj4vqYKx8MiAI6Gru3KZbnA/AAONutMUcC4RmV618QPhZiW4@vger.kernel.org
X-Gm-Message-State: AOJu0YzyEZC6WSkhUWdjs2nbyjTmJyiw9AeI/wGGpu39riYZHdEHGNly
	v9GqMar25CeGeCOUlelaRHhWGaC7XJCQ9hMYeiueATm37gLhWVk+17w28WpiR7nY53s=
X-Gm-Gg: Acq92OGV+NHX4nuAMl2zYzMLTIiff41LCfGERY7ZAbv6IxRQvpssf0Crnm2XyEwNmlB
	pnbmp9KKsjHw4aVfGNg7Xufxe+xZii0KMH6R/p2272q5Zebzai33emNFi9Y/mFSicuBILw0rJGm
	t7hHggXwnI4KVvHXjzNPNY+DybYyr72h9Wk575fpmSg2Y22w5gUzX63QrVBpvGHrCX46sXvSM/8
	CaIVqS79tkvuvBBKONJVqQrMWLmv8JVriRbTLKLWuQmPDBHmOTHOyu1b5XnuTy9T6Sd6dE8jzfR
	GfbDAR8QSlA2rnyH0qVD6dbTE2wPqJ+CVOGvjYITq3ElRJL5OadSu32K0nM+7Cu0H9Fy/iwMAJc
	tf7oa6zuqQhobY6O+OSAQZbYXQIWTakfRWyqpLZ9Lrqhn+ahl1ilN0X4TThyExIB0dVjRwISUa2
	OcouVDdsjtvwLQnYywT1JIXL9EmyIXx+6eIpi/XxkiaoRkDMbbpjDU+65xOt2diGN1d13D5sz3q
	g==
X-Received: by 2002:a05:6830:668e:b0:7d7:f146:8738 with SMTP id 46e09a7af769-7e4f2b80067mr11001106a34.12.1779115721373;
        Mon, 18 May 2026 07:48:41 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3be6:1187:fed4:378b? ([2600:8803:e7e4:500:3be6:1187:fed4:378b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b819156sm7945993a34.7.2026.05.18.07.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:48:40 -0700 (PDT)
Message-ID: <2a0c777d-05ef-4721-b8ed-88297630ea94@baylibre.com>
Date: Mon, 18 May 2026 09:48:39 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] iio: light: veml6030: fix channel type when
 pushing events
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com>
 <20260513-veml6031x00-v2-2-4703ca661a1d@gmail.com>
 <9bb6db05-43c7-4bdf-88b0-b92525ad5cc9@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <9bb6db05-43c7-4bdf-88b0-b92525ad5cc9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/18/26 8:12 AM, Matti Vaittinen wrote:
> On 13/05/2026 07:49, Javier Carrasco wrote:
>> The events are registered for IIO_LIGHT and not for IIO_INTENSITY.
>> Use the correct channel type.
>> This bug was introduced in the first version of the driver.
>>
>> When at it, fix minor checkpatch code style warning (alignment).
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>   drivers/iio/light/veml6030.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
>> index 745cf3ad7092..855f052b60c2 100644
>> --- a/drivers/iio/light/veml6030.c
>> +++ b/drivers/iio/light/veml6030.c
>> @@ -871,9 +871,11 @@ static irqreturn_t veml6030_event_handler(int irq, void *private)
>>       else
>>           evtdir = IIO_EV_DIR_FALLING;
>>   -    iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_INTENSITY,
>> -                    0, IIO_EV_TYPE_THRESH, evtdir),
>> -                    iio_get_time_ns(indio_dev));
>> +    iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_LIGHT,
>> +                               0,
>> +                               IIO_EV_TYPE_THRESH,
>> +                               evtdir),
>> +            iio_get_time_ns(indio_dev));
>>         return IRQ_HANDLED;
>>   }
>>
> 
> Is this change reflected to the user-space? If so, is it safe? We shouldn't break the ABI, right?

On things like this, we will sometime risk breaking userspace in hopes
that no one was actually depending on it. If no one notices that we
broke it, did we really break it?

> 
> 
> Yours,
>     -- Matti
> 
> ---
> Matti Vaittinen
> Linux kernel developer at ROHM Semiconductors
> Oulu Finland
> 
> ~~ When things go utterly wrong vim users can always type :help! ~~


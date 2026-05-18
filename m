Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B471D30DEAC
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116713; cv=none; b=SpQLUF3eP0w/CT+EXfR8Q07rLM2S3qXs/tnytRflNFG+rs87qz/7kW1bm9bpEgnlHDGyrwUhwjDDqV9TJ2wK69U/PolGACJk4iqEoNT/hzZPaZq06Rg3uVzYT8ViKt3GnHnVVXNWNpcelm+gu1DJ2voEbRV+M8xSdmayL2apYBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116713; c=relaxed/simple;
	bh=DrQFqVK7ClQwUsYNDfngLJu8LH50pdn60WsQM9mVJjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vl2AbEbli0+MVU0ht+H/8lGu1tSWyyk4PrZGdEyHfb2ESpFY5e+WRXGHlLNvKWdhVZkdSEaNfE7hf42dxK6smDf3drclUzGMj6EMJMQN0MZ75qbGdjo16QhSn4cvpdVeose5Pl0MZkUX0YKinXHQvuCEtd0q/KpvNJ4E4b8sI3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ouBieWJQ; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ouBieWJQ"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dbec19732eso2958638a34.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779116710; x=1779721510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzeCgn9mFtApC0ztEgdeNOw9BPgUS/EnSmz8TCLSDFQ=;
        b=ouBieWJQc8AfqoM6SDbP7Z7RbowQ+30DVzGfm+fCD/1vjyHR2XCXclmO1Up7IOwg1M
         C39r04RYn3mCgJDMLdaYEP3jX1k/CFmuziAC9axzSe1nBvFbEpQ9fR95XaDGPcw1Kxj4
         2lDT5azjgghFAh+Uv2jGGhU4a6nuXk/hRAV8I8YxhmBlLmEBSQ4TcACaw9W7AT9XXoR1
         9QBWJOZrY4y+9Q6+/wd0japV8X9YzEd7xdDpt4KetP50EIyN3AI0lXhmot5kqkQ/Y+i/
         7ZF5qQBc57gf3TydypXhnf02OI6Xd8ti4biQJAqTMSblKLMGx6LXthYXt9j21lTzAk/O
         OJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116711; x=1779721511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzeCgn9mFtApC0ztEgdeNOw9BPgUS/EnSmz8TCLSDFQ=;
        b=Uib3gVrZP+FhONFKsbPN+l3XjZRWNlKUcdfQIaPpI0gxMGgxtxsT8nrjOsSVDk6ODX
         aAkpwvwNiqEPfP2zjGqxW33DiQaKpaPhsQkF7uHS7cxv5OkXyJvZIcIqeolSWoPH1ayf
         KWUPTaFLNn6CINQeKRpmSvFqgvCfOEjOX08+GuKrLPqcJzkWVt6FYork9ouRpGuZeF8Z
         ZG+xtl9KQFDMya3oUawBke7/pYWkeAefL+k1p7pnlLCqNUll0AV1r/h6JaMtVVNYTMVv
         FYuIZ407v2D9hdA3K3NfXPCNHwGSr8a9yI2q14pvgTSwsTPv426wqmEcIFpuXlY8xml0
         Mntg==
X-Forwarded-Encrypted: i=1; AFNElJ+7X+bR5Iovcv1JvwKfjhoc35LSD9W3xGbMKyeIWII6g59EYffPo2brGmzPDBJ7MiCrSplIUpgqSHzW@vger.kernel.org
X-Gm-Message-State: AOJu0YwKSAWX5XKGsod9dEa9OYFCRO+w9BsIltk/uTpSkiVMB4MFLpp7
	swZSq5PWxVVssWEUCPETYjSuQmk8fOSSPQeNLQIwolUjGN56N1Gmir6Trzfv2jwQWJ8=
X-Gm-Gg: Acq92OHFS7z3qYyzxIDfvFww3hcsZy+7FKBlH0C9GYD28ymr/iyiE2+ITLEaHDFpgFs
	ufksA1aajQqlhOYKUMiZWJ8jVzxhGIskU2UYzshr2SnIe9YggMRT4PliD4IICelVreWVHcaiVsl
	j6ux7hDb2QGdGur6SQm6knLblhIP8qqWpKnCjGo8+YXy5AtUheWCwpnDv+/03FxBx8cXaKIg+MB
	TSplaxjfY5+2DgMe477hZc5ASnI8nS/mq3FyAnampvJPXYY0hsZcS4SViJ0EnvUZRDvajnvT2d0
	K+wJrWYEzkBwc9vKxQJnDygRqYq4DYsN2BJtb2s5+bWt3ESEPrgfdl59+M6SAru7+ULs9yYpCSD
	1O5ycHbQpjDHph9CeznDWRoyZCzlWVVaXtWhgMJ8y/hCDFkkHo0tHgacCyDWs0twaLtZ/xwKekw
	WvrlgADYfK2JddCI/eHOWyZK5h8BYv9q3pVO8QDLtDhI+NPKkxyvO1lFnF+ngnVFrepuByV2cRn
	A==
X-Received: by 2002:a05:6830:3903:b0:7d7:ef0a:1ce5 with SMTP id 46e09a7af769-7e4ea07e9demr10482946a34.9.1779116710621;
        Mon, 18 May 2026 08:05:10 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3be6:1187:fed4:378b? ([2600:8803:e7e4:500:3be6:1187:fed4:378b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b81c8a0sm7696080a34.10.2026.05.18.08.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 08:05:10 -0700 (PDT)
Message-ID: <7d338351-5f1f-4eb8-a266-b8756d0e60f5@baylibre.com>
Date: Mon, 18 May 2026 10:05:09 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] iio: adc: ad4691: add initial driver for AD4691
 family
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260515-ad4692-multichannel-sar-adc-driver-v11-0-eab27d852ac2@analog.com>
 <20260515-ad4692-multichannel-sar-adc-driver-v11-2-eab27d852ac2@analog.com>
 <0696b662-f478-4d1a-95e0-0338bbdb719e@baylibre.com>
 <LV9PR03MB841445D5BD1087FB3204EBD9F7032@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <LV9PR03MB841445D5BD1087FB3204EBD9F7032@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/26 9:59 AM, Sabau, Radu bogdan wrote:
>> -----Original Message-----
>> From: David Lechner <dlechner@baylibre.com>
>> Sent: Saturday, May 16, 2026 8:11 PM
> 
> ...
> 
>>> +static int ad4691_reg_read(void *context, unsigned int reg, unsigned int
>> *val)
>>> +{
>>> +	struct spi_device *spi = context;
>>> +	u8 tx[2], rx[4];
>>> +	int ret;
>>> +
>>> +	/* Set bit 15 to mark the operation as READ. */
>>
>> Can't we just set read_flag_mask in the regmap config?
>>
> 
> As far as I can tell read_flag_mask is applied by the standard SPI regmap bus
> backend, which constructs and sends the address byte itself before reading
> the response. When using devm_regmap_init() with custom reg_read/reg_write
> callbacks, the regmap core calls those callbacks directly with the raw register
> address - it never touches read_flag_mask.
> 
>>> +	put_unaligned_be16(0x8000 | reg, tx);
>>> +
>>> +	switch (reg) {
>>> +	case 0 ... AD4691_OSC_FREQ_REG:
>>> +	case AD4691_SPARE_CONTROL ... AD4691_ACC_MASK_REG - 1:
> 
> ...
> 
>>> +static int ad4691_write_raw(struct iio_dev *indio_dev,
>>> +			    struct iio_chan_spec const *chan,
>>> +			    int val, int val2, long mask)
>>> +{
>>> +	switch (mask) {
>>> +	case IIO_CHAN_INFO_SAMP_FREQ:
>>
>> Should we aquire direct mode so that we can't change the rate during
>> buffered read?
>>
> 
> It is in set_sampling_freq already. Do you think it would make more sense
> to move it here in order to help readability?
> 

IIRC, I think it was resolved in a later patch in the series. So
could just be a problem of it not getting added in the right patch.

In general though, yes it would make it easier review if the
direct mode claim was made here.

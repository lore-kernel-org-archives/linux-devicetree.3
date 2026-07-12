Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2B73624C3
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783873839; cv=none; b=sTprV9tsCssdqXm+8IxJHcFCWbk014Mr8TfeH/sgVszPMMHGH4CibHC3a2DH9gLgr9OGGOBSOhELsCEOhYXq7yKfjKenzeNJf1pf30YLpEL8rki9riJN30tj+cB5Afgtq+LyKG7V+sLo1xd0zCqwlmpOVBZLxYIvJD2NfuDzHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783873839; c=relaxed/simple;
	bh=19uKDmkw4YGdHcf2I8C7kHZXoTPiCf831Ui6RmZ3XS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljf60xUuhjT7TuFc79gJ6spkutG6H5wYUTAENRNVdTmCmLVZtcb2b/48to7bBwgFF0guIDEda813DDzk2IxDuX+W+67pQmxjc3aXtu0sQJGp1tmPltdauEpku4ow4Duim3w2/eCmsHRYPA3DpQ08A1EVaK83gb9kphdtrq6ANJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TZYPmkbU; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TZYPmkbU"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9ed64d490so947508a34.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783873836; x=1784478636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5PY6MHPXgN1sMkki5f6TEVs8WC88f6zKUB5nh4DP3Y=;
        b=TZYPmkbUT+sIwiRP8HpTQdeZIJ3jilzE0UBnOCLrY5ZLanWjxzcYMX49GwJbQ6NFUP
         +2p/9ANRiBtslPsda2sxo3BD2jH7GuOPlXZ3Mpubi83110wcxxyULMlA9ypmPUAzUskd
         D1OT8Docc/dyZKOWG9oOIT65lpqTKdI3jyACGFvkghHAg75VJNLd5H7XVTJ459mubORU
         Fuwym3XBvGULn2yNiXr75jtZGoixQ/wawPsHrDQ/hX5OnWmI8i1Fy+uR/C92SjE9oQWz
         b+PV9wSij0F09ud8V4Qsk+Ayt2/v9mIBAi8gkJ8KmiPOabSIH/iZjNQvAsnnndkvx0zI
         wkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783873836; x=1784478636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5PY6MHPXgN1sMkki5f6TEVs8WC88f6zKUB5nh4DP3Y=;
        b=MTY9aEGEzuJ9pY9Rsndqd67hg6WRlt5aAF26znqMt+6WW7/EI+Q8ZElBFp5a3VBavD
         ihhLnZCJuKhZlyORiLKhLcWb4mSR42xfW+b2NamTC4vGVLdVb965WbaeP2e9xz8JM8Dr
         0LJy3RtaGnhbx0gderM+togxcCtmGAMWjXYu1ogFwX9Ho+eddINGor5N2Dpk10RISM/o
         /40EO6PumVz3eZJmhAf0aRs9bs5T+FPyTRpckBhZeALK0CboZL9JhIMt7uyi4EWO52AQ
         CBtLFTLOH4Ve1w0z7NkGppflxknhgpQUVhlrfJnLXUgNCVZ86anYCMy541T25aLR+iXt
         avtw==
X-Forwarded-Encrypted: i=1; AFNElJ9Zw7SSWMzsOeN2pgD3pbdmr6zuR7+fR6MGzozlMmbP6MUi4zgNTVU/MoAgosmC7lxgcMbFPiO+9T+4@vger.kernel.org
X-Gm-Message-State: AOJu0YxRi+7+uJdc6sIQM6LY/KNmCgStbMhm621EzH2hqXdrjPLZKOjm
	SNA7ia1Ll419qCdjy81UVsYm9gpXgzQtYxUdRW2rSNlLK98EXSd5K+q+h//1HIFbGDQ=
X-Gm-Gg: AfdE7cl/4gi2OrnnGgodIv603mqkCjsuBI5HTG6/s4ujcbaxp+KL/hyR66SD1oCbEPE
	Iii1pkbR8CD548ROQlzKphGY4sdPtHBlnR7BggY9iavkJbQXlkEUBUw7E4J5oXbkOyyW7//+feX
	su7IuFjw1OA5W9K/BOKCBWOjzCiOfbAqGl+esHGXOOYfKMPXOXvz2PxmX8OBWVfevYjeddcjuRs
	fIxFYxMrJgcqMoWUrrst1snwIop6122eQIKx60nlc5ZkS4sK9OIr1/HTMfih11c4Oc2YB229WfA
	g9jQeLHA/6fjYn985KAMrKI0DJ5sReYjjf/AQemUw23emmpcQGiWuAU8+2JcGBT6rLzMmKUiLR1
	A+u9cxRPRY2xlqvCIuRFqAU8fHal7taPd5tQPVL9OOP5NXuHMiCTVXHP6t6g04Ru1Ae5f3wemPg
	6U510i/lskE9hyiRwAdJkLV8mpmRKvjfGizk/YGuuZG5X6uiDY9P+cTOlYcgMra6E=
X-Received: by 2002:a05:6830:2b12:b0:7e9:ec31:bd5a with SMTP id 46e09a7af769-7ec09857d5cmr4086727a34.28.1783873835727;
        Sun, 12 Jul 2026 09:30:35 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3af7:75b0:bf02:8cf8? ([2600:8803:e7e4:500:3af7:75b0:bf02:8cf8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb262f50sm10964840a34.15.2026.07.12.09.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 09:30:35 -0700 (PDT)
Message-ID: <566ead65-4da1-492d-b556-25526cc63647@baylibre.com>
Date: Sun, 12 Jul 2026 11:30:34 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] iio: adc: add ti-ads112c14 driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>,
 Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
 <20260710-iio-adc-ti-ads122c14-v3-6-746d52cbf1d0@baylibre.com>
 <alNhom1_o1hZgEnz@ashevche-desk.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <alNhom1_o1hZgEnz@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/12/26 4:42 AM, Andy Shevchenko wrote:
> On Fri, Jul 10, 2026 at 05:50:39PM -0500, David Lechner (TI) wrote:
>> Add a new driver for the TI ADS112C14/ADS122C14 ADC chips.
>>
>> This first step is adding a very basic driver that only supports power
>> on/reset and reading the system monitor channels.
>>
>> ADS112C14_SYS_MON_CHANNEL_SHORT is the last channel rather than being in
>> logical order by address to keep the voltage channels together and in
>> case we find we need to add variants of this channel with different
>> voltage reference later.
> 
> ...
> 
>> +static int ads112c14_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	const struct ads112c14_chip_info *info;
>> +	struct iio_dev *indio_dev;
>> +	struct ads112c14_data *data;
>> +	u32 reg_val;
>> +	int ret;
>> +
>> +	info = i2c_get_match_data(client);
>> +	if (!info)
>> +		return dev_err_probe(dev, -EINVAL, "missing match data\n");
> 
> I think -ENODEV suits better here.

Sure. I went with EINVAL because I thought it was more common, but we
have about the same number of both ENODEV and EINVAL at this point.

I also saw one ENOSYS, which we really should not be using. And one
ENODATA which actually makes sense too.

> 
>> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
>> +	if (!indio_dev)
>> +		return -ENOMEM;
>> +
>> +	data = iio_priv(indio_dev);
>> +	data->chip_info = info;
>> +
>> +	ret = devm_regulator_get_enable(dev, "dvdd");
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get dvdd regulator\n");
>> +
>> +	ret = devm_regulator_get_enable(dev, "avdd");
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get avdd regulator\n");
>> +
>> +	data->regmap = devm_regmap_init_i2c(client, &ads112c14_regmap_config);
>> +	if (IS_ERR(data->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(data->regmap),
>> +				     "failed to init regmap\n");
> 
> Do we have a guarantee that device is powered on here?

I guess you mean did I miss a 10 ms power up delay?


Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49053BE17E
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287090; cv=none; b=oHo+anFvSL/+ulslGWdHVfMhNePHIZLrs4j3FzIv6TeZJlU/HBq6EYQH0Kbp/WJlSX7nPUVa8xa8My35BpM+hMWXOBj5od4oDRnZ21BNqP9/dvbf6Hy95xeiodkzv5aZ4LTLJpe5Dxx0HAsGnMhtYi1TjLmSRYsNArVxyxAxk/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287090; c=relaxed/simple;
	bh=wmkZFvkKj0Cb7oXf/na4MzUt3wLDgMZFlXMmUmW46n8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ddNxqfh8uUbI0kGXTVlnHmzDunthCupUkqhw7dBSRZV1iDmg2/3xy/4KhY2NRRA79CJzbz6Znbw4Kn0Eg4KHxSeHCbR2uah/9kbFfrDfOZJzye+N9Uo7NKP5m7xg63yDgM51iAfBPHzsWA+q2KMPBrbfLe44Ym5nRBcDIAWfD4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcpBpZf/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcpBpZf/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso25061555e9.2
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791287087; x=1791891887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nIH9oNewGm+iiK+DqVLwv9vwseXKMTyaRTgq2ccesyI=;
        b=pcpBpZf/3lMRRRlr2JD5m+ozqtjCowNvaWXgytkfdY5AR7DPo/8lS7HktyDefe3kCp
         hpBRSa7x4jDPDcO7kO6SNSZ8GjTeUGo7GhFyCJxfTEYzCs77pBU3POfmiQ1UqAU/+ZCJ
         1NnkPXp5+QkZd25aFL6wJKhzoytsSdpL71j3XzSXBueG2/YPECYuMWpNCyRxH05YQo/J
         nOGb7AUeD+oOOfbMx7uJCnK5JTOIuzpcmpWDZOiEOJCjfj9N7740nQNm6HNHrEIhG9qk
         QlL8Kz4fCZM2U8HGjU5ZEcDtgq/L3/R1OGg5o2S+YtFuhuQDKWFtw81mdDPjLqrAhIoP
         F/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287087; x=1791891887;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIH9oNewGm+iiK+DqVLwv9vwseXKMTyaRTgq2ccesyI=;
        b=BgIurKN1oqu8r1EdNDdi+/4t2tAz6/r7ipf8OoroiiMZSjDNOMYcExglKTXydAL1AC
         vI0hHFn1a6zguQ1JTVdldAj80aiientDKnMSUiVR3wn/5xAQ9gNVjXZXFiF/Ew92zsRf
         PARn5VcdpzeKspFlsNWE/z46y2k+M+YtW9iepDf/AFXp/QeVVh917gpYrGmg8Jw1X57g
         3AF3ncPE4LUqTM90zQ6pcN4FzCmp284TEwpk+gKX7CwvCk8SoKik4ooYkGjIqFrVwqoT
         k/XMi9W9BdP3YOloCBVtDC7qKuHD6L872qYjeOSSCJOpEjZDq1kmgG6dwt/67zPIY2EL
         izew==
X-Forwarded-Encrypted: i=1; AKwUvBymv3DkEQD1GZAwAIG8qi+0v2Cj7uGWpSjkzJUiNhUzZKnyYXcfdQ3JRRtO6FRVSeAyQ3/ZnD/UHgvG@vger.kernel.org
X-Gm-Message-State: AFuF++k60jptTtTT4kerDnLj8zSyqhwUiLJe3R8jixE2pco9lvNT0JA6
	gaZ9ZXcJdALtmWFBsWUNH6ZDCdiG6ogPHOUjmy5kfulGUam5GXvJVZjS
X-Gm-Gg: AYBFou1lnESjgrCDuYAuYxqA3/4OIGvHOjVM8mA79sfFNsVbsAWTDI9T6/Ir9IRNxmW
	WCddeG6Ivgu2Kecw6z6RlZVxynrQch8t9ekBzpGKrcpznsCyutAmLC4AmhIh1I60CNNRid0RTCs
	Aow3KGVyxlRXfl7Ut9iBsg4O9tWCgTNNTJVs9XlsRSA0RH062pZPHVpvnGmD2n1qlmzW1Gg/Cmc
	Y3LN9Zb7/2k2zXnRCXFGbTJjhNmSO9v4d9ecRhgTorPYPpbgDP58SpOCqq95E9TUEqOzL5BzeJ2
	GZ79Dmw7TevW75jNxP+Yfow20/eLohtKKW4FoWeoOYRQD5x+VwganrYt/rtfYMP/hNc2XxkO1s1
	UhpbmeobIiuK1dRoD/KTyianHARV8xCZA7se+JyDHLEwu31lWsMNmany0Jwo4E9563G8/B17zbv
	AjTvBGHX9w6+ebwsSSBsgLbewN5xZ7jhzVmFbB5VxfOPHab4YbrnXDm+Cm26jhhmCsskW/elYAq
	dERv8Dun1RzaBc/H2vVc50b1vD9O+H5oaOA6TiITd2tgt3GO9zEjuYFc3AE9/TXRljZuh8C0piH
	8TPWUWpv+DsWhdSh3QcJubym/nREJyzfElo8nn/YFcY6xoCaqIEb1WP/hF52zojBNYrcfi5d0gL
	SUEo+gPwxkH4NsaFKLqrFT6MZzmXwWXqHHnA8L64cMO87DCfJVOqopUfhUBJfpFR4v9FRpBslDe
	Oy1Sya
X-Received: by 2002:a05:600c:1c16:b0:4a1:7832:dfd6 with SMTP id 5b1f17b1804b1-4a17b5340c8mr22006265e9.5.1791287086922;
        Tue, 06 Oct 2026 04:44:46 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17c7b7f00sm19805495e9.13.2026.10.06.04.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:44:46 -0700 (PDT)
Date: Tue, 6 Oct 2026 13:44:43 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Liu Yufei <lyf98405@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: proximity: Add driver for Vishay VCNL36829
Message-ID: <20261006134443.00000bc9@gmail.com>
In-Reply-To: <20261006100943.78971-3-lyf98405@gmail.com>
References: <20261006100943.78971-1-lyf98405@gmail.com>
	<20261006100943.78971-3-lyf98405@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  6 Oct 2026 18:09:43 +0800
Liu Yufei <lyf98405@gmail.com> wrote:

> From: Liu Yufei <lyf98405@gmail.com>
> 
> Add an IIO driver for the Vishay VCNL36829 proximity sensor with
> integrated VCSEL, connected over I2C.
> 
> At probe the driver enables the vdd and vddio supplies, waits for the
> sensor to power up, checks the device ID, configures the VCSEL current
> and photodiodes, and turns the proximity engine on. The sensor is put
> back into shutdown when the device is removed.
> 
> The following attributes are exposed:
>   - in_proximity0_raw
>   - in_proximity_integration_time
>   - in_proximity_integration_time_available
> 
> Datasheet: https://www.vishay.com/docs/80580/vcnl36829um.pdf
> Assisted-by: LLM
> Signed-off-by: Liu Yufei <lyf98405@gmail.com>
> ---

...

> +static int vcnl36829_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct vcnl36829_data *data;
> +	struct iio_dev *indio_dev;
> +	struct regmap *regmap;
> +	unsigned int reg;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	regmap = devm_regmap_init_i2c(client, &vcnl36829_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Regmap setup failed\n");
> +
> +	data = iio_priv(indio_dev);
> +	data->regmap = regmap;
> +
> +	indio_dev->name = "vcnl36829";
> +	indio_dev->info = &vcnl36829_info;
> +	indio_dev->channels = vcnl36829_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(vcnl36829_channels);
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +
> +	ret = devm_regulator_get_enable(dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable vdd\n");
> +
> +	ret = devm_regulator_get_enable(dev, "vddio");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable vddio\n");
> +
> +	/*
> +	 * The datasheet does not specify a power-up settling time.
> +	 * Wait 3 ms after enabling the supplies before accessing the
> +	 * device, as a conservative value.
> +	 */
> +	fsleep(3 * USEC_PER_MSEC);
> +
> +	ret = regmap_read(regmap, VCNL36829_DEV_ID, &reg);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read device ID\n");
> +	if ((reg & 0xFF) != VCNL36829_DEV_ID_VAL)
> +		dev_warn(dev, "Unknown device ID 0x%x\n", reg & 0xFF);

I'd rather be soft and do dev_info() instead (perhaps this could
be tweaked when applying).

Otherwise this looks good to me!

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts

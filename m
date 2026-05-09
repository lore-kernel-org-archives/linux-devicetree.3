Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD463D3486
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 22:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778364577; cv=none; b=bCch1MLdgF6C2JpI8lvwB1oADQPp1VoxidAdxKMu0FyNOOS0K4dT8opmbCyicuUFuNUBvM8JomYuyEdZOOwcYZirrZE2aTonQHb8w94byg0tWW3yFZTrjXwokpremCbvuHe6On/Uaz6jdoCdaiqAgf2jEuEShOJeNcsiRauxIGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778364577; c=relaxed/simple;
	bh=JedlJAO/gCtX+su94cyVXtlfso3LQ0zG/xSpqvtJrWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kk0f7ashYL+0iii64u8d3vmfFHAeFnsL/qid0LX7L1CvYqkE5hga3U9ML7ew6+G1rL9a/pUXqZgMw3t7SKgdoz0X1aXWpOpgbuMAl5mVMJQm+D/t1VzWwGLb6wJ0+BZs52zsFjjxT3Fi59zVuKOs7gUWirlToVukHA/Vz3Q8oSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=m9YcBse4; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="m9YcBse4"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7de4ed0593fso1566472a34.1
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 15:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778364575; x=1778969375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4aEsjljERTy3uozCvX5g1bGnU0wUSQbgIzjH956EnY=;
        b=m9YcBse4Ze7O8Edi1tI5pBr19k00UP7Se2IBCSArrRZkoEdcfMsX43SHHbsbtrvTbO
         8NfgF6IH+L8flanyxS4PDFQxeeMxhDHXtdT/Hi53uBwck6JUeoh+WogRvXdZxkX2Y1Y2
         8PghPC/ukBAS51fyKTM+/SN+1NZnwkHg24wdW5lVMpfWjQkPCI51W99RMnWWehFVzfQS
         iP4vTbFqXckxJp1Kqz9TofPA8lXTXbg87BJ0CzIa3kcStd+ydU4UHZ2y0w8+QKjI4b09
         SfmnTjlgaDXLB89EMl0J2+k5M7qjAoP1mVg/YQoLJ99Z4kR9tgv7FyZTs83jj60xrQbL
         hSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778364575; x=1778969375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4aEsjljERTy3uozCvX5g1bGnU0wUSQbgIzjH956EnY=;
        b=h8if5Te86iXTWRRi4K6ef5eWY+HjdNIeiahb4ieNVPxLqAKJwewaBR5iqJcI2FeseX
         sS2nqsJg2ERJKQVZ11/rIZ+Sxm2pY1P74Oq6V3+aT9u7UoXqZ0xM+esI/6N54nRkQFfW
         qfpWL+r0RjgVJnQ9p6KEO3S+QVvPRH373IM0KvGmc1Fi/eedlh3CDbYgm7gjg4gq6Pnv
         KUSxdokNjSJCnJql1nADu4m0ZLTGZ9g2GvRcz/NHnT0O8Dst1kuFmD1SkmAKo4bMDXuH
         +5Q175CpwUG1FbkU00BwHIYfqAEN/m32ur6BKts7pveoNs+OSvfVXAouZz/ab0Po3ziL
         kaaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NMdAlF9f0f/uIOtgVg/cINZjpmMcr2E9RM5Bjs4OMglN8klI+RDSy5DZlrEBE6WAKT5aE9yjhYlF1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/F7qj1c4zLKs51tThaDrMGhheVcmAN3GY/zIWIuQWXHJOtdph
	vChtN3BnBVRd6OCsBQGNzGB20yM/BGkjiyt5AQomrxTEy3sLmTAiRut7GiDr84DoiNEILCRz6c9
	D9q9Y
X-Gm-Gg: Acq92OGvSGyPVR+LgqF7fhskblL7zBWiK1naehYXFYlQzQ65HLGKCfClLpXmf+A/pGh
	rb4nI+8hMwPAJpw/snaT4xSxqGmHIPjxmCepRYNqV8z/sVeKI0GWzD6T7Ka5vqL6XsZKJ+EpYT/
	pmsCfw821FKo/Um/QXoYcJU490vHo3HTe9nyOH5wLxk5dSGpiiOt8z9sF+Ubo/nAuOo2hxaK50t
	HRnGTTP152r9/84OW3ms1n13RyhkSal69Q7R9lxBCy7oltP9k2mH2I0m1VYwyhDm9t9p7Mf4v1E
	T5afVXdLsXbs4FLRtcz/Ve0JIAndZYBc3xPJp5GqSrfXmPaGw8aifkSWHp6c3ryUDPwxJx4CxSZ
	2mXXO6haerCAQBWy4PqCIN4A1gs1JKUjyOJxklF2ZqQHPaeiN98Dishxsrd3fj/EkDckJypGFB7
	IXSbnsRGxVGKKYudZ1Lv3QIgbONR8j2W8A0NE0FPECPofFXSfY4kjO7c5Mhf4YpqzP6Y4qfy2Qr
	bTUeDZC5A==
X-Received: by 2002:a05:6830:6d26:b0:7d7:5b78:ef31 with SMTP id 46e09a7af769-7e1deea5b7emr11927648a34.12.1778364575357;
        Sat, 09 May 2026 15:09:35 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:12a0:9178:ab4:39cc? ([2600:8803:e7e4:500:12a0:9178:ab4:39cc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367d8fd96sm3817633a34.19.2026.05.09.15.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 15:09:34 -0700 (PDT)
Message-ID: <880e0d0c-da84-484e-869b-ff77454874e1@baylibre.com>
Date: Sat, 9 May 2026 17:09:33 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: magnetometer: add driver for MEMSIC MMC5983MA
To: Vladislav Kulikov <vlad.kulikov.c@gmail.com>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260507205033.951990-1-vlad.kulikov.c@gmail.com>
 <20260507205033.951990-3-vlad.kulikov.c@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260507205033.951990-3-vlad.kulikov.c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/26 3:50 PM, Vladislav Kulikov wrote:
> Add support for the MEMSIC MMC5983MA 3-axis magnetometer. The driver
> provides raw magnetic field readings via IIO sysfs with SET/RESET
> offset cancellation for each measurement.
> 
> Signed-off-by: Vladislav Kulikov <vlad.kulikov.c@gmail.com>
> ---

I gave my RB tag already, but if we do another revision, a couple of
suggestions.

> +static int mmc5983_take_measurement(struct mmc5983_data *data, int m[3])
> +{
> +	unsigned int status;
> +	u8 buf[7];
> +	int ret;
> +
> +	ret = regmap_write(data->regmap, MMC5983_REG_CTRL0,
> +			   MMC5983_CTRL0_TM_M_BIT);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Datasheet page 15: measurement time is 8 ms at BW=00 (default,
> +	 * slowest setting). Use a 50 ms timeout for margin.
> +	 */
> +	ret = regmap_read_poll_timeout(data->regmap, MMC5983_REG_STATUS,
> +				       status,
> +				       status & MMC5983_STATUS_MEAS_M_DONE_BIT,
> +				       10000, 50000);

I wouldn't mind seeing 10 * KILO, 50 * KILO here to make it easier to read.

> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_read(data->regmap, MMC5983_REG_XOUT0, buf,
> +			       sizeof(buf));
> +	if (ret)
> +		return ret;
> +
> +	m[0] = (buf[0] << 10) | (buf[1] << 2) | ((buf[6] >> 6) & 0x3);
> +	m[1] = (buf[2] << 10) | (buf[3] << 2) | ((buf[6] >> 4) & 0x3);
> +	m[2] = (buf[4] << 10) | (buf[5] << 2) | ((buf[6] >> 2) & 0x3);
> +
> +	return 0;
> +}
> +
> +static int mmc5983_read_raw(struct iio_dev *indio_dev,
> +			     const struct iio_chan_spec *chan, int *val,
> +			     int *val2, long mask)
> +{
> +	struct mmc5983_data *data = iio_priv(indio_dev);
> +	int m1[3], m2[3];
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		guard(mutex)(&data->mutex);
> +
> +		ret = regmap_write(data->regmap, MMC5983_REG_CTRL0,
> +				   MMC5983_CTRL0_SET_BIT);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Datasheet page 15: SET/RESET coil pulse is 500 ns.
> +		 * Vendor sample code waits 500 us before the next operation.
> +		 */
> +		fsleep(500);
> +
> +		ret = mmc5983_take_measurement(data, m1);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(data->regmap, MMC5983_REG_CTRL0,
> +				   MMC5983_CTRL0_RESET_BIT);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Datasheet page 15: SET/RESET coil pulse is 500 ns.
> +		 * Vendor sample code waits 500 us before the next operation.
> +		 */
> +		fsleep(500);

It looks like this SET/RESET sequence is also repeated during init. Maybe
refactor that out into a separate function.

> +
> +		ret = mmc5983_take_measurement(data, m2);
> +		if (ret)
> +			return ret;
> +
> +		*val = (m1[chan->address] - m2[chan->address]) / 2;
> +		return IIO_VAL_INT;
> +	}
> +	case IIO_CHAN_INFO_SCALE:
> +		*val = 0;
> +		*val2 = 61035;
> +		return IIO_VAL_INT_PLUS_NANO;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +

Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B8F33A6F2
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 22:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775861950; cv=none; b=pHNxs4ZrjW1twZMDkqv+BCzLt5ioT4l5CA8YLvGNrtobjrTQSPjRPK6L8VFqW9kQbJLfwSDSareUfoTSZDQfcc3eVEwEb/3y085lCKUydq11GC5JNUPnmiM3jux8+6Zhj33EgiHXTG9ZQxwVWrvDW6oJRRWPKyNAsm5ojePk8wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775861950; c=relaxed/simple;
	bh=GNe24fTs3TLFKLvAe+aRs5bEPMKKb52CR3eNKOsvXRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgyTC6gh14ft6wB7yaAxCKm/cO596euuWQ2K2ZURMj1dPFKmB8qlYCWXCWQCJWenG17iizeQB/e0OmgVvhCDiB1PO5idKZ09MUg2XGiKRn0YnRdn1wAEZSDo2Rb97fgPQ/y+H6J37Jf9OmtfDw5GCbnebU+kySMAeys94boEVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=cb643mpC; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="cb643mpC"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7dbd2a0211bso1914270a34.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775861947; x=1776466747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c5uotYa64SkY0JJQXrtFnEms1wBEHD+5UDUHdnuEME8=;
        b=cb643mpCflhLVSk4l5XKJX2BmjNKhF8RByH5aH8D0+jceFwZCCLtZqWBjCyOm71XVU
         i4d2Z9/SWHfmBxIKWwCruUFUZHmUGI1VML1t1IoUAGDh92wdaiTYstT6l2UtzF7Te7Wt
         lKJ7i/xULjcwf1NhO6VHQwZ1PcESo6Ju0MxNVNszJtjFgFXbJDQ4lEvk9sVfbLp++rGq
         j4S1CWZpL0pQL36aHKmLDSW+/iIN0di91XEqghScZURdL570uzqe6J+b/9DprQGbJxWt
         JnL7hIS8BOfyJDk5Uj82XTFnIVgoz0mCbQgDXCtFUT0k1ukLyeLVQSajWHczkMjqnfoD
         8IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775861947; x=1776466747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5uotYa64SkY0JJQXrtFnEms1wBEHD+5UDUHdnuEME8=;
        b=D0AZ4/KOhDnoh+VhFisCrS72FSmRqGn0cMHx/O8SPb/uqMUJtY1fNruy5MwTpi93+3
         l3GNmo7m+PgpyBRhPair8ej/yt1tdVufXYVh5SbXJMR8P/1+7ay2I9fKVNWLGWpbUOVM
         d9r8HjRt+MNDS/bJRpNKhHE2QWWgX5O4kefK15U6XgkqXCy+rEEJDCbs1vsjt+NPgzHe
         v7gt0C08oSKmgoWkLO7S3w/v3XZuuzTKF1YJtMdLakdbcJNxsJpj6EjwoozqPxIiK1J8
         C6z3lrcxF0DHyAq3GooQdP2VbDlS3IIEELK417WRWECOU1v+kxdg72KbCndUuxmYNNs8
         oatA==
X-Forwarded-Encrypted: i=1; AJvYcCWAU6ZGGvUSkuHfY2hiww9WtA7HdgDNrrfay/KYFWM9QliHwBt54Sd01KIhJ916h/PDd63SPyaQDNlw@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGj9pC7+YKnJHwWWtxHKpzF0fJ2hY9yZbzbZ+S80PGLfIKd8T
	cTSuWjwad53eRN/eYLajOfkux9XSomOVT0RItRAtF5nB7ZpB1M041BTVp/sxVS9nYeQ=
X-Gm-Gg: AeBDievbUWkPFUDagDrUo4lHp/yTh1JqYqYqZAPPRywP7vHM7Uytfq/AM7O94DU7j+x
	ls6DWxVDUlMElXO51s9vesmL/CwN5IygTGE2NbOwaSKYtIJ4RWOTEiv/ZdpSX+yWlYHFgumnyXa
	SNNcLML1bu31hYOwyIc+eFtlFudR9/5yOgeOqlO+KxwSC5jsDumNK3CRq7CWi/dTlVo7z4Rov0l
	0ypW9hkU7GHNU9rf+dYIdqj+4TRizb5chj3yg+pms4W6oHcH5Thsd5hU0/spWEI2JxaQybJbhKb
	egFZN4GMPPp4QEmx4JWJy9y8OIfJEDd+38KF2GrKP2jh2zR1Y5UKQ2u3spuwE4DNrd+GEKXYBTF
	w3GED8ETTvphWcVaxRYlzctyG1gHkIg0hJErmaJ3APse+5NnSSpzuMDBpg7g8n+5WzczzPjgnBR
	FdTnInSb3qTzb/wvZ3/S+OUOwggBSAQgpr7Q1dnb3WZ1g/eXhj/Sr0u5luiKfbipymbUC24r+3u
	zC41XrcVjFS
X-Received: by 2002:a05:6830:67d8:b0:7d7:f5d5:1916 with SMTP id 46e09a7af769-7dc27e160bfmr3391264a34.11.1775861946942;
        Fri, 10 Apr 2026 15:59:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b75d:2440:dc10:808b? ([2600:8803:e7e4:500:b75d:2440:dc10:808b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc2d1aca3asm1861163a34.6.2026.04.10.15.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 15:59:06 -0700 (PDT)
Message-ID: <f1ae57fe-1ad5-46ee-9f0c-245f4deec7ce@baylibre.com>
Date: Fri, 10 Apr 2026 17:59:05 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 6/9] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
To: Chris Morgan <macroalpha82@gmail.com>, linux-iio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, jic23@kernel.org,
 jean-baptiste.maneyrol@tdk.com, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, andriy.shevchenko@intel.com,
 Chris Morgan <macromorgan@hotmail.com>
References: <20260330195853.392877-1-macroalpha82@gmail.com>
 <20260330195853.392877-7-macroalpha82@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260330195853.392877-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/26 2:58 PM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add icm42607 accelerometer sensor for icm42607.
> 

...

> +static const unsigned long inv_icm42607_accel_scan_masks[] = {
> +	/* 3-axis accel + temperature */
> +	INV_ICM42607_SCAN_MASK_ACCEL_3AXIS | INV_ICM42607_SCAN_MASK_TEMP,

This is going to make it so that the temperature channel is always read
even if it isn't enabled and additional work is needed when pushing to
buffers to remove it again.

It looks like it is possible to read accel and temp separatly, so
there shuold be two more lines here,

	INV_ICM42607_SCAN_MASK_ACCEL_3AXIS,
	INV_ICM42607_SCAN_MASK_TEMP,

I forget what the correct order is though.

> +	0,
> +};
> +
> +/* enable accelerometer sensor and FIFO write */
> +static int inv_icm42607_accel_update_scan_mode(struct iio_dev *indio_dev,
> +					       const unsigned long *scan_mask)
> +{
> +	struct inv_icm42607_state *st = iio_device_get_drvdata(indio_dev);
> +	struct inv_icm42607_sensor_state *accel_st = iio_priv(indio_dev);
> +	struct inv_icm42607_sensor_conf conf = INV_ICM42607_SENSOR_CONF_INIT;
> +	unsigned int fifo_en = 0;
> +	unsigned int sleep_temp = 0;
> +	unsigned int sleep_accel = 0;
> +	unsigned int sleep;
> +	int ret;
> +
> +	mutex_lock(&st->lock);
> +
> +	if (*scan_mask & INV_ICM42607_SCAN_MASK_TEMP) {
> +		/* enable temp sensor */
> +		ret = inv_icm42607_set_temp_conf(st, true, &sleep_temp);
> +		if (ret)
> +			goto out_unlock;
> +		fifo_en |= INV_ICM42607_SENSOR_TEMP;
> +	}
> +
> +	if (*scan_mask & INV_ICM42607_SCAN_MASK_ACCEL_3AXIS) {
> +		/* enable accel sensor */
> +		conf.mode = accel_st->power_mode;
> +		conf.filter = accel_st->filter;
> +		ret = inv_icm42607_set_accel_conf(st, &conf, &sleep_accel);
> +		if (ret)
> +			goto out_unlock;
> +		fifo_en |= INV_ICM42607_SENSOR_ACCEL;
> +	}
> +
> +	/* update data FIFO write */
> +	ret = inv_icm42607_buffer_set_fifo_en(st, fifo_en | st->fifo.en);
> +
> +out_unlock:
> +	mutex_unlock(&st->lock);
> +	/* sleep maximum required time */

Would be better if the comment explain _why_ we need to sleep.

The code is pretty obvious that it does what the comment says, so
it doesn't add much.

> +	sleep = max(sleep_accel, sleep_temp);
> +	if (sleep)

Probably don't need the if here as msleep() should handle 0 without actually
sleeping.

> +		msleep(sleep);
> +	return ret;
> +}
> +
> +static int inv_icm42607_accel_read_sensor(struct iio_dev *indio_dev,
> +					  struct iio_chan_spec const *chan,
> +					  s16 *val)
> +{
> +	struct inv_icm42607_state *st = iio_device_get_drvdata(indio_dev);
> +	struct inv_icm42607_sensor_state *accel_st = iio_priv(indio_dev);
> +	struct device *dev = regmap_get_device(st->map);
> +	struct inv_icm42607_sensor_conf conf = INV_ICM42607_SENSOR_CONF_INIT;
> +	unsigned int reg;
> +	__be16 *data;
> +	int ret;
> +
> +	if (chan->type != IIO_ACCEL)
> +		return -EINVAL;
> +
> +	switch (chan->channel2) {
> +	case IIO_MOD_X:
> +		reg = INV_ICM42607_REG_ACCEL_DATA_X1;
> +		break;
> +	case IIO_MOD_Y:
> +		reg = INV_ICM42607_REG_ACCEL_DATA_Y1;
> +		break;
> +	case IIO_MOD_Z:
> +		reg = INV_ICM42607_REG_ACCEL_DATA_Z1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
> +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> +		return -ENXIO;
> +
> +	guard(mutex)(&st->lock);
> +
> +	/* enable accel sensor */
> +	conf.mode = accel_st->power_mode;
> +	conf.filter = accel_st->filter;
> +	ret = inv_icm42607_set_accel_conf(st, &conf, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* read accel register data */
> +	data = (__be16 *)&st->buffer[0];
> +	ret = regmap_bulk_read(st->map, reg, data, sizeof(*data));
> +	if (ret)
> +		return ret;
> +
> +	*val = (int16_t)be16_to_cpup(data);

We don't use int16_t in the kernel (ideally). Stick with s16.

Although cast isn't needed here since val is already s16.

> +	if (*val == INV_ICM42607_DATA_INVALID)
> +		ret = -EINVAL;
> +
> +	return ret;
> +}
> +
> +/* IIO format int + nano */

Usually we make these 2-D arrays for readability and then cast to int * if needed.

> +static const int inv_icm42607_accel_scale[] = {
> +	/* +/- 16G => 0.004788403 m/s-2 */
> +	[2 * INV_ICM42607_ACCEL_FS_16G] = 0,
> +	[2 * INV_ICM42607_ACCEL_FS_16G + 1] = 4788403,
> +	/* +/- 8G => 0.002394202 m/s-2 */
> +	[2 * INV_ICM42607_ACCEL_FS_8G] = 0,
> +	[2 * INV_ICM42607_ACCEL_FS_8G + 1] = 2394202,
> +	/* +/- 4G => 0.001197101 m/s-2 */
> +	[2 * INV_ICM42607_ACCEL_FS_4G] = 0,
> +	[2 * INV_ICM42607_ACCEL_FS_4G + 1] = 1197101,
> +	/* +/- 2G => 0.000598550 m/s-2 */
> +	[2 * INV_ICM42607_ACCEL_FS_2G] = 0,
> +	[2 * INV_ICM42607_ACCEL_FS_2G + 1] = 598550,
> +};
> +

...

> +static int inv_icm42607_accel_read_calibbias(struct inv_icm42607_state *st,
> +					     struct iio_chan_spec const *chan,
> +					     int *val, int *val2)
> +{
> +	/* Not actually supported in the ICM-42607P registers */
> +	return -EOPNOTSUPP;
> +}

Can we just not create the attribute instead of returning an error?


> +static int inv_icm42607_accel_write_raw_get_fmt(struct iio_dev *indio_dev,
> +						struct iio_chan_spec const *chan,
> +						long mask)
> +{
> +	if (chan->type != IIO_ACCEL)
> +		return -EINVAL;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		return IIO_VAL_INT_PLUS_NANO;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		return IIO_VAL_INT_PLUS_MICRO;
> +	case IIO_CHAN_INFO_CALIBBIAS:
> +		return IIO_VAL_INT_PLUS_MICRO;

Can write this as:

	case IIO_CHAN_INFO_SAMP_FREQ:
	case IIO_CHAN_INFO_CALIBBIAS:
		return IIO_VAL_INT_PLUS_MICRO;

> +	default:
> +		return -EINVAL;
> +	}
> +}
> +

...

> +int inv_icm42607_set_accel_conf(struct inv_icm42607_state *st,
> +				struct inv_icm42607_sensor_conf *conf,
> +				unsigned int *sleep_ms)
> +{
> +	struct inv_icm42607_sensor_conf *oldconf = &st->conf.accel;
> +	unsigned int val;
> +	int ret;
> +
> +	if (conf->mode < 0)
> +		conf->mode = oldconf->mode;
> +	if (conf->fs < 0)
> +		conf->fs = oldconf->fs;
> +	if (conf->odr < 0)
> +		conf->odr = oldconf->odr;
> +	if (conf->filter < 0)
> +		conf->filter = oldconf->filter;
> +
> +	if (conf->fs != oldconf->fs || conf->odr != oldconf->odr) {

We could use the regmap cache feature to avoid having to manual keep
track of old values. Or just always write the same values anyway. I
find that is nice when debugging hardware with a logic analyzer. Unless
there is some measureable performance improvlment here?

> +		val = INV_ICM42607_ACCEL_CONFIG0_FS_SEL(conf->fs) |
> +		INV_ICM42607_ACCEL_CONFIG0_ODR(conf->odr);
> +		ret = regmap_write(st->map, INV_ICM42607_REG_ACCEL_CONFIG0, val);
> +		if (ret)
> +			return ret;
> +		oldconf->fs = conf->fs;
> +		oldconf->odr = conf->odr;
> +	}
> +
> +	if (conf->filter != oldconf->filter) {
> +		if (conf->mode == INV_ICM42607_SENSOR_MODE_LOW_POWER) {
> +			val = INV_ICM42607_ACCEL_CONFIG1_AVG(conf->filter);
> +			ret = regmap_update_bits(st->map, INV_ICM42607_REG_ACCEL_CONFIG1,
> +						 INV_ICM42607_ACCEL_CONFIG1_AVG_MASK, val);
> +		} else {
> +			val = INV_ICM42607_ACCEL_CONFIG1_FILTER(conf->filter);
> +			ret = regmap_update_bits(st->map, INV_ICM42607_REG_ACCEL_CONFIG1,
> +						 INV_ICM42607_ACCEL_CONFIG1_FILTER_MASK, val);
> +		}
> +		if (ret)
> +			return ret;
> +		oldconf->filter = conf->filter;
> +	}
> +
> +	return inv_icm42607_set_pwr_mgmt0(st, st->conf.gyro.mode, conf->mode,
> +					  st->conf.temp_en, sleep_ms);
> +}
> +

Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2737E349B19
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 19:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783194310; cv=none; b=oYjvZrWN0hNQaBLHF7nqN73pSCxPJXJsy00BbAIAPH1YHQPfsn0h2aZ+eqZGvtYf9o6R5vbQ9ZcFPViKfSHG9E14bNBpn2wUiqZiZsd5i9vhRhHnimfYGu4HhQf3XhWJaLPlll/Z2c6uvD6zoomV8RvNsCV+ntBFTWDmizjcrs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783194310; c=relaxed/simple;
	bh=IC+SHD323jwTCzUkD3ST6ZvUz7jTq6Gw4fdmRh/lpbA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uZBZevq09ul1vkhTPu/mYl3ObFVzRo23kQ1N93zNoGOo/lqQEQWS21APkkyjqIZWQ4xKMGX0nntGAZNkLdTQ1xTZ5WQBZv4btqWAn/nwrD10qq8gDt3cIbXTDqU5xnRt86i3qzbB/MxHdrDaxVHOJr7a8DrgGKCoemc2tOXoeVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elk3s6xU; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elk3s6xU"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7eb6573bd52so900160a34.3
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 12:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783194307; x=1783799107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XygEUbvL0M+Y20K/qZ4uIvSm9kVeNjfB7RoNr6PAQPI=;
        b=elk3s6xUhyrRMet8uHjV4Q/IOM+1kno2LVpma2BGmlhImE2xuEsFKanizcV8DZwumP
         lrSTVADiA3hSTnpvUDLSNZDv6sdT9on5gggC7+IIGHdNNxsa7opQy7XjvkFZmPD7J6nK
         tih8C4qFk2Aez1gLNYKJcn9YYyQuqfTxLDUONe4NPUU/wlrlHb7+M3JKmoBgexBh7WFV
         SA26t9elfnzFKZ/yco2f6OHHkhJA4iBo+LEXJ61eC/WBMf7o9A0oqLxLWjM4qv5DaOkJ
         R4Ek0DeJ7z7ESZeg9Tr230/Klv0SrCv0/Z2g3e8pEGo/dc81kRUqspUpSXhnWdyboO/z
         3F0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783194307; x=1783799107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XygEUbvL0M+Y20K/qZ4uIvSm9kVeNjfB7RoNr6PAQPI=;
        b=eRRDxFNaiA3CmzlD/0yZ7+pNAiIhNcqq1jaxcEQxFfHY2Blc5D+RssgGIE+YVxUDBi
         GeabC4LHYwIxIYjaeVCLbO0wslzIbEPo46swoxWCjiYvvgk7OI83RstCpPtOnk5/CeXj
         CzsF08XxlC6doQebV7ozyWNVXhXVbRm5y9NH2ZYhgYjgrVkchrOM/K1TZO/8053q+XOa
         8M9+BA4Xz39SWNb0Z1Kf4kOm+D9lpqg6BkKfeHZOo5CfYu9XGZG3Szq8kH5ojqaCEcz/
         DWkNJ+w/p0Og5O1uXwfM4w2ydTlm28Qs14C6YMChDQR7R+z3n5eeZiFy0RWaH4NITRFZ
         Aj2g==
X-Forwarded-Encrypted: i=1; AFNElJ/d9dpRn/aYNXrVAvQ4eUq2+XOSDHZY9wEB9dD+KRRe3n1mNJNEQb8gf5wIX2NRFL2+qEeyrbTULhgm@vger.kernel.org
X-Gm-Message-State: AOJu0YzS8jHCGmBSvqRC07Ea3wuwHuNYJSweatK+Qk3FvVzU8tWXyqHH
	7JJTWDYQm/L9toefbVjJhlwMdNaMrCatcf1hCtfYAaMBaeSW/ct7F9s7
X-Gm-Gg: AfdE7ckmEEni9TMsHsTV3za6TVSayzVcX+cj/gw7qcSyhjYuvxoy6O/JmXTcal4A2Mc
	zxFtl+pvk2bXUQmkiQQwBP9vzoJUigzQizTr/sVtYqaqELwarOBXc/jRtqWdeA+7QvMFTC0354w
	ah3DXKKHOuZGwm+4RUG+oNewFMPu+GZzq8JupchlWa9lEKjhStOmMJnSeRqsuEdtuDf+lVcx6VP
	a7mpwcoHYysvObNU59b2Xaw3pY0739HdNmK0NgjEElddHelIMyRQLd81Pa2/WkOiWJ52l6MjtEx
	bBMENGRRPHeCdKn/GQ3AeTdThoi4iqTlNYcuU+rjau5k93J1mWNOUfnFvrT1gWgxgB/ruJmRSAs
	J9YjBXPmNGiFWyUgf+/NWAlth9qYnJ6uN55I0m+Vq63tiOOsefnmB3sx99LAgdiu5sTkI+hyi83
	GbfN4m7rtor3UHA7q72G+kCsKzq9jYJX5fdEzRo78hHA==
X-Received: by 2002:a05:6830:8290:b0:7eb:3f62:6e68 with SMTP id 46e09a7af769-7eb7fbb2c93mr2696797a34.2.1783194306777;
        Sat, 04 Jul 2026 12:45:06 -0700 (PDT)
Received: from linuxescape (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb8a1fe31bsm1362202a34.2.2026.07.04.12.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 12:45:06 -0700 (PDT)
Date: Sat, 4 Jul 2026 14:45:03 -0500
From: Maxwell Doose <m32285159@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM
 AND DRIVERS), devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2 2/2] iio: temperature: Add STS30 temperature sensor
 driver
Message-ID: <20260704144503.2347331b@linuxescape>
In-Reply-To: <20260703010532.4fc0f46b@jic23-huawei>
References: <20260621004626.66629-1-m32285159@gmail.com>
	<20260621004626.66629-3-m32285159@gmail.com>
	<20260703010532.4fc0f46b@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Jonathan,

On Fri, 3 Jul 2026 01:05:32 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Sat, 20 Jun 2026 19:46:24 -0500
> Maxwell Doose <m32285159@gmail.com> wrote:
> 
> > Add a driver for the Sensirion STS30 family of temperature sensor
> > drivers over I2C. The STS30 family of sensors includes the STS30, STS31,
> > and STS35, all of which are supported by this driver, since they all
> > share the same commands, etc. and only differ in accuracy and tolerance.
> > 
> > The driver currently supports single-shot non-clock stretched readings,
> > by using a specified delay based on the repeatability/delay specified
> > by the user. The repeatability/delay can be changed at any time through
> > sysfs.
> > 
> > Additionally add Kconfig and Makefile entries for the driver as well as
> > a MAINTAINERS entry.
> > 
> > Signed-off-by: Maxwell Doose <m32285159@gmail.com>  
> 
> Big question first.  Why IIO? These are fairly basic temperature sensors
> which typically means hwmon is more appropriate.  What does it need
> that hwmon doesn't provide?
> 

The datasheet says that the STS30 supports continuous reads which means
that we can read it into a triggered buffer (which hwmon doesn't
support) and at some point I'd like to implement that.

Additionally I don't have much experience (or any for that matter) in
hwmon.

> A few other things inline.
> 
> > diff --git a/drivers/iio/temperature/sts30.c b/drivers/iio/temperature/sts30.c
> > new file mode 100644
> > index 000000000000..dcfe3435ae5a
> > --- /dev/null
> > +++ b/drivers/iio/temperature/sts30.c  
> 
> > +
> > +/* Size of the temperature measurement data received after a read command */
> > +#define STS30_TEMP_MEAS_SIZE 2
> > +
> > +#define STS30_COMMAND_READ_HIGH_REPEAT 0x2400
> > +#define STS30_COMMAND_READ_MED_REPEAT 0x240B
> > +#define STS30_COMMAND_READ_LOW_REPEAT 0x2416  
> That smells like two fields in one value.
> 
> > +
> > +#define STS30_COMMAND_RESET 0x30A2  
> 
> > +enum sts30_read_delays {   
> 
> Name it to indicate unit.
> 
> > +	STS30_REPEAT_LOW = 4500,
> > +	STS30_REPEAT_MED = 6000,
> > +	STS30_REPEAT_HIGH = 15000
> > +};
> > +  
> 
> > +static int sts30_read(struct sts30_data *data, u16 command, u16 *val)
> > +{
> > +	u8 buf[STS30_MEAS_SIZE];
> > +	u8 tmp[2];  
> Might as well make it __be16  then it's aligned.

Makes sense.

>
> > +	int ret;
> > +
> > +	put_unaligned_be16(command, tmp);
> > +
> > +	ret = i2c_master_send(data->client, tmp, sizeof(tmp));
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret != sizeof(tmp))
> > +		return -EIO;
> > +
> > +	fsleep(data->delay);
> > +
> > +	ret = i2c_master_recv(data->client, buf, sizeof(buf));
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret != sizeof(buf))
> > +		return -EIO;
> > +
> > +	*val = get_unaligned_be16(buf);
> > +
> > +	ret = sts30_verify_crc8(data, buf);  
> 
> return sts30_...
> 

D'oh, don't know how I missed this.

>
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}  
> 
> > +
> > +static int sts30_read_raw(struct iio_dev *indio_dev,
> > +			  struct iio_chan_spec const *chan, int *val, int *val2,
> > +			  long mask)
> > +{
> > +	struct sts30_data *data = iio_priv(indio_dev);
> > +	int ret;
> > +	u16 tmp;
> > +
> > +	guard(mutex)(&data->lock);  
> 
> I'd move this into appropriate scope as the lock isn't needed for
> all the const data cases.
> 

Will do.

>
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		switch (data->delay) {
> > +		case STS30_REPEAT_LOW:
> > +			ret = sts30_read(data, STS30_COMMAND_READ_LOW_REPEAT, &tmp);
> > +			break;
> > +		case STS30_REPEAT_MED:
> > +			ret = sts30_read(data, STS30_COMMAND_READ_MED_REPEAT, &tmp);
> > +			break;
> > +		case STS30_REPEAT_HIGH:
> > +			ret = sts30_read(data, STS30_COMMAND_READ_HIGH_REPEAT, &tmp);
> > +			break;
> > +		default:
> > +			dev_warn(&data->client->dev, "Repeatability state corrupted, got: %d\n",
> > +				 data->delay);  
> 
> Any realistic way this can happen?  If not drop the print.
>

Probably not (unless of course a cosmic ray flips a bit or two).

>
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (ret)
> > +			return ret;
> > +
> > +		*val = tmp;
> > +		return IIO_VAL_INT;
> > +	case IIO_CHAN_INFO_OFFSET:
> > +		*val = STS30_TEMP_OFFSET;  
> 
> These constant cases don't need the lock.
> > +		return IIO_VAL_INT;
> > +	case IIO_CHAN_INFO_SCALE:
> > +		*val = 175000;
> > +		*val2 = 65535;
> > +		return IIO_VAL_FRACTIONAL;
> > +	case IIO_CHAN_INFO_INT_TIME:
> > +		*val = 0;
> > +		*val2 = data->delay;  
> 
> Might need the guard - I haven't checked.
>

I'm tempted to lock that read since it's shared, but I'll take a look
into it.

>
> > +		return IIO_VAL_INT_PLUS_MICRO;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int sts30_write_raw(struct iio_dev *indio_dev,
> > +			   struct iio_chan_spec const *chan, int val, int val2,
> > +			   long mask)
> > +{
> > +	struct sts30_data *data = iio_priv(indio_dev);
> > +
> > +	if (val)
> > +		return -EINVAL;  
> 
> That is going to be IIO_* specific in the switch - so move it into
> the case block.
> 

Good point.

>
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_INT_TIME: {
> > +		guard(mutex)(&data->lock);  
> 
> Given it is taken in all non error paths, I'd lift the guard() up to outside
> the switch.
>

Will do.

>
> > +
> > +		switch (val2) {
> > +		case STS30_REPEAT_LOW:
> > +			data->delay = STS30_REPEAT_LOW;
> > +			break;  
> 
> Given you are done in each of these, return instead of break.
>

D'oh, also don't know how I missed this.

>
> > +		case STS30_REPEAT_MED:
> > +			data->delay = STS30_REPEAT_MED;
> > +			break;
> > +		case STS30_REPEAT_HIGH:
> > +			data->delay = STS30_REPEAT_HIGH;
> > +			break;
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +
> > +		return 0;
> > +	}
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static const struct iio_info sts30_info = {
> > +	.read_raw = sts30_read_raw,
> > +	.write_raw = sts30_write_raw  
> Missing comma.
> 
> Basic rule of these is you can only skip the comma if doing so doesn't create additional
> churn when adding new stuff after it.  Two cases are common.
> 1) Nothing can be added there - true of terminators  {} etc.
> 2) It's one line anyway so any change will result in that line changing
>    and hence no advantage in having the comma.
>

Ah. Will fix.

>
> > +};
> > +
> > +static const struct iio_chan_spec sts30_channels[] = {
> > +	{
> > +		.type = IIO_TEMP,
> > +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_OFFSET) |
> > +				      BIT(IIO_CHAN_INFO_SCALE) | BIT(IIO_CHAN_INFO_INT_TIME)  
> 
> No obvious gain in going longer than 80 chars here.  Just have one per line.
> Also the , is missing
>

Will fix up.

>
> > +	},
> > +};
> > +
> > +static int sts30_probe(struct i2c_client *client)
> > +{
> > +	struct iio_dev *indio_dev;
> > +	struct sts30_data *data;
> > +	int ret;
> > +
> > +	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
> > +	if (!indio_dev)
> > +		return -ENOMEM;
> > +
> > +	indio_dev->name = client->name;  
> 
> I'd prefer to see that done via device specific chip_info structures.
> IIRC there are some paths in which client->name might not be set appropriately.
> For ACPI PRP0001 (the route that uses compatible) it is set to the vendor stripped
> name so that is fine, but should we ever add 'proper' ACPI support it will be the
> _HID which isn't what we want.
> 
> Anyhow, normally we avoid thinking about this by getting from the data
> rather than the ->name via i2c_get_match_data() and appropriate structures.
> 

Alright then, will do.

>
> > +	indio_dev->info = &sts30_info;
> > +	indio_dev->channels = sts30_channels;
> > +	indio_dev->num_channels = ARRAY_SIZE(sts30_channels);
> > +	indio_dev->modes = INDIO_DIRECT_MODE;
> > +
> > +	data = iio_priv(indio_dev);
> > +	data->client = client;
> > +	data->delay = STS30_REPEAT_HIGH;
> > +
> > +	ret = devm_mutex_init(&client->dev, &data->lock);
> > +	if (ret)
> > +		return ret;
> > +
> > +	i2c_set_clientdata(client, indio_dev);  
> 
> Why? I'm not seeing it being used.
> 

Will just get rid of it then.

I'm probably a numpty for submitting this without the hardware :( I'll
probably just withhold the v3 until I can get hardware (or at least
submit as an RFC).

-- 
best regards,
max

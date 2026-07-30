Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCB740926C
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421562; cv=none; b=piespLoznq2uo8ImwYgRUS3SJ4HvPOrx/xZMwuQM4TVXgRBHQL62OvQ6C7yqaYlEgPcMZS02sahpxr4oo0D2yKYml6KBnKlqc53ueQdKLgSmQdPvx6G5OtdCU6UacVxrUrp91GQHHhrj9KdqpXP9fHlIgNNYdDPoUO6el19+ZM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421562; c=relaxed/simple;
	bh=bzeQRQkqvmjk0bolTwTDyMICNuBBfQAKcKe0bMnhJDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRD7+iUSzPY6b06hXqt7cJ9IfmG5wcaDJTmqaB9/pQjBsvWoVsMQSoDTjWXHn9hVyX2bHnMz8JAUAbIdx2QNTRY1oTAnUsejNc0ffKCuWZGRwKAckYE3ElAY2SOxXp9M5dnwapq6COv3/H8iHx9JMhTMLE/GCxgdH+ZR/rIqYSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/i4y3Ai; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/i4y3Ai"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso11456215e9.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785421559; x=1786026359; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=icrFhb9bvqjExUailLbe3RiwUDd0TkhNWwCADWmTSws=;
        b=L/i4y3AiHlaJ7DJkZHYFSuTX2fDU+W0gb6qhP7ZbbrBdNBWMqAvlrZPmu+aOx3xoSr
         8MiuUeCkuvlwmaWJrU7b0dbTRSenX3+sk9BnxG72VpXZqOhjakVDxn+Gn4DzSwM91/ZJ
         Q2PjMKMZsQyH6SSCCgKM/iG8yn429SX4gpkgEh5CqkzqmDVNYiuyPozDXU3Avrkx63nc
         Exg8SG7KPnGfwaOa97oI5BWZpxT0tWuxFVwF+y/RXNSsDZyNO+Okumtq4OL9BxPveUde
         AAwk6S6RljdJwQ+y0OX5A5SwrbQvDTYMAFLvc+lzuwdHmDVRh5JhQah8KT0WPyLLQ0U3
         LVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421559; x=1786026359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=icrFhb9bvqjExUailLbe3RiwUDd0TkhNWwCADWmTSws=;
        b=oI+OEZSpuMhX5eftLL9xQavMVlQbgyo8W9g9+LFXzClJTsxvDAGWQPmfxbyU4IuT+k
         kSyVRK5fq3vvI/eqsaAr9J0QKoqGP2NqEfgiS4Qn3N5/ECrI5l5o1npuNAm3pBmuBN+b
         cH60bKiJ2dV4HNx6rvwqL5PZTzR5aX0t9Ve++5te5qZHP/PvGK77eBUubZJr4mX9SOx9
         98wJ/6tZ8ZBhjoHTW2PELLsXLYRmGwEZTWfrHAOIslemOQVlqPL27FDS5EAN3mQ/7L75
         UgqLYpFjtR/WgrEOVE8P/bJxaVFjQse4BLyz3ZOdRsgIPEgCFajW5YsGLEle1Az/98ZT
         w8PA==
X-Forwarded-Encrypted: i=1; AHgh+RpO8tihEZi/P7Gns+rwYOtwUc78LKGmu6LK/JhcaKRWoAwjVC4kNaMqBlen/D8E3l1mBoXV6uqb4ECN@vger.kernel.org
X-Gm-Message-State: AOJu0YyRVatbDknyc6+ZlETXPTuu4bBTqdh1FfaDXzKuD/7iK5JCgVOs
	zTCCZVZmxZfHgiLCCqPAY7MZMqbgm/OQmQK+bNu4tgxSmuP4+HlL3ErB
X-Gm-Gg: AR+sD138EJdmpvnX8g2Vg8aiATZVDxje9TcTbQyK3QgF2gVNujCG4KDydo3L7RO7MRp
	p4+WrUEkUhNIIXzDrb42wH1qOpEgNc99Fa/WyaV5xHLL+P9tFKU9lgT2+mMkWjaK2QotCDh1U27
	tHQDBL9edbhtO4vSof3rjHS32Y6lHq18bndFVe+29QfnLsHEl3yzyUcBi1eh/86OiA3R2pSwgWD
	Jp8ibCDo/Pmc0FQxMxrA8QRhkGTW9OiOR1G1v6yWgHEqAXlDsX+uIrYDvwiPhbEthGLTBWRKQgE
	PLj8Vwy4PaNMyvBaq7IymaW8/r8I8ifsRu3Je0s0upll2+S+4YE4w0iYZZ4gTrXok9uYmWMrOrl
	TRWr+cXi9hE3AMzNTt/8vDAlHJdSPtT7AbJiJpY6iDwxrfnQsbct1ZAwljDIgtOmdQxLljGe2Jt
	8CooQt72yVEHtcBoyhFNAVXe2ybHPOwFtXqLYF/ePMuyVzfOkUDhKz
X-Received: by 2002:a05:600c:4e46:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-49800e6d495mr42480385e9.2.1785421559004;
        Thu, 30 Jul 2026 07:25:59 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e64d5sm6116891f8f.15.2026.07.30.07.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:25:58 -0700 (PDT)
Date: Thu, 30 Jul 2026 15:27:08 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Alan Tull <atull@opensource.altera.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Message-ID: <amtewh9lOgWz0-Nh@nsa>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <c3e143ed-af08-4a0f-a630-96a255df838d@roeck-us.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3e143ed-af08-4a0f-a630-96a255df838d@roeck-us.net>

On Tue, Jul 28, 2026 at 02:05:53PM -0700, Guenter Roeck wrote:
> On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
> > From: Nuno Sá <nuno.sa@analog.com>
> > 
> > This is in preparation for adding support to a device which needs to
> > use it's own read_block implementation.
> > 
> 
> The chip-specific implementation calls i2c_smbus_read_i2c_block_data().
> I'll need to know if this is a chip limit or a controller limit.
> If it is a controller limit, a chip specific override would be
> inappropriate.

I'll reply from top of my head (did not looked at the driver again).
IIRC, the biggest reason we need the chip-specific implementation is because of
the RAIL selection logic (mainly when not in page mode).

- Nuno Sá

> 
> Guenter
> 
> > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > ---
> >   drivers/hwmon/pmbus/pmbus.h      |  3 +++
> >   drivers/hwmon/pmbus/pmbus_core.c | 24 ++++++++++++++++++++++--
> >   2 files changed, 25 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > index 3d5586c67f84..d697939ec892 100644
> > --- a/drivers/hwmon/pmbus/pmbus.h
> > +++ b/drivers/hwmon/pmbus/pmbus.h
> > @@ -459,6 +459,9 @@ struct pmbus_driver_info {
> >   	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
> >   	int (*read_word_data)(struct i2c_client *client, int page, int phase,
> >   			      int reg);
> > +	/* size of data_buf is I2C_SMBUS_BLOCK_MAX + 2 */
> > +	int (*read_block_data)(struct i2c_client *client, int page, u8 reg,
> > +			       char *data_buf);
> >   	int (*write_byte_data)(struct i2c_client *client, int page, int reg,
> >   			      u8 byte);
> >   	int (*write_word_data)(struct i2c_client *client, int page, int reg,
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index 7b58f7198574..ff4572c473b7 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -533,6 +533,26 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
> >   	return rv;
> >   }
> > +/*
> > + * _pmbus_read_block_data() is similar to pmbus_read_block_data(), but checks if
> > + * a device specific mapping function exists and calls it if necessary.
> > + */
> > +static int _pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
> > +				  char *data_buf)
> > +{
> > +	struct pmbus_data *data = i2c_get_clientdata(client);
> > +	const struct pmbus_driver_info *info = data->info;
> > +	int status;
> > +
> > +	if (info->read_block_data) {
> > +		status = info->read_block_data(client, page, reg, data_buf);
> > +		if (status != -ENODATA)
> > +			return status;
> > +	}
> > +
> > +	return pmbus_read_block_data(client, page, reg, data_buf);
> > +}
> > +
> >   static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
> >   					      int reg)
> >   {
> > @@ -678,7 +698,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
> >   	struct pmbus_data *data = i2c_get_clientdata(client);
> >   	char data_buf[I2C_SMBUS_BLOCK_MAX + 2];
> > -	rv = pmbus_read_block_data(client, page, reg, data_buf);
> > +	rv = _pmbus_read_block_data(client, page, reg, data_buf);
> >   	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
> >   		rv = pmbus_check_status_cml(client);
> >   	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
> > @@ -3564,7 +3584,7 @@ static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
> >   	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
> >   	scoped_guard(pmbus_lock, client) {
> > -		rc = pmbus_read_block_data(client, entry->page, entry->reg, data);
> > +		rc = _pmbus_read_block_data(client, entry->page, entry->reg, data);
> >   		if (rc < 0)
> >   			return rc;
> >   	}
> > 
> 

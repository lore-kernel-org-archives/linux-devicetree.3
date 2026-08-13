Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0312E43F4BD
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614399; cv=none; b=uBOlR/wxw28ezPN9WHSRbYWo3CeQVb9sLXJAMm58+qhEFlhFMAIbIBZ04Qi88PPMJHrwUdWO32N95n8X2VDOmHJKI44NiXRg+FPBOeS+v6/8RZb1OGoWBmvOitEIoWAfy07waciM7NJVJqY6vYafrnlt/OkgOAyZGNdrnCNlU6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614399; c=relaxed/simple;
	bh=0k5UFcsDxMF0+hFdrruFP+CgBmDAfSJyJG3r+C/YlXs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=uNkf+r2TyRquj3dxpDujq5V5aKM8n9aVfXkCctu2WS3eAE7gRis/hYKYlGf//OnJbsN5Js6YpUvOx+6PVyFSfbPVI66P0BpdNdfqgbk5P6HUVMyfPqHsIKLOBtiezcg+aGpbtMsa5YknmdNjoJn1wlnQvpsVfjXw3OEO9gZxB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+Q6HV36; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+Q6HV36"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1078961f8f.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 02:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786614396; x=1787219196; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i8lTOBpK87oPx0e2zL9VWFjHWOy3yiEAUgRK3tuXsXY=;
        b=T+Q6HV36+6ZiPj2tUTgXB1e7ZY0MnWjuKbL+e5BFh1d/h6xyIk6IL9k3ajEG2A3JPw
         ZOFvsS1FjmvnhTiMHRWua/97fAke8IzfUwoYhZOldC9xoFtOeQg5+6KZuOQJMvse0ICf
         tiklBbzD5o2MHdfa5ZJgBUCZWM4soS7Y0Dj6yHLa9psEDJeZ+MmYZ/bI+3v977wjbC7b
         eEyPu/Uus8ZilE3JHAHX4iTWAbg2m7xDFirkbNRzCkdB/2w/A0EVRfic4fQKzSu3wo0Q
         bcUszcWS8xqBVdsz7CiJy+OluI6aN13A0AD4Fr/nHn2Gg5iMSJIVMrg697CUq0hAgMul
         TuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614396; x=1787219196;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8lTOBpK87oPx0e2zL9VWFjHWOy3yiEAUgRK3tuXsXY=;
        b=LEOi2cWChqDfwsSgq4C2b+XUpb+0KUVNtQNMbTj+WSOF1sQsrpBKUjA//USvZy6ofJ
         12gLqMJ3ZQNS7haLM7qVc09vwE6gA/8RWprMI4XqTKO+kgZYR99oMPoCj6iQBCRNoGHG
         GNmmKClkknEcjnvtE1S5hIRVOG/w5JmRQ07uMN/Gl4O2h+R8vhYkDTsDxkAZ/98K83To
         yZfd/DpMtHnS+WOPyRhKxkd9L3QDyGXBOgA3fbsgAiJoSMg5ZR80t1lIcWutoyqUZikP
         8pqybDtrKYvzZ7UxPeKJ4319WsprvO27C7jDYuX+ZyCzikd/7tRLrRswtBsSs8ElENFw
         NRrg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/VT2zrZqPKKm52i94TzHrIDw43vwlq49A1BmLUtaK2K4D6IdGAnJT8N8dSNTX28rDN7gX6SHuMtOz@vger.kernel.org
X-Gm-Message-State: AOJu0YyyV+ZMwQcFf6tr/uXn2BbxoU/ZqXdJpj177J1wz45fUap/AL2Q
	tldLHt9sHug4eiN8V6kqmhuKlUclS6happZ5nlrJoKWBys8W1P3jw+Kj
X-Gm-Gg: AR+sD13RthJ+uA7PdtHlbZOfgj5ukiVGxGq7m6H2aV2l0AmPDu90Jf3Yt3pBOzPnvIX
	GYjEn5c+BbSbUw0PklnkCgE9EZeQo9zjmJ2wI9gxSXVt5i9KNIwyZFaC4FUrAeaea2gJFh3WwQ/
	roCVi4t8c9xWzhoU675rKouuTUOOl+n7BsyueeUbA3QEXYeySQNN2BA2dkAj+bHdolmnqOOVgJ/
	TzieMhQ6teJ3jVufi4nyjMFLieWH6vxRiID5TMpCs5+wYiCRcph8YUDz+H81I3nEbKDq8ua5M/1
	ZcYdQ5jtJ9zuS/ClpS9+BqFcWRa4EZ1EtJoZ8IgZdtTay9CW9YzQTgmBJlwO8Gm5/4YJDpKfNOa
	K2CTdz6JUPVIQOR/pi9QcDj4N4n98tg3JLGT0k6hocy4Gurh1WN1uI2RBWrkxP8VJbaWU7CmpuO
	aHMFBH/XJrcbyycOF6ccO8DSNKmlwV0xzsYJ9v35yIro5QTEuVKxHC/DzWmq2IJSki2qjACqJN4
	Qw=
X-Received: by 2002:a05:6000:4a1c:b0:462:e086:35f with SMTP id ffacd0b85a97d-48159fee9e8mr6384468f8f.21.1786614396036;
        Thu, 13 Aug 2026 02:46:36 -0700 (PDT)
Received: from localhost ([2001:4bb8:16f:15e0:beeb:f51b:da5e:3a64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a568be4sm5361791f8f.9.2026.08.13.02.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 11:46:32 +0200
Message-Id: <DKNPY12RSCH4.2KQCX98171G2H@gmail.com>
Subject: Re: [PATCH v6 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260812-veml6031x00-v6-0-7eef6e4ce290@gmail.com>
 <20260812-veml6031x00-v6-2-7eef6e4ce290@gmail.com>
 <an1rR07iJd_XLSPr@ashevche-desk.local>
In-Reply-To: <an1rR07iJd_XLSPr@ashevche-desk.local>

Hello Andy, thank you again for your thorough review.

On Thu Aug 13, 2026 at 8:59 AM CEST, Andy Shevchenko wrote:
> On Wed, Aug 12, 2026 at 10:27:41PM +0200, Javier Carrasco wrote:
>> These sensors provide two light channels (ALS and IR), I2C communication
>> and a multiplexed interrupt line to signal data ready and configurable
>> threshold alarms.
>
>> This first implementation provides basic functionality (measurement
>> configuration, raw reads and ID validation) and defines the different
>> register regions in preparation for extended features in the subsequent
>> patches of the series.
>
> This paragraph needs to be rephrased. In the current form it suits cover =
letter
> and not the commit message. Here, just list the features supported.
>
> The "the subsequent patches of the series." in the commit message is very
> ambiguous. What patch series? Which patches? Are they landed in the upstr=
eam?
> If yes, which commit IDs? If not, when if ever? Et cetera! Usually it can=
 be
> simply said "The other features may be implemented later on."
>

This commit message will be re-worked. Up to v3 the driver was sent as a
single patch, and as I split it, it stayed a bit too dependent of what I
was sending as separate patches. But there is no real need for it.

...
>
>> +	data->regmap =3D devm_regmap_init_i2c(i2c, &veml6031x00_regmap_config)=
;
>> +	if (IS_ERR(data->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(data->regmap),
>> +				     "Failed to set regmap\n");
>
> Is debugfs access already enabled for regmap after this call? Perhaps you=
 want
> mutex to be initialised before that?
>

Could you please explain what you are trying to avoid? Even if the
debugfs is already enabled for regmap at this point, what is the
possible race condition? The IIO device is still not registered at this
point, and the registers are set to their right values in _hw_init()
after the mutexes were initialized. Moving the mutex initialization a
couple of lines towards the top is not an issue, but I would like to
understand the reasoning behind.

>> +	iio->name =3D data->chip->name;
>> +	iio->channels =3D veml6031x00_channels;
>> +	iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels);
>> +	iio->modes =3D INDIO_DIRECT_MODE;
>> +	iio->info =3D &veml6031x00_info;
>> +
>> +	ret =3D devm_mutex_init(dev, &data->scale_lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D veml6031x00_regfield_init(data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to init regfield\n");
>> +
>> +	ret =3D devm_regulator_get_enable(dev, "vdd");
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to enable regulator\n");
>> +
>> +	/* The device starts in power down mode by default */
>> +	ret =3D veml6031x00_set_power(data, true);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to power on the device\n");
>> +
>> +	ret =3D devm_add_action_or_reset(dev, veml6031x00_als_shutdown_action,=
 data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to add shutdown action\n");
>> +
>> +	pm_runtime_set_autosuspend_delay(dev, 2000);
>> +	pm_runtime_use_autosuspend(dev);
>> +	ret =3D devm_pm_runtime_set_active_enabled(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
>> +
>> +	pm_runtime_get_noresume(dev);
>> +
>> +	ret =3D veml6031x00_validate_part_id(data);
>> +	if (ret)
>> +		goto err_pm_put;
>> +
>> +	ret =3D veml6031x00_hw_init(iio);
>> +	if (ret)
>> +		goto err_pm_put;
>> +
>> +	pm_runtime_put_autosuspend(dev);
>> +
>> +	ret =3D devm_iio_device_register(dev, iio);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to register iio device\n");
>> +
>> +	return 0;
>
>> +err_pm_put:
>> +	pm_runtime_put_noidle(dev);
>
> Hmm... This is usually a red flag to see a goto after devm_*() calls.
>

Could you please elaborate on this? I am aware of the dangers of a goto
after the cleanup attribute, but devm_*() calls work on a different
scope, not local to the function. What could go wrong? This goto is just
a way not to repeat pm_runtime_put_noidle(); return ret; and I am not
strongly against repeating these two lines wherever there is a goto, but
I am not sure what we are avoiding in this case.

>> +	return ret;
>> +}

Best regards,
Javier

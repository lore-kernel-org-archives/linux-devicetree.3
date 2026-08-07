Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A3D3382C5
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114423; cv=none; b=lo0cMZOMxk/cIDgrNEwOoVgEi1FM1B3fMk+ihv9BPcWOpDuM3+qamcozzBvvTI6gHNUbGilAy8ZUzK4kcSJ02ctDy6R0NGlLPKo5vLzxUVQqRVMDD2JSc5Ol37bQ9NZKwdZAPS2ECQptehhFDx6btIRmVoOrPSa4nkn0613YAdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114423; c=relaxed/simple;
	bh=GefV3NNh0mC4k/+YNxtqLjBzqGJePo4P6USI1SfGzdQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=VShyMEUND8xskUVoU5VI3YkmWCpowqvdYYKdfPdJQ3zqpn+qA1bsenu0FL2XHTbfii7qLDgbypjMucX9Xyd/pkkHddzzTyCnQJXVxsiwSMremE65E+m0JPP9lvLMngU8XLXwyyEhewyBpA95HwvMNWr4haB4AsywARtZGQWVPv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTicRmq1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTicRmq1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49800c6a846so28504985e9.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 07:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786114418; x=1786719218; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s1TYQovX813QrlY8K8QJWO05PjbpBhzIRd4Xwek58sc=;
        b=PTicRmq1qASlyGMA6q4Q+UuWHMh5ebvVixZAnT7hw4INtZHDzHLM1YqTA4gRcAm+ae
         QzPIbW1gD6K9Am5nf5OS7r6hMPc+E2g3EM/7NawYs99SD3RmoSI1V67Uf+YT0FOmlIW7
         7xOFI5VAF94HMVp63grhJ1oEcprD4ZtpN42GlbWAV1omnFDjQGWtXDUXF+E8J5xGemrR
         tT6ZXlSGe8Rx4DgvU0jpn+WhaQ2SJyfTGCSiOLCJaAl9NZ/7MT6SSiwP+TFSvYN7iX2v
         bHb1rk1RM2hustsaW4LRxvjGVj6QH5jBxmMcHv803Lu/QdKPPFMj7GODNkVid+kPTHjF
         Gj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786114418; x=1786719218;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1TYQovX813QrlY8K8QJWO05PjbpBhzIRd4Xwek58sc=;
        b=aVNnQqUSqCU4/PWywbZNns8ImhjJmocxxNvOEzdntG2z8FJVRRMxQ+dNIG7qhMQ7ZC
         nta7SN8Ui5QKepwuwHb0Nrw3tjpDW9JDL3NCsuuXy1JZpD0uBIvAeIca/tk+cEeRpP2K
         tUxe3L7Urfu8y68p14RPiyYf4x3HySD1B0sDFxaD6HNy0ApIX/qK8wLEBdbhHyLaczmv
         wT2NLifZKQMXHFDuNcS2U+puOpJkewaKCoVOgLK7A9ZsEcC5kBjWQIhtJbF+/vCLtLqC
         +q0cXa646zZIBocdD8Wq8IuY+NoLoi5juDgt1A6aq2hUhO9arOPC/oCls7OI/ssVXKIX
         OuQw==
X-Gm-Message-State: AOJu0YzYUHYVAwaif+jy/M2H6a66fCcMB63h7mSCuvs8Y77pKXqPDBvk
	81n8PF1aR2HETCVKE+9FZjf2qx6Ek5D8XYGaaxoocJDnitLCd1h/OKXn
X-Gm-Gg: AR+sD13GibV90vnSKKlCyJqZkmMqxXvUoJhoglOXxRZkDPNXlkzCD7ABKkSmkJv2LkH
	Rd3vaq8l3WkF+DWrj54RAMYdjfS3Sbml0GiVqPK8J+6RwGA2qlXOE9H5yPVkLOk3R1yCkwf7OMb
	g0N8f2DWtiDTcJMuCBrGBZ33oeRxJWiR9494B13/ETWmIOsjuvKiO98jVkFRgeWqhNGUU3qTC3b
	47xIEQ+p+Sz6RztQMUWywo/Gu3mNMwUbKAjrr8tYgpMQtythm+QXnzwx9g7TProQsbwkRpN2DBr
	s3ctImoDmp6OGvAr4m6SZE7WEQ25FUt6rVq/co6QMGXyR8v62yBHRvOkI5KhQtKLsdnZW0BK7gw
	IjFlCG0fdpdtmHmkGk1DYcCQfOBj8JuEbg9OKQV/ulQabmzSHUilazchoddRvUhz0lzwmJlTfeP
	bBT/RUo9UTQV7Sn8E5p8Vry/pBRgR6Sgb9ihuDTue+7tUzkx2wW2B4yfIuA93ogSX/h9ozba7g0
	do=
X-Received: by 2002:a7b:c7d3:0:b0:496:c977:3b6d with SMTP id 5b1f17b1804b1-49959e2f01bmr121071505e9.12.1786114418064;
        Fri, 07 Aug 2026 07:53:38 -0700 (PDT)
Received: from localhost ([2001:4bb8:13c:7c2e:a29b:6e3a:d099:a4c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm65199965e9.4.2026.08.07.07.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 07:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 16:53:35 +0200
Message-Id: <DKISPV4GH699.G6SFCPJJMS10@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v5 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-2-e60876fb3640@gmail.com>
 <20260807141922.EADFE1F000E9@smtp.kernel.org>
In-Reply-To: <20260807141922.EADFE1F000E9@smtp.kernel.org>

On Fri Aug 7, 2026 at 4:19 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Mixing `devm_pm_runtime_get_noresume()` with a manual `pm_runtim=
e_put_autosuspend()` in `probe` causes a PM usage counter underflow on devi=
ce unbind or probe failure.
> - [High] An unprotected read-modify-write in `veml6031x00_set_power_state=
()` races with sysfs configuration changes, causing lost user configuration=
, and a lock inversion prevents a simple fix.
> --
>
> --- Patch [2]: [PATCH v5 2/4] iio: light: add support for veml6031x00 ALS=
 series ---
> commit 2cb7c39d884f4873be61de5deba3865dbd24f394
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> iio: light: add support for veml6031x00 ALS series
>
> These sensors provide two light channels (ALS and IR), I2C communication
> and a multiplexed interrupt line to signal data ready and configurable
> threshold alarms.
>
>> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml603=
1x00.c
>> new file mode 100644
>> index 0000000000000..30cccda51ca08
>> --- /dev/null
>> +++ b/drivers/iio/light/veml6031x00.c
>
> [ ... ]
>
>> +static int veml6031x00_set_power_state(struct veml6031x00_data *data, b=
ool on)
>> +{
>> +	u8 conf[2];
>> +	int ret;
>> +
>> +	ret =3D regmap_bulk_read(data->regmap, VEML6031X00_REG_CONF0,
>> +			       conf, sizeof(conf));
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (on) {
>> +		conf[0] &=3D ~VEML6031X00_CONF0_SD;
>> +		conf[1] &=3D ~VEML6031X00_CONF1_IR_SD;
>> +	} else {
>> +		conf[0] |=3D VEML6031X00_CONF0_SD;
>> +		conf[1] |=3D VEML6031X00_CONF1_IR_SD;
>> +	}
>> +
>> +	return regmap_bulk_write(data->regmap, VEML6031X00_REG_CONF0,
>> +				 conf, sizeof(conf));
>> +}
>
> [Severity: High]
> Does this unprotected read-modify-write race with concurrent sysfs config=
uration
> updates?
>
> Because CONF0 and CONF1 are in the volatile ranges, regmap does not prote=
ct
> them with its cache lock. Concurrent regmap_field_write() calls triggered=
 by
> veml6031x00_write_raw() could change the gain or integration time between=
 the
> bulk_read and bulk_write here, causing the user configuration to be silen=
tly
> overwritten and lost.
>
> Additionally, could acquiring the scale_lock here to fix the race cause a
> deadlock?
>
> Looking at veml6031x00_single_read(), it holds the scale_lock before acqu=
iring
> the PM runtime reference:
>
> veml6031x00_single_read()
>     guard(mutex)(&data->scale_lock);
>     ...
>     PM_RUNTIME_ACQUIRE_AUTOSUSPEND(...)
>
> If the autosuspend acquisition triggers veml6031x00_runtime_resume() whic=
h
> then calls veml6031x00_set_power_state(), attempting to take scale_lock a=
gain
> would deadlock.
>
> [ ... ]
>

This issue can be avoided by using regmap_update_bits() instead, which
actually was used in previous versions. I modified it to test the
difference after I get confirmation from the manufacturer that the
registers must be updated one after the other, not at the same time.
I will get back to regmap_update_bits().

>> +static int veml6031x00_probe(struct i2c_client *i2c)
>> +{
>
> [ ... ]
>
>> +	ret =3D devm_pm_runtime_set_active_enabled(&i2c->dev);
>> +	if (ret)
>> +		return dev_err_probe(&i2c->dev, ret, "Failed to enable runtime PM\n")=
;
>> +
>> +	ret =3D devm_pm_runtime_get_noresume(&i2c->dev);
>> +	if (ret)
>> +		return dev_err_probe(&i2c->dev, ret, "Failed to get runtime PM\n");
>> +
>> +	ret =3D veml6031x00_validate_part_id(data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D veml6031x00_hw_init(iio);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pm_runtime_put_autosuspend(&i2c->dev);
>
> [Severity: High]
> Will mixing devm_pm_runtime_get_noresume() with a manual
> pm_runtime_put_autosuspend() here cause a PM usage counter underflow?
>
> The devm_pm_runtime_get_noresume() call increments the usage counter and
> registers a devres action to decrement it on unbind or probe failure.
>
> However, the manual pm_runtime_put_autosuspend() here drops the counter b=
ack
> to zero.
>
> When the driver is subsequently unbound, the devres action will execute a=
nd
> decrement the counter again to -1, which could corrupt the runtime PM sta=
te
> machine and prevent the device or its parent from suspending.
>

This was discussed in V4, and it is not a real issue because this
configuration can never reach to decrement the counter to -1 (long story
short: atomic_add_unless(&dev->power.usage_count, -1, 0)). It was also
validated by loading and unloading the driver under different
circumstances.


Best regards,
Javier

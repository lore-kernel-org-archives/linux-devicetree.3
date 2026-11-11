Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413572;
	b=ZpKWr/S2BvhwO9vuPBIGx3KzIXio5XP/vBnyBGHPBke3HDWaz11whpKM3Kg/66LYD0gS
	 B0uaiErOT8+4MQH6bDK5r5tVrLbaIeMf6FZpkZ3cKolrO3fsg+RBqg8j3qli0DaZEdv+E
	 ISOtaMj3hSX+4NCMvYyctvyk1pPx7mbvSz/ic4MbV4jJr0lWB4Rh5GhMct7B7/udHYNUx
	 FbESK6YtlzY63zPE3q/ZYrH9jQyNZZ4Q7LrniBtUrAFZZ6TJXj+GyrE1B67a78t11b8t8
	 4Kd3r55Sz5uY5tTECk0+JL3mnjBfILfCQEkyHCRNymwkFnVuYJKqIf0d/D1RCr4uxiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413572;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sc9351bx1zjr+g+v0BgDeETe9fz3Iu4MVnFI+1Xd+Dw=;
	b=gAEsa2cXNfL+cZRvmRu0+ikaMX5gNTEQPlxaUlOD0pVHRE2UhzJIHMfpsmey4y1HSQG9
	 uROcf2fSffXdqFKqqgSKnGRA18KqUcuBIyJgOqcg1rcf6x0+/KNmV8M+IYZIEQ1wlGqHz
	 BNs1n4qAoZt0w9h8mLYCMb/OyB/vMXlarwVl151IVEoTt6okOOVgJMcg/wanYAyFU/rEZ
	 909xuddIjkkbY7Of09jDN4ctaFQbN6ZM8nfmbn4CCxwXlqutH0jyXHrlqzDhZaIyiqTu9
	 WRw7hs5/ccvQ/EqY/MDU7IRHIaAU84ONJSxwnsLEsuv6YA+xI/YYBZmXcUzksqWXikw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXHf3Tyl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84308606A32D
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXHf3Tyl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB81D1F00A05;
	Wed, 11 Nov 2026 16:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794413572;
	bh=sc9351bx1zjr+g+v0BgDeETe9fz3Iu4MVnFI+1Xd+Dw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UXHf3TylJVBytkYrm6LM9xDxLDmhhaG5Yw/PjRssk6Ivli2thWvK5Hqnus1nTLpiC
	 AQb04RDAFV79b7nIHGHowcqfOa1bulzNCLt0hpcIOcZBAlSVRMCltZ8qNyhOLbQpJF
	 VRcQd8NYfOA+6eg3kHagKaaF4F0XfAJ1bHW8CGWEGVJ35vvkbk+W7X6AqQdEYB4FwJ
	 7zz9h/3GhHqUI3Ya7UNTje/MU+EpQIg83M2EClG7KedEPBkf9GeIPzO5sWnTHGH/wh
	 8sKXem+7zZAZuceKaPGMCJJd1w1VgGqkzr/daQ/YVlXR77YTp61z7vBmkBSTLJ/T4J
	 zj1Lr1pFBtBZA==
Message-ID: <sashiko-outbox-209263@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] power: supply: Add Silicon Mitus SM5714 fuel gauge
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Asdlerto Korry" <korryasdlerto@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-sm5714-fuel-gauge-v1-2-b9d163fff6ff@gmail.com>
References: <20261111-sm5714-fuel-gauge-v1-0-b9d163fff6ff@gmail.com>
 <20261111-sm5714-fuel-gauge-v1-2-b9d163fff6ff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:12:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] power: supply: sm5714: missing MODULE_IMPORT_NS() for
  IIO_CONSUMER
- [Medium] power: supply: sm5714: NULL deref on fg->psy in
  sm5714_fg_get_status()
--

commit f1f865d4819006729764f420d2f1ef002104e726
Author: Asdlerto Korry <korryasdlerto@gmail.com>

power: supply: Add Silicon Mitus SM5714 fuel gauge driver

This commit adds a power supply driver for the Silicon Mitus SM5714 fuel
gauge, reading state of charge, voltage, current, and temperature over I2C
and an optional thermistor IIO channel.

> diff --git a/drivers/power/supply/sm5714_fuel_gauge.c b/drivers/power/sup=
ply/sm5714_fuel_gauge.c
> new file mode 100644
> index 0000000000000..531583fb211bb
> --- /dev/null
> +++ b/drivers/power/supply/sm5714_fuel_gauge.c

[ ... ]

> +static int sm5714_fg_get_status(struct sm5714_fg *fg, int *status)
> +{
> +	unsigned int aux, soc;
> +	int ma, ret;
> +
> +	ret =3D regmap_read(fg->regmap, SM5714_FG_REG_AUX_STAT, &aux);
> +	if (ret)
> +		return ret;
> +	ret =3D sm5714_fg_read_sram(fg, SM5714_FG_SRAM_SOC, &soc);
> +	if (ret)
> +		return ret;
> +	ret =3D sm5714_fg_get_current_ma(fg, SM5714_FG_SRAM_CURRENT_AVG, &ma);
> +	if (ret)
> +		return ret;
> +
> +	/* the charger stops after top-off while the adapter stays connected */
> +	if (!(aux & SM5714_FG_AUX_STAT_CHG_ON) && power_supply_am_i_supplied(fg=
->psy) <=3D 0)
> +		*status =3D POWER_SUPPLY_STATUS_DISCHARGING;
> +	else if (sm5714_fg_soc_permille(soc) >=3D 990)
> +		*status =3D POWER_SUPPLY_STATUS_FULL;
> +	else if (ma > 0)
> +		*status =3D POWER_SUPPLY_STATUS_CHARGING;
> +	else
> +		*status =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
> +
> +	return 0;
> +}
> +
> +static int sm5714_fg_get_property(struct power_supply *psy,
> +				  enum power_supply_property psp,
> +				  union power_supply_propval *val)
> +{
> +	struct sm5714_fg *fg =3D power_supply_get_drvdata(psy);
> +	unsigned int raw;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_STATUS:
> +		return sm5714_fg_get_status(fg, &val->intval);

[Severity: Medium]
Can sm5714_fg_get_status() pass a NULL fg->psy to
power_supply_am_i_supplied()?

__power_supply_register() exposes the sysfs attributes and increments
psy->use_cnt before devm_power_supply_register() returns and assigns
fg->psy in sm5714_fg_probe():

CPU0                              CPU1
sm5714_fg_probe()
  devm_power_supply_register()
    __power_supply_register()
      device_add()
      atomic_inc(&psy->use_cnt)
                                  power_supply_show_property()
                                    sm5714_fg_get_property(psy, ...)
                                      sm5714_fg_get_status(fg, ...)
                                        power_supply_am_i_supplied(fg->psy)
                                          ...
                                          __power_supply_is_supplied_by()
                                            supply->supplied_from
                                            <-- NULL pointer dereference
  fg->psy =3D ...

Passing psy from sm5714_fg_get_property() into sm5714_fg_get_status()
would avoid reading fg->psy before it is initialized.

[ ... ]

> +MODULE_AUTHOR("Asdlerto Korry <korryasdlerto@gmail.com>");
> +MODULE_DESCRIPTION("Silicon Mitus SM5714 fuel gauge driver");
> +MODULE_LICENSE("GPL");

[Severity: High]
Does building this driver with CONFIG_BATTERY_SM5714=3Dm fail in modpost due
to a missing MODULE_IMPORT_NS("IIO_CONSUMER")?  devm_iio_channel_get() and
iio_read_channel_processed() are exported in the IIO_CONSUMER symbol
namespace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-sm5714-fue=
l-gauge-v1-0-b9d163fff6ff@gmail.com?part=3D2

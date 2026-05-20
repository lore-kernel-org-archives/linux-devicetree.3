Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F134D371CEA
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779300270; cv=none; b=AFdccf74CjOcCjaIB3Flfnl9n0yp9qg+fw7MoLL8jiSEkqzKU9jbP0b4UPmwYSExKMFkBFYFlUzn+QTcw+yVmclGbCplGUh/1b6fJPbaIgILpDe+4xe0BL0YMz00ILBdn06jlQnwFYtfd5J/c3gNTyLxxjbAgHc5Z1n7MfhEG90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779300270; c=relaxed/simple;
	bh=gzL0Aq0Zl80147gwCR0B8Qcc23Rw/CWLEj+S2GyiAYg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jg3OJWKDbv7V7ObNEmFNQJEwDzY5Za6aotSnhnWcMImwPZfGj+/ozeibHEzQ3/RvV+LTgwB8TD5rk5CvHRLceGSQxtBP/spbX3UqepIdxhv0OMUmrNS680/pXXubL2C4k0qBr2jqxSP4K/nZv3B15Cpnm5PppatJUATtp3B2TmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMDvpNv+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMDvpNv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522C31F000E9;
	Wed, 20 May 2026 18:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779300268;
	bh=ZuCwkpXaspuzGMMi+lvRc3n0T/JVH7AjbiaAqe6rXB8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BMDvpNv+svnfDLihE2L/S88Ipe3ti/X+0MyRdQ6K6H8QeT2hrJrafkSFG1NyCpsa5
	 BaDdfo9+X57+MFzqvKwHwTjbiRj2uIg8cVk17F2IclZEXrKL3ipVodSHukmJmZrzkI
	 wKFlLTL2w9y2m4R6UZLFsGmxAKY1lFgmwUjWvvuNERGoXD6E191R6fEgs4KOLLQXA1
	 GGf7qpHOX4dcCGKLq4ApQgo/GRn5jbCZofOP0Tg9PvlCuGrQU76cxiNSnCFGtDKyGz
	 BamqeJs7aThxFhkWr1wD5vTo8D9qQ0+z5XeFqEIu4+ybE3hlDinGmLQObPdm7EfRl0
	 sUnmpi+V0DA+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] thermal/drivers: airoha: Add support for AN7583
 Thermal Sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520155525.22239-8-ansuelsmth@gmail.com>
References: <20260520155525.22239-8-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 18:04:27 +0000
Message-Id: <20260520180428.522C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Potential 32-bit signed integer overflow in temperature calculatio=
n.
- [Medium] The MUX_SENSOR register field width is too narrow to hold all de=
fined sensor indices, leading to silent truncation.

Pre-existing issues:
- [Critical] Missing `remove` callback causes devres Use-After-Free of ther=
mal zone.
- [High] Unprotected read-modify-write sequence on a shared syscon register=
 creates a race condition.
- [High] Unchecked regmap read operations lead to use of uninitialized stac=
k variables.
- [High] IRQ requested before thermal zone pointer is initialized leads to =
potential NULL pointer dereference.
- [High] Missing NULL check on `device_get_match_data()` leads to kernel pa=
nic on sysfs bind.
--

commit 57a01e256a4324da608f512eaa2939419b755b71
Author: Christian Marangi <ansuelsmth@gmail.com>

thermal/drivers: airoha: Add support for AN7583 Thermal Sensor

Add support for Airoha AN7583 Thermal driver. This apply similar logic
on how to read the temperature but totally drop support for the
PTP_THERMAL subsystem.

> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_th=
ermal.c
> index 249abbbd46bcd..c84b5c36e8803 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c
[ ... ]
>  static void airoha_set_thermal_mux(struct airoha_thermal_priv *priv,
> -				   int tdac_idx)
> +				   int tdac_idx, int sensor_idx)
>  {
>  	u32 pllrg;
> =20
[ ... ]
>  	/* Configure Thermal ADC mux to tdac_idx */
> -	regmap_field_write(priv->chip_scu_fields[AIROHA_THERMAL_MUX_TADC],
> -			   tdac_idx);
> +	if (priv->current_adc !=3D tdac_idx) {
> +		regmap_field_write(priv->chip_scu_fields[AIROHA_THERMAL_MUX_TADC],
> +				   tdac_idx);
> +		priv->current_adc =3D tdac_idx;
> +	}
> =20
>  	/* Restore PLLRG value on exit */
>  	regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT, pllrg);

[Severity: High]
This is a pre-existing issue, but since this patch significantly increases
the frequency of this function for runtime polling, is there a race
condition with the read-modify-write sequence on the shared syscon register?

The regmap lock only protects individual reads and writes, making the
unlock-modify-lock sequence on EN7581_PLLRG_PROTECT non-atomic. If another
driver sharing the SCU performs operations concurrently, could they race and
leave the protection register permanently unlocked or restore an incorrect
state?

[Severity: High]
This is a pre-existing issue, but does the unchecked regmap read
operation lead to using an uninitialized stack variable?

In airoha_set_thermal_mux(), if the regmap_read() for EN7581_PLLRG_PROTECT
fails, the pllrg variable remains uninitialized and is later written back to
the hardware protection register.

Similarly, in airoha_get_thermal_ADC(), an unchecked regmap_field_read()
leaves the stack variable uninitialized before being returned and used in
temperature calculations.

[ ... ]
> +static int an7583_thermal_get_temp(struct thermal_zone_device *tz, int *=
temp)
> +{
> +	struct airoha_thermal_priv *priv =3D thermal_zone_device_priv(tz);
> +	int sensor_idx;
> +	int delta_diode, delta_gain;
> +	int coeff, slope, offset;
> +
> +	int diode_zero, diode_d0, diode_d1;
> +
[ ... ]
> +	delta_diode =3D diode_d1 - diode_d0;
> +	delta_gain =3D (delta_diode * coeff) / 100 + (diode_zero - diode_d1);
> +	if (!delta_gain)
> +		return -EINVAL;
> +
> +	*temp =3D (slope * delta_diode * 10) / delta_gain - offset * 10;
> +	*temp *=3D 100;
> +
> +	return 0;
> +}

[Severity: High]
Can the multiplication of slope and delta_diode overflow a 32-bit signed
integer?

The slope variable can be up to 8390, and delta_diode is derived from the
difference of two 32-bit ADC readings. A delta_diode value exceeding 25,595
would cause the (slope * delta_diode * 10) calculation to overflow the sign=
ed
32-bit maximum limit (2,147,483,647), leading to undefined behavior and
wildly incorrect temperature readings.

[ ... ]
> +static const struct thermal_zone_device_ops an7583_tz_ops =3D {
> +	.get_temp =3D an7583_thermal_get_temp,
> +};
> +
> +static const struct reg_field an7583_chip_scu_fields[AIROHA_THERMAL_FIEL=
D_MAX] =3D {
> +	[AIROHA_THERMAL_DOUT_TADC] =3D REG_FIELD(AN7583_DOUT_TADC, 0, 31),
> +	[AIROHA_THERMAL_MUX_TADC] =3D REG_FIELD(AN7583_MUX_TADC, 1, 3),
> +	[AIROHA_THERMAL_MUX_SENSOR] =3D REG_FIELD(AN7583_MUX_SENSOR, 2, 3),
> +};

[Severity: Medium]
Is the AIROHA_THERMAL_MUX_SENSOR register field width too narrow to hold all
defined sensor indices?

The field is defined as a 2-bit field (bits 2 to 3), which can hold a
maximum value of 3. However, the driver enumerates sensor indices up to 6
(AN7583_CPU_TEMP_SENSOR =3D 6). If the driver is extended to use these other
sensors, calling regmap_field_write() with values larger than 3 will silent=
ly
truncate the values, causing the hardware to sample the wrong sensor.

[ ... ]
>  static int airoha_thermal_probe(struct platform_device *pdev)
>  {
>  	const struct airoha_thermal_soc_data *soc_data;
>  	struct airoha_thermal_priv *priv;
>  	struct device *dev =3D &pdev->dev;
>  	int ret;
> =20
>  	soc_data =3D device_get_match_data(dev);
> =20
>  	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> =20
>  	priv->pllrg_protect =3D soc_data->pllrg_protect;

[Severity: High]
This is a pre-existing issue, but could device_get_match_data() return NULL
and cause a kernel panic here?

If the driver is manually bound via sysfs to a device that lacks an
associated device tree node, device_get_match_data() returns NULL, leading
to a NULL pointer dereference when accessing soc_data->pllrg_protect.

> +	priv->current_adc =3D -1;
> =20
>  	if (!soc_data->probe)
>  		return -EINVAL;
> =20
>  	ret =3D soc_data->probe(pdev, priv);
>  	if (ret)
>  		return ret;
> =20
>  	/* register of thermal sensor and get info from DT */
>  	priv->tz =3D devm_thermal_of_zone_register(dev, 0, priv,
>  						 soc_data->thdev_ops);

[Severity: High]
This is a pre-existing issue, but is the IRQ requested before the thermal
zone pointer is initialized?

In en7581_thermal_probe(), which is called by soc_data->probe(), the hardwa=
re
interrupt is registered via devm_request_threaded_irq() before priv->tz is
assigned here. If an interrupt fires immediately, en7581_thermal_irq() will
execute and pass the uninitialized NULL priv->tz to
thermal_zone_device_update(), causing a kernel panic.

[Severity: Critical]
This is a pre-existing issue, but does the lack of a remove callback cause
a use-after-free of the thermal zone?

The driver enables hardware interrupts but does not provide a remove functi=
on
to disable them. On module unload or manual unbind, devres cleans up
resources in reverse order: the thermal zone priv->tz is unregistered and
freed before the threaded IRQ handler is freed. If the interrupt fires
during this unbind window, en7581_thermal_irq() executes and accesses the
freed thermal zone.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520155525.2223=
9-1-ansuelsmth@gmail.com?part=3D7

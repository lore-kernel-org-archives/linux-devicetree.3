Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AD8366075
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 17:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779296689; cv=none; b=Hi7PUEMvm0YzoqWQWnOmw2j4O7X4kd5Dt8T43ideu9WMH72C/8jYTVOscHnZLXAARe75EQ/juh6pjWoIbx8BSKM0VmzZdNE0lREI50gYi/zCEKlQX+NIAESqR2I2G/4b90W1GbhUu+6ih+dvxRp1hVfkVj8vuS7rP+KleavR0HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779296689; c=relaxed/simple;
	bh=RyfV0hJkk3uiafdy4V4W1ViPgaCwoFNpaVQ9i6j1maI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z9zlaOQRKF+/4VBLvMC4mLFfgw4dgNs3JEC7UXtNWRkqMxHc4rCzOPBA+cXm0IWu3+W1YZxJDkq8pgK0ThtBH16CLrwEr02ltg34iNByzOi0uaQG9JQelPuvF1Dq3EqjftkD7N4ioGuBUHylHg2sIUE0ch+9zDEu/ncMpMEpDvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bs5c2ubp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bs5c2ubp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BAC1F00893;
	Wed, 20 May 2026 17:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779296688;
	bh=h/V/esAVfFJbW+E7Pli9v7rDm6GIVMXWixK2YHxaarA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bs5c2ubpAcrXLgIszlvpm1zTpT8jepe+f6ktp6iQni81QDoPGi2cHuUxeJTUE7NdN
	 YmrGRNG8y6QM6u4MrEpj6pe13vw4VZE4aknDNHmx+eJzEt5/xZ22Z5E5ATVAtjQLIZ
	 TNk5Mes6tHrn5XiVd6Tl7OlHC5Z81uK+lqJ1ZQP3FRfzFQqrPw7QWUQEuAZa40V7MU
	 B32oujROZZBFVxLmWjrRXN2PnP5iVsESxvf9d59ZfaYEZXnhq7yirMKjKoptS9bYjI
	 g7MMYN4ntvP9ICs1DK1w3HaX3zVVPNM7UhSXkgZ/0G/KHrFrWZ61LcfzV3lNpATqqK
	 0rNIe/oIoy+tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] thermal/drivers: airoha: Generalize probe
 function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520155525.22239-5-ansuelsmth@gmail.com>
References: <20260520155525.22239-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 17:04:47 +0000
Message-Id: <20260520170448.20BAC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Unchecked return value from device_get_match_data() leads to a NUL=
L pointer dereference.

Pre-existing issues:
- [High] IRQ registered before thermal zone initialization is complete, cau=
sing a race condition and devm teardown use-after-free.
--

commit f9520e831723d0643c683a7acaaf6600c5487d0a
Author: Christian Marangi <ansuelsmth@gmail.com>

thermal/drivers: airoha: Generalize probe function

This commit generalizes the Airoha thermal probe function to prepare for
supporting the Airoha AN7583 SoC. It introduces a match_data struct
to define SoC-specific probe and post_probe functions, thermal ops, and
PLLRG protect values.

> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_th=
ermal.c
> index b63893a8997a3..ebb47ae5f2cee 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c
[ ... ]
> @@ -455,18 +463,55 @@ static int airoha_thermal_probe(struct platform_dev=
ice *pdev)
>  		return irq;
> =20
>  	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> -					airoha_thermal_irq, IRQF_ONESHOT,
> +					en7581_thermal_irq, IRQF_ONESHOT,
>  					pdev->name, priv);

[Severity: High]
This is a pre-existing issue, but does requesting the interrupt here before
the thermal zone is registered create a race condition?

If an interrupt fires early (e.g., from a pending bootloader interrupt),
en7581_thermal_irq() will run and call thermal_zone_device_update() before
priv->tz is initialized, leading to a NULL pointer dereference.

Additionally, because devres teardown executes in reverse allocation order,
the thermal zone is destroyed before the IRQ is freed during module removal.
Could this lead to a use-after-free if an interrupt fires during teardown
and accesses the freed priv->tz?

[ ... ]
> +static int airoha_thermal_probe(struct platform_device *pdev)
> +{
> +	const struct airoha_thermal_soc_data *soc_data;
> +	struct airoha_thermal_priv *priv;
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	soc_data =3D device_get_match_data(dev);
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->pllrg_protect =3D soc_data->pllrg_protect;

[Severity: High]
Does this code lead to a NULL pointer dereference if the driver is bound
manually via sysfs?

device_get_match_data() returns NULL when the driver is bound manually
rather than through Device Tree matching. If soc_data is NULL, accessing
soc_data->pllrg_protect will trigger a kernel panic. Should soc_data be
checked for NULL before being dereferenced?

> +
> +	if (!soc_data->probe)
> +		return -EINVAL;
> +
> +	ret =3D soc_data->probe(pdev, priv);
> +	if (ret)
> +		return ret;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520155525.2223=
9-1-ansuelsmth@gmail.com?part=3D4

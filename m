Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B814AD0D
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 13:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304868; cv=none; b=BoWfyB9sqMJf8WIzCCH4kdFX+GU8dOS+K2obc5gP+Plns00oaQznOZfXMvR/WKc4D0mGBsjlhn7ZWlO0pqFeQTQO1dAqdYc1LhiCcQALplPWyCmEZbhXUM2rH+F9MnNc9zHVTrPLGLH2d7yjRJYkChC9Y0EaWQdqW8bciZjmqqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304868; c=relaxed/simple;
	bh=7jU/ODjRHshAxmYNzczr9+S8Qn0/QlPUz22OfPNI2XU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=btyMz1U3dtWe/iQmnFWa8KvdHKMO4bSMEVTX+lCwdlrjEowMjLjiqmNbl4ntSLzFFmdJiGW6zHQnT2k7XcC6LBHcsKp6f3DGDwtizjZkpRwQWkw47UfrDrfvPhdJZvqI9j6tYd/JgQXODIO9Hng8pcsWykOTF9i5Q6WV8W7Ul2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcHUqp5e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcHUqp5e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE44B1F000FF;
	Sun, 13 Sep 2026 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789304867;
	bh=SBnrjAY5zsGNkRMgnWNWc5IQ9Jc6+RArbVl95FJvjA0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gcHUqp5e12cIKi78g8B0Qpj5qU3UGMEMEPBJowpXP5WOFs2yn95cOjdAZDUHQTUqe
	 NfEDhYlN1g/9RLtGVzlGQ1lq9ckEgTk+CsbGCgeSkKx1NycTSck+EpdyonDbxoAfMg
	 bZ5jzKSfCMMcjnjcDYmOiRSHl1sNee20nJCfeSp+7n46t4u7v3A8Fc45qpRBt68eFz
	 wmU6wgcqbhAAVwneJe6OrGoyxgTm3G2rRv14CGY4NzTWq+bL/Z4RwS0jOS31VDocPw
	 7xUsVH5rb7PJUCXjBVxPUj0aIejP0BKTGJY50xnsoKmKzKGDujh4GBPI5T2PjNOccx
	 nOkJUxw6WqPRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] thermal/drivers/airoha: Register a thermal zone per
 AN7583 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitaliy Sochnev" <sochnev.v.74@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260913145226.34643-5-sochnev.v.74@gmail.com>
References: <20260913145226.34643-1-sochnev.v.74@gmail.com>
 <20260913145226.34643-5-sochnev.v.74@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 13:07:46 +0000
Message-Id: <20260913130746.CE44B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] IRQ requested before thermal zone is registered and freed after th=
ermal zone is destroyed, causing a race window that can result in a NULL po=
inter dereference or Use-After-Free.
--

commit 749e5e99054c0cc567360c9cf2985ce4702c7297
Author: Vitaliy Sochnev <sochnev.v.74@gmail.com>

    thermal/drivers/airoha: Register a thermal zone per AN7583 sensor
   =20
    AN7583 has three temperature sensors and the driver has constants for
    all of them, but it registers one zone and reads only the bandgap senso=
r.
   =20
    Register a zone per sensor. With one thermal sensor cell the cell
    selects the sensor. Device trees without cells describe only zone 0 and
    keep reading the bandgap sensor. EN7581 still registers one zone.

> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_th=
ermal.c
> index d7e4a088b7eac..d996ef539fa14 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c

[ ... ]

> @@ -737,11 +745,31 @@ static int airoha_thermal_probe(struct platform_dev=
ice *pdev)
>  		return ret;
> =20
>  	/* register of thermal sensor and get info from DT */
> -	priv->tz =3D devm_thermal_of_zone_register(dev, 0, priv,
> -						 soc_data->thdev_ops);
> -	if (IS_ERR(priv->tz)) {
> -		dev_err(dev, "register thermal zone sensor failed\n");
> -		return PTR_ERR(priv->tz);
> +	for (i =3D 0; i < soc_data->num_sensors; i++) {
> +		struct airoha_thermal_zone *zone;
> +		struct thermal_zone_device *tz;
> +
> +		zone =3D devm_kzalloc(dev, sizeof(*zone), GFP_KERNEL);
> +		if (!zone)
> +			return -ENOMEM;
> +
> +		zone->priv =3D priv;
> +		zone->sensor =3D soc_data->sensors ? soc_data->sensors[i] :
> +						   AIROHA_THERMAL_NO_MUX_SENSOR;
> +
> +		tz =3D devm_thermal_of_zone_register(dev, i, zone,
> +						   soc_data->thdev_ops);
> +		if (IS_ERR(tz)) {
> +			/* A DT may describe fewer zones than sensors */
> +			if (i && PTR_ERR(tz) =3D=3D -ENODEV)
> +				continue;
> +
> +			dev_err(dev, "register thermal zone %d failed\n", i);
> +			return PTR_ERR(tz);
> +		}
> +
> +		if (!i)
> +			priv->tz =3D tz;

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for the IRQ
handler to dereference priv->tz when it is NULL or freed?

Looking at airoha_thermal_probe(), soc_data->probe() is called before
priv->tz is initialized here. For EN7581, en7581_thermal_probe() requests
the threaded IRQ:

	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
					en7581_thermal_irq, IRQF_ONESHOT,
					pdev->name, priv);

This creates a race window during probe where the IRQ could fire before
priv->tz is assigned, causing a NULL pointer dereference in
en7581_thermal_irq():

	if (update)
		thermal_zone_device_update(priv->tz, event);

Furthermore, because devm_request_threaded_irq() is called before
devm_thermal_of_zone_register(), devres teardown will destroy the thermal
zone before freeing the IRQ. Unbinding the driver via sysfs or encountering
a probe error path could leave the IRQ active while priv->tz points to
freed memory, leading to a Use-After-Free.

>  	}
> =20
>  	platform_set_drvdata(pdev, priv);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913145226.3464=
3-1-sochnev.v.74@gmail.com?part=3D4

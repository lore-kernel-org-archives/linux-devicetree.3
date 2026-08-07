Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C1395AFA
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786098699; cv=none; b=mGMJaBgdwDxZ/6WGf8/r74JIM+OA6IjzJD5V/GTsB+JeqkrdyOGtRDi9zrPcGkKPF8FCc7CHSQcv0BHF/zH/U4CA29nMhrye1gNRfNGqhMV43G+UQcHY8GY3l8ugIIzQLxOlWxbw6SC/oLDKmGbCxcAkrXbb0O2PsgMH8qAefHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786098699; c=relaxed/simple;
	bh=g4SSq64uWaK5ixKZwk0ibZKKBS+K7grpK0GLO1kpU10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XA+tjqgb+g+RF+7Dmv2y+aB3ojDiJFblYswLKGHdCKgF5UqouRoBHaff5cCZCjj81MIj83tzWDCNDw+7m2w3qQmMSW7nXgb10seQfMWEhPuypBd0064wM7bgWBjDFIgE4Bb7CdDykUO/6qciwo/GU3F5nS8kU+toLhxRG1dwsqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijDc6TEm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijDc6TEm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D801F000E9;
	Fri,  7 Aug 2026 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786098695;
	bh=fRJ0cfviIdvtFDruaT9QAYpFpz080IuDSUrgWLfBrZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ijDc6TEmo5fYvSD43CzTbA1PJOC4oaePZMTJZHcudzwD4Rw1+V3lCi0TOGHkWT0B2
	 PGU5wnqhhn9YuyaLicQzL7Ka46ST1cIkuB5wVtS+E2sVJYsUV4SYGkBX7Gs7aAgptI
	 /jAQnffgDlexAGlgm1zVJVPCkex41HyLaZojTUv9xYtSFV/jwprwP0+t3SS6Q3g8YV
	 oNASkVXWteUnS85C9eDXngtuo/sakOVuBNPAWELMw3j718dXxhCZPBAFc89LBBg5sB
	 N0PE1WOHIJ7JYW7lHGhR/kRxHf3fyCcevuEbH6DFkAm83yF2u/7N51EzIyLDJxE7A5
	 uvQQlkn4SDiUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C
 PD controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amber Kao" <amber.kao@ite.com.tw>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-ucsi-itepd-v7-2-998ac11ed0ef@ite.com.tw>
References: <20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw>
 <20260807-ucsi-itepd-v7-2-998ac11ed0ef@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 10:31:33 +0000
Message-Id: <20260807103134.F3D801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Calling `ucsi_unregister()` before `free_irq()` causes a use-after=
-free if an interrupt fires during teardown.
- [High] Returning `IRQ_HANDLED` when an I2C error prevents clearing the ha=
rdware interrupt causes an interrupt storm.
- [Low] The `itepd_id_table` array uses positional initializers for `struct=
 i2c_device_id`, violating I2C subsystem rules.
--

--- Patch [2]: [PATCH v7 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-=
C PD controller driver ---
commit cf5d1292ced23eec9cf9ddfbbd017ff90f67a0b1
Author: Amber Kao <amber.kao@ite.com.tw>

usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD controller driver

This commit adds a UCSI driver for the ITE IT8851 and IT8853 I2C-based
USB Type-C Power Delivery controllers.

> diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi=
/ucsi_itepd.c
> new file mode 100644
> index 0000000000000..d1887435a2e15
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/ucsi_itepd.c

[ ... ]

> +static irqreturn_t itepd_irq_process(struct itepd *itepd)
> +{
> +	u32 cci;
> +	int ret;
> +
> +	ret =3D itepd_process_event(itepd, &cci);
> +	if (ret =3D=3D ITEPD_EVENT_NONE)
> +		return IRQ_NONE;
> +
> +	if (ret < 0)
> +		return IRQ_HANDLED;

[Severity: High]
Could returning IRQ_HANDLED here cause an interrupt storm?

If itepd_process_event() fails due to an I2C error, the hardware interrupt
is never cleared on the controller. Because the IRQ subsystem thinks the
event was serviced, it will unmask the line, causing the level-triggered
interrupt to fire again immediately in an infinite loop.

> +
> +	if (ret =3D=3D ITEPD_EVENT_UCSI)
> +		ucsi_notify_common(itepd->ucsi, cci);
> +
> +	return IRQ_HANDLED;
> +}

[ ... ]

> +static void itepd_remove(struct i2c_client *client)
> +{
> +	struct itepd *itepd =3D i2c_get_clientdata(client);
> +
> +	ucsi_unregister(itepd->ucsi);
> +	free_irq(client->irq, itepd);

[Severity: High]
Can this teardown sequence result in a use-after-free?

The ucsi_unregister() function frees the ucsi->connector array. If an
interrupt fires immediately after this (for example, if disabling
notifications takes time or an event was pending), the IRQ thread runs
and calls ucsi_notify_common().

This would then call ucsi_connector_change(), which attempts to schedule wo=
rk
using the already freed connector structures.

Should free_irq() be called before ucsi_unregister() to synchronize with
the interrupt handler?

> +	ucsi_destroy(itepd->ucsi);
> +}
> +
> +static const struct of_device_id itepd_of_match_table[] =3D {
> +	{ .compatible =3D "ite,it8851" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, itepd_of_match_table);
> +
> +static const struct i2c_device_id itepd_id_table[] =3D {
> +	{ "ucsi_itepd", 0 },

[Severity: Low]
This isn't a bug, but the I2C subsystem guidelines explicitly require
initialized arrays of type struct i2c_device_id to use named initializers
to prevent issues when struct layouts change.

Could this be updated to use named initializers like:
{ .name =3D "ucsi_itepd", .driver_data =3D 0 }?

> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, itepd_id_table);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-ucsi-itepd=
-v7-0-998ac11ed0ef@ite.com.tw?part=3D2

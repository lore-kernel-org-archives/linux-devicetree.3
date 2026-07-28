Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCF528688C
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785202603; cv=none; b=eIHomhj3Myj/RAy2j1O+5q9WrnV4b/xt4WBMYTSULJmNaRhSjrG9j0ncSFJVSPCYbRhn1rKT3d0Pud5psnjMsh12VDUBTBPUesrvI4JrAoO2ebjIK8o4XigebrEo5Vnd4mbogrSHHoOwz/Lg2xBP4BcVJUIv+DoSl69xh4rhB54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785202603; c=relaxed/simple;
	bh=c4o636Q7p6e2qj0wvKdcxgPec5fA+0uwTxqcpIGNN3A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ESoXoxvNSOt3VpYrlOkEzSaGZsVqm9d9QKHeLralBd+D68r9i1pUM8aSHHOn4HsOH2LGbuX2sfpv2Pp9gBGgIaYFEeZAqGH4/bHyHyektTwy7JlTv5drY+6lomqTVzNxpVQT1xMDzKRR2XE3eDg0QduG5k85YNdk0eWjs+w6nQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blDjW+O5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blDjW+O5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2CF61F000E9;
	Tue, 28 Jul 2026 01:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785202602;
	bh=mZKe8UOorDRfEusmNIfeTyJlal8bP68AZ9ED7UlGEiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=blDjW+O5b+lfserx9lygL5dSm7iBtAaiDEevSm9l7f5iuLeZxZekHmMGjrMwvIGd/
	 IZJXePCbJOQZH9ofcVpsmOd9dFb1Kt4pLnfAi4fefRXoPjUbTVA0/HJgApH2aPe63c
	 Vzcep0CVR8bEIyohQlwiBv/GGKz+LIe5CyR06W7+Xr7x+7QQZE1AukXidAQyJuWb9w
	 gIwtUHlfy9w4NaHSoZdhCHZKQ0hiAqV61A1ff2BRnKzzs+AjHjP7T3kMMQ7o99rjxB
	 9X4r3/zch5+b1tknOUSZ68l4dpPGm5v46ns/6rT9dRy2aIzRjWbSNRtnfC2JTHBr1L
	 13ONzDjxIs9Hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: typec: Add support for Parade PS5169 USB
 Type-C redriver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727-ps5169-bup-v1-2-c76a8ef3b239@proton.me>
References: <20260727-ps5169-bup-v1-0-c76a8ef3b239@proton.me>
 <20260727-ps5169-bup-v1-2-c76a8ef3b239@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 01:36:41 +0000
Message-Id: <20260728013641.C2CF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Race condition due to early device registration before hardware an=
d mutex initialization.
- [High] Type-C retimer device is leaked in the `ps5169_probe` error paths,=
 leading to Use-After-Free.
- [High] Probe returns 0 (success) on invalid chip ID, causing double-frees=
 during removal.
- [Medium] Software state cache is updated before hardware programming and =
validation, leading to state desynchronization.
- [Medium] Reading raw I2C bytes into a native `u16` using `regmap_raw_read=
` causes endianness mismatches on big-endian architectures.
- [Medium] The driver is missing `MODULE_DEVICE_TABLE` for device tree matc=
hing, preventing auto-loading.
--

--- Patch [2]: [PATCH 2/2] usb: typec: Add support for Parade PS5169 USB Ty=
pe-C redriver ---
commit 09d82f46ea2293b7e9f9ce40ffd1668b1a047cd2
Author: Esteban Urrutia <esteuwu@proton.me>

usb: typec: Add support for Parade PS5169 USB Type-C redriver

Add driver for the Parade PS5169, an USB Type-C redriver capable of
handling 10Gb/s USB signals and 8.1Gb/s DisplayPort signals.

> diff --git a/drivers/usb/typec/mux/ps5169.c b/drivers/usb/typec/mux/ps516=
9.c
> index 0000000000000..3ee04843fa2dc
> --- /dev/null
> +++ b/drivers/usb/typec/mux/ps5169.c
[ ... ]
> @@ -242,28 +242,21 @@ static int ps5169_retimer_set(struct typec_retimer =
*retimer, struct typec_retimer_state *state)
>  	struct redriver *ps5169 =3D typec_retimer_get_drvdata(retimer);
>  	struct typec_mux_state mux_state;
>  	int ret =3D 0;
> =20
>  	mutex_lock(&ps5169->lock);
> =20
>  	if (ps5169->mode !=3D state->mode) {
>  		ps5169->mode =3D state->mode;
> =20
>  		if (state->alt)
>  			ps5169->svid =3D state->alt->svid;
>  		else
>  			ps5169->svid =3D 0; // No SVID
> =20
>  		ret =3D ps5169_set(ps5169);
>  	}

[Severity: Medium]
Does this risk desynchronizing the software state from the hardware?

If ps5169_set() fails and returns an error, the internal state (ps5169->mod=
e)
remains updated. If the caller subsequently requests the exact same mode
again, the equality check evaluates to false.

This causes the driver to bypass validation and falsely report success while
leaving the hardware unconfigured. Should the state update be rolled back on
error, or deferred until after a successful hardware update?

>  	mutex_unlock(&ps5169->lock);
[ ... ]
> @@ -361,54 +354,47 @@ static int ps5169_probe(struct i2c_client *client)
>  	ret =3D regulator_enable(ps5169->vcc);
>  	if (ret) {
>  		dev_err(dev, "Failed to enable vcc-supply\n");
>  		goto mux_put;
>  	}
> =20
>  	/* Reset the retimer */
>  	gpiod_set_value(ps5169->reset_gpio, 1);
>  	usleep_range(1000, 1500);
>  	gpiod_set_value(ps5169->reset_gpio, 0);
>  	usleep_range(10000, 11000);
> =20
>  	ret =3D regmap_raw_read(ps5169->regmap, PS5169_CHIP_ID_REG, &chip_id, s=
izeof(chip_id));

[Severity: Medium]
Does reading raw I2C bytes directly into a native u16 variable cause endian=
ness
mismatches on big-endian architectures?

regmap_raw_read() performs a raw byte copy, so reading a 2-byte register
directly into chip_id produces a byte order mismatch on big-endian systems.
Could a standard regmap read or explicit endianness handling be used here?

>  	if (ret) {
>  		dev_err(dev, "Failed to read chip ID\n");
>  		goto vcc_disable;
>  	}
> =20
>  	/* Compare chip IDs */
>  	if (chip_id !=3D PS5169_CHIP_ID) {
>  		dev_err(dev, "Unexpected chip ID 0x%04x\n", chip_id);
>  		goto vcc_disable;
>  	}

[Severity: High]
Is it intended to return success when the chip ID is invalid?

The code jumps to vcc_disable without updating the ret variable. Since the
preceding regmap_raw_read() just succeeded, ret equals 0. The probe function
falsely returns success to the driver core while releasing resources, leavi=
ng
a crippled device object that might be double-freed on removal.

Should ret be set to -ENODEV before the goto?

>  	/* Read chip revision */
>  	ret =3D regmap_raw_read(ps5169->regmap, PS5169_CHIP_REVISION_REG, &chip=
_revision,
[ ... ]
> @@ -395,21 +381,14 @@ static int ps5169_probe(struct i2c_client *client)
> =20
>  	/* orientation-switch */
>  	switch_desc.drvdata =3D ps5169;
>  	switch_desc.fwnode =3D dev_fwnode(dev);
>  	switch_desc.set =3D ps5169_switch_set;
> =20
>  	ps5169->sw =3D typec_switch_register(dev, &switch_desc);
>  	if (IS_ERR(ps5169->sw)) {
>  		ret =3D dev_err_probe(dev, PTR_ERR(ps5169->sw), "Failed to register sw=
itch\n");
>  		goto vcc_disable;
>  	}
> =20
>  	/* retimer-switch */
>  	retimer_desc.drvdata =3D ps5169;
>  	retimer_desc.fwnode =3D dev_fwnode(dev);
>  	retimer_desc.set =3D ps5169_retimer_set;
> =20
>  	ps5169->retimer =3D typec_retimer_register(dev, &retimer_desc);
>  	if (IS_ERR(ps5169->retimer)) {
>  		ret =3D dev_err_probe(dev, PTR_ERR(ps5169->retimer), "Failed to regist=
er retimer\n");
>  		goto switch_unregister;
>  	}
[ ... ]
>  	ps5169_init(ps5169);
> =20
>  	mutex_init(&ps5169->lock);
> =20
>  	i2c_set_clientdata(client, ps5169);
> =20
>  	return 0;

[Severity: High]
Does registering the typec_switch and typec_retimer before initializing the
hardware and mutex expose a race window?

The subsystem can immediately invoke the .set callbacks (ps5169_switch_set,
ps5169_retimer_set) before probe() finishes, causing the callbacks to attem=
pt
to lock an uninitialized mutex and write to unconfigured hardware.

Should ps5169_init() and mutex_init() happen before device registration?

>  switch_unregister:
>  	typec_switch_unregister(ps5169->sw);
> =20
>  vcc_disable:
>  	regulator_disable(ps5169->vcc);

[Severity: High]
Does this error path leak the retimer device?

If property parsing (like parade,dp-eq-level) fails after
typec_retimer_register() succeeds, the function jumps to the switch_unregis=
ter
label. The cleanup path unregisters the switch but omits calling
typec_retimer_unregister().

The retimer device object remains registered with the Type-C framework while
the parent memory block is freed, leading to a potential use-after-free.

>  mux_put:
>  	typec_mux_put(ps5169->typec_mux);
[ ... ]
> @@ -518,17 +490,10 @@ static void ps5169_remove(struct i2c_client *client)
>  	typec_mux_put(ps5169->typec_mux);
>  	typec_switch_put(ps5169->typec_switch);
>  }
> =20
>  static const struct of_device_id ps5169_of_match_table[] =3D {
>  	{ .compatible =3D "parade,ps5169" },
>  	{ },
>  };

[Severity: Medium]
Is the driver missing MODULE_DEVICE_TABLE for device tree matching?

The kernel build system will not extract the device tree match information =
into
the module aliases without it, which might prevent user-space tools like ud=
ev
from auto-loading this driver when the hardware is discovered.

>  static struct i2c_driver ps5169_driver =3D {
>  	.driver =3D {
>  		.name =3D "ps5169",
>  		.of_match_table =3D ps5169_of_match_table,
>  	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-ps5169-bup=
-v1-0-c76a8ef3b239@proton.me?part=3D2

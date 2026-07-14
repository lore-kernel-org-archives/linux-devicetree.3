Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA1544DB69
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032092; cv=none; b=fPiBEqe5QV45nptWQn+zdKHNIXE+X5AAzPkP2rvoAtLniDwN5sacAMaQcylCQy/P3yj4C2y62g3KYNIj6Fe7f7SvGFh6g1/07d32Y8Umh0fAePt6zo3J+937Ffs5fAYyFKjJCuflAFyfHh+EZGdyv7zLnGol0O9LJGQ4yMj2Kv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032092; c=relaxed/simple;
	bh=dm3z8ROHGpjKN2MQ2Ze4ti8mwj7gZohZJE4lG80erJc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hKqzGN0KgeebEDCEqVOnXNbL4Cd62ZvfuBzuKQYZwZlMyoc+q3J979jtgiOQBF/ij0oZrGrV7mkQM2doseGeAnG1dKOmcYIZoWJiH39rpa+pU9eNJYEDgQ6G3TXgFMGB1teRRypRmdVVN7YHv7TlpdbKJMLWZZLwxlOfo4SH+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHacwydq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHacwydq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA891F000E9;
	Tue, 14 Jul 2026 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784032088;
	bh=w1p7OhSQn+YTuwPk4ub8w6RPZ/NgbQLs+vPe2s1E1sM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PHacwydq2F02Ax8pPLSFxkQiHHvW+NPFfu1YvfC2NI/rTnx8LJYAuInfdNFrjaLct
	 Xh3hMTzFhq1S1KuHMNVpZrv/w80XRyFJwr5xm1qYs3DQCQ5UFRL4npdUvhIH0Rx6Bm
	 dEmNBRDZAq0XRaA8vZ1fAOJHQBVF/4IXOw19O1T+9UqRs2tKDiOG/z1C78NYT+W/CO
	 +JDGmR9tNszMJGv3opn8vi9EuPZrBDVJDQalDwzJ/PiC/LrtJGtFjL0SeGQ4z10yjB
	 EX4CXk5IoULTxTuAFbRAyU8N8nT/ITdFNioLuxdMP1TnyrAl7ao/lkmMjOIpNj84nz
	 Obfbg+ci0K6nA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: bletchley: Add second source
 PCA9532 LED controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmo Chou" <chou.cosmo@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714120816.1504058-3-chou.cosmo@gmail.com>
References: <20260714120816.1504058-1-chou.cosmo@gmail.com>
 <20260714120816.1504058-3-chou.cosmo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 12:28:07 +0000
Message-Id: <20260714122808.3FA891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The GPIO polarity flags for the alternative PCA9532 LED controller=
s are incorrectly copied verbatim from the PCA9552 nodes, resulting in inve=
rted physical LED behavior.

Pre-existing issues:
- [High] The `leds-pca9532` driver ignores I2C write errors during initiali=
zation, causing it to successfully probe even if the hardware is completely=
 absent, introducing phantom GPIOs and sysfs collisions.
--

--- Patch [2]: [PATCH 2/2] ARM: dts: aspeed: bletchley: Add second source P=
CA9532 LED controllers ---
commit be0c2ca182f94bd5b992463cc968b5837bdf819b
Author: Cosmo Chou <chou.cosmo@gmail.com>

ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
   =20
This patch adds alternative PCA9532 LED controllers at address 0x66 to supp=
ort
boards populated with the PCA9532 instead of the primary PCA9552 at 0x67.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> index a966be69ff27d..86e2b5aecdf94 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
[ ... ]
> @@ -113,6 +114,58 @@ led-7 {
>  		};
>  	};
> =20
> +	fan_gpio_leds_alt {
> +		compatible =3D "gpio-leds";
> +		led-0 {
> +			label =3D "fan0_blue";
> +			retain-state-shutdown;
> +			default-state =3D "on";
> +			gpios =3D <&fan_leds_alt 8 GPIO_ACTIVE_HIGH>;

[Severity: High]
Does this GPIO polarity result in inverted physical LED behavior?

In drivers/leds/leds-pca955x.c, pca955x_gpio_set_value() maps val =3D 1 to
PCA955X_LS_LED_OFF (HI-Z). Conversely, in drivers/leds/leds-pca9532.c,
pca9532_gpio_set_value() maps val =3D 1 to PCA9532_ON (LOW).=20

Since the PCA9532 driver maps the logical value to the opposite physical
state compared to PCA9552, should this be GPIO_ACTIVE_LOW instead?

> +		};
[ ... ]
> +	sled1_gpio_leds_alt {
> +		compatible =3D "gpio-leds";
> +		led-0 {
> +			label =3D "sled1_amber";
> +			retain-state-shutdown;
> +			default-state =3D "keep";
> +			gpios =3D <&sled1_leds_alt 0 GPIO_ACTIVE_LOW>;

[Severity: High]
Similarly, should this be GPIO_ACTIVE_HIGH?=20

Since the physical circuit behavior for the PCA9532 differs from the PCA955=
2,
using the same polarity here might cause the LEDs to turn off when userspace
expects them to be on.

> +		};
[ ... ]
> @@ -957,6 +1214,38 @@ fan_leds: pca9552@67 {
>  		"","","","",
>  		"","","","";
>  	};
> +
> +	fan_leds_alt: pca9532@66 {
> +		compatible =3D "nxp,pca9532";
> +		reg =3D <0x66>;
> +		gpio-controller;

[Severity: High]
This isn't a bug introduced by this patch, but will this cause phantom GPIOs
and sysfs collisions on boards where the PCA9532 is not populated?

The leds-pca9532 driver ignores I2C write errors during initialization:

drivers/leds/leds-pca9532.c:pca9532_configure() {
    ...
		i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, i),
			data->pwm[i]);
		i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, i),
			data->psc[i]);
    ...
}

Because it doesn't check the return codes, it will successfully probe even =
if
the hardware is absent. This will register a phantom gpiochip with identical
gpio-line-names on the same I2C bus.=20

Subsequent user-space GPIO reads from this phantom chip will resolve to
truncated NAK errors, yielding bogus hardware states for critical sensors l=
ike
fan presence and power-good.

> +		#gpio-cells =3D <2>;
> +
> +		gpio-line-names =3D
> +		"presence-fan0","presence-fan1",
> +		"presence-fan2","presence-fan3",
> +		"power-fan0-good","power-fan1-good",
> +		"power-fan2-good","power-fan3-good",
> +		"","","","",
> +		"","","","";
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714120816.1504=
058-1-chou.cosmo@gmail.com?part=3D2

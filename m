Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692DF2DECA8
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 03:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232215; cv=none; b=OuhEUrPl7fkrkg5nWloEcgNHbIsWsQISrQDRhovJ7LPLXBMNf7yAgcv8qIbBwg2rlppPancOK+rtMcJ70OfiOc7zFw0+TlivquKcbuqMQ4dsvcDWEeFRcPOZFCHThr4bP64SxmrquZ9XoyemzISu7KnUIl/9kjpHd8/WjY/M+Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232215; c=relaxed/simple;
	bh=7VJs4tafunwi1sFWAwAvwathyHbOWX+WFuSgh/a+XZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ulHaYshCmmDGSslwQQxhMEPvVsR3JuQptK5DGy8aTo94z94w2L7ihoCy5M/AIuaKNGjW5DDeaAKOlaVErh+XZM6vdU33Hm22B2W/eL63+i1LamnBd0hBKpJTiJfiBXjGz3ZWUX9E35vmwzlUMYFDqP852PodTN7nMPmvvIkFodY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WksHyi9Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WksHyi9Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500B91F000E9;
	Tue,  1 Sep 2026 03:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788232211;
	bh=H282xlxkOmHqu5MAtc/cbezCMe6DJWDkUjP6DlPQXkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WksHyi9Z5QuQXCMrd9XkBdAf41fat0OI5KFY0TzZS6GpnKdS6/CtdfgbLBxEX6bDd
	 9yz+fRUYT+3f+Mf091oeJL2l2fRtvCJD3NcF59eIGOQ3do6RIVYJOr1kdQ5COGgEJ7
	 /Db6Jh4BhytEv8L5i7n3VB6obUzI+wdeOI0Y0DDa/zSmJ08v/sQSNMFHk3ZyZzaO2L
	 v7NoYdnxqvLZRhJI5ytGEaKwPHKWrXKdhVraIHTtfrpq8zoapnRD8R0KgE86XIFsS3
	 22z9smPHRNnRS22Z7HrhSpllh1Rgobzdm2dFypUucLDyNWbNLK3bB+fd1u598zzdCa
	 Sex1P4f2fQYHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901025311.955936-1-rosenp@gmail.com>
References: <20260901025311.955936-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 03:10:10 +0000
Message-Id: <20260901031011.500B91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing `pinctrl-names` property causes the `pinctrl-0` configur=
ation to be ignored.
- [Medium] Routing the PHY Wake-On-LAN interrupt to `gpio-keys` causes the =
interrupt pin to get stuck low after the first wakeup.
--

commit a86b93404f7467809ab8336ca71556ed631044f5
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: helios4: add Wake-on-LAN gpio key

Add a gpio-keys node exposing Wake-On-LAN on its gpio0 18 input, allowing
the board to be woken from suspend.

> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index ec134e22bae3e..8e30963b9b409 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -87,6 +87,18 @@ fault-led {
>  		};
>  	};
> =20
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-0 =3D <&microsom_phy0_int_pins>;

[Severity: Medium]
Will this pinctrl configuration be ignored by the kernel?

During device probe, pinctrl_bind_pins() in the driver core looks for a sta=
te
named 'default'. Because pinctrl-names is omitted, the device tree parser
assigns the state the default name '0'.

Does this cause the core to fail to find 'default', log 'no default pinctrl
state', and skip applying the pin multiplexing configuration?

> +
> +		wol {
> +			label =3D "Wake-On-LAN";
> +			linux,code =3D <KEY_WAKEUP>;
> +			gpios =3D <&gpio0 18 GPIO_ACTIVE_LOW>;
> +			wakeup-source;

[Severity: Medium]
Could routing the PHY Wake-On-LAN interrupt to gpio-keys cause the interrupt
pin to get stuck low after the first wakeup?

When the Marvell PHY receives a WoL magic packet, it pulls the INTn pin low,
and the gpio-keys driver wakes the system via a falling edge interrupt.
However, because the PHY node lacks an interrupts property, the PHY driver
operates in polling mode and never registers an interrupt handler to read t=
he
PHY interrupt status register.

Since the internal interrupt state is never cleared, will the INTn pin rema=
in
permanently stuck low, causing WoL to silently fail on all subsequent
attempts until the device is rebooted?

> +		};
> +	};
> +
>  	io-leds {
>  		compatible =3D "gpio-leds";
>  		pinctrl-names =3D "default";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901025311.9559=
36-1-rosenp@gmail.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FD52E7F3E
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782666829; cv=none; b=Mmtcs4Ft0xBl7DM9zF5FVWjPERaiDPcbTDRncz6js0gGhgChEMJrPZkXphU99+GbKt01gpY64eOAbUgaOmYcoKWnrtCxN81tDL961UA6zBinKgSOQB9QuUCWpU5Wr20eQILkJQ8mt+gndOe76HrkAHZj0/H6eeI76+18OULf2Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782666829; c=relaxed/simple;
	bh=uP1Yabs5FBje+hf6Y3hP5i6iXJTIZY8PaYyprsqgSkA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B1/W3jFpnVInux8POW5RTOvQjhahQPfsc+iKz3cp5bt19IJ0FcBcMVD0HJaIrEBoGDO53Pgbv4YsdIa2+GTBqEvXs01bR5hQgd03TFLqQt52FXf1ANBS+PlN6t/BYAxmBzdKB6Ux2S/o5O6QG17kFzz3G4AM4nyqBPUt7zv6Is4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8O4sz0x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8O4sz0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C92C1F000E9;
	Sun, 28 Jun 2026 17:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782666826;
	bh=j/MlotHbDELNzsvocip4GzcgIGRvXyHvXAX1oWzhQmU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F8O4sz0xqQ8CgvTk6n3zCio4Anw1L+TiCRA6MIyP87YnzEQtIhT07wklnlJhOqLyy
	 R03+Iz/iCBYsSTDcr8Kbcmtcp/vX31qCQqcoqpoVEUHg5Bxo3moanxKJpgBmKSm3Y0
	 PVPwcRgOQrhZgK46wugKF5IWPfOL21+ZhVhtPNxV4lA/9ByhiWvZpAapYCtQVZvpXa
	 DX6vv+oaVfmBs8Xn+os7Mea6dYbd6S1QTujElIZKcsHINB7tFXGkNSCP3rm/B4+8Ar
	 Aq3jzF1HkcVnUjdBAAuKXo9JYhOdrPQ6X1KH7YgqRZha2w7K1KmUDabrI37HtIw8TZ
	 ufTkKjJ60rk9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/4] arm64: dts: am62p5-var-som-symphony: add
 touchscreen support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <8c1c298100af75da363ec03126c31fead6dba947.1782665899.git.stefano.r@variscite.com>
References: <cover.1782665899.git.stefano.r@variscite.com>
 <8c1c298100af75da363ec03126c31fead6dba947.1782665899.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 17:13:45 +0000
Message-Id: <20260628171346.4C92C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to configure both the interrupt and wa=
keup pins, but the device tree node and pinctrl only configure the interrup=
t pin, lacking a wakeup pin configuration.
--

commit 6d6b56a3161a61ca2f1a68dce1765826d0594c86
Author: Stefano Radaelli <stefano.radaelli21@gmail.com>

arm64: dts: am62p5-var-som-symphony: add touchscreen support

This commit adds support for the capacitive touchscreen on the Symphony
carrier board. It describes the FT5x06 touchscreen controller, configures
its pins, and marks it as a wakeup source.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts b/arch=
/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
> index 5ba4ed56755b4..5c41647ff43fa 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
[ ... ]
> @@ -293,6 +293,21 @@ &main_i2c1 {
>  	clock-frequency =3D <400000>;
>  	status =3D "okay";
> =20
> +	/* Capacitive touch controller */
> +	ft5x06_ts: touchscreen@38 {
> +		compatible =3D "edt,edt-ft5206";
> +		reg =3D <0x38>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_captouch_pins>;
> +		interrupt-parent =3D <&main_gpio1>;
> +		interrupts =3D <16 IRQ_TYPE_EDGE_FALLING>;
> +		touchscreen-size-x =3D <800>;
> +		touchscreen-size-y =3D <480>;
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +		wakeup-source;
> +	};

[Severity: Medium]
The commit message claims to configure both the interrupt and wakeup pins,
but ft5x06_ts only configures the interrupt pin in its pinctrl.

Does this node also need a wake-gpios property to match the commit message
and properly wake the device from hibernation?

[ ... ]
> @@ -307,6 +322,12 @@ &main_mcan0 {
>  };
> =20
>  &main_pmx0 {
> +	pinctrl_captouch_pins: main-captouch-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62PX_IOPAD(0x01b8, PIN_INPUT, 7) /* (E20) SPI0_CS1.GPIO1_16 */
> +		>;
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782665899.gi=
t.stefano.r@variscite.com?part=3D3

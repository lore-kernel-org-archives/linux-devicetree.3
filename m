Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE715E97
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 05:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784439318; cv=none; b=nzVyWaDgAYZC7m76sJhXRjL3QzVVmGIz2qjhH0IoyEd6+nbAHlKOdNZU10dDBulpEsJrkYl5Nuh4iDp6E9Mu3CoWinS/ZPeNcC8404NcdUf485FGwqHB2a44xFRVcQarWMG9c4wabkqo7D8AhwqfwvdnSQlwFuZ8FFnkcMThxic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784439318; c=relaxed/simple;
	bh=yF98hPJjZ1aeof3ryTR0b9qSCW4WkGDoMOncAC/dofw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bKyRXjAbk2DK29LeKIjmbFI1mz/rRebrT6Jnpo1S+Rhy3o008QnB5HniJgrBdJPFzRVr6Q/R7/HnzaLlDDssFcn+ytwDeGkRRXxZo/SP97Jax8SN6GQffC5UIbwrsYmaQPTAzJ0ngd4RADZ1RSuvIi8HpDlxZJOGhve/Yj/YGmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEza826U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEza826U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD491F000E9;
	Sun, 19 Jul 2026 05:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784439317;
	bh=sIrItEMENqQYXHc/w9FlUZEK5u2LOYFAn/cbp4/QeZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WEza826UTvDTprTMMQQQ1cJLBWJSShf5XCxVKlBRYQNSsjq3vMLgFvWuXgdHYxTo8
	 gwVCivyAwhC9QghtpydsnJOUn0GhGrRJaHdmpoSvPyuKEM/oUcpbBw21S4Qx5ID9kI
	 XpdXfosEaosU0WjrsqdJ8CTg+J772gn91PcUdLUQBFxlBGpiPgUTFK67+SVq/k0rVb
	 rFf+MtlnrYO9bIksfxew5pI9AKiNGy1dA9V/8k4ouC1eYn5zWH2SFmJug9feBwINZh
	 BnvBHvjwDBpuOJShz3zqPgEY9knzagZ0Qu1/MewTuZXCYssvqFGgvz7QuJDeMV/5e8
	 ASXKeLLeeaQsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] powerpc/dts: pdm360ng: Convert ADS7845 touchscreen
 to DT bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260718-ads7846-pdm360ng-v1-2-f318f85cda57@gmail.com>
References: <20260718-ads7846-pdm360ng-v1-0-f318f85cda57@gmail.com>
 <20260718-ads7846-pdm360ng-v1-2-f318f85cda57@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 05:35:16 +0000
Message-Id: <20260719053516.ADD491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `pendown-gpio` property is configured with active-high polarit=
y instead of active-low, which breaks touchscreen input and causes an inter=
rupt storm.
- [High] Legacy platform data and raw initialization code for the touchscre=
en were not removed, leaving dead code and conflicting hardware initializat=
ion.
--

--- Patch [2]: [PATCH 2/3] powerpc/dts: pdm360ng: Convert ADS7845 touchscre=
en to DT bindings ---
commit 1e38d4980520e39bd3a703aa35c53c86099afebb
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

powerpc/dts: pdm360ng: Convert ADS7845 touchscreen to DT bindings

The PDM360NG board is equipped with an ADS7845 touchscreen controller.
Previously, pdm360ng.dts used "ti,ads7846" as a placeholder and relied
on platform data in pdm360ng.c to override the model to 7845.
Update the ts@0 touchscreen node in pdm360ng.dts to use the correct
"ti,ads7845" compatible string along with pendown-gpio and
interrupt-parent properties referencing gpio_pic.

> diff --git a/arch/powerpc/boot/dts/pdm360ng.dts b/arch/powerpc/boot/dts/p=
dm360ng.dts
> index 67c3b9db75d76..69d8b6a0241cb 100644
> --- a/arch/powerpc/boot/dts/pdm360ng.dts
> +++ b/arch/powerpc/boot/dts/pdm360ng.dts
> @@ -176,11 +176,12 @@ psc@11900 {
> =20
>  			/* ADS7845 touch screen controller */
>  			ts@0 {
> -				compatible =3D "ti,ads7846";
> +				compatible =3D "ti,ads7845";

[Severity: High]
Will updating the compatible string here leave conflicting legacy
initialization active in arch/powerpc/platforms/512x/pdm360ng.c?

Since pdm360ng_touchscreen_notifier_call() checks for "ti,ads7846", this
change will cause the notifier to silently fail, abandoning the platform
data injection and leaving it as dead code.

Additionally, pdm360ng_penirq_init() still executes unconditionally on boot,
performing uncoordinated direct memory writes to configure the GPIO
controller interrupt.

Since the touchscreen is now natively bound to the GPIO subsystem via DT,
will this raw memory manipulation conflict with the subsystem's state?

>  				reg =3D <0x0>;
>  				spi-max-frequency =3D <3000000>;
> -				/* pen irq is GPIO25 */
> -				interrupts =3D <78 0x8>;
> +				interrupt-parent =3D <&gpio_pic>;
> +				interrupts =3D <25 0x8>;
> +				pendown-gpio =3D <&gpio_pic 25 0>;

[Severity: High]
Is this pendown-gpio configuration expected to use the GPIO_ACTIVE_HIGH
flag (0)?

The interrupts property correctly defines a level-low trigger (0x8), but the
pendown-gpio property uses 0.

When the pen is down, the driver's gpiod_get_value() in get_pendown_state()
reads the physical 0 and returns a logical 0. This signals to ads7846_irq()
that the pen is up, aborting without executing the SPI sequence needed to
clear the hardware interrupt.

Because the interrupt is level-triggered and never cleared, it fires
continuously.

Should this use GPIO_ACTIVE_LOW (1) instead to prevent an interrupt storm?

>  			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-ads7846-pd=
m360ng-v1-0-f318f85cda57@gmail.com?part=3D2

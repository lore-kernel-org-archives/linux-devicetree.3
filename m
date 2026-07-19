Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3862DE573
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 05:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784439231; cv=none; b=sKps6Xb8jlIE6IjP6N1gNHYDoYJWJ5MwOpdlnY+xuSrTW8v/+xUUSWoOf7wIbCYBMVXiC8k4UMcoizarNoY2tAXbHCPVKgVGyDFkZsFIkStadu6TD575Y3cVXTEQKq2aww8cmghMVpO0dOCCvQjS5xeOy/+zukF8y4vZlcYhSms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784439231; c=relaxed/simple;
	bh=gLRJ9HW0nCdaYng77zh3L3WHwg3O2WCOBn3wysnBmV8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q6h9+LatTxzsGNDNlHXuHcX5iEaIgIZ72wt/xgvAelGmpGk7mBA4uZ96EPOoUqXIORDzSHHTmndIC3gAR9p+yT8JgGyxf2CFSepkKAs1bOFnrI0Rglf9oBKTjCloviLVYMVPpyZBFcI8vioaXlkcVXTi13nWtbMAIrrVCkk3S9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiyXaanS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KiyXaanS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8007F1F000E9;
	Sun, 19 Jul 2026 05:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784439229;
	bh=8yD3WqYRjTbs8iW0dvueBUR/HEKo0zTjXp7Pei+gdNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KiyXaanScngG2XGSUeAbFoBkpLmZdvLNZibMYxulUD++dMqQr8CPC6m9uiaM64Tav
	 WWhEMWK2z+NWpw/0BootNiL6FP7Q8vPukdTPCSqv3gIV3H/rlCfq2JJWLYJvVlZNQ4
	 /pZlIzzcYuKWGfmn560GHp+lgHZFbub2WypBlqkxR+gPlw5jRfxRpL7UxHL/gHmmxp
	 DEVY3ijf7DVU36Qxr4P+Us+kil1z6KDxhbgbDjqooPWdf2WXxsVvPp0QmllPfRKfr3
	 U3h8Cpl7qzNcx9O2irhRe8lTs1OYquMXa9839djsL0QEWRX5EWb1Ntq7frNF4MDguk
	 NzTd1tUGNuNFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] powerpc/512x: Remove pdm360ng platform setup in
 favor of mpc512x_generic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260718-ads7846-pdm360ng-v1-3-f318f85cda57@gmail.com>
References: <20260718-ads7846-pdm360ng-v1-0-f318f85cda57@gmail.com>
 <20260718-ads7846-pdm360ng-v1-3-f318f85cda57@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 05:33:49 +0000
Message-Id: <20260719053349.8007F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing the custom `get_pendown_state` hook exposes an incorrect =
active-high polarity in the device tree, breaking the touchscreen.
--

--- Patch [3]: [PATCH 3/3] powerpc/512x: Remove pdm360ng platform setup in =
favor of mpc512x_generic ---
commit 9b77e36fa4d0feb9318830af9ed4e14fde12adec
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: powerpc/512x: Remove pdm360ng platform setup in favor of mpc512x_g=
eneric

This commit removes the custom platform setup file pdm360ng.c for the
PDM360NG board, stating that its ADS7845 touchscreen is now fully described
in the device tree. It also adds the board to the mpc512x_generic match list
and updates Kconfig to remove the specific board file.

> diff --git a/arch/powerpc/platforms/512x/pdm360ng.c b/arch/powerpc/platfo=
rms/512x/pdm360ng.c
> deleted file mode 100644
> index 8bbbf78bb42bd..0000000000000
> --- a/arch/powerpc/platforms/512x/pdm360ng.c
> +++ /dev/null
> @@ -1,126 +0,0 @@
[ ... ]
> -static int pdm360ng_get_pendown_state(void)
> -{
> -	u32 reg;
> -
> -	reg =3D in_be32(pdm360ng_gpio_base + 0xc);
> -	if (reg & 0x40)
> -		setbits32(pdm360ng_gpio_base + 0xc, 0x40);
> -
> -	reg =3D in_be32(pdm360ng_gpio_base + 0x8);
> -
> -	/* return 1 if pen is down */
> -	return (reg & 0x40) =3D=3D 0;
> -}

[Severity: High]
Will removing this custom pendown handler break the touchscreen due to an
incorrect polarity specified in the device tree?

The custom pdm360ng_get_pendown_state() function returned 1 when the pen was
down, properly inverting the active-low hardware signal:

    return (reg & 0x40) =3D=3D 0;

With this custom code removed, the ads7846 driver falls back to using the
pendown-gpio property defined in arch/powerpc/boot/dts/pdm360ng.dts:

    pendown-gpio =3D <&gpio_pic 25 0>;

Since this property specifies 0 (GPIO_ACTIVE_HIGH) instead of active-low,
gpiod_get_value() will return 0 when the pin is physically low. This causes
ads7846_hard_irq() to incorrectly interpret the pen as being UP and return
IRQ_HANDLED instead of waking the thread, effectively dropping all touch
events.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-ads7846-pd=
m360ng-v1-0-f318f85cda57@gmail.com?part=3D3

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22342476072
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523569; cv=none; b=PtEcyttVwTqmIw5eOX9ZzHsC9VGoOwPitbT/8Yle2/L8IqY/CDLSs4EZ1Q0fyy7lgOMQXARuLGwdvCLS81FPQkR2lkAGZ09jxrawH99gZ5LH7ypOnLjVl6cAWOUad5xKIL6GYh+vm1Lt0jcHqCcn5GBOvdYBhpzYy5VrNLqm9bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523569; c=relaxed/simple;
	bh=uaA8CelQp8j7Pf/A5VpKW0Mm1ehggWo/DX+1qrIDcJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GGaEgbLfdP2D/Wmdw4eRDN2o5KYTeHZlUC15E0Q30hLg/uDpn80neReiOs5PJbl70A8xDBc0CZGA2/7dR/6V6Ftaur8ZAqTaWJP0Kf2d9IM+a2HW2m8FbEmyitT8Zx1NjIpmLDq7DQGCaGOzxLDv10IHlH0ld7gKiMYC0ku22BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kp+xRQOC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kp+xRQOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC381F00A3D;
	Fri,  4 Sep 2026 12:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788523567;
	bh=ZV1TTdH6kTsuNuyt9Er+vVrvBBGQhNQo/WS1cvHMk/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kp+xRQOCNFOlBShj/bBZzFYn5nZY/YavYiGZ4zzjvPuF8PmkJIA4lUDC5uFXmHOzu
	 QqPnjjm/mJ2I11ztGYx09WvAWvpeJyPs+sXjW1KWpJSNEBaarNu8bQGn3DAj1/Mem/
	 NBThMb9ZIDuKbyc6rTR7u6YnzI4HTsKqbvgjIG+fQjeb0ZJ4I7VP4oj2WE074AVgQG
	 mchxhvCyrJFzpRt6VGgVm7HQLN5C4Cu5gixn/8FxlHxbCpZTZeC3o0DG2Ydeo80C81
	 /9MjE6Yg9n4SNMsoa4Oxg7l89OzNBijDF8Xoe4AguJMceq8xMSkuLF6P7JkcWpEvGx
	 QzmCNuWqVnwOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/11] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot:
 add dsi panel dt overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:06:06 +0000
Message-Id: <20260904120607.5CC381F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree overlay encodes a software workaround for a driver bug =
by specifying incorrect GPIO polarity.
--

commit 5ed903b02819c317254f3303f8a8204c435744da
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add dsi panel dt overlay

This commit adds a Device Tree overlay for the Winstar WJ70N3TYJHMNG0 DSI
panel on SolidRun HummingBoard IIoT boards. It includes the new dtso file
and updates the Makefile for supported SoC targets.

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-ds=
i-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot=
-panel-dsi-WJ70N3TYJHMNG0.dtso
> new file mode 100644
> index 0000000000000..f8584c473fafe
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N=
3TYJHMNG0.dtso

[ ... ]

> +&dsi {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	panel@0 {
> +		/* This is a Winstar panel, but the ronbo panel uses same controls. */
> +		compatible =3D "ronbo,rb070d30";
> +		reg =3D <0>;
> +		/* reset is active-low but driver inverts it internally */
> +		reset-gpios =3D <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does this encode a software workaround directly into the hardware descripti=
on?

Device trees are meant to describe the physical hardware. If the reset line
is physically active-low, shouldn't the device tree describe it as
GPIO_ACTIVE_LOW?

If the 'ronbo,rb070d30' panel driver incorrectly inverts this internally,
that appears to be a driver bug. Could this be fixed in the driver code
rather than compensated for with incorrect polarity in the bindings?

> +		backlight =3D <&dsi_backlight>;
> +		power-gpios =3D <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
> +		shlr-gpios =3D <&tca6408_u48 4 GPIO_ACTIVE_LOW>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-rzg2-sr-bo=
ards-v8-0-94c4674927e8@solid-run.com?part=3D7

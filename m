Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF0344683F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119258; cv=none; b=iSsCCDlRyT8jEbXLA/xqwbEorUN/42O9WFpMHRCcdY+ninQgIcDCO0XPtvBW18e6U2zelqw3z5c06aet58aXL+PGCp3iAuMQQ7TQUUSv9GsJnTVw12xEP53LQFgKI8wVfD3XKYVoc87PCb5DEFHpsca+vOrV8PI44nKn6QfkPHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119258; c=relaxed/simple;
	bh=CuOK4voCIiDYt7D4sIofcx3I5aw+9QrHKaqnVEzgwQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cn0VWqQVz0tJllJsZhogVK2WrzpAhfAULI8ScaPDhO0qh3ohPyZai0mRHDEQyNmWwMU+9NMrY0xXNs9q8T9IYBU+NJ4+vCQG8FKmqtJTjJhJaQrtUBQqJ7I3axZMvZRnDuauPnAJfp01fpi2w9b6vH1E/dRiHWfZv0/d7OTBEwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Devw1A2Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Devw1A2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5740F1F000E9;
	Wed, 15 Jul 2026 12:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784119255;
	bh=dA/f9E9jWlHUYmP7TlKvVgCj8AhQbKn4iqW711eb9uc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Devw1A2Q2mU9ydyVaPGQxqU/IudnvfuNu1BLqSCnuFzdSDCocShMswBkD9yfGJSf3
	 FBiC5xDxd5k+rtx7MiiVMmFsJY/jzLrn8xS6U/aCRbaxen5sH4NZz/NbVja6UUEGqQ
	 ojLq9gnfHqize20gowOOfGhBcX1pBdFurKWwSg2r2Piaqx4wHx5DN0ESntfFdN1wuH
	 9LywAVQEoiqJGA7lEY133LuC5v+pDf8dqwGgoPJtHpzGUREM+MbspH9oAiYAUkpChd
	 hMWy+vq++nwr0KZkBU70cGf0/dtI6xZmWg/h5l4MFE79KC8b3kfP43BVwrl7mieXr9
	 GR5q/cCyMQYrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs
 on CN12
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715122341.47838-2-wsa+renesas@sang-engineering.com>
References: <20260715122341.47838-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 12:40:54 +0000
Message-Id: <20260715124055.5740F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `pinctrl-0` and `pinctrl-names` properties added to the `&gp=
io2b` subnode will be silently ignored by the kernel because the `snps,dw-a=
pb-gpio` driver does not probe its subnodes as independent platform devices.
--

--- Patch [1]: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPI=
Os on CN12 ---
commit a17e87c79ff350400e4cf32dff0313dad00fefe9
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs on CN12

This commit adds device tree nodes to enable GPIOs on CN12 for the
r9a06g032-rzn1d400-eb board.

> diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/a=
rm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> index ead379988fb1c..7d6ddc91bb2e4 100644
> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> @@ -57,6 +57,12 @@ &gpio2 {
>  	status =3D "okay";
>  };
> =20
> +&gpio2b {
> +	pinctrl-0 =3D <&pins_gpio2b>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};

[Severity: Medium]
Will the pinctrl core actually apply these settings when attached to this
subnode?

The snps,dw-apb-gpio driver iterates over its port subnodes (like gpio2b)
to register gpio_chip interfaces, but it doesn't appear to register these
subnodes as independent platform devices.

Because the driver core only applies pinctrl-0 properties automatically
during probe for fully initialized device instances, this configuration
might be silently ignored by the kernel.

Should these pinctrl properties be moved to the parent &gpio2 node instead
so they are properly applied to the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715122341.4783=
8-2-wsa+renesas@sang-engineering.com?part=3D1

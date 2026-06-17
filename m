Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A43390CBA
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690573; cv=none; b=G5n5utq3gYxK92dysuVDhmIW/4qyjl66NBpBqHPXG6cRciIRCDmKkM2saBT+BrlYcQhRrtYXn2J1M6F+l1GlfZtS9M3VYFodVAl0YWYwjOH0HDaDGnxa9zc2F+OO68Yc5vxibqD7p5r+HZy7FJLNpZGvgUAjOtdUwwo3MLEJ+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690573; c=relaxed/simple;
	bh=EEejXnNhX1t0385QYLTqhcY1NPi55OdYY00dz976Y4Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bhm3AQ1miT+gBRQIgtSGaz+Ttxzh8joYwkOGSIXri0SABbpeEIQW2Hazk2LaEJFJTjVUopTXc8rONZnk3glrZ9oPvcFv/8JJhvKECzs+rZ6J+51LNXHGPhPjor+rEceLjkfsmyfqlFJQbHJtGA/idUMIYumF08WtJcG1yIZiK5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llQHu2Db; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llQHu2Db"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CEE1F000E9;
	Wed, 17 Jun 2026 10:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781690571;
	bh=kjWMf6E5c9VuppHmtdjI5HmwnO4zG0reBXuGrJToVKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=llQHu2DbhXjZ7VRO6/ZQrKybctiUngolyXJlUZvVyXRPzhg90qa+FK30DSuknOGV/
	 72bV8aOFYdmqKTEpNUI6iIO4FGnQAak+Ewma7Q71XNYut3de26msyiSpQ83qmoagTb
	 VosXL4JfwDem3yeRz4A8ipOBURQB8ofDbhpXKmw9Lod8t17Mryhx/EdnDPJoS0RnE4
	 e/DwHd2qm9+4zpQoVTJKJJfwW78Q5qhIJSfr5JM/NVLwvyGWhkjsbviEmrTAsOs74L
	 3gJpZUk9UntpMb9ghBXmEM8C9aKTmo9+i2/Q6AMfmfOrPkSIoqz+YbAQTB+9aQnMPz
	 SkGXMtQWYbJTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] ARM: dts: mediatek: mt6323: add EFUSE support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617-mt6323-nvmem-v2-4-4f30e36aa0f4@protonmail.com>
References: <20260617-mt6323-nvmem-v2-0-4f30e36aa0f4@protonmail.com>
 <20260617-mt6323-nvmem-v2-4-4f30e36aa0f4@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 10:02:50 +0000
Message-Id: <20260617100250.C9CEE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unchecked dereference of dev->parent when getting regmap.
--

commit f140540f16666ffd0b4a44edcb3b4ac15d83d749
Author: Roman Vivchar <rva333@protonmail.com>
ARM: dts: mediatek: mt6323: add EFUSE support

This commit adds the devicetree node for the mt6323 efuse to the mt6323
PMIC definition. It introduces the mediatek,mt6323-efuse compatible string
to instantiate the driver.

> diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/m=
ediatek/mt6323.dtsi
> index c230c865116d0..807e000a7ff64 100644
> --- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
> @@ -14,6 +14,10 @@ pmic: mt6323 {
>  		interrupt-controller;
>  		#interrupt-cells =3D <2>;
> =20
> +		efuse {
> +			compatible =3D "mediatek,mt6323-efuse";

[Severity: High]
Does binding to this compatible string introduce a regression under certain
devicetree configurations?

Looking at drivers/nvmem/mt6323-efuse.c:mt6323_efuse_probe(), the driver
blindly traverses the parent hierarchy:

	/* efuse -> mfd -> pwrap */
	regmap =3D dev_get_regmap(dev->parent->parent, NULL);

If the device is instantiated directly at the root of a Device Tree
or via a malformed overlay, it lacks a grandparent. In this case,
dev->parent is initialized to &platform_bus, and evaluating
dev->parent->parent results in a null pointer.

Passing a null pointer as the device to dev_get_regmap() triggers an
immediate kernel panic during probe(), because the underlying
devres_find() unconditionally dereferences the dev pointer.

Could the driver verify that the parent hierarchy exists before
attempting to traverse it and retrieve the regmap?

> +		};
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-mt6323-nvm=
em-v2-0-4f30e36aa0f4@protonmail.com?part=3D4

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1D936194C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736001; cv=none; b=Qix5DUMFwWLg/PGfO5GpmicIl26OEhsWyG5FNIqQbw+SBSYLqaKq3H97mLO2Pe9hxAGf4vOM+U7KO6Unv7uCNYYjiaV4zLtbET/Utkn41NPOlexKkaN6tglF4fZ9mebDJCqqO5rblccucZJqbDBtQvSbJphG+2RXV1XDIdsWaXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736001; c=relaxed/simple;
	bh=KzdBOL4x1B1CdLZmhCEM7BK5pixoifVZQFC1TVLA+rE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b7sH6uCDeqK0hc/VGIzqk+A6BpbglIq6qgjIJTXR97r+LG/1Y7kAd41ePgway1k6c0vhX+VSQtZgLSzsCZYijaJKKku339zv8SqnuccA2bxLHFC/G45cQDfbEKh/PDGdHGC1qibXBnjwrH8kaM67+pPGNFXDcscpqnY4iaAlGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ai8Sfma6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ai8Sfma6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF6B1F000E9;
	Wed, 22 Jul 2026 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784735999;
	bh=QeAZRI8U4xgirlR8mJaX58x/Pd90+B4AoIPVXU+PhO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ai8Sfma6XJNY0nHhcLXKgmB16RTgZbu24EfWAyety3ebMEep3ozQ115MS6Ih0mM4Y
	 dM8HvDQ3ptqgHrT2Bg9/B9xDTXM1w/+kHSxh1mzFGffl1epXPIt2UfGfQZ5gJrGNvw
	 GqNQlZ8d/UH1S05duvoRgl8QpL4VCv/zwiJjBedI3O/vWJYpkU2gIGYylywf47YZaw
	 ygwaf6eP0gKnYFyrOTAQoQruEzfvevlSoM5U9Oo0hWJBe+Hti9LpMf3yJpZWNjdaSq
	 xa12jv6P8f7pBaSUmAYM4L5pGblGaQOYWTyWy4p8oDZViX+JKRE7N1L5zcIDFrZQAG
	 w3V9WL+2Fnovw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 9/9] arm64: dts: rockchip: Add icm42607p IMU for
 RG-DS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722153942.144387-10-macroalpha82@gmail.com>
References: <20260722153942.144387-1-macroalpha82@gmail.com>
 <20260722153942.144387-10-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 15:59:59 +0000
Message-Id: <20260722155959.AAF6B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing power supply properties (vdd-supply and vddio-supply) in th=
e device tree node.
--

--- Patch [9]: [PATCH V19 9/9] arm64: dts: rockchip: Add icm42607p IMU for =
RG-DS ---
commit 05126f7b1858f1ad978be9793e857272c00e7b8f
Author: Chris Morgan <macromorgan@hotmail.com>
Subject: arm64: dts: rockchip: Add icm42607p IMU for RG-DS

This commit adds the Invensense ICM42607P IMU node to the Anbernic RG-DS
device tree.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arc=
h/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
> index 8d906ab02c5fb..b770bfd5268d8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
> @@ -871,7 +871,13 @@ aw87391_pa_r: audio-codec@5b {
>  		sound-name-prefix =3D "Right Amp";
>  	};
> =20
> -	/* invensense,icm42607p at 0x68 */
> +	icm42607p: imu@68 {
> +		compatible =3D "invensense,icm42607p";
> +		reg =3D <0x68>;
> +		mount-matrix =3D "-1", "0", "0",
> +			       "0", "1", "0",
> +			       "0", "0", "-1";
> +	};

[Severity: Low]
Are the vdd-supply and vddio-supply properties missing for this node?

The inv_icm42607 driver unconditionally requests vdd and vddio regulators v=
ia
devm_regulator_get_enable() during probe. Without these explicitly defined =
in
the device tree, the framework will fall back to dummy regulators.

While the driver will still probe successfully, this incomplete hardware
description could cause the IMU to lose power unexpectedly if the shared
physical regulator is ever turned off by another subsystem.

>  };
> =20
>  &i2c3 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722153942.1443=
87-1-macroalpha82@gmail.com?part=3D9

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123582D5922
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552599; cv=none; b=ETxR6CVq2Of2tNcDFLNEOalm1AHABHXwhHpI/wqcIo743Fgrr03F2UHhm0N2/vvR+I4FNJaE001INNKt8oQgfrDt3pd/SKfImR3BP+yV/YNHrnMaH/RrtwlXxy8epzeHpHXFWCwq7NbQiomcnEmZosNh52CfFCtUhuoZDHZSXco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552599; c=relaxed/simple;
	bh=bZv4WljEe52ee5tHLLLXVegVOFqm1uljCj3hj9gY7XE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qmih2Y5C68NXzwkwKJPwFXfMu/fJKDy8XscScHhipgXEtWARqTzwqtT0DUNqsiqn2sSbSn1G5kdAHoE1D1AEET1zlfrwMI2TQ8i+MyE5zV2oAl2mMxrjTYNjJls1oQdUN3P2qQJXB0SWKY2BNoNnBI3oe5d5ZDwNPow8yVrk5Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqJUytFY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqJUytFY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A380C2BCB0;
	Tue, 12 May 2026 02:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778552598;
	bh=bZv4WljEe52ee5tHLLLXVegVOFqm1uljCj3hj9gY7XE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aqJUytFY/sWaPUTkUSmc8o1y2qnPTmpsn2S1jNfYOA3pGevnBqbj8nPwS5sTcoMhw
	 Ne8ha12kM3FgI+ddI7N7JjN3OLRKfk1u/DsLkK9FI0XcD2XmiK38reMAo51mkuS2FY
	 ItzdmDxCBTp/k6XlMrdQnTr90PUR/kmdZeLZEYrurSyzPikkeGZhaELQT4sNysIbDs
	 eXARf82arqdCo/7y6ZO1KvWozuqoQIG4C53tyL5oNbU9o7WUR7flMBHg8NZEksoNgW
	 TKUQ9Pemej1ODiqvMvbAH2Am4TR+2pcaBXx4XpVpxwnmTJULliXOz/OfYs77/ozf52
	 BLhJiCQeyJt3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/9 RESEND] ARM: tegra: transformer: Add support for
 front camera
Reply-To: sashiko@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511074859.24930-6-clamor95@gmail.com>
References: <20260511074859.24930-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:23:17 +0000
Message-Id: <20260512022318.6A380C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Hardware Topology Violation: Front camera mistakenly bound directl=
y to CSI-B on TF300T variants.
- [Low] Device Tree Binding Violation: Unallowed `orientation` property in =
`aptina,mi1040` node.
--

commit f0de1eeb70b375136f716e42d1c0078025071767
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: transformer: Add support for front camera
   =20
This commit adds the front camera video path using the Aptina MI1040 sensor.
It notes that the configuration works for TF201 and TF700T, while the TF300T
series routes the front camera through an additional ISP.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dts=
i b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
> index ead95306840f7..e6d079647f772 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi

[ ... ]

> @@ -1160,6 +1246,36 @@ light-sensor@1c {
>  			vdd-supply =3D <&vdd_3v3_sys>;
>  		};
> =20
> +		/* Aptina 1/6" HD SOC (MI1040) */
> +		front-camera@48 {
> +			compatible =3D "aptina,mi1040";
> +			reg =3D <0x48>;

Since this node is added to the common device tree include file, won't it
be applied to the TF300T variants as well?=20

The commit message mentions that the front camera on TF300T/TG/TL is linked
through an additional ISP, so wouldn't putting this directly in the shared
dtsi without disabling it cause probe failures or I2C timeouts on those
models?

> +
> +			clocks =3D <&tegra_car TEGRA30_CLK_CSUS>;
> +
> +			reset-gpios =3D <&gpio TEGRA_GPIO(O, 0) GPIO_ACTIVE_LOW>;
> +
> +			vddio-supply =3D <&vdd_1v8_cam>;
> +			vdd-supply =3D <&vdd_1v8_cam>;
> +			vaa-supply =3D <&avdd_2v85_fcam>;
> +
> +			orientation =3D <0>; /* Front camera */

This isn't a bug, but does the aptina,mi1040 binding allow the orientation
property? The schema (onnn,mt9m114.yaml) doesn't appear to define it or
reference a generic schema that permits it, which might cause a dtbs_check
validation error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511074859.2493=
0-1-clamor95@gmail.com?part=3D5

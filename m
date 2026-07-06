Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0153DEFFC
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321819; cv=none; b=O3txneaGaOTTWIhL7uA7TXwqguyHUh1O/hJj6yHgKumM2eM1hOrC4jeclvlBWS/sPe0mp/hgK0zfdwbPzuEPelzBIH27gU7W02kkAY+S1DWv8RornZAQg8gE6LwPx67pd/fvrzzejetdozzN2CQh5qftBy0xMnoutC56Z9qeT8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321819; c=relaxed/simple;
	bh=m2looZavVDzvf6Ng4crnoc6oa9X/YUou4ixhSd9J0kI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NPJiBoZxCk9oF4TwXbo/gjybM/8BB7RppBpwbkNRZfdWmRPIHUcw/8zY0WlGF9sgemymtCDSdYpnYj0cw6aBcWiVmyfbm8tka1RNnflj0DpLR/lqQC7KNkd8V30y70wIeq1CbmwjMEEL6i7BhJiAMBknc2AQHwbHhBUfHGMirUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnStbO09; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnStbO09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18571F000E9;
	Mon,  6 Jul 2026 07:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783321806;
	bh=fQHr1+E8V+uuA2cAuX9jkfgEq0W13PVjhuZluJhwYtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nnStbO09juAUHpLVoHauPE1cdPR7baBcTiddq5KWD3CU6zp99CFbHI2uhoGC+gaAO
	 bxk1D+dfuGx6jlZLKQqbB4FsAqDUCJBXrZNt7z0/XNEd3suASdlokpHq1ssQLP3Xxa
	 Nkzql9DOFygJEUzI1ZiitKLSUKpgh/kIGODTwY/58MUWc3eOYWxm1JNjQXpwFfSZyD
	 ePGC3g1VEVsQ49liN1jMn8YmzlhKm4KU0SYePbmMy2xLsMmoPRJ0gDlXyKbkQGuyoI
	 5ScrrbL477X0mTkg6Wkb+nT5b+G6JSxQcJfQwe2fqbnR3eCxsNNaDISLci7NsfC+wX
	 4UGsML42zY4gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Use hyphen in node names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 07:10:05 +0000
Message-Id: <20260706071005.D18571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Renaming the `splash_region` node to `splash` violates an explicit=
 bootloader ABI, breaking continuous splash screen and display handover.
- [Medium] The commit modifies node names beyond simply replacing underscor=
es with hyphens, introducing a mismatch between the commit message and the =
actual changes.
--

commit f5e94b2fb05705d86098917e535c3beb4b025cf6
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

arm64: dts: qcom: Use hyphen in node names

This commit renames several device tree nodes to use hyphens instead of
underscores to align with DTS coding style. The commit message notes this
should be safe since node names are not considered an ABI.

>     DTS coding style prefers hyphens instead of underscores in the node
>     names.  Change should be safe, because node names are not considered =
an
>     ABI.

[Severity: High]
Is it accurate that node names are never considered an ABI? In some cases,
firmware components like ABL rely on exact node names for hardware handover.

[Severity: Medium]
The commit message claims to only replace underscores with hyphens in node
names, but the patch also alters prefixes and adds new "-regulator" suffixes
that go beyond the stated scope.

[ ... ]

> diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts b/arch/arm/boot/dt=
s/qcom/qcom-sdx65-mtp.dts
> index 07c10c84eefa1..2c0590617ac46 100644
> --- a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
> @@ -55,7 +55,7 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-max-microvolt =3D <3700000>;
>  	};
> =20
> -	vreg_bob_3p3: pmx65_bob {
> +	vreg_bob_3p3: pmx65-bob-regulator {
                      ^^^^^^^^^^^^^^^^^^^
[Severity: Medium]
This node was renamed by appending a completely new "-regulator" suffix not
mentioned in the commit message. Is this intentional?

>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vreg_bob_3p3";
>  		regulator-min-microvolt =3D <3300000>;

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso b/arch/arm64=
/boot/dts/qcom/lemans-evk-camera.dtso
> index 4600d5441cce4..a4c6d39cf7778 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> @@ -14,7 +14,7 @@
>  #include <dt-bindings/gpio/gpio.h>
> =20
>  &{/} {
> -	vreg_cam1_1p8: vreg_cam1_1p8 {
> +	vreg_cam1_1p8: cam1-1p8-regulator {
                       ^^^^^^^^^^^^^^^^^^
[Severity: Medium]
The node prefix and suffix were arbitrarily altered here, going beyond a
simple underscore replacement. Could the commit message be updated to
reflect these additional naming changes?

>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vreg_cam1_1p8";
>  		startup-delay-us =3D <10000>;

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/=
arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> index 7393978926e44..0796d9dbe1582 100644
> --- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> @@ -136,7 +136,7 @@ ramoops@81f20000 {
>  		 * ABL is powering down display and controller if this node is
>  		 * not named exactly "splash_region".
>  		 */
> -		splash_region@e3940000 {
> +		splash@e3940000 {
                ^^^^^^^^^^^^^^^
[Severity: High]
Does renaming "splash_region" to "splash" violate the explicit bootloader
ABI documented in the comment directly above?

The ABL bootloader parses the device tree to find the memory region node
named exactly "splash_region". Changing this name could cause the lookup
to fail and inadvertently power down the display hardware during the
bootloader-to-kernel transition.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-dts-qcom-s=
tyle-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com?part=3D1

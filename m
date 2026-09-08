Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0540633E367
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 06:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847930; cv=none; b=odnCMJ+zgK+TsUsLLI1qrgZW5pABg9qwQvv0FIXFtPBZ09Dv7Kkg+pFTpCq49tJycxi3/VA7VCge/ftdeiARSwe27ypm4DaYV3oYf9vYtWMJX8b6e/hOYhVCe2u5d+kitYTp3dxSWICD99rpLoStArrUgwY6rlMffmKbjcCEINk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847930; c=relaxed/simple;
	bh=Ods20o1NOuuCtnSyVPYgOiKz+nA5Mj6IzwvptUzFWHI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kGE7Pw5KzW/Pkz8Ag+xnfeIN3DrFLKzXxqoqkMVWM5GkUCE2r32hDZlEd/tojc4XUrYtN2urXZcPkR8eTrBMnQh8Xzuor5nZIWnxyPqDZPctBdHCeMY0gUawEFy45EIb/GWyVGLgj5r+2GIZvSzkkCLQ+t/xc9TFDguZ2WA9mvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArT1Hr74; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArT1Hr74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0984E1F00A3A;
	Tue,  8 Sep 2026 06:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788847928;
	bh=+NbVAbRbHXf6UqRgqW9xV+wFbAisynxSUGeNy0AqUgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ArT1Hr74spEeK7eFQLkPnmBD7ZpNWGqFnxCjbJ+iUGadjatMDQu7PU/tzxFCy+WK1
	 pKJ2BkGBl16z1vJoCkZi+29lRlvusCT/Erq2mCYrQP33cKWmwWrUJehpnqcN+MwEGk
	 i4521u0DEmyLHA+dm4bDoDhzdT4b1mb9dS737mtMfG0JRCdJzT/oNwoW2FBeu5aSK2
	 Vo52bD2aFafA3gwowxI7vsUJCJFXOmahy6DBRRIstf5rtEIaoHnDWqbqKTtiHShRbo
	 ZgLwB02m7g+qslsCByUZrcOxCoAtvPqyvDVqmJYzcur0gAK2p5eqNGdbbx4CNq9F7L
	 amxzSDxTdS7ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] ARM: dts: marvell: armada-388: use onnn,pca9655
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908060438.43338-1-rosenp@gmail.com>
References: <20260908060438.43338-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 06:12:07 +0000
Message-Id: <20260908061208.0984E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Dropping the 'nxp,pca9555' fallback compatible string breaks backw=
ards compatibility with older kernels and bootloaders.
- [Low] The new compatible string 'onnn,pca9655' is not documented in the d=
evice tree bindings schema.
--

commit 0aa44d4fbea2198095d07080778a930cfaf868f9
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: marvell: armada-388: use onnn,pca9655 compatible

This commit updates the Armada 388 ClearFog and Helios4 device trees to use
the "onnn,pca9655" compatible string for their PCA9655 GPIO expanders,
removing the previous "nxp,pca9555" compatible and a stale comment.

> diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/ar=
m/boot/dts/marvell/armada-388-clearfog.dtsi
> --- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
[ ... ]
>  	 * 15-SFP_MOD_DEF0
>  	 */
>  	expander0: gpio-expander@20 {
> -		/*
> -		 * This is how it should be:
> -		 * compatible =3D "onnn,pca9655", "nxp,pca9555";
> -		 * but you can't do this because of the way I2C works.
> -		 */
> -		compatible =3D "nxp,pca9555";
> +		compatible =3D "onnn,pca9655";

[Severity: Low]
Is the new compatible string "onnn,pca9655" documented in the device tree
bindings schema? Running dt validation tools like make dtbs_check against
the modified device tree files might report schema validation failures for
expander0.

[Severity: High]
Does dropping the "nxp,pca9555" fallback compatible string break backwards
compatibility with older kernels and bootloaders?

When booting an older kernel (e.g. LTS v5.10, prior to the addition of
"onnn,pca9655") with this newly compiled device tree binary (DTB), the
driver's OF match table will fail to recognize "onnn,pca9655".

Because the "nxp,pca9555" fallback has been removed instead of combined into
a proper compatible list, probing will fail, making dependent hardware
functionality such as SFP modules unusable.

> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
[ ... ]
>  				 *  6-USB3 power
>  				 */
>  				expander0: gpio-expander@20 {
> -					/*
> -					 * This is how it should be:
> -					 * compatible =3D "onnn,pca9655",
> -					 *	 "nxp,pca9555";
> -					 * but you can't do this because of
> -					 * the way I2C works.
> -					 */
> -					compatible =3D "nxp,pca9555";
> +					compatible =3D "onnn,pca9655";

[Severity: High]
Similarly for expander0 on the Helios4 board, does removing the fallback
compatible string prevent older kernels from probing the I2C GPIO expander
and break USB3 power functionality when a user updates their DTB independen=
tly
of their kernel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908060438.4333=
8-1-rosenp@gmail.com?part=3D1

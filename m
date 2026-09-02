Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC369453A26
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345107; cv=none; b=DJwERdfyF91SC5ioITuBlmVDyAx/Zrybv5BfT6lDCKsHz9XgvRnVMz7ECbVONcDj4msjSRVv7tGbukfPHfkfT1vYfGbVk4rzNF8g3fv1fRNBgER4XNRu/aAKC56eqtiG5X4iGeRlbs/xYECOvwd2mo6cZ80KbTZzOfKEfBs47ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345107; c=relaxed/simple;
	bh=doCHDwaEe69iLOlkIogJF2cfl5X2clcjRkr5BbV9/3k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KelH2T3lSpGlry+u6xLtXLfGcQfm9VUdRYfDnZKqt6Q9C1D7b0W2npGDMDdOiML/q7Qfta0GJGkwmJKV6Rhd4l1HlEkm7dpcSLmguWjnTVjKsKoCmPtGu8lH7RqL6wqxhJwAXKBLPHBb6y/4GmmZvafxjvavQmIRYtLc9/TidPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmKhW3o0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmKhW3o0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E441F000E9;
	Wed,  2 Sep 2026 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788345106;
	bh=K/OIzjLN4sTej4xOWLB6V7daDDXzwX2Mkk0HKTYAXyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PmKhW3o003h8dz94IF0su1KB6ahgnktBzEMcGI7nIytatIhzplnF6FxkNRISpGjUu
	 AyOLs+4SL4ppFsPrU+0v90H08APF0KgvdzD1odTT0ejr2Kkj8Va/OYluqR1+YIYsUq
	 SRgQbGe1IzWXuWW4oznUkVfwIMBwjFOrtS6QrNxTgqUFNPXXY2m301yBc6o/tgFqnM
	 eY+y/hN0av1fVUhRsTrKmx2GCZh+Ub7BdgdphEMcaIZM7tJO76YuWqK94ytCv3VDB5
	 qc9V6XSjpjXxuGQ8YVUdgwWqW4ZFRu6xzam35aU9jwIfP1xeu/dDxnhB31RqIO7/B1
	 8URq4RAx1H+Rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] arm64: tegra: Clean up AHUB on Tegra264
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-7-028f3c5e72f6@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
 <20260902-tegra-ahub-dt-cleanup-v1-7-028f3c5e72f6@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 10:31:45 +0000
Message-Id: <20260902103146.27E441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `ranges` property in `tegra_ahub` has an incorrect number of c=
ells, causing device tree translation failure.
- [High] Syntax error and malformed cell count in the `reg` property of `te=
gra_sfc2`.
--

commit e1dacd52fef2161b800fe722394a96baeac1b62f
Author: Thierry Reding <treding@nvidia.com>

arm64: tegra: Clean up AHUB on Tegra264

This commit updates the device tree properties for the AHUB and related
components on Tegra264, changing #address-cells and #size-cells to 1.
It also adjusts the ranges property and simplifies the register offsets
throughout the audio subsystem.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra264.dtsi
> index 6b2e3a6ab810f..4ed7dabafee5d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
[ ... ]
> @@ -209,22 +209,22 @@ adma: dma-controller@9440000 {
> =20
>  			tegra_ahub: ahub@9630000 {
>  				compatible =3D "nvidia,tegra264-ahub";
> -				reg =3D <0x0 0x9630000 0x0 0x10000>;
> +				reg =3D <0x9630000 0x10000>;
>  				clocks =3D <&bpmp TEGRA264_CLK_AHUB>;
>  				clock-names =3D "ahub";
>  				assigned-clocks =3D <&bpmp TEGRA264_CLK_AHUB>;
>  				assigned-clock-parents =3D <&bpmp TEGRA264_CLK_PLLAON_APE>;
>  				status =3D "disabled";
> =20
> -				#address-cells =3D <2>;
> -				#size-cells =3D <2>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;
>  				/* ADMA is under AHUB range, its excluded in the defined range */
> -				ranges =3D <0x0 0x9280000 0x0 0x9280000 0x0 0x1c0000>,
> -					<0x0 0x9510000 0x0 0x9510000 0x0 0x370000>;
> +				ranges =3D <0x9280000 0x0 0x9280000 0x1c0000>,
> +					 <0x9510000 0x0 0x9510000 0x370000>;

[Severity: High]
Since tegra_ahub and its parent aconnect both define #address-cells =3D <1>
and #size-cells =3D <1>, shouldn't the ranges property have exactly 3 cells
per entry (child-address, parent-address, length)?

The updated values still contain 4 cells per entry, which looks like it
failed to remove the stale 32-bit 0x0 from the previous 64-bit parent
address layout. Will this malformed cell count cause dtc to fail validation
and prevent MMIO address mapping for audio peripherals on the AHUB?

> =20
>  				tegra_i2s1: i2s@9280000 {
[ ... ]
> @@ -1584,7 +1584,7 @@ sfc1_cif_out: endpoint {
>  				tegra_sfc2: sfc@9710000 {
>  					compatible =3D "nvidia,tegra264-sfc",
>  							"nvidia,tegra210-sfc";
> -					reg =3D <0x0 0x9710000 0x0 0x10000>;
> +					reg =3D <0x9710000 x0 0x10000>;

[Severity: High]
Does this introduce a syntax error in the device tree? The x0 token appears
to be a typo, which would cause dtc compilation to abort.

Additionally, even if parsed as zero, wouldn't this result in 3 cells
instead of the 2 cells expected by the #address-cells =3D <1> and
#size-cells =3D <1> configuration?

>  					sound-name-prefix =3D "SFC2";
> =20
>  					ports {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-tegra-ahub=
-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com?part=3D7

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A44D3ACF15
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681154; cv=none; b=g+iMRXJ/YCfqRnE9cZDapTeK2peV8l9Yr7P3sBXskUQY7zUV36IXIdQ+qCqvfNucnrHg8UQnylDSOeO/GhgpnyH66lTCLRaw6lmU12cZ1EIcX5n10rSldRGty0risUqMGBGRHu4tQLCj/UDESVyI/ZoTqXvVZTmNobJ9shO+vi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681154; c=relaxed/simple;
	bh=2Iu0WlXsaDvmiw7Ekhg51U1eDMqMPQ2gcGV2jruqSgM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QH3XvZtAMrkSeOgKUQlM5sTWrbqRdew5dz2jq8sc4daMOlVc2JJln4PhfC3z5VPy1Hxhc0/SvkFOroVyTEy3nXbu5A9284H8AO1ri71e3P51qQZTF99Z3NugWHb/94iqTjDfZqa1v/mnMlTc7kFNE6tnnyMVLe3XFdu1YCh4Bdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3Io4uDH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3Io4uDH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A441F000E9;
	Wed, 17 Jun 2026 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781681153;
	bh=u4AWRUVG9ZHOsZdi46VB05kCt+swzak17AoYKf+KujI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U3Io4uDHwQPa0fnlsuSoJ+1v99WLTFe69IBNUtutOrRz0HXb5qxkYubK2zgvaB3pd
	 WrTLMJZlSKDULdQK4eO6WDMISDw2GEEM01O87xaBuRF90hqrupg9ohMvxrP0FgpyF8
	 4346He/rSj11NtcbcW8623eCX86PhRg/AhdRVIZ67qbXKc21ILZjJQ6Jt2u425URXB
	 uh8HrBjGTQzknGDV40KAxoHY54d41TyP7+dHQw2fucFCivKp57OPgTM67giGFyE4OE
	 z2PcVvVYpEFokM2xK4fZeIJxl3triFwP01UgAJqmylZ9KyjoQI/UGuRET1Nf0koncG
	 2kxWPq7JTHojQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy
 node by default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260617071604.635627-4-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
 <20260617071604.635627-4-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 07:25:52 +0000
Message-Id: <20260617072552.C0A441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The S400 board fails to enable the underlying `mipi_pcie_analog_dp=
hy` required by `pcie_phy`, leaving PCIe broken and the deferred probe warn=
ing unresolved on this board.
--

commit 8447bc6097444b6a9914b09671ffb788547cd0fd
Author: Jun Yan <jerrysteve1101@gmail.com>

arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
   =20
This commit disables the pcie_phy node by default in the meson-axg base
devicetree to suppress a deferred probe warning on boards that do not use i=
t.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot=
/dts/amlogic/meson-axg.dtsi
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
[ ... ]
> @@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
>  			phys =3D <&mipi_pcie_analog_dphy>;
>  			phy-names =3D "analog";
>  			#phy-cells =3D <0>;
> +			status =3D "disabled";
>  		};

[Severity: High]
This isn't a bug introduced by this patch, but does the S400 board fail to
enable the underlying mipi_pcie_analog_dphy required by pcie_phy?

Looking at arch/arm64/boot/dts/amlogic/meson-axg-s400.dts, the pcie_phy is
enabled:

&pcie_phy {
	status =3D "okay";
};

However, the analog PHY it depends on (mipi_pcie_analog_dphy) is disabled by
default in arch/arm64/boot/dts/amlogic/meson-axg.dtsi:

mipi_pcie_analog_dphy: phy {
	compatible =3D "amlogic,axg-mipi-pcie-analog-phy";
	#phy-cells =3D <0>;
	status =3D "disabled";
};

Since mipi_pcie_analog_dphy is never set to "okay" in the s400 board file,
won't pcie_phy continue to indefinitely defer its probe waiting for the
analog PHY, leaving PCIe broken on the S400 board?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617071604.6356=
27-1-jerrysteve1101@gmail.com?part=3D3

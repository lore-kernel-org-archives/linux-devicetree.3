Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2403E49FD
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451147; cv=none; b=dgM8Di5CBKUrMX0/ztJ53OG/h2DOKLuxYNCVw9+Gne+cvmJ7sHWQP5d1rPejLO3+NYPtZXdd0Jh7dDMgk35XI2ZTet30yd+Sj/Q2150r0q1vlzT0rTGTmvo98Rs6YP5sPkUwVcL3NCxYVwFNpGNRY8FWL/wU04roVp/Tr+8D12Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451147; c=relaxed/simple;
	bh=an7tmUc8vsL1ICc+kKS6Dsoe5/yyvN0GoF9KC7uwFMw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YZl7wkEChDgfR2BoV5LpJAA8ZyEn3TMSB0FWM5E0TEC4n1w4EddTlRdD/mpdVWupD1nFZJVeYV6fOtW5s6WQ8AEvYAOtRo/8Fiwmb2mvHM0/MPfFOBkw5aJrBxfjYTnOfCFxCm4gibPMstKZt1ZBHiDCD/OI8QDsk/gey+h6L3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgGz3ul7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgGz3ul7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235981F000FF;
	Thu,  8 Oct 2026 09:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451137;
	bh=5FsmvzdIxoAlRBDlOkTpFrOSP5x7rJhflHBaqeh5W6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GgGz3ul7t1CtCTNggIKHhgX8Q486qyeTQM2tRdz0+6ggYLSfDOGGhFce58KWyoQZ1
	 E5BZXhnVbpv9Vil8avtZzaXZHL3uENdahTAN83so0bqMKK7uxPcvG9WHk39sx+Bay0
	 bl7M2XjFxhowSlx+HJQnQzhxLkQm9nfIWAGSy8yH5gVWj2Nom59KftLFw7bKlx0+N1
	 BO6uwdHYykD3TUIC6OxiG2wZvnHv439Q8uJWlwl0AufgVRuudhU3qR6ezGoN6cfjkN
	 ONpCmuaunE/IkDzXpCS5B+uacpj/roUwPTf/jwNH3/oh8sgoGaOop6NukoLmAptV5B
	 34aFmwfsPTMxw==
Message-ID: <sashiko-outbox-163919@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261008-08-dts-v6-10-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
 <20261008-08-dts-v6-10-f9c4ec8664d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:18:56 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: incorrect reg cell count for spi0 node in ipq5210
- [Low] dts: missing #address-cells and #size-cells in ipq5210 spi nodes
--

commit 98b0e1a28d55f7b85bc8666419066bba608f1097
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add SPI node definitions

This commit adds SPI node definitions for the QUP SPI blocks present in the
IPQ5210 SoC. It introduces spi0 and spi1 nodes with their basic configurati=
ons
including compatible strings, register addresses, clocks, and interrupts.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 50ce79219fe23..23a2e27b70fa3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -418,6 +418,17 @@ qupv3: geniqup@1ac0000 {
>  			#address-cells =3D <2>;
>  			#size-cells =3D <2>;
> =20
> +			spi0: spi@1a80000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x1a80000 0x4000>;

[Severity: Medium]
Will this reg property cause dtc warnings and runtime probing failures?

The parent node qupv3: geniqup@1ac0000 specifies #address-cells =3D <2>; and
#size-cells =3D <2>;. This requires all child nodes to specify their reg
properties with exactly 4 cells (2 for the 64-bit address, 2 for the 64-bit
size). The newly added spi0 node only provides 2 cells, whereas the sibling
spi1 node correctly uses 4 cells.

[Severity: Low]
Should #address-cells =3D <1>; and #size-cells =3D <0>; be added to this no=
de?

SPI controller nodes typically define these properties in the SoC .dtsi so
that board files can cleanly instantiate SPI slave devices on the bus
without repeating them. Without these properties, when board-level device
trees attempt to attach child SPI devices, the device tree compiler will
emit warnings about missing #address-cells and #size-cells properties in
the parent node.

> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
> +				clock-names =3D "se";
> +				interrupts =3D <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +				assigned-clocks =3D <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
> +				assigned-clock-rates =3D <50000000>;
> +				status =3D "disabled";
> +			};

[ ... ]

> +			spi1: spi@1a90000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x0 0x01a90000 0x0 0x4000>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE4_CLK>;

[Severity: Low]
Similar to the spi0 node above, should this node also include
#address-cells =3D <1>; and #size-cells =3D <0>; to prevent dtc warnings wh=
en
board files attach child devices?

> +				clock-names =3D "se";
> +				interrupts =3D <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
> +				assigned-clocks =3D <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
> +				assigned-clock-rates =3D <50000000>;
> +				status =3D "disabled";
> +			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-08-dts-v6-=
0-f9c4ec8664d8@oss.qualcomm.com?part=3D10

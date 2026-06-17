Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4D13BCD33
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681257; cv=none; b=Wt4X/qSzxG02SjHBgEoQJuyYYcGF9RB9DMnRRgoOF+B3Vu+KoIVenBu7lMvYZPGZtB6ctl5dIGGZyUufegpDKaUR6cHoZ4DvaG26VE3nNF+TI31ptvToB3uncgSn9oOGP/8LnW+QQhQYGCKlAlItPWwc1W6SgRMOXy62xpGzZzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681257; c=relaxed/simple;
	bh=FYPdOsxL9IPMUciz7Da1pXiS3wC2YQAxV8OpNTTlsvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pNQlfuYS1ssoA4RURxwIjIaBB7kVAcjeWPGY2wf9HzKk9JPQzxWYKaMYXOZLJuUyQDZecr6OQmhVOiNPTRLXiq4Quznvl0JdmoTaB1bxe7cQd6hixqRlPT1D8DnKj4YUO1kKnu78TLXYylEuZtqqFVvZJ/6043OSBI8LPrLYmW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9/LhKoa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9/LhKoa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFB61F00A3A;
	Wed, 17 Jun 2026 07:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781681255;
	bh=RFFMRNrDpr63REMYhT+UeN5XZg5St62F9FzMJ11+wag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H9/LhKoamHwEu1prbA9qSzOmp7JY7GHRT7Qw9I6MaNWfxBPdAUMXFMZIzVgbsciRL
	 S9Zytq8/wTUnWAFlRXT0kTQYu85pPWoEW/NYm2rysKRHsQrICKuFo4F5agzJns2aRE
	 zvFdBg3mHT+h4Q4rvVC3nffqUzTA5AhwSwtSQHEFIaddS5aBU/NyHKslUMxM4ykQn/
	 xKVLcjFBVcxmF4xFpoTKEOW0xW5cDkASdK35ulPRnCm++7VFUJxviPz9PY8MUqKCpt
	 xonYau9Nia+7B0bXvYQ9w9x5JSjDenvPd38Lp/neB0peSqm9xc0+hEeCtlap7iDSiM
	 XxX50OpANPU8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: meson-axg-s400: Enable
 pcie_phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260617071604.635627-5-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
 <20260617071604.635627-5-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 07:27:34 +0000
Message-Id: <20260617072734.9BFB61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete feature enablement causing permanent probe deferral for=
 PCIe functionality.
--

commit 202349024b583dc874155ce812fb658ddbab6228
Author: Jun Yan <jerrysteve1101@gmail.com>

arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy

This commit enables the pcie_phy node for the Amlogic meson-axg s400 board
device tree to support PCIe functionality.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/=
boot/dts/amlogic/meson-axg-s400.dts
> index 285c6ac1dd613..7ba249cc3d569 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> @@ -448,6 +448,10 @@ &pcieB {
>  	status =3D "okay";
>  };
> =20
> +&pcie_phy {
> +	status =3D "okay";
> +};

[Severity: High]
This is a pre-existing issue, but does this incomplete enablement cause a
permanent probe deferral?

The amlogic,axg-pcie-phy driver unconditionally calls devm_phy_get(dev,
"analog") during probe. This maps to the mipi_pcie_analog_dphy node in
meson-axg.dtsi, which is set to disabled by default:

arch/arm64/boot/dts/amlogic/meson-axg.dtsi:
mipi_pcie_analog_dphy: phy {
	compatible =3D "amlogic,axg-mipi-pcie-analog-phy";
	#phy-cells =3D <0>;
	status =3D "disabled";
};

Since mipi_pcie_analog_dphy is not also overridden to "okay" here in
meson-axg-s400.dts, won't devm_phy_get() permanently return -EPROBE_DEFER,
preventing pcie_phy and the dependent pcieA/pcieB nodes from initializing?

> +
>  &pwm_ab {
>  	status =3D "okay";
>  	pinctrl-0 =3D <&pwm_a_x20_pins>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617071604.6356=
27-1-jerrysteve1101@gmail.com?part=3D4

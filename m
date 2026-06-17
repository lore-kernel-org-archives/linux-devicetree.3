Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2DF38B12C
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781685243; cv=none; b=TurCQF69kiIRUsEn3zYOj3GmH2EqQAI50VmoG+o7W45tTFSGsxlSxbj2uM6IQbP0kYiDcJGqZGtyfUYLYJZEMhXY9PDF9Cbe7nOD+eeVqixvvjVZ6B2aspTb+b/inuQCTII0REqBzbMaZuJj+WrCJlR0giHlkkp/3ZF0ZmKYFVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781685243; c=relaxed/simple;
	bh=+FTF85rvVPSzYS7GiyOYUHyaXv9DXmrloOAlvWI+N5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iWrrNKbE6N1rTdF0/+5bG3RgyFtM+HrLfXeSeGz/06ihA9Y3p2//YDcRvW15hR+O07tsWVXi24mYwuHIu92r5DpxF/Sy1BsKytKn7ZUnlODQSCSffXxc9qt2QDDWHIGNBB4e5u2aIHcI9defGBAPAGwKeKIpIALJqa4nlleJQmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNqZDD9w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNqZDD9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8777A1F000E9;
	Wed, 17 Jun 2026 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781685241;
	bh=tNMwyhx1Twibc9O3/WU7J/9P3UrJtpBu+ItQtrbxyyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UNqZDD9ws74UyAKdwiW1djrzWUBbd4j4A01HhIZXEx7Yuaus/FZOfTQ3Jrycv2CLP
	 9XeYX0u2smST+8kEIxJWTjbz8TxXAhwXPALV69YxSakZDc0/9KgSBpaKhEC88doeDi
	 nPV17bEDXTXcN9TuLbcJ5BxVAzawKTYhbFvrCVjB1gPbBtYpWIElCTKllFGuG9Z1Ow
	 XWtrWTpesLiUysYhzU/eNTpaRMzILNjxJ4EdpGScTmV0xPIUM9SuaCQW10wib8M2on
	 tECvAXW2XGR3oIkgJfCOiGubyVcme1QdhuAeKEOt6AzE85YONGmd46LhQKxqZtDUXL
	 PjUQlNxcu4dIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: amlogic: meson-axg: Disable pcie_phy
 node by default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260617082239.645562-4-jerrysteve1101@gmail.com>
References: <20260617082239.645562-1-jerrysteve1101@gmail.com>
 <20260617082239.645562-4-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 08:34:00 +0000
Message-Id: <20260617083401.8777A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Enabling `pcie_phy` on `meson-axg-s400.dts` is insufficient to sup=
port PCIe functionality because its hardware dependency `mipi_pcie_analog_d=
phy` remains disabled.
--

commit cd94d06969e9f9a23ea319f406b8e86e8ed9ec44
Author: Jun Yan <jerrysteve1101@gmail.com>

arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default

This patch disables the pcie_phy node by default in the meson-axg dtsi file
to suppress deferred probe warnings on boards that do not use it. It then
explicitly enables pcie_phy in the meson-axg-s400 board device tree to
preserve its PCIe functionality.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/=
boot/dts/amlogic/meson-axg-s400.dts
> index 285c6ac1dd613..7ba249cc3d569 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts

[ ... ]

> @@ -448,6 +448,10 @@ &pcieB {
>  	status =3D "okay";
>  };
> =20
> +&pcie_phy {
> +	status =3D "okay";
> +};

[Severity: High]
This is a pre-existing issue, but is it sufficient to only enable pcie_phy
to restore PCIe functionality on the s400 board?

The pcie_phy node depends on the mipi_pcie_analog_dphy analog PHY via its
phys property. Looking at meson-axg.dtsi, mipi_pcie_analog_dphy is disabled
by default:

arch/arm64/boot/dts/amlogic/meson-axg.dtsi:
    mipi_pcie_analog_dphy: phy {
        compatible =3D "amlogic,axg-mipi-pcie-analog-phy";
        #phy-cells =3D <0>;
        status =3D "disabled";
    };

If the analog PHY is not also overridden to "okay" here in meson-axg-s400.d=
ts,
will the analog PHY driver fail to probe, causing devm_phy_get(dev, "analog=
")
in the pcie_phy driver to continually return -EPROBE_DEFER?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617082239.6455=
62-1-jerrysteve1101@gmail.com?part=3D3

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8933D5672
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328020; cv=none; b=G01dOzhAnsKQM1DNvNU33IMhs83ug4/NwDr1n/STm9U2fILVvNjHATaODdSDX1MVg1O26LuYoDNJ6a6HdENgWYTfgUsP1ZFXASJl8NrjmOEpNLDZ3+qgpUJEtJ39dYcla3QvSg/DwYrfI0c7+HBqJ8SrbeBidOj3Lypj/95ZBhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328020; c=relaxed/simple;
	bh=SOi1yykYq0A+yeUbpMXSe2CTpaBXsX2lLc/ggpjMjz4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G5Jw/1SFzaqxVv+QGir9c7mud0ydx61C7FFDPpKc3hATxGLZPbg2Od3ZJ+b3P4fJHzwmyM01W/cc20LbYJn3G0B40Fk7+yUsX7LALgh5nYFlO+8D8hw09xWn8POhThSTL1s8o2cKGb0L+2uG50SYWZtVSqyDBRHmVaveFnXFa+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esSQXB0l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esSQXB0l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054BA1F00893;
	Mon,  1 Jun 2026 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780328018;
	bh=kUPwwGvbDkIsPbFKgRytuXFdgtNy10ZWhxesRrsiDi4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=esSQXB0ltTIicyVW3cdOotaSSiP6BYpNxJSyc5SEqd3YVjskj7dc4GitdkMARwvXu
	 ypc9g/U7UKkJqJKxBrNl48y6Zp42OMqB9RbtzNt3yXwJNsW1ECzSPiWsMUjkQxGI1o
	 LznvGRvZra98f0+Fh/8H3gE6jItwnhLqQU35pfVmYwJhghd51WBqKWYSfOoDX6qk31
	 wA58CfWq6RJCquKn1atoSRyMMqXbL/M9hLpYmI7i6JFE9WrQ4xFG42PEhnhafrh2P3
	 OqgU9nl9p+TR3QFzWUcPcALdHbva4BsdMS65dGL74whiCNgYkupnuAB53JivxsYfHN
	 4WKK8V447sxUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: add Vicharak Axon board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601151810.162173-4-hrushirajg23@gmail.com>
References: <20260601151810.162173-4-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:33:35 +0000
Message-Id: <20260601153337.054BA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing PHY Initialization for `pcie2x1l1` PCIe controller
- [Low] Alphabetical sorting violation in Makefile
--

commit dfbd817683ee0ef28e8408ee1abe3937bb3a7365
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

arm64: dts: rockchip: add Vicharak Axon board

This commit adds initial support for the Vicharak Axon single-board computer
based on the Rockchip RK3588 SoC. It includes device tree configuration for
various peripherals such as PCIe, Ethernet, HDMI, and storage.

> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index cb55c6b70d0e5..fcb115b02effa 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -179,6 +179,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-rock-4d.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3582-radxa-e52c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-armsom-sige7.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-armsom-w3.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-vicharak-axon.dtb

[Severity: Low]
This isn't a bug, but should this be placed further down the list to
maintain alphabetical sorting? It looks like it is inserted between
armsom-w3 and coolpi-cm5-evb.

>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-coolpi-cm5-evb.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-coolpi-cm5-genbook.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-edgeble-neu6a-io.dtb

[ ... ]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts b/arch=
/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
> new file mode 100644
> index 0000000000000..bfc50480668e4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

[ ... ]

> +&pcie2x1l0 {
> +	reset-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_0_rst>;
> +	vpcie3v3-supply =3D <&vcc3v3_pcie20_sata30>;
> +	status =3D "okay";
> +};
> +
> +&pcie2x1l1 {
> +	reset-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_1_rst>;
> +	vpcie3v3-supply =3D <&vcc3v3_pcie20_sata30>;
> +	status =3D "okay";
> +};

[Severity: High]
Does the pcie2x1l1 controller need its prerequisite PHY node enabled here?
Looking at the device tree, combphy2_psu is not marked with status =3D "oka=
y",
which might cause the PCIe controller probe to defer or fail completely.

> +
> +&pcie2x1l2 {
> +	status =3D "disabled";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601151810.1621=
73-1-hrushirajg23@gmail.com?part=3D3

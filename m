Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792835414;
	b=vQ6Uz0qAIjhQsrwueMK9/aIFHjCdC2GscyiI8xXl+Th4uLHbzvJ+QcPKeOnLbFoSdMTc
	 0XNEiXFwPksFbcwIyAdCfE2bDwv3CwH0pKXplx4uNdRhaWFPn8jdZpmJTbzu2oOM3Z64u
	 34ZPGvnmNTyjV7lNosaCYP9cDzTTIKQh8ZsvYQj0tcl3FFhA62iYVwUjnh5PXRDaYTkae
	 /kcumGxnkAjTV1jgYq+DHrLHGX1/CzyOcKUEpayb18+D1NnQtyP9B+9zhkSs/W+WitPAP
	 TZxzHZD0DrKDzvZi8Dpwv+pX5/YiM2PTKtIzVO6Qg1gNjn1FIfRJOolKEIQHYzojV1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792835414;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=joX7KNmhDorE+Hx6BDJVCLKKQ1nBdGQBaPGjr877ZVA=;
	b=UBG0sd4Jb7p22i5XbK3DCR5bqW6caTSseO5uqWDacwDSpUtNxT0qcNzE0jm/QPz3JpR0
	 X1nMDjiCAmHI3jdpS4NNKb8vXxR4uByASvbg+qdJlFRzUtPMUXSNuyE0nZJKZkL6bMBkR
	 0mwejzsXIfaKuCzHu7sbF0C+GrqVFouIelrsJl3KytKUYsk1Inpc1GOv6nB4YfsCorfz3
	 QJGP9i+o15wx6viwVor73kNgwjhy6ukAo4WsLDlP1wd9z8oYkfSdieyO05WfcTUpBinhm
	 tEGKDxnSZUtE5KKm8l02fIMG+fqMSVoyxE/HOv97pDGtTlJKhSOIWO/7DiPACsQkMVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F1FJwdfD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AA9606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F1FJwdfD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98421F01825;
	Sat, 24 Oct 2026 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792835413;
	bh=joX7KNmhDorE+Hx6BDJVCLKKQ1nBdGQBaPGjr877ZVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F1FJwdfDQbYTzjqL2Ol2OsvLVvTUaMS7UmE6Oi7ofh+XUMns+NANUnvANsmW6j7dL
	 9U8WQa1yMCwKdEElYVAIKwRXUfsvZJ6A19UHtuJZguNEYqD2RQikiu0xRcQsEDvV18
	 6LlxdNaBe1VHaMpO7J3CzdQw+Kvweh4/2VY5zx6VnTwbkNnR4A+aNOfOQ2wqHfWSmr
	 gCSD+OO77Qy557UaDj5OwlfXDtgmX63rvgWHYeFiO+1XRB1OW/5sPQPgnG94KNZESY
	 /xzRxxG4vjy9vJElsm2CVHiobouhpNQ5V4Dy/WRXqDe8wqvNvQHBSDiphKW0LqVZO6
	 IFgSYnfBDsK6w==
Message-ID: <sashiko-outbox-183632@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xincheng Ji" <jixincheng@ultrarisc.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261024-ultrarisc-dts-v6-7-c62994d8a114@ultrarisc.com>
References: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
 <20261024-ultrarisc-dts-v6-7-c62994d8a114@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 09:50:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] riscv: dts: ultrarisc: malformed PLIC node name breaks DTB build
- [Low] riscv: dts: ultrarisc: unrelated dp1000-shenrongda-m0.dts fixup
--

commit 81481b50c1512c545051667e9b53f021c85ecb18
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: Add Milk-V Titan board device tree

This commit adds the device tree and pinctrl definitions for the Milk-V
Titan ITX motherboard based on the UltraRISC DP1000 SoC.

Link: https://milkv.io/docs/titan/overview

> diff --git a/arch/riscv/boot/dts/ultrarisc/Makefile b/arch/riscv/boot/dts=
/ultrarisc/Makefile
> index 454d849a6ce4c..dfd15c064d078 100644
> --- a/arch/riscv/boot/dts/ultrarisc/Makefile
> +++ b/arch/riscv/boot/dts/ultrarisc/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_ULTRARISC) +=3D dp1000-milkv-titan.dtb
>  dtb-$(CONFIG_ARCH_ULTRARISC) +=3D dp1000-shenrongda-m0.dtb
> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dts=
i b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..7a812e40a2496
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include "dp1000.dtsi"

[Severity: Medium]
Does building dp1000-milkv-titan.dtb fail when CONFIG_ARCH_ULTRARISC is
enabled?

arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts includes
arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi, which
includes arch/riscv/boot/dts/ultrarisc/dp1000.dtsi (introduced in commit
65da27c69d17). In arch/riscv/boot/dts/ultrarisc/dp1000.dtsi, the plic node
is declared with a duplicated unit-address suffix:

	plic: interrupt-controller@9000000@9000000 {
		compatible =3D "ultrarisc,dp1000-plic", "ultrarisc,cp100-plic";
		reg =3D <0x0 0x9000000 0x0 0x4000000>;

When dtc compiles dp1000-milkv-titan.dtb, check_node_name_format() in
scripts/dtc/checks.c inspects the unit name via get_unitname(node), sees
the second '@' character, and aborts the build with a node_name_format
error:

	static void check_node_name_format(struct check *c, struct dt_info *dti,
					   struct node *node)
	{
		if (strchr(get_unitname(node), '@'))
			FAIL(c, dti, node, "multiple '@' characters in node name");
	}

Should the plic node in arch/riscv/boot/dts/ultrarisc/dp1000.dtsi be named
interrupt-controller@9000000 instead?

[ ... ]

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts b/arc=
h/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts
> index 43f713bcea257..b6027420175c2 100644
> --- a/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts
> @@ -106,7 +106,7 @@ mdio {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20
> -		phy0: phy@0 {
> +		phy0: ethernet-phy@0 {
>  			reg =3D <0>;
>  		};
>  	};

[Severity: Low]
Was this change to phy0 in arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-=
m0.dts
intended to be squashed into the preceding commit 5c5bd7084b50 ("riscv: dts:
ultrarisc: Add Shenzhen Rongda M0 board device tree") rather than included
in the Milk-V Titan patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-ultrarisc-=
dts-v6-0-c62994d8a114@ultrarisc.com?part=3D7

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834870;
	b=xVsZECg6GucCD9udvvANamY0n0PSPXMZTkCWbmHe9KnjIK/lS1fXiYrBc9wjI1RZxGr1
	 3Mgd59YCE7JQ+xyCOmmA4hheNMFQfEFyDXaZrOiYW35p1cuc15x3fo7gPsZMZIf+jJi1k
	 KG37TIM3BodbwxmlXP934agdT+ZYB4fZhXcDJKWHJiw5lMnZSlcz5Kh/Qf2tUgqtu1sWR
	 MunT30mA4yb29/WonEN5e41epESBi8ppO80n8KcJLCVdh3KFyiOabdGE6ItE6WwabvKhw
	 y2oSBj0UF/6oF98JK4OSaXnaCIMxENIuDhrTMQM4TRzo11Jkbub1I5Ll+HCalT/v1RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834870;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gp8v4YIpvhc/cW+8AAwH/pbh7kW/DrLh0VSfsyEpdY0=;
	b=Qq5Vy3zYi2yf+y4T+8vJPCTUNRChY7UGc/4LjpH59zlF6GmFoz/WDJIJpJ/iJeXyyH9R
	 NLu0hdV5cqI/+zxTQCtHjf6UFojxqIsbl5tBBCtXiAzm9rjbaXTs93ZCF7yl6/QMK35Fm
	 KgO2eHi79lVrkioYhXC/SiWnbtfmx17N7LC3bFQyR+y0UmN0Qa8TgWxu8CQVQ7uDmBreN
	 YCLfcC+J3L5u/8M4MDku4rERCkSNiXaSVUG/kWNKoVVKNuq2TQ2YH+ILhtLcHGq1nVy4+
	 P9x0YSlIISN+9YYm+QAp9ToXphA6NEroJ3879VL2Eqn0RQwQ9LZ5NKcx1Rv+cZqLWyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X96CjI4y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98DE606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X96CjI4y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58841F01825;
	Sat, 24 Oct 2026 09:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792834869;
	bh=gp8v4YIpvhc/cW+8AAwH/pbh7kW/DrLh0VSfsyEpdY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X96CjI4yQPel2m1uAa4dQu98jZ+TOmYr1MYIUvHY/9ZzcfeFQ5/fPBmt1KWbWOkwy
	 +SVz6/yPalDN82bwpqTkHkaoeBG3sGn3s0o71F2MNJpp/zHH3hc+TBuQo7b8JHkfuf
	 Jv+fz4tvRJU8MsOBh8KJjmBXLxP9VDxpktS8zsi++/QEyAhSqbmJDqUOGHUOoIDdYS
	 PStQ793SNT4XQvJFIyH+os36i4SUos+UafwcajUT8cAgs4dTO5z0eYaZH6eDu8qEFJ
	 nFWL9oRuTItnE0Uahzef/3tfnZD32D9I1aD/RBZhzGvNoyoTGG9FgX7RfPb8hszSMz
	 K/BNJmsOjeNYQ==
Message-ID: <sashiko-outbox-183626@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/7] riscv: dts: ultrarisc: Add Shenzhen Rongda M0
 board device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xincheng Ji" <jixincheng@ultrarisc.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261024-ultrarisc-dts-v6-6-c62994d8a114@ultrarisc.com>
References: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
 <20261024-ultrarisc-dts-v6-6-c62994d8a114@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 09:41:08 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] riscv: dts: ultrarisc: dtc build error from duplicate @9000000 on p=
lic
--

commit 5c5bd7084b50957dfbe0dd32f4f9ea2d09255694
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: Add Shenzhen Rongda M0 board device tree

This commit adds the device tree and pinctrl definitions for the Shenzhen
Rongda M0 mATX motherboard based on the UltraRISC DP1000 SoC, and enables
building dp1000-shenrongda-m0.dtb under CONFIG_ARCH_ULTRARISC.

> diff --git a/arch/riscv/boot/dts/ultrarisc/Makefile b/arch/riscv/boot/dts=
/ultrarisc/Makefile
> new file mode 100644
> index 0000000000000..454d849a6ce4c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_ULTRARISC) +=3D dp1000-shenrongda-m0.dtb
> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.d=
tsi b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..ab927c6cd6146
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include "dp1000.dtsi"

[Severity: Low]
Does building dp1000-shenrongda-m0.dtb with CONFIG_ARCH_ULTRARISC enabled f=
ail
in dtc?

arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts includes
dp1000-shenrongda-m0-pinctrl.dtsi, which in turn includes
arch/riscv/boot/dts/ultrarisc/dp1000.dtsi. In dp1000.dtsi, the plic node ha=
s a
duplicated @9000000 unit-address suffix:

arch/riscv/boot/dts/ultrarisc/dp1000.dtsi:
		plic: interrupt-controller@9000000@9000000 {
			compatible =3D "ultrarisc,dp1000-plic", "ultrarisc,cp100-plic";
			reg =3D <0x0 0x9000000 0x0 0x4000000>;

When dtc compiles dp1000-shenrongda-m0.dts, fill_fullpaths() splits the node
name at the first '@' character, leaving get_unitname(node) as
"9000000@9000000", which triggers a fatal error in check_node_name_format():

scripts/dtc/checks.c:
static void check_node_name_format(struct check *c, struct dt_info *dti,
				   struct node *node)
{
	if (strchr(get_unitname(node), '@'))
		FAIL(c, dti, node, "multiple '@' characters in node name");
}
ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);

Should the plic node in dp1000.dtsi be named interrupt-controller@9000000
instead of interrupt-controller@9000000@9000000 so that
dp1000-shenrongda-m0.dtb compiles cleanly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-ultrarisc-=
dts-v6-0-c62994d8a114@ultrarisc.com?part=3D6

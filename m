Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651928;
	b=YpW+yknpOpixpnkXp1hgOesPxwprotJgvFo4+6BzDiZhWkmQwVZc25tJ55eQuUMbvfgD
	 O9XgyBB/UitTbVxF5A+4juhRd1I+yoEWKxBn7exFcp8L6TI3j/emfidsD381lMxmMiOb2
	 aAkHolUWDNQUgxpjQr3BJq4bhY9JIAv/+MLo2LN9X/ZQoyDWOPUvtmkAbq8Y54sBzyMbF
	 BZ2CO4RCgxg8v/I6IfhNvW2PypmOvvB3lZnxTw5VbEjia2Lq0bGM7a1TWwaxcwELUmZyp
	 TBzUTOnzgxtOF5n8poiPJtVX0wnSFxpRDRBT1H19/ZNmee2seZB3uScvJH+SNlgHwJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651928;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DuvWyxT5NOqlzxvr9EpwXNjTl1LTphjX9/382O6Nkdg=;
	b=fF0DJcLBv0/5qD9Hmc6BJAsLlRw2M9amzxRupAoHbosMFAsUYyGB/WJFpeEgNBnkpiyX
	 H+zZwOZ9LI4QmEwt1V893A98RSrui1jbEj8Y6XZxKBLB3sItC3t0P1Wg3Yq8hvVE6wJtc
	 SC/szrT5wknlvfCr90vFesm0LOD7ejxoW0eQsBtizUwZ+jQ0yIkpd047zzcApEuKrm5M7
	 KzXfRYix0Q8Jak+6kLjUh6WKhHBIiVHixN5G3aRUkmXWNqqAzHFOtu1/Qu7xQPeW8PF9k
	 jZBkmyMsNm0A2qogyfokNCqkm0CrALhTOC+2n5eUdoBDZ2e1CSKElfd1Mtsp86KWqXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0ekh4Kd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168FA606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0ekh4Kd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669F11F000C1;
	Thu, 22 Oct 2026 06:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792651927;
	bh=DuvWyxT5NOqlzxvr9EpwXNjTl1LTphjX9/382O6Nkdg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g0ekh4KdIVrKZVG8q5SY1jyDQT2jFOS1vF/ov80BbjPXefiiQOnrGI4+G0pJvKdsS
	 M2cC7RWItQjj4AB8ay2R6HrffT7zx58YkldB2DGXLPneuSXDlws+JqJfJvH0L4LCEy
	 1gCVczzlSecgNJyNqumR7A3bzFMx0+QZqNcExpcPxDLs2hrhgjvIim7HmWarSPB9hH
	 tIZ6rE3nxHPjtUupuyZg0USByW4H098EPiH3W2Q8LA2ak1spPU7D/QKh71yH0Vj7v8
	 3TICcke6Cu8gdEro3ps9T4ld2YJS2i6tpZbQuF30GJPIG3i9ym/hYF0vkVA2edxnoC
	 xcgp/Qp4Gci4Q==
Message-ID: <sashiko-outbox-181107@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/2] sh: fx9750giii: add board support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Novak" <artem122novak@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022063936.472520-3-artem122novak@gmail.com>
References: <20261022063936.472520-1-artem122novak@gmail.com>
 <20261022063936.472520-3-artem122novak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 06:52:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] sh: fx9750giii: missing DT memory and init callbacks in mv_fx9750g=
iii
- [Medium] sh: SH_FX9750GIII depends on non-existent symbol CPU_SUBTYPE_SH7=
305
- [Medium] sh: fx9750giii: missing CPU_SUBTYPE_SH7305 Kconfig and sh7305.dt=
si
- [Low] sh: Makefile: machdir-y adds non-existent arch/sh/include/mach-fx97=
50giii
--

commit c63ad0601911097299cc121ef0d798a2a17535ce
Author: Artem Novak <artem122novak@gmail.com>

sh: fx9750giii: add board support

This commit adds minimal machine support and a Kconfig option for the Casio
fx-9750GIII graphing calculator. It registers the board machine vector and
wires the board directory into the SuperH build system.

> diff --git a/arch/sh/Makefile b/arch/sh/Makefile
> index 7b420424b6d7c..324c7e080eea6 100644
> --- a/arch/sh/Makefile
> +++ b/arch/sh/Makefile
> @@ -123,6 +123,7 @@ machdir-$(CONFIG_SH_KFR2R09)			+=3D mach-kfr2r09
>  machdir-$(CONFIG_SH_ECOVEC)			+=3D mach-ecovec24
>  machdir-$(CONFIG_SH_SDK7786)			+=3D mach-sdk7786
>  machdir-$(CONFIG_SH_X3PROTO)			+=3D mach-x3proto
> +machdir-$(CONFIG_SH_FX9750GIII)		+=3D mach-fx9750giii

[Severity: Low]
Should mach-fx9750giii be added to machdir-y here when
arch/sh/include/mach-fx9750giii does not exist?

In arch/sh/Makefile, machdir-y is used to construct compiler header search
paths:

    KBUILD_CPPFLAGS +=3D $(addprefix -I $(srctree)/arch/sh/include/, $(cpui=
ncdir-y) $(machdir-y))

while board directory compilation is handled by obj-$(CONFIG_SH_FX9750GIII)
in arch/sh/boards/Makefile.

When building the kernel with CONFIG_SH_FX9750GIII=3Dy, this passes
-I $(srctree)/arch/sh/include/mach-fx9750giii for a directory that does not
exist, triggering -Wmissing-include-dirs warnings under W=3D1 (and build
failures with CONFIG_WERROR=3Dy or in subdirectories that enable
-Wmissing-include-dirs). Other boards without board-specific headers under
arch/sh/include/, such as mach-rsk and mach-lboxre2, only add themselves to
arch/sh/boards/Makefile.

[ ... ]

> diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
> index d89b741772337..f1571b0e5f1f9 100644
> --- a/arch/sh/boards/Kconfig
> +++ b/arch/sh/boards/Kconfig
> @@ -326,6 +326,18 @@ config SH_LBOX_RE2
>  	help
>  	  Select L-BOX RE2 if configuring for the NTT COMWARE L-BOX RE2.
> =20
> +
> +config SH_FX9750GIII
> +	bool "Casio fx-9750GIII"
> +	depends on CPU_SUBTYPE_SH7305

[Severity: Medium]
Can CONFIG_SH_FX9750GIII ever be enabled when CPU_SUBTYPE_SH7305 is not
defined in Kconfig?

In arch/sh/boards/Kconfig, config SH_FX9750GIII depends on
CPU_SUBTYPE_SH7305, which is not defined in arch/sh/Kconfig alongside other
processor subtypes (such as config CPU_SUBTYPE_SH7343) or anywhere else in
the kernel tree:

    # SH4AL-DSP Processor Support

    config CPU_SUBTYPE_SH7343
            bool "Support SH7343 processor"

Because Kconfig evaluates undefined symbols as n, this dependency is never
satisfied when configuring the kernel for arch/sh, leaving
CONFIG_SH_FX9750GIII and arch/sh/boards/mach-fx9750giii/ unreachable and
unbuildable.

> +	select OF
> +	select OF_EARLY_FLATTREE
> +	help
> +	  Enable board support for the Casio fx-9750GIII
> +	  graphing calculator, based on the Renesas SH7305.
> +	  This selects the calculator machine vector and
> +	  enables early Device Tree support for the board.

[Severity: Medium]
Is this series also missing sh7305.dtsi in addition to the
CPU_SUBTYPE_SH7305 Kconfig definition?

In the subsequent commit in this series ("sh: dts: add Casio fx-9750GIII
board"), arch/sh/boot/dts/Makefile registers:

    dtb-$(CONFIG_SH_FX9750GIII) +=3D fx9750giii.dtb

and arch/sh/boot/dts/fx9750giii.dts contains:

    #include "sh7305.dtsi"

However, sh7305.dtsi does not exist anywhere in the kernel tree. When
building dtbs with CONFIG_OF_ALL_DTBS=3Dy or building fx9750giii.dtb direct=
ly
(or if CONFIG_SH_FX9750GIII is enabled), preprocessing
arch/sh/boot/dts/fx9750giii.dts fails because sh7305.dtsi is missing.

[ ... ]

> diff --git a/arch/sh/boards/mach-fx9750giii/setup.c b/arch/sh/boards/mach=
-fx9750giii/setup.c
> new file mode 100644
> index 0000000000000..233decdd1bfef
> --- /dev/null
> +++ b/arch/sh/boards/mach-fx9750giii/setup.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (C) 2026 Artem Novak
> +/*
> + * Casio fx-9750GIII platform support
> + *
> + */
> +
> +#include <linux/init.h>
> +
> +#include <asm/machvec.h>
> +
> +static struct sh_machine_vector mv_fx9750giii __initmv =3D {
> +	.mv_name	=3D "Casio fx-9750GIII",
> +};

[Severity: High]
Will leaving .mv_mem_init, .mv_mem_reserve, .mv_init_irq, and .mv_clk_init
unset in mv_fx9750giii corrupt the device tree and memory layout during
early boot?

During early boot on this platform, _stext calls sh_fdt_init() ->
early_init_dt_scan() -> early_init_dt_scan_memory(), which registers the
512 KB device tree memory region at 0x08000000 via memblock_add().

However, in arch/sh/boards/mach-fx9750giii/setup.c, mv_fx9750giii only sets
.mv_name and leaves .mv_mem_init, .mv_mem_reserve, .mv_init_irq, and
.mv_clk_init as NULL.

When setup_arch() -> sh_mv_setup() runs in arch/sh/kernel/machvec.c, a NULL
.mv_mem_init is replaced with generic_mem_init():

    mv_set(irq_demux);
    mv_set(mode_pins);
    mv_set(mem_init);

Then setup_arch() -> paging_init() in arch/sh/mm/init.c invokes
sh_mv.mv_mem_init() and checks sh_mv.mv_mem_reserve:

    sh_mv.mv_mem_init();

    early_reserve_mem();

    /*
     * Once the early reservations are out of the way, give the
     * platforms a chance to kick out some memory.
     */
    if (sh_mv.mv_mem_reserve)
            sh_mv.mv_mem_reserve();

In arch/sh/mm/init.c, generic_mem_init() unconditionally adds
__MEMORY_SIZE (64 MB by default via CONFIG_MEMORY_SIZE) on top of the
512 KB device tree memory node:

    void __init generic_mem_init(void)
    {
            memblock_add(__MEMORY_START, __MEMORY_SIZE);
    }

Furthermore, because .mv_mem_reserve is NULL, the in-RAM flattened device
tree blob and device tree reserved-memory regions are never reserved in
memblock before setup_arch() calls unflatten_device_tree(), allowing the
page allocator to overwrite live device_node structures. Leaving
.mv_init_irq and .mv_clk_init NULL also skips irqchip_init() and
of_clk_init(NULL) during init_IRQ() and clk_init().

For comparison, sh_of_generic_mv in arch/sh/boards/of-generic.c initializes
these callbacks for device tree platforms:

    static struct sh_machine_vector __initmv sh_of_generic_mv =3D {
            .mv_setup       =3D sh_of_setup,
            .mv_name        =3D "devicetree", /* replaced by DT root's mode=
l */
            .mv_irq_demux   =3D sh_of_irq_demux,
            .mv_init_irq    =3D sh_of_init_irq,
            .mv_clk_init    =3D sh_of_clk_init,
            .mv_mode_pins   =3D noopi,
            .mv_mem_init    =3D noop,
            .mv_mem_reserve =3D sh_of_mem_reserve,
    };

Should mv_fx9750giii wire up these device tree callbacks (or use the
generic device tree machine vector)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022063936.4725=
20-1-artem122novak@gmail.com?part=3D2

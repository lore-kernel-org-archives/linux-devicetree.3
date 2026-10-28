Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183824;
	b=3wX0yBVqRUTv8hT6VDWrBh4Lya08xgAmckNXR8Z+N7R0SEPCbdMZEqn8Gs/RapxlM2V+
	 5oeuTy0zEuR+A9/t3K5ek0TyBD8SK7oOtyVa+ZTbud0erB17yQikGqmzyDjshcRv88pzx
	 I9l78Do5AQBvEP8mvxhdhILnA9tunPrUDzqTjo41WmI0ewMl+GXzrJzQfWdNqRaVghmgg
	 1fYNRecauzeBELoM1IJ86kiQrpX640vZTKWFMaApCD5NqFgTGP+kT6gmn+GbzFiHL8kbr
	 qo0kE5zAg2ghvkr0yXRBe39W1WtgUXk19T3lHYtzmHweRn0RtFkO5USMqXq+3D1T8eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183824;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IuFE1CbUXRrxgTIqORqp/7lidcp91eBTsRAkZ1mmYME=;
	b=u+BU6w3XkPsJw+ff+N4q6cWtfjq/WtRU0G9iPiFDXX3fwQ0g0bNr+Kwl30rf4fdQ/RvU
	 a/j/QS1oX+HT0GX1WprcaUkUX8MqPTFcPHdlKtjCLm+eBLTsG9G28nnEZuzwCedcZOXDf
	 9Q5AiXxSHXrtyKIQwEQ8/y+7Cn/r9+ixbZJ83jjXnhTURk5Zs9uDrEjofHbtFyQ9WHwFx
	 V+hoC1Kevmm2AaWbnqLUFoy+aLOo4Q4NZ2wignOmLEmeHuWelh1hZMSS29dZ1XWCdA6am
	 6RPpYKp6LmcLSSSGOknO4sFWTKagOEcBbxhMO8ciOP4mTrMZPNHGuBpU3dhb9QbdoDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbQAknng;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5F1606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbQAknng
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F521F01825;
	Wed, 28 Oct 2026 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793183823;
	bh=IuFE1CbUXRrxgTIqORqp/7lidcp91eBTsRAkZ1mmYME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HbQAknngDAGtw7u6NEHWZlJOJer7XnZgj7gx3xKtFJFehk16NevtEAedR8omVMpKz
	 p5+U3G8KRKvSPrqyBh8dx8HaQAqG1kYt2QmHSLBNPUfrLbn/fECpGBBGKuSdLXu9CK
	 RkfpWYDitO5zG3Re7XdtvIbTkLbWMbtJpajkreSdLtuVqRvF9ydDohGUs6J+FPDOCd
	 FFolxERZPeaj+MPIj/R9CmwM4c8LIGLojosCkBuyw+pLPI1qcA3o1A13FbwRCPy92H
	 HLzjnNXdgcKrDK9g08WpWW1oX+Q9x9DtVPZwVDI8gna+HKBa93UDfEcKfXsekCXDFb
	 pvgXDbI4SDyGQ==
Message-ID: <sashiko-outbox-187752@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] powerpc/dts: Add dts for WatchGuard Firebox T30
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lefteris Koutrakis" <lefteris.koutrakis@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028102158.71032-1-lefteris.koutrakis@gmail.com>
References: <20261028102158.71032-1-lefteris.koutrakis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 10:37:02 +0000
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
- [High] powerpc/dts: missing machine descriptor for watchguard,firebox-t30=
 hangs boot
- [Medium] powerpc/dts: /delete-property/ used on CPU child node in firebox=
-t30.dts
- [Medium] powerpc/dts: out-of-tree DT properties and undocumented binding =
in firebox-t30
- [Low] powerpc/dts: invalid /include/ paths in firebox-t30.dts break dtc b=
uild
--

commit 14186547f28b2b27ac2d22fcbaad845f34789ba3
Author: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>

powerpc/dts: Add dts for WatchGuard Firebox T30

This commit adds a device tree source file and Makefile entry for the
WatchGuard Firebox T30 and T30-W security appliances based on the Freescale
P1020 SoC.

> diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/f=
sl/Makefile
> index d2cc8e1f007ea..ebbf301e1a8fc 100644
> --- a/arch/powerpc/boot/dts/fsl/Makefile
> +++ b/arch/powerpc/boot/dts/fsl/Makefile
> @@ -3,6 +3,7 @@
>  dtb-$(CONFIG_OF_ALL_DTBS) :=3D $(patsubst $(src)/%.dts,%.dtb, $(wildcard=
 $(src)/*.dts))
> =20
>  # MPC85xx platforms
> +dtb-$(CONFIG_MPC85xx_RDB) +=3D firebox-t30.dtb
>  dtb-$(CONFIG_BSC9131_RDB) +=3D bsc9131rdb.dtb
>  dtb-$(CONFIG_BSC9132_QDS) +=3D bsc9132qds.dtb
>  dtb-$(CONFIG_C293_PCIE) +=3D c293pcie.dtb
> diff --git a/arch/powerpc/boot/dts/fsl/firebox-t30.dts b/arch/powerpc/boo=
t/dts/fsl/firebox-t30.dts
> new file mode 100644
> index 0000000000000..546e989384b76
> --- /dev/null
> +++ b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
> @@ -0,0 +1,413 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/include/ "fsl/p1020si-pre.dtsi"

[Severity: Low]
Will dtc be able to resolve "fsl/p1020si-pre.dtsi" (and
"fsl/p1020si-post.dtsi" at the bottom of the file) when building from
arch/powerpc/boot/dts/fsl/?

In scripts/Makefile.dtbs, cmd_dtc invokes dtc with -i $(dir $<) (which is
arch/powerpc/boot/dts/fsl/) and -i scripts/dtc/include-prefixes:

    $(DTC) -o $@ -b 0 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) \
           $(DTC_FLAGS) -d $(depfile).dtc.tmp $(dtc-tmp) ; \

When srcfile_relative_open() -> fopen_any_on_path() in scripts/dtc/srcpos.c
resolves /include/ "fsl/p1020si-pre.dtsi" relative to
arch/powerpc/boot/dts/fsl/, it looks for
arch/powerpc/boot/dts/fsl/fsl/p1020si-pre.dtsi and fails the build when
CONFIG_MPC85xx_RDB or CONFIG_OF_ALL_DTBS is enabled.

Should both /include/ directives drop the "fsl/" prefix to match the other
device trees in arch/powerpc/boot/dts/fsl/?

> +
> +/ {
> +	model =3D "Watchguard Firebox T30";
> +	compatible =3D "watchguard,firebox-t30";

[Severity: High]
How does the kernel match a PowerPC machine descriptor when booting with
this device tree?

The root node sets compatible =3D "watchguard,firebox-t30", and
arch/powerpc/boot/dts/fsl/Makefile builds firebox-t30.dtb under
CONFIG_MPC85xx_RDB. However, arch/powerpc/platforms/85xx/mpc85xx_rdb.c only
defines machine descriptors for specific Freescale RDB compatible strings
such as "fsl,P1020RDB":

arch/powerpc/platforms/85xx/mpc85xx_rdb.c:
    define_machine(p1020_rdb) {
        .name           =3D "P1020 RDB",
        .compatible     =3D "fsl,P1020RDB",
        ...
    };

Without a matching define_machine() entry for "watchguard,firebox-t30" in
arch/powerpc/platforms/85xx/, setup_arch() -> probe_machine() in
arch/powerpc/kernel/setup-common.c reaches &__machine_desc_end and halts
boot in an infinite loop:

    if (machine_id >=3D &__machine_desc_end) {
        pr_err("No suitable machine description found !\n");
        for (;;);
    }

> +
> +	chosen {
> +		bootargs-override =3D "console=3DttyS0,115200 rw root=3D/dev/mmcblk0p2=
 rootfstype=3Dsquashfs rootwait";
> +	};
> +
> +	aliases {
> +		label-mac-device =3D &enet0;
> +		led-boot =3D &led0;
> +		led-failsafe =3D &led1;
> +		led-running =3D &led0;
> +		led-upgrade =3D &led1;
> +	};
> +
> +	memory {
> +		device_type =3D "memory";
> +	};
> +
> +	cpus {
> +		/delete-property/ PowerPC,P1020@1;
> +	};

[Severity: Medium]
Should this use /delete-node/ instead of /delete-property/ to remove
PowerPC,P1020@1?

In arch/powerpc/boot/dts/fsl/p1020si-pre.dtsi, PowerPC,P1020@1 is defined as
a child node under /cpus rather than a property:

    cpus {
        ...
        PowerPC,P1020@1 {
            device_type =3D "cpu";
            reg =3D <0x1>;
            next-level-cache =3D <&L2>;
        };
    };

In scripts/dtc/livetree.c, merge_nodes() handles /delete-property/ by
calling delete_property_by_name(), which only walks node->proplist and
leaves child nodes in node->children untouched. As a result, the second CPU
node remains present in the compiled DTB.

[ ... ]

> +		sdhc@2e000 {
> +			compatible =3D "fsl,p1020-esdhc", "fsl,esdhc";
> +			sdhci,auto-cmd12;
> +			reg =3D <0x2e000 0x1000>;
> +			interrupts =3D <0x48 0x2 0x0 0x0>;
> +			interrupt-parent =3D <&mpic>;
> +			fsl,sdhci-dma-broken;
> +			fsl,sdhci-ahb2mag-irq-bypass;
> +			fsl,sdhci-adjust-timeout;
> +			clock-frequency =3D <0>;
> +		};

[Severity: Medium]
Are these downstream OpenWrt properties in /chosen, /aliases, and
sdhc@2e000 intended for mainline?

In /chosen, early_init_dt_scan_chosen() in drivers/of/fdt.c only reads
"bootargs" and ignores "bootargs-override":

    p =3D of_get_flat_dt_prop(node, "bootargs", &l);
    if (p !=3D NULL && l > 0)
        strscpy(cmdline, p, min(l, COMMAND_LINE_SIZE));

In sdhc@2e000, the properties fsl,sdhci-dma-broken,
fsl,sdhci-ahb2mag-irq-bypass, and fsl,sdhci-adjust-timeout are not parsed
by drivers/mmc/host/sdhci-of-esdhc.c and are not permitted by
Documentation/devicetree/bindings/mmc/fsl,esdhc.yaml (which sets
unevaluatedProperties: false), while the standard properties in this node
duplicate what p1020si-post.dtsi already includes via pq3-esdhc-0.dtsi.

Similarly, the /aliases entries (label-mac-device, led-boot, led-failsafe,
led-running, led-upgrade) and the root compatible string
"watchguard,firebox-t30" are not documented under
Documentation/devicetree/bindings/.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028102158.7103=
2-1-lefteris.koutrakis@gmail.com?part=3D1

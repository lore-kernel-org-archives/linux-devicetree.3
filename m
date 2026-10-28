Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198832;
	b=apgC74VdWAHKu61Cf4P3Fyn9UPdPiEwz1NPO9RfjeXrmoQW6tG6Mhq88gzIauNS3mxp1
	 F5G75/C96Vj6MprVXsGdyOGxv4poPqgFRlK1gFOE8/Js8kuKdDLWwsyKPZYOzi5iMZC91
	 /MyzZnGfXqmEJkvpspcqHtq4P4CaSa2S1K4BicfRRaUNpKKVNLMIKVq0n6Q0JaWwBUQHU
	 5qptsNhwZ46ITPg833aFd4g5xdQaHlR8lzbO66eAtJSNaEe3TYy4dgm96MKER941GyUK1
	 Y1opT22m4XItMXZD1nJzfauAzlkCiRywe4wujtuAnC8o4P3dxPMAXdlODeTMkyxQcwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198832;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SK+SJm8u/SUS0ICp7DOPdj0TPEjlS7SD5+NWmy7LyTU=;
	b=WZvQaDFroeZxAgNrHG1f1Ec8tywZTSIMMVjHDz05N8K9oh9VeDhs5qhTTIW77SoTMmDQ
	 KkxPVbGKussAd6ncnquW/EPg5ACTTNnGO38lEVkpNt7kEMjFO1ZoYei+zlz5jU8G5UIRa
	 PeTLmJb0fu90efBgoz3TCkY//CU56KMFDpsKiGTuawkhZC9OUD1PoYXmQuFj/E5fbvy6b
	 LbalFpPoD8AL4YFqFUKRynFKekxFrNwEDQUtZGIaZZvQBDcYERTFGezaUwxp+S9+FNrp9
	 4+6AOxn7yd46mYXU3PUqe6dJ8btmZdSXSEd5hNp+1bclUrnDH4qs6h4vCldSrlH4raw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCzT+tOE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C80606A325
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCzT+tOE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622951F01825;
	Wed, 28 Oct 2026 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198831;
	bh=SK+SJm8u/SUS0ICp7DOPdj0TPEjlS7SD5+NWmy7LyTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GCzT+tOEP+ItVOS8G649vmbQlLYbKWjHsOyJUHUy1QO/JNscD4wVDFVGabBSoj7Rj
	 GE6ZTnnoajy6RRq9d5kOVL2gE721VY41JiaE36eIpLWXiwSTvqaQOJyn1fJdTjq+0F
	 tKKhtRmgmCwQvHKz5Sv79NJTOcFMKxnsQ4ITjXGzJNZwnhOzDzfMwkg1qDI+16yItM
	 DoKdW6Ft71oHgZZxcvOyO7WFPuKldeJHV1DAqP0GJz/V1a4/6UmPsYqz9AJX+OQkYI
	 MX+3OJw+ECCfks2/XN4DlmshU8qKV4dn13450m7sCRaquoy3wcp6q7cPQ9XWKyVWHj
	 XeswuFPHlWcDQ==
Message-ID: <sashiko-outbox-188010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] powerpc/dts: Add Device Tree for WatchGuard Firebox
 T30
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lefteris Koutrakis" <lefteris.koutrakis@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028143421.145290-1-lefteris.koutrakis@gmail.com>
References: <20261028143421.145290-1-lefteris.koutrakis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 14:47:10 +0000
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
- [Medium] powerpc/dts: invalid compatible string in firebox-t30 tpm@29 node
- [Low] powerpc/dts: duplicate firebox-t30.dtb entry in fsl/Makefile
- [Low] powerpc/dts: malformed spi@7000 interrupts and redundant SoC proper=
ties
- [Low] powerpc/dts: firebox-t30: undocumented compatible and unsupported D=
T properties
--

commit 68d1b53d33f85dd0ec26113a393584818efd23a1
Author: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>

powerpc/dts: Add Device Tree for WatchGuard Firebox T30

This commit adds a new Device Tree source file for the WatchGuard Firebox T=
30
board based on the Freescale P1020 SoC and hooks it into the Freescale Powe=
rPC
DTS Makefile.

> diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/f=
sl/Makefile
> index d2cc8e1f007ea..0a5c8b5967335 100644
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
> @@ -44,3 +45,4 @@ dtb-$(CONFIG_GEF_SBC310) +=3D gef_sbc310.dtb
>  dtb-$(CONFIG_GEF_SBC610) +=3D gef_sbc610.dtb
>  dtb-$(CONFIG_GEF_PPC9A) +=3D gef_ppc9a.dtb
>  dtb-$(CONFIG_MVME7100) +=3D mvme7100.dtb
> +dtb-$(CONFIG_MPC85xx_RDB) +=3D firebox-t30.dtb

[Severity: Low]
Is this second addition of firebox-t30.dtb to dtb-$(CONFIG_MPC85xx_RDB) at
the bottom of arch/powerpc/boot/dts/fsl/Makefile (under the MPC86xx platfor=
ms
section) unintended?

Since firebox-t30.dtb is already appended to dtb-$(CONFIG_MPC85xx_RDB) at t=
he
start of the MPC85xx platforms section, building with CONFIG_MPC85xx_RDB=3Dy
causes firebox-t30.dtb to be listed twice in $(dtb-y) and $(obj)/dtbs-list =
via
scripts/Makefile.dtbs.

> diff --git a/arch/powerpc/boot/dts/fsl/firebox-t30.dts b/arch/powerpc/boo=
t/dts/fsl/firebox-t30.dts
> new file mode 100644
> index 0000000000000..6e9ec7f90ece2
> --- /dev/null
> +++ b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
> @@ -0,0 +1,398 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/include/ "p1020si-pre.dtsi"
> +
> +/ {
> +	model =3D "Watchguard Firebox T30";
> +	compatible =3D "watchguard,firebox-t30", "fsl,P1020RDB";

[ ... ]

> +	soc: soc@ffe00000 {
> +		ranges =3D <0x0 0x0 0xffe00000 0x100000>;
> +
> +		i2c@3000 {
> +			rtc@30 {
> +				compatible =3D "sii,s35390a";
> +				reg =3D <0x30>;
> +			};
> +		};
> +
> +		i2c@3100 {
> +			tpm@29 {
> +				compatible =3D "tpm,tpm_i2c_atmel";
> +				reg =3D <0x29>;
> +			};
> +		};

[Severity: Medium]
Should the compatible property for tpm@29 under i2c@3100 be
"atmel,at97sc3204t" instead of "tpm,tpm_i2c_atmel"?

In drivers/char/tpm/tpm_i2c_atmel.c, the OF match table only matches
"atmel,at97sc3204t":

    static const struct of_device_id i2c_atmel_of_match[] =3D {
        {.compatible =3D "atmel,at97sc3204t"},
        {},
    };
    MODULE_DEVICE_TABLE(of, i2c_atmel_of_match);

When an I2C device is instantiated from Device Tree, i2c_device_uevent() in
drivers/i2c/i2c-core-base.c emits only the OF modalias and returns before
emitting the legacy i2c: modalias:

    rc =3D of_device_uevent_modalias(dev, env);
    if (rc !=3D -ENODEV)
        return rc;

With compatible =3D "tpm,tpm_i2c_atmel", the kernel emits
MODALIAS=3Dof:NtpmT(null)Ctpm,tpm_i2c_atmel, which prevents automatic module
loading when CONFIG_TCG_TIS_I2C_ATMEL=3Dm and fails DT schema validation ag=
ainst
Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml.

> +
> +		sdhc@2e000 {
> +			compatible =3D "fsl,p1020-esdhc", "fsl,esdhc";
> +			sdhci,auto-cmd12;
> +			reg =3D <0x2e000 0x1000>;
> +			interrupts =3D <0x48 0x2 0x0 0x0>;
> +			interrupt-parent =3D <&mpic>;
> +			clock-frequency =3D <0>;
> +		};
> +
> +		spi0: spi@7000 {
> +			compatible =3D "fsl,mpc8536-espi";
> +			reg =3D <0x7000 0x1000>;
> +			interrupts =3D <0x3b 0x2>;
> +			interrupt-parent =3D <&mpic>;
> +			fsl,espi-num-chipselects =3D <4>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;

[Severity: Low]
Can the SoC-level properties in sdhc@2e000 and spi0: spi@7000 be dropped he=
re
so they are inherited from p1020si-post.dtsi?

In spi0: spi@7000, interrupts =3D <0x3b 0x2> only provides 2 cells for &mpi=
c,
whereas mpic: pic@40000 in pq3-mpic.dtsi requires #interrupt-cells =3D <4>.
Because p1020si-post.dtsi (which includes pq3-espi-0.dtsi and pq3-esdhc-0.d=
tsi)
is included at the bottom of firebox-t30.dts, dtc overwrites this 2-cell
specifier with the 4-cell interrupts =3D <59 0x2 0 0> definition from
pq3-espi-0.dtsi.

Furthermore, sdhc@2e000 only repeats properties already defined in
p1020si-post.dtsi and pq3-esdhc-0.dtsi without adding any board-specific
configuration, and spi@7000 only needs to define its flash@0 and slic@1 chi=
ld
nodes.

[ ... ]

> +		enet0: ethernet@b0000 {
> +			phy-connection-type =3D "rgmii-id";
> +			rx-internal-delay-ps =3D <2000>;
> +			tx-internal-delay-ps =3D <2000>;
> +			nvmem-cells =3D <&macaddr_nor_cfg0_1830 0>;
> +			nvmem-cell-names =3D "mac-address";
> +
> +			fixed-link {
> +				speed =3D <1000>;
> +				full-duplex;
> +			};
> +		};

[ ... ]

> +			ath10k: wifi@0,0 {
> +				reg =3D <0x0000 0 0 0 0>;
> +				#gpio-cells =3D <2>;
> +				gpio-controller;
> +				nvmem-cells =3D <&macaddr_nor_cfg0_1894 0>;
> +				nvmem-cell-names =3D "mac-address";
> +			};

[Severity: Low]
Are the following bindings and properties in firebox-t30.dts intentional?

1. The root node uses compatible =3D "watchguard,firebox-t30", "fsl,P1020RD=
B",
   where neither the "watchguard" vendor prefix (in
   Documentation/devicetree/bindings/vendor-prefixes.yaml) nor the
   "watchguard,firebox-t30" board compatible string is documented.

2. enet0: ethernet@b0000 (an fsl,etsec2 device from pq3-etsec2-0.dtsi) sets
   rx-internal-delay-ps =3D <2000> and tx-internal-delay-ps =3D <2000>, whi=
ch the
   gianfar driver in drivers/net/ethernet/freescale/gianfar.c does not parse
   or support.

3. ath10k: wifi@0,0 declares gpio-controller and #gpio-cells =3D <2>, which=
 are
   not supported by the ath10k driver or its binding in
   Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml, and are
   not referenced elsewhere in this DTS.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028143421.1452=
90-1-lefteris.koutrakis@gmail.com?part=3D1

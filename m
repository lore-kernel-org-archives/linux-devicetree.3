Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579F44BCACA;
	Wed,  6 May 2026 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778089498; cv=none; b=kCvJYnfqVoKziW+31TnRJ23ZdlYPHJ+XJpnNm9U6P+i6BFiklLnJG3VLl9YTv434e1gIS6RmnhMXphH7/Na0QZi3H3LjI9xiIibh4WdgHkSglyTjJuUzDQInYOtE53YnsiXWzqrDx2V7EH6Ks6mHhqElS0/faMntQpgmqWTVZYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778089498; c=relaxed/simple;
	bh=ZmMSBgWoVtXt9pPcFaiLROafSxVn0gpv/awkaUvEKh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bF5Bl9ckUfOlgexB2GwMBNE7rwncMZlqbx5+amYacliYVJPjkCWXVxHhPZwS1N0U6BsDBCDFd84BH9qUl7TLd2iIQgicy7EVN5ERDRpW1NSb3Ak/3vXTO2gNVGd4hf5LZaqAyrXKyD4zyT5mUNJi4xW0sW31qS32LyRzKTg9EY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPwgCAxd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPwgCAxd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F267EC2BCB8;
	Wed,  6 May 2026 17:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778089497;
	bh=ZmMSBgWoVtXt9pPcFaiLROafSxVn0gpv/awkaUvEKh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPwgCAxdpaxxed8rh/FF97QIB4mYMNI1oTRTFVQXLtbMSEorhxuOGZuCMjberyUD7
	 Z8SgW2QZvGL4WgrdfofynRQ/YQYBK/bF6shI0Up7Ch4i+FpLIJYSb7veKe95k/mFfa
	 CjvqU+aXpP2EoeCGeP1ZMyZMFlzK5oMVJXWq7dfcCap7Ze/LShulzkaGh6f8bIi2r3
	 cm4PDg0MLC8yhDjK6O0JaQq1lAlJfVW3UURbqfnOz05RuW5JzrX7MjcGfTeEU/0oe6
	 NheS859QfCncoihC2mcYwrjO2vLSCdEOE1OexenucZ5IWxFiFGJpA6M9dAWpat9qx5
	 tkQHEglI2LFIQ==
Date: Wed, 6 May 2026 18:44:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Yixun Lan <dlan@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Guodong Xu <guodong@riscstar.com>,
	Michal Simek <michal.simek@amd.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>, Icenowy Zheng <uwu@icenowy.me>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Michael Zhu <michael.zhu@starfivetech.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: jhb100: Add JHB100 base DT
Message-ID: <20260506-proud-dubbed-9ab8011df899@spud>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
 <20260506085937.754808-5-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3tCyEtlHKzoPzEv0"
Content-Disposition: inline
In-Reply-To: <20260506085937.754808-5-changhuang.liang@starfivetech.com>


--3tCyEtlHKzoPzEv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 01:59:37AM -0700, Changhuang Liang wrote:
> From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>=20
> Add JHB100 base dtsi and dts. Consist of 4 Dubhe-70 cores, CLINT, PLIC,
> PMU, UART, INTC and 1GB DDR.
>=20
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                  |   6 +
>  arch/riscv/boot/dts/starfive/Makefile        |   2 +
>  arch/riscv/boot/dts/starfive/jhb100-evb1.dts |  32 ++
>  arch/riscv/boot/dts/starfive/jhb100.dtsi     | 337 +++++++++++++++++++
>  4 files changed, 377 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1.dts
>  create mode 100644 arch/riscv/boot/dts/starfive/jhb100.dtsi
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0dfad67f66c0..22e34d2ad696 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25588,6 +25588,12 @@ F:	Documentation/devicetree/bindings/phy/starfiv=
e,jh7110-usb-phy.yaml
>  F:	drivers/phy/starfive/phy-jh7110-pcie.c
>  F:	drivers/phy/starfive/phy-jh7110-usb.c
> =20
> +STARFIVE JHB100 DEVICETREES
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Supported
> +F:	arch/riscv/boot/dts/starfive/jhb100*
> +
>  STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
>  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>  S:	Supported
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/=
starfive/Makefile
> index 3dd1f05283f7..42841942fe54 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -18,3 +18,5 @@ dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-vision=
five-2-lite.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-lite-emmc.=
dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.3b.dtb
> +
> +dtb-$(CONFIG_ARCH_STARFIVE) +=3D jhb100-evb1.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1.dts b/arch/riscv/bo=
ot/dts/starfive/jhb100-evb1.dts
> new file mode 100644
> index 000000000000..462b6fb7953b
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (c) 2024-2026 StarFive Technology Co., Ltd.
> + */
> +
> +#include "jhb100.dtsi"
> +
> +/ {
> +	model =3D "StarFive JHB100 EVB-1";
> +	compatible =3D "starfive,jhb100-evb1", "starfive,jhb100";
> +
> +	aliases {
> +		serial6 =3D &uart6;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial6:115200n8";
> +	};
> +
> +	cpus {
> +		timebase-frequency =3D <5000000>;
> +	};
> +
> +	memory@40000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x40000000 0x0 0x40000000>;	/* 1GB */
> +	};
> +};
> +
> +&uart6 {
> +	status =3D "okay";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/d=
ts/starfive/jhb100.dtsi
> new file mode 100644
> index 000000000000..4133ba1f45b4
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
> @@ -0,0 +1,337 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (c) 2024-2026 StarFive Technology Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +	compatible =3D "starfive,jhb100";
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "starfive,dubhe-70", "riscv";
> +			reg =3D <0x0>;

> +			riscv,isa =3D "rv64imafdcbh";

Please just remove this property.

> +			riscv,isa-base =3D "rv64i";
> +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "b", "h", "zba=
", "zbb",
> +					       "zbc", "zbs", "zicbom", "zicbop", "zicboz", "zicntr",
> +					       "zicond", "zicsr", "zifencei", "zihintpause",
> +					       "zihpm", "svinval", "svnapot", "sscofpmf";
> +			riscv,cbom-block-size =3D <64>;
> +			riscv,cbop-block-size =3D <64>;
> +			riscv,cboz-block-size =3D <64>;
> +			d-cache-block-size =3D <64>;
> +			d-cache-sets =3D <512>;
> +			d-cache-size =3D <32768>;
> +			d-tlb-sets =3D <1>;
> +			d-tlb-size =3D <16>;
> +			device_type =3D "cpu";
> +			i-cache-block-size =3D <64>;
> +			i-cache-sets =3D <512>;
> +			i-cache-size =3D <32768>;
> +			i-tlb-sets =3D <1>;
> +			i-tlb-size =3D <24>;
> +			mmu-type =3D "riscv,sv48";
> +			next-level-cache =3D <&l2c0>;
> +			tlb-split;
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells =3D <1>;
> +			};
> +		};

> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu =3D <&cpu0>;
> +				};
> +			};

Each cpu is in a different cluster? Interesting, suppose it makes sense
when you have different l2 caches. What other resources are not shared?
Do they have different cpu clocks too etc?

> +
> +			cluster1 {
> +				core0 {
> +					cpu =3D <&cpu1>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu =3D <&cpu2>;
> +				};
> +			};
> +
> +			cluster3 {
> +				core0 {
> +					cpu =3D <&cpu3>;
> +				};
> +			};
> +		};
> +
> +		l2c0: cache-controller-0 {
> +			compatible =3D "cache";
> +			cache-block-size =3D <64>;
> +			cache-level =3D <2>;
> +			cache-sets =3D <2048>;
> +			cache-size =3D <0x20000>;
> +			cache-unified;
> +			next-level-cache =3D <&l3_cache>;
> +		};
> +
> +		l2c1: cache-controller-1 {
> +			compatible =3D "cache";
> +			cache-block-size =3D <64>;
> +			cache-level =3D <2>;
> +			cache-sets =3D <2048>;
> +			cache-size =3D <0x20000>;
> +			cache-unified;
> +			next-level-cache =3D <&l3_cache>;
> +		};
> +
> +		l2c2: cache-controller-2 {
> +			compatible =3D "cache";
> +			cache-block-size =3D <64>;
> +			cache-level =3D <2>;
> +			cache-sets =3D <2048>;
> +			cache-size =3D <0x20000>;
> +			cache-unified;
> +			next-level-cache =3D <&l3_cache>;
> +		};
> +
> +		l2c3: cache-controller-3 {
> +			compatible =3D "cache";
> +			cache-block-size =3D <64>;
> +			cache-level =3D <2>;
> +			cache-sets =3D <2048>;
> +			cache-size =3D <0x20000>;
> +			cache-unified;
> +			next-level-cache =3D <&l3_cache>;
> +		};
> +
> +		l3_cache: cache-controller-4 {
> +			compatible =3D "cache";
> +			cache-block-size =3D <64>;
> +			cache-level =3D <3>;
> +			cache-sets =3D <1024>;
> +			cache-size =3D <0x20000>;
> +			cache-unified;
> +		};
> +	};

> +	clk_uart: clock-25000000 {
> +		compatible =3D "fixed-clock"; /* Initial clock handler for UART */

What does this comment mean?

> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <25000000>;
> +	};
> +
> +	soc {
> +		compatible =3D "simple-bus";
> +		interrupt-parent =3D <&plic>;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		dma-ranges;
> +		ranges;
> +
> +		clint: timer@2000000 {
> +			compatible =3D "starfive,jhb100-clint", "sifive,clint0";
> +			reg =3D <0x0 0x02000000 0x0 0x10000>;
> +			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>,
> +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> +					      <&cpu3_intc 3>, <&cpu3_intc 7>;
> +		};
> +
> +		plic: interrupt-controller@c000000 {
> +			compatible =3D "starfive,jhb100-plic", "sifive,plic-1.0.0";
> +			reg =3D <0x0 0x0c000000 0x0 0x4000000>;
> +			riscv,ndev =3D <400>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <1>;
> +			#address-cells =3D <0>;
> +			interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>,
> +					      <&cpu1_intc 11>, <&cpu1_intc 9>,
> +					      <&cpu2_intc 11>, <&cpu2_intc 9>,
> +					      <&cpu3_intc 11>, <&cpu3_intc 9>;
> +		};
> +
> +		bus_nioc: bus_nioc {

jhb100-evb1.dtb: bus_nioc (simple-bus): $nodename:0: 'bus_nioc' does not ma=
tch '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
        from schema $id: http://devicetree.org/schemas/simple-bus.yaml


Cheers,
Conor.

> +			compatible =3D "simple-bus";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			dma-noncoherent;
> +			dma-ranges =3D <0x4 0x00000000 0x0 0x40000000 0x2 0x0>,
> +				     <0x4 0x00000000 0x4 0x00000000 0x2 0x0>;
> +			ranges;
> +
> +			uart6: serial@11982000 {
> +				compatible =3D "snps,dw-apb-uart";
> +				reg =3D <0x0 0x11982000 0x0 0x400>;
> +				clocks =3D <&clk_uart>, <&clk_uart>;
> +				clock-names =3D "baudclk", "apb_pclk";
> +				interrupt-parent =3D <&intc>;
> +				interrupts =3D <26>;
> +				reg-io-width =3D <4>;
> +				reg-shift =3D <2>;
> +				status =3D "disabled";
> +			};
> +
> +			intc: interrupt-controller@13220000 {
> +				compatible =3D "starfive,jhb100-intc";
> +				reg =3D <0x0 0x13220000 0x0 0x80>;
> +				interrupts =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <1>;
> +			};
> +		};
> +	};
> +};
> --=20
> 2.25.1
>=20

--3tCyEtlHKzoPzEv0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaft+EQAKCRB4tDGHoIJi
0rd4AP43nGycLBSIKTznxWMihonljZWvV81MDpg7Vz7S+sBFYgEA6phltZkz693z
FUii8VSiQeITFdNZB39U4XEzXuhx1As=
=YYdo
-----END PGP SIGNATURE-----

--3tCyEtlHKzoPzEv0--

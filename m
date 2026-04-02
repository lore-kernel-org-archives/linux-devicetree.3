Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6823AC0FD;
	Thu,  2 Apr 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132749; cv=none; b=t1XJ/jVZ5umG/GmPMJP9wFG3bAwBPP81mg33QczSKuv0q1xORfjwbejuvriUsc9vRNsG4d71RCwSaAqAyJ1OIf4AeQ8R14eI1L4L0RcTpmcqXWEODobBGBachQDP94WKswHQpgkagX8YIZoLK3WbxK7CU1QUCGBuEeqhFQXoaV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132749; c=relaxed/simple;
	bh=A9qss19id8aEDS/Daora8wd8YySFOi8TeljTFjT0/8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/jZS/aagX6hVZuyK1gIlntwFUe6SzPEAcI1sFzAJvbGijBdF2ZWZJtMvWvRkA7jV8K6GKUZxbEDkARe11LTvWZUOxseSt65HFJvQcfDYko3w9/4k4w7Q4vpIZ9pSpmdzYciI41cMip7bIWazpChxx5oyC04+WxR/vSeiooRBzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjnTwmg9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjnTwmg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CD2C116C6;
	Thu,  2 Apr 2026 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775132748;
	bh=A9qss19id8aEDS/Daora8wd8YySFOi8TeljTFjT0/8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjnTwmg9tl0xtuonCUtnkNri70pDB+DgXb/5scOyiB9f6uu3ZDGdibxZIDFbUb9af
	 NgU749vIN9syriB5I91U1otBebcBVNoZo8o48rQuHGbAMifpJ2nAi5hXbcrAwuWt3k
	 0TNdk1lwQHMh4cbZedqXLbhZvAtgz44GV5fYqe2sQ97foFS8PXNmpnEaCL0ZXjmkIP
	 w5sLzeGvPxPII9sxopuKBbPuBEgu/LLbx4g/FcPEkdd4BqCkG0vatmSiLW9Wshb6v+
	 Kjy3DUPuQfkYjhqrGzt0xeRdxZlF0ufUOr52IbHff6OhyRcDh72TnlTq1XVM/dp/ue
	 DrXS1s4vpmxvQ==
Date: Thu, 2 Apr 2026 13:25:41 +0100
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
Subject: Re: [PATCH v1 5/5] riscv: dts: starfive: jhb100: Add JHB100 base DT
Message-ID: <20260402-shakable-hefty-0164a042b748@spud>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
 <20260402084019.440708-6-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="37H7PQhY4CmOWSPg"
Content-Disposition: inline
In-Reply-To: <20260402084019.440708-6-changhuang.liang@starfivetech.com>


--37H7PQhY4CmOWSPg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 01:40:19AM -0700, Changhuang Liang wrote:
> From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>=20
> Add JHB100 base dtsi and dts. Consist of 4 Dubhe-70 cores, CLINT, PLIC,
> PMU, UART and 1GB DDR.
>=20
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |   6 +
>  arch/riscv/boot/dts/starfive/Makefile         |   2 +
>  .../boot/dts/starfive/jhb100-evb1-eth.dts     |   6 +
>  arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi |  32 ++
>  arch/riscv/boot/dts/starfive/jhb100.dtsi      | 326 ++++++++++++++++++
>  5 files changed, 372 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
>  create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
>  create mode 100644 arch/riscv/boot/dts/starfive/jhb100.dtsi
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d10988cbc62..b1892a480c31 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25306,6 +25306,12 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jh810=
0-intc.yaml
>  F:	drivers/irqchip/irq-starfive-jh8100-intc.c
> =20
> +STARFIVE JHB100 DEVICETREES
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained

Supported, no?

> +F:	arch/riscv/boot/dts/starfive/jhb100*
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/=
starfive/Makefile
> index 3dd1f05283f7..7cdb75788053 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -18,3 +18,5 @@ dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-vision=
five-2-lite.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-lite-emmc.=
dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.3b.dtb
> +
> +dtb-$(CONFIG_ARCH_STARFIVE) +=3D jhb100-evb1-eth.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts b/arch/risc=
v/boot/dts/starfive/jhb100-evb1-eth.dts
> new file mode 100644
> index 000000000000..62cd046e1224
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (c) 2024-2026 StarFive Technology Co., Ltd.
> + */
> +
> +#include "jhb100-evb1.dtsi"

What is the point of this file? Is this the base-board?
Shouldn't it have a specific compatible?

Can the SoM be used without a base board? I've got no info about this
board appearing on google, do you even have pictures of it or any
documentation?
I see this
https://www.starfivetech.com/en/index.php?s=3Dhardware&c=3Dshow&id=3D22
and
https://www.starfivetech.com/en/index.php?s=3Dhardware&c=3Dshow&id=3D23
but the former doesn't look like it needs a base-board and the latter is
called "evb3", so is not what's here?

Not got enough info to really do any kind of review here.

> diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi b/arch/riscv/b=
oot/dts/starfive/jhb100-evb1.dtsi
> new file mode 100644
> index 000000000000..462b6fb7953b
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
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

> +		cpu2: cpu@2 {
> +			compatible =3D "starfive,dubhe-70", "riscv";
> +			riscv,isa =3D "rv64imafdcbh";
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
> +			next-level-cache =3D <&l2c2>;
> +			reg =3D <0x2>;

reg after compatible please.

> +			tlb-split;
> +
> +			cpu2_intc: interrupt-controller {
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells =3D <1>;
> +			};
> +		};

--37H7PQhY4CmOWSPg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCac5gRQAKCRB4tDGHoIJi
0mq/AQCdGRhH7fMsETbsHy/7XAwGdd6dyCgef5Ry/G9ZUAIsYQD/QcGn7v8E4xpq
1187O7K4oldFt4xV97meM3SOU86bkAI=
=u85q
-----END PGP SIGNATURE-----

--37H7PQhY4CmOWSPg--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33458267B89
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265846; cv=none; b=ZeKf+VXwg4gJkE2Of5OvB0L73MCb3VrzcksxQ5A7+eQr2/l6HTIYI9C0/1+Ar84rubzgoNMp3mksYrFJN1ZZxqKYMoDZLJL0huDC468TcJIH/Q5dvBscTeshjl3yNpyW8ELSGQx+JURaCIAgNrQJFFWiwrtSkGGuiKmZJ0F7o/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265846; c=relaxed/simple;
	bh=JGP25XwX6vmsxhqromP2uuC32CHu//Il7LAz/dMFIy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t9FZDa4HKi8LxWKaZnvB/xwqPG20Nptf4Odk1QO8P5EoWPvtI0gGHibc7yDgQ4Jqq3q39WG0dKmyo4tG9syEoXxUxwz6vLyOWUPAYRSJx4AAq2wJq9Fm9d7A9UlvkUKl0WdNc9b2FN+2OAruoJwjoBWKug4sMdUBKteEci679LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAp8dTix; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAp8dTix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C4D1F000E9;
	Tue,  1 Sep 2026 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788265844;
	bh=m2mKhuL+nNQBhwiWfaQ76ZqZhvqa2cFQyWbroxigplA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mAp8dTixSGv2JI5fE7C9Ok4IW4g6kauujM8teFCpmmUuNpSvjaQX4v0wzqFWMtQ03
	 eFjsq23iU+TRIOHIt/KqcP692KBD1zZ0gLXd3FYAlGyDwcilQeNu1axsVo6uwHz0Lo
	 TPPPjVYCxo5BqNuQNd6UTNY6NFIFZPuem9L+2q2+YwnXK3mheMkXvrkowj5ivgZAtL
	 BQZ7kdQSM95lixIc/2+54WN88wFem59HwYtkGiC3lPJp9bxEpVBTQBLjwu6+nrxhG7
	 1yJ7k2NE43i1M2kNT5xAFks6tj0PmQAYdIbi/NFu4VV6ZVm6rI2wJ7NKoSUjWAomXE
	 BrdggN5dFASIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/11] ARM: dts: aspeed: anacapa: Add EVT1 devicetree
 and point wrapper to it
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901-anacapa-devlop-phase-devicetree-v7-1-0bd71d2e0105@gmail.com>
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
 <20260901-anacapa-devlop-phase-devicetree-v7-1-0bd71d2e0105@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 12:30:44 +0000
Message-Id: <20260901123044.80C4D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] The board compatible string was silently changed from "faceboo=
k,anacapa-bmc" to "facebook,anacapa", breaking dt-bindings and backward com=
patibility.
- [Low] The /dts-v1/ directive is improperly placed inside a .dtsi include =
file instead of the top-level .dts file.

Pre-existing issues:
- [High] Multiple consumer nodes request GPIO pins and interrupts from sgpi=
om0 that strictly exceed its defined maximum limit of 128.
--

commit aa5900d50b8d457379595fa4812e97d97a192959
Author: Colin Huang <u8813345@gmail.com>
Subject: ARM: dts: aspeed: anacapa: Add EVT1 devicetree and point wrapper t=
o it

This commit introduces an EVT1 development-phase devicetree for the
Facebook Anacapa BMC. It updates the top-level wrapper DTS to include
the EVT1 hardware revision file and pushes down several configurations.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dt=
si b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
> new file mode 100644
> index 0000000000000..017700920cb1d
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
> @@ -0,0 +1,1128 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/dts-v1/;
> +#include "aspeed-g6.dtsi"

[Severity: Low]
Is it standard practice to place the /dts-v1/ directive inside a .dtsi
include file instead of the top-level .dts file?

> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	compatible =3D "facebook,anacapa", "aspeed,ast2600";

[Severity: Critical]
Does changing the board compatible string from "facebook,anacapa-bmc" to
"facebook,anacapa" break dt-bindings and backward compatibility?=20

Userspace applications and bootloaders often rely on the exact string in
/proc/device-tree/compatible to identify the board. Could this modification
cause them to fail unconditionally on boot?

[ ... ]
> +		i2c8mux0ch0: i2c@0 {
> +			reg =3D <0>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			adc@1f {
> +				compatible =3D "ti,adc128d818";
> +				reg =3D <0x1f>;
> +				ti,mode =3D /bits/ 8 <1>;
> +			};
> +
> +			gpio@22 {
> +				compatible =3D "nxp,pca9555";
> +				reg =3D <0x22>;
> +				#gpio-cells =3D <2>;
> +				gpio-controller;
[ ... ]
> +				interrupt-parent =3D <&sgpiom0>;
> +
> +				interrupts =3D <174 IRQ_TYPE_LEVEL_LOW>;
> +			};

[Severity: High]
This is a pre-existing issue, but does requesting IRQ line 174 from the
sgpiom0 controller exceed its defined maximum limit of 128?

The gpiolib and IRQ domain could reject this out-of-bounds request, causing
the driver to fail probing with -EINVAL.

[ ... ]
> +		i2c13mux0ch7: i2c@7 {
> +			reg =3D <7>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			nfc@28 {
> +				compatible =3D "nxp,nxp-nci-i2c";
> +				reg =3D <0x28>;
> +
> +				enable-gpios =3D <&sgpiom0 241 GPIO_ACTIVE_HIGH>;
> +				interrupt-parent =3D <&sgpiom0>;
> +
> +				interrupts =3D <156 IRQ_TYPE_LEVEL_HIGH>;
> +			};

[Severity: High]
This is a pre-existing issue, but does requesting GPIO 241 and IRQ 156 from
sgpiom0 completely overshoot the 128-pin cap?

Since the controller restricts its capacity, the out-of-bounds requests cou=
ld
lead to probe failures unconditionally during driver initialization.

[ ... ]
> +&sgpiom0 {
> +	bus-frequency =3D <2000000>;
[ ... ]
> +	ngpios =3D <128>;
> +
> +	status =3D "okay";
> +};

[ ... ]
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 1fddf3a5d1383..724f4d312de4d 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -1,1079 +1,3 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> =20
> -/dts-v1/;
> -#include "aspeed-g6.dtsi"

[Severity: Low]
Does stripping the /dts-v1/ directive from the top-level .dts file violate
style and architecture practices for Device Trees?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-anacapa-de=
vlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com?part=3D1

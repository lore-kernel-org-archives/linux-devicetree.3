Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4FF331203
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398515; cv=none; b=IenFbGrc8eAgLHKmlxjHKPK7kpw9VatbirzGE46I6NNd9UPvkHBVO840nytePGvVUO8XtI4P6zke/SHJUPiM5xwfKVjSOC021SD1f+wJ/A0cM8pWKd26mdw7M2l/vBVUxihvByVcaB5gAiOr0+1l0zy8rF+oSfVFXMQ8muQUSB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398515; c=relaxed/simple;
	bh=+9LL7K2t3GeGuINsVvmuY4cghvwd6JPTD5lN39Amw8o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZKIFYUwIHG6wjg47BhpIgjJr7XIcrmcNMaLeYZw1gZsiVXECI8xc8ny3pkCarwedVqhVhhYher+mhO5tPYsEYGHbO3a/S9Pcx53HfHwOqSUPnKz8WC+IFr9Onez1FPSxpjpWrqj/ooR3B3w8CZbc/+59UeXCkAW20W8dm7dVb1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxiJ2rFL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxiJ2rFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC441F00893;
	Mon, 14 Sep 2026 15:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398513;
	bh=hazoVcM1vkhcYKP54kurIVbpPS8q6b5vrlNXTkEVCQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jxiJ2rFL4GaWQoyQFtbmWI8eQnOUJf4jCaDLz+JDGfeK+j53dTNPNNsVJWA/S3ttA
	 /rtFU6mrLmkGxyxqtPsLCuTzQKAQv3cPCiUJmuOYyn13KKIBaokHvIJVkHDUKDRlF0
	 4196oifwUwHHG3ZYDBIQIcnrpGm6F/lS8HGs3uj4pODUJHE9sHrU2Ft+pfP4xWehoD
	 KrJlMXWPH0T53VD90dZKzmr+iSG4WQuezpbB+g8BLiekem4mcluLSZXrf2MqQZIYH0
	 aFxLdckne7LgR2tvz5FG4eq966v/TtaoD7o2OwrwJJCzegyL9GrHquGbqBaOdhjfbl
	 2jMaUlvrPhUww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] riscv: dts: gf: Initial support for the P8700
 Boston board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksa Paunovic" <aleksa.paunovic@htecgroup.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914-p8700-dts-v1-8-3267f14ebce1@htecgroup.com>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-8-3267f14ebce1@htecgroup.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:08:33 +0000
Message-Id: <20260914150833.8AC441F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The `riscv,isa-extensions` array omits the required 'zicbom' exten=
sion and is not sorted alphanumerically.
- [High] Mismatch between PCI 'bus-range' and memory-mapped ECAM 'reg' size=
 allows out-of-bounds memory access.
- [Low] Missing `#include <dt-bindings/gpio/gpio.h>` and usage of magic num=
ber instead of macro for GPIO flags.
- [Low] Missing mandatory `device_type =3D "pci"` and `ranges` properties i=
n PCI-to-PCI bridge nodes.
--

commit 79e1dd46e7add2552901143ed6ac7196cb0914df
Author: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

riscv: dts: gf: Initial support for the P8700 Boston board

This patch adds the initial device tree for the MIPS P8700 and the Boston
FPGA development board. It includes the corresponding bitfile configuration=
s,
Makefile, and Kconfig updates.

> diff --git a/arch/riscv/boot/dts/gf/p8700-boston.dts b/arch/riscv/boot/dt=
s/gf/p8700-boston.dts
> new file mode 100644
> index 0000000000000..b829899592aee
> --- /dev/null
> +++ b/arch/riscv/boot/dts/gf/p8700-boston.dts

[ ... ]

> +	pci2: pci@14000000 {
> +		compatible =3D "xlnx,axi-pcie-host-1.00.a";
> +		device_type =3D "pci";
> +		reg =3D <0x14000000 0x2000000>;
> +
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		#interrupt-cells =3D <1>;
> +
> +		interrupt-parent =3D <&aplic_s0>;
> +		interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		ranges =3D <0x02000000 0 0x16000000
> +			  0x16000000 0 0x100000>;
> +
> +		bus-range =3D <0x00 0xff>;

[Severity: High]
Can this mismatch between bus-range and memory-mapped ECAM size allow an
out-of-bounds memory access?

The defined reg maps only 32MB of ECAM configuration space, which safely
covers buses 0 to 31. However, bus-range advertises up to 256 buses to the
PCI core. If the PCI core attempts to enumerate buses 32 or higher (e.g.,
during hotplug or if a bridge's subordinate bus is configured > 31), it will
generate an offset past the 32MB mapping.

Should bus-range be restricted to <0x00 0x1f>, or should the reg size be
expanded to 256MB?

[ ... ]

> +		pci2_root@0,0 {
> +			compatible =3D "pci10ee,7021", "pci-bridge";
> +			reg =3D <0x00000000 0 0 0 0>;
> +
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +
> +			eg20t_bridge@1,0,0 {
> +				compatible =3D "pci8086,8800", "pci-bridge";
> +				reg =3D <0x00010000 0 0 0 0>;
> +
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;

[Severity: Low]
Do these nested PCI bridge nodes (pci2_root@0,0 and eg20t_bridge@1,0,0) need
the mandatory device_type =3D "pci" and ranges properties?

Standard bindings for PCI bridges require these properties for correct OF
tree parsing, even if Linux typically enumerates them via config space read=
s.

> +				eg20t_mac@2,0,1 {
> +					compatible =3D "pci8086,8802",
> +						     "intel,pch-gbe";
> +					reg =3D <0x00020100 0 0 0 0>;
> +					phy-reset-gpios =3D <&eg20t_gpio 6 1>;

[Severity: Low]
Can this magic number 1 be replaced with the GPIO_ACTIVE_LOW macro?

Including <dt-bindings/gpio/gpio.h> and using the macro would improve
readability and adhere to standard GPIO flag conventions.

> diff --git a/arch/riscv/boot/dts/gf/p8700.dtsi b/arch/riscv/boot/dts/gf/p=
8700.dtsi
> new file mode 100644
> index 0000000000000..ba1854df5201b
> --- /dev/null
> +++ b/arch/riscv/boot/dts/gf/p8700.dtsi

[ ... ]

> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "gf,mips-p8700", "riscv";
> +			reg =3D <0x0>;
> +			mmu-type =3D "riscv,sv39";
> +			riscv,cbom-block-size =3D <64>;
> +			riscv,isa-base =3D "rv64i";
> +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c",
> +					       "zicntr", "zicsr", "zifencei",
> +					       "zihpm", "zba", "zbb",
> +					       "xmipsexectl";

[Severity: High]
Will the omission of the "zicbom" string in riscv,isa-extensions break DMA
cache flushing for non-coherent devices?

The CPU nodes define riscv,cbom-block-size =3D <64>, indicating hardware
support for Cache Block Management. Without "zicbom" present in the
extensions array, the RISC-V kernel feature framework will not set
RISCV_ISA_EXT_ZICBOM. This causes the ALT_CMO_OP macro to compile as NOPs,
which could result in corrupted transfers for devices requiring non-coherent
DMA, like pci2.

Also, should the multi-letter extensions be sorted alphanumerically to comp=
ly
with Devicetree bindings (e.g., placing "zba" and "zbb" before "zicntr")?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-p8700-dts-=
v1-0-3267f14ebce1@htecgroup.com?part=3D8

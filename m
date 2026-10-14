Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772E951EE0A
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984212; cv=none; b=T7vIxw9B7UHJGwaAWO6hLeI5GZQKgTMHD+Q+tSWgg52frTNbylhZqFZtQsr3ZkhN0mv7TvPTyyCBQNS5yq8ybX1wcXhGe5U4Ek+VorKw4ZAN5X4pVla27/we/ivQdmvGgJP6zLETLvRmfJVhJnlpFdWhHBKDjGd24FzDQiKlExg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984212; c=relaxed/simple;
	bh=uP6n8cIyTQ7zeuTl+6096UX/1S4fnopMfcPfM7oeWMA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=O/Rrc2KvPfS0oORnvjocb7xU1k4mD+CfUTXaX7r5oOKA26niYDa1rfmt+6GR9caWC82UeLlSUd1siO2A4g9CUE9uog/kPyj5e0AhJhcZfzO0oGYX55R4jHEr7nc0v7yhVPDHbZNnUUZSVlDZWAwElEgNJu64qSrpLGluGle5yzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRXJ+JOx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRXJ+JOx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCDA1F008AB;
	Wed, 14 Oct 2026 13:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791984208;
	bh=cArsGc6lKJ2W1yfERflxJFe4b7e5QVmqefBxX/nzlXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NRXJ+JOxdFE6PVHXifgsJ78f4nEcV/OqecUYrqJ+J0imTBmJDgwzWBS9XQcr67fSo
	 9GfgZFLxQgvqJmLX3hb4OZIRzd1sZHVnY4g9L1jidnDzu7N+us+H/xcvgPTAEc1gQL
	 8SiSLzzzh3CW1Td5Isbk6V1ylkdpUMJK2VYKZwbf0tmXegjYh5K5+BvB1UEXBJuIA5
	 t8Crox1QpF9qP3bTCfyfXM1shjSWbjc1BGuAsnqGCQ0cqZqFzOhTeLa8ur+ublQjCL
	 ddJBMwBFvruP8hbC+zjfMAMNauY3KRLtbMnfKBKxVmm8UACUKhzZ4kGjzqp0GTyf++
	 U+WwYiF8l/ECQ==
Message-ID: <sashiko-outbox-171346@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] arm: dts: altera: add Draeger M48 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014130228.2780803-4-petko.manolov@konsulko.com>
References: <20261014130228.2780803-1-petko.manolov@konsulko.com>
 <20261014130228.2780803-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:23:26 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: missing device_type =3D "memory" in memory node
- [Low] dt-bindings: missing PHY compatible string triggers dtbs_check warn=
ings
--

commit d855694f7a7cff3fb10eeb71af859efb7af1158a
Author: Petko Manolov <petko.manolov@konsulko.com>

arm: dts: altera: add Draeger M48 CPU Module

This commit adds the device tree for the Altera SoCFPGA part of the
heterogeneous Draeger M48 board. The Cyclone V boots independently off
QSPI and monitors an i.MX6 CPU on the same module.

> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48=
.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> new file mode 100644
> index 0000000000000..bc1909126e195
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
> + */
> +#include "socfpga_cyclone5.dtsi"
> +
> +/ {
> +	model =3D "Draeger M48 Cyclone V SoC";
> +	compatible =3D "draeger,socfpga-m48", "altr,socfpga-cyclone5", "altr,so=
cfpga";
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		reg =3D <0x0 0x40000000>;
> +	};

[Severity: Medium]
Should the memory@0 node include a device_type =3D "memory" property?

The Device Tree Specification mandates that memory nodes must include a
device_type =3D "memory" property. The kernel's early_init_dt_scan_memory()
explicitly checks for this property, and nodes lacking it are ignored.

While bootloaders like U-Boot often dynamically fix up or create the memory
node and its properties before passing the DT to the kernel, omitting it in
the source DTS is incorrect, triggers dtc and schema warnings, and could
lead to boot failure if the bootloader fails to inject the property.

[ ... ]

> +&gmac0 {
> +	status =3D "okay";
> +	phy-mode =3D "rgmii";
> +	phy-handle =3D <&ethphy>;
> +
> +	mdio0 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		compatible =3D "snps,dwmac-mdio";
> +
> +		ethphy: ethernet-phy@0 {
> +			reg =3D <0>;
> +			rxc-skew-ps  =3D <1860>;
> +			rxd0-skew-ps =3D <0>;

[Severity: Low]
Could a compatible string be added to this PHY node?

The newly added ethernet PHY node uses vendor-specific skew properties
like rxc-skew-ps which are defined in micrel,gigabit.yaml. Because it
lacks a matching compatible string (such as ethernet-phy-id0022.1610),
the dt-schema validation tool does not apply the Micrel binding schema
to this node.

As a result, it falls back to the generic ethernet-phy.yaml schema, causing
dtbs_check to emit unevaluated property warnings for all the skew
properties. While the Linux kernel's MDIO bus will auto-detect the PHY ID
at runtime and apply the skews correctly via the Micrel driver, devicetree
validation requires the explicit compatible string.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014130228.2780=
803-1-petko.manolov@konsulko.com?part=3D3

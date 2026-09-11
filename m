Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C96D36197E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139908; cv=none; b=BICUyl120kj374T5VZSx2m6l39h2YnIVSCcN1dqV2S7xI9pBZibKVJ06zdWR6gXljHQeI61DFOaXZrsP38ZAk9Do3A3cIOdFRSFV87+5O66l2qym4dCSQnAoTZJWFCzJk+PH6NOoEWbU9QtbpVDxHgIcsW0mb806SeUTsToQPZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139908; c=relaxed/simple;
	bh=VWNg5JSG3L7SC9mIFXblohyCYRkZKxseYfFzakMVww4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K2eGQUnD/74z/aUQrFsfT3j3DpIAShUZvxocZpKgA5NcSWK6A65lP72LqBGshaqTAtk0av7BIhb+EFPhLDkx7iEqHUj3pXIa1nOxErjGEw4MCn/6aYICdkz9GwZyzIT2YPdijKIYp8gCzn2mq/nnzPDxMbf1qLbdORyMpzcErP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHCWjw7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHCWjw7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB631F00893;
	Fri, 11 Sep 2026 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789139906;
	bh=eNNRohjBHrQzl0gji86ioiSxSA1KEZE/esp5PadfxZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kHCWjw7mF7Hr6SzRb1g+ySl1V4j1XkLKRQT9jRM8XmYYVzIqW1q1G8kq5ZBvXmavA
	 sNDMiQfHtLb0vkSduo3RbvqvYYKLC7sqpnHfWPrtbDWtDwX3nM8PwaD2V8ZgYpVaID
	 lSaDPrCr2DzfyAyfNUG3dxrbSE7ODawmUb17mGvEHZKTUJVscJVCwVN40VBFvCjtW0
	 6TaXqhU4h2cqBaRslbooXFmvQGhxZm//9NrdzmHq0a4/Pj+VyYOIt9o0pKKFJLvorY
	 2GRX1hSegOpXR0r7/MN9//em2rBj1mFF4X03vHFfefM/FToZlBO8mUoaxzsE1Jcvlh
	 +noYCpBfeFm6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm: dts: altera: add Draeger M48 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260911150755.2803736-4-petko.manolov@konsulko.com>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
 <20260911150755.2803736-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 15:18:26 +0000
Message-Id: <20260911151826.ABB631F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unsafe register access due to unconditional probing of FPGA-based =
IPs without LWHPS2FPGA bridge enablement.
- [Medium] Hardware description mismatch between commit message and device =
tree.
- [Low] Use of deprecated 'snps,nr-gpios' property instead of standard 'ngp=
ios'.
- [Low] The 'name' property is explicitly deprecated in device tree nodes.
--

commit 45faa524ae6c9f608be9c1559da6ec21aff7dbea
Author: Petko Manolov <petko.manolov@konsulko.com>

arm: dts: altera: add Draeger M48 CPU Module

This commit adds a new device tree for the Draeger M48 CPU module.

>     Draeger M48 is a CPU module built around the NXP i.MX6q.

[Severity: Medium]
Is this description accurate? The device tree added in this patch clearly
describes an Altera Cyclone V SoC, which contradicts the commit message
stating it is built around the NXP i.MX6q.

> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48=
.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> new file mode 100644
> index 0000000000000..838708acb31bd
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
> + */
> +#include "socfpga_cyclone5.dtsi"
> +
> +/ {
> +	model =3D "Draeger M48 Cyclone V SoC";
> +	compatible =3D "draeger,M48", "altr,socfpga-cyclone5", "altr,socfpga";
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		name =3D "memory";

[Severity: Low]
Is the "name" property needed here? According to the Device Tree
Specification, nodes must be identified by their unit-name and properties
like device_type or compatible. The name property is deprecated and
generates compiler warnings.

> +		device_type =3D "memory";
> +		reg =3D <0x0 0x40000000>;
> +	};

[ ... ]

> +	soc {
> +		gpio3: gpio@ff202000 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202000 0x20>;

[Severity: High]
Can this unconditional probing cause a bus error during early boot?

The dw-apb-gpio driver will probe this node because it defaults to status =
=3D
"okay". This hardcoded address (0xff202000) falls in the Cyclone V
Lightweight HPS-to-FPGA (LWHPS2FPGA) memory window. If the FPGA is
unprogrammed, or the bridge is disabled in the included socfpga.dtsi,
accessing this region triggers a precise external data abort, crashing the
kernel.

Should these IPs be explicitly nested under an fpga-region, or should the
device tree guarantee bridge enablement?

> +
> +			portd: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <2>;

[Severity: Low]
Does this violate the device tree bindings for snps,dw-apb-gpio? The
snps,nr-gpios property is deprecated in favor of the standard ngpios
property.

> +				reg =3D <0>;
> +			};
> +		};
> +
> +		gpio4: gpio@ff202020 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202020 0x20>;

[Severity: High]
Similarly, can this access cause a bus error if the LWHPS2FPGA bridge is
inactive or placed in reset?

> +
> +			porte: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <2>;

[Severity: Low]
Could this use the standard ngpios property instead of the deprecated
snps,nr-gpios?

> +				reg =3D <0>;
> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911150755.2803=
736-1-petko.manolov@konsulko.com?part=3D3

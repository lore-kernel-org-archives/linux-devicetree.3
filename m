Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184213DD87F
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953142; cv=none; b=uTB2XIDr8MJjdhvzcv6ehixeD9H2CFRF/crXBgvkNcRwmUlz69+PxYZyRKmW9uaX7knTJjPMbS10xVy4Ev37+EhEsNRDQ+DY+mLLRO6nRiUSpJLDXIgxX5p8dwdj4uFEJBGEpUhVEcRrjXl/Vc7ixHzOr5BqRZYa5cSTxVxcYYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953142; c=relaxed/simple;
	bh=RulMoOP2etH5sCMy6TpVpNIAjei5vfzgOrSiOe1sat0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EYfjk4SaTSKT8H/B8RdhwQpaOlXCVauuJTsyK24HLv6gJW/ClqBBkak5PO44/S5+q2gRPVHYWT122pY1GaEG+xD/gTvHBD/yw9gi8TnRjCJpCPlPYg+WQtdVqbszUcYdjbWUnQI/GkX6CY3+bMCrVBKTNfQWjRMPRXPCtM8cGF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIJyRgMl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIJyRgMl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7F71F00A3E;
	Wed,  9 Sep 2026 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788953140;
	bh=fGNtEw/MiK+TwNUgRNuEVULV0BbH2TqPTsZP88dUkI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PIJyRgMlxik/x/YHgKSuMO4FlICc3SwQt0l2ndHxr5DW02slBvef+71mcitTSffZH
	 9lBgvzoJXXbjuprNPYMoibtwZLjgwZE5So01dj839GfrRTkoygTV3FYa+84JGdrzUS
	 ueOH1oku3aDjSDLwSt4CHJwihS+g5yMYC0buEbvsN80t6uAB82zXmNBycwGAqSg7Wq
	 X8/R5UHdhP/KU7IbU5kA/fKwxvq9XjKWfhNrVdDrp+UJdS6uwc6QPtiqu7bCyo4OZg
	 Lghja5QZHXNPLYmb6vJtqdSciYijfu+75wtKglYvudUu5wOsKFFkSvonOi8YT0PPar
	 J04TLapN5X/NA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] Add socfpga devicetree for Draeger's M48 board.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260909111513.2259643-4-petko.manolov@konsulko.com>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <20260909111513.2259643-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 11:25:40 +0000
Message-Id: <20260909112540.7C7F71F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The 'bank-name' property violates the device tree schema for 'snps,=
dw-apb-gpio-port' child nodes.
- [Low] Use of deprecated `snps,nr-gpios` property.
- [Low] Deprecated explicit `name` property in the memory node.
--

commit c5c8260180405203e51bdeb09506abe3c2c76c4d
Author: Petko Manolov <petko.manolov@konsulko.com>

Add socfpga devicetree for Draeger's M48 board.

This commit introduces a new devicetree for the Draeger M48 board based on
the Cyclone V SoC. It sets up the necessary nodes for various peripherals
including GPIO, GMAC, I2C, and QSPI.

> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48=
.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> new file mode 100644
> index 0000000000000..6c5a8013d40c7
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> @@ -0,0 +1,129 @@
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
Is it necessary to explicitly define the name property here? The Devicetree
Specification deprecates explicit name properties, as node names are
automatically derived from the node identifier. Its inclusion will trigger =
dtc
warnings during the build.

> +		device_type =3D "memory";
> +		reg =3D <0x0 0x40000000>;
> +
> +		/* 1GB */
> +	};
> +
> +	aliases {

[ ... ]

> +	soc {
> +		gpio3: gpio@ff202000 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202000 0x20>;
> +			status =3D "okay";
> +
> +			portd: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <2>;

[Severity: Low]
Could this use the standard ngpios property instead? The snps,nr-gpios
property is explicitly marked as deprecated in the snps,dw-apb-gpio.yaml
binding, and using it might trigger validation warnings.

> +				reg =3D <0>;
> +				bank-name =3D "SYNC_I";

[Severity: Low]
Will this property cause a device tree schema validation failure? The
snps,dw-apb-gpio-port binding enforces additionalProperties: false and does
not define bank-name. Running make dtbs_check will likely report a warning
here.

> +			};
> +		};
> +
> +		gpio4: gpio@ff202020 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202020 0x20>;
> +			status =3D "okay";
> +
> +			porte: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <2>;

[Severity: Low]
Could this also use the standard ngpios property instead, as the snps,nr-gp=
ios
property is deprecated?

> +				reg =3D <0>;
> +				bank-name =3D "SYNC_O";

[Severity: Low]
Will this property cause a device tree schema validation failure for the po=
rte
node? The snps,dw-apb-gpio-port binding does not define bank-name and enfor=
ces
additionalProperties: false.

> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909111513.2259=
643-1-petko.manolov@konsulko.com?part=3D3

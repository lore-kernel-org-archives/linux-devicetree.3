Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9302D0614
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 03:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791255729; cv=none; b=cumf2jXnzgNow7qrqmkXM0c/7+MbTF2nGgHREEd5P3fB9nd/rrgSEi0EP8TzeGNBKqGLLTn/azIVaSr6d5vUgYIfDRfxXd1i5xPeEZjsbg6DB9+nF4Qp26VJMC9zl0JSYwr4PGv1HSuRLAL2e/kwKA4TaPmGa6GP6iOYoQPl/dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791255729; c=relaxed/simple;
	bh=gNWw1Kx8ru9ExALKBzKBeGKsGWhtqC8lRtKaAjPNn84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KTBykTU3DhwLLtIxy+bcHH76V6e2k7iXLW+3WPg8ECLC4Xl+Prsc2h1qGgFYZQUyRApPTdXOVwpfeXBiMsaXAIb3wN2mH+aGtByBDeuqspmGLaIPflP/dP0Af/t6iu2D08c6LaT+r6XpEhXyr3oaeWBcP7O+j2s9HodQKVmjx9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mF9vk6T8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mF9vk6T8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9801F000FF;
	Tue,  6 Oct 2026 03:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791255728;
	bh=yFaCY81S+pU/dsynMlCgouKrX9O1IIoLE3shU3IxKw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mF9vk6T8xMtQqhIICjFVAoW9M90b0hFSa7e1pEjuNFRPPqLtMKgqf4C0rQ4yxFiGl
	 fpJLT1XkzqKc8Erh9yZ9E9lMCdn6jbPJbMC2P7a9jUsvXOOoXQ/G0VhPvu925aSNJM
	 pbUx511a66jAMHFaZgB7trGcppJb5oEJnMa1BVE/jaS60LkElhniffZC3nTrGseHA6
	 oAFVOxZeytSTKiY0wiqrm9nxK8VQpBo36TzMU1x0kHU38Dc7+48V71YTBExeNJERmA
	 cy0QNQRUS3PkPxwsBzHeFRyAPsMc3nPoOH3ak/zLyhlV7g1JKIztwKsvUHHhDIGyTr
	 8oTcmKcOx31Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: socfpga: agilex: add Agilex SoCDK
 multi-QSPI board
Reply-To: sashiko-reviews@lists.linux.dev
To: genevieve.chan@altera.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261006025418.31931-3-genevieve.chan@altera.com>
References: <20261006025418.31931-1-genevieve.chan@altera.com>
 <20261006025418.31931-3-genevieve.chan@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 03:02:07 +0000
Message-Id: <20261006030207.BC9801F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] mtd: duplicate partition labels across multi-QSPI flashes
- [Low] dts: excessive duplication of SoCDK baseboard configuration
--

commit e53835bafbaf52462a16d7064f169ecf5af12f67
Author: Genevieve Chan <genevieve.chan@altera.com>

arm64: dts: socfpga: agilex: add Agilex SoCDK multi-QSPI board

This commit adds a new device tree for the Agilex SoCDK multi-QSPI
daughter board, which replaces the single QSPI flash with four
micron flashes. The board is otherwise identical to the standard SoCDK.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts=
 b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026, Intel Corporation
> + */
> +#include "socfpga_agilex.dtsi"
> +
> +/ {
> +	model =3D "SoCFPGA Agilex SoCDK multi-QSPI daughter board";
> +	compatible =3D "intel,socfpga-agilex-socdk-multiqspi", "intel,socfpga-a=
gilex";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +		ethernet0 =3D &gmac0;
> +		ethernet1 =3D &gmac1;
> +		ethernet2 =3D &gmac2;
> +	};

[Severity: Low]
This isn't a bug, but there appears to be a lot of duplicated baseboard
configuration here. The commit message notes the board is otherwise
identical to the SoCDK, but over 100 lines of baseboard definitions like
these aliases, memory, LEDs, Ethernet MAC, MMC, and UART are copied
directly from the socfpga_agilex_socdk device tree.

Would it be better to extract this shared configuration into a common
socfpga_agilex_socdk.dtsi to prevent the board definitions from drifting
out of sync over time?

[ ... ]

> +	flash@0 {
> +		compatible =3D "micron,mt25qu02g", "jedec,spi-nor";
> +		reg =3D <0>;

[ ... ]

> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			qspi_boot0: partition@0 {
> +				label =3D "Boot and fpga data";
> +				reg =3D <0x0 0x10000000>;
> +			};
> +		};
> +	};
> +
> +	flash@1 {
> +		compatible =3D "micron,mt25qu02g", "jedec,spi-nor";
> +		reg =3D <1>;

[ ... ]

> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			qspi_boot1: partition@0 {
> +				label =3D "Boot and fpga data";
> +				reg =3D <0x0 0x10000000>;
> +			};
> +		};
> +	};

[Severity: Medium]
Is it intentional to use the exact same partition label for flash@0, flash@=
1,
flash@2, and flash@3?

When the device tree is parsed at boot, the Linux MTD subsystem uses this
label to identify the partition to userspace. Having four partitions with
identical names breaks name-based access like /dev/mtd/by-name/ or root=3Dm=
td:
because userspace tools will only be able to uniquely address the first
matched partition.=20

Additionally, since flashes on CS1 through CS3 are typically not boot
flashes, the shared label could be misleading. Could these labels be
made unique for each individual flash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006025418.3193=
1-1-genevieve.chan@altera.com?part=3D2

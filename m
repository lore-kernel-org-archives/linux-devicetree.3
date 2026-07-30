Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3400630D3E8
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785385927; cv=none; b=uST/IO47AhJQEFUF1XPgp5muOCEkAJH68BP/0uoVdT2F6DnZlVrLp/0Awku7TFIft4+TZneWbdnTgtpmE7wPGQicAD19JvqcKRjrLscM2oR11BISHIev2PzDfWk3JwwKrIX8c4rdLGOJzZMyAll9UunxYy8v3/J1qO9fNS4ngCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785385927; c=relaxed/simple;
	bh=Fo3EUsejWgE0BBvgAMclWMfqLBQzaCT4t38on0C7PmQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i2ni+3I1mRS2JDVpGzJ0Jov2FPsqOoXjY4Qlf+CxDX7zXa1EDSylN4+rPlyqvy8NTros//piyjg2pw0SQUUbBpOmwoCFox05hSWQEwnq6qNg+UirxNZ9ZXP0/tO2Jb2zhc4Gwn8Zs9F1aBH1Cfet1GgaE44GRuKRR8gajBRQTTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZCOW86t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZCOW86t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BABC1F00A3A;
	Thu, 30 Jul 2026 04:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785385925;
	bh=BBooVMCsTe0xGd1aK9JdK6YBOVm2/vYcwxhB6w4G/gg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gZCOW86tH94eOG2NXfJtM0C+fWmCoOBuzL5D035zQYExIZdUKjo1AXFyJ2zzCWjKa
	 Nzq5bCk/Xmg56gWMBIDODKpis5hA/Kh7yb/V1my44Fp8GRT92sDy+pNcZ8rDKC+vYg
	 Pnb1t5fC1yHqtS9X3IGm6qzVrUo2UAyWpK96l11u2R1ZyvGovYk3FqXc437LNbf4Dq
	 Pg9/q87HA+nePlrCJrrCC/3MWhfg6ipq6BlbvSSkGk6PEbVuXX3JqJ7XzseylvMFiL
	 tuhDbtQucqpASgJ/aRIviy+Kd1r0e42ThYexrn2cNgQpEAA6v12YHG/3qVqvxM5Bka
	 o+WRJShEynj5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/7] ARM: dts: microchip: sama5d27_wlsom1: read MAC
 address from QSPI SFDP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, "Richard Weinberger" <richard@nod.at>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Michael
 Walle" <mwalle@kernel.org>, conor+dt@kernel.org, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
In-Reply-To: <20260729043026.1811147-7-manikandan.m@microchip.com>
References: <20260729043026.1811147-1-manikandan.m@microchip.com>
 <20260729043026.1811147-7-manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 04:32:04 +0000
Message-Id: <20260730043205.0BABC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Indefinite probe deferral for `macb0` network interface if the EUI=
-48 marker is unprogrammed or the nvmem layout driver is missing.
--

--- Patch [6]: [PATCH v6 6/7] ARM: dts: microchip: sama5d27_wlsom1: read MA=
C address from QSPI SFDP ---
commit 8eba2f7e81780da2083cb3da12b2567024175fa6
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

ARM: dts: microchip: sama5d27_wlsom1: read MAC address from QSPI SFDP

This commit exposes the factory-programmed EUI-48 as a mac-address cell
via the QSPI flash SFDP NVMEM provider. It points macb0 at this cell
to provide a stable MAC address on boards where U-Boot does not set one.

> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts b/ar=
ch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
> index 35a933eec5738..5e87bf04bc47c 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
[ ... ]
> @@ -97,6 +97,8 @@ uart6: serial@200 {
> =20
>  &macb0 {
>  	status =3D "okay";
> +	nvmem-cells =3D <&mac_address_eui48>;
> +	nvmem-cell-names =3D "mac-address";

[Severity: High]
Will this cause an indefinite probe deferral for the macb0 interface if the
EUI-48 marker is unprogrammed or the nvmem layout driver is missing?

When the device tree statically links the macb0 interface to the
mac_address_eui48 nvmem cell, macb_probe() calls of_get_ethdev_address()
which internally calls of_nvmem_cell_get().

If the kernel is missing the microchip,sst26vf-sfdp-eui layout driver, the
nvmem core via nvmem_layout_module_get_optional() returns -EPROBE_DEFER
indefinitely.

Alternatively, if the layout driver is loaded but the board's flash chip
lacks an EUI-48, the layout driver gracefully returns 0 without adding the
cell. However, of_nvmem_cell_get() unconditionally returns -EPROBE_DEFER if
a cell is missing but an nvmem-layout node exists in the device tree:

ret =3D nvmem->layout ? -EPROBE_DEFER : -ENOENT;

In both scenarios, macb_probe() receives -EPROBE_DEFER and indefinitely
defers, breaking the intended fallback to a random MAC address and resulting
in a complete loss of network connectivity.

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729043026.1811=
147-1-manikandan.m@microchip.com?part=3D6

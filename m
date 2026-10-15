Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229E347987A
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049096; cv=none; b=cHZQNRPIqqhkh3UHgbNcwgPDDf4hcRES6upX378fgZhOIVvFuEANEo6GjmvW0QEo+6vPUKeAJxBGoFM2hvVBbsLNRs47d8Y339NNGpMzGaIiXFevOJpwgnYMvIexHBVvVKKbN04Dl909Gc8qi98FY/X/tUjZB5rfI6SxwDLVsWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049096; c=relaxed/simple;
	bh=abY8uqq+cenUZeN/TbJpltqyANMzJ7lbai+yoX3gO+I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ArCB0PphdrY0O41yl3HDF6toesjBzGJaABLIaEJxIKV9OV6QxKUUH2HcO2ex6LDIQqKyLeIWGTZFFioS3rmjDIYPaB4R282biddd8lY3RSz1LOfJfoIbsrF+UDzI+VhR/GGdO+/V3eej66jTkQ5uvK13Y0Gq8LYkjoSbbk7ttoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5wuqBAu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5wuqBAu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB111F000CD;
	Thu, 15 Oct 2026 07:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792049084;
	bh=tosOWzJsnzOmxjaPCNtkDugmQnAaQAcgmJxMEP6tyd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j5wuqBAusAECsUYFw8YpXZO617CDy6orsLTT4OjyjpHA7bFhc3hP5YFHUCLDsPbSs
	 M9fQkFqOaAaBUBqxrgugxG50FkevnuFnLq44PifhSxBrZKnwcxThDVAQV1pWfHC0y6
	 eg459T/xAPrfrP32/kTI0kM/RmXGRNlZerY8XrDb6Fj3A6iMVvkn5H14al9iP5w7wW
	 clEdu56a4l8vTPDiNbtLZLSFsBdUMRmiVR49iyZIfExaL84ULfI8Q4HF4MiDnEwI2d
	 iSzIL6fa/YT/+dQgRPb4jHM6Z4mJ+z189EnMuVfzqMQiq4rJ024EdloLA+tgd/35V6
	 ayBffklb0acvQ==
Message-ID: <sashiko-outbox-172418@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014072109.1759502-25-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-25-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 07:24:43 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] nvmem: missing mac-base layout handler causes MAC collisions
--

commit c6cd707e15e55e65e91c2a8c00f74a09830fe8da
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

ARM: dts: zte: Add ZTE ZXHN H3600 board
   =20
Add the device tree for the ZTE ZXHN H3600 Wi-Fi 6 home gateway router.
Configure the internal Gigabit switch ports, external Sanechips ZX5201
WAN PHY, SPI NAND flash on the SPI controller, LEDs, buttons, and
MediaTek MT7915 Wi-Fi cards on PCIe ports 0 and 1.

> diff --git a/arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts b/arch/ar=
m/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts
> new file mode 100644
> index 0000000000000..d46390f0754cb
> --- /dev/null
> +++ b/arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts

[ ... ]

> +&gmac_port0 {
> +	label =3D "lan1";
> +	phy-handle =3D <&phy10>;
> +	phy-mode =3D "internal";
> +	nvmem-cells =3D <&macaddr_tag_1e 0>;
> +	nvmem-cell-names =3D "mac-address";
> +	status =3D "okay";
> +};

[ ... ]

> +&gmac_port4 {
> +	label =3D "wan";
> +	phy-handle =3D <&phy8>;
> +	phy-mode =3D "gmii";
> +	nvmem-cells =3D <&macaddr_tag_1e 1>;
> +	nvmem-cell-names =3D "mac-address";
> +	status =3D "okay";
> +};

[ ... ]

> +			partition@100000 {
> +				label =3D "tag";
> +				reg =3D <0x0100000 0x0100000>;
> +				read-only;
> +
> +				nvmem-layout {
> +					compatible =3D "fixed-layout";
> +					#address-cells =3D <1>;
> +					#size-cells =3D <1>;
> +
> +					/* the LAN ports' MAC; the WAN port uses the next one */
> +					macaddr_tag_1e: macaddr@1e {
> +						compatible =3D "mac-base";
> +						reg =3D <0x1e 0x6>;
> +						#nvmem-cell-cells =3D <1>;
> +					};

[Severity: High]
Will the WAN and LAN interfaces end up with the exact same MAC address here?

Since the kernel currently lacks an NVMEM layout driver that binds to the
"mac-base" compatible string, there appears to be no read_post_process hook
to handle the NVMEM cell index offset.

When of_nvmem_cell_get() parses these entries during device probe,
__nvmem_cell_read() will fall back to simply reading 6 bytes at offset 0x1e
for both ports, completely ignoring the cell index of 0 for LAN and 1 for W=
AN.

Could this lead to L2 network collisions and broken routing on this board?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014072109.1759=
502-1-ghahramani.navid@gmail.com?part=3D24

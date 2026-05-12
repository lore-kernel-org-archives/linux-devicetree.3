Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299C525228C
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552898; cv=none; b=jsZVwhAT78mrpe6zrINRnOfXBCzeCSy4HYFyA+iy1sV5GEbi3cqs7Q6Q8Oo7/4ppuz91gFwtB8vbVyntsnXLFoI9FkHhGZ2JjrNlQyA5YgGuLx/nGqHx0g8uSraXlTfPqDYUKj/SO7qc47gcvRVSuG+cw0e/AVrIoOTW979Lpsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552898; c=relaxed/simple;
	bh=3SqeI0x6DGtuZ90Z4ykrQO6hevm0tdji+7cLj+8Hx+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YtPy+kFCSZ+dl2oE54OXI4NTT6trfIjPYHNUqUi3ErwOKya6xaYpbdAijNn/2sNVFg6eiIXYxb7vkLjfZthZdRDodqXSI4hLzKRl9ywlAaM4eZVasyuAt+HJkyxY37bqQo/un/OAFTjZJTyJhVDuHRTh7911FNc7KhIKFXfgdFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxK1Nd8a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxK1Nd8a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879A3C2BCB0;
	Tue, 12 May 2026 02:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778552897;
	bh=3SqeI0x6DGtuZ90Z4ykrQO6hevm0tdji+7cLj+8Hx+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uxK1Nd8axGxSHDCcaT8S2tpAFDL6zUyHD5tuNHyXECwPgAey1veSmzEi3wNZeKq9f
	 XraAD2D7X5PwOikZhDGr6IOWefTAzvXhBTVzuTpX/L1vnVhQdHE5M1aBFcqZggzZpk
	 r6hHe2v0oIEoOey+SldPHFDrBa9Iy5PJED+cl4gSdjLy1qQ7Km4COfaYd3b2QUfgEy
	 l7giTtfDh7e5sBlPwU2Nphw4iOZeKiwMOeAKxZQztjypjflzM8vcFjL4LIrxMcTzGA
	 W1W09iMZVZMwSnVZyN4+QH2CbSt1a0qNrPUFfGdguxejxCZBdqjdEQa2oIyRiTX0LE
	 RTbJj4uZ9qSuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI
 and add SPI NOR
Reply-To: sashiko@lists.linux.dev
To: "Andre Heider" <a.heider@gmail.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511111116.1109643-4-a.heider@gmail.com>
References: <20260511111116.1109643-4-a.heider@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:28:16 +0000
Message-Id: <20260512022817.879A3C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Potential overvoltage risk for the W25Q64FW SPI NOR flash via the =
'buck4_3v3' supply.
- [Low] The unit-address in the 'uboot' partition node name does not match =
the base address in its 'reg' property.
--

commit 470f9c74bd3cfec41ed69dd8c4e22535a7e8164f
Author: Andre Heider <a.heider@gmail.com>

riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR

This commit adds the QSPI controller node and describes the attached
SPI NOR flash. It also provides a corresponding vendor flash partition
layout.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/=
boot/dts/spacemit/k1-musepi-pro.dts
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts

[ ... ]

> @@ -166,7 +166,7 @@ buck3_1v8: buck3 {
>  				regulator-always-on;
>  			};
> =20
> -			buck4 {
> +			buck4_3v3: buck4 {
>  				regulator-min-microvolt =3D <500000>;
>  				regulator-max-microvolt =3D <3300000>;
>  				regulator-ramp-delay =3D <5000>;

[ ... ]

> @@ -249,6 +249,47 @@ dldo7 {
>  	};
>  };
> =20
> +&qspi {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&qspi_cfg>;
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <26500000>;
> +		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <4>;
> +		vcc-supply =3D <&buck4_3v3>; /* QSPI_VCC1833 */

The commit message notes this flash is a Winbond W25Q64FWSSAQ, which is a
strict 1.8V part. Could this vcc-supply assignment cause hardware damage?

The buck4 regulator has a maximum voltage of 3.3V. If the regulator defaults
to 3.3V or is configured to 3.3V dynamically, it exceeds the absolute maxim=
um
ratings for the 1.8V W25Q series flash.

Is the board actually using the 3V equivalent (W25Q64JV), or does the
regulator need stricter constraints if it exclusively powers this flash?

> +		m25p,fast-read;
> +
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;

[ ... ]

> +			opensbi@70000 {
> +				reg =3D <0x70000 0x30000>;
> +			};
> +			uboot@a00000 {
> +				reg =3D <0xa0000 0x760000>;

This isn't a regression, but there is a mismatch between the unit-address in
the node name and the base address in the reg property.

Should the node be named uboot@a0000 to match the 0xa0000 address and preve=
nt
a compiler warning?

> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511111116.1109=
643-1-a.heider@gmail.com?part=3D3

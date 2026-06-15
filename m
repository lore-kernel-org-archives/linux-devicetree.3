Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4783F410E
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534313; cv=none; b=SnQohYHLkvrWL6Ui+dipBqMS1e53Limuf539HNpMroNZA5UtiwS7E0BUhodnmjneWvj1z/pb7NGfbdx2dM+npo0NuEN0RHuWNYmhqBRyWbl6nmoVEmDnlHLFOi+XnyFCsZjxSFZY+9y9wnQdbjr+bkD7MEQXqAgpevCdid1ZqnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534313; c=relaxed/simple;
	bh=RAPTnuCiuy8sEcKz9a1lbQL16w+neCefyoXGoiXUKBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DTIcCwLl9m62O6CVoc82S1mpjXWf6oWO7iT2lE8t0wljiH8Kkyif+4zvZv3B+mDU5LVcl68mt+yOMgW8uqKHm/hjdkToFkEgxIEj22/pImE+BybcTaIPyqkBW5RA8nisRmBSa57fHJGm8ThSrUr0Ef/JZn4uJfpr/VveLsHCTZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ht/Otylw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ht/Otylw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956821F000E9;
	Mon, 15 Jun 2026 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781534310;
	bh=h7EJpKdCyfVOHBgR/2CIFDaIv3rRPwi/1ERUTeTv+4o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ht/OtylwhSdcIGY2MKVNy5PoWHGk6VyG0IJP7/1kulrrMWia6K1PTK0EbGMw3zehZ
	 PN5/b3X2B/XC3gXmNiV+re2r4vj5y/SnQqrn2+l2nkXtvRZ7X7Sdw0d2b32hWbLhLe
	 wgbeMlJqpIan/PZHGw22Mbh7PeauFpJbSRz1M1jyCiTcjtOGWclA8s0qosgTFb8+jP
	 Npc00XyCMx0WKOyqj4iYodN06OMz9sZSp0dBjcs7RQl/PAPp9pSzzt8SyBML56lqWu
	 xbvkZ6VkmGkSzDuf4Xeigegh/mT8eSAneS8ZKAz6Y3WiAgboMeSMU+qa30xdu5wsDe
	 XU9PpuOos4q9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] arm64: dts: nuvoton: npcm845-evb: Add peripheral
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomer Maimon" <tmaimon77@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615142548.1373799-5-tmaimon77@gmail.com>
References: <20260615142548.1373799-5-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 14:38:30 +0000
Message-Id: <20260615143830.956821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The reserved memory region 'tip_reserved' for the TIP firmware lac=
ks the 'no-map' property, which will cause memory corruption or speculative=
 access crashes.
- [High] The `cooling-levels` property in the `&pwm_fan` sub-nodes is confi=
gured as a standard 32-bit integer array (`<127 255>`) instead of an 8-bit =
integer array (`/bits/ 8 <127 255>`).
- [Medium] Aliases 'fiu1' and 'fiu3' are cross-assigned to '&fiu3' and '&fi=
u1', contradicting their fixed-partition labels.
- [Low] The property 'snps,eee-force-disable' is undocumented and is not pa=
rsed by any kernel driver.
- [Low] Duplicate unit-address in `fiu0` flash partitions.
--

commit 157ec4fb1bc26d1a937aeb0fed0b00add10a7c95
Author: Tomer Maimon <tmaimon77@gmail.com>

arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

Enable peripheral support for the NPCM845 evaluation board by wiring up
the SoC controller nodes to the board design. Add board aliases, GPIO-backed
MDIO buses, reserved memory, flash partitions, and various controllers.

> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/a=
rm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> index 5edf5d13342da..28dbb865d739d 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> @@ -10,6 +10,42 @@ / {
> =20
>  	aliases {
>  		serial0 =3D &serial0;
> +		ethernet1 =3D &gmac1;
[ ... ]
> +		mdio-gpio1 =3D &mdio1;
> +		fiu0 =3D &fiu0;
> +		fiu1 =3D &fiu3;
> +		fiu2 =3D &fiux;
> +		fiu3 =3D &fiu1;

[Severity: Medium]
Does this alias mapping intentionally cross-assign fiu1 to &fiu3 and fiu3 to
&fiu1?

Looking further down in the patch, the partition under &fiu1 is explicitly
labeled spi1-system1, and the partition under &fiu3 is labeled spi3-system1.
This swap could cause user-space confusion by mapping /dev/mtd1 to a partit=
ion
labeled spi3-system1 and /dev/mtd3 to a partition labeled spi1-system1.

[ ... ]
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		tip_reserved: tip@0 {
> +			reg =3D <0x0 0x0 0x0 0x6200000>;
> +		};
> +	};

[Severity: High]
Without the no-map property, will the kernel map this 98MB reserved memory
region into the standard linear mapping with cacheable attributes?

Since this memory belongs to the TIP coprocessor, the ARM64 CPU might
aggressively perform speculative instruction prefetches and data loads here.
Could this lead to corrupted non-coherent working state via cache line
evictions, or trigger fatal asynchronous SErrors and synchronous external
aborts if the memory is hardware-protected by TrustZone?

[ ... ]
> +&gmac1 {
> +	phy-mode =3D "rgmii-id";
> +	snps,eee-force-disable;
> +	status =3D "okay";
> +};

[Severity: Low]
Is the snps,eee-force-disable property supported? It does not appear in the
snps,dwmac DT binding schema and seems to be ignored by the stmmac driver.
This appears to be a dead configuration that triggers a dt-schema violation.

[ ... ]
> +&fiu0 {
> +	status =3D "okay";
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		spi-rx-bus-width =3D <1>;
> +		reg =3D <0>;
> +		spi-max-frequency =3D <5000000>;
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			bmc@0 {
> +				label =3D "bmc";
> +				reg =3D <0x00000000 0x04000000>;
> +			};
> +			u-boot@0 {
> +				label =3D "u-boot";
> +				reg =3D <0x00000000 0x007C0000>;
> +			};

[Severity: Low]
Both the bmc and u-boot partitions are using the @0 unit-address. Does this
result in a duplicate unit-address warning from the devicetree compiler?

[ ... ]
> +&pwm_fan {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pwm0_pins &pwm1_pins
[ ... ]
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	fan@0 {
> +		reg =3D <0x00>;
> +		fan-tach-ch =3D /bits/ 8 <0x0 0x1>;
> +		cooling-levels =3D <127 255>;
> +	};

[Severity: High]
Should the cooling-levels property be configured as an 8-bit array, matching
the fan-tach-ch format, such as /bits/ 8 <127 255>?

The Nuvoton PWM fan driver parses this property using
of_property_read_u8_array() and of_property_count_u8_elems().

Since the DT property is authored as two 32-bit big-endian integers, it
consumes 8 bytes total. The driver might incorrectly count 8 elements and
parse them as an array of [0, 0, 0, 127, 0, 0, 0, 255].

Could this corrupt the thermal control map and shut the fans off completely
at intermediate or critical temperatures?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615142548.1373=
799-1-tmaimon77@gmail.com?part=3D4

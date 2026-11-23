Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446389;
	b=HI1zB8Q3ekffWHcN82658RithF7na7qSq3iBarkwLDD+ElPMYyqTWNbrrLBb+bk6koFm
	 JMcGbpV205shLAsf4sMrSbU27wzSJtsiNbsgLXbTYJofE631wk2aR34Gzo8+PMb1TLLB4
	 sdeUdg7w68JiyVS+erzw0KwgyUJlFDAubwcbT6sAx52+qXaZCnahCC99Qu1Ca4aTSZj3t
	 SDO1bLPudeFT0j9p2JA6zipHF6koEoyNUSGFfRnW1/esIu/G7MASzWKBnGNtj6L+kmcto
	 DoqJHMJbCo98ZYNiaFTvS74Ff25yhpQbswo5Xtgjhv+e2qM6C/Zk6JvPPvNLhX6lrqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446389;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fXUUP6mSYsSlBC0R0+O1owxIIRiWDhbDe2LahE22B90=;
	b=LLGd8Gw8GylvqG8lldZXOHqHgC5FY0Elo2qMnJIFC0MS7ED32+runn7/GueR6HbjsLzZ
	 xls/wUsnl7qjlh/UwndzKh9AYgGMxUFjaEw5A27wCtXr32xPIxLUkOtobI4n4Id2jhFJ+
	 eZEr3WFl2L6Y2gCdj9b6ra7o6UVEVnZTA7iVT5ikdJ9oAN2SgVIoTws3CYlrogQaSJlET
	 IDSTrO1NQd3IJfQMI6G4J00UP+Q/78a37mGh4bF4Ql0MWRIW0DfFtuEpAGTr0KpQ4pNhg
	 IwUv0NpR2H0HwP6WC96klVd5HnzTrF/PcLBMqFHTGIynEmNNA7kRPl1Ydysuky1Unig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKoFA5UE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E59606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKoFA5UE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E501F000CF;
	Mon, 23 Nov 2026 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446388;
	bh=fXUUP6mSYsSlBC0R0+O1owxIIRiWDhbDe2LahE22B90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKoFA5UEHyGjywXv94OAnHq1Iwj+owynMrNOpyyKViKDujIlIDctdK0lOFp38yErv
	 iQAOKqByruYWTLEsAjDao/9nnmIQPmdadVDTNabHJBmnANb28i2Q6X6NWnNC99SNUw
	 5Mfq170yfonN04ZQxpfZOTBYAGUJJ0Vl278wzxLo6fPmKlWF/kuuZrW7ufyTSwZfJD
	 B9XlDLBZQLdlWNOX8q6lC1iS3/6MG5YFg/w0VeT3oHWJjSE9YOr/lLzhw6T5RdHulp
	 G1EaGQqO33MocFvoEjZtWEAwN3g7PoLQzu32NFymMEANR4xB8cbaeQ0EyWbt4CBjNO
	 RX06nrbsC1XQQ==
Message-ID: <sashiko-outbox-229489@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/8] riscv: dts: mips: Initial support for the P8700
 Boston board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksa Paunovic" <aleksa.paunovic@htecgroup.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-p8700-dts-v4-6-60bb7bf8a7a1@htecgroup.com>
References: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
 <20261123-p8700-dts-v4-6-60bb7bf8a7a1@htecgroup.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:06:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] riscv: dts: mips: non-generic PCI node names and invalid unit
  addresses
--

commit 79c2f7a61a39f331205c23d7c6c9e68fb0be373c
Author: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

riscv: dts: mips: Initial support for the P8700 Boston board

This commit adds the initial device tree for the MIPS P8700 SoC and the
Boston FPGA development board, along with the corresponding Kconfig and
Makefile entries.

> diff --git a/arch/riscv/boot/dts/mips/p8700-boston.dts b/arch/riscv/boot/=
dts/mips/p8700-boston.dts
> new file mode 100644
> index 0000000000000..4383ef7cec152
> --- /dev/null
> +++ b/arch/riscv/boot/dts/mips/p8700-boston.dts
> @@ -0,0 +1,135 @@
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
> +
> +		interrupt-map-mask =3D <0 0 0 7>;
> +		interrupt-map =3D <0 0 0 1 &pci2_intc 1>,
> +				<0 0 0 2 &pci2_intc 2>,
> +				<0 0 0 3 &pci2_intc 3>,
> +				<0 0 0 4 &pci2_intc 4>;
> +
> +		pci2_intc: interrupt-controller {
> +			interrupt-controller;
> +			#address-cells =3D <0>;
> +			#interrupt-cells =3D <1>;
> +		};
> +
> +		pci2_root@0,0 {
> +			compatible =3D "pci10ee,7021";
> +			reg =3D <0x00000000 0 0 0 0>;
> +
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +
> +			eg20t_bridge@1,0,0 {
> +				compatible =3D "pci8086,8800";
> +				reg =3D <0x00010000 0 0 0 0>;
> +
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +
> +				eg20t_mac@2,0,1 {
> +					compatible =3D "pci8086,8802";
> +					reg =3D <0x00020100 0 0 0 0>;
> +					phy-reset-gpios =3D <&eg20t_gpio 6 GPIO_ACTIVE_LOW>;
> +				};
> +
> +				eg20t_gpio: eg20t_gpio@2,0,2 {
> +					compatible =3D "pci8086,8803";
> +					reg =3D <0x00020200 0 0 0 0>;
> +
> +					gpio-controller;
> +					#gpio-cells =3D <2>;
> +				};
> +
> +				eg20t_i2c@2,12,2 {
> +					compatible =3D "pci8086,8817";
> +					reg =3D <0x00026200 0 0 0 0>;

[Severity: Low]
Should the PCI child nodes under pci@14000000 use generic node names,
standard PCI unit addresses, and include device_type =3D "pci" and ranges on
the PCI bridges?

The underscore-separated names (pci2_root, eg20t_bridge, eg20t_mac,
eg20t_gpio, eg20t_i2c) trigger dtc W=3D2 warnings, fail dtbs_check against
xlnx,axi-pcie-host.yaml (which expects generic names such as pci,
ethernet, gpio, and i2c), and prevent dtc and dtschema from recognizing
eg20t_i2c as an I2C bus.

In addition, PCI unit addresses take the hex form <dev> or <dev>,<func>
without the bus number (so @1,0,0, @2,0,1, @2,0,2, and @2,12,2 with
decimal 12 should be @0, @0,1, @0,2, and @c,2), and the two PCI-to-PCI
bridge nodes need device_type =3D "pci" and ranges to satisfy
check_pci_bridge() in dtc and pci-pci-bridge.yaml.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-p8700-dts-=
v4-0-60bb7bf8a7a1@htecgroup.com?part=3D6

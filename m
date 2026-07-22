Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730934D2ED9;
	Wed, 22 Jul 2026 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719634; cv=none; b=NbL4GyCYbLqj6QqEUCJxQg9WCV0NTArOgnzH6Ixpd/ue2m6Jfcc1D0m9xiRNI5blklGZ5acikxPSkhA7sSZNp+5Pyee76edUvwG9IgDgItkTTfvzFC25mCaI3nmbVMZARcQiAt9JiB/6e85YShIuOFpROLcD1zqhKJjI9vNkbSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719634; c=relaxed/simple;
	bh=srmzFQdqqQ2WFdLt/ncLqUnpW5uI8Z7kdABR3Q5Po+I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kYgGsbYwCzyU59dZ2g+C7692uGgY2geBuvfE2gMD/rsTHG6erOA5GZkQrkk3m1u788BT7j5LIV3fv2A8vtHPl1cd3T6QNkqt57IQC82MWpClPjYR+QVD/JZS430AmHLb089eDGWo24iVRFv4thfefu8mKf1uROuABJ//aeUuUzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=mR3svA+T; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="mR3svA+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784719622;
	bh=ttBWFKNkKcrL8brBDCQiXDV5DqubY2I9DyaqecqkGBM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mR3svA+Tcqfyuei2uvlEhv34yzQm8eZBY0WJEipI1yIG4jnr5BpLegQnigXK9lRjT
	 /WMlpkBupAhrm6zUf7jHYPJ3oyUukpLYmNAW1LJGj4hIGCUvjffkq3ZBoETgYnW9p4
	 bVfIFBvWYmguhD5kH7TPPIbRDP6w6EEeiWw9FZ4gRZK+xXa6FWCvkxA21tv8qfoNuP
	 FWL3ziwyW4cR6l+n1evzid4vPsBb89q7iH/KsbMt73ZIVvvf5TXVAIWg80YpU6BWV/
	 dw8a8K3nsVXOExr6RCOOxlvFPkDQvK4wtVgp73MTcCLgOTkhG0C22jLTmvI1AxY6lY
	 182h/x3pmbR0g==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3B03B662E1;
	Wed, 22 Jul 2026 19:27:02 +0800 (AWST)
Message-ID: <22ecb2fc6f4a4ca3c3018fffba8a56bcf5ca89fc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 0/4] arm64: dts: nuvoton: add NPCM845 SoC and EVB
 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, avifishman70@gmail.com,
 tali.perry1@gmail.com, 	venture@google.com, yuenn@google.com,
 benjaminfair@google.com
Date: Wed, 22 Jul 2026 20:57:01 +0930
In-Reply-To: <20260708165929.2233934-1-tmaimon77@gmail.com>
References: <20260708165929.2233934-1-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Tomer,

Apologies for taking a while to get to this series.

On Wed, 2026-07-08 at 19:59 +0300, Tomer Maimon wrote:
> This series fixes the remaining timer binding issue and adds device tree
> support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation
> Board (EVB).
>=20
> The first patch drops the undocumented timer0 clock-names property.
> The second patch reorders timer0 and PECI so the APB child nodes stay in
> ascending unit-address order.
> The third patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,
> RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device
> tree.
> The fourth patch enables these peripherals for the NPCM845-EVB, adding
> MDIO nodes, reserved memory, aliases, and board-specific configurations
> such as PHY modes and SPI flash partitions.
>=20
> The NPCM8XX device tree was tested on NPCM845 evaluation board.
>=20
> Addressed comments from:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - sashiko-bot
>=20
> Changes since version 7:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - modify timer place.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add PSPI to commit message.
>=20
> Changes since version 6:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - remove IPMI i2C device.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Add FIX enable property.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Keep patches 1-3 unchanged.
>=20
> Changes since version 5:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Add no-map to the tip_reserv=
ed firmware memory region.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Drop the unsupported snps,ee=
e-force-disable property from gmac1.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Rework the FIU0 boot flash l=
ayout into nested fixed-partitions
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 under the bmc cont=
ainer.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Keep patches 1-3 unchanged.
>=20
> Changes since version 4:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Split the timer0 clock-names=
 cleanup into a separate first patch.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Remove nuvoton,sysgcr from u=
dc8 and udc9.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Rename apb: bus@f0000000 bac=
k to apb.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Rename spix-mode to nuvoton,=
spix-mode.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Keep cooling-levels as 32-bi=
t cells while encoding fan-tach-ch
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as /bits/ 8.
>=20
> Changes since version 3:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - reomve tmp100.
>=20
> Changes since version 2:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Fix dts warning
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Arrange node order by ascend=
ing unit address.
>=20
> Changes since version 1:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Fix commit message
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Fix dtbs_check warnings.
>=20
> Tomer Maimon (4):
> =C2=A0 arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
> =C2=A0 arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes

I've applied these first two, thanks for the fixes.

Regarding the last two:

> =C2=A0 arm64: dts: nuvoton: npcm845: Add peripheral nodes
> =C2=A0 arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

We now have scripts/dtc/dt-check-style. If you run it in strict mode
before and after applying the series, it indicates quite a few concerns
(pasted at the bottom). Do you mind looking over them and fixing what
makes sense? I'd like to conform to the strict style as best we can and
have justification for what remains for all patch submissions going
forward.

Cheers,

Andrew

   [I] 0 andrew@heihei ~/s/k/l/o/build.arm64.default> diff -u before after
   --- before      2026-07-22 17:57:35.932258745 +0930
   +++ after       2026-07-22 17:58:14.205122192 +0930
   @@ -1,4 +1,79 @@
    ../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:9: [property-ord=
er] property 'compatible' out of canonical order (should sort before 'model=
')
   -../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:21: [property-or=
der] property 'reg' out of canonical order (should sort before 'device_type=
')
   -../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:24: [unused-labe=
ls] label 'refclk' defined but never &-referenced
   -../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:27: [property-or=
der] property '#clock-cells' out of canonical order (should sort before 'cl=
ock-frequency')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:13: [property-or=
der] property 'ethernet1' out of canonical order (should sort before 'seria=
l0')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:18: [property-or=
der] property 'fiu0' out of canonical order (should sort before 'mdio-gpio1=
')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:57: [property-or=
der] property 'reg' out of canonical order (should sort before 'device_type=
')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:60: [unused-labe=
ls] label 'refclk' defined but never &-referenced
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:63: [property-or=
der] property '#clock-cells' out of canonical order (should sort before 'cl=
ock-frequency')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:69: [property-or=
der] property 'ranges' out of canonical order (should sort before '#size-ce=
lls')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:71: [unused-labe=
ls] label 'tip_reserved' defined but never &-referenced
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:77: [child-name-=
order] child node 'mdio-0' out of name order
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:81: [property-or=
der] property 'gpios' out of canonical order (should sort before '#size-cel=
ls')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:93: [property-or=
der] property 'gpios' out of canonical order (should sort before '#size-cel=
ls')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:104: [required-b=
lank-lines] "status" must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:110: [property-o=
rder] property 'pinctrl-0' out of canonical order (should sort before 'pinc=
trl-names')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:111: [continuati=
on-alignment] continuation should align to column 21 (under "<" or \")
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:112: [property-o=
rder] property 'phy-handle' out of canonical order (should sort before 'pin=
ctrl-0')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:113: [required-b=
lank-lines] "status" must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:119: [property-o=
rder] property 'pinctrl-0' out of canonical order (should sort before 'pinc=
trl-names')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:120: [continuati=
on-alignment] continuation should align to column 21 (under "<" or \")
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:121: [property-o=
rder] property 'phy-handle' out of canonical order (should sort before 'pin=
ctrl-0')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:122: [required-b=
lank-lines] "status" must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:131: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:134: [property-o=
rder] property 'reg' out of canonical order (should sort before 'spi-rx-bus=
-width')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:136: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:140: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:143: [property-o=
rder] property 'reg' out of canonical order (should sort before 'label')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:149: [hex-case] =
hex literal '0x007C0000' must be lowercase
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:149: [property-o=
rder] property 'reg' out of canonical order (should sort before 'label')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:151: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:153: [hex-case] =
hex literal '0x007C0000' must be lowercase
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:153: [property-o=
rder] property 'reg' out of canonical order (should sort before 'label')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:155: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:157: [property-o=
rder] property 'reg' out of canonical order (should sort before 'label')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:159: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:161: [hex-case] =
hex literal '0x02C00000' must be lowercase
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:161: [property-o=
rder] property 'reg' out of canonical order (should sort before 'label')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:163: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:165: [hex-case] =
hex literal '0x03C00000' must be lowercase
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:165: [property-o=
rder] property 'reg' out of canonical order (should sort before 'label')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:174: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:178: [property-o=
rder] property 'reg' out of canonical order (should sort before 'spi-tx-bus=
-width')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:180: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:184: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:186: [property-o=
rder] property 'reg' out of canonical order (should sort before 'label')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:194: [required-b=
lank-lines] "status" must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:195: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:198: [property-o=
rder] property 'reg' out of canonical order (should sort before 'spi-rx-bus=
-width')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:200: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:204: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:206: [property-o=
rder] property 'reg' out of canonical order (should sort before 'label')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:214: [property-o=
rder] property 'nuvoton,spix-mode' out of canonical order (should sort befo=
re 'status')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:267: [required-b=
lank-lines] "status" must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:276: [property-o=
rder] property 'pinctrl-names' out of canonical order (should sort before '=
status')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:277: [property-o=
rder] property 'pinctrl-0' out of canonical order (should sort before 'pinc=
trl-names')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:278: [continuati=
on-alignment] continuation should align to column 21 (under "<" or \")
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:279: [continuati=
on-alignment] continuation should align to column 21 (under "<" or \")
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:280: [continuati=
on-alignment] continuation should align to column 21 (under "<" or \")
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:281: [continuati=
on-alignment] continuation should align to column 21 (under "<" or \")
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:282: [continuati=
on-alignment] continuation should align to column 21 (under "<" or \")
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:283: [continuati=
on-alignment] continuation should align to column 21 (under "<" or \")
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:284: [continuati=
on-alignment] continuation should align to column 21 (under "<" or \")
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:285: [property-o=
rder] property '#address-cells' out of canonical order (should sort before =
'pinctrl-0')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:287: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:290: [property-o=
rder] property 'cooling-levels' out of canonical order (should sort before =
'fan-tach-ch')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:292: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:295: [property-o=
rder] property 'cooling-levels' out of canonical order (should sort before =
'fan-tach-ch')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:297: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:300: [property-o=
rder] property 'cooling-levels' out of canonical order (should sort before =
'fan-tach-ch')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:302: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:305: [property-o=
rder] property 'cooling-levels' out of canonical order (should sort before =
'fan-tach-ch')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:307: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:310: [property-o=
rder] property 'cooling-levels' out of canonical order (should sort before =
'fan-tach-ch')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:312: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:315: [property-o=
rder] property 'cooling-levels' out of canonical order (should sort before =
'fan-tach-ch')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:317: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:320: [property-o=
rder] property 'cooling-levels' out of canonical order (should sort before =
'fan-tach-ch')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:322: [required-b=
lank-lines] child node must be preceded by a blank line
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:325: [property-o=
rder] property 'cooling-levels' out of canonical order (should sort before =
'fan-tach-ch')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:335: [property-o=
rder] property '#address-cells' out of canonical order (should sort before =
'status')
   +../arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:337: [required-b=
lank-lines] child node must be preceded by a blank line


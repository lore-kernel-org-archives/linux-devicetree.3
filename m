Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A9645039
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 00:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791850110; cv=none; b=Y3Tm8n0zzXRp+9v1+evL2TSwi9TW4ajApBwEF+X7uK9RnyHXOdDRYHSeX+WmFETTF6uuxoEbiu0Dp7NquvYl6f5ChHruLss2P1NDxVJzHmS4qZPl9LPgIXXFS989MF3OsAxTT2KxfN+jYpY9+Yso9tDDGjaGkshUGRwv2cGl3J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791850110; c=relaxed/simple;
	bh=cr7PRDj4NrnzmNOxM3MtpN7RWZf0VIavnfXUSKV0j6g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gQRnnav7C3mK8exfXKbwxKjSNTp9j6T9XkMbC9ESmB7b1rExwKkyGAhBTTGJbA/bZ9N//Y7h+Rz0yKeQa42u+tfwc6yhXpCmMyODDLK77ZrsRNg4Nso07rVkzX3ft3dNoar8ER6p6DrtN6qq76Hq1i5rNUc8l0Wjea6Fa5jJHhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnc3ac84; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnc3ac84"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE651F0089B;
	Tue, 13 Oct 2026 00:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791850109;
	bh=L2wvmOUgAUA9s9PABdwMjbb+FbRhh2fkCpx4qIiKWxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cnc3ac84N/MufERHYIEHRD+0+KmJ5pEEAysC86+Q1wg+O6NgvLZDs2aLOfp6xQVHq
	 6b/RIs9Ez97cUyHsx9IyXFPnAu4rVhAcvngQZljlM3D/yw+DepMywNE0fvB2dG8WfR
	 YkmZxYzxMFxxrP5ILRcljgsHY3lfQsQNw2bKwZVIIhGIufm45Z5Q4w8Z9Bhw3JSNH4
	 iv7hj1Ek6opI3djOaN53w6iBfbY9Wd5wc07qZ1vpmG0JMcDxIWDnWgIcWRdOIMQPzA
	 Lt0BcI7e9GrJA11Z+3TDaQNN1OusVIdOFEKMoGIBn5RMWuqWD2Hy3LCLiKXsBrVBcW
	 S9GYjc4q1zTsA==
Message-ID: <sashiko-outbox-168780@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: mark K1 board boot devices
 bootph-pre-ram
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hung-Chun Tseng" <alan.tseng.cs@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012235624.77993-3-alan.tseng.cs@gmail.com>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
 <20261012235624.77993-3-alan.tseng.cs@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 00:08:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: missing bootph-pre-ram on pinctrl and regulator dependencie=
s for SPL
--

commit 76ae02e32445137eb75156ac64fdd5ee85cb4ef0
Author: Hung-Chun Tseng <alan.tseng.cs@gmail.com>

riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

This patch adds the bootph-pre-ram property to I2C buses, board EEPROMs, PM=
ICs,
and QSPI flashes on various SpacemiT K1 boards. These additions enable
U-Boot's SPL to access the devices during the early boot phase before
DRAM training.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/ris=
cv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> index 81c40df2a3663..6269d2ba78ed0 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> @@ -93,6 +95,7 @@ serial-number {
>  };
> =20
>  &i2c8 {
> +	bootph-pre-ram;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&i2c8_cfg>;
>  	status =3D "okay";

[Severity: Medium]
Will this I2C pinmux setup fail in the SPL?

The I2C bus is marked for SPL, but the pin configuration node i2c8_cfg in
k1-pinctrl.dtsi and the base pinctrl controller pinctrl@d401e000 in k1.dtsi
both lack the bootph-pre-ram property.

U-Boot's fdtgrep will strip these unmarked nodes from the SPL device tree,
which will prevent the I2C pins from being multiplexed correctly.

> @@ -100,6 +103,7 @@ &i2c8 {
>  	pmic@41 {
>  		compatible =3D "spacemit,p1";
>  		reg =3D <0x41>;
> +		bootph-pre-ram;
>  		interrupts =3D <64>;
>  		vin1-supply =3D <&reg_vcc_4v>;
>  		vin2-supply =3D <&reg_vcc_4v>;

[Severity: Medium]
Will this PMIC probe fail in the SPL phase?

The PMIC relies on the reg_vcc_4v fixed regulator as its input supply, but
the reg_vcc_4v node was not marked with bootph-pre-ram.

Without this property, the fixed regulator will be excluded from the SPL
device tree, leading to dangling phandles and early boot probe failures for
the PMIC.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/ris=
cv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index 635e95aad14a5..406b7ca163db8 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts

[ ... ]

> @@ -386,6 +393,7 @@ &qspi {
>  	flash@0 {
>  		compatible =3D "jedec,spi-nor";
>  		reg =3D <0>;
> +		bootph-pre-ram;
>  		spi-max-frequency =3D <26500000>;
>  		spi-rx-bus-width =3D <4>;
>  		spi-tx-bus-width =3D <4>;

[Severity: Medium]
Will this flash fail to operate during early boot?

The flash@0 node uses buck4_3v3 as its vcc-supply. While buck1 and buck3 we=
re
marked with bootph-pre-ram in this patch, buck4_3v3 was omitted.

The missing property on buck4_3v3 will cause the supply node to be stripped
from the SPL device tree, breaking flash access before RAM is initialized.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012235624.7799=
3-1-alan.tseng.cs@gmail.com?part=3D2

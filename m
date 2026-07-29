Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9A430C632
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338056; cv=none; b=A+HKFPb5kt0PebK8bm7RHYBETIQicPqTYbJaeOfFhHQITfMHfebZxDAdQ2FkJG7RI/sDiPaSV72U03lk6AIeuqW87FTbU1mQ6y9Tr7cri3ChY/W2X/Q6BSqY2fJA36R0wgWMG9zPxsVCBHyk7JNNB3t3IrHuwZP4sqaZZVPoVGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338056; c=relaxed/simple;
	bh=VbqfygsSX3y88JbkL4s+DPADLdqkEN8jZPcFBLuv/jk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xndqa5PzstFw4EnXqVshHx1Akbwz7rLyx3tFFGJ36XiQ/HuJmkYYmNP15uLzKH/tcnlpd9PjsCCHXHjEfpFToayjzl06m4AOu7rN9dCEbJUkOyZuvbxWdEPsuhkYP3eSsGIjwr2vt+GPZZ5apNYkl5R8Vnr8tiYu/dBxTla9a1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9YA1M9n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9YA1M9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840271F000E9;
	Wed, 29 Jul 2026 15:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785338054;
	bh=DqWTqbmTvMFv4BthNTc/hsbogS8M80rx2aErT1TYiZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X9YA1M9nHzoo4Wu+wuJ+NzUO5BrC1Rxc0O82Q6t+Z+Y5XXz1wfN3CDQsjfe18CjXo
	 39zJdziqUv/5lzADuh+Ci3z21BkaWNNI0ygmPdlicY/WmdjJWrGWRzz0n9WgfrQNAT
	 CTufUsguK+V+1Cnw7lQDNfcv2LidVHgwVLBGkZZZNq+w42HXOVY78F8Om1WVrJM+Tk
	 c3Htr44UYHbY/HLNKsr81riuWdp3kvP1Ts8eGx0V79ZaKLFFhkSKRxZR3t2OTiSzyl
	 Q5etcc5w11MDBzLo/NlGSdjTqYs3/bt/pP5taNdBT6jNI7IpqARZu3yTPacQ89TufQ
	 0AN+tCWAXfhTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] riscv: dts: spacemit: k1-milkv-jupiter: fix maximum
 CPU core voltage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729150722.1598630-3-aurelien@aurel32.net>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
 <20260729150722.1598630-3-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 15:14:14 +0000
Message-Id: <20260729151414.840271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The unsafe maximum voltage limit (3.45V) for CPU core regulators `=
buck1` and `buck2` remains unpatched on several other SpacemiT K1 boards.
--

--- Patch [2]: [PATCH 2/6] riscv: dts: spacemit: k1-milkv-jupiter: fix maxi=
mum CPU core voltage ---
commit 2f0408a9b68518bed697666281e9fbe48abb583b
Author: Aurelien Jarno <aurelien@aurel32.net>
Subject: riscv: dts: spacemit: k1-milkv-jupiter: fix maximum CPU core volta=
ge

This commit lowers the maximum regulator voltage for buck1 and buck2 on the
Milk-V Jupiter board from 3.45V to 1.050V. This prevents potential permanent
CPU damage from accidental overvoltage requests.

Link: https://sashiko.dev/#/message/20260728211020.1248676-2-aurelien%40aur=
el32.net

> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/ris=
cv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index b61f5995ec771..c76b91ecb914d 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -211,14 +211,14 @@ pmic@41 {
>  		regulators {
>  			buck1 {
>  				regulator-min-microvolt =3D <500000>;
> -				regulator-max-microvolt =3D <3450000>;
> +				regulator-max-microvolt =3D <1050000>;
>  				regulator-ramp-delay =3D <5000>;
>  				regulator-always-on;
>  			};
> =20
>  			buck2 {
>  				regulator-min-microvolt =3D <500000>;
> -				regulator-max-microvolt =3D <3450000>;
> +				regulator-max-microvolt =3D <1050000>;

[Severity: High]
This is a pre-existing issue, but this commit only fixes the maximum voltage
for the Milk-V Jupiter board. Does this same CPU core overvoltage risk
exist on the other SpacemiT K1 boards?

The unsafe regulator-max-microvolt =3D <3450000> limit for buck1 and buck2 =
is
still present in several other device trees that share the same SoC and PMIC
layout:

- arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
- arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
- arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
- arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

Should these boards also have their limits updated to 1050000 to prevent
potential CPU damage from kernel misconfigurations or a privileged userspace
writing to the regulator sysfs interface?

>  				regulator-ramp-delay =3D <5000>;
>  				regulator-always-on;
>  			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729150722.1598=
630-1-aurelien@aurel32.net?part=3D2

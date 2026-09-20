Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C046381EB0
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789898740; cv=none; b=aCGQ0wjM+SQhsxpZlBe+z9nlZ7KWJeoiT2r68GG5OxbAhj4MgOHfKp1EqeCjiWSKYKR6+pKjjhArKWZEHMeQCoI3XDAgia1wYkynHUidtGnNvFNpG/ziUAYSCg3KWTVGg3mYhfdsEKr5Jn+1TSyklwAEnyBcW0+3ejaV1a21C/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789898740; c=relaxed/simple;
	bh=ZpnP14qG8YVWRYKgzZKXPTZJtHta5OFhiwJFr4batCM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RBSM40trbcdbxwoad0BHu8uZQt/s9aN0NjQLV3f10c/zNjCGS/A1zbkuoaWyVIgAagmeQ77D3A5XD4mZrW0GiBhdpDe1RLRoIW05XbHZcPe1Iprzv3qKHY3dlbVT2uKhn2LqClF8pyvWS2LU/CKdWWicPbStYGHhJ+2/23ypySM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtHCYSH3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtHCYSH3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CD61F000FF;
	Sun, 20 Sep 2026 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789898739;
	bh=Yq3bNuNjL9B4V/NnJBUmLSCgKasc1L143AP05PUjFsI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BtHCYSH30xN2aXoG/m8h8LMlExBUu6E8Hifs5IUSwCGG/Zioq9KqQCgCMJl91VHOJ
	 /Ydc+uRE6HAFCd7inkYiQG+aaPDvB3wpeDOD9J8KnFTI18DXPr+ybuTsJFEHYPky2u
	 PKWaSBRckgEH8/IHRFQwaJaEfRLs6OKWXPNo7JQt/p/cutORVsaRD8B2yT1OsME8d7
	 YMdOIXGcX08YdkQ5urf6SY66JnfrCW0qa5Ng1GC/7ig3xLjtEU4w7mw1Ku8wdmzgDN
	 Pvh69wJfOIBBov73ZApvTOGiqpH7MKLtBCkFvN6Gg4ZqtuZRGaEUrvFlmXRt150VvK
	 G+0/rV/PxKDGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chukun Pan" <amadeus@jmu.edu.cn>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
References: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 10:05:38 +0000
Message-Id: <20260920100538.C3CD61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: removing standard aliases to bypass bootloader behavior
--

commit 8bb8e326a73a3935458461c280ad331fa5713466
Author: Chukun Pan <amadeus@jmu.edu.cn>

riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi

This commit configures the OrangePi R2S and RV2 device trees to read
the Ethernet MAC address from an EEPROM. It also removes the ethernet0
and ethernet1 aliases to prevent U-Boot from patching the MAC address
incorrectly.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-r2s.dts
> index 7125f2882ce85..073cc975135f4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -16,8 +16,6 @@ aliases {
>  		i2c2 =3D &i2c2;
>  		i2c8 =3D &i2c8;
>  		serial0 =3D &uart0;
> -		ethernet0 =3D &eth0;
> -		ethernet1 =3D &eth1;

[Severity: Medium]
Is it appropriate to remove these standard network aliases to bypass a
bootloader limitation?=20

The device tree is intended to accurately describe the hardware structure
independent of bootloader software bugs or workarounds. Removing standard
aliases can disrupt predictable network interface naming and standard device
enumeration.=20

As stated in the commit message, this change is made solely to avoid U-Boot
patching incorrect MAC addresses. Modifying an OS device tree to hack around
bootloader limitations, such as U-Boot's fdt_fixup_ethernet, is generally
considered an anti-pattern.=20

Could this be addressed by changing U-Boot's configuration for this board
instead?

>  	};
> =20
>  	chosen {

[ ... ]

> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 837616255464a..609c4755775df 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -15,8 +15,6 @@ / {
> =20
>  	aliases {
>  		serial0 =3D &uart0;
> -		ethernet0 =3D &eth0;
> -		ethernet1 =3D &eth1;

[Severity: Medium]
Does removing these aliases here also risk disrupting predictable network
interface naming for the OS?=20

As mentioned above, it might be safer to fix the U-Boot configuration
rather than omitting standard hardware aliases in the OS device tree.

>  		i2c2 =3D &i2c2;
>  		i2c8 =3D &i2c8;
>  		mmc0 =3D &emmc;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920100000.3888=
256-1-amadeus@jmu.edu.cn?part=3D1

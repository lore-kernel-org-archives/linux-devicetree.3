Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82153AF66F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698608; cv=none; b=ueVyhKDIZTKC9T6bBJGXTY6fFt/FmPRfekJL3Div4G6FMNQm4vSuGXu6sOm2BsvNPBjYnKEXSE117qwlHB1rCBu6+IMmaUdYI3mTf6SEuAeDQJ88GFp5Axup2HMxNfaXDq4o+tYOvJGECkM/6IRwrON4pogbsTBpZQYYrq4zljA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698608; c=relaxed/simple;
	bh=QwsxUtcoJmWIz8Rar57S508nxiklNlc+WzIefxiKPyc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WBnniv4COycuPW0iwylXIa/xEeWgQEQQZerpuMMRdBWNenMxA8jpd+uRkoFEB0EUO0eJgJ2PU4igaex62T/dkTRsL+tLjxZdlta8/HyNm2GA8RDB1iKtZNh/WK85QlbzQUGEXVm2e+5qkVgNHxHaKfx2HvKiBjtyW/XpfeqXhzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGuS0QCo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGuS0QCo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A9EC2BCB7;
	Wed, 13 May 2026 18:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778698608;
	bh=QwsxUtcoJmWIz8Rar57S508nxiklNlc+WzIefxiKPyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZGuS0QCoVGQ1YfEruvEeuL2oGlRshdlVfwEJj1b++8TQjThQwbAR4hB+/T1+NR7XD
	 w3cw8LSXWvuCfMjOW3em/BmmVIKHRPUyKMY/sgdOhQeQEmEa6YfLJLwiPI3mSm3kKX
	 kBh6SXLUlHfFIft7Z1iFzZHK5KZBTdU93gSt8MNglXADcfMBbe+2OpnegeVIR+MQTG
	 FDL8cNq0yokOe6tzBMbOyK1ikxlDaij6WHpMQqX3ZgU4NvMKBYMUUIxMOEcfNAKAOZ
	 Jrnh4g8tFKifx2/DVDOqhRlRNDqBqNFsGDpvvzlyhAcsXdrswkwG/pQ2mqTJtOP3fa
	 uNOeXv2p8Nb3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512073953.564323-4-zychennvt@gmail.com>
References: <20260512073953.564323-4-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 18:56:47 +0000
Message-Id: <20260513185648.16A9EC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The I2C0 controller node is entirely missing from the SoC device=
 tree.
- [Medium] Dangling device alias pointing to a disabled node while the acti=
ve node is left unaliased.
- [Medium] Meaningful mismatch between commit message and implementation.
--

commit 872a73a723152a79752769d63796c54985979c16
Author: Zi-Yu Chen <zychennvt@gmail.com>

arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC

This commit adds I2C controller nodes to the MA35D1 SoC device tree. It
also enables an I2C interface on the MA35D1 SOM board and sets up the
corresponding pin control configurations.

> Add I2C controller nodes to the MA35D1 SoC dtsi.
> Also enable the I2C interfaces on the MA35D1 SOM board
> to allow communication with onboard peripherals.

The commit message mentions enabling multiple I2C interfaces and allowing
communication with onboard peripherals. Since only a single interface is
enabled in the device tree and no child nodes for peripherals are added,
is this description accurate, or were some parts of the patch omitted?

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64=
/boot/dts/nuvoton/ma35d1-som-256m.dts
> index f6f20a17e5018..a0f1d76d288e1 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
> @@ -13,6 +13,7 @@ / {
>  	compatible =3D "nuvoton,ma35d1-som", "nuvoton,ma35d1";
> =20
>  	aliases {
> +		i2c0 =3D &i2c2;

Does this alias point to the correct node? Since the i2c2 node remains
disabled, the subsystem will not create this interface. Should this be
pointing to the newly enabled i2c1 node instead?

[ ... ]

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dt=
s/nuvoton/ma35d1.dtsi
> index e51b98f5bdce4..a88d1c2938e78 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -372,6 +372,66 @@ uart15: serial@407f0000 {
>  			status =3D "disabled";
>  		};
> =20
> +		i2c1: i2c@40810000 {

It looks like the i2c0 controller node is missing from the hardware
description. Should i2c0 be included here to fully describe the SoC, even
if it is marked as reserved for the secure world or a coprocessor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512073953.5643=
23-1-zychennvt@gmail.com?part=3D3

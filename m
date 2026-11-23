Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409322;
	b=nEhP6eEp8En2jeOrAU+tApgqht9m/pHMveMRFErNO4EswnpjR5U8qtfz24MgOicywzoe
	 P8lza+3PHEulUMe5u0Ec9bCBTa3ZkYUO5Iv4ismCYE6t2Ped1cv/eiote/a2fnLzxmaL2
	 7eAYJUQjvRHlMJ6NOX3vl5lFqJq5RHroH5gwUd3xfuCZt0fClNwuR1CkKgMkFP7jZIwaD
	 G/uPWRLzgH8mXyE9s/2vVgka5vu9rMoigPhHmMU5uKf4Yrj3jKMtW3Q2Ucgzu6dE/YO7w
	 +yfPxqVO0ZD8zbUW1kB6c7OKv5xqB7/ysQbay7EtLZFvVvCTbDVTRL/x/RDcKR2dDCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409322;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fK4fAkl/I17x3rXAnq4+4YZuXC9bRSQp3I1B0R6wHnU=;
	b=u8ZOhrYq0YWynQiCCxyZ2zDM2g0DcifT37/I0jwi6ZY2Fj1h/hzzbT0SfzJ3CUdkkHbv
	 pTBayut6SMJCk/Nh86FUavj6c2BdN0I8lTnOzkwAi/lc8WUvkQj1tTyHEAkzUaXrceMTs
	 gDMPc50qQWbzV21eIDSnzvDrU+wc7gEZFJE7ExTcoPkFmFymM/lLWdr4G0ThojaIUbeo7
	 lhhr4CgZ0i3yB/vHnm3TJlyi19FoKTAQngR9hLztCAwdoAXlkq0PG/KwRHB9RtLHmDxV6
	 5aGtBHugOCyuFF9Oep/a4IOVQfH5/T5bj7mgku/jyWpHDNe9YeQqvJRj5ddDYAAd72w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmqljOOM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB19606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmqljOOM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589941F000C4;
	Mon, 23 Nov 2026 04:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795409321;
	bh=fK4fAkl/I17x3rXAnq4+4YZuXC9bRSQp3I1B0R6wHnU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dmqljOOM1akJWmBHJd6VJnKP7I4xoy0CGMXScrl4cZj+XMX284A4fP9+XoMPX55RL
	 pT7xWyYE1q7j1ZWKeRjDi/vbOPx9wYEgsShI2y4t1wEBIjy5X4noyitrQJAD4H2V8o
	 H578A3zo7p18a8SVIvukepgyrY+2JSs1vlcIhYQHofm/W/ZC/Rh8CwR/p7oV/BgW8J
	 Oi0UoEMP4HEcqsxiZ3GQ+krtgFyL30rp13VvTfg9OnQmyabzkYeN80mttfI1A7CiY8
	 AAg8i52gMEWm/MAu276L43kjs3NmePzbRU5FhxKrevZriJe7Lh/EVThG58RPxqEGpz
	 lVYUqqflw2/Mg==
Message-ID: <sashiko-outbox-228672@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zixian Zeng" <sycamoremoon376@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 04:48:40 +0000
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
- [Medium] riscv: dts: spacemit: wrong EEPROM node updated on BPI-CM6 IO
--

commit 2ab11d07395f6ea4127a5f2a679e6b875d4bd75b
Author: Zixian Zeng <sycamoremoon376@gmail.com>

riscv: dts: spacemit: k1: fix the EEPROM page size

This commit updates the EEPROM pagesize property from 16 to 8 across
three SpacemiT K1 board device trees.

Link: https://www.giantec-semi.com/uploads/20230414/GT24C02B.pdf [1]
Link: https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/vie=
w?usp=3Dsharing [2]
Link: https://pan.baidu.com/s/13UTY_qM4gGuVxsZ9U7_Xpw?pwd=3D8888 [3]
Link: https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnO=
NSR?usp=3Dsharing [4]

> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts b/arch/r=
iscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
> index 2c2d78aee98aa..23a1323df30d9 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
> @@ -101,7 +101,7 @@ eeprom@54 {
>  		compatible =3D "atmel,24c08";
>  		reg =3D <0x54>;
>  		vcc-supply =3D <&buck3_1v8>;
> -		pagesize =3D <16>;
> +		pagesize =3D <8>;
>  		size =3D <1024>;
>  	};
>  };

[Severity: Medium]
Should this change update eeprom@50 in k1-bananapi-cm6.dtsi instead of
eeprom@54 here?

Commit 46a8c01700ac ("riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO
board") added two EEPROMs: eeprom@54 on the IO carrier board is a
1024-byte 24c08 (which uses 16-byte write pages), whereas the 256-byte
24c02 ONIE TLV EEPROM storing the MAC addresses lives in
arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi as eeprom@50 and still
has pagesize =3D <16>.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-fix-bpf3-e=
eprom-v1-1-df8cce6ef2b5@gmail.com?part=3D1

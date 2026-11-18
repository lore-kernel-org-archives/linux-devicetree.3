Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982018;
	b=Mwa1LPsLNUSS9PirWcVrkBQ32LaUHxBGK2dGbskuu1Ce95HCTG/7jacCelnl6hhhw8wt
	 vVzru6jM01d4UHLCDSIWLJ0HQhk3fM4K6GrAm8CaJ+gAxGM2FNV83IxxzAPjMFFmtMK6d
	 18YhS01H12z7CogG8f9/wvs0/2kb/bzmJV2oXagVPh6AfZ76Zj5BKoBH1T3EwcYzEutNS
	 onDPH/Fw4375U49pSI6ZHWatb5mOCKngyA6zBTHmyf4wvijYXJRy9q40xq8YvG3ct0m5W
	 e6sRK19npWWJ5uzZcYQPe1i/UaKCKXACka4W5QvtvnpOir5jjCqtcl3/UcQTf3zt4vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982018;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o94yBQK7TmK8vjTsd7YfPnKQEOVN0NKhIFSpah1Efyg=;
	b=Wr8EoBHva49MpZf9gVyzbSPTtUhiwt6YAAog8Z1R8n94t14Hz0N9uSpAcZ+qsZw3JpHF
	 bjspzzU/RlVQyS19teBzfmmqVxsQ6nz+Zj26dGLB0S/131DQx3Pp/FhWmdYcCWnrr8cEd
	 oqoxslXX0wB/dGHmOur11PJq++DNOkR2UCnDmknpMcqN/qGVzhiyNkad08hFhR9D0sBq/
	 vit7aLyJZGyLwaLboFJwfTiyGfNRVyII5tFCIpMxBVazRLGSKRVh03hiGOHNjE+8zf5FY
	 mCxEwO+zBmxgyEumeUFa1nwc+FdLy8DygoNkHsnJHxzYhKxuhuKUnM5gbjaaDUbLdsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Li3v115X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6D7606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Li3v115X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2061D1F000C4;
	Wed, 18 Nov 2026 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794982018;
	bh=o94yBQK7TmK8vjTsd7YfPnKQEOVN0NKhIFSpah1Efyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Li3v115X0CDGg0dMqsMtPBKrf7WlAz40CJQemKLD4pgduphp3RvrDmKebdGSX0/RF
	 /dCX5QH+5jLPJOQkYzuz71hiNiuWfgQOsV5g8WUWrW7LqrvytRLgnaNs4e+8y1NJRX
	 lCK/OSMCgD+Md9MFN4AZtUUz27HDLamIOm3h8EywQDCIOWqiHyZJtnREYqZcIDx1hU
	 qKVHRGK4J+AWaW+9cZvr/LCkRA+FjksLGALLxUJV+JS8dB1aRwzP7k5OsEPyKw8dDM
	 xJZOf187UZ+Ji5PEUoD3waqK+m4cBjM9j2PfUOy0N3YZpO6DkX0/p4vmTaZKHIZnAQ
	 IEVXrlMKb0Kuw==
Message-ID: <sashiko-outbox-220205@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/17] ARM: dts: BCM5301X: Buffalo: use gmac2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118054758.132233-14-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
 <20261118054758.132233-14-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 06:06:57 +0000
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
- [Medium] ARM: dts: bcm5301x: missing gmac2 MAC address on Buffalo
  switch port 8
--

commit 6598066c57888a377c2571d52762ecf08eda69ee
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: BCM5301X: Buffalo: use gmac2

This commit switches the DSA CPU port from switch port 5 (gmac0) to port 8
(gmac2) on the Buffalo WZR-600DHP2, WZR-1166DHP, and WZR-1166DHP2 routers.

> diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-commo=
n.dtsi b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
> index 9f9084269ef58..2f1d49733f092 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
> @@ -179,7 +179,7 @@ port@4 {
>  		};
> =20
>  		port@5 {
> -			label =3D "cpu";
> +			status =3D "disabled";
>  		};
> =20
>  		port@7 {
> @@ -187,7 +187,7 @@ port@7 {
>  		};
> =20
>  		port@8 {
> -			status =3D "disabled";
> +			label =3D "cpu";
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts =
b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
> index 192b8db5a89c3..47670b9bfb799 100644
> --- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
> @@ -143,7 +143,7 @@ port@4 {
>  		};
> =20
>  		port@5 {
> -			label =3D "cpu";
> +			status =3D "disabled";
>  		};
> =20
>  		port@7 {
> @@ -151,7 +151,7 @@ port@7 {
>  		};
> =20
>  		port@8 {
> -			status =3D "disabled";
> +			label =3D "cpu";
>  		};
>  	};
>  };

[Severity: Medium]
Does switching the CPU port from port@5 (gmac0) to port@8 (gmac2) without
assigning a MAC address to gmac2 in the device tree cause these boards to
fall back to a random MAC address on every boot?

When no MAC address is specified in the device tree, bgmac_probe() falls
back to the BCMA SPROM indexed by core_unit:

drivers/net/ethernet/broadcom/bgmac-bcma.c:bgmac_probe() {
	...
	/* If no MAC address assigned via device tree, check SPROM */
	if (err) {
		switch (core->core_unit) {
		case 0:
			mac =3D sprom->et0mac;
			break;
		case 1:
			mac =3D sprom->et1mac;
			break;
		case 2:
			mac =3D sprom->et2mac;
			break;
	...
}

Previously, port@5 used gmac0 (core_unit 0), which obtained the factory MAC
address from sprom->et0mac (NVRAM et0macaddr).  Because neither DTS defines
nvmem-cells on gmac2 (core_unit 2), gmac2 reads sprom->et2mac (NVRAM
et2macaddr), which is unset on these boards.  As a result,
bgmac_enet_probe() generates a random MAC address for gmac2, and
dsa_user_create() inherits that random MAC address for all switch user
ports (lan1-lan4 and wan).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118054758.1322=
33-1-rosenp@gmail.com?part=3D13

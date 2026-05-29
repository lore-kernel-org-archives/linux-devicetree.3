Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55893EE1E2
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068521; cv=none; b=hK8A4wAM+Tn9ml78I3KcmliR3MQvFVVnm8U7YBfTtXyyp+8bQcNt6Ub1aP01M3qz9EjcpvRkSYGi9wO088Q/BxZOVKtUwKzxPdrMvTCeAeC8RwAPNqlnsebtuLneFNpsxpsAJ4Vvv10VGNowUcakRl3xxp34aA07AN/xFU5xarg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068521; c=relaxed/simple;
	bh=TpET9KkAYhzmtWBlkhjKD2sgxBONHmkvpdkbIGbnwRk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ntdtwR8QHkmB7R+WFBpj5hyh099pXUvknq8zOZqfMrdhYXcdeBt/yKOw5mmBplCsT/slUp2JGxTwwIKGoiry8wnmMkOnx5aqw1JPvvhP6gyjRXHFKRH+wLdkv1Nwf6WHz9KbON0Pdzk+SfNroMWHtdBxJP9ZjpaXj3/7WMfbcxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6o5HhuT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6o5HhuT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792FB1F00898;
	Fri, 29 May 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780068520;
	bh=Eg6FSI4BrnHKj/udEmywtPEQy6BgVRrf2Js21MHe0s4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V6o5HhuTZEDZE3L5ddK91JvaQnXBpZBqvvWuGMEn59Qls37bMDlz3ROZYR20AptWQ
	 oxTOW5dldV1re26RX01IOGfxBPTbJKn3Vd74cW4GP4DjI4uypiXKMVSZW9UW4j9bxt
	 As86+bzJoPG5ZKVk9fB4Jj3yO4Wl+C2MAAV0c4QdJlFuVszjJoBfEWTbt/resSAMJZ
	 3nVaYdu1myJGi9qy1PI0/m1iHY/Pl4unFKBFzFbDJxOKw5uajUbTnbhhq7yzem0Yh3
	 PTwePNSlwi4Wz9utQVLNqhmJj9W58iLXeu4X50Fd3ga+WZ4LLBgdv747dn7i+jSJff
	 QA6xHMpsHViMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/15] arm64: dts: st: add SDMMC2 support on
 stm32mp25
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529144707.3931919-3-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 15:28:40 +0000
Message-Id: <20260529152840.792FB1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `power-domains` property is missing from the `sdmmc2` node.
--

commit 4ee314c8f9ee08a9bd17b8a43369159b8e1356d6
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

arm64: dts: st: add SDMMC2 support on stm32mp25

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts=
/st/stm32mp251.dtsi
> index 673fbc5632e69..5e46024d22152 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1667,6 +1667,21 @@ sdmmc1: mmc@48220000 {
>  				status =3D "disabled";
>  			};
> =20
> +			sdmmc2: mmc@48230000 {
> +				compatible =3D "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
> +				arm,primecell-periphid =3D <0x00353180>;
> +				reg =3D <0x48230000 0x400>, <0x44230800 0x8>;
> +				interrupts =3D <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&rcc CK_KER_SDMMC2>;
> +				clock-names =3D "apb_pclk";
> +				resets =3D <&rcc SDMMC2_R>;
> +				cap-sd-highspeed;
> +				cap-mmc-highspeed;
> +				max-frequency =3D <120000000>;
> +				access-controllers =3D <&rifsc 77>;

[Severity: Medium]
Should this node include a power-domains property?

On the STM32MP25 SoC, peripheral IP blocks are linked to the cluster power
domain. For example, other nodes in the same file use:

    power-domains =3D <&CLUSTER_PD>;

Looking at the git history, the sdmmc1 node was added early in SoC bringup
before power domains were systematically added to other peripherals.

While the sdmmc1 node is currently missing this property as well, does the
absence of it here cause a regression with runtime power management and
sleep state transitions for the new sdmmc2 controller?

> +				status =3D "disabled";
> +			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529144707.3931=
919-1-dario.binacchi@amarulasolutions.com?part=3D2

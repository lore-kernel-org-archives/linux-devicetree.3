Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128463;
	b=NeZb6EBtfPPvCOmHtFaNExc3vYEc0FeNTIpqqb/MIG8p5KeLyEOu54dQdpzFDoFm8fTc
	 Qfehg3BYLIDoYB6qyC2bu7WLvM8v1MQvPKpl6I4bHV/agzgFY7oGw12RMxS1E2/Ea7flK
	 cUZnsgpt62z6NshmpDPBYeiT2nR5iA7OuHMXDMiO14mSX+6Mu+A8WCJ+2jxIO2NuU3pfw
	 C8wipOPExrNQ2+jRL5D5xEYeCzieadYVO9gXBUnOeoUqS2nwAPpeyUotglRmPLBIGegxQ
	 Km5HEuK1JRHbbpXbdEpAP7Vj9fSEYOJ0Za8DXYEg/sMC9ZD7MZCnmKOPsl7Du7aFWRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128463;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JIgK1GFGTLAibAycVDU4Ilk9gwwZ+wQB4sRm8Qwobyk=;
	b=vLjhccZRQdNP4L34ECj7MnNZ+sE2BzaPrXv+np7AsX19VrJcfxgjBVIiIrMdn7hQ0j1S
	 0+V/q8pGh3IqlVvCGaE+4rYu4izfpo2bFRyxR0IYU281N+A497Si60gTe72FBdrMFl6Is
	 zMKXe80OSFpTkY2YHCyC30JuP65cG2slwuJjIDJQcSSRNJ+o/sfx6FAO4wgqYdwZI8yyZ
	 oDr/HM7fW7ww9rKGAStI1o58DTuT1tu4LleXoqWnBPxV2r3JrW7mrmng8SxopBQHSWD0X
	 VJ3FX5bMlsyJ0x3iZt0c9wlyYnCBz/MQIJjiYGE3wFAEseX6l8fHa9R6dWY0pF4jXYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKHI96wr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A47F606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 22:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKHI96wr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F721F000C0;
	Thu, 19 Nov 2026 22:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128463;
	bh=JIgK1GFGTLAibAycVDU4Ilk9gwwZ+wQB4sRm8Qwobyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FKHI96wrdNPZyvPyoFZ1WIvTD6ql7WyJXPWmOCom1DzcIdvU2izBeCOXfHYivIb0T
	 zfKFLtCk9rfMQoHNyURAkyemsgmlgRYNFQ9NqNuHhlALri6krHyTD10NCnQzAt8h28
	 pAlpS7XSelhn8oux5nyybZQBH98yDdMobRC83fcGzJxBH5dv567v8bfshIuAU/mlgl
	 n0wgrVnIheoJYWCLEWvX1yPYxmkEup6bWDHTYtwmyipjFq4bf0aR+fkqI5UHZ/ui7Q
	 5ZwZZ+T+YDNlW7Z+Qb6TM/B9ayFtpnq982Bo7G8WI65tbJZz/SXXZZdsuy0+ZHyMCO
	 JisNq5v3SNGpg==
Message-ID: <sashiko-outbox-224158@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add
 battery fuel gauge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nizat Mikayilli" <nacht@dxdmail.cc>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-6-2e2388589a62@dxdmail.cc>
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-6-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 22:47:42 +0000
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
- [Medium] arm64: dts: qcom: undocumented compatible
  siliconmitus,sm5714-fuel-gauge
--

commit 86693e3820c815a003cf0d7756433d76382ae959
Author: Nizat Mikayilli <nacht@dxdmail.cc>

arm64: dts: qcom: sm8550-samsung-gts9wifi: Add battery fuel gauge

This commit adds the Silicon Mitus SM5714 fuel gauge on I2C hub 8 and the
8400 mAh simple-battery node for the Samsung Galaxy Tab S9 Wi-Fi.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts b/arch/=
arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
> index 8323eb8377103..511bdd05d49bc 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts

[ ... ]

> @@ -604,6 +610,18 @@ cirrus,gpio-ctrl2 {
>  	};
>  };
> =20
> +&i2c_hub_8 {
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	fuel-gauge@71 {
> +		compatible =3D "siliconmitus,sm5714-fuel-gauge";
> +		reg =3D <0x71>;
> +		monitored-battery =3D <&battery>;
> +	};
> +};

[Severity: Medium]
Is "siliconmitus,sm5714-fuel-gauge" documented in a Devicetree binding
schema under Documentation/devicetree/bindings/?  Without a binding
schema, dtbs_check and checkpatch will report an undocumented compatible
string for sm8550-samsung-gts9wifi.dtb.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-b4-gts9wif=
i-followups-v1-0-2e2388589a62@dxdmail.cc?part=3D6

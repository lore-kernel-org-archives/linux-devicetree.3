Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022239;
	b=c4eqrxePcYUBiOWRiBeFu+HXcuTtPxaQFo0hooDDGcfUhc40bwh8dEuX/kNaw6tExO1p
	 A5eg5nI0udpBdcSRuYZXdJ942NdHO/aTc8HU8IkoutouQESYoJcddZkdR4ymx4btpQqra
	 RnwFshiEEiK4P1cZNTrwRwuoCfirH2aLai7TKVBV5vQy6PW5QmZt+YWDOiFDTK1BQzEic
	 KGNZ/SOzyYHde6K3aQy+lpISaKp+vHUqqWUUrVp4xO0mUKOhs9oZighcKv7uyCF0Vv9yg
	 SMihXklVFA8fREGPgHdnLKh9nA4NulVF3STyCm8AzJ4dbXOzvYQKV4qSGVIRzr4cbmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022239;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=36meyhPIqK9Ps95TgiUOB1YGnRp5qxit1sRmbEIMNlc=;
	b=hm9RsH+IJbRv8woI8ME+/uhfKIIQDRChvKaJJj3/w5gAeB1pQeJuxwueNjLZVCbjL1Jq
	 Wjf1Cv7eP7GrFzRjt7GMElj4nPQkbz/Vq/YWnuBJXpGSGgtpSF4NNBP46iYv3WILH/Jyy
	 gBbA33IbYyhWiKPupJtRpbWjsvZMOATeSINoCIL8keOFGWl/Uqfe+oqFIxCThYOC4tmX2
	 ZQOlZ767bGwxrVb2HnxMmOlKKj8dYIzWM2+k4UCoI1M147jotXKoa/uUZh5Hw3lZuHh+I
	 7QuJ5+6jWxcYGTS4tTzZtDKCntN8IBNYjCTEMLJiCLYhFdQsPow56Pimkp47NE+TFbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STWFNSyP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E811606A331
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STWFNSyP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8681F000C6;
	Wed, 18 Nov 2026 17:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795022239;
	bh=36meyhPIqK9Ps95TgiUOB1YGnRp5qxit1sRmbEIMNlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=STWFNSyPje7wYDQpWwLYrjF7spNAP3WXqvusxW8lKlO1PJiaxZmMuvv23UTI/bt20
	 SQmjNgPTaSljSTV6B1EvoLpVUYF/8T3S1TjzqiVFObhtuxPA8ajlv5AMyV8W+sXdv9
	 Iskaz+5I9K6CNo+Mp6bV02sQcUoDDI00U9JmGgu6w6OR9SBrwr4/nOGoZCEokJxH89
	 gODPG8OVdZimJCf7Xpm8eNBBf+tV5xqAlRJ6If+V3rkFzNGL++TjE5p3ZZBHZjHHCv
	 cPBSzyBTwF/BYTOzVe7erYmzVN98bgklBG1SB9DiW7jVN/+WE3Wh+Y58VdvyCeW2JB
	 4nkhvi8gVzLEw==
Message-ID: <sashiko-outbox-221635@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add MT8173 Amazon suez
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-rbrue-suez-upstreaming-amazon-suez-dts-v3-1-c1a8b0febf35@gmail.com>
References: <20261118-rbrue-suez-upstreaming-amazon-suez-dts-v3-1-c1a8b0febf35@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 17:17:18 +0000
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
- [Low] arm64: dts: mediatek: undocumented mediatek,mt8173-keypad
  compatible enabled
--

commit c33790cfc531e5cd7fbd7f7174f861a419969c8c
Author: Ryan Brue <ryanbrue.dev@gmail.com>

arm64: dts: mediatek: Add MT8173 Amazon suez

This commit adds the device tree for the MT8173-based Amazon Fire HD 10
(2017) tablet (codename suez).

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/a=
rm64/boot/dts/mediatek/mt8173-amazon-suez.dts
> new file mode 100644
> index 0000000000000..68ccf10d1521b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts

[ ... ]

> +&keyboard {
> +	/* Each key is reported in all eight rows of its column */
> +	keypad,num-rows =3D <8>;
> +	keypad,num-columns =3D <9>;
> +	linux,keymap =3D <MATRIX_KEY(0, 0, KEY_VOLUMEUP)
> +			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)>;
> +	debounce-delay-ms =3D <32>;
> +	wakeup-source;
> +	status =3D "okay";
> +};

[Severity: Low]
Does enabling &keyboard cause dtbs_check to fail on mt8173-amazon-suez.dtb
in this tree?

arch/arm64/boot/dts/mediatek/mt8173.dtsi sets keyboard@10010000's
compatible to "mediatek,mt8173-keypad", "mediatek,mt6779-keypad", while
Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml does
not yet list "mediatek,mt8173-keypad" in its compatible enum.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-rbrue-suez=
-upstreaming-amazon-suez-dts-v3-1-c1a8b0febf35@gmail.com?part=3D1

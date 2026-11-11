Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425468;
	b=bAH+iRW+fIvh79+/elYw2/YADi9qPnixdyx0TnrQ23QIPPnQ9yw6Vd+418gHfQBaqGBR
	 ImDFxxHarSpwpukJMDSEf3kcqab6VW03V4aBYif6QvQYvc3HdFbbZfBmdvj8Fn/6/XykG
	 5Im2ROxDAIiYbCT4HpuFo7+CE+BfbY/5kYLbydJc/z9y3OpIyY28MiyX5z2c837hfw1HY
	 2K7HJK73Fboc5WoXfdfoFPzWCaWpC0HSPJfrODpJmILo1PxtzYBnvDENVdLwHpyw8CPoE
	 GuO+/K3opS9kQJUzWK/1uBKIx9UnzfiFzGYpwJ3MdmCtaPmjgGwh3zhZ6JDtTit3e+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425468;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d5qfP7Vz1e7eVaUP0kab79h9cXY7IEAfZy6tEmk5L3s=;
	b=IkrhWAMKnMI2xKR1ZV/Fi2Z40uXm9YYl61ucj6IwsULljG/IANmVj/rIKRnJkBwosPly
	 0XiKVPGiM2g4TPGGpyP+MgQsvS7/nPCKLezdY9EqJ/rxMaOrfKCUNwPDxXq3nuLEPzBnn
	 +0DmFjrnbamej8woKo2Y8CcYc15MCWsNeY4CskbqN6/ctq7B2nd2NFLPdztIUna/wFmeQ
	 V43fSfbj98YfhGfE+4SkC2G7ZM+tWBIq6qpitGi/ZqkIRmPexoHPaFup9q/LGZgHqh70I
	 0HUOYHiKBk01zaYTO+akXwndKpZgnfuzL04b11rgqYPV2n/5Z4K3BzdQCypVW7a5RxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mnDI1vXz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE65606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mnDI1vXz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4549B1F00A05;
	Wed, 11 Nov 2026 19:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794425467;
	bh=d5qfP7Vz1e7eVaUP0kab79h9cXY7IEAfZy6tEmk5L3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mnDI1vXz7TKjtQBoCP9tZ72b47foO2ME573t00GZprd42iexJQKOjDr9osfElHK2a
	 wAEVoPrDHeIDBwTYGtDBuBUdOo4V1Wyq7ykpNRrsBNNIj8xn6K5++bI7dd38DbVcdv
	 mAhVCQqYr0BnM+IuEOk5yClB1VqkLrvfyht2YxipqD/zm2W739EjHIGWxatMK+QkXQ
	 s4/FnwHm3icfRWwTAIclP4lxbDRQUG6UKkKKF92eRSR1LrhuWkakqQxAgVTT2IaHsz
	 DvamO75KcAq1jR4ZLwiPzdyE70+kUJhwR8frX4ST6Q13q85/ESzO5iQRtAvTyEljtV
	 kvl94aKaeJOvQ==
Message-ID: <sashiko-outbox-209564@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: mediatek: mt8173-amazon-suez: Enable
 the volume keys
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-4-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
 <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-4-77b47cdea702@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 19:31:06 +0000
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

commit c86b4509f24bf9c0cb8e730caec069d612fff4cf
Author: Ryan Brue <ryanbrue.dev@gmail.com>

arm64: dts: mediatek: mt8173-amazon-suez: Enable the volume keys

This commit enables the SoC keypad node on mt8173-amazon-suez and configures
its matrix layout, debounce delay, and key map for the volume keys.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/a=
rm64/boot/dts/mediatek/mt8173-amazon-suez.dts
> index 6fd7777eb4912..7dc0d818a44d6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
> @@ -250,6 +250,17 @@ light-sensor@23 {
>  	};
>  };
> =20
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
Does enabling &keyboard cause make dtbs_check to fail on
mt8173-amazon-suez.dtb?

In arch/arm64/boot/dts/mediatek/mt8173.dtsi, keyboard@10010000 uses
compatible =3D "mediatek,mt8173-keypad", "mediatek,mt6779-keypad", but
Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml does not
list mediatek,mt8173-keypad in its compatible enum.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-rbrue-suez=
-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com?part=3D4

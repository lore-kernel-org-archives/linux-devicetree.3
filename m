Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424500;
	b=sEECIS2VKnk/+wd7pJ8H7/79+P7aRYcQK2k4xLma1W/OW8LcZ3qCqCoYQZe6GMcMrRox
	 S579yPPwOepV5pPe9/Z+7o2hPugpN9rGt/2TKJzj/NApULGm6umOZHUMBorxlNA0KP34e
	 FQKnMscaPy9irDvS3YMs5grn5HRdEEFhIZ+voLAl4i+mtL19kEMK4kcGtV1QujUAzMSX0
	 PJxwUUzQWOaFyf0j//pKdQFjeSO+1VR13v+0QkXTFxX7n7XW12qCNH6/AKi3wFGCU1VwW
	 qAlsvvwsjT2OPGnggcDmZElnb5roGKTM+j/YTy2KHQyFYupjmRXsugV4U0gYWXdvGmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424500;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D/dJnHKpFe1J1mpBpIIROWMRaEcfvMp7mcu6G1gKh5A=;
	b=fQAXlAKqhEGC/ouCoiZXNX90fmzDUo16WXyBUpzaTWp6npL2zpnf8ZptkTxKxQZ1FqLz
	 F2yHtiYAH8dfW7tYQ+moFyLj9bvJQABD+AWMH/E5QYzWxOQOdsByeDwe4R3P4Vkd6zVPW
	 UtP69MtKCzwn22Ix3Rdc+MW4dV9B/PfRu/ao8En3aN2qaQmEuaytGtZqOIVbQBUaTFUT9
	 4/CGrKAEU0YtPTjS8uzQeM5T0paHU/QinH++LB1Ll73W9HL/pCLI9ilff8m8KhuK3G+dG
	 FXezwHVNBk6W9wCFJrUGHtagK2y0lH+a0KKs/igEhwfjrie5KaBqgrBf2tiuqXMMQww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HhCrXbuV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F37606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HhCrXbuV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7431F00A05;
	Wed, 11 Nov 2026 19:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794424500;
	bh=D/dJnHKpFe1J1mpBpIIROWMRaEcfvMp7mcu6G1gKh5A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HhCrXbuVgY74BV3R0kRcMZSKv9yBCpRjaWQIFWvLWDlDyu9gg5uOnkAzzNs8c2mb6
	 ASxa3OylmL8M28HHfxNrvyUjyq7QP2RpwAfFaObkZTaB0c4sNiRwncE3TIy7ppkjFU
	 1SyLlSwuL2xbXEplWFz9+2vhu2nq5se5O/0rcmhQLE8s898DIMwDQC/oMYmS4hkWD3
	 K3LKW5mC/nf4aELbrfbBoHTEKKs0M8P2S16VRI3BzA1GVvtyYN4mIzHFI9zS1n3pb7
	 1ysIqRplEGAChFOjFxuk9U4Gk+5GlZ5zYr58E5dhrKFFeDn1ijvi4cHGQEQbL8Hho9
	 bgGVTk36ltbWw==
Message-ID: <sashiko-outbox-209542@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: mediatek: mt8173: Add the keypad
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-3-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
 <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-3-77b47cdea702@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 19:14:59 +0000
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
  compatible
--

commit 4cfa9faa42ef443ea3e9f6ceaef3c60ddc279da5
Author: Ryan Brue <ryanbrue.dev@gmail.com>

arm64: dts: mediatek: mt8173: Add the keypad controller

This commit adds the keypad controller device tree node to mt8173.dtsi
with a disabled status for boards to enable.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8173.dtsi
> index 2ecdea33672ea..61261fe643ab7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -555,6 +555,16 @@ pwrap: pwrap@1000d000 {
>  			clock-names =3D "spi", "wrap";
>  		};
> =20
> +		keyboard: keyboard@10010000 {
> +			compatible =3D "mediatek,mt8173-keypad",
> +				     "mediatek,mt6779-keypad";

[Severity: Low]
Should "mediatek,mt8173-keypad" be documented in
Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml first?
Without adding it to the compatible enum in the binding schema, this causes
checkpatch.pl warnings and dtbs_check validation failures on MT8173 device
trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-rbrue-suez=
-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com?part=3D3

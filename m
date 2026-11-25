Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630811;
	b=w/vLb/wll8snb5UsuheOD1T+wY3zX9fCmMGhleA059jVfDLRH0Q5KW3hmNnxz57IUhWC
	 itM6UOjJqxNkps00PiSD6B7jFxz9SAxWg6fs1ZNea0Lx9ZxnyHtkb553196bgndwwwfQN
	 aX9rEazShVgEPkWOC4Z9hJ6Wt0QdoBd+OPYpYChanDjE2uBcaAvHBffKxQzSyhXhgSrK5
	 gWXRiN4kkwx1lEA0tYSdyK+eP58jzhwUf77znnnf1q7azij4HsbAbeYykuMTGawwTODIl
	 wSFtuWdwDBxtuU06C51iUpbeXwKL/JhQhGvCU3d3HlOwBx4bKo3TtgNSJVBm9ytiwNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630811;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v58QMw0yjvceZo/hZz9U551vX4wCUdNK8yu0lcIAhxc=;
	b=QpTFhuK3w2ZkcefM0I+mAdG8NCXj7XZN8iRLX7Ufc0B57gF4G1OzY1Wv79Rr1VC0ObXY
	 CochsNbu6vNh85QUDpm+HOfZXa0BpQL9I20UiSnh9r3kckTW5yyPT0c4QlaurXfia0uGm
	 aPoiykSeJ8dY09I7beHy7xzEjSMAt9v4+Op0avIxU2/z4IKjNXosji7pov9IUPX+/Dk8P
	 Q1JN8VAhRrFHKq0AuJX/6TlwSlSToXnJKZXlrwbFN1CXN4ouGcx6Blg67RKmaj6TPJkPH
	 pGn1Uk2N+efj9LyxGRlI8nGDcpxH63RjHTUnU1D6eNoAZRc0EEnkvI5BcHpSpw8RyHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpYjqAbm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9F4606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpYjqAbm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478F71F000C0;
	Wed, 25 Nov 2026 18:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630811;
	bh=v58QMw0yjvceZo/hZz9U551vX4wCUdNK8yu0lcIAhxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QpYjqAbmPNE5gtJUI0Lv4+dgXhQkrAgvb1bUmZsxgAflE2tSWJmrrGBnIhMiFy7/m
	 Bb2vyCBzkcnHbcpOvWC9+dUW5JNAZqAqDa90IF96bcymuXcxndAWmhtvfeRHUA8wuA
	 f7+h8SUGTxdTJLbj5dWTJh5tMFwshVa9CDpRL6In9vpuCFfyQ6NR5B/IS6qFbdWiG6
	 E9QBgoDrPHmccL0KEjH5vS8g1mNhulAq9XiputtCy9WXbcLjJwd5oDTlUNuRtvo75t
	 y5eVAcOgz9E7gCbiSDy3P6MfmVVtOoZ9JGmg3VoJ3eZAdjk2WGAc6qPzwmP5EtMi1K
	 9DJqvk15PwRDQ==
Message-ID: <sashiko-outbox-233966@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/9] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Update panel compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-crosshatch-panel-v4-8-120adc58e737@ixit.cz>
References: <20261125-crosshatch-panel-v4-0-120adc58e737@ixit.cz>
 <20261125-crosshatch-panel-v4-8-120adc58e737@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:20:10 +0000
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
- [High] arm64: dts: qcom: incompatible panel@0 compatible and
  reset-gpios change
--

commit fd433e980a7d2d9c4e491b9e6c72d47eb49cfd5c
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: sdm845-samsung-starqltechn: Update panel compatible

This commit replaces the panel@0 compatible string with
"samsung,s6e3ha8-amb577px01" and changes its reset-gpios polarity to
GPIO_ACTIVE_LOW on Samsung Galaxy S9 (starqltechn).

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/ar=
ch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index bd59f1dcd96dc..c156ed3733b4e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -267,13 +267,13 @@ &mdss_dsi0 {
>  	status =3D "okay";
> =20
>  	panel@0 {
> -		compatible =3D "samsung,s6e3ha8";
> +		compatible =3D "samsung,s6e3ha8-amb577px01";
>  		reg =3D <0>;
>  		vci-supply =3D <&s2dos05_ldo4>;
>  		vddr-supply =3D <&s2dos05_buck>;
>  		vdd3-supply =3D <&s2dos05_ldo1>;
>  		te-gpios =3D <&tlmm 10 GPIO_ACTIVE_HIGH>;
> -		reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_LOW>;
>  		pinctrl-0 =3D <&dsi_default &dsi_te>;
>  		pinctrl-1 =3D <&dsi_suspend &dsi_te>;
>  		pinctrl-names =3D "default", "suspend";

[Severity: High]
As reported by Krzysztof Kozlowski on v2 [1], does replacing the
"samsung,s6e3ha8" compatible string without a fallback and inverting
reset-gpios to GPIO_ACTIVE_LOW break DTB compatibility for existing
kernels and DTB consumers?

Any kernel or consumer that only matches "samsung,s6e3ha8" and expects
GPIO_ACTIVE_HIGH (established in 70005c18c9f7 ("arm64: dts: qcom:
sdm845-starqltechn: add graphics support")) will fail to bind or reset the
panel when booted with this DTB.  Earlier patches in this series already
handle the legacy "samsung,s6e3ha8" compatible and inverted reset polarity
in drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c via
broken_reset_polarity.

[1] https://lore.kernel.org/r/20260929-spirited-umber-hedgehog-300ebd@quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-crosshatch=
-panel-v4-0-120adc58e737@ixit.cz?part=3D8

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827322;
	b=eBPioVJ0hvRKjB5m0KZ6q7LqyO7mjfvqlzF7fKeRMSWCNWypv6d0Ry1LQ25jo1x3ouNq
	 9Z+uHoh/qVMoYQCbgsruueBptQC4xRWnmX6tin/CmTqpsb6hf2R3+VneevRN7ouY+d9hu
	 mDHtwnLjh4OBHo7l9zushnB4HFwiPbSQAi4/6N6D45+Tt9XwNtUbhueC727AluRLtpuTg
	 iHsiIx5WaCiG8T8iHvuMexiWxgAH5HOP0dsSfP0Wo98ZJonWaYoeRC1y+GtzuLbU9rtSt
	 JKGJpjf0G/krVUEmyuEK0r43/Ov+tHpDJvuJO5bUsuIgxZy1lAUZygNrEgrFqmzBnlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827322;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qcl2VfzFQW598bFcxz1SGRZa6cb74XzESInrA4aqkII=;
	b=U7UmxCQKS2YnuqK6AYMShkM37UnQz4khqWzUK24uqII2oWZA1wCEx48GRw7501mYyEYU
	 NPqoSlk8c8lFsMuh55Nb7NZB9HvMM9+ST1OdnE92Ode00XFID9KoRiOyaLR5tVlDa+Rbh
	 ZhLfZPvbD3qqRKPeiZOhrYOh9DleHBL/0bV2iv1/+WdVNNWw7b21wZDzhXcYL6upJZoBH
	 J//teYKoAsSQcM86H1Wvd50KrxIr6T+kt1gWyM1+Lk9N4vATeg4xBONLiwdhvKvFBd4WV
	 XCN8FrXv/q3iXZMpT8tJj2OEhlzZlClL0n2d2QArqHxTFa0Ea2k6KKUH3o4Qvan0uTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZmiVzt+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D791606C101
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZmiVzt+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF261F000C5;
	Mon, 16 Nov 2026 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794827322;
	bh=qcl2VfzFQW598bFcxz1SGRZa6cb74XzESInrA4aqkII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dZmiVzt+65XQ+yqFe5au6dsk+CDX7x+oXe0JPOSgQQP5txFD5lkVpdBsPCPixi7Eg
	 X/Sxbicf6uXqz5yhmhSlS7pZcxD5vplGKCJJ8Zdob0+3Dm5+I1z7GNyMbzX5tRm8xV
	 yaCt3chtXLiddAVXPTzb7FHEGaeaTlDYgXl/FvOKjbWQUAxRkRfB2CNKBKmJWr/zlq
	 hVQdR5OpNF32WHDXKaJJv2tHGefA8Li6kTE3ztQMg53l5frx1IvfzZ0WNZceUTand7
	 bQNp0pRU6CrzDnPsEca1RYJcKArwaOtcsjDVTnIsYSsBEEwhIQVnH65xY7581l8Bc3
	 2XMnn93rrWjuw==
Message-ID: <sashiko-outbox-216847@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Increase sdhi speeds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116104427.5152-2-wsa+renesas@sang-engineering.com>
References: <20261116104427.5152-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 11:08:41 +0000
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
- [High] arm64: dts: renesas: beacon: HS400 enabled on r8a774a1 without
  SDHI quirks
--

commit b89b68011d07b5d887c10ae098b7d13e972848a1
Author: Adam Ford <aford173@gmail.com>

arm64: dts: renesas: beacon: Increase sdhi speeds

This commit enables UHS SDR50/SDR104 modes on sdhi2 for WiFi and HS400
mode on sdhi3 for the eMMC in the shared Beacon Renesom SOM device tree.

> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/a=
rm64/boot/dts/renesas/beacon-renesom-som.dtsi
> index 8825131490420..8af2edaa690af 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi

[ ... ]

> @@ -317,6 +320,7 @@ &sdhi3 {
>  	vqmmc-supply =3D <&reg_1p8v>;
>  	bus-width =3D <8>;
>  	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
>  	no-sd;
>  	no-sdio;
>  	non-removable;

[Severity: High]
Does enabling mmc-hs400-1_8v here break eMMC HS400 transfers on
r8a774a1-beacon-rzg2m-kit with RZ/G2M ES1.3 or ES3.0?

beacon-renesom-som.dtsi is included by r8a774a1-beacon-rzg2m-kit.dts,
where sdhi3 has compatible "renesas,sdhi-r8a774a1",
"renesas,rcar-gen3-sdhi".  Unlike renesas,sdhi-r8a774b1 and
renesas,sdhi-r8a774e1, renesas_sdhi_internal_dmac_of_match[] has no
entry for renesas,sdhi-r8a774a1, so it falls back to
of_rcar_gen3_compatible with quirks set to NULL.  In sdhi_quirks_match[],
r8a774a1 only matches ES1.[012]:

drivers/mmc/host/renesas_sdhi_internal_dmac.c:
	{ .soc_id =3D "r8a774a1", .revision =3D "ES1.[012]", .data =3D &sdhi_quirk=
s_4tap_nohs400 },
	{ .soc_id =3D "r8a7795", .revision =3D "ES2.0", .data =3D &sdhi_quirks_4ta=
p },
	{ .soc_id =3D "r8a7796", .revision =3D "ES1.0", .data =3D &sdhi_quirks_4ta=
p_nohs400_one_rx },
	{ .soc_id =3D "r8a7796", .revision =3D "ES1.[12]", .data =3D &sdhi_quirks_=
4tap_nohs400 },
	{ .soc_id =3D "r8a7796", .revision =3D "ES1.*", .data =3D &sdhi_quirks_r8a=
7796_es13 },

On r8a774a1 ES1.3 or ES3.0, HS400 is therefore enabled with quirks =3D=3D N=
ULL,
which programs 8-tap clock and SCC settings in renesas_sdhi_clk_update()
instead of 4-tap and skips bad-tap avoidance, manual tap correction, and
HS400 calibration table lookup for the onboard eMMC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116104427.5152=
-2-wsa+renesas@sang-engineering.com?part=3D1

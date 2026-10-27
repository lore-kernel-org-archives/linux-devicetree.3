Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107366;
	b=z50P7PB/0l6KO/nLWhIJVK97IHy+awvM7iz3H3LYdPwix27duYPXu+eEepZrl9IWTyyB
	 QiMMmZqbN1j1eP0mHgru9C+fXlzo2fwZqO6opnwaNaF+Lr8lnGGLgpGZG32z3g7X3YEK9
	 b+Ww7x5FjjraT2S0vi38af2TK+D06QTogfpMprzjCPma69BpFoE1LNH7Z0Ttebe7b0vQd
	 ddxdAmlYAx8VwDZ/zZDaqH/fx6juVC0STc/yl+Bf2/QY5J+ATm8Is8HCWbbVfQrlGYDp8
	 /f5WkpTDM8hsdmb7XBrOUlLWmDzSCDBxUCWu1w1ubvbThPv4VDEzqZT3cpcGqH1/M9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107366;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eSz5n/Oh6ftFm/e7w1hQqoQpuE1MCeWqmFCTI5/SDWs=;
	b=tTI6d19Ubgvx7BpnePHQTAJ8IzrDy/9TUpUEC7RLQTohmlzRt98zXlmh3dkyN4sYmvCV
	 1dy0yGp0g+SUi1mqPklWL8pecHVhgNU4rIWarYvqJDLHyaDdmwlYv9u5dcKrb1u7WPKfq
	 Gfa+NfMqYtxsgVFO5N3iQ5jIS51sACqSZY+JkLoxV7Sg3ow/J8O4sBVeAwsyF7EBMJ+Pi
	 ooPj+Ng8s28/JagreMYieItgLRGDuaOa07hPaAre7a7JVcieCJ3/z9gT0IlKpgfODMRTZ
	 0VFIzeixlfK99pfjKOLHpHv4nGHFAWsOUviwN89tVF7X/e5wa61LZEJKEmY92QtGiOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HPK+/lgQ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DFD606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HPK+/lgQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA3B1F01828;
	Tue, 27 Oct 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793107365;
	bh=eSz5n/Oh6ftFm/e7w1hQqoQpuE1MCeWqmFCTI5/SDWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HPK+/lgQd6xxxqxWHg1rj1in7AsLhE6xxRsPFhq3NzUnJgPdBz6dnqQcwJlYGBeVG
	 hnCa2PkDOVGA5M7ivINuRPmq2zU5XIFPXHXnCEzTZRuIlEkgRJowo+WT0WKKOWjX9i
	 iOCh8GVzUULUFxxsFUtD4Owj0BosNXdlV32VzLY5j7MYkwQtWSkiX1JuR6OojVLBle
	 n7wZs7Hc6Y+oANs4Tm8eEKZjnnfFz4Lu+Y2v2zVQNUf8Zh0c459gqqaDls3rLkPjfP
	 DOqiIroyTdUH/3qaXPO4B2+8C7FGlXwV/4ntG5xWLzFlh9bcYONcygSlaHkCETikAt
	 lMq+HypdppLrg==
Message-ID: <sashiko-outbox-186616@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: cw2015: add cw2215, cw2217, and
 cw2218
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027131751.1724448-2-macroalpha82@gmail.com>
References: <20261027131751.1724448-1-macroalpha82@gmail.com>
 <20261027131751.1724448-2-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 13:22:44 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: power: cw2015: shunt-resistor-micro-ohms bounds off=
 by 1000x
--

commit 76be9d50cb26d818a5ec97865e1118988a432963
Author: Chris Morgan <macromorgan@hotmail.com>

dt-bindings: power: cw2015: add cw2215, cw2217, and cw2218

This commit adds device tree binding support for the Cellwise cw2215,
cw2217, and cw2218 battery fuel gauges to cw2015_battery.yaml, including
the shunt-resistor-micro-ohms property and an 80-byte battery profile
constraint.

> diff --git a/Documentation/devicetree/bindings/power/supply/cw2015_batter=
y.yaml b/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
> index f7bde324153d8..12d2d9a9cf6fd 100644
> --- a/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml

[ ... ]

> @@ -41,7 +40,14 @@ properties:
> =20
>    power-supplies:
>      minItems: 1
> -    maxItems: 8 # Should be enough
> +    maxItems: 8  # Should be enough
> +
> +  shunt-resistor-micro-ohms:
> +    description: |
> +      The value, in micro-ohms, of the shunt resistor used for sampling
> +      the battery current.
> +    minimum: 1000000
> +    maximum: 50000000

[Severity: Medium]
Are the minimum and maximum constraints on shunt-resistor-micro-ohms in
Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml off by a
factor of 1000?

Since 1 milliohm equals 1,000 micro-ohms, a typical fuel gauge shunt
resistor range of 1 milliohm to 50 milliohms corresponds to 1000 to 50000
micro-ohms (matching other fuel gauge bindings under
Documentation/devicetree/bindings/power/supply/ such as maxim,max17042.yaml,
richtek,rt9756.yaml, and st,stc3117.yaml).

Setting minimum to 1000000 and maximum to 50000000 specifies 1 ohm to 50
ohms (or nano-ohms), which causes dtbs_check and dt_binding_check to reject
valid micro-ohm values for cellwise,cw2215, cellwise,cw2217, and
cellwise,cw2218 nodes.

Should minimum and maximum be 1000 and 50000 instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027131751.1724=
448-1-macroalpha82@gmail.com?part=3D1

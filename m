Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300271;
	b=D9YcVJXCiInSFLcE/Y6/FkBDNgshlczvYY687tGv3vP3+Cl74uCy/lIrDltOymK8Zuwl
	 x3AzUxDoNUonjv5T/KGp8dkTK+eEpBasSTDAfw9GqDpiWD/fP4a9WyMc5OBX66z0ggI5G
	 nrSnjP5UpKFatcVzv5PEk4/SArqobqOWGecZQXbkRxMXbgsovOznoZFqsVlWw9V3niEi0
	 N1nkI4j3/GPN0pEQ+HWUD1zwPYTS+A6ZsueVBVCVBfspDMmkFUXlplCCvps36aFrwSGMq
	 WhtEvPrW6Ys5Y2ewnrjjju7hEpB1GrpR5nA7htfieCOuxbzXeif918jp7cC7z3fCCvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300271;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rbPdn0YrMxxlmH9N3lTidjl/ALf3adXZqpBDgh+Rw20=;
	b=MJrcWv9niIchJzy0ENvLkXDRqFJmmx5igkDS+xJ7ToLEixEUshCOl2H4sVOzKGgbnhh/
	 ZglhbAnwQgWfj86MXiDziSMKR3JI78rxykTa7P/lC0bvf32fbxQmmvu/ZoIYTBXwAk8HC
	 rN36WzcMi2RswSk8iad3JHuinImYGAPyZUaLzdojzZw3chfKdt2XRH36+poZl2yI63Asn
	 m15EBQV/f96W5Jyio5wh4Yp5GZhBkfsQTayBnTDfytXpAKAvgf0c4rvkgSuir2USo/sh/
	 j786xYjFF9skwtUNk59lgx3C2Gl/rVObKISRqfQdoh3tTKBeH+mwn/PEGw8WKcIywPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPToG8xX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754B606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPToG8xX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1114C1F0089F;
	Tue, 10 Nov 2026 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794300270;
	bh=rbPdn0YrMxxlmH9N3lTidjl/ALf3adXZqpBDgh+Rw20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hPToG8xXMbZXevxQ4RkYVWi8LZLVrHYHgD0cUj17dlgsJpQ1zT8XZr23YttEDcVAY
	 HVX3eK4FjN/QhLN44JRyFK69xka5+C26Soc24ERPRbN4IRMKrMXWLP+99eeKq+7RvC
	 0+TaXUAXh7OHb4cdTRXId583L7RuMktKJDYomeLjZ/cjAq6S0ZapkKHBP6bLjIe4OX
	 Ll/cRa9OGnulM5Yrb0oNaoZcKuUqXbQB98+IVpQbyNE0+rN8KXhL21rNzj66F/5ilc
	 TiNbAubyozM0mIMWzbFypPVag5dk8xyoug4ZBvD0xmIHqN2dojsiGd2FW/5XzoXJji
	 yQOmJDVFS4LQQ==
Message-ID: <sashiko-outbox-206658@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: lltc,ltc2497: Make vref-supply
 optional for LTC2305/LTC2309
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-ltc2497-vref-optional-v1-1-35c9657f3c0f@gmail.com>
References: <20261110-ltc2497-vref-optional-v1-1-35c9657f3c0f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 08:44:29 +0000
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
- [Medium] dt-bindings: iio: adc: lltc,ltc2497: vref-supply not required
  for lltc,ltc2493
--

commit 9ef21ec87b9693cbb7eb2ce20677fc640b5dbba6
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

dt-bindings: iio: adc: lltc,ltc2497: Make vref-supply optional for LTC2305/=
LTC2309

This commit removes vref-supply from the top-level required list in
lltc,ltc2497.yaml and adds a conditional requirement for lltc,ltc2497 and
lltc,ltc2499 so that LTC2305 and LTC2309 nodes can omit it when using
their internal reference.

> diff --git a/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml =
b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml
> index 4df5aadd1e1d7..22abc6885b5a2 100644
> --- a/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml
> @@ -47,14 +47,28 @@ properties:
>        - lltc,ltc2499
> =20
>    reg: true
> -  vref-supply: true
> +  vref-supply:
> +    description:
> +      Reference voltage supply. The LTC2305 and LTC2309 have an internal
> +      4.096V reference which is used when this property is absent.
>    "#io-channel-cells":
>      const: 1
> =20
>  required:
>    - compatible
>    - reg
> -  - vref-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - lltc,ltc2497
> +              - lltc,ltc2499
> +    then:
> +      required:
> +        - vref-supply

[Severity: Medium]
Should lltc,ltc2493 also be included in this enum?

This binding also covers lltc,ltc2493, which like the LTC2497 and LTC2499
has no internal voltage reference and relies on the external vref
regulator in ltc2497core_probe() and ltc2497core_read_raw().  Removing
vref-supply from the top-level required list without adding lltc,ltc2493
to the conditional makes vref-supply optional for LTC2493 nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-ltc2497-vr=
ef-optional-v1-1-35c9657f3c0f@gmail.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D499739891D
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785669755; cv=none; b=aZ3vnnkmHCEHgItcBHAoqi4ysbHNdI8xYQMMScJ25HKr2gaqMwp6ui9BigzfM1oGvV3UGx0CxE1qf56IGGIdXCcaLojPJ4prB+kxsCIqZDzlxpOUQWLTuKaLjXF1y0UIjo+tOED4NRQcJS5HfAUBgBJCHUf9j64bT32KAMAQzxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785669755; c=relaxed/simple;
	bh=yYzbmiFSg6m0gNGW0DRXq69otdCI1NVQgrgtl0wIOXo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GSE1dCHcRQZVeJae6QXNAxvhOIpOj6LlMTNim0DqTTVYyTUHwScoK/T9Ud5CaMOwuIzUY9kyTW/TWUJLVGEtPKSB48/4jvq5iCuRtuVHhiP5TrgGlUqHlLBFerxQTSK5wSOpqsF8ae6n26xqIfI1kCgGpTbi0/9vXvLlv57DVIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kq+Pe68c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kq+Pe68c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374711F00A3D;
	Sun,  2 Aug 2026 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785669753;
	bh=32kps7OxFkQQgpEaZ/4NIbNnhi7wqPHatkpgy6/FM+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kq+Pe68c9LCGpAZADx55Rm6DBiVRokLuLG6e7ZiOb/7ce8cnemqcZUSgepjBVtJis
	 oggBsjDfiU0yf7zlmdRZXBXtSGfpFw+wCWph5dlEqJV8Zh4LMBWdF//E75/qyUbzrQ
	 9JfvSXEIDGT3nW8FVA2XKUStiSs2MIowy3pUNV+RbmIJtgD0dbeWSuaQ4ymiu4UUSc
	 DIA/cVlayxRRjCjhwav4vGszgbkRO9X4L1LFX5jX82H6DVgMWdpkW4q0zku0eM5d5w
	 X1M1Inr+QLvh/nywecFTvCt9z/5C8tGerkZwFABMQyP2UR4NmVPpQxa3Kky2ndaJgc
	 G/3fwt/QXANBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/25] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-5-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-5-ac4410697cc2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 11:22:32 +0000
Message-Id: <20260802112233.374711F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `allOf` conditional block incorrectly uses `enum` instead of=
 `contains: enum` to match `compatible` strings, breaking schema validation=
 for MT8188 nodes that require `#reset-cells`.
--

--- Patch [5]: [PATCH v5 05/25] dt-bindings: clock: mediatek: regroup MT818=
8 dt-bindings into MT8186 ---
commit 504c0ed21eb6420741b43bf9c5aae33308e93b7b
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: regroup MT8188 dt-bindings into MT8186

This commit merges the MT8188 clock and system clock device tree bindings
into the existing MT8186 schema files. It aims to ease maintainability by
having common files for SoCs with similar clock controller designs.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml

[ ... ]

> @@ -42,11 +65,36 @@ properties:
>    '#clock-cells':
>      const: 1
> =20
> +  '#reset-cells':
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
>    - '#clock-cells'
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:

[Severity: Medium]
Does this compatible match logic need a "contains:" keyword?

Since the compatible property is evaluated as a string array, matching a li=
st
of scalar strings directly against it without "contains:" will always evalu=
ate
to false.

Without "contains:", does this mean the schema will skip the "then" branch
and incorrectly apply the "else" branch ('#reset-cells': false) to all MT81=
88
nodes, causing correct device trees to fail dtbs_check and allowing incompl=
ete
ones to pass?

> +            - mediatek,mt8188-camsys-rawa
> +            - mediatek,mt8188-camsys-rawb
> +            - mediatek,mt8188-camsys-yuva
> +            - mediatek,mt8188-camsys-yuvb
> +            - mediatek,mt8188-imgsys-wpe1
> +            - mediatek,mt8188-imgsys-wpe2
> +            - mediatek,mt8188-imgsys-wpe3
> +            - mediatek,mt8188-imgsys1-dip-nr
> +            - mediatek,mt8188-imgsys1-dip-top
> +            - mediatek,mt8188-ipesys
> +    then:
> +      required:
> +        - '#reset-cells'
> +    else:
> +      properties:
> +        '#reset-cells': false
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-mt8189-clo=
cks-system-base-v5-0-ac4410697cc2@collabora.com?part=3D5

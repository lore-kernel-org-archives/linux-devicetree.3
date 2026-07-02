Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9341B346FB3
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015566; cv=none; b=IKV0tMAPN/3MgZasc0K0hRvsvHtUvw9jyE08HBKOl572NeJP/VLX+4r2DpXDIQm1VLBvDbJXXnI05j8+ZgHQOYW3httDvvwwDHZfp8RJoOTDftESPjUrVQidblYTfXCwPm9EXlMD9nvY0lHAnyQ6OChnDYg7MUlMnscmJJPahA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015566; c=relaxed/simple;
	bh=HT10q5fJgKUMNXqN76EVpxpKgfEkOR4JDKG+bEvqtN8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fm/bxwfpGuOG+qHGm1+oQfJWxCTqG+ZPL5ApfV/8Jwd+tI8I0KjiGM9p0zSWSnitTws54kCrDP1AF0awTbscgRcEZDwPclqXpRVfXyss2cN7iZHC6qZHT8fDqEs5VHfejE59POpYhs84dsxOA1jBUejGpGG9sBP2Oqv5RciJpsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNnJhEf1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNnJhEf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F501F00A3A;
	Thu,  2 Jul 2026 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015565;
	bh=I7u/cxqIiMW72vnkXw+uBzYYIkdogT/9JMpgEfrR2Ec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oNnJhEf1/vO+eaowWC1Gh3HU6uaDcVnckhW4V4ysfvMqZCXaz/oaVxZREYZ93P8aU
	 9yBaergiGmuaOT/SSo/LSlh+HJhwhriPoEwATZ/6/JSV0FmAiIoxqLMkJ8JDDhqWRR
	 i81sMnxbsY0Wt0eQpuRHmt85bG6F4Iize9h243Z63lUJVE5SrCRmXhGrEQo1jUxrxO
	 +6LQuXWa7mjYMaA2oC81oHLZYrcsbhwxJypSrbHllte9ad8OA0zG7a2ttJhLp+XcPR
	 lScEY8W3PH136sCjeGZWiE8Smpq8JcrAu8m/HUWiqyU2gZCSV6fzdARbPz0krz34u1
	 wCtCnnafz5MKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/15] dt-bindings: clock: mediatek: Add MT8189 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-mt8189-clocks-system-base-v1-5-2b048feea50a@collabora.com>
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
 <20260701-mt8189-clocks-system-base-v1-5-2b048feea50a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 18:06:04 +0000
Message-Id: <20260702180605.30F501F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `else` clause meant to disallow `#reset-cells` contains a ty=
po, specifying `reset-cells: false` instead of `'#reset-cells': false`.
- [Medium] The conditional blocks for `#clock-cells` and `#reset-cells` inc=
orrectly use `enum:` instead of `contains: enum:` to match the `compatible`=
 property.
--

commit 0801644b64f2bb225fa62c5b58a27baad9d2d00e
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: Add MT8189 clocks
   =20
Add dt schema and IDs for the clocks of MediaTek MT8189 SoC.
The MT8189 clock IP provide clock control for main system
(apmixedsys, topcksys and vlpcksys) and subsys (eg. peri, scp,
ufs...).
   =20
Also, add compatible for frequency hopping and spread spectrum clock
functionality and reset controller header file for MT8189 UFS reset
controller support.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> index 84e602c7d3266..e30ed16f321d7 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
[ ... ]
> @@ -145,6 +158,19 @@ allOf:
>              - mediatek,mt8188-vencsys
>              - mediatek,mt8188-wpesys
>              - mediatek,mt8188-wpesys-vpp0
> +            - mediatek,mt8189-dbg-ao
> +            - mediatek,mt8189-dem
> +            - mediatek,mt8189-dvfsrc-top
> +            - mediatek,mt8189-iic-wrap-e
> +            - mediatek,mt8189-iic-wrap-en
> +            - mediatek,mt8189-iic-wrap-s
> +            - mediatek,mt8189-iic-wrap-ws
> +            - mediatek,mt8189-scp-clk
> +            - mediatek,mt8189-scp-i2c-clk
> +            - mediatek,mt8189-ufscfg-ao
> +            - mediatek,mt8189-ufscfg-pdn
> +            - mediatek,mt8189-vlpcfg
> +            - mediatek,mt8189-vlpcfg-ao
>      then:
>        required:
>          - '#clock-cells'

[Severity: Medium]
Does the if condition for this block incorrectly use enum: instead of
contains: enum: to match the compatible property?

Because the device tree compatible property is an array of strings, enum:
will attempt to match the entire array against a single string, which fails.
This causes the schema to silently skip enforcing the required #clock-cells
property for the listed compatibles, including the newly added mt8189 varia=
nts.

[ ... ]
> @@ -163,6 +189,8 @@ allOf:
>              - mediatek,mt8188-imgsys1-dip-nr
>              - mediatek,mt8188-imgsys1-dip-top
>              - mediatek,mt8188-ipesys
> +            - mediatek,mt8189-ufscfg-ao
> +            - mediatek,mt8189-ufscfg-pdn
>      then:
>        required:
>          - '#reset-cells'

[Severity: Medium]
This block has the same matching issue for #reset-cells. Should this also u=
se
contains: enum: instead of enum:?

Additionally, looking just below this block at the else clause:

    else:
      properties:
        reset-cells: false

Is there a typo in the property name here? It specifies reset-cells: false
instead of '#reset-cells': false.

This allows schema validation to pass even if device nodes incorrectly defi=
ne
#reset-cells when they are not reset providers, because the constraint
targets a non-existent property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-mt8189-clo=
cks-system-base-v1-0-2b048feea50a@collabora.com?part=3D5

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB836F8EC
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715936; cv=none; b=EuIiCIHwr2mTWnjTMS3jNK4OqqiYzsxSW8fd9xgDimXFs7w3JelxHfl8/wl8nhe/N/XAceuxtPUzhA3gLgbgVyRWV0IaXa2ek9Lr/GuN0aIc868XeZnX9dP2gHk7rVSTrckc95KSC42NnPhMSP/zaUpG+m+Er758jNBWeTvVets=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715936; c=relaxed/simple;
	bh=vOXbHV5gSZGoLiFp5y4OYtF7MDzkiR2P+MpkNBRN+84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JMuMos7uWsVAuG7IhTOUbISGnTNwx8LgpFE9qksQbjpnhoBQ9f/PICAsqZs9MyMMcANVzaCMVB7eCaqkyH9txfY2QIlqQTl1qiSdrmRo+9qIksMcwxoJ+e2pMRewqOsXDPMQCjG4OYo619p2WCwvXw1VhRVxlQCdM1qZuXMA+8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KISNos7r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KISNos7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8FFC19425;
	Wed, 13 May 2026 23:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778715935;
	bh=vOXbHV5gSZGoLiFp5y4OYtF7MDzkiR2P+MpkNBRN+84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KISNos7rnj6TOo/ouvwyj4rQ8QpghK5+DHsQ9+ZZYDY9gzY/5qrTMiS21oqBwVg6A
	 lfOvYsYWlJz0Pg+aBl+T2+sjiR3hQ9JTiFDh5rnkPK5bKgweHcX5Qo7UxYBHAmo2Ny
	 qOxxhH8l37QBNOhr/4vEEMrkPq1GdjTPeFBGLuZRmryfCLg3fF03Kj8pVNBZx7nPV2
	 p3fVgOxo8W+fuv+DHwdMWRwPVp65oImmILpN2Tc/HcgaxYyHrCYTHYc34toXPyqV/f
	 L6dIQMEOxJ1RgBGm0s6d1zD2RCZU5R7yr7TQZVnKVKRvMCvWBOSv+F5Ig4q5zY+qPY
	 qwiO8Lqer7Mpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/16] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260512182631.3842065-2-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-2-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 23:45:35 +0000
Message-Id: <20260513234535.9B8FFC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The binding omits provider cell properties (`#clock-cells` and `#s=
ound-dai-cells`) from the `required` list despite exposing these capabiliti=
es.
- [High] The schema allows and the example uses repeated strings (e.g., mul=
tiple `"tx"`) in the `dma-names` arrays, which breaks standard DMA API look=
up.
- [Medium] The `ssi` subnodes define `dmas: true` and `dma-names: true` whi=
ch bypasses all validation and contradicts the hardware's operational mode.
- [Low] The device tree example contains multiple unresolved phandle refere=
nces that will cause `dt_binding_check` to fail.
--

commit 2000fc3ecea1872cd8c0d174d7a5e3c5c89282e9
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound

Add a standalone device tree binding for the Renesas RZ/G3E (R9A09G047)
sound controller. The RZ/G3E sound IP is based on R-Car Sound but adds
extended DMA channel support, additional clock domains, and resets.

> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-so=
und.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.=
yaml
> new file mode 100644
> index 0000000000000..0b651214bd613
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
[ ... ]
> +  dvc:
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      "^dvc-[0-1]$":
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          dmas:
> +            maxItems: 5
> +          dma-names:
> +            maxItems: 5
> +            allOf:
> +              - items:
> +                  enum:
> +                    - tx

The commit message explicitly notes allowing multiple DMA entries with
repeated channel names in SSIU, SRC and DVC sub-nodes. However, will this
regression break the standard DMA API lookup?

The of_dma_request_slave_channel() function relies on
of_property_match_string() to resolve DMA channels by name, which strictly
returns the index of the first match.

If multiple entries use the same name, any DMA channels listed after the fi=
rst
tx or rx will be inaccessible. To support fallback or alternative
channels, shouldn't they have unique names like tx0 and tx1?

[ ... ]
> +  ssi:
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      "^ssi-[0-9]$":
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +          dmas: true
> +          dma-names: true

Does defining dmas and dma-names as true bypass schema validation for
these properties?

This seems inconsistent with the strict constraints applied to src and
dvc.

Additionally, the commit message states that SSI operates exclusively in BU=
SIF
mode, which usually implies DMA is handled by the SSIU, not the SSI directly
(as reflected by the omission of DMA properties in the ssi example nodes).
Should these properties be constrained or removed entirely from the ssi
subnodes?

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names

Should #clock-cells and #sound-dai-cells be included in this list?

The schema defines #clock-cells: const: 0 and #sound-dai-cells: const: 1
in the properties block, indicating the hardware acts as a clock and DAI
provider.

According to device tree binding guidelines, when a hardware binding suppor=
ts
provider capabilities, the corresponding cell-count properties must be
mandated in the required list to prevent incomplete device tree nodes from
passing schema validation.

[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    sound@13c00000 {
> +      #sound-dai-cells =3D <1>;
> +      #clock-cells =3D <0>;
> +      compatible =3D "renesas,r9a09g047-sound";
> +      reg =3D <0x13c00000 0x10000>,
> +            <0x13c20000 0x10000>,
> +            <0x13c30000 0x1000>,
> +            <0x13c31000 0x1f000>,
> +            <0x13c50000 0x10000>;
> +      reg-names =3D "scu", "adg", "ssiu", "ssi", "audmapp";
> +      clocks =3D <&cpg 245>,

Are there definitions for external labels like <&cpg 245>, <&dmac0>, and
<&codec_endpoint> in the example snippet?

When dt_binding_check compiles the example using dtc, unresolved phandle
references will cause syntax errors for referencing non-existent nodes or
labels.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512182631.3842=
065-1-john.madieu.xa@bp.renesas.com?part=3D1

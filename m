Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26AD3F58F5
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094509; cv=none; b=t1THA9FyK658o4TxT7YpRUiFuLx+9odNKMWOB5Bdg0VhqwfGSszYlNB0Lw98oUWA3OdCjQZZzsGn+6D9eD2LPB6eiBAHebd+eCj8z9hALqyms4QeJIjyh7EmXqtchtjaEkyxIV59iIyTtQK3PzbPMzZcV2AEInPZ3ehrkoTt0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094509; c=relaxed/simple;
	bh=8FvJRWc1U9fbfqj739WpLf6rhxtZpP7bCdoWK+gR5ZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kKHHRB9CWaHH6LQTRZz26rNBtfvFeI8k/8oYLmL/oayIbA+3eE9PDfcJ7jCnJiM5i1H05mGwIXnv8HH446FVkg9R5gtUROQZ9rOwpDW0x7UdRzIOnhmcUVuQUwiJMfzBxSPNwiLkTutg2PnQfmyG7i6i8uc924CmKe1/IzkIgWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIxttFkK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIxttFkK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1654D1F000FF;
	Sun,  4 Oct 2026 06:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791094508;
	bh=cMHv1DSwrYE38ODfg66ig51zHjsQh0Q5mbBSrfCIl0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CIxttFkKQx2Zuyq+WwWBwZbRHL0F57Ogv8xQvW/WguFP/+dTcvY3gx3ldYEsH9J71
	 ZlPKjKE0OpguGmdUWrJDNUrQwwXpzqoMvL3f4xMFdvNGoFR0pAd5UYWf7qFtoUI8ml
	 53k98BFSSa9iOc1KDwoKPnpu51YD4WL6BDVYdevGlq8DQ/V6QwEMw2U0x/HGjN9sLj
	 MCfbZy09pN5G4P4WaoLp7kpZJE12G/qPlsH8R82SejMBwRMfqS8xU+we57RAp1RdN4
	 RNN7wIFNS2FKM7tbKb9+/fiUBwLjEE1rp94pFYVA/QMJARfT7aDbC15qJMJb3dDPlO
	 XIHomAVsCG/Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple
 Silicon Mac audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 06:15:07 +0000
Message-Id: <20261004061508.1654D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] dt-bindings: conflicting additionalProperties alongside $ref
- [Low] dt-bindings: dynamic index-suffixed property names for TDM configs
- [Low] dt-bindings: missing #address-cells and #size-cells in required list
--

commit e0246be35f768471da65ec0d3bc4f036e14c8598
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>
ASoC: dt-bindings: Add binding for Apple Silicon Mac audio

This commit adds a binding for the primary audio subsystem found on Apple
Silicon Macs. It integrates the codecs and SoC I2S peripheral used for
driving the headset jack and speaker arrays.

> diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml =
b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> new file mode 100644
> index 0000000000000..c0a04fab82d31
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
[ ... ]
> +patternProperties:
> +  "^dai-link(@[0-9a-f]+)?$":
> +    description: |
> +      Node for each sound peripheral such as the speaker array, headphon=
es jack,
> +      or microphone.
> +    type: object
> +    $ref: tdm-slot.yaml#
> +
> +    additionalProperties: false

[Severity: Low]
Does the use of additionalProperties: false alongside a top-level $ref impo=
rt
block standard properties defined in the referenced schema from being valid=
ated?

In JSON Schema, additionalProperties only evaluates properties explicitly
defined in the local schema. If standard properties from tdm-slot.yaml were
intended to be allowed, they will be erroneously rejected, requiring
unevaluatedProperties: false instead.=20

If they were meant to be rejected, is the top-level $ref dead code that
should be removed?

[ ... ]
> +    patternProperties:
> +      "^dai-tdm-idle-mode-[0-9]$":
> +        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
> +
> +      "^dai-tdm-slot-tx-idle-mask-[0-9]$":
> +        $ref: /schemas/types.yaml#/definitions/uint32

[Severity: Low]
Does appending dynamic integer indices to property names fragment standard
Devicetree design and circumvent generic TDM parsing utilities?

Property names are typically static. Could configuration values intended
for multiple codecs on a single DAI link either be defined as an array
property or configured directly inside discrete child nodes representing
each codec context?

[ ... ]
> +    required:
> +      - reg
> +      - codec
> +      - cpu
> +
> +required:
> +  - compatible
> +  - model
> +
> +additionalProperties: false

[Severity: Low]
Because the dai-link child nodes unconditionally require a reg property, do
#address-cells and #size-cells need to be mandated in the required list?

Omitting them from the parent's required list allows an incomplete Device
Tree node to silently pass dt_binding_check schema validation while
remaining invalid per the core DT specification.

[ ... ]
> +examples:
> +  - |
> +    sound {
> +      compatible =3D "apple,j416-macaudio", "apple,j316-macaudio";
> +      model =3D "MacBook Pro J416";
> +
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      dai-link@0 {
> +        reg =3D <0>;
> +        link-name =3D "Speakers";
> +
> +        dai-tdm-idle-mode-0 =3D "zero";
> +        dai-tdm-idle-mode-3 =3D "zero";
> +        dai-tdm-slot-tx-idle-mask-0 =3D <0xf0f0f0>;
> +        dai-tdm-slot-tx-idle-mask-3 =3D <0x0f0f0f>;

[Severity: Low]
This isn't a functional bug, but the examples showcase the usage of
hardcoded suffix indices on property keys mentioned above. Should these be
refactored to use static arrays or discrete child nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-macaudio-v=
2-0-7b47ed6335a8@gmail.com?part=3D5

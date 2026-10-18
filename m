Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7E332EC8
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303626; cv=none; b=Xlh7/DDc+NNmRaX+jg60YxAXPZ+MZV5HfldPah0fdGP1eixKBSkU/SKcApyjXqu0vFSljV0x/RttX4uUmrCv3pwPkFEEcppVjokCjO0zFrMv+7rg22wAh+egCGqRcW27PtFqR9TlVBjBF1G2amOQKBVNrJECchk8cIqMALANylo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303626; c=relaxed/simple;
	bh=OcVByDrKS5SLQPJh3kmnTJ6Y0FKW34JY3fxp9jj70Uw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hna6vuS0dhM795l5fGMLVDjG5LNkGRtibF5jY2es9JVV9WjtIBlnvbb6O8TwbNzGjj/0wyxQUi6oKVy8jhSWP0N4/9z7hiwSos51HbAMpfJ1Zd/fEQRbgqQKW5f2uuof8lJWU7pejut7LLh/MD4D+x0zrNExoKtrYM1+O0kcXVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkA2CokB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkA2CokB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F841F000C4;
	Sun, 18 Oct 2026 06:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792303625;
	bh=dJP+Bw5kqYHvi5MQ5nwdhjJI8PdZmQc9pv2n7xqiC7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TkA2CokBM3YvSBW3OdbE0gppJHKesuPar/GhjlupScxCjpyI5aPHFmzEIhXF67F2T
	 oJvmpcQfTu4MztoukEeZsz572Lr1rwKjT+MS6zlnOAu6qG9ySm6m/yosNyG4GEMXEF
	 wqOHQHzAoGdxPro4xXFuNkvzswvVaNxnkySSl2DVPkO4p/oHsWaVXiSxL5pvafzuub
	 Qfm7zJqLmK/0Wc2YAzX2WqQr33rAqs5RbZB54HhF8IVzZJEP/YXYHP78YkLPYl+2Yc
	 +VFwL4nIk6FMDEpZaDVkFid0ZOW8kO9KDzKbIigz4z2N7QBxkTXP7L4ZFeyl7033PU
	 JN4wEkXbsYY6g==
Message-ID: <sashiko-outbox-175979@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/21] ASoC: dt-bindings: Add binding for Apple
 Silicon Mac audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018-macaudio-v3-3-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
 <20261018-macaudio-v3-3-abdff7741dea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 06:07:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ASoC: dt-bindings: apple,macaudio: additionalProperties blocks tdm-=
slot $ref
--

commit 212ef47e302889aa8e011388085ecf8d026993bf
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

ASoC: dt-bindings: Add binding for Apple Silicon Mac audio

This commit adds a devicetree binding for the primary audio subsystem on
Apple Silicon Macs, integrating the MCA I2S peripheral and codecs for
driving the headphone jack and speaker arrays.

> diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml =
b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> new file mode 100644
> index 0000000000000..af8e9686ba7bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> @@ -0,0 +1,212 @@

[ ... ]

> +patternProperties:
> +  "^dai-link(@[0-9a-f]+)?$":
> +    description: |
> +      Node for each sound peripheral such as the speaker array, headphon=
es jack,
> +      or microphone.
> +    type: object
> +    $ref: tdm-slot.yaml#
> +    additionalProperties: false

[Severity: Low]
Does setting additionalProperties: false alongside $ref: tdm-slot.yaml# in
the ^dai-link(@[0-9a-f]+)?$ schema block all properties defined in
tdm-slot.yaml?

In dtschema, additionalProperties: false only permits property names
matched by the immediate schema object's properties and patternProperties
keywords, ignoring properties defined in a sibling $ref unless they are
also listed locally:

Documentation/devicetree/bindings/writing-schema.rst:
  * additionalProperties: false
      Most common case, where no additional schema is referenced or if this
      binding allows subset of properties from other referenced schemas.

  * unevaluatedProperties: false
      Used when this binding references other schema whose all properties
      should be allowed.

Because none of the properties from tdm-slot.yaml (such as
dai-tdm-slot-num, dai-tdm-slot-width, dai-tdm-idle-mode, or the mask
properties) are listed in the local properties or patternProperties of
^dai-link(@[0-9a-f]+)?$, any dai-link subnode using standard tdm-slot.yaml
properties will fail dtbs_check validation.

Should this use unevaluatedProperties: false instead, or should the
node-level $ref: tdm-slot.yaml# be dropped if only the locally defined
^dai-tdm-idle-mode-[0-9]$ and ^dai-tdm-slot-tx-idle-mask-[0-9]$
patternProperties are intended?

[ ... ]

> +    patternProperties:
> +      "^dai-tdm-idle-mode-[0-9]$":
> +        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
> +
> +      "^dai-tdm-slot-tx-idle-mask-[0-9]$":
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Idle slot mask. A bit being set to 1 indicates
> +          that the corresponding TDM slot is inactive/idle.
> +
> +    required:
> +      - reg
> +      - codec
> +      - cpu

[ ... ]

>
> --=20
> 2.51.2
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-macaudio-v=
3-0-abdff7741dea@gmail.com?part=3D3

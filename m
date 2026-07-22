Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3977B2701B6
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784692336; cv=none; b=PnA4ROfCIRicKsbijMvido/4LDFFVlKzmLJc5ebXgK9C3U0N5mwZvDGalPX9Hz85KaQnX8KrlxSz4IMnAbcqbv/+yvwYtmsyWrXQH1IM4Ovk+OdZ9nxmNKIoE0wy0iSy7sCX3pmrEv1cgw3t3UDCqatSQmq3ha7nz3qFOEgvZno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784692336; c=relaxed/simple;
	bh=N0CPRPXWtIDReFhPDvIW0bn56EI5cFUMsu+KZXQ4P8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eULb05oU1Rt+5ie4Lnpxdx3VST6kepKQnwXZkKwsNXLDQCu/z6Gavqh0XLH16v2cLoGhW6ZtGlc4jANXjCWEJiBxryQ51pBYFafpE2q9qK+HGB/bzpvsbeUZMcxQ6ms9AhmXhd2wnLugEQNUes09hSw7zmUM9JBqnKHZvMo/8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSuALMl5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSuALMl5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEC51F00A3D;
	Wed, 22 Jul 2026 03:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784692331;
	bh=tw+4req4t+TZ2HriWYnESdHzAkCfEaiSVNhXWcwcets=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LSuALMl5T/wA8SyK3/3d9rq6frkNdXAeHNKBFuX0JnCHb/xGufRKXgkNhSWM7X3LY
	 aT7cvWyoKOlkA8kZoSSQvqw6etZOAU+01pl+8czbZACFSacJ1g2sptln/E6i/R8Ytm
	 ZLxU19po6HxxrfbTYRliF4BIkuDg4XRcL0v7GJT7Sh6ejo2UuVF5wMimbfBn2qj340
	 rOJPblxQAzOh/PGMvQXo11W7re2ppbkFtwKOdLDzGPB9ZMTVKf2TilAttuRWKJWHxH
	 /qFzphcbIlfg6pFOpbM98H/7Fx6MtxesQHuhXddjthU/briQbJuR1dIeuBt2P68PSo
	 Lf//iwbx4t8/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260722-upstream-it6625-it6626-v3-1-947e50f01764@ite.com.tw>
References: <20260722-upstream-it6625-it6626-v3-0-947e50f01764@ite.com.tw>
 <20260722-upstream-it6625-it6626-v3-1-947e50f01764@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 03:52:10 +0000
Message-Id: <20260722035211.6DEC51F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The HDMI input port (`port@2`) is omitted from the required port=
s list, allowing the bridge to be defined without an input data source.
- [Medium] The `bus-type` property is not marked as required for the CSI-2 =
endpoints, leaving the physical layer configuration ambiguous for the IT662=
6 variant.
- [Medium] Endpoint constraints are tied to the exact node name `endpoint` =
instead of using `patternProperties`, allowing constraints to be silently b=
ypassed if a device tree uses a numbered endpoint like `endpoint@0`.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDM=
I bridge binding ---
commit 32438c9fff6575c3de96c9e787f4769e322a6f28
Author: Hermes Wu <Hermes.wu@ite.com.tw>

dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge binding

Document the devicetree binding for the ITE IT6625/IT6626 HDMI to
MIPI CSI-2 bridge, supporting single or dual CSI-2 outputs.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml =
b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> new file mode 100644
> index 0000000000000..9bc5584b48880
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> @@ -0,0 +1,159 @@

[ ... ]

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 output port MIPI0
> +
> +        properties:
> +          endpoint:

[Severity: Medium]
Since the constraints are tied to the exact node name "endpoint", will
these restrictions be silently bypassed if a device tree uses a numbered
endpoint like "endpoint@0"? Using patternProperties for=20
"^endpoint(@[0-9a-f]+)?$" might be needed here to ensure the constraints
apply to all valid endpoint node names.

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +              clock-noncontinuous: true
> +              link-frequencies: true
> +
> +            required:
> +              - data-lanes

[Severity: Medium]
Does this allow device trees for the IT6626 variant to omit the bus-type
property? Without it being listed in the required array, the schema
could validate successfully while leaving the driver without the necessary
hardware information to unambiguously configure the physical layer.

[ ... ]

> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: HDMI connector input port
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +    required:
> +      - port@0

[Severity: Medium]
Is it intentional that the HDMI input port (port@2) is omitted from this
required list? This appears to allow a device tree to pass schema
validation without specifying the video input to the bridge, resulting
in an incomplete graph that will lack a data source at runtime.

> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ite,it6625
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint:

[Severity: Medium]
Will this allOf constraint fail to apply if the device tree uses a numbered
endpoint like "endpoint@0"? Similar to the local constraints above, looking
for the exact "endpoint" string allows numbered nodes to bypass the D-PHY
restriction for the IT6625 variant.

> +                  properties:
> +                    bus-type:
> +                      const: 4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-upstream-i=
t6625-it6626-v3-0-947e50f01764@ite.com.tw?part=3D1

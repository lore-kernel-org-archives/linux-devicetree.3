Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A51479885
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711575; cv=none; b=o68r/+hQuSdIM5ZOwycCZ2ZpSCAi0n1kDGomtl2GZmnzujm3utaCRhdtG2CRc7VLoo83PwQDeti9Ni//xv37e0N7ofiIXBCk0Tv9LLUcmKQrNX90KkHbzyTxzRVt35q5l1k+qqhUBC+vYxC6WZwxdl/o1AoEdRyFLOhEcs+7/c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711575; c=relaxed/simple;
	bh=JZom7G/z5+19ri/au/PONRU6kw+iHTnrtLKwZ/Llnbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jO0OYHAtVeKFW55KFwfyYxIRVXOrwwcsyVXrQHTA8vyGo5iJ24OjmiMT1EqW2neKsTlEhaX+PvI7+uBzHtkNSoPH56B03h5Uq5pVTXb4+PpVQssSYT6qgjSGf77UPC3MJHB3p4FDULDRw82byyedm74p6/cYhkmTYmX1DmKijyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrUnMoxY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrUnMoxY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738F11F00AC4;
	Wed, 22 Jul 2026 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784711573;
	bh=/zCR1YUFv5pYyspusQwvlayowErofH2+mlZ0SqlC7yw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WrUnMoxYaZO6wN46YrJ+BhWStXLywZ/DvKzU2WfSR9DdEhOXBOt2sHMwqerkmLuDm
	 /TCdlZKSDU6ciQIEsAcuwU7xPdkRv/QNm+bDd1uCTEbLf2L6vJtdS9lP5rdrMyJdEx
	 LioFg2emr0HTwleWuKXud6b/A8lao75KSZIzalIZx1e5sJ2Eb82oaC4bUiqMlPHQSj
	 edPiEGl6SLdrLX3+2ar9m2X71I/UybDfKRvST0Fzrz9x/ktwiyYIALOtgInJcoj5fe
	 22jGNFxJAkXibKpYIJDeypVdk0GNmjIEtB8DgAj29YHiD7Pv16TBg6Cifn8HDUAgX5
	 u7OgKuaL95abQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-upstream-it6625-it6626-v5-1-387e7584f2c9@ite.com.tw>
References: <20260722-upstream-it6625-it6626-v5-0-387e7584f2c9@ite.com.tw>
 <20260722-upstream-it6625-it6626-v5-1-387e7584f2c9@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 09:12:52 +0000
Message-Id: <20260722091253.738F11F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Endpoint constraints are defined under `properties: { endpoint: =
... }` instead of a regex matcher, allowing nodes with unit addresses (e.g.=
, `endpoint@0`) to silently bypass all validation.
--

--- Patch [1]: [PATCH v5 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDM=
I bridge binding ---
commit a192dc5aebea5ae00e69101d6df13fb9633bf4ce
Author: Hermes Wu <Hermes.wu@ite.com.tw>

dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge binding

Document the devicetree binding for the ITE IT6625/IT6626 HDMI to
MIPI CSI-2 bridge. The device exposes two graph ports: port@0
(MIPI0) and port@1 (MIPI1), the two selectable CSI-2 D-PHY/C-PHY
outputs. Only port@0 is required, since a board only needs to wire up
as many of the bridge's outputs as it actually uses.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml =
b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> new file mode 100644
> index 0000000000000..fed732e4428ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> @@ -0,0 +1,169 @@
[ ... ]
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 output port MIPI0
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#

[Severity: Medium]
Will this schema allow nodes with unit addresses like endpoint@0 to bypass
these validation constraints?

While the commit message notes that this is a convention already used by ot=
her
single-endpoint-per-port bindings, defining constraints under a literal
endpoint node instead of using a patternProperties matcher like
"^endpoint(@[0-9a-fA-F]+)?$" structurally bypasses schema validation.

An endpoint@0 node would silently avoid these data-lanes boundaries and the
bus-type requirements, which could allow misconfigured hardware setups to p=
ass
schema checks and result in silent driver misconfiguration at runtime.

> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
[ ... ]
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ite,it6626
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint:
> +                  required:
> +                    - bus-type

[Severity: Medium]
Does this bus-type constraint also suffer from the same bypass loophole?

Since it is strictly bound to the literal endpoint node name, an endpoint@0
node would also bypass this bus-type requirement introduced for the IT6626.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-upstream-i=
t6625-it6626-v5-0-387e7584f2c9@ite.com.tw?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A704CA27E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070923; cv=none; b=oHxFik6pQvBcxU3jk0jcq5BvDw407stUEza5TBvEeFEfFaxSxdbUznEHjErIDiXwn6V+CuHsCH3wYxo3AdoErshdGCCYsk79W63wQJJvfIiWdiPCIsAbdRtv4atqUPt5+I0Tc6Nj42pV6jyCoQ5Xt5qYAK78A+apc8Pso3FwegM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070923; c=relaxed/simple;
	bh=vNfUMHk/v5KE/5k4hEMTq4UMABbjpi7XGJu8TE37NzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uc2pJg5fT+TKn3OuFjnjmxUnq65Yh5JEGeF/gq5JKnCpOyXMt8on1+Dw5O7iIhR9LCrZwAhoJEzJGDc73oYJb2QzQWHSpiM3Kdf4MekdcHEhXkIdBM6o2peF6xVDNcIGCnDxMPnpI4cq6kYkH6zRHMYGw6XjD4hlVAivM7YxYBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VY0GXRBG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VY0GXRBG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193FC1F00893;
	Tue, 22 Sep 2026 09:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070922;
	bh=SEBAef8qZdzIQalWuebs2w3Gg9xfeYEFSlTYMymWJGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VY0GXRBGtB3niBOD26vNQSgjHByRjZVVymxuQ3Rhjfb9ap0gKJC1/DI9WpX+WoA9q
	 PGE2d8ycCHWZB/rx7zYQA6Zbo0HhaNDSt+eAZkfOaVoiCto/8jjMv9nRQHk6AuDonf
	 rH8le9btuVcL4scbYpBwtyMPKK3qZO7OwMLVVoqrtb71pghTBlgbQgmwrWbkeJRwiV
	 kwov2yzRcEYpKwhjJAPpy90WCTn1nqxjINi/NdVja6o0liuq4X9D9+5FPCG/KWfrg5
	 pHM7mbCNsYV56Wz7rEcKnQQL2DzuHtCDHd0YaqWl8i1q3H7rWkVEeBVoBa78quptdP
	 rda6v9VGQ5F3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/8] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922-add_shikra_support-v1-6-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-6-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:55:21 +0000
Message-Id: <20260922095522.193FC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: qcom,lpass-tx/va-macro: contradictory lpr clock sub=
stitution
--

commit 9ee86509828b9690a8234588233f08d334886d9b
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: dt-bindings: qcom: Add Hawi LPASS macro codecs

This commit documents compatibles for the RX, TX, and VA macro codecs found
in the Low Power Audio SubSystem of the Qualcomm Hawi SoC. It specifies
standalone compatibles with their own clock constraints for all three macro=
s.

> the RX macro uses the 'lpr' clock instead of the 'macro'
> clock, the TX macro is based on Bolero v4.0, and the VA macro takes an
> additional "heartbeatpulse" clock sourced from the LPASS VA CSR rate
> generator.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.=
yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
[ ... ]
> @@ -142,6 +143,24 @@ allOf:
>              - const: dcodec
>              - const: fsgen
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hawi-lpass-tx-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: mclk
> +            - const: lpr

[Severity: Medium]
The commit message states that only the RX macro uses the lpr clock instead
of the macro clock. Does the TX macro hardware also use the lpr clock, or
is this substitution an accidental copy from the RX macro block?

Since the TX driver still explicitly attempts to retrieve the macro clock v=
ia
devm_clk_get_optional, will this schema definition cause a regression by
contradicting driver expectations?

> +            - const: dcodec
> +            - const: fsgen
> +

[ ... ]

> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.=
yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
[ ... ]
> @@ -185,6 +186,24 @@ allOf:
>              - const: mclk
>              - const: npl
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hawi-lpass-va-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: mclk
> +            - const: lpr

[Severity: Medium]
Similarly, does the VA macro actually replace the macro clock with the lpr
clock here? The commit message implies this substitution is unique to the RX
macro, while the VA macro only adds the heartbeatpulse clock.

> +            - const: dcodec
> +            - const: heartbeatpulse
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-add_shikra=
_support-v1-0-6c6cb6444caf@oss.qualcomm.com?part=3D6

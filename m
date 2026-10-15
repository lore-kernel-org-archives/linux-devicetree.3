Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20CC499F23
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058671; cv=none; b=ooMbAyjKx2yK4jFQ+/NsCed64FgCo59OnyBD88ZrNnnroBzGpewmWANm3oF4/aanWIvocFEYJC9xE3EYjZXGOLKgCEMQtl78DC6EISoYLNNDGrJLNS6VZD3LLsN2+PzA4luTS7mn0nGsKcufQGrIR9jO7J09XoMGQswVdKRxQBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058671; c=relaxed/simple;
	bh=INvDfDUTS+M6a54dXfvstQUDS7hRA8+j1JZchHnCXIk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ZoMIgRG91uG0RTMMuB/hDgvQXspguvnRRRzGcbKF5YwDYGhQEoxhIQ7y9WwsqWIDw+DeL8iuqLeHrqmT/RCRl9uXNr7IUQ86M6pB4aBNIulm7WHKGDxsbj/EVjIIP2uozCiTlaQjVMQ+7+C+Czd7sM+86AFOdymhLdRysuQ3Q40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JigtQVFX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JigtQVFX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EC71F000C4;
	Thu, 15 Oct 2026 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792058669;
	bh=9wBXPiPpsM5S4pDhacY+LOYtxoybPRSvF4O1rUoMmq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JigtQVFXI6oHkI5XLlRg8ckwbmqwONSAf5cN+gItEecNdVNr/bXsBiEtyvgoO/W96
	 rDleTN1J7ahuS5Sjqj//TAK+vlcPg2sskLglBSh8ajo06iMCoa7pqA6Xyskx11e3oY
	 71svCeR5s1scXbK7u0qXniNpVIr62TvC6I9mfR3vHqbJvG2j54G7cXdARF/55SDRoe
	 dJJH3TuN2Cd2BYdw+l4EUMhUYassFH/xZR5kguiSD9OzySblcjTZd7fdVTsIxhSFK0
	 U4UFX1HLOOJ6FsDrE6KglCGYkBHvI6XHjDh9qLcNYt/kP3iCbcFybpBsM2sBAzeRaj
	 p3jFQIvADB2fg==
Message-ID: <sashiko-outbox-172624@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: display/msm: dp-controller:
 Document Kaanapali
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balaji Kalkonda" <balaji.kalkonda@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-kaanapali_dp-v2-1-c15cb83d9140@oss.qualcomm.com>
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
 <20261015-kaanapali_dp-v2-1-c15cb83d9140@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 10:04:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: qcom,kaanapali-dp omitted from existing conditional=
 blocks
- [Medium] dt-bindings: missing additionalProperties in patternProperties
--

commit 98068de5d2fca0abb41ef1fecd6b1707d8f24f5d
Author: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>

dt-bindings: display/msm: dp-controller: Document Kaanapali

This commit adds device tree binding documentation for the DisplayPort
controller on Qualcomm Kaanapali. It introduces a new compatible string
and adds constraints for its five register ranges and six clocks.

> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.=
yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 094a6383bb779..0240e3c1a6d9d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -19,6 +19,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,glymur-dp
> +          - qcom,kaanapali-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp

[Severity: Medium]
Does this inadvertently restrict Kaanapali from declaring an aux-bus?

Because qcom,kaanapali-dp is omitted from the existing aux-bus conditional
block, it falls into the else clause which forces aux-bus: false:

      if:
        properties:
          compatible:
            contains:
              enum:
                - qcom,glymur-dp
                - qcom,sa8775p-dp
                - qcom,x1e80100-dp
      then:
        $ref: /schemas/sound/dai-common.yaml#
        oneOf:
          - required:
              - aux-bus
          - required:
              - "#sound-dai-cells"
      else:
        $ref: /schemas/sound/dai-common.yaml#
        properties:
          aux-bus: false

This incorrectly restricts valid device trees that declare an aux-bus.

[ ... ]

> @@ -290,6 +291,24 @@ allOf:
>            minItems: 6
>            maxItems: 6
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,kaanapali-dp
> +    then:
> +      properties:
> +        reg:
> +          minItems: 5
> +          maxItems: 5
> +        clocks:
> +          minItems: 6
> +          maxItems: 6
> +        clock-names:
> +          minItems: 6
> +          maxItems: 6
> +

[Severity: Medium]
Could this conditional block be merged with the existing block that has
identical constraints?

The constraints specified here (5 reg items, 6 clocks) exactly match the
existing block for 2-stream MST platforms (qcom,sc8180x-dp, qcom,sdm845-dp,
qcom,sm8350-dp). Reusing the existing block would avoid duplicating schema
constraints.

> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali=
-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-m=
dss.yaml
> index 9f935defd6b12..83e3596ba0ed9 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.y=
aml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.y=
aml
> @@ -48,6 +48,12 @@ patternProperties:
>        compatible:
>          const: qcom,kaanapali-dpu
> =20
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,kaanapali-dp
> +

[Severity: Medium]
Does this object definition need additionalProperties: true or
unevaluatedProperties: false?

The dtschema meta-schema requires one of these properties for object nodes
to dictate how unlisted properties are handled. Without it, make
dt_binding_check reports a meta-schema validation error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-kaanapali_=
dp-v2-0-c15cb83d9140@oss.qualcomm.com?part=3D1

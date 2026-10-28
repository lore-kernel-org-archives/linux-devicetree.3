Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175544;
	b=GwxEj9PyKNQhZYlb4DZ5zG16VQI6Djiw8DpnKf9q8D3GaUcDIN/pDz9d0uuZgFzmkqCd
	 PXKRIkAu+iE9BDu1cEW6IQen/5FKbJDnEquYtrc2h04OB8lpGREIkP9gGtnjm5q6vs703
	 zaV6PB8RPfzYXoyKBElWzWtXhv1idZL7DeGSl5+HqP1CDfPOUspEaYZx8IhRlSpr7et91
	 sjAnXZ1kjBwrqqg50VTDExx5GxitvXA46JGomekovlHAGlU5Cs4pM1H0S/4LLQqFP2yiu
	 VDiXk432YN1XUqRhwhiqXAZdDqwqKgObDhL5NRvUAgtTmSpKuHnTUVu3nqiyiLbmFwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175544;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u1n0s7zVu3D342FFm0IGsjFAktAFFuU444tXzazWYqo=;
	b=VZh2D1uV6DyjG2N5a8NPjOh8Fzds5LkcAavJWPE2gYWZFCHybfKUblcSKD9uhoWfuoHr
	 1CFE4pW1kbBFuSwTbJN8Y3rtZGxia2s9RSHhzW8E67nms1e7XUmtllRhMBGVBL9YqsQHm
	 SzFZIK+QDvM7kHXcOWDpSTspmgbP4KnfLaEa6G6XQ2yls0tI4f7UvVIy7DN0Ju5KAAC72
	 BDRZnjgNVQt/a29iTaHNuM3r5+VQS+OWx7n/EIa60dkZ4IkjGn7MEsMhQeC4DxWFkCwtv
	 cmtehYLxLbOxMhyVDFbBKI6iXs4pYsUdTXX9T7l3zHI6WhLwouRelnkEvP/bj2lBQkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4mq9rQ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719BE606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4mq9rQ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3BF1F01825;
	Wed, 28 Oct 2026 08:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793175543;
	bh=u1n0s7zVu3D342FFm0IGsjFAktAFFuU444tXzazWYqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V4mq9rQ9cW7/ZBSB4CvDQp+Z+hM1mKIXXk9Kmzk5e7eFu9RznKJjRPz2MZam2AReS
	 PJaCxo3gUMHHZm4/nAM2RyTHpMP8ZS5kop3V0rG30WWpMkOHrMGTyh33e8c9mH4LIf
	 2l/aSZRFcueU/KLLvlGj6zEnt2kDDRghjJka17qNuLPEHKbEiPKomrNy/ybBW716Ht
	 tJzK8phXEEFcpUqCGtLZBRZJ534W8lTLaPzps9tmRE9J96ZaDeAWMJLAVm8s7zyXj2
	 QAQELQ10ljXVA2rjFDlU+E2Q0TwzG2XJJlH/iK8/p4tuktMoU3XOpdsxl5q7zIiEPu
	 4zCaeJkuQ1f2Q==
Message-ID: <sashiko-outbox-187610@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: qcom: Relax child node name
 pattern
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028081243.38562-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261028081243.38562-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:19:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: interconnect: qcom: unupdated child pattern in allO=
f blocks
--

commit f673587b21cccff8d6834d16d82048b29f591b52
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: interconnect: qcom: Relax child node name pattern

This commit relaxes the child node patternProperties regex in several
Qualcomm interconnect bindings so that single child nodes can be named
interconnect rather than requiring a suffix.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,shikra.y=
aml b/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
> index a0c26de94ccf7..456b56222866d 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
> @@ -31,9 +31,8 @@ properties:
>      minItems: 1
>      maxItems: 4
> =20
> -# Child node's properties
>  patternProperties:
> -  '^interconnect-[a-z0-9]+$':
> +  '^interconnect(-[a-z0-9\-]+)?$':
>      type: object
>      description:
>        The interconnect providers do not have a separate QoS register spa=
ce,
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.y=
aml b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
> index cdae0acf3a1da..0024fd29c0bc3 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
> @@ -31,9 +31,8 @@ properties:
>      minItems: 1
>      maxItems: 4
> =20
> -# Child node's properties
>  patternProperties:
> -  '^interconnect-[a-z0-9]+$':
> +  '^interconnect(-[a-z0-9\-]+)?$':
>      type: object
>      description:
>        The interconnect providers do not have a separate QoS register spa=
ce,

[Severity: Medium]
In both Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml and
Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml, the top-le=
vel
patternProperties entry is relaxed to '^interconnect(-[a-z0-9\-]+)?$', but =
the
allOf conditional blocks that disallow child interconnect nodes still use t=
he
old pattern:

Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml:
  - if:
      properties:
        compatible:
          const: qcom,shikra-mem-noc-core
    then:
      ...
      patternProperties:
        '^interconnect-[a-z0-9]+$': false
  ...
  - if:
      properties:
        compatible:
          const: qcom,shikra-config-noc
    then:
      ...
      patternProperties:
        '^interconnect-[a-z0-9]+$': false

Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml:
  - if:
      properties:
        compatible:
          const: qcom,sm6115-bimc
    then:
      ...
      patternProperties:
        '^interconnect-[a-z0-9]+$': false

  - if:
      properties:
        compatible:
          const: qcom,sm6115-cnoc
    then:
      ...
      patternProperties:
        '^interconnect-[a-z0-9]+$': false

Because a child node named interconnect (or with multiple hyphens) matches =
the
top-level patternProperties but not the pattern in the allOf blocks, won't
prohibited child nodes under qcom,shikra-mem-noc-core, qcom,shikra-config-n=
oc,
qcom,sm6115-bimc, and qcom,sm6115-cnoc silently pass schema validation? Sho=
uld
those allOf patternProperties entries also be updated to
'^interconnect(-[a-z0-9\-]+)?$': false?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028081243.3856=
2-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1

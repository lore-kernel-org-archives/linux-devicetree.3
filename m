Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD630677E
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493632; cv=none; b=VWvN2zpUZN8dmloTm66Eg0E3bNTUF7/YCrzPnX5R5Qq73C2DSmc3r1pXQphBImEdlzu2vs69Vt6cRyzR0Ot4VcHZ9dqZwkC6/QHJC+qWtJACaLCZd9VD5WvvIS7GjA1Apb27Gop5tP4b4NJuTPd08cNyXBiY21qT8HA6Bjzilhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493632; c=relaxed/simple;
	bh=L5DYClKodw4CfKVAdBP2EearXWSdEDHhxvv7whGfN6s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ChGMWWpsjjhjKJKjbOQEIF3KSDHBZ4NCqoiqpiFV4VseBlfGrMUQQsaqaXgWE0NER5Ywxb8ivL2zdZYz+rEGx8QBRVgxXn3dd7PfgnBfBpvXFfQmvcZPtcSUcex5auF3/CopqZQRJivpuwVLr+tdS/q/5McSb22I6azxarsqFxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k71CKX4F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k71CKX4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA271F00893;
	Wed,  3 Jun 2026 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780493631;
	bh=rf2E9prqrL8aqRMvl7nVjS6YDnGr6PghVVVhphnS4lA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k71CKX4FWp5Fr47ZRqNVsR7dFi3/eltyROPQqTjkI0GksY7PTj+aMuwCtCyEb1u8f
	 29UFIPP/iEzlbEffF6FnzeJZXG89gqsO/+17scEuRWySfeoBp7HGi3y3kiu/sSVvfu
	 Qu0tZ0zgeFiuzakTHyGjKoV28waH2pwLr8cCMyCnhqkOEQiBgE/k+l0gn52sh3c2je
	 bNxE3a08uF4zVrlWMjOTZjWc+pQI0UR24DEdueU05Bl33w4UuyU9YuCpk/zpsmXXam
	 0+Q/570UGY/y5HFNwhgeJXjnRxz5rRcsBZ+o6+x6v0bZxv3QL5xIsyHDwiczY0jDKQ
	 pem2nWzpNaSwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 phy-next 14/16] dt-bindings: phy: lynx-10g: initial
 document
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260603132059.503527-1-vladimir.oltean@nxp.com>
References: <20260603132059.503527-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 13:33:50 +0000
Message-Id: <20260603133350.9FA271F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `if` condition for enforcing the `big-endian` property incor=
rectly matches the `compatible` string array directly against an `enum`, wh=
ich will always evaluate to false and cause the requirement to silently fai=
l.
--

commit 8bd3982a89722b20a3686e42d4ab3b9f0711ae11
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

dt-bindings: phy: lynx-10g: initial document

This commit adds the schema for the 10G Lynx SerDes used on most QorIQ and
Layerscape SoCs. It defines the valid compatible strings, PHY cell requirem=
ents,
and enforces SoC-specific constraints such as lane counts and endianness.

> diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Do=
cumentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> new file mode 100644
> index 0000000000000..8cf6027a75b91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,ls1028a-serdes
> +              - fsl,ls1046a-serdes1
> +              - fsl,ls1046a-serdes2
> +              - fsl,ls1088a-serdes1
> +              - fsl,ls1088a-serdes2
> +    then:
> +      patternProperties:
> +        "^phy@[0-7]$":
> +          properties:
> +            reg:
> +              minimum: 0
> +              maximum: 3
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - fsl,ls1046a-serdes1
> +            - fsl,ls1046a-serdes2

[Severity: Medium]
Does this conditional correctly enforce the big-endian property?=20

Since the compatible property is a string array in device trees, evaluating=
 it
directly against an enum always returns false. Should this use "contains:"=
=20
with the enum, similar to the preceding if block, so dt_binding_check=20
correctly enforces the requirement?

> +    then:
> +      required:
> +        - big-endian
> +
> +additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603131914.5030=
53-1-vladimir.oltean@nxp.com?part=3D14

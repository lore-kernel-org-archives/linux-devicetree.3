Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F0947532F
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149206; cv=none; b=uEly5m9jJOiuusbbdSUzubQEToQHj8fGYdAg3+rta34TB+jV70ZTCVGR5HNTCloS1SP2vBQAISoziaJeDa6pGmzq2RRFkaQj/0KH5qK0af4iga0ZA52lwu/Yoz56gPwQ0Z+1SkA53wz/nJ/buzSgiwb5sAOma+aGFaqh5PlU4eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149206; c=relaxed/simple;
	bh=ZsU/1cRkOJkuFVttXzNouakfYbf6zrnutoGTz3gHRdE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mZEgqf1b4/INubau+y5MQjQ8qfKDfA17Azhk/OqP0z8yZqkJPYcv7PK6ue4WVgJPV9D0ENmLgM9WkliAs//bUSgmf9PkRKmz7mkuafSUDtXeWjFLGCfHBlRZYIz0KIl/Ipbjmg/ZTb08RP34iKUdW+ba/Qmr25ViEECTWWpe0cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSBlplva; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSBlplva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939621F000C4;
	Fri, 16 Oct 2026 11:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792149202;
	bh=6JgtvwVXZIQrEUidfgcSRIsPE/qTRxc32pXTGPBeow4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TSBlplvarq0GeHBAE+5RW9+wLR8U66G52pk0iBDvjNe3bzS+JzsAfU9yFpJ6hLhQr
	 941V6sMlVwv3yfSVZFss1zNH/h7dnZMY1BF5uVx1SMD5/4CaQtnzjEV3l1hOK+en16
	 dIxG9Q5ZZJ5XuppwuGlBitJahYNl9KDiM8MBiPC8rE7U0SDIJiVN/Z45oQ0nfWrB+c
	 qUBmKpjQFCLBxHJLmPsQUP5VqtUeutVHwie3DWDHhAaZSzBA4Mh3yk8I51zegNaKhD
	 LaCML5ER6JF97QGiYcEK6j/9kzzZNIU49NXP1SWQmSTf6Ik7ttBQyhjvLBlUBPU1BM
	 L+wkDxexatP7g==
Message-ID: <sashiko-outbox-174235@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 IPQ5210, IPQ5424 and IPQ9650
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-ice-v1-1-4098b1972f31@oss.qualcomm.com>
References: <20261016-ice-v1-1-4098b1972f31@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 11:13:22 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: compatible strings in enum list are not sorted alphabe=
tically
--

commit e22b78d683f92d3a3cc416d808b2c4da1c5e0341
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

dt-bindings: crypto: qcom,inline-crypto-engine: Add IPQ5210, IPQ5424 and IP=
Q9650

Document the Inline Crypto Engine compatibles for the Qualcomm IPQ5210,
IPQ5424 and IPQ9650 SoCs. Separate the power-domains requirement from the
two-clock requirement because these SoCs do not require power-domains. Pres=
erve
the existing requirements for other platforms.

> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-=
engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-e=
ngine.yaml
> index 23bf98c2b9fa0..e838694bb70a8 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.=
yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.=
yaml

[ ... ]

> @@ -89,6 +91,29 @@ allOf:
>          clock-names:
>            minItems: 2
> =20
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - qcom,ipq5424-inline-crypto-engine
> +                - qcom,ipq5210-inline-crypto-engine

[Severity: Low]
This isn't a bug, but should these compatible strings be kept in alphabetic=
al
order? It looks like qcom,ipq5424-inline-crypto-engine was placed before
qcom,ipq5210-inline-crypto-engine.

> +                - qcom,ipq9650-inline-crypto-engine
> +                - qcom,kaanapali-inline-crypto-engine
> +                - qcom,qcs8300-inline-crypto-engine

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-ice-v1-1-4=
098b1972f31@oss.qualcomm.com?part=3D1

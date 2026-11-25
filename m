Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587904;
	b=3NaFXtFmE8UzBlMnffRTtUcmaMlmTBxRDs/KqVo4AwKuCe8GLzuXslB1zvzmjytB7kLm
	 1u/2sQ21D7nERGS/cgcuYHUKs21atAAIjfPJTy8o/zonp2C4dPLBHesMl5HIwGokJ1+HW
	 bGKA5EC2IDVkTojmfvp/JRAX2C4VzkF/YqLA2ZaUI7ffRVY/qw6tJu7iZuPEhtLQPdEJE
	 rxACTj42MZ/bc6GfiW9ubqUcI876z5Sp0ak9yxyQqjWVlVFMjARGmzQ4TD1BXAnCK5Mtv
	 bL7XyP7mzx3WFkKLzGG5JvEZRvlWhWzd3vKSovH+G+lrGY4o+RlGPTa3xne/Q+F76bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587904;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZLutrWEqOYgEZKbwtiR2ix/r5rLk14VwCbkYybkEHiU=;
	b=iYBICuzV+lPTdebk+3bdypaupgWtdKHIzi6tzy/yT/AMITr9pQ+ofbkhB4NmRrkt3Yvr
	 yRYsCq8oG1SNDelrHrSCghNJEgOVkiMIkbAwKRQ8jB49zqmcr92+GCfTWztCjyyNFvOeq
	 xIf6C3KGrnnuTMwuWXNiXyVsXJhky2NJOTyQbmhzJEY7+1B2L+IKfE1Ww1pkd+TQqhLmD
	 KzU3FzDKPC34wkWcKM2Yy/3HBs5G+mT1p2Qdsdo1ow34hGZrBhGBKGIofjXkvbZ22RuAH
	 chtOTb4jOAwoUi0w74s/+QCCcIekXbeBvYI7UhKDTzvY5jj4twk6L5Oa7QU1GHcOs3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lYo49g/S";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC8606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lYo49g/S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3D81F000D1;
	Wed, 25 Nov 2026 06:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795587903;
	bh=ZLutrWEqOYgEZKbwtiR2ix/r5rLk14VwCbkYybkEHiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lYo49g/SXntD4wmBm0Tbz6Iwkx8ZWC1r2H5xGrlUDN9nZYFL2TKuYSU7M98Vu9aCf
	 VreLkNsbTIPNsNVYLCRzjd4BYDzmQ5BZQm1DbJOBXW+BsCIGxQDcFbURmvTBGJk7g8
	 9lNa90+gPxkokkfDf5qIrQXq/G4Z+Z7bmpTaKZ2Cdn9ejCLRobEGRubH6pXBxZHbsJ
	 BWV4VDnA1YfPldivECHYA9l2K+UNeLcrPzubIAXZBKgFtIevKa/P3CcrtA/UcIOPpy
	 yUJ44GtWo+xepS3ROFIULYOG21tQZHGlds3whXCFBn/GYRZAMLB6Hn8p889ZgNFTzR
	 pnw4fjGJlxT/A==
Message-ID: <sashiko-outbox-232686@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 11/15] dt-bindings: media: mediatek,jpeg: Add MT8196
 decoder SMMU configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125061618.2544386-12-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
 <20261125061618.2544386-12-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:25:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: media: split MT8196 decoder binding adds required
  property late
--

commit 8fc700b55092f5f90e77cee812b3c4702a9eab2b
Author: Kyrie Wu <kyrie.wu@mediatek.com>

dt-bindings: media: mediatek,jpeg: Add MT8196 decoder SMMU configuration

This commit documents the mediatek,smmu-config phandle property and
requires it for mediatek,mt8196-jpgdec-hw decoder child nodes.

> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpeg=
dec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.=
yaml
> index 28a9a9bfdbf88..b1dccc3c899c5 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> @@ -73,6 +73,22 @@ patternProperties:
>        power-domains:
>          maxItems: 1
> =20
> +      mediatek,smmu-config:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          Phandle to the MT8196 JPEG SMMU configuration syscon used to
> +          program this decoder's GUSER_ID fields.
> +
> +    allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: mediatek,mt8196-jpgdec-hw
> +        then:
> +          required:
> +            - mediatek,smmu-config

[Severity: Low]
As reported by Krzysztof Kozlowski on v18 [1], should mediatek,smmu-config
and its required constraint be folded into the earlier commit "media:
dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec compatible" rather
than introducing an incomplete mediatek,mt8196-jpgdec-hw binding and
immediately adding a required property to it in a follow-up patch?

[1] https://lore.kernel.org/r/20261012-determined-magenta-camel-ff2ca8@quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125061618.2544=
386-1-kyrie.wu@mediatek.com?part=3D11

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886765;
	b=iQRSv+a+weqVND/H4mK0svXXeBKHl0Hl3Y8USEyoxRdyBIJSr/Se3p4QXIQoEJnvXREm
	 PrPLIEXOLT7AXv7Toe4qGnpi6C6LbSw8lb53Ic2SBkOIgR6SFDNMqJsJENoJFF3cRD36W
	 u6wwRmL7TDkqpCEW7bVqvLxwUEP7dZIbDXcZFmLnEU0Ttr1ct/TVsuDFYnvyX1NkY4cvU
	 zX2OL66aLEWjkoBaIDcJEe/I16HCk4vZCuHhWMwjdVNiJCl0/b0KRseMZJkq92H9BXjgN
	 cWvGs2PoDPB/zvQb5OFups4qApEScPnS1ma7bRLDZ659gD6VWaF8hN4VztGUMWPLhbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886765;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0KvMpy3HkOU70jB7qTB+U6wOYnN1Q7Ynd+TJccwO0fE=;
	b=H4yQ5ydNIFjKea+XtLTuyiDCNnVhePfSmSZ9bp2t1i1zXHTEVaPZV/ckIhJdKp3wRFsg
	 qgWPP7tDDm67Qp57SKJ+mJjgBbxAwhJdU7SmpeP/dc0Y7a2yumm+O5S+n2VjAX8CdXnk2
	 7T5snc+yRAwBBuM96j/qGBH8LqH2VNLudp8VIGt4prI/9xScK8mygEj4wzMsK5OQjadtg
	 7hu1RJA5mHaTvSQ13pkYmWrEi3k1gfdDlU2+LZlldDBXjyD5UGK7ncLv4WJQKi4w470Im
	 CwRi2aAhVxSoVJ2UmmcLXpydAME3Clrre6YpMrtl9Cq+9asRAwdRGj9Yc852mC2UFCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jCDbrW47;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2F606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jCDbrW47
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D6E1F000C4;
	Tue, 17 Nov 2026 03:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794886765;
	bh=0KvMpy3HkOU70jB7qTB+U6wOYnN1Q7Ynd+TJccwO0fE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jCDbrW474XmBbICjwSKvVbu3Id3nRohEuO83jzo+kHckiAKGwiF1TaW59GxRylxF3
	 kRPCZ6FX7qRC1CatTykPP8KBtScepGdHFiXZhpfyBMCSeQZ42s2YhdYuVdqNOIuj/W
	 s9jBcw/f4v48/Z0l49HyjyT1WN+R94cy69XUqiIUafuslWgMvaYSHMeyDUbadHT9fE
	 9SFRvgiDO/mZ8P1ghCj/em15LXHh7SMw34EkybkQx/4a47n1rPcwyVRNNCyVi+1PYi
	 SaAIxSa9cH1MgH/AWkCVxICOF0ln773NK8X2QeX+UI2mTvxGK8z5+h4WTvYYBO7yzR
	 52DbvTg41jj+Q==
Message-ID: <sashiko-outbox-218146@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/14] media: dt-bindings:
 mediatek,vcodec-subdev-decoder: Add MT8196
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117032950.1425556-9-kyrie.wu@mediatek.com>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
 <20261117032950.1425556-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:39:24 +0000
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
- [Low] media: dt-bindings: unwieldy per-SoC conditionals and missing
  vcp: false
--

commit b84ac51492845b481ba538f65b5ea25cbc4c838d
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: dt-bindings: mediatek,vcodec-subdev-decoder: Add MT8196

This commit adds the mediatek,mt8196-vcodec-dec compatible string and
mediatek,vcp property to the MediaTek video decoder subdev binding, while
moving the mediatek,scp requirement to existing SoCs.

> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-s=
ubdev-decoder.yaml
> index d1d209cbbd43a..c06d8a8a607d0 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml

[ ... ]

> @@ -179,6 +184,51 @@ then:
>      - interrupts
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8196-vcodec-dec
> +
> +    then:
> +      required:
> +        - mediatek,vcp
> +
> +      properties:
> +        mediatek,scp: false
> +
> +      patternProperties:
> +        '^video-codec@[0-9a-f]+$':
> +          properties:
> +            compatible:
> +              enum:
> +                - mediatek,mtk-vcodec-core
> +                - mediatek,mtk-vcodec-lat
> +
> +            clocks:
> +              maxItems: 4
> +
> +            clock-names:
> +              items:
> +                - const: sel
> +                - const: vdec
> +                - const: lat
> +                - const: top
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8192-vcodec-dec
> +              - mediatek,mt8186-vcodec-dec
> +              - mediatek,mt8188-vcodec-dec
> +              - mediatek,mt8195-vcodec-dec
> +
> +    then:
> +      required:
> +        - mediatek,scp

[Severity: Low]
Should this binding be split into separate schema documents instead of addi=
ng
more per-compatible if-then blocks to allOf?  MT8196 diverges in both its
firmware processor (VCP vs SCP) and its video-codec child node constraints =
on
top of the existing single-hardware and multi-hardware SoC variants, which
makes the conditionals in this single schema unwieldy and duplicates the
four-item clock-names list from mediatek,mt8195-vcodec-dec.

Also, if kept in a shared schema, the SCP-based compatible branch does not =
set
mediatek,vcp: false, which leaves mediatek,vcp allowed on those SoCs during
dtbs_check.  Finally, the SoC architecture list in the top-level description
is not updated to mention MT8196.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117032950.1425=
556-1-kyrie.wu@mediatek.com?part=3D8

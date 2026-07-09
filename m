Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED6A38F254
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 03:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783568100; cv=none; b=XfBP4Hp9/9BJEKHNb924SKNu2tM5ulLF0pryHxMXJXNGrirA496RoR7VeuvORQtZZ1IQGd0+NbJ+cmtDRaQFoG1I+XGLUcSEsDxWDpZGmbXTa6eEfr7ZR0ovVPTVfnTN6OnC1mv7rL0ky/gJlQWMCdukm3TR+N+7ksQ+jb4tQ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783568100; c=relaxed/simple;
	bh=JsTdgXGsPPOwGdaGR/MIZoi0Y1QDt9AB7YHiVYlB0lY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X4rAebCpQz1GzexUigs9mLGI2AmKqMR6aNpnW1NXrhHp1/GfIYt7g5/nHdehUlnI5/nox5bfiQ1Sr0d0aIvMm97VNcUynubPU3hK50GV5Mnyronr52/cFX/39tB00kKhI/uAkIU8DgC7MwtXcrupBGdZaZIw60r3CZQJ+HEGxjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7mk3x4i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7mk3x4i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308191F00A3D;
	Thu,  9 Jul 2026 03:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783568098;
	bh=quywxEPNDqKpbveSHZAD3ufARmqxn5KDw7lzmFDmZec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n7mk3x4i+UduIDkudJ912W3AbjjsXXnOe4vn3BxacJ7MBxd83sArau4vKVG4j2DwD
	 KwObcQPVniBVr+BU/LllIdr57ZLaKAyZQ9XcVtBkBppSMoMFwPtxMEO5aoEhX6LLxc
	 Fj0B5lh8QmG0rALHV4HKeQbktjcrEoAGd4kyTawjN3AltDOxqaFA2ikT4Mol18JvMb
	 r0wELJleDppkynLMSMks5DqA8hxRTOa6Ng47jyWoOhGuAzxAYCCWuQL07qgey6ocAv
	 IAlhP/rc0ykzbpaUmAkRp3uF7GgXLL4iVp4/Ve1NchGtgN5M4T56Ns3DRPScckiW5P
	 06gfWK2kotviw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jianhua Lin" <jianhua.lin@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709032657.25730-2-jianhua.lin@mediatek.com>
References: <20260709032657.25730-1-jianhua.lin@mediatek.com>
 <20260709032657.25730-2-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 03:34:57 +0000
Message-Id: <20260709033458.308191F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit introduces a new mandatory property `mediatek,larb` f=
or the MT8189 JPEG decoder, but this addition is completely undocumented in=
 the commit message.
--

--- Patch [1]: [PATCH v9 1/3] dt-bindings: media: mediatek-jpeg-decoder: ad=
d MT8189 compatible string ---
commit e0e1e554d3c1d037a7084628a317111dade87379
Author: Jianhua Lin <jianhua.lin@mediatek.com>

dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible string

This commit adds the compatible string for the JPEG decoder found in the
MediaTek MT8189 SoC. It updates the schema to enforce a single clock
requirement for the new SoC while maintaining the two-clock requirement for
older SoCs.

> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decode=
r.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189b..13fb4fb61f2bc 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
[ ... ]
> @@ -51,6 +54,15 @@ properties:
>        Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for de=
tails.
>        Ports are according to the HW.
> =20
> +  mediatek,larb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle to the local arbiter (SMI LARB) node. This explicitly
> +      describes the hardware topology where the JPEG block is connected
> +      to a dedicated SMI LARB for memory bandwidth arbitration. It is
> +      required to accurately represent the hardware connection independe=
ntly
> +      of the IOMMU.
> +

[Severity: Medium]
The schema introduces mediatek,larb as a new property, but this addition
is completely undocumented in the commit message.

The commit message explicitly details the 34-bit IOVA address space and the
single clock requirement, but fails to mention this local arbiter phandle.

Could the commit message be updated to explain this hardware topology change
and why it is mandatory for the MT8189?

>  required:
>    - compatible
>    - reg
[ ... ]
> +      required:
> +        - mediatek,larb
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +
>  additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709032657.2573=
0-1-jianhua.lin@mediatek.com?part=3D1

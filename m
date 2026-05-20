Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7AA3DB301
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278320; cv=none; b=MOEQF3Z5FM08SX6ETY+Bd+u06Bh4Za5EBvs0ZHhxBdHURrz5ReKV11kwlBQ9QCC7H8zPBGsLR9IfZsg8zjjWGMHiDpsnLxb4sEiAefMv1Z5VnPtZ9OD5F7myiCEyTRaYEDEFuusumdddHoNyIQNwwyg1dV0Ut+Y2vEesuVULSgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278320; c=relaxed/simple;
	bh=C3nxSmLrT8gQnjNOSF/HjLkJBP9pQJs4U3liGs5siyA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mj7Wg+kt72WxXPkFKRpPOG/UPLyW58qBROg7Zb7Yl7TIiHZnfNEh4jxLTHFE+J3OiZZvdotX8ObkqiA+URBQldQLyiUyAlhDC4eWzEc3LvAiTm9cSdEyDdgDvSYO4XeBX6h8SS3euVybH2ug7BZTeXmOy1WNWHzR4A/Q/vZIluA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGIcjAEs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGIcjAEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572151F00893;
	Wed, 20 May 2026 11:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278319;
	bh=xBeWf0WJ0I2jQnhxZDOiT1XnnXBqUunKAsYAInHFV54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TGIcjAEs8xIEp5GnXTbYOnnrQ+i0A2D2IJpJ5p3vq6EM3vui8WY+Akgm/J5wUNtBl
	 73ahlH63uVMcCJsW/xB6M6K2NbrFUNXycwkbuUmMCsPUXnJN9YQMJfq7HA0djn++YL
	 NGa3Xg1oHi83lewma92u70/fuqPdmHcWxcVDxkovIfhYmf01zGaV9aMLbQuZ+s4P5V
	 DM1B14DAdIMfWDdOfUv8do5JhvnqTGVoX2I7lXrF08Mpeejs3CBcTXFOZOERR28mKU
	 F9nIlVl+hwqhLJKk9yFWP44LfZSdHu+Ggh+qMWBe8QCXfPGPSYOMHb5vqqOEouLM8U
	 l6EY5QBuwxqTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple
 memory regions for MT8188
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnab Layek" <arnab.layek@mediatek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520112629.3420612-2-arnab.layek@mediatek.com>
References: <20260520112629.3420612-2-arnab.layek@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 11:58:37 +0000
Message-Id: <20260520115838.572151F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The dt-bindings are updated to allow MT8188 to provide L1TCM via=
 a second `memory-region`, but the `mtk_scp` driver does not support parsin=
g L1TCM from `memory-region`.
--

commit a5d9a931f3a31fccb0fec319f48f7f29be5209e8
Author: Arnab Layek <arnab.layek@mediatek.com>

dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188

This commit updates the MT8188 SCP binding to allow an optional second
memory region for Level 1 Tightly Coupled Memory. The base schema is
updated to allow up to two memory regions, keeping other devices
restricted to one region for backward compatibility.

> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/=
Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index bdbb12118da43..fca9b0675eae4 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml

[ ... ]

> @@ -205,6 +207,45 @@ allOf:

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-scp
> +            - mediatek,mt8188-scp-dual
> +    then:
> +      properties:
> +        memory-region:
> +          minItems: 1
> +          items:
> +            - description: Main SCP SRAM memory region
> +            - description: Optional SCP L1TCM memory region

[Severity: Medium]
Are there regressions when the L1TCM region is specified as a memory-region
instead of a reg property?

Looking at the mtk_scp driver implementation, it appears to fetch L1TCM
exclusively by looking up an IORESOURCE_MEM resource named l1tcm, which
corresponds to the reg property rather than memory-region:

drivers/remoteproc/mtk_scp.c:scp_probe() {
    ...
    res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
    if (res) {
        scp->l1tcm_base =3D devm_ioremap_resource(dev, res);
    ...
}

Since of_reserved_mem_device_init() typically only maps the first memory
region, and the driver checks the reg properties for l1tcm, could this
cause a regression where the second memory-region is silently ignored at
runtime, leaving the L1TCM performance optimizations non-functional?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520112629.3420=
612-2-arnab.layek@mediatek.com?part=3D1

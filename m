Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D72146A5EC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389037; cv=none; b=rci3N7VJjmwDu5x7CJ6rD/UPpU1FxrRZiBBBLr56jHXs3yToIdbPJSCP14WDwAdK5cEB2MkOcvdfvnnh/J6heYeWQxi76PjFOQ+A0q5PQZ08H4/CWMpi9jcjFGq+bL6t45mBvoBFu7XgJTlH3nb9T/PpfW5SNVA8eiEYRH0L3Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389037; c=relaxed/simple;
	bh=7JFvn5GU4MjmnXsyHzRODkaK2ksydrkc4QURlcwt6r0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XIEPjsY/9pm9b7WfTmaqsk8mplSPHVX2qivZK+/eaihmlMjRG70kbfKbWnzk0/DLeQs8x6ArcNu7x7mxGBnKb3eFzXs+qj3BudprD060LwdCf4c1Z6hB3n+SsLfAogetw/MDCG+Mpr0DyYv1MucncfIToolY9Dv0ld1nIPR8WhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEZatLOx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEZatLOx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92E31F000FF;
	Mon, 14 Sep 2026 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789389035;
	bh=rwfAmLd7boBvEkFrQt90upTAJ9GPxD3nZrCwq2t5CUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IEZatLOxijxhmmEtfQRDM+AKhyfy4nMdctaxOFaC7J5fjHrryzTDn/DKa62E0MHBl
	 3K4kK7yCrW8mcIwQWymJTMUgdabh1nw9E+WBvCLdYrflaEc+d8SYX0UWfH2CDQjw58
	 AC09jviATfasu232rTgG8gGzGSUSIbiPYo9eSApvONSRusSkPLKP8s81WADTd2dYsv
	 kNcxp4wNgrU+bej52d50btrJQdWBEahVbVncAtXTEAz8Drhf3wO8/ebJ5wi6SI/bKo
	 1Vf74g5DZM6lHPrMdnolS2auAHoUDKqOgiWib5FfLNZ1Y3T1PS4vSunWBWhOY8XGF1
	 6/B3PCUbigS1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/13] dt-bindings: display: mediatek: wdma: Add
 compatibles for more SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260914115812.22751-13-angelogioacchino.delregno@collabora.com>
References: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
 <20260914115812.22751-13-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 12:30:34 +0000
Message-Id: <20260914123034.E92E31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The compatible strings for MT8186, MT8192, and MT8195 incorrectly =
fall back to `mediatek,mt8173-disp-wdma`, forcing 32-bit DMA limitations on=
 34-bit capable hardware and causing DMA address truncation.
--

commit 7d14f8135e7ea9f9404cdd835d6b860fc5b97644
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs

This commit adds compatible strings for the Write DMA hardware in several
MediaTek SoCs. It specifically notes that MT6893 is not compatible with
MT8173 because it supports destination addresses larger than 32 bits.

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdm=
a.yaml
> index 97d052b0fb614..c3ed867d058d9 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> @@ -22,11 +22,16 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - mediatek,mt6893-disp-wdma
>            - mediatek,mt8173-disp-wdma
>        - items:
>            - enum:
>                - mediatek,mt6795-disp-wdma
>                - mediatek,mt8167-disp-wdma
> +              - mediatek,mt8183-disp-wdma
> +              - mediatek,mt8186-disp-wdma
> +              - mediatek,mt8192-disp-wdma
> +              - mediatek,mt8195-disp-wdma
>            - const: mediatek,mt8173-disp-wdma

[Severity: High]
Does declaring MT8186, MT8192, and MT8195 as compatible with MT8173 cause D=
MA
address truncation on these SoCs?

The commit message notes that MT6893 is not compatible with MT8173 because =
it
has support for destination addresses larger than 32 bits. However, the IOM=
MU
driver for MT8186, MT8192, and MT8195 enables IOVA_34_EN for their multimed=
ia
domains, which sets the DMA mask to 34 bits.

By declaring a fallback to mediatek,mt8173-disp-wdma in the device tree, the
OS binds the device using mt8173_wdma_driver_data, which initializes
reg_wdma_dst_addr0_msb to 0.

This causes mtk_wdma_ddp_write_dst_addr() to silently truncate the 34-bit I=
OVA
by dropping the upper 32 bits, leading to the WDMA hardware writing to the
wrong memory address when buffers are mapped above the 4GB boundary.

Should these SoCs be grouped without the mediatek,mt8173-disp-wdma fallback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914115812.2275=
1-1-angelogioacchino.delregno@collabora.com?part=3D12

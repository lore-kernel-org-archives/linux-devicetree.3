Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A67265629
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119267; cv=none; b=BmH/DdEKms807iW26bTMizZL9l2JxCwi6MKxnQkfmkqe5kX1N7fcKAwnBQcoOuzMZOWAqAma3Avget2ghiLf5xr1VlJDM5hg2CsL+BVsP3CbwbkRjrejZ94dCWY8nLXIS+3e7+RNzM9NBFmk3ZzEG/2g4HdyyiGTwcvhRgYo/ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119267; c=relaxed/simple;
	bh=krgxCAoGRTsJuJZ8/qQA018UUORSjHp2Zp2/y+R4RNM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bARSMV/cecr7m91s4oRbiVhoixEa5kzfmpCLGAWain3cIKMXtHaDWKj1a9XdZlGG8jjhxRoqp/VanF8u9tMx1Fgr9BwaalTfPE4GNZRVKizC1HtRIyXLRSTY2MJQ0qXGKlZ1wzwgzUb3Fkgsz0hNcFqAOmJlSzyRVSP/yMh9Pq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffNfKUQ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffNfKUQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473F61F000FF;
	Fri, 11 Sep 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789119266;
	bh=QaZTnf6YfwlbUR84pgsrQFAvFe0C1Qvr22KQZulgZNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ffNfKUQ8E6PXiDnx7orZWjFtWU9WAC2K+BMDp9N4MkURHrmX+beF/mB/ko6hgY70h
	 wfO7pxQkT8E/NVDml6J797O0GFewpgLyoW7SqwHY5zTVWI64/qvV93iQMvE8yQVxgh
	 9AwjFxGF4DyMI0Co1tu70zjNDByZmMCBBWUagU+3RKKRr3+anRKOiR8VYzk61+bIlV
	 AqiczVJbbNcfdyqVDoYerfM+irPjvORBRa9XznXEWCFg9imP8OmXt69A6MIa2nrLeQ
	 RbIwJt2TuBWXco7z0vBXSckc1TpKlflzDCCpVtr8OywUg8OanYWnj6N3nZFmEFf+XB
	 0wanK6FwZ4GYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/10] ASoC: qcom: Add QAIF hardware register map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-b4-qaif-shikra-audio-v6-3-e9addb358201@oss.qualcomm.com>
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-3-e9addb358201@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 09:34:25 +0000
Message-Id: <20260911093426.473F61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Incorrect register offset for QAIF_EE_CODEC_WRDMA_MAP_REG due to=
 likely hex addition error.
- [Low] Missing '_REG' suffix on ERR_RSP_IRQ_RAW_STAT macros.
- [Low] Misleading parameter name `i` in IRQ register macros creates an API=
 trap.
--

commit 408d3c905e0252b19f0ed0b72abd0544e15097a3
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF hardware register map

Add qaif-reg.h to define the MMIO register offsets for the Qualcomm Audio
Interface (QAIF) hardware block. This driver needs a common register map
to program the core registers, audio interfaces, DMA channels, interrupts,=
=20
and SID maps based on the DAI ID.

> diff --git a/sound/soc/qcom/qaif-reg.h b/sound/soc/qcom/qaif-reg.h
> new file mode 100644
> index 0000000000000..84a9c0285289e
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-reg.h

[ ... ]

> +#define QAIF_EE_RDDMA_MAP_REG(v)			(0x1920 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_WRDMA_MAP_REG(v)			(0x1940 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_INTF_MAP_REG(v)				(0x1960 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_RDDMA_MAP_REG(v)			(0x1980 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_WRDMA_MAP_REG(v)			(0x1A00 + (0x1000 * ((v)->ee)))

[Severity: Medium]
Is this offset correct? The previous registers in this block use a stride of
0x20, which would make the next offset 0x19A0. If this is a hexadecimal
addition error (mixing up 0x80 + 0x20 =3D 0xA0 with decimal 80 + 20 =3D 100=
 ->
0x100), writing to 0x1A00 could silently fail to map codec capture channels
and potentially corrupt unrelated hardware state during device probe.

[ ... ]

> +/* RDDMA Period Interrupts */
> +#define QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(v=
, i, 0x00)

[Severity: Low]
Does the parameter name i create a potential API trap here? In this macro,
i is passed as the dma_type parameter to qaif_rddma_irq_reg_addr(). Using
i typically implies a channel index, which might lead future developers to
accidentally pass a DMA channel index instead of the expected qaif_irq_type.

> +#define QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, i)		qaif_rddma_irq_reg_addr=
(v, i, 0x08)
> +#define QAIF_EE_RDDMA_PERIOD_IRQ_RAW_STAT_REG(v, i)	qaif_rddma_irq_reg_a=
ddr(v, i, 0x10)
> +#define QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, i)		qaif_rddma_irq_reg_addr(=
v, i, 0x18)
> +#define QAIF_EE_RDDMA_PERIOD_IRQ_FORCE_REG(v, i)	qaif_rddma_irq_reg_addr=
(v, i, 0x20)

[ ... ]

> +/* RDDMA Error Response Interrupts */
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(=
v, i, 0x50)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, i)	qaif_rddma_irq_reg_addr=
(v, i, 0x58)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_RAW_STAT(v, i)	qaif_rddma_irq_reg_addr=
(v, i, 0x60)

[Severity: Low]
Should this macro be named QAIF_EE_RDDMA_ERR_RSP_IRQ_RAW_STAT_REG? It
appears to be missing the _REG suffix used by the other macros in this file,
which could cause naming inconsistencies for future development.

> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, i)		qaif_rddma_irq_reg_addr=
(v, i, 0x68)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_FORCE_REG(v, i)	qaif_rddma_irq_reg_add=
r(v, i, 0x70)

[ ... ]

> +/* WRDMA Error Response Interrupts */
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, i)		qaif_wrdma_irq_reg_addr(=
v, i, 0x50)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, i)	qaif_wrdma_irq_reg_addr=
(v, i, 0x58)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_RAW_STAT(v, i)	qaif_wrdma_irq_reg_addr=
(v, i, 0x60)

[Severity: Low]
Should this macro also be named QAIF_EE_WRDMA_ERR_RSP_IRQ_RAW_STAT_REG to
maintain the consistent _REG suffix convention?

> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, i)		qaif_wrdma_irq_reg_addr=
(v, i, 0x68)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_FORCE_REG(v, i)	qaif_wrdma_irq_reg_add=
r(v, i, 0x70)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-b4-qaif-sh=
ikra-audio-v6-0-e9addb358201@oss.qualcomm.com?part=3D3

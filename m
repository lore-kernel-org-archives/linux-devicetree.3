Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CBA4C77C5
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656681; cv=none; b=HGpzQ6jZroL/tlz+Ehfd6YcaROomfWEIM7Bn3O6KjIv/M5kLL7GfF1sk+J76QoLZtPcq7MNV2a95GCg9skRelef/nakShxOkgoZNez+xWa/6mp6dKEwi3JUEle0KWfuDBVoA1kKSTcgZ3n3H5XWEQW7YrRguG0EbxJuxYOU+JuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656681; c=relaxed/simple;
	bh=98hDPUQR/i/2fj6WfgF4L9xLr/tuksNceWfnH3jgbeg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bTKILuttyVfcl18TsvhrZQm6wv7oTAXL3Gc4PtzhxV9Y2Zxn2+3k6B3AaBqb9cWhSfOi0qOXxSrGwRN21BMiYwYQ4O+bVaQSlv45dGFHlQ/QXPTqPIZnLMBlzBloLzBpYziwO4W03dxZOMDFLkfZ7EUG5IuKuGPyJ1ciGUbgBsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGugwwK6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGugwwK6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B4D1F00893;
	Fri,  5 Jun 2026 10:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780656679;
	bh=oUqEKvykaaixjPPfbpRYQHHHgXBpQHd9aRUs8NpQDpI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bGugwwK6wCz0kbZC8aLg0LCUu2aK3fVFm0fWkZaKMAYazM8xmzpBhilVEvBGBx1Jr
	 nOjlXC/HOx1I9jlh+1NSWXc9o8pUMML4+brio48GSR/XFc8McLvmGFNYWGrDfZ24qn
	 fsk4EMG8uTaFjNsqFG7/kGycy7ctjSfTcb+1cp+0t8pt6APBUED8aY326w63H3UKb5
	 B1fntXCoup75OZ6N9dbmKgrpItQyVZMcMQAqQm56dvst+Z4peM4eu9BVtb8EZT+Obz
	 cI2ns2BXsIOG5pvbuEEmCJf79dx62tUdkcCaikx7BSmpqQWTSyUhivrPgqLx/aZOhB
	 5Fh4NWxAAlTRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/13] ASoC: qcom: Add QAIF shared data structures and
 variant interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605103739.3557573-6-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-6-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 10:51:19 +0000
Message-Id: <20260605105119.B0B4D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Client status register bitmasks omit critical summary IRQ bits, wh=
ich can lead to an unhandled interrupt storm.
- [High] The `qaif_drv_data` structure lacks a lock to serialize concurrent=
 process accesses to shared mutable state, leading to data races and channe=
l double-allocation.
- [Medium] The commit message explicitly claims to define 'QAIF-private MI2=
S port IDs used for the senary and septenary interfaces', but these definit=
ions are missing from the patch.
- [Low] Generic identifiers `enum dma_type` and `DMA_TYPE_MAX` pollute the =
global subsystem namespace.
--

commit 54235d0e0d62830d345de2e4cee5111d43b55417
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF shared data structures and variant interface

This commit introduces the qaif.h header, defining common data structures,
macros, and enums used by QAIF CPU DAI and PCM platform drivers. It includes
definitions for DMA control, IRQ mapping helpers, and the SOC variant
descriptor.

> Also define the QAIF-private MI2S port IDs used for the senary and
> septenary interfaces.

[Severity: Medium]
Are these MI2S port IDs missing from the patch? The commit message explicit=
ly
claims to define QAIF-private MI2S port IDs for the senary and septenary
interfaces, but these definitions do not appear to be present in the provid=
ed
code.

> diff --git a/sound/soc/qcom/qaif.h b/sound/soc/qcom/qaif.h
> new file mode 100644
> index 0000000000000..d0f3b3026f5d9
> --- /dev/null
> +++ b/sound/soc/qcom/qaif.h

[ ... ]

> +enum qaif_dma_type {
> +	QAIF_AIF_DMA =3D 0,
> +	QAIF_CIF_DMA =3D 1,
> +	DMA_TYPE_MAX
> +};

[Severity: Low]
Does DMA_TYPE_MAX overlap confusingly with enum dma_type? It is defined ins=
ide
enum qaif_dma_type instead of enum dma_type.

[ ... ]

> +struct qaif_drv_data {
> +
> +	/* MI2S bit clock (derived from system clock by a divider) */
> +	struct clk *mi2s_bit_clk[LPASS_MAX_MI2S_PORTS];
> +
> +	/* SOC specific clock list */
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +
> +	struct clk *aud_dma_clk;
> +	struct clk *aud_dma_mem_clk;
> +
> +	/* Qualcomm audio interface (QAIF) registers */
> +	void __iomem *audio_qaif;
> +
> +	/* regmap backed by the Qualcomm audio interface (QAIF) registers */
> +	struct regmap *audio_qaif_map;
> +
> +	/* interrupts from the Qualcomm audio interface (QAIF) */
> +	int audio_qaif_irq;
> +
> +	/* QAIF init config refcount*/
> +	unsigned int qaif_init_ref_cnt;

[Severity: High]
Does this structure lack a lock to serialize concurrent access?=20

Multiple PCMs mapped to different DAIs can be opened simultaneously by
userspace. Since ALSA only serializes operations per PCM via the PCM open
mutex, this allows concurrent execution of operations like PCM open for
different PCMs.

Could this lead to data races and channel double-allocation if multiple str=
eams
concurrently read and increment qaif_init_ref_cnt or modify the channel
tracking bitmaps below?

> +
> +	/* SOC specific variations in the QAIF IP integration */
> +	const struct qaif_variant *variant;
> +
> +	/* Runtime-allocated regmap field handles (populated at probe) */
> +	struct qaif_dmactl *aif_rd_dmactl;
> +	struct qaif_dmactl *aif_wr_dmactl;
> +	struct qaif_dmactl *cif_rd_dmactl;
> +	struct qaif_dmactl *cif_wr_dmactl;
> +	struct qaif_aud_intfctl *aif_intfctl;
> +	struct qaif_cdc_intfctl *cif_rddma_intfctl;
> +	struct qaif_cdc_intfctl *cif_wrdma_intfctl;
> +	struct qaif_aif_config aif_intf_cfg[QAIF_MAX_AIF_CFG_CNT];
> +
> +	/* bit map to keep track of dma idx allocations */
> +	unsigned long aif_dma_idx_bit_map;
> +	unsigned long cif_dma_idx_bit_map;

[ ... ]

> +enum qaif_summary_irq_bitmask {
> +	QAIF_SUMMARY_BITMASK_AIF_PERIOD_RDDMA		=3D BIT(0),
> +	QAIF_SUMMARY_BITMASK_AIF_UNDERFLOW_RDDMA	=3D BIT(1),
> +	QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_RDDMA		=3D BIT(2),
> +	QAIF_SUMMARY_BITMASK_AIF_PERIOD_WRDMA		=3D BIT(3),
> +	QAIF_SUMMARY_BITMASK_AIF_OVERFLOW_WRDMA		=3D BIT(4),
> +	QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_WRDMA		=3D BIT(5),
> +
> +	QAIF_SUMMARY_BITMASK_AUD_OVERFLOW			=3D BIT(6),
> +	QAIF_SUMMARY_BITMASK_AUD_UNDERFLOW			=3D BIT(7),
> +
> +	QAIF_SUMMARY_BITMASK_RATE_DET				=3D BIT(8),
> +	QAIF_SUMMARY_BITMASK_VFR					=3D BIT(9),
> +	QAIF_SUMMARY_BITMASK_GRP					=3D BIT(10),
> +	QAIF_SUMMARY_BITMASK_RDDMA_OVERLAP			=3D BIT(11),
> +	QAIF_SUMMARY_BITMASK_WRDMA_OVERLAP			=3D BIT(12),
> +	QAIF_SUMMARY_BITMASK_INTF_OVERLAP			=3D BIT(13),
> +	QAIF_SUMMARY_BITMASK_GRP_OVERLAP			=3D BIT(14),
> +
> +	QAIF_SUMMARY_BITMASK_CIF_OVERLAP_RDDMA		=3D BIT(15),
> +	QAIF_SUMMARY_BITMASK_CIF_OVERLAP_WRDMA		=3D BIT(17),
> +	QAIF_SUMMARY_BITMASK_CIF_PERIOD_RDDMA		=3D BIT(18),
> +	QAIF_SUMMARY_BITMASK_CIF_UNDERFLOW_RDDMA	=3D BIT(19),
> +	QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_RDDMA		=3D BIT(20),
> +	QAIF_SUMMARY_BITMASK_CIF_PERIOD_WRDMA		=3D BIT(24),
> +	QAIF_SUMMARY_BITMASK_CIF_OVERFLOW_WRDMA		=3D BIT(25),
> +	QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_WRDMA		=3D BIT(26)
> +
> +};
> +
> +enum qaif_client_status_register_bitmask_info {
> +	QAIF_BITMASK_GROUP_INF			=3D 0x400,
> +	QAIF_BITMASK_AIF_RDDMA_WRDMA	=3D 0x3F,
> +	QAIF_BITMASK_CIF_RDDMA_WRDMA	=3D 0x71c0000,
> +	QAIF_BITMASK_DP_RDDMA			=3D 0xe00000,
> +	QAIF_BITMASK_AUD_INF			=3D 0xC0,
> +};

[Severity: High]
Are critical summary IRQ bits missing from these routing masks?=20

The client status register bitmasks appear to omit several bits defined in
enum qaif_summary_irq_bitmask, such as the overlap bits (e.g., bit 15
QAIF_SUMMARY_BITMASK_CIF_OVERLAP_RDDMA), RATE_DET (bit 8), and VFR (bit 9).

If the hardware asserts an omitted bit, could the top-level IRQ handler ret=
urn
IRQ_NONE and fail to clear it? This might lead to an unhandled interrupt st=
orm
where the kernel IRQ subsystem eventually disables the IRQ line, breaking a=
ll
QAIF audio streams.

> +
> +struct qaif_irq_map {
> +	int client_id;
> +	u32 mask;
> +	irqreturn_t (*client_irq_handler)(struct qaif_drv_data *drvdata, u32 ir=
q_status);
> +};
> +
> +enum dma_type {
> +	DMA_TYPE_RDDMA,
> +	DMA_TYPE_WRDMA
> +};

[Severity: Low]
Could this generic enum name cause namespace collisions? Defining enum
dma_type with values like DMA_TYPE_RDDMA in a shared SOC header lacks a
subsystem-specific prefix like qaif_. This risks colliding with other heade=
rs
in the global namespace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605103739.3557=
573-1-harendra.gautam@oss.qualcomm.com?part=3D5

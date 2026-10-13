Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196D94E80A5
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889372; cv=none; b=LpUMq/SF30/xetKthqxEBY5OnvDnMwg17HU2pBQXTmqP52kOHnMBpljI16PL8D8TlTeZNzKV3329q5Cd6di2NJVscq8ZWW8pYLtdFsHnLqBDMFMvRNQMOBCRZ/isqnwbsPotwK2LNS6o5QzHQbugDQ3i9noj/wQkRvO0cVZwigs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889372; c=relaxed/simple;
	bh=SYntcINLRJF10ZMeKD5TVZJzT0zCGPMAL4QVU/TpIb0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tq+MMg5zdNhnhg8Rcf1feBZOJMi4PYwBKIK2TSIOBlbS0bR4ZzDZC/5WXMTLfkpnPLznqcaxU5yJ1TBj2zm+cep7oFr19L5Q0jWcwafZuXRnJqbUGK5Luoi7n6akox83jJcWguj4Twa6iFH9A6VwkvH3Stk6H08IGSVjeO7kCkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzGjGAc2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzGjGAc2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3A21F000FF;
	Tue, 13 Oct 2026 11:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791889370;
	bh=DMbk3FrXQ+vJhhLhv9gVCXwZFApAsJasdS/r5++7FtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jzGjGAc22GfGnDsEVE7HR4mEMtvc8s7LBNl3TEw/BCBP6HMTb5VGLALIVETLXq6D9
	 Uy2WcPdAqXNbNeYkivLvMrbkNciD6M99mSWY0K8vmxkQ2nVUKgtjaJbw+30skzPgg3
	 2QbptjIgi5os0/m2qyHGfCFgnW6QOuElPi0Si/KfszxdsbGjSsh1aCrZG9Zh45pYLH
	 ig+qZMX7zVEHDuVmiThJ3geX/v6EffcimloCcbUNM3fiMyeuYFtb11xBf1zYB+3cAX
	 cer+CdWDKOHKPAEeSX8Cntcj/6cYI0sBPudimvgO+Py3XZGr/fwCzpU2MtNG0WoA3g
	 YptUJeJOOFfyw==
Message-ID: <sashiko-outbox-169576@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 03/10] ASoC: qcom: Add QAIF hardware register map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-3-f3022e28f2fd@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-3-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:02:49 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] QAIF_EE_MAP_REG offsets miss a '9', causing incorrect MMIO writes
- [Low] qaif: inconsistent naming for ERR_RSP_IRQ_RAW_STAT macros missing _=
REG suffix
--

commit d13e9cc33d346cda85ac92c58c1d5ee57c9e9d82
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF hardware register map

This commit adds qaif-reg.h to define the MMIO register offsets for the
Qualcomm Audio Interface (QAIF) hardware block. It provides a common
register map and accessor helpers so the driver can select the proper
AIF or CIF DMA register set based on the DAI ID.

> diff --git a/sound/soc/qcom/qaif-reg.h b/sound/soc/qcom/qaif-reg.h
> new file mode 100644
> index 0000000000000..2ae26cf24c591
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-reg.h

[ ... ]

> +/*
> + * EE (Execution Engine) assignment and map registers.
> + *
> + * The EE offset (v->ee) is an address/index offset relative to the
> + * platform-defined QAIF/EE base and lets the hardware route the AIF
> + * operation to the correct EE context. It is hardware/platform-specific=
 and
> + * must match the mapping defined for the selected QAIF AIF/lane in the
> + * hardware programming guide. It is not a runtime data offset and must =
not
> + * be changed based on the stream configuration.
> + */
> +#define QAIF_EE_RDDMA_ASSIGNMENT_REG(v)			(0x19148 + (0x1000 * ((v)->ee)=
))
> +#define QAIF_EE_WRDMA_ASSIGNMENT_REG(v)			(0x19150 + (0x1000 * ((v)->ee)=
))
> +#define QAIF_EE_INTF_ASSIGNMENT_REG(v)			(0x19158 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_RDDMA_ASSIGN_REG(v)		(0x19308 + (0x1000 * ((v)->ee=
)))
> +#define QAIF_EE_CODEC_WRDMA_ASSIGN_REG(v)		(0x19318 + (0x1000 * ((v)->ee=
)))
> +#define QAIF_EE_RDDMA_MAP_REG(v)			(0x1920 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_WRDMA_MAP_REG(v)			(0x1940 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_INTF_MAP_REG(v)				(0x1960 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_RDDMA_MAP_REG(v)			(0x1980 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_WRDMA_MAP_REG(v)			(0x1A00 + (0x1000 * ((v)->ee)))

[Severity: High]
Does this code contain a typo in the hex offsets? The sequence of intended
offsets appears to be 0x19920, 0x19940, 0x19960, 0x19980, and 0x19A00, but
the '9' digit seems to be missing here.

This missing digit causes the calculated offset to alias directly into the
QAIF_AUD_INTF register block (which starts at 0x4000) for variants where
v->ee >=3D 3, which could silently corrupt audio interface configurations.

[ ... ]

> +/* RDDMA Error Response Interrupts */
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(=
v, i, 0x50)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, i)	qaif_rddma_irq_reg_addr=
(v, i, 0x58)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_RAW_STAT(v, i)	qaif_rddma_irq_reg_addr=
(v, i, 0x60)

[Severity: Low]
This isn't a bug, but should this macro be named
QAIF_EE_RDDMA_ERR_RSP_IRQ_RAW_STAT_REG to maintain a consistent _REG suffix
with the other macros in this block?

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
This isn't a bug, but similar to the RDDMA macro above, should this one also
include the _REG suffix?

> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, i)		qaif_wrdma_irq_reg_addr=
(v, i, 0x68)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_FORCE_REG(v, i)	qaif_wrdma_irq_reg_add=
r(v, i, 0x70)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-b4-qaif-sh=
ikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com?part=3D3

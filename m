Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698E41D65E
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783840; cv=none; b=h0J1cPAnIcOWR/DiuuFMDcUwfaGtsj1Gyzrqwt813tyZe0SKu2soti3E/Vzej+t4ARBHOTaYjj4iHrbODNciPbrmKFN3clXbMXxgRyDrX5kIvTqtmKwAHv1HVLsVBzVvGQ2WOZmyvn7Gea6pThWNeXHRxAfguNkh15Ee6RXzeDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783840; c=relaxed/simple;
	bh=mPSc1Vd/Mjj2mHocKe2XHbgAlipjnDgVkAmW3xQaTvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AJf+RMpjQKKaEtf64VLN/77h9OTqPZ9bFJftIfsVKkluAyt1VzOAzam6vWyRJ63gWNl87PTjyKpMPmGesK6uKvda+Glb6DADbW0E/ITuPMwOW7EiUGHtq1QDhjcnzzoBt5H8UMp6Y85yNdhVuMqOC9tlrz1hPurEvugsnu1p6RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yf7Svchx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yf7Svchx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1161F00A3A;
	Mon,  7 Sep 2026 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788783839;
	bh=dVW539Um+lYGYsuWWy765I1no8NfdR+lfq5r+98zJQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yf7SvchxEoYUkKrkOVf/F6jYDzGSfgnMqFCxs3I8HOSKqLdzacDNXrEt+kz9C2Q7Z
	 wbgQ9oPIc3KFXnfbBqtn1gxCedtQbIZKKxKR4RKGUdzhj0A1lE92GhRRzF/DdQPI7H
	 7jFe4LFkHj/r/dYPOz77F1TO4B9rNv4u3zosl6ZveDJgnWaqCKim0A3MuS0RkRNkBy
	 63Y8OXEDHJrxcA+7YmJWGf15DRJL7+wjaMSqvlriMzuMagoff1fBTgOSOjHckH3MGT
	 OBgBns1Rl7a7o2pFyHxZrja82iO7kJTihb0ZyWPDWejoMxogAvAxtlGv4riPfK6/gv
	 Q3dSGLGhxfv0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/10] ASoC: qcom: Add QAIF hardware register map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-b4-qaif-shikra-audio-v5-3-6d8ad9ba5c9f@oss.qualcomm.com>
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
 <20260907-b4-qaif-shikra-audio-v5-3-6d8ad9ba5c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 12:23:58 +0000
Message-Id: <20260907122358.BD1161F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The QAIF_EE_*_MAP_REG macros have incorrect base addresses due=
 to an arithmetic typo (using truncated base values like `0x1920` instead o=
f values in the `0x19000` EE block), resulting in accesses to unmapped memo=
ry regions.
- [Low] Missing `_REG` suffix on RAW_STAT macros for WRDMA and RDDMA Error =
Responses.
--

commit 7629bdb576e93d9171f876d77ffa9606caac557c
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF hardware register map

This commit adds the QAIF hardware block MMIO register offsets in a new
header file. It defines accessor macros to select the appropriate DMA
register sets based on the DAI ID for the core registers, interfaces,
and execution engine (EE) contexts.

> diff --git a/sound/soc/qcom/qaif-reg.h b/sound/soc/qcom/qaif-reg.h
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-reg.h

[ ... ]

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

[Severity: Critical]
Does this arithmetic calculation result in out-of-bounds memory accesses?

If v->ee > 0 (for example, v->ee =3D=3D 1), QAIF_EE_RDDMA_MAP_REG calculate=
s to
0x1920 + 0x1000 =3D 0x2920. Since the stride is 0x1000 and the other EE
registers start in the 0x19000 block (e.g. 0x19148), does this mean 0x1920
is a typo for a value in the 0x19000 range?

Adding 0x1000 to the truncated base 0x1920 lands in an unmapped hole
(0x2920) completely outside the intended EE block, which could cause a
system bus fault (SError) and a kernel panic when written to during driver
initialization. This same pattern seems to affect all five MAP_REG macros
defined here.

[ ... ]

> +/* RDDMA Error Response Interrupts */
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(=
v, i, 0x50)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, i)	qaif_rddma_irq_reg_addr=
(v, i, 0x58)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_RAW_STAT(v, i)	qaif_rddma_irq_reg_addr=
(v, i, 0x60)

[Severity: Low]
This isn't a bug, but should this macro have a _REG suffix to match the
naming convention of all the other raw stat macros in this file?

[ ... ]

> +/* WRDMA Error Response Interrupts */
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, i)		qaif_wrdma_irq_reg_addr(=
v, i, 0x00)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, i)	qaif_wrdma_irq_reg_addr=
(v, i, 0x08)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_RAW_STAT(v, i)	qaif_wrdma_irq_reg_addr=
(v, i, 0x60)

[Severity: Low]
Similarly, should this macro also include the _REG suffix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-b4-qaif-sh=
ikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com?part=3D3

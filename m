Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E722765E2
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554092; cv=none; b=JIl33qtohoRYxC3B4bhG6CGbbLCTpyFVSPN8tW10LtombexlzJmkXlVkSJzmSC3xHgf8uzagHuw9LW+j09st7QrdI/Ql/jivTQqBmBLVvS+DLPEtlRyFbFKOj0IAfSjvez4q2lIuOY+z4E+9BcOj0L+43N5Ia31/MNne8b8v17s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554092; c=relaxed/simple;
	bh=010CAIGGimwIdScs+UG+xmXix0Az1deycBtCY54XQYQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J58LF4RTQJytrxynOGxlpjtggwo+UidYUxQeKQc44B6RQa+8b1RN3rzHLfaCaLC4WCIsGlMftJJ+GLb7sDBVnaLjzAHNCpCXoBCorV0e5iB+lAnMhezxRwR8Auv6chG8bD373WjsKhzElR/CQViPXryOnfGe9IZaciFY5ht+ToY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBPmcqRT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBPmcqRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03021F00A3A;
	Mon, 24 Aug 2026 06:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787554091;
	bh=22hRFo6MfWaSEzRwPpjUq6rzijl7gr1LnfvkwN7kMWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jBPmcqRTU0tonrU8jdmE/fseksMxeP/bKkbkKHqQKP24B7ybJfPzwlUif/lcuOo87
	 j86zofVYnvW1ieD9xlPWadhh9jRwu0tadv0ZIF6ezwKB7Zxr9vtplDmG8TCaJOcxZg
	 ueeZybR7Qv5J/8277L5EzDbAbrIqANgrH2VyY/nV02QzH1IEjiWaOcqg5PgZawBt9N
	 v8CW9xL5OB80RwOuXllVZa81CP+5sTHX/Qo8R//btVcESTltEGGJAXBPSVeTPpxHHF
	 ii1nJz8N4cMlQCK3KKJz6beoaJzNRgSm/Amy1CxG7oTNd+d1MZ1Q5gLjSxplbYrI/Z
	 C7vOo+tCdnt7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/9] ASoC: qcom: Add QAIF hardware register map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824063627.3595610-4-harendra.gautam@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-4-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 06:48:10 +0000
Message-Id: <20260824064810.D03021F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware register map definition typos cause memory map collisions
- [Low] Misleading macro parameter 'i' acts as an API trap for developers
- [Low] Missing _REG suffix on raw status macros
--

--- Patch [3]: [PATCH v3 3/9] ASoC: qcom: Add QAIF hardware register map ---
commit 36bb94e8a1bb834af28c48728f97ecbcef9f8a30
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF hardware register map

This commit introduces the register map and accessor helpers for the QAIF
driver. It defines macros to program core registers, audio interfaces, DMA
channels, interrupts, and SID maps based on the DAI ID.

> diff --git a/sound/soc/qcom/qaif-reg.h b/sound/soc/qcom/qaif-reg.h
> new file mode 100644
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
Are these base addresses missing a zero?

QAIF_EE_RDDMA_MAP_REG evaluates to 0x1920 instead of 0x19200. Combined with=
 a
stride of 0x1000 * v->ee, if v->ee is 3 or greater, the address evaluates to
0x4920, which overlaps with the QAIF_AUD_INTF block starting at 0x4000.

QAIF_EE_CODEC_WRDMA_MAP_REG similarly uses 0x1A00 instead of 0x1A000.

Could this mapping collision cause adjacent register block corruption or bus
errors during device initialization?

[ ... ]
> +static inline u32 qaif_rddma_irq_reg_addr(const struct qaif_variant *v,
> +					  enum qaif_irq_type dma_type,
> +					  u32 offset)
> +{
> +	if (dma_type =3D=3D QAIF_AIF_IRQ)
> +		return v->rddma_irq_reg_base + offset +
> +		       v->rddma_irq_stride * v->ee;
> +	return v->codec_rddma_irq_reg_base + offset +
> +	       v->codec_rddma_irq_stride * v->ee;
> +}
> +
> +/* RDDMA Period Interrupts */
> +#define QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(v=
, i, 0x00)

[Severity: Low]
This isn't a bug, but could the 'i' parameter be renamed to something like
'dma_type'?

Since it is passed to qaif_rddma_irq_reg_addr() which expects an
enum qaif_irq_type, using 'i' might imply a channel index like the adjacent
macros. Could this API trap cause a developer to inadvertently pass a chann=
el
index (0-7) instead of the required enum?

[ ... ]
> +/* RDDMA Error Response Interrupts */
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(=
v, i, 0x50)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, i)	qaif_rddma_irq_reg_addr=
(v, i, 0x58)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_RAW_STAT(v, i)	qaif_rddma_irq_reg_addr=
(v, i, 0x60)

[Severity: Low]
This isn't a bug, but does QAIF_EE_RDDMA_ERR_RSP_IRQ_RAW_STAT miss the _REG
suffix used consistently on adjacent definitions in this file?

[ ... ]
> +/* WRDMA Error Response Interrupts */
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, i)		qaif_wrdma_irq_reg_addr(=
v, i, 0x50)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, i)	qaif_wrdma_irq_reg_addr=
(v, i, 0x58)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_RAW_STAT(v, i)	qaif_wrdma_irq_reg_addr=
(v, i, 0x60)

[Severity: Low]
This isn't a bug, but similar to the RDDMA definitions, does
QAIF_EE_WRDMA_ERR_RSP_IRQ_RAW_STAT miss the _REG suffix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824063627.3595=
610-1-harendra.gautam@oss.qualcomm.com?part=3D3

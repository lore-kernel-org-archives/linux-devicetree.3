Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39791DE8AE
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939167; cv=none; b=qliMcq19nUP04bRSbr2QYSIaGUL1Ip662de9zsrrou6WLT+rwgO8xue8F2eDo2mYYHmkg6oWc6Uiyxll3TWinHJ+6nhyggU8Dbj7pVRlN4JlpCOuxNsf7UeOOFqmJCYPGs6GMbpouuRejT/x3DyBnTTSkwEWoC2XkpHpNe9L0UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939167; c=relaxed/simple;
	bh=QqsdTC+pOrGH8S6rx7eCKn9toq/Hstqd1Nmymc1owR4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rhgld2JTS0Ho/Jo5XePIJ9S1/v9ykRc0kafQN7FZW51NH69YYUX+/Vn5pZ+jUDbTLAIYFWnVU1wMaxwKkpgmx2/B89HLpeeYq2tRQ/GqixwB7+XW01XzyLGt+TwMN7WP1oZb05tUIfaojvrGgarcqCX/i4V8tvfBdakzDQoQSS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAYiqIxj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAYiqIxj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557CE1F000E9;
	Mon, 13 Jul 2026 10:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783939165;
	bh=15Dhwh20XfweFeuR1h505sKF7tnS5xI1FovplSycQEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VAYiqIxjL3daCyR+D+ETLGq41mNrhbgaGKn7ME2q4d8KPQYkA6jeYNTEYqj0Bcmpe
	 jqOnw1gz383wgQ7PryrwzW9KoTe+5f8HW5gigVehgRcPxT5V/oB5NH+r1UziMp5E78
	 icplkzFFW8k8uiCDDOJg5x2zJIU70DPaE2Fe6RXpouuG76zhi3jpRPRZV9WvJe0u2E
	 +ou/itGBnTQAqCWqqyfyuov7eijDS7B5hbid+ZYoWCFp95nUTucwT7y91597Q4oE8a
	 R1QfVzsPDfBgKYBAqi+C8IoPpa17yS7E6kP7QbdkeSO+CeE7Oj7rzcu3zauQ9XdY00
	 LLMhXXK8coSHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] irqchip/irq-qcom-mpm: Prepare common access path
 for timer and pin regs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sneh Mankad" <sneh.mankad@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-3-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-3-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 10:39:24 +0000
Message-Id: <20260713103925.557CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The initialization loop in the probe function writes zeroes to reg=
isters based on the device tree property `qcom,mpm-pin-count` without verif=
ying if the calculated `reg_stride` fits within the mapped I/O memory regio=
n.
- [High] Lack of bounds checking on `d->hwirq` combined with signed integer=
 conversion allows arbitrary out-of-bounds memory accesses when reading/wri=
ting IRQ registers.
--

--- Patch [3]: [PATCH 3/7] irqchip/irq-qcom-mpm: Prepare common access path=
 for timer and pin regs ---
commit 481c7b7ccc27a48778456542a65ce5c589dcaa00
Author: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

irqchip/irq-qcom-mpm: Prepare common access path for timer and pin regs

This commit introduces a common addressing helper, qcom_mpm_offset(),
to calculate memory offsets for both timer and pin registers. It also=20
replaces the macro definitions for vMPM registers with an enum and=20
updates the read/write accessor functions to use it.

> diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mp=
m.c
> index 01fd1843172aa..763eddee99dc4 100644
> --- a/drivers/irqchip/irq-qcom-mpm.c
> +++ b/drivers/irqchip/irq-qcom-mpm.c
[ ... ]
> @@ -92,18 +97,36 @@ struct qcom_mpm_priv {
>  	atomic_t cpus_in_pm;
>  };
> =20
> -static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
> -			 unsigned int index)
> +static unsigned int qcom_mpm_offset(struct qcom_mpm_priv *priv, enum qco=
m_mpm_reg reg,
> +				    unsigned int index)
> +{
> +	unsigned int reg_offset;
> +
> +	/*
> +	 * Per the vMPM register map, TIMER[0..1] starts at register index 0 an=
d all pin-specific
> +	 * registers start after the two TIMER regs. Pin-specific register IDs =
start at
> +	 * MPM_REG_ENABLE, so subtract it to convert to a zero-based pin-regist=
er group index.
> +	 */
> +	if (reg =3D=3D MPM_REG_TIMER)
> +		reg_offset =3D index;
> +	else
> +		reg_offset =3D MPM_TIMER_REGS +
> +			 (reg - MPM_REG_ENABLE) * priv->reg_stride + index;
> +
> +	return reg_offset * sizeof(u32);
> +}

[Severity: High]
This isn't a bug introduced by this patch, but I'm wondering if
priv->reg_stride is validated against the size of the mapped I/O memory reg=
ion?

Looking at qcom_mpm_probe():

	priv->reg_stride =3D DIV_ROUND_UP(pin_cnt, 32);

If a very large qcom,mpm-pin-count is provided in the device tree, could the
initialization loop later in qcom_mpm_probe():

	for (i =3D 0; i < priv->reg_stride; i++) {
		qcom_mpm_write(priv, MPM_REG_ENABLE, i, 0);
		...

write zeroes out of bounds into memory following priv->base?

[Severity: High]
This is a pre-existing issue, but does this function safely handle the index
parameter against malformed device tree inputs?

In qcom_mpm_alloc(), pin is assigned as d->hwirq from the device tree
interrupt specifier without bounds validation against domain->hwirq_max.

Later in qcom_mpm_enable_irq():

	int pin =3D d->hwirq;
	unsigned int index =3D pin / 32;

If a sufficiently large d->hwirq (e.g., 0x80000000) is provided, would the
signed integer conversion cause it to wrap into a negative number, resulting
in a massive unsigned index being passed into qcom_mpm_offset() and allowing
arbitrary out-of-bounds memory accesses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-b4-shikra_=
lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com?part=3D3

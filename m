Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B2346798
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787540096; cv=none; b=TZtZVL072+/w++ywRRaRWMBCS5nG61ADwHxBYrlCMw65tqHl06NfZTPWNZwrtPHjZ4ayJ4BivR77J0NH917lL2WGr5wMWAqgWIDce9DPmF2nICrMX6eQT1jGNERwbMwaIEM/CLAIEeEL5i9re085ucurmkGp3+HG4/K6zxT4rAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787540096; c=relaxed/simple;
	bh=0ZFxx+x2iOcK9IDTbmf19rzN7s7H47hKsRWLsL8i7cI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JiTT3CJS2USgBoyrOTtHKuiizHxXzfh8qPadVOtk9SqPKxq6UfBFEiDMiIe0SUNql/o1XoKp1gOtnJ4oyX6dTRuYLx+OI0ywrfrgxAyRsJoVu1tJmYyVYMIX1VgBggZmbD4OcKIolB/J23Rp2ltXDaY+Dy9ekY53HEvDUaKumao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UET3TPMB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UET3TPMB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D735A1F000E9;
	Mon, 24 Aug 2026 02:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787540095;
	bh=15pwC0eSuXMiePrzh4h1nF+HQu62nTuDtA8aq2lyitk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UET3TPMBOBjAd/a0Z40l2awGYPB2dHcwKvQ7H09twKdXZhkBfXc/6pIFF+eneK9R+
	 ERw/1+vQ/XpI2ITbDURVDkUaspGYdNZxNdLjuvE6stA7hMhI8UTDrOoxzNe/IqgFM3
	 L8eBbK5BXmXRODJlg4IWMF+wQgW5YfJSMwU5HpS5QfZYvt8jLVBG+NDF4DuH0r+aW4
	 7orh3jvAvQ6h8Q/QXPkGC/kVRYo9BkU27Ps01Kf9WdIAGXwPpKuAkMADAQXeRmqOk6
	 6WMnRREc1eK1I2M+HnCl1Thli0edSTCPM65qVwc5i+Rk/+TG3PGO/ZMAfLLrLCJb0y
	 EJfW8wp8n/PYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] EDAC/aspeed: Add AST2700 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-edac-v2-8-c8d8bb693586@aspeedtech.com>
References: <20260824-edac-v2-0-c8d8bb693586@aspeedtech.com>
 <20260824-edac-v2-8-c8d8bb693586@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 02:54:54 +0000
Message-Id: <20260824025454.D735A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Returning IRQ_NONE for unhandled exclusive DRAMC interrupts relies=
 on the spurious IRQ detector, which permanently disables ECC reporting.
--

--- Patch [8]: [PATCH v2 8/8] EDAC/aspeed: Add AST2700 support ---
commit 0d3da1d609b9b0868952fd656c60d988b1c32e40
Author: Ryan Chen <ryan_chen@aspeedtech.com>

EDAC/aspeed: Add AST2700 support

Add SDRAM ECC reporting for the Aspeed AST2700. Its DRAMC has a different
register layout, a split interrupt status/clear/mask scheme, DDR4/DDR5
memory and interrupt registers that are not key-protected.

> diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
> index e88d9d2646de7..88b7f5ff37273 100644
> --- a/drivers/edac/aspeed_edac.c
> +++ b/drivers/edac/aspeed_edac.c
[ ... ]
> @@ -180,6 +209,54 @@ static irqreturn_t aspeed_mcr_isr(int irq, void *arg)
[ ... ]
> +static irqreturn_t ast2700_dramc_isr(int irq, void *arg)
> +{
> +	u32 int_sts, ecc_sts, fail_addr;
> +	struct mem_ctl_info *mci =3D arg;
> +	struct aspeed_edac *priv;
> +	u8 rec_cnt, un_rec_cnt;
> +	phys_addr_t addr;
> +
> +	priv =3D mci->pvt_info;
> +
> +	scoped_guard(raw_spinlock, &priv->lock) {
> +		int_sts =3D readl(priv->regs + AST2700_INT_STS);
> +		if (!(int_sts & AST2700_INT_ECC))
> +			return IRQ_NONE;

[Severity: High]
If a non-ECC interrupt is left enabled by the bootloader in the mask
register, will returning IRQ_NONE here cause the kernel's spurious IRQ
detector to permanently disable the interrupt line?

Since the driver requests an exclusive, level-triggered interrupt, an
unhandled asserted line will cause an interrupt storm leading to a disabled
ECC error reporting mechanism.

> +
> +		ecc_sts =3D readl(priv->regs + AST2700_ECC_STS);
> +		fail_addr =3D readl(priv->regs + AST2700_ECC_FAIL_ADDR);
> +
> +		/* the interrupt registers are not key-protected; clear only ECC */
> +		writel(int_sts & AST2700_INT_ECC, priv->regs + AST2700_INT_CLR);
> +	}
[ ... ]
> +static void ast2700_set_irq(struct aspeed_edac *priv, bool enable)
> +{
> +	u32 val;
> +
> +	guard(raw_spinlock_irqsave)(&priv->lock);
> +
> +	/* interrupts are enabled by clearing their mask bits */
> +	val =3D readl(priv->regs + AST2700_INT_MASK);
> +	if (enable)
> +		val &=3D ~AST2700_INT_ECC;
> +	else
> +		val |=3D AST2700_INT_ECC;
> +
> +	writel(val, priv->regs + AST2700_INT_MASK);

[Severity: High]
Does this read-modify-write sequence leave non-ECC interrupts unmasked if
they were already enabled by the bootloader?

Taking full ownership of the mask register during initialization, perhaps by
masking all non-ECC sources explicitly instead of doing a read-modify-write,
might prevent the spurious interrupt issue mentioned above.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-edac-v2-0-=
c8d8bb693586@aspeedtech.com?part=3D8

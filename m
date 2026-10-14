Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155493EA977
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994170; cv=none; b=kAIQJoajux3UBVpAPmz2iCLNIujmYCS0bAX0NE+s4neleAMI1W7i/TQONA9/P/0vOQ8BPxsCEusBsYMdAD3f7OoPww5P/IsofT6Su+rKzUvXD2RcDo83yjkS5wG1aob3pA4hbHKCD+yRGALS0M9gVUkFAdaFQHjcso94GLC0lJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994170; c=relaxed/simple;
	bh=nuZsR1JdZdgBPWnBUdYEYUmHwuXZ7c6BSSq8sI9Sago=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=auE58+gpjRuNc0Z1nMUxH6wmzdarhg0e1cZtOowTdZVzKGcB+SSu6fRa3vzsAILW0yS2GsK9Su4QZLow3WO0zOh5J5nkk2kwLBoywF2gPwVUkEAw9kh5YSAG4dBbvD4lJztM9lmXaINU7vnP2mVpKons6kIjKWuKWCxjn/ElrL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zl3pueaV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zl3pueaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CF61F000C4;
	Wed, 14 Oct 2026 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791994168;
	bh=BCmJRAOc9I20UkGpK8VP6MnaXgmm5sz9EAG3cVy5kiM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zl3pueaV1qBYxScXpngLBCdTaf/1eaembmHX5a998aev698wkSU+dG3HQ6omoZECf
	 k9/X7ag8fIdUn8LwgXDnIyk+h2BHHgI5BQ+xI1rTvlpr84gKpsL8vFLJOCZfnZGmec
	 rjk29Lv4hm9JIqjXgiTmVcziVo2MUDheJlpFvh6dk2wqmxx88yp8XlDSNQup3YcmsG
	 qeyOI9/QeJ/22/QXlso8lXFoGRbD0UdFLs4gqxHQUR1M6Y3b0gR+a1565eGrdqg0lk
	 PHkwuin/3XHA71IE0oIwNE0WXhV5q8Bzh/6IgoBAzE7m3nielEZbucBpVonKOjMjaG
	 0CYgK0G3JRncw==
Message-ID: <sashiko-outbox-171516@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] edac: qcom: add LCP/SRP DDR DRAM ECC support for
 Shikra
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faiyaz Mohammed" <faiyaz.mohammed@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-master-v1-3-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-3-aba3cfcfbac9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 16:09:27 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] edac: qcom: UAF in llcc_lcp_ecc_irq_handler due to devm_request_ir=
q lifecycle mismatch
- [Medium] edac: LCP/SRP handlers discard hardware ECC counts, causing unde=
r-reporting
- [Medium] edac: qcom: data race in EDAC counters due to concurrent IRQs
--

commit 943c843f6548de65b2dfbf919c2a617470e1b5e9
Author: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>

edac: qcom: add LCP/SRP DDR DRAM ECC support for Shikra

Add qcom_llcc_lcp_setup() to enable LCP/SRP interrupt routing when
firmware has not pre-configured it, and llcc_lcp_ecc_irq_handler() to
report per-bank correctable and uncorrectable DDR DRAM ECC errors.

> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
> index f3da9385ca0d8..b4f7b2493650c 100644
> --- a/drivers/edac/qcom_edac.c
> +++ b/drivers/edac/qcom_edac.c

[ ... ]

> @@ -334,6 +366,92 @@ static void llcc_ecc_check(struct edac_device_ctl_in=
fo *edev_ctl)
>  	llcc_ecc_irq_handler(0, edev_ctl);
>  }
> =20
> +/*
> + * Handler for the optional LCP/SRP DDR DRAM ECC interrupt
> + * (ddrss_apps_interrupt[1]).  The LCP/SRP registers live in each LLCC
> + * instance's address space, so iterate over all banks and read status
> + * per-instance.  Broadcast-write the clear after the full loop, mirrori=
ng
> + * the TRP/DRP handler pattern.
> + */
> +static irqreturn_t llcc_lcp_ecc_irq_handler(int irq, void *edev_ctl)
> +{
> +	struct edac_device_ctl_info *edac_dev_ctl =3D edev_ctl;
> +	struct llcc_drv_data *drv =3D edac_dev_ctl->dev->platform_data;
> +	const struct llcc_edac_reg_offset *reg =3D drv->edac_reg_offset;
> +	irqreturn_t irq_rc =3D IRQ_NONE;
> +	u32 intr_status, err_status, clr_reg;
> +	int i, ret;
> +
> +	/* Iterate over banks: LCP/SRP status registers are per-LLCC instance */
> +	for (i =3D 0; i < drv->num_banks; i++) {
> +		ret =3D regmap_read(drv->regmaps[i], reg->lcp_srp_interrupt_status,
> +				  &intr_status);
> +		if (ret)
> +			continue;
> +
> +		intr_status &=3D LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR;
> +		if (!intr_status)
> +			continue;
> +
> +		irq_rc =3D IRQ_HANDLED;
> +
> +		ret =3D regmap_read(drv->regmaps[i], reg->lcp_srp_ecc_error_status1,
> +				  &err_status);
> +		if (ret) {
> +			edac_printk(KERN_ERR, EDAC_LLCC,
> +				    "LCP/SRP error status read failed for bank%u: %d\n",
> +				    i, ret);
> +			continue;
> +		}
> +
> +		if (intr_status & LCP_DB_ECC_ERROR) {
> +			u32 db_cnt =3D FIELD_GET(LCP_DB_ERR_COUNT_MASK, err_status);
> +
> +			edac_printk(KERN_CRIT, EDAC_LLCC,
> +				    "LCP/SRP DDR DRAM Double-bit ECC error in bank%u: count=3D%u sta=
tus=3D0x%08x\n",
> +				    i, db_cnt, err_status);
> +			edac_device_handle_ue(edac_dev_ctl, 0, i,
> +					      "LCP/SRP DDR DRAM uncorrectable error");

[Severity: Medium]
Since db_cnt contains the exact number of double-bit errors, should this
code use edac_device_handle_ue_count(edac_dev_ctl, db_cnt, ...) instead?

The edac_device_handle_ue() wrapper hardcodes an error count of 1, which wi=
ll
discard the hardware-provided count and lead to under-reporting if the
aggregated count is greater than 1.

[Severity: Medium]
Additionally, since edac_device_handle_ue() performs non-atomic increments =
on
the EDAC core counters, is a lock needed here?

The ecc_irq and lcp_irq are independent hardware interrupts. If their handl=
ers
(llcc_ecc_irq_handler and llcc_lcp_ecc_irq_handler) run concurrently on
different CPUs, it could result in a data race on the shared edev_ctl
statistics.

> +		}
> +
> +		if (intr_status & LCP_SB_ECC_ERROR) {
> +			u32 sb_cnt =3D FIELD_GET(LCP_SB_ERR_COUNT_MASK, err_status);
> +
> +			edac_printk(KERN_WARNING, EDAC_LLCC,
> +				    "LCP/SRP DDR DRAM Single-bit ECC error in bank%u: count=3D%u sta=
tus=3D0x%08x\n",
> +				    i, sb_cnt, err_status);
> +			edac_device_handle_ce(edac_dev_ctl, 0, i,
> +					      "LCP/SRP DDR DRAM correctable error");

[Severity: Medium]
Similarly, should this use edac_device_handle_ce_count(edac_dev_ctl, sb_cnt=
, ...)
to propagate the actual hardware count instead of defaulting to 1?

> +		}
> +	}

[ ... ]

> @@ -386,6 +506,33 @@ static int qcom_llcc_edac_probe(struct platform_devi=
ce *pdev)
>  		return rc;
>  	}
> =20
> +	/*
> +	 * Set up LCP/SRP DDR DRAM ECC after the EDAC device is published.
> +	 * Skip hardware routing setup if firmware already configured IRQ
> +	 * propagation (irq_configured); only request the IRQ handler.
> +	 * Guard on a non-zero lcp_srp_interrupt_enable offset to confirm
> +	 * this LLCC variant actually has an LCP/SRP block.
> +	 */
> +	if (llcc_driv_data->lcp_irq > 0 &&
> +	    llcc_driv_data->edac_reg_offset->lcp_srp_interrupt_enable) {
> +		if (!llcc_driv_data->ecc_irq_configured) {
> +			rc =3D qcom_llcc_lcp_setup(llcc_driv_data,
> +						 llcc_driv_data->bcast_regmap);
> +			if (rc) {
> +				dev_warn(dev, "LCP/SRP interrupt setup failed: %d\n", rc);
> +				goto lcp_done;
> +			}
> +		}
> +		rc =3D devm_request_irq(dev, llcc_driv_data->lcp_irq,
> +				      llcc_lcp_ecc_irq_handler,
> +				      0, "llcc_lcp_ecc", edev_ctl);

[Severity: High]
Does the use of devm_request_irq() here create a use-after-free risk during
device removal?

If the device is unbound, the remove callback (qcom_llcc_edac_remove) expli=
citly
frees the edev_ctl structure via edac_device_free_ctl_info(). However, beca=
use
the IRQ is registered with devm_request_irq(), free_irq() isn't called until
devres teardown, which happens after the remove callback completes.

If the LCP ECC interrupt fires in this window, llcc_lcp_ecc_irq_handler() w=
ill
dereference a freed edev_ctl pointer.

> +		if (rc)
> +			dev_warn(dev,
> +				 "failed to request LCP ECC irq %d: %d, DDR DRAM ECC reporting disab=
led\n",
> +				 llcc_driv_data->lcp_irq, rc);
> +	}
> +lcp_done:
> +	rc =3D 0;
>  	platform_set_drvdata(pdev, edev_ctl);
> =20
>  	return rc;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-master-v1-=
0-aba3cfcfbac9@oss.qualcomm.com?part=3D3

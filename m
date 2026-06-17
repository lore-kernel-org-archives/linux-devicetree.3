Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408B937756E
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781672586; cv=none; b=Lao5GDWOWy4V2q49WIDZOzYUA8m5PcLLfXrVcL2VsrXRGP/lO8uRmTIb7RrlthmMAdHYBvIRmyPfpBB0ZiSkUSkUihqu2Kr8sJJMYsOmmdagSOZgKJXqU9/shKpRbqRyo6vtsUD9VQykkJDf2U43rlU8kKti8rNljIOAVYuseGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781672586; c=relaxed/simple;
	bh=JyRuFgpu23FA9YxYseYnc2ExyoLrfWjzG8MMBRu+Lho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=He5T0JijiF8rvvz9Ym5O3JAxF9Mx9LpBsM6mRjFhSPgEYf0C1xFV47HdGt1oCmNRMX5rHHOM1o8PkMZUfnG83p1/bq4g//3mUUlnSfLdMgpi2G7OluPp6Vg+nqoUzTfDVCwiemSCxj9rXvsVryqj4sf/hWVEiC5YsRJFFb6BEJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpA0NwEE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpA0NwEE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CE91F000E9;
	Wed, 17 Jun 2026 05:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781672579;
	bh=1hHl1veHCTBi3V8cZRpuGECIc/z4u7m+h45LKT2rI3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lpA0NwEEgXpTE/A0pkaZlQLtRdIRvG+0EI1krMB95I3iqC8oIur81an4paMrkRpb/
	 VSD5pjlwsOmpc+KLSGm/n2qGsPVGaNVxPYSepoaIyd5XEbJIFG7GXJtcVtYDrV6jGh
	 /UI3IddeusjhXMnYZGgy/FSdzkDsUz2pxIHYiIkTrZ4yDeVtRENMCjUagi6qO7DtZJ
	 qF6o/XZcwZD+ujRn+7UOzu6LM8JUDkOfCeJc3RBctyujmROJ2LVmoe2tnJ09BhZyDu
	 inQQUK5gGVrfNSILI+TOo9CJBVpYxu8dgWF1GMUeZ1kxBtF8Xb6PfF2l1+cmJ8N+gE
	 beNVDnx/3G1sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/6] i2c: qcom-geni: Store of_device_id data in
 driver private struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-5-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
 <20260617-enable-i2c-on-sa8255p-v7-5-ad736dbeab57@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 05:02:59 +0000
Message-Id: <20260617050259.65CE91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Accessing a non-existent member `core_clk` in `struct geni_se` cau=
ses a build failure and alters fallback logic.
- [High] DMA channels are permanently leaked if `i2c_add_adapter()` fails d=
uring probe.

Pre-existing issues:
- [High] Multi-descriptor DMA buffer arrays are leaked on early transfer er=
rors or partial allocation failures.
--

commit 1f9fcc815478494b91c04d32de4b9e7efa6fac42
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

i2c: qcom-geni: Store of_device_id data in driver private struct

This commit updates the driver to store the struct of_device_id data
directly in the i2c private structure. The goal is to improve code
maintainability and avoid repeatedly fetching and checking platform
data across different functions.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 8f8b74c4e88a4..92cccb1cce698 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[ ... ]

> @@ -1033,8 +1023,8 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>  		tx_depth =3D geni_se_get_tx_fifo_depth(&gi2c->se);
> =20
>  		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register=
 */
> -		if (!tx_depth && desc)
> -			tx_depth =3D desc->tx_fifo_depth;
> +		if (!tx_depth && gi2c->se.core_clk)
> +			tx_depth =3D gi2c->dev_data->tx_fifo_depth;

[Severity: High]
Does struct geni_se have a core_clk member? Looking at geni-se.h, it appears
this will cause a build failure since core_clk doesn't exist.

Additionally, if this is changed to gi2c->se.clk, will it alter the original
fallback logic? Previously, if a master-hub device lacked this clock, it
correctly fell back to using desc->tx_fifo_depth. With this change, if the
clock is missing, tx_depth might remain 0 and cause a probe failure.

[ ... ]

> @@ -1089,7 +1078,9 @@ static int geni_i2c_probe(struct platform_device *p=
dev)
>  	if (IS_ERR(gi2c->se.base))
>  		return PTR_ERR(gi2c->se.base);
> =20
> -	desc =3D device_get_match_data(&pdev->dev);
> +	gi2c->dev_data =3D device_get_match_data(&pdev->dev);
> +	if (!gi2c->dev_data)
> +		return -EINVAL;

[Severity: High]
During the refactoring in this patch series, did we lose the cleanup for
DMA channels in geni_i2c_probe()?

If i2c_add_adapter() fails after geni_i2c_init() has successfully requested
GPI DMA channels via setup_gpi_dma(), release_gpi_dma() is not called:

geni_i2c_probe() {
    ...
    ret =3D geni_i2c_init(gi2c);
    if (ret < 0) { ... }

    ret =3D i2c_add_adapter(&gi2c->adap);
    if (ret) {
        dev_err_probe(dev, ret, "Error adding i2c adapter\n");
        pm_runtime_disable(gi2c->se.dev);
        return ret;
    }
    ...
}

Are tx_c and rx_c permanently leaked here on failure?

[ ... ]

[Severity: High]
This is a pre-existing issue, but do multi-descriptor DMA buffer arrays
leak on early transfer errors or partial allocation failures?

In geni_i2c_gpi_xfer(), if the second allocation fails, it jumps to the
error label:

geni_i2c_gpi_xfer() {
    ...
    tx_multi_xfer->dma_buf =3D kcalloc(gi2c->num_msgs, ...);
    tx_multi_xfer->dma_addr =3D kcalloc(gi2c->num_msgs, ...);
    if (!tx_multi_xfer->dma_buf || !tx_multi_xfer->dma_addr) {
        ret =3D -ENOMEM;
        goto err;
    }
    ...
err:
    geni_i2c_gpi_multi_desc_unmap(gi2c, msgs, &i);
}

Inside geni_i2c_gpi_multi_desc_unmap(), the arrays are only freed if
the loop reaches the end:

geni_i2c_gpi_multi_desc_unmap() {
    ...
    if (tx_multi_xfer->unmap_msg_cnt =3D=3D gi2c->num_msgs - 1) {
        kfree(tx_multi_xfer->dma_buf);
        kfree(tx_multi_xfer->dma_addr);
        break;
    }
    ...
}

During an early abort or partial allocation failure, the arrays are not
freed. Should they be cleaned up unconditionally?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-enable-i2c=
-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com?part=3D5

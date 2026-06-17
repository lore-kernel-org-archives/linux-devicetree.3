Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA5F359703
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781672757; cv=none; b=IHKYws85ju4i3oUiTLRw1ftPmeJKnQHKPNaNQZRlkWyTSWxFBHA6z2u76rhiuqOi3j2GjFbqMHJAlHQITLeXfeNgiNvYSJkDQiAReUtjNoIFHMwgvK0Tcd8TLtiisVCcy1LkvJKxOGSs+kfqjtgvBzoKUvp4KBsMpue3wBRd9m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781672757; c=relaxed/simple;
	bh=ILi/tta5OZV1eqp6mLOGdCRRB879A1OBSq2ao0lRheE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rdxo/xCasqeDXZTxSU5I0ebfBhbst1WyepbXuIGgEkqHA8noKIL7aJeXUQZGfFgddyx9h3DSWd7Am0i12WnC8MAmMWE8GlO2qLFDjWTEyL0fgv7I3ACdQBLPgIspSR9Hnu9HuG1m0D78U/k9uf6v8Mr8Ax9NdSw3NeInq8LygEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNaSnLxf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNaSnLxf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22EC1F000E9;
	Wed, 17 Jun 2026 05:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781672750;
	bh=uF85A4m2k+ia/mLH+IDORDXI3VbsUUE1nGO84e7Sukg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SNaSnLxfIKvbkTRXgYvp6MVEszK+IVNwpoDQuRX25QexOYNMOO+pczli5ZprcSqca
	 wl7+F0RcBGNj/w1c00EHg+LoQTEbAvZgpr9WCby1xqQrHOWBQ3zSZI0y5sDHOFRD6+
	 o7ZrjE+spKDbdJAZmXrv3U7nydsE4rjQ4xLzWK5yLjpawG4SVt7lxyWMqJg4DZawAI
	 21NR9eTqWCnnMr/A3Ff6pQXWYnXLHN0PARBeZlJtGwhHSMcU92jmZkNtpxDPzNIhbH
	 h9JrrXpftfNUmUA/Ibs+5hSKyTpq43+fE1CIDjcFkSulRgubcfa8DPvVIQ5cYAFit+
	 GvqgivXEtP8VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/6] i2c: qcom-geni: Move resource initialization to
 separate function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-3-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
 <20260617-enable-i2c-on-sa8255p-v7-3-ad736dbeab57@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 05:05:50 +0000
Message-Id: <20260617050550.B22EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] Build failure due to undefined GENI SE resource initialization=
 and PM functions
- [High] GPI DMA channels are permanently leaked on probe failure.
- [High] Asynchronous pm_runtime_put() is canceled by pm_runtime_disable() =
on probe error paths, leaking power.

Pre-existing issues:
- [High] Missing synchronous suspend before disabling runtime PM during dev=
ice removal.
--

commit 3d26b1870da68dc53ac527a03242c49f148d835f
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

i2c: qcom-geni: Move resource initialization to separate function

Refactor the resource initialization in geni_i2c_probe() by introducing
a new geni_i2c_resources_init() function and utilizing the common
geni_se_resources_init() framework and clock frequency mapping, making the
probe function cleaner.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 3ee0be228d7c1..a7672b6c2bc07 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[ ... ]

> @@ -1058,6 +1055,23 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>  	return ret;
>  }
> =20
> +static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
> +{
> +	int ret;
> +
> +	ret =3D geni_se_resources_init(&gi2c->se);

[Severity: Critical]
Are we sure this function is available in the current tree? It appears
geni_se_resources_init() is undefined, which might cause a build failure.

> +	if (ret)
> +		return ret;
> +
> +	ret =3D geni_i2c_clk_map_idx(gi2c);
> +	if (ret)
> +		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n=
",
> +				     gi2c->clk_freq_out);
> +
> +	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
> +				  Bps_to_icc(gi2c->clk_freq_out));

[Severity: Critical]
Is geni_icc_set_bw_ab() defined? Similar to the call above, it looks like t=
his=20
is an unresolved symbol that could break the build.

> +}
> +
>  static int geni_i2c_probe(struct platform_device *pdev)
>  {
>  	struct geni_i2c_dev *gi2c;

[ ... ]

> @@ -1101,16 +1105,15 @@ static int geni_i2c_probe(struct platform_device =
*pdev)
>  	if (gi2c->irq < 0)
>  		return gi2c->irq;
> =20
> -	ret =3D geni_i2c_clk_map_idx(gi2c);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Invalid clk frequency %d Hz\n",
> -				     gi2c->clk_freq_out);
> -
>  	gi2c->adap.algo =3D &geni_i2c_algo;
>  	init_completion(&gi2c->done);
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
> =20
> +	ret =3D geni_i2c_resources_init(gi2c);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
Does this probe function properly clean up resources if it fails later on?

If the subsequent call to i2c_add_adapter() fails later in geni_i2c_probe(),
the function returns without freeing the DMA channels that were allocated
during geni_i2c_init() via setup_gpi_dma(). Could this permanently leak the
GPI DMA channels?

[Severity: High]
Is there a risk of leaking power during probe error handling?

If geni_i2c_init() or i2c_add_adapter() fails, geni_i2c_probe() calls
pm_runtime_disable() immediately. However, geni_i2c_init() queues an async
pm_runtime_put() in its own error path. Since pm_runtime_disable() cancels
any pending async suspend work, does this leave the hardware indefinitely
powered on in the RPM_ACTIVE state?

[ ... ]

> @@ -1260,8 +1246,6 @@ static const struct dev_pm_ops geni_i2c_pm_ops =3D {
>  };
> =20
>  static const struct geni_i2c_desc i2c_master_hub =3D {
> -	.has_core_clk =3D true,
> -	.icc_ddr =3D NULL,
>  	.no_dma_support =3D true,
>  	.tx_fifo_depth =3D 16,
>  };

[Severity: Critical]
Does this patch series introduce undefined power management functions here?

It appears the i2c_master_hub struct is assigned geni_se_resources_activate
and geni_se_resources_deactivate for its power management fields, but these
functions do not seem to be defined anywhere in the kernel tree.

[Severity: High]
This is a pre-existing issue, but does geni_i2c_remove() properly quiesce
the device before tearing down power management?

The geni_i2c_remove() function calls pm_runtime_disable() without a prior
synchronization barrier. If an asynchronous suspend is pending from a
recently completed I2C transaction, the immediate pm_runtime_disable() could
cancel it. Should a call to pm_runtime_put_sync() or
pm_runtime_force_suspend() be added to ensure it is fully suspended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-enable-i2c=
-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com?part=3D3

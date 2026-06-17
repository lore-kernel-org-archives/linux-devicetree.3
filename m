Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7081434D4D6
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781672442; cv=none; b=ra9ksC/ivGEzRVgaY5Eya6dqilUlIntUwa3UDF8NAnYna2HrGp1DJjVRQNkkr9vcExeYDVo1D8CqH0shFZxJ0Acy1UVtSQWWWJRjsRHOk8yRHSnz+1KNjhV9xjhzKZnm7goKO0DtCHgnSAvsJHDdoeCNHcpFPdsdhP3kfKjUbIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781672442; c=relaxed/simple;
	bh=1ecGMvwsnIVyqRGZgxnJm8/iKN852N3s8u/EsVfKzuQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IQ3dQdZEBeXYlg9TjITc6UegHiVqU5MUU97/GorW51kRFyHRGcY64HgWMtme3GPO7AfohoMo1E0z4w7aLCIbgRWPjJTC0lkvxmjieYkWmVO4NFKDXEifbuCaROyKSdmsZTy38qT/T4cIu5Y50luhrm+0qwD0eY7+foq7IisKqps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPvtL/Hi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPvtL/Hi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657DA1F000E9;
	Wed, 17 Jun 2026 05:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781672432;
	bh=WSaNJqmJ6vO68nEyMH4T2J45+FxBFfuOsFbSAVRjyLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hPvtL/HiPpPBDoOUD4a68XvHOeO8GO/n0tkPHfDMa1EKogaZiIsVRWqNHEcSqIDns
	 4/rm9XJW3sMyac+W8i33yzCL8GRj2Z4xuFbJIkzpp/SCGN0G6Arkx9Mg9nb1fZsugf
	 rx9t8VNLOMJIhf+RwKrsKtd4xW9d1eWvrKro1KzwHbQjVUd9UUmQMQpYoKyjC+Usv3
	 e68X2/LQ9+PeyyLuggqrHkBsE3NacrDIIKD7ECvHzajAoF3y4pVJSVReLcytnV/iVm
	 iyA4f41d7aCT7RyGGUWCr0l658+533ewpEOhOluXrzZaqmuBNyrhIxH8pmyjl4LHaA
	 ybDyoj/udKlEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/6] i2c: qcom-geni: Isolate serial engine setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-2-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
 <20260617-enable-i2c-on-sa8255p-v7-2-ad736dbeab57@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 05:00:32 +0000
Message-Id: <20260617050032.657DA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Asynchronous pm_runtime_put() followed immediately by pm_runtime=
_disable() leaves hardware permanently powered on during probe failures.
- [Medium] DMA channels allocated during hardware initialization are perman=
ently leaked if I2C adapter registration fails.
--

commit 111d823f58de8c30c14ab44aa8466c66a5e8d761
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

i2c: qcom-geni: Isolate serial engine setup
   =20
Moving the serial engine setup to geni_i2c_init() API for a cleaner
probe function and utilizes the PM runtime API to control resources
instead of direct clock-related APIs for better resource management.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index d2f5055b0b108..3ee0be228d7c1 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -990,10 +990,77 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
>  	return ret;
>  }
> =20
> +static int geni_i2c_init(struct geni_i2c_dev *gi2c)
> +{
> +	const struct geni_i2c_desc *desc =3D NULL;
> +	u32 proto, tx_depth;
> +	bool fifo_disable;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(gi2c->se.dev);

[ ... ]

> +	if (fifo_disable) {
> +		/* FIFO is disabled, so we can only use GPI DMA */
> +		gi2c->gpi_mode =3D true;
> +		ret =3D setup_gpi_dma(gi2c);
> +		if (ret)
> +			goto err;

[ ... ]

> +err:
> +	pm_runtime_put(gi2c->se.dev);
> +	return ret;
> +}
> +
>  static int geni_i2c_probe(struct platform_device *pdev)
>  {

[ ... ]

>  	pm_runtime_set_suspended(gi2c->se.dev);
>  	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
>  	pm_runtime_use_autosuspend(gi2c->se.dev);
>  	pm_runtime_enable(gi2c->se.dev);
> =20
> +	ret =3D geni_i2c_init(gi2c);
> +	if (ret < 0) {
> +		pm_runtime_disable(gi2c->se.dev);

[Severity: Medium]
If geni_i2c_init() fails, it drops its runtime PM reference using the
asynchronous pm_runtime_put(). Will calling pm_runtime_disable() right
afterwards cancel the pending suspend work, leaving the device in the
RPM_ACTIVE state and leaking power resources?

> +		return ret;
> +	}
> +
>  	ret =3D i2c_add_adapter(&gi2c->adap);
>  	if (ret) {
>  		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
>  		pm_runtime_disable(gi2c->se.dev);
> -		goto err_dma;
> +		return ret;

[Severity: Medium]
Does this code leak the DMA channels if i2c_add_adapter() fails?

Before this patch, a failure here would jump to err_dma which called
release_gpi_dma(gi2c). Now it returns directly, but geni_i2c_init()
may have successfully allocated the DMA channels via setup_gpi_dma().

Additionally, similar to the check above, will pm_runtime_disable() cancel
the async suspend from the successful geni_i2c_init() path, leaving the
hardware powered on?

>  	}
> =20
>  	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-enable-i2c=
-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com?part=3D2

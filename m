Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD8333ADB1
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 17:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779532; cv=none; b=n+RpreqSaktcAht0sZitZT4Ced+4KY3oaMf9Xjahp6eQTw2Rekdnw4HtWC51+OvxlfjTDNN+iHvI/vlZ52/V2HXIXUFXkYg97qra+J8/iLox7vw/ZahnGKeDwBOVfpqhZXAfB+UNcfd9An1kzEKDDif3pCuJ1ubyjPzug2PPy0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779532; c=relaxed/simple;
	bh=RAzKUJQQdCXQwpQLwuNDooiftAgzwQ0h98pyvNZJLxk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k76B3RpNsSWmQjsHd51Uo0Ui3nmKJzbIokekzdSWxEjBVXl9qAPczmiSSu2u6PbT8U8ThnDAGxK5s6LMkktrwvbhceY0yngjUbdOlGHb4rVAqkqduAxB8Qj6uPfZa+PtoUmLtc9uZ8DgnEVY69PMJax+rIKjx4VgvOEXsh5WFZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fgAF6riY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fgAF6riY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7817BC2BCB3;
	Thu, 14 May 2026 17:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778779532;
	bh=RAzKUJQQdCXQwpQLwuNDooiftAgzwQ0h98pyvNZJLxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fgAF6riYe9eaFdowy2LwKVLxTGLu8kltprm8JHE+SYyIFLLxpaggucCVGWEUuLefP
	 7PtCTDffwNL3I1D5QxuEgmas2OSTEsqZ4ahH3iMsdYkDY7xkz/37CY/gp1QHXz2bpt
	 1Nep2Fqh9V/m+VEk57BtSc/akTJxoovNd2wLHGlEuVqRT/Ibjriutc5S7f9iNT2r+9
	 3HUm5y6YTcRPhCIkqazGaPs3WZ4buJi3hjiEsmU6RzdcW5Bsj42MBvUEloC9I0nnEi
	 LcSCFXhKSrIDneqcu6rzn2nIwPWOLAoSBQpVw2WB/dBS7nWkjqXNoxkxg1NcxNvyCE
	 Uj4EfF8GkzAzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: spm: Add MSM8960 SAW2 CPU support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rudraksha Gupta via B4 Relay" <devnull+guptarud.gmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514-expressatt_cpufreq-v1-2-487fd2d78859@gmail.com>
References: <20260514-expressatt_cpufreq-v1-2-487fd2d78859@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 17:25:30 +0000
Message-Id: <20260514172531.7817BC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Probe will panic or Oops due to a division by zero in spm_register=
_regulator() when computing drv->volt_sel.
--

commit 4745d4815a10beefae8a9bba0dd4e906c2f9bd24
Author: Rudraksha Gupta <guptarud@gmail.com>

soc: qcom: spm: Add MSM8960 SAW2 CPU support

The MSM8960 uses SAW2 v1.1, the same hardware version as the APQ8064. This
adds SPM register data to program the correct SPM sequences and PMIC
parameters for MSM8960 CPUs.

Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b5=
6847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3353-L=
3381

> diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
> index f75659fff2874..596431b00a03e 100644
> --- a/drivers/soc/qcom/spm.c
> +++ b/drivers/soc/qcom/spm.c

[ ... ]

> @@ -501,6 +517,8 @@ static const struct of_device_id spm_match_table[] =
=3D {
>  	  .data =3D &spm_reg_8974_8084_cpu },
>  	{ .compatible =3D "qcom,apq8064-saw2-v1.1-cpu",
>  	  .data =3D &spm_reg_8064_cpu },
> +	{ .compatible =3D "qcom,msm8960-saw2-v1.1-cpu",
> +	  .data =3D &spm_reg_8960_cpu },

Will adding this compatible trigger a division by zero during device probe?

While this issue wasn't introduced by this patch, probing this device revea=
ls
a division by zero in spm_register_regulator() when computing drv->volt_sel:

drivers/soc/qcom/spm.c:spm_register_regulator() {
    ...
	rdesc =3D devm_kzalloc(dev, sizeof(*rdesc), GFP_KERNEL);
	if (!rdesc)
		return -ENOMEM;
    ...
	drv->volt_sel =3D DIV_ROUND_UP(drv->reg_data->init_uV - rdesc->min_uV,
				     rdesc->uV_step);
    ...
}

Because rdesc is allocated using devm_kzalloc(), all of its fields are zero.

Since rdesc->uV_step is never explicitly initialized before this operation,
does it remain 0, causing a panic?

The subsequent call to linear_range_get_selector_high() correctly computes
the selector and overwrites drv->volt_sel.

Is it possible that the older DIV_ROUND_UP() calculation was left in place
by mistake and needs to be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-expressatt=
_cpufreq-v1-0-487fd2d78859@gmail.com?part=3D2

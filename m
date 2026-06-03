Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0B3395ADB
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500618; cv=none; b=OUgo0Iatgq/TYAe3ldpG0eF+y9VRg8Q1Txog6e4ss3903X1WndashmtuA6SOt+6x2TeVmncvpGjcdAxF8VHQwlhMVIv4Zd9/8K9nz9VyQvBKgKnDbLj1WMgoFWMdF0ln6oDaNIZIfRArIHWyhWtmEIG23y3HQIGHOJYLsB7w5i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500618; c=relaxed/simple;
	bh=mENMM6mU75ZzVtKjQnezceZflQVLLHtxWrSqrurDhmY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C6WB3LMMuEn+1RxJIZnr5Hf8Kl+sLLZmgenjiVortKfOnqlguGkQON/cS1BcZMfvSiKwpnZSfGsfMlwqJ5EhzzPxtodOGmPDccYEmWF+1rUxd//5wfVAREqVDzl4oLuP11HdH2rVTkyzWae8kIUXq4sszKLMvr8sipovpn3ORy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCgt/yhr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCgt/yhr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9AA1F00893;
	Wed,  3 Jun 2026 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500613;
	bh=4EyPZcO1tgyA2UyfAQB+zU3gSVrMKhLEMW8gwp/RrS0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QCgt/yhr4KSKorX8FGGlRftOluxVJmBorv+45s0LhTzokJ2AB0R7nHZUJzHq42LX4
	 yBObpbdjexHK7/1Cny34pgNB/55AasC6JmGii0rJIGmUP0V6CRCnaR16dtWdvFBYLR
	 xWL6X9CvILqiI4GE82IHatsLLJUVZg8XLtXjp/b8OxKtGxHeCIdsH1FBCVkINPm5Wf
	 O9JuGmoCcSjXaM0cosgc1VmbOKQ4mJtnIzewL6CQzhleOw8EeUEPSJR1bfHWc83Gmj
	 72DY1ozegPLyfjxfQrqEFKn0LIbo6w39PIpfT64dxIYRAADBTws1dqG7IlA2zVlAt0
	 qzyHTKbsTunSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] soc: qcom: ubwc: Add Shikra UBWC config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260603-shikra-display-v1-4-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-4-aeac1b94faa7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:30:12 +0000
Message-Id: <20260603153013.2C9AA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Assigning `no_ubwc_data` to the modern DPU-based Shikra platform c=
auses an integer underflow in the MDSS display driver. `no_ubwc_data` zero-=
initializes `.highest_bank_bit`. For older MDP5 platforms, this is safe bec=
ause `msm_mdss_enable()` skips UBWC setup entirely. However, Shikra is a mo=
dern DPU platform (MDSS HW ver 6.5), so `msm_mdss_enable()` unconditionally=
 calls `msm_mdss_6x_setup_ubwc()`. This function executes `MDSS_UBWC_STATIC=
_HIGHEST_BANK_BIT(data->highest_bank_bit - 13)`. With `highest_bank_bit =3D=
=3D 0`, this underflows to `-13`, writing garbage configuration bits to the=
 `REG_MDSS_UBWC_STATIC` hardware register. Additionally, this introduces a =
latent kernel panic: if an Adreno GPU driver is later enabled for Shikra, `=
a6xx_set_ubwc_config()` will trigger an unconditional `BUG_ON(cfg->highest_=
bank_bit < 13)` during probe. The correct approach for modern platforms wit=
hout UBWC is to supply a dummy configuration with `.highest_bank_bit >=3D 1=
3` (as seen in `qcm2290_data` which sets it to 15).
--

commit 75083d2d954151a192078564961f45c04709ad91
Author: Nabige Aala <nabige.aala@oss.qualcomm.com>

soc: qcom: ubwc: Add Shikra UBWC config

Add UBWC configuration for the Shikra platform. Shikra has no UBWC
support and no highest_bank_bit setting, so use no_ubwc_data.

> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_confi=
g.c
> index 3fe47d8f0f638..01dca97e26714 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] =
__maybe_unused =3D {
>  	{ .compatible =3D "qcom,sdm660", .data =3D &msm8937_data },
>  	{ .compatible =3D "qcom,sdm670", .data =3D &sdm670_data, },
>  	{ .compatible =3D "qcom,sdm845", .data =3D &sdm845_data, },
> +	{ .compatible =3D "qcom,shikra", .data =3D &no_ubwc_data, },

[Severity: High]
Will using no_ubwc_data cause an integer underflow on modern DPU platforms?

The no_ubwc_data structure zero-initializes the highest_bank_bit field.
Because Shikra is a modern DPU platform, msm_mdss_enable() unconditionally
calls msm_mdss_6x_setup_ubwc() in drivers/gpu/drm/msm/msm_mdss.c, which
performs this calculation:

    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);

If highest_bank_bit is 0, this results in -13 and writes corrupted bits
to the REG_MDSS_UBWC_STATIC hardware register.

Additionally, will this configuration trigger a kernel panic if an Adreno
GPU driver is later enabled? In a6xx_set_ubwc_config(), there is an
unconditional check:

    BUG_ON(cfg->highest_bank_bit < 13);

Should this platform instead use a dummy configuration with highest_bank_bit
set to a value >=3D 13, similar to how qcm2290_data sets it to 15?

>  	{ .compatible =3D "qcom,sm4250", .data =3D &sm6115_data, },
>  	{ .compatible =3D "qcom,sm6115", .data =3D &sm6115_data, },
>  	{ .compatible =3D "qcom,sm6125", .data =3D &sm6125_data, },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-shikra-dis=
play-v1-0-aeac1b94faa7@oss.qualcomm.com?part=3D4

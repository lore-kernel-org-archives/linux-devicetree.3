Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D63F3E275E
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338800; cv=none; b=klIrD+BDaJa6wyJRYOCHY0PuSF7+BWgkCEgdX5tYSASXladBkgRzRM51gMCVPIGXCDIRfc2JF14LqbTnYbRNyntPUzbJvSi4z5KcMylNC8HjQo1bJhPobqbdFxSwALb3ueVsldJ7ti8MTwkfs9Yfz5jEz7NXDUsFEvgQkrhZ8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338800; c=relaxed/simple;
	bh=f/vCH9VA3NzXXwFY+sjJ0XiydfNeCokaHArcoS+ecOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JKUkAcwPE2jnDCKBNDMuz5vSvrLDmOTrgolcST6eFTxHtOzYOaj/cnZK/F+8nepAXgA3A7ZmVwZ4cN6e5LecUXHaRez5VY3KXHpu81Jkl53MIMB1qYlkyE5qTCVDBBwL7AEIYO8kHigIGNDKd8aCVfdnUaA3KMIhOEm1iXxupvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwkBb+hC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwkBb+hC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD831F00893;
	Mon,  1 Jun 2026 18:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780338799;
	bh=2ktf/DWzdm+IvNrCWI63DdRQHcd5cCX4ECD7x6FbSCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GwkBb+hCLpymLUcUPidLKPIdMf0/73UtpgJ4AQdzpXY7wrswqSLGp8y7DpD05gddi
	 +E1rtxbvaJwaas87o1eW/loSaOCCuCoSDL0b9pS5ueFM2YA6ID9dkdD1uMSYu+FwO1
	 twtoeWkdwOzq9/3LqoqR1q0g9Wxg6lYJye81/244ku7fkrmT5VbEYUAFp4uvUgI+CN
	 BWFY+uZ+9b4DjSLpjDtmQ75MZecvtY9CZZAXJNAsSyqzb2XTSSkW75lT7v98PRXc5O
	 ZAcA/i6BgAHMquxGBI3pGhw16hnPTKUhyeFh4YnsjStx1XAABMDN+SFNdXCWd2pBI9
	 nysfIHyk+pP3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/12] clk: qcom: dispcc-qcm2290: Update GDSC
 *wait_val values and flags
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-7-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-7-61c1ba3735e8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 18:33:18 +0000
Message-Id: <20260601183318.CDD831F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch incorrectly replaces `HW_CTRL` with `HW_CTRL_TRIGGER` =
for the MDSS GDSC, permanently disabling hardware control because the DRM M=
SM display framework does not implement dynamic hardware mode switching.
--

commit 6116e813ca331d00d8d79cfead6907de56f2475b
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: dispcc-qcm2290: Update GDSC *wait_val values and flags

This commit updates the QCM2290 DISPCC GDSC wait_val fields to match
hardware defaults and modifies GDSC flags. It adds flags to retain
registers, poll for CFG GDSCR, and dynamically switch between HW/SW modes.

> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-=
qcm2290.c
> index f5dbd19d0a033..4c1eef79f41b6 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -468,11 +468,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_=
resets[] =3D {
> =20
>  static struct gdsc mdss_gdsc =3D {
>  	.gdscr =3D 0x3000,
> +	.en_rest_wait_val =3D 0x2,
> +	.en_few_wait_val =3D 0x2,
> +	.clk_dis_wait_val =3D 0xf,
>  	.pd =3D {
>  		.name =3D "mdss_gdsc",
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
> -	.flags =3D HW_CTRL,
> +	.flags =3D HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,

[Severity: Medium]
Does replacing HW_CTRL with HW_CTRL_TRIGGER here permanently disable hardwa=
re
control for the MDSS GDSC?

The HW_CTRL flag statically enables hardware mode during power-on. By chang=
ing
this to HW_CTRL_TRIGGER, hardware mode is disabled by default and must be
explicitly enabled by the consumer driver via dev_pm_genpd_set_hwmode().

Since the DRM MSM subsystem doesn't invoke dev_pm_genpd_set_hwmode(), will
the MDSS GDSC remain indefinitely in software mode, breaking hardware-manag=
ed
power scaling?

>  };
> =20
>  static struct gdsc *disp_cc_qcm2290_gdscs[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-shikra-dis=
pcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com?part=3D7

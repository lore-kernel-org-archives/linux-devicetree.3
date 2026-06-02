Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD02280CE5
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 04:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780373853; cv=none; b=C2Xd22rh4gqfZvJ7gBB7J+aLp2chRb9mUUOZCV45pQGfqpkXBwQVgh7ZrfR6/TVuMbrqChKET7U5mRu0buykZy83k0zmLbI0Sjak2JTHQRgUe3zhPRzTAxWCrnI6rToUGigg7fCRFcbqoTwrIkWeGk9mO6kPZml0qVPayihdRDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780373853; c=relaxed/simple;
	bh=eXm/IAvqJb9l8A9hBtw8yR27Wy8mEble9YaSK4/HQLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ohg8+ii+l4qHcqNoCm0z3oOg3FZ9dIN9OTqnphpOz7HGA6vZL55LPAjBVOQVkpaB9QMU/q/s/sR96JUWsOZiUNNrhYeQwgaHP6goCH3efuDrM1KBR82jWAd3snb7rMlOZLTrt1CdW5QXDZOrtPsRD/nhk7CymZhjZ8zB+Vi7rjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvxAxM1d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvxAxM1d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A2A1F00893;
	Tue,  2 Jun 2026 04:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780373851;
	bh=XprDdVT0IobfOVFWw0vu+4j3qm9dN1b/wWz7l5J0QjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WvxAxM1dLPPiG2XFQesaSabeg5r1KB/UoF7k45QiB3uN29G2V4cinFE9Y3ZDWwQYD
	 7gqIxV+WxkUh0G65p5IVb+FjFRfjrAG/Xcpz/qs1CnRT7tlU9o4nEyRKT/LyU1ZLE+
	 dwtsNjycwv/pj44GRPqI0I4vSlOwHUi0U9esgW9sBSe8hrt7epFowuaJpP1HTZXX7i
	 7QdJjOgTemns7jogFMoh/mr8appIHG+p5sgZX0XiUnky+8jp9GZowmBmDpA73Mz5WO
	 LHykPauZZKkHl8AVsdisCeDhKht4N1u7s+v90UfXIy7SKML+FyouKtXAIEj767QA/V
	 60NC6EWxXfE6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: tas2781: Add TAS2573 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baojun Xu" <baojun.xu@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260602035322.5029-2-baojun.xu@ti.com>
References: <20260602035322.5029-2-baojun.xu@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 04:17:31 +0000
Message-Id: <20260602041731.93A2A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] TAS2573 is incorrectly handled in calibration paths, leading to an=
 out-of-bounds array read, garbage I2C writes, and a completely broken 'Cal=
ibration Start' feature.
--

commit 1b9d7a08e2f73c048345d48ae6d05ec08133fcc8
Author: Baojun Xu <baojun.xu@ti.com>

ASoC: tas2781: Add TAS2573 support
   =20
The TAS2573 belongs to the TAS257x device family, featuring an integrated
DSP and IV sensing capability.

> diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2=
c.c
> index 620ed4ef577da..a400bf3e10854 100644
> --- a/sound/soc/codecs/tas2781-i2c.c
> +++ b/sound/soc/codecs/tas2781-i2c.c

[ ... ]

> @@ -1736,6 +1738,7 @@ static void tasdevice_fw_ready(const struct firmwar=
e *fmw,
>  	if (tas_priv->fw_state =3D=3D TASDEVICE_RCA_FW_OK) {
>  		switch (tas_priv->chip_id) {
>  		case TAS2563:
> +		case TAS2573:

[Severity: High]
Since TAS2573 features an integrated DSP, it bypasses the early exit in
tasdevice_fw_ready() and proceeds to tasdevice_create_cali_ctrls(). Does th=
is
cause problems in the calibration paths?

In tasdevice_create_cali_ctrls(), since the chip_id is not TAS2781, TAS2573
falls into the else block and is allocated an 11-element backup array:

sound/soc/codecs/tas2781-i2c.c:tasdevice_create_cali_ctrls() {
    ...
    } else {
        cali_ctrls =3D (struct snd_kcontrol_new *)tas2563_cali_controls;
        nctrls =3D ARRAY_SIZE(tas2563_cali_controls);
        for (i =3D 0; i < priv->ndev; i++) {
            tasdev[i].cali_data_backup =3D
                kmemdup(tas2563_cali_start_reg,
                sizeof(tas2563_cali_start_reg), GFP_KERNEL);
    ...
}

However, the kcontrol callbacks for calibration rely on hardcoded chip ID
checks that do not account for TAS2573. In tas2563_calib_start_put(), it
unconditionally returns -1 for any chip other than TAS2563, breaking the
calibration start feature:

sound/soc/codecs/tas2781-i2c.c:tas2563_calib_start_put() {
    ...
    if (tas_priv->chip_id !=3D TAS2563)
        return -1;
    ...
}

Furthermore, when userspace triggers 'Calibration Stop', tasdev_calib_stop_=
put()
checks for TAS2563 and mistakenly routes TAS2573 to tas2781_calib_stop_put(=
):

sound/soc/codecs/tas2781-i2c.c:tasdev_calib_stop_put() {
    ...
    if (priv->chip_id =3D=3D TAS2563)
        tas2563_calib_stop_put(priv);
    else
        tas2781_calib_stop_put(priv);
    ...
}

This results in tas2781_calib_stop_put() looping over 13 elements from the
11-element array allocated for TAS2573. This out-of-bounds read leads to
garbage memory being interpreted as register addresses, lengths, and values,
which are then written over I2C, potentially corrupting the chip state or
hanging the I2C bus.

Could the calibration functions be updated to handle TAS2573 properly?

>  		case TAS2781:
>  		case TAS5802:
>  		case TAS5806M:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602035322.5029=
-1-baojun.xu@ti.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF0C3E51EC
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142339; cv=none; b=bgBPmPzYd1iOFzGb2ZQzSs/88weBagTDRR2lnCE433qHWvR5kUtIp0fOvHqDfv8Nc9Em0yV6JrbkVuLatOF5lRlxCI7EpoGfcsw2TFSrK8Ci3RcW56YtY2ZBDeZgD2FrolvutRj2lOds9W4Llr53WPmTv07VHYOtmZ56H58dyik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142339; c=relaxed/simple;
	bh=jUVXC3BCTXF0ikrz/oSJsrw2GFb4kYCwXWEusnJZ9GM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dWlwu4DWEZGQK9lyntkXleD3Iwg11YXNAVSMx5Jnn67sD/KW8cDSz1QsKiGanp4AYtYmuxFl+WEO1ndBCd8HGekYqxIz/SC1wQJieMvZ78nZxDxfhzu6nA6oHBSuGq0XSKyZ7LqkRMZRl9HQT9Jd1HcqdhlxApz0GgdHdvgCxK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7Ms+Eyk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7Ms+Eyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145ED1F000C4;
	Fri, 16 Oct 2026 09:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792142338;
	bh=FtW3aFrXJ9RwQm/j6wwjJ4Kfn7CZ6oF/n86t6Gc6TbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z7Ms+EyklJ4Fni6BjwqL2fFwGMJF/bFw4ls7t5ezc5EFtzIWEIt/E2Hwprz3D7yTn
	 J1RRDRNivFmWLbJgTkyFa2DIWc/o0gxntH4/nCpHqDxE3021kSr8vcrzHnzUBfc4Jt
	 b3I6+0nemWvukOhQ/Cs2h/5rJ0jnjkRln0UVcwcRuWJCcyTecvtX5dWF3DHZ89jSu+
	 oKXqRd0B2vj+Hv/3QxTNTX703IqkZq00Y30YPDHdClhiUQPGh1Ox/DD8AZGxX5QR+/
	 HVCwsbQf/j8c3Z9r3AnNbmsQn9fZL4wvWtt6FXmYwa+ybKpZnTSPsAe5qqBPX2Bs/Z
	 zOdOpakqdhAmQ==
Message-ID: <sashiko-outbox-174067@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: i2c: dw9719: Add DW9714VA support
Reply-To: sashiko-reviews@lists.linux.dev
To: wyibo6109@gmail.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261016090930.947830-2-wyibo6109@gmail.com>
References: <20261016090930.947830-1-wyibo6109@gmail.com>
 <20261016090930.947830-2-wyibo6109@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 09:18:57 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: dw9719: silent truncation of DW9714VA default SAC mode
--

commit 4fa9a1b834161c5e052c734eb425a78a00978e18
Author: Yibo Wang <wyibo6109@gmail.com>

    media: i2c: dw9719: Add DW9714VA support
   =20
    The dongwoon,dw9714va compatible names the DW9714V revision found on
    the OnePlus Pad 4 ("iceland") rear camera module.  DW9714VA is a
    coined name, not an official part number; the revision shares its
    IC INFO id (0xFE) with the other DW9714V revisions.

> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index 3b7ba88fd67c0..2afe37361bff3 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c

[ ... ]

> @@ -153,6 +163,16 @@ static int dw9719_power_up(struct dw9719_device *dw9=
719, bool detect)
>  			return ret;
> =20
>  		switch (val) {
> +		case DW9714V_ID:
> +			dw9719->model =3D DW9714VA;
> +			/*
> +			 * No SAC tuning data exists for DW9714VA modules in
> +			 * general; start from the family defaults and let DT
> +			 * provide the module-specific values.
> +			 */
> +			dw9719->sac_mode =3D DW9719_DEFAULT_SAC;
> +			dw9719->vcm_freq =3D DW9719_DEFAULT_VCM_FREQ;
> +			break;
>  		case DW9719_ID:
>  			dw9719->model =3D DW9719;

[ ... ]

> @@ -188,6 +208,7 @@ static int dw9719_power_up(struct dw9719_device *dw97=
19, bool detect)
>  	}
> =20
>  	switch (dw9719->model) {
> +	case DW9714VA:
>  	case DW9800K:
>  		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
>  		cci_write(dw9719->regmap, DW9719_MODE,
>  			  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);

[Severity: Medium]
When the device tree does not provide a module-specific SAC tuning via the
dongwoon,sac-mode property, the driver defaults dw9719->sac_mode to
DW9719_DEFAULT_SAC (4) for the DW9714VA model.

Does writing this default value to the DW9719_MODE register cause a truncat=
ion?

When dw9719->sac_mode (4) is shifted by DW9800K_MODE_SAC_SHIFT (6), the res=
ult
is 256 (0x100). Because DW9719_MODE is an 8-bit register, the value will be
silently truncated to 0 when cci_write() copies it to an 8-bit buffer:

drivers/media/v4l2-core/v4l2-cci.c:cci_write() {
    ...
	switch (len) {
	case 1:
		buf[0] =3D val;
		break;
    ...
}

Could this result in an unintended hardware configuration being applied?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016090930.9478=
30-1-wyibo6109@gmail.com?part=3D2

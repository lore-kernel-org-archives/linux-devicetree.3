Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636B47ECDF
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332818; cv=none; b=KZPA5DbEvDb2P/hDpPrvBwosvfXIkNXz8JkltEIjjqmqovacyi2t252X/ms3ldwN3t3l7gmtQf4l+dBAp0M/k25Odl4/b33qSON0LuKjxzq9W+QH0nX03wuPvo03T4T0o6fesHOQO68lidAdi1HBr/vcCuVNvSx2dI+7aLUK+/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332818; c=relaxed/simple;
	bh=bHs5MXmiibyX2pgXn4/nqKzswg3+z6mzRTKbjueUmHs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c5Ep8OnAfSlfY0E547aRCIhwLNlqysIKdT0qJ6w/XFQjOjKchyWdbFM2U9iDU/Lb+N7XIUgfal0YbF7NNLMCExFo/jxnvoH897GIq3zLjsxRWic/JbYlRYxK+WH0B8gl43Du2zgg8gpTb/zP7Yt3C3Q4mJ2hFYdlonladyQvhUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzZWz0s1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzZWz0s1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C231F000E9;
	Wed, 29 Jul 2026 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785332816;
	bh=R1v4W1KHbtTQH3TjC+BruYDcTSFebXS95u7mtKdWbTg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JzZWz0s1FL0IY8Di85K/wSLzI76WA5pzHY9BjbvlJ8kuOm8UyUg/lC3QnY/zeUmlB
	 R4C37vYF+8y6IwsNoyXzGV/2synyIwkDJ6vjC6yG7Ekjcgqo0fekcodCOAsGawzHyo
	 r7GQONPQyStwilqGOtwHSH/PZoyd9XJ+fdeeTmQkTTvIdI1yCAl1c51NZddGZTOkbD
	 AWufvAC1sdrZsmP1bsz7LH5BMqkcVTVZQP7zAVjiQ3DSC/9eYjmDfM0b96Pdi+idgM
	 OvJr04oTaTNQgusJgvt9AFkWaHP6m213xHuP0WMnkcoc/YaeNjp6vDj1zKV4x4Q/iw
	 nY5TsIsnQXsKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: rockchip,gpio-bank: Add
 rockchip,grf property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
References: <20260729132736.3807082-1-sjg@chromium.org>
 <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 13:46:55 +0000
Message-Id: <20260729134656.24C231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added decoding for `DRV_TYPE_IO_LEVEL_2_BIT` in `rockc=
hip_get_drive_perpin()` exposes an overly broad pre-existing override, caus=
ing it to return corrupted drive strength values for 8-bit pins on RV1103B.
--

--- Patch [2]: [PATCH v3 2/4] dt-bindings: gpio: rockchip,gpio-bank: Add ro=
ckchip,grf property ---
commit b8824e91fa66d4af5685a314e266ea1b47feaa8a
Author: Simon Glass <sjg@chromium.org>

pinctrl: rockchip: Decode drive strength in the get function

This commit moves the decoding logic for 2-bit and 8-bit drive-strength
values from rockchip_set_drive_perpin() to rockchip_get_drive_perpin()
where it can actually be used to report configuration properly.

> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
-rockchip.c
> index 7e0fcd45fd265..08a46a04a8157 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
[ ... ]
> @@ -3267,6 +3267,25 @@ static int rockchip_get_drive_perpin(struct rockch=
ip_pin_bank *bank,
>  	case DRV_TYPE_IO_1V8_ONLY:
>  		rmask_bits =3D RK3288_DRV_BITS_PER_PIN;
>  		break;
> +	case DRV_TYPE_IO_LEVEL_2_BIT:
> +		ret =3D regmap_read(regmap, reg, &data);
> +		if (ret)
> +			return ret;
> +		data >>=3D bit;
> +
> +		return data & 0x3;

[Severity: Medium]
This is a pre-existing issue, but this newly added decoding exposes an
overly broad override earlier in rockchip_get_drive_perpin():

drivers/pinctrl/pinctrl-rockchip.c:rockchip_get_drive_perpin() {
    ...
    if (ctrl->type =3D=3D RV1103B && pin_num >=3D 12)
        drv_type =3D DRV_TYPE_IO_LEVEL_2_BIT;
    ...
}

Since that check does not restrict itself to a specific bank, such as
bank->bank_num =3D=3D 2, does it erroneously force Bank 0 and Bank 1 pins to
be evaluated as DRV_TYPE_IO_LEVEL_2_BIT?

Before this patch, DRV_TYPE_IO_LEVEL_2_BIT fell through to the default
case and safely returned -EINVAL. With this case now wired up, it silently
intercepts these pins and returns a truncated 2-bit value for 8-bit
register fields. Can this result in corrupted drive strength readbacks
for those other banks?

> +	case DRV_TYPE_IO_LEVEL_8_BIT:
> +		ret =3D regmap_read(regmap, reg, &data);
> +		if (ret)
> +			return ret;
> +		data >>=3D bit;
> +		data &=3D (1 << 8) - 1;
> +
> +		ret =3D hweight8(data);
> +		if (ret > 0)
> +			return ret - 1;
> +		else
> +			return -EINVAL;
>  	default:
>  		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
>  		return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729132736.3807=
082-1-sjg@chromium.org?part=3D2

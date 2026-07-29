Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9818D4C6EED
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332539; cv=none; b=ZInPd6tH7SzntK+8wormobxOUVEpC47ws19Xa8ExTGWOCRNtLbuzUKlEs6TEAXEib90xhzKSxr+QiYUw1fxly2uDZ2Hxh1i1B6ra3X/Ifws/MbVVWtjhVgzbSp8Q2g2ILl14UvGUuZfr0V8lFSn/5YXfbhQRordly9c1Xa7Aloc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332539; c=relaxed/simple;
	bh=237rCZECHH/jikjsuZyeOUXk5+9ExnW49QRjVK4+uy8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d9B4VubQiv6ZyLkB8RMh0G5QKbFp/v+WTqR3a9t5W2Z/6FQQKHVCSTWSXFbyLp+bTH365UVi41KkbWGThAaNBjxTZNDen4pOD2+ezN/yHYpeYskPkRyvI7p/IVFTG1Z3yJ3kSqd4k2pMMG3ygpF7ZhANxze76xWS2CU8kx47/CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHXQls+R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHXQls+R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF4B1F000E9;
	Wed, 29 Jul 2026 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785332538;
	bh=51q//qzgNPIz6N2X4J+Z+P3A3WQ3vAmyCCyC0Xf1pLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XHXQls+RCT8UugN+Mr/YY65TYP+fRcQRCtYmgIihGUVtHSzA1qQVEyMVhTD3ClW8H
	 BMnSR9ST304dPMCCSwbOUrJlFuAhNnrP4tToyVMFDtIglufh92vgUlE5BvEr0x/X/c
	 zGGaZqn95BpXYl6nHPsuLzvzT1cV1KWswCXlCgqpbyoHJOvF2kpo2QJ1JuDeMRLvr0
	 CT+uuwIKgq39/L8McvlC9eNeTcDdVPS4kt9mpByB72094GrQQyCYwHJYr4a8MZxEpC
	 aNXq0tdUppDMOnZ59Vm0UiBfWqf5fvYn2cLKgh3ZJNX40WbRcHQ0d6nSXAmP32TL1I
	 8shrC85ZPkcqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] pinctrl: rockchip: Decode drive strength in the
 get function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729132736.3807082-2-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
 <20260729132736.3807082-2-sjg@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 13:42:17 +0000
Message-Id: <20260729134218.1FF4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Activating a dormant bug: incorrect drive type override for RV11=
03B lacks a bank_num check, leading to silent data corruption for 8-bit pin=
s.
--

--- Patch [1]: [PATCH v3 1/4] pinctrl: rockchip: Decode drive strength in t=
he get function ---
commit b8824e91fa66d4af5685a314e266ea1b47feaa8a
Author: Simon Glass <sjg@chromium.org>

pinctrl: rockchip: Decode drive strength in the get function

This commit moves the decoding logic for 2-bit and 8-bit level
drive-strength values from the set function to the get function, where
it is actually utilized to report pin configuration properly.

> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
-rockchip.c
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
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
Does this new case inadvertently introduce a regression causing silent data
corruption for 8-bit pins on RV1103B?

Earlier in rockchip_get_drive_perpin(), there is an existing override:

	if (ctrl->type =3D=3D RV1103B && pin_num >=3D 12)
		drv_type =3D DRV_TYPE_IO_LEVEL_2_BIT;

This override lacks a check for bank->bank_num =3D=3D 2. This forces banks 0
and 1 (which have 8-bit drive types) to be evaluated as 2-bit.

Before this patch, the incorrectly forced 2-bit type safely dropped down to
the default block and failed with -EINVAL.

By intercepting DRV_TYPE_IO_LEVEL_2_BIT here and returning early, the
function will now silently return truncated values (data & 0x3) instead of
properly decoded 8-bit thermometer values for bank 0 and 1 pins >=3D 12 on
RV1103B.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729132736.3807=
082-1-sjg@chromium.org?part=3D1

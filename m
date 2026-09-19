Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9399A33937E
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789809310; cv=none; b=OnNo5+tqBEXXjIVlWNLqrQ/enRYP5xxsk3w2k4CIhnLY/yIt13nf55dLsgmOQDZ9uyrJcCAeqP8c10qJh/vGvNl5h9a+f2EMimHpkZ5ln94iOjqctsu8zAc/bACd/a9FabzeEQZQGJe1VT8gw//wwq7wR8nf8MXd85/qfaYDEUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789809310; c=relaxed/simple;
	bh=uMYQj4B7BAVt3j/6DJTUmKFEt9NzJR5ZQzsXjeOQPlE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ajjdcmfkb1ypovNEdEZMDUc1htkhjfa0sDcWoeDpJLpAng/uC4/JPlg7ANbVu+3zbSzjT2ximXzrzwvtWWJWENFrqDVb3lsoljkUG+8yUP82N4bJFMbmkYk2Bo4nwpl/z6Oo5AuQzieXbmVlRbH82PV6fwx3+5sYv3+NqNSZWhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2UYiqPd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2UYiqPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52A91F000FF;
	Sat, 19 Sep 2026 09:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789809309;
	bh=4NP0VFgvZGhrE8J4rZHBrod9CPgZWnONJGk4hbt1gTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b2UYiqPdRFuhfOOh+UsbGw6scGyVqOZ1ATGOUarEwDlztxCanWbFX7FjNHfWAUYLf
	 1P4spW+/EMpxnQxlRh5oKPMVMAL0UdRWcfQH7vS2JmChyyxvyvis88IueYj3+DbIDj
	 F+qzQzTZUZ9AJNlcUSWFpNsgSfLZcst4UW0QT/dy6/ciRiXIj7120Zryb+BF6KSYte
	 PUzp/ZV2lf4tUqiQWBnLHryZTZ/JUEgZEINOZAnX608FaTyiYerZaLhYnWN+08P3uM
	 1AKzFN0xx2tjAe7GZqxudldM+k8kIn5ZLkpWAHTu2xdQ4Owr3lTqdzpgMRIjAR8FEY
	 pteIxpD1hWklw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] i2c: designware: Add snps,dwc-i2c support and new
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Limaye" <a-limaye@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260919-tda54-upstream-i2c-v1-3-b0b9f77be18b@ti.com>
References: <20260919-tda54-upstream-i2c-v1-0-b0b9f77be18b@ti.com>
 <20260919-tda54-upstream-i2c-v1-3-b0b9f77be18b@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 09:15:08 +0000
Message-Id: <20260919091508.E52A91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] i2c: designware: unintended register write to offset 0x00 for SMBus
--

commit 756dafe564a9964f945795b25e2b59168e6adcc6
Author: Aniket Limaye <a-limaye@ti.com>

i2c: designware: Add snps,dwc-i2c support and new compatible

This patch adds register offset tables and bit layouts for the DWC_i2c IP
and registers it with a new MODEL_DWC_I2C flag. It handles variations in
interrupt acknowledgments, timing parameters, and capabilities checking.

> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/bus=
ses/i2c-designware-common.c
> index a21aeb7f415af..cc05c822aa56d 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -113,6 +113,41 @@ static const u32 dw_i2c_reg_offsets[DW_REG_IDX_MAX] =
=3D {
[ ... ]
> +static const u32 dwc_i2c_reg_offsets[DW_REG_IDX_MAX] =3D {
> +	[DW_REG_IDX_ENABLE]			=3D DWC_OPERATION_BLK_OFFSET + 0x04,
> +	[DW_REG_IDX_CAPABILITIES]		=3D DWC_OPERATION_BLK_OFFSET + 0x0c,
> +	[DW_REG_IDX_CON]			=3D DWC_I2C_BLK_OFFSET + 0x04,
[ ... ]
> +	[DW_REG_IDX_COMP_VERSION]		=3D DWC_DEBUG_BLK_OFFSET + 0x08,
> +	[DW_REG_IDX_COMP_TYPE]		=3D DWC_DEBUG_BLK_OFFSET + 0x0c,
> +};

[Severity: High]
Does this array lack an initialization for DW_REG_IDX_SMBUS_INTR_MASK?

Since this is designated to have the size DW_REG_IDX_MAX, any omitted
indices will default to 0x00.

[ ... ]
> @@ -536,8 +636,10 @@ int i2c_dw_init(struct dw_i2c_dev *dev)
>  	 * Mask SMBus interrupts to block storms from broken
>  	 * firmware that leaves IC_SMBUS=3D1; the handler never
>  	 * services them.
> +	 * For DWC-i2c, need to first check if SMBus is supported
>  	 */
> -	regmap_write(dev->map, dev->regs[DW_REG_IDX_SMBUS_INTR_MASK], 0);
> +	if (!(dev->flags & MODEL_DWC_I2C) || i2c_dwc_has_smbus(dev))
> +		regmap_write(dev->map, dev->regs[DW_REG_IDX_SMBUS_INTR_MASK], 0);

[Severity: High]
If a DWC_I2C hardware instance actually reports SMBus support via the
capabilities register, i2c_dwc_has_smbus() will return true and this will
attempt to mask the SMBus interrupts.

Because DW_REG_IDX_SMBUS_INTR_MASK is missing from dwc_i2c_reg_offsets,
could this unintendedly write the value 0 to the DWC_I2C block at register
offset 0x00?

Even if the TI TDA54 SoC doesn't support SMBus, this code is reachable for
other SoCs or configurations that might report the capability, which could
lead to unintended configuration changes or bus errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-tda54-upst=
ream-i2c-v1-0-b0b9f77be18b@ti.com?part=3D3

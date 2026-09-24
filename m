Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D2E224AF2
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294163; cv=none; b=YMtCwwk74BHcTvWT72OJL5R5VjJzXn9VXxqGXjGj2AMSYgvcPwenpZW5GiDGjEx7tDGkMND10txqmP/K3EWu12CxYpj6T5fHNHkNqme8EqZaBtt24Hf7QxyOt/XKKifg0Aw7b3p0fUV5Uxei9WVwuCp8N7ZH/au9v8dOktoriZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294163; c=relaxed/simple;
	bh=svoXdYSZRzb8B4HiB13yG+TqW7/aSQBenatZJkPYZo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nUMp9dv4il1GCd7B3IQbfqlIRS18CTq0F2b4Y7Ax9D/t9R+ZSV7wGs8x0H9W9zE9drzOPo6kRsjueTAsZUaf3sX7e9VDYT/A8ewuCCGuUAKuW0YFs7el7WKfWnDhLAj8fncpLpwd1h/KfVbnl7oxQQWiONfmH6mWsaXw7ywLcD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YA37WcNv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YA37WcNv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38D31F000FF;
	Thu, 24 Sep 2026 23:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790294162;
	bh=T8TLWelrEAtBSFgkpQh6afXe70tUSgkdcOLoQGnuc6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YA37WcNvYQBUKuRnXk5dmXSkHBXeeZd1gdYnkB216VdQl8vrKFADwJP4QA+qjyj1m
	 wYejtouq0E+zRzYilhs/tKYcJ0qw6xEDfpqd3a/kFM2scL0mOijjVvMVg5v4hsSvEr
	 fIcfL8lvksY7VFW/JQnx2Ax2mKMziuYGV5IAdNkZxWoessuygmZs8vdLqKo5S0Acz7
	 wTFR4h+8j24nrREvpqePg17Xx7jFXV95k0EjF2LN1q8sP+uAlUxqyusOzJxqWDdZ62
	 Va4JluUsbmK19G/jiIIe+n2QvjQ07VSoDR3LaiLujxQnQy2eJjYCLTLmUWQlb3yDd4
	 aWMZoGtQaWPCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] i2c: designware: Support per-variant reg/bit
 offsets and intr handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Limaye" <a-limaye@ti.com>
Cc: intel-xe@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260925-tda54-upstream-i2c-v2-2-261785e58493@ti.com>
References: <20260925-tda54-upstream-i2c-v2-0-261785e58493@ti.com>
 <20260925-tda54-upstream-i2c-v2-2-261785e58493@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 23:56:01 +0000
Message-Id: <20260924235601.A38D31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] i2c: designware: out-of-bounds MMIO access via debugfs on non-AMD =
models
--

commit 4dc8f1b4bfdf49722d6f1e25100bf25c45d88afb
Author: Aniket Limaye <a-limaye@ti.com>
Subject: i2c: designware: Support per-variant reg/bit offsets and intr hand=
ling

This commit refactors the DesignWare I2C driver to support per-variant
register offsets and interrupt handling. It converts DW_IC_* to a logical e=
num,
using a regmap to internally translate to physical offsets. It also moves t=
he
interrupt-acknowledgment pattern into a common helper driven by a per-varia=
nt
table.

Link: https://lore.kernel.org/r/20260919-tda54-upstream-i2c-v1-2-b0b9f77be1=
8b@ti.com/

> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/bus=
ses/i2c-designware-common.c
> index a1eca6cd4b75e..eeeb1f1892054 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -72,11 +72,55 @@ static const char *const abort_sources[] =3D {
[ ... ]
>  static int dw_reg_read(void *context, unsigned int reg, unsigned int *va=
l)
>  {
>  	struct dw_i2c_dev *dev =3D context;
> =20
> -	*val =3D readl(dev->base + reg);
> +	*val =3D readl(dev->base + dev->regs[reg]);
> =20
>  	return 0;
>  }
[ ... ]
> @@ -143,11 +189,11 @@ static int i2c_dw_init_regmap(struct dw_i2c_dev *de=
v)
>  	struct regmap_config map_cfg =3D {
>  		.reg_bits =3D 32,
>  		.val_bits =3D 32,
> -		.reg_stride =3D 4,
> +		.reg_stride =3D 1,
>  		.disable_locking =3D true,
>  		.reg_read =3D dw_reg_read,
>  		.reg_write =3D dw_reg_write,
> -		.max_register =3D DW_IC_COMP_TYPE,
> +		.max_register =3D DW_IC_REG_MAX - 1,
>  	};
>  	u32 reg;
>  	int ret;
> @@ -163,12 +209,9 @@ static int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
>  	if (ret)
>  		return ret;
> =20
> -	reg =3D readl(dev->base + DW_IC_COMP_TYPE);
> +	reg =3D readl(dev->base + dev->regs[DW_IC_COMP_TYPE]);
>  	i2c_dw_release_lock(dev);
> =20
> -	if ((dev->flags & MODEL_MASK) =3D=3D MODEL_AMD_NAVI_GPU)
> -		map_cfg.max_register =3D AMD_UCSI_INTR_REG;
> -

[Severity: High]
By unconditionally setting max_register to DW_IC_REG_MAX - 1, could this ex=
pose
the AMD-specific register (AMD_UCSI_INTR_REG, logical ID 40) via the regmap
debugfs interface on all models?

If a privileged user reads the regmap registers file in debugfs on a non-AMD
platform, the iteration would reach logical register 40. This translates to
physical offset 0x474 in dw_i2c_reg_offsets, which dw_reg_read() would atte=
mpt
to read via readl(dev->base + dev->regs[reg]).

Could this lead to an out-of-bounds MMIO read and potentially cause a system
crash (such as a bus fault or SError) or hardware hang, since the mapped MM=
IO
region on standard platforms might not extend to 0x474?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-tda54-upst=
ream-i2c-v2-0-261785e58493@ti.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9D374722
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754704; cv=none; b=dMA4QGFl6PAJFzfjjdTKwuhuMqk9jjoroRldb2SfQmIz0dB1nvxCKTo7zM1oP3aLnn+26TW3as7TkhIA8ekuuWZw3SOUAgHOf10tca/Gu7Q9/BVZa9/TaT4Oe7vFQ9iWuCF8KKmE1UIjV64axU51dr8ptFdjrtOokbuFd36SWKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754704; c=relaxed/simple;
	bh=3EBucZADutiLhc0zsK97xEuNM/mj/N1TAOXT7u77wZo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sCDfAfM18E+F/n+9x4tDGPiMPWGJTyT3cVa6GIHqoTiBLrbV5OiZPKvjRndHHAE7/LHQuG3h63OW8BeoniuoSENtOnqUx4z8X9GAkYvzajk7NlGOouTTG6MNmEXFF9tshC610ftNy7J/WIKUFG9xOmmE7DxR+3nxXQMC2fWLZVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6h8orFd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6h8orFd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B33BC2BCB8;
	Thu, 14 May 2026 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778754703;
	bh=3EBucZADutiLhc0zsK97xEuNM/mj/N1TAOXT7u77wZo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=a6h8orFdggwypf6YVN3RbQQ3SHzDozhvMPa3gGaXtNf9fj8/HOYvvWRir+3lDAYhh
	 jPlsk3vy2nuor2QqEdP5tiK2BfUxgnv5MKyAcdBXzTawdEy4hgV4Y1xXPIHcvo4qM4
	 VkJsHI9G6L/neLY6fIfLzQhXrwlw8igfwSJKf2OtxZDHwo8fGeBoMSd6nnzXDImkyK
	 OyV3zL+OVwllyQ5AQosJ+FZ83JJ9b0wg1CkiLTGALOFJDLj1M2+V3vpXifSzUmUIBS
	 t1v6eT9b6eOPwY8Tt7hewZP3jz6s1EEfuvdBSn7nx9WpdEOcr8dzLcymhrY9M3YBi9
	 xEM/Z+FLZerhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH phy-next 2/2] phy: ti: add PHY driver for TI DS125DF111
 Dual-Channel Retimer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260513185103.1371809-3-ioana.ciornei@nxp.com>
References: <20260513185103.1371809-3-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:31:42 +0000
Message-Id: <20260514103143.4B33BC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Uninitialized memory read in `ds125df111_xlate` due to missing `=
args_count` validation.
- [Low] Missing explicit header inclusions for macros and memory allocation=
 functions.
--

commit a5dcf247e2e2a6b752d667ac46227925aa476def
Author: Ioana Ciornei <ioana.ciornei@nxp.com>

phy: ti: add PHY driver for TI DS125DF111 Dual-Channel Retimer

This commit adds a generic PHY driver for the TI DS125DF111 Multi-Protocol
Dual-Channel Retimer over I2C. It currently supports 10G and 1G link speeds,
and registers a separate PHY device for each of the two channels to allow
independent configuration.

> diff --git a/drivers/phy/ti/phy-ds125df111.c b/drivers/phy/ti/phy-ds125df=
111.c
> new file mode 100644
> index 0000000000000..8ac10c603bf70
> --- /dev/null
> +++ b/drivers/phy/ti/phy-ds125df111.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2026 NXP */
> +
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/phy.h>
> +#include <linux/phy/phy.h>

This isn't a bug, but should this include linux/bitfield.h, linux/bits.h,
and linux/slab.h?

The driver uses FIELD_PREP(), GENMASK(), and devm_kzalloc(), but relies on
implicit inclusions for these headers. Explicitly including them can help
prevent build breakages if the include chains are refactored in the future.

[ ... ]

> +static struct phy *ds125df111_xlate(struct device *dev,
> +				    const struct of_phandle_args *args)
> +{
> +	struct ds125df111_priv *priv =3D dev_get_drvdata(dev);
> +	u32 idx =3D args->args[0];

Is it possible to read uninitialized memory here?

If a consumer's Device Tree reference incorrectly configures #phy-cells =3D=
 <0>,
of_parse_phandle_with_args() sets args->args_count to 0 and leaves the
args array unmodified.

Since the of_phandle_args structure is often allocated on the stack, for
example in _of_phy_get(), evaluating args->args[0] without verifying that
args->args_count >=3D 1 could result in evaluating stack garbage against the
maximum channel count.

> +
> +	if (idx >=3D DS125DF111_NUM_CH) {
> +		dev_err(dev, "Maximum number of channels is %d\n",
> +			DS125DF111_NUM_CH);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return priv->ch[idx].phy;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513185103.1371=
809-1-ioana.ciornei@nxp.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D961372B31
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301392; cv=none; b=S2rJPAmedXujKCd44VYQ7tVGAQlSJYDaVfwJl9kuTyc0vhmQ46J8ofGXjZARXjp4ShTe0lbjRFQVskxr8Dkqht6bWI8cEvp2P+VkkpmmHyOOfIKHxH2eltaVJvCAB5McV34xIxhaT14Qq59SgJMW8ijEil9eseaiyUzw/9pvJM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301392; c=relaxed/simple;
	bh=XeV1aWDitY2Uc/Q25ms4y2sAr3ivbUnsqVyl65VKAB8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l2xyDUr/rP+rIFN+fCud1rWL+L4kAzWiEnxrVmJg+PfTg/D051T5TljgaIEn+YhCn0y5O4LSo57a1kS1/dIalWpWavG35Ju6qztrz1+FMw0Bhli73CpCL9wnK9TK+xNnYeE5l+xQLr3TFG7+pXSjftfD3Is3FqHDFsf9D4wLZp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrO8p/AM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrO8p/AM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF28C1F00894;
	Wed, 20 May 2026 18:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779301391;
	bh=O8pZXT88JamUOEed+p0VRDdpFezDMQUWHy5KfPCJ8UA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VrO8p/AMcDA4prnhPQKZPU/r0NwjL012ao+Z11dfCzhTxxH88F88NloBkfaivVqKa
	 dw6iv2NYB+xgbQv1V+zhy+X0g+r3ii+kjrMk7oV6Stb0RKqpWMnU1o4GZfumGTtfxC
	 FWtTXBlXMbrhEugq28Tq5RTEkKzjQlAO/gjJAAMGWkx8nS6/4YjdlOnSZV1OFT1D7t
	 +lmd2y+/IDO/V+yJc2Wd/lWoMPSTufw48/kNbu6l6bCD0xQpt9z0Q/XSPtfkyXYZqw
	 cpfOHCCgPz3p4zrzB7z1Dai/hmzLiFPLWW2dgtHkW3DdDPHDt6FjGKOYGEJOVjTJIa
	 QvRzN5LyqhtEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] phy: realtek: usb2: introduce
 vstatus/new_reg_req variables to driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520175728.720877-2-adilov@disroot.org>
References: <20260520175728.720877-2-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 18:23:10 +0000
Message-Id: <20260520182310.AF28C1F00894@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the driver fails=
 to check the return value of `of_iomap()`, which can lead to a NULL pointe=
r dereference.
- [High] This problem wasn't introduced by this patch, but incorrect pointe=
r arithmetic on a `void __iomem *` pointer results in unaligned I/O memory =
accesses for multi-port setups.
- [High] This problem wasn't introduced by this patch, but I/O memory mappi=
ngs created by `of_iomap()` are never unmapped, leading to resource leaks.
- [High] This problem wasn't introduced by this patch, but multi-port PHY c=
onfigurations concurrently modify shared hardware registers without synchro=
nization or a read-modify-write cycle.
--

commit 734507efb75a6be151dcde389bfc7f0e1df95132
Author: Rustam Adilov <adilov@disroot.org>

phy: realtek: usb2: introduce vstatus/new_reg_req variables to driver data

This commit introduces vstatus_offset, vstatus_busy, and new_reg_req variab=
les=20
to the driver data to handle different register offsets and busy bit=20
definitions in the RTL9607C SoC. These variables are added to the existing=
=20
PHY configuration structures and assigned default values.

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index 248550ef98cab..bd9ee895b9f90 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c

[ ... ]

> @@ -194,25 +200,26 @@ static int rtk_phy_write(struct phy_reg *phy_reg, c=
har addr, char data)
>  	int ret =3D 0;
> =20
>  	/* write data to VStatusOut2 (data output to phy) */
> -	writel((u32)data << shift_bits, reg_wrap_vstatus);
> +	writel((u32)data << shift_bits,
> +	       reg_wrap_vstatus + phy_reg->vstatus_offset);

[Severity: High]
This is a pre-existing issue, but does writing directly to this register
without a read-modify-write cycle overwrite the configuration for other
ports?

In multi-port setups, all PHY instances appear to share this same base
address, and a direct writel() could clear the bits belonging to other PHYs.

Is there also a need for synchronization to prevent concurrent writes across
different ports?

> =20
> -	ret =3D utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
> +	ret =3D utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
>  	if (ret)
>  		return ret;

[ ... ]

> @@ -974,6 +982,9 @@ static int parse_phy_data(struct rtk_phy *rtk_phy)
>  		phy_parameter->phy_reg.reg_wrap_vstatus =3D of_iomap(np, 0);
>  		phy_parameter->phy_reg.reg_gusb2phyacc0 =3D of_iomap(np, 1) + index;

[Severity: High]
This isn't a bug introduced by this patch, but does the driver need to
check the return value of of_iomap() here?

If the mapping fails, this would leave the pointers as NULL and cause a
dereference during I/O operations.

[Severity: High]
This is a pre-existing issue, but does adding index directly to the
void __iomem * returned by of_iomap() result in exactly a 1-byte offset
when index > 0?

If so, this could cause an unaligned memory access fault on ARM
architectures. Should the index be scaled appropriately?

[Severity: High]
This is also a pre-existing issue, but does the driver leak these I/O
mappings?

The driver maps the memory here using of_iomap(), but there does not
appear to be a matching iounmap() in the driver cleanup paths. Would
using devm_of_iomap() prevent this leak?

>  		phy_parameter->phy_reg.vstatus_index =3D index;
> +		phy_parameter->phy_reg.vstatus_offset =3D phy_cfg->vstatus_offset;
> +		phy_parameter->phy_reg.vstatus_busy =3D phy_cfg->vstatus_busy;
> +		phy_parameter->phy_reg.new_reg_req =3D phy_cfg->new_reg_req;
> =20
>  		if (of_property_read_bool(np, "realtek,inverse-hstx-sync-clock"))

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520175728.7208=
77-1-adilov@disroot.org?part=3D1

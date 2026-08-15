Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4062B33F59E
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785861; cv=none; b=aXaNAx2KzuLcLTlHaIS2tGwN800cpt42qx36NEdW1AyLFy7zxo8AW3kJ+gZCcCcLAE60fGwOKrwIorUU8rk/s+/0StjVSGXzJ4TJHioFrNSz4HhNeAKBsal/j2QUQ3d5V7GLFM7r22eVskgcxttbT7Lqu1FjjQaxFEpBk+ZXtlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785861; c=relaxed/simple;
	bh=IsIVqcvUUjqaglSknZhbuDbgyjnSLy9L/dbHqXxb6AY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JStr7L79OYuh50ZpsTviyKwHLqki3Rz6a0yvwEKVfgyQrey0leQyCaaYCGpeLWjXzek0+/HpZ5Ve4tz6WDGVzHCWQ/lHiF6rG9SdZJ8uZb5plu1dgCRroygFyJYj5oFOHqt8rpF/DJ5AbGklm179LS65knpG4y95Xn9j0/EwldE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWos40M6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWos40M6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF8B1F000E9;
	Sat, 15 Aug 2026 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786785859;
	bh=Oj4BVtvnY0rpsq70JerhyEfV+eRDVCA9Y14NIFGlWXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hWos40M6eMYBHpUo7sBvzWkQqsXis7DpNJZjcuMmKv4BRCCUCaPLvn/vcN+SwnH2c
	 tz4jnCS06k6hqdGihiI3c5jcvSGUOCF5YG6LE7nTCjUnttd6zlXGvQ0VqYUa72hFFN
	 QUsCIIs8AjK3uEwasopVKRaKQ1kOskJhOhnLrjNYnbaHPoZONlK5rB7zBuH7p7Dejc
	 wNMp9Vc34tpumayUtN53wTCnXI2gn/+XXUvY4R0q/gLYANDMoK5p6ZSNhAxAgCveaK
	 xQQCay2hvtQGOnVZSb3170ejDn34gn/x12O5zzoYM6/sm+wmAFadDAg4Xrfvmd6R9B
	 uzssu5f7nB3Pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/6] phy: realtek: usb2: introduce read and write
 functions to phy_reg_desc struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260815091340.26910-3-adilov@disroot.org>
References: <20260815091340.26910-1-adilov@disroot.org>
 <20260815091340.26910-3-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 09:24:18 +0000
Message-Id: <20260815092419.6CF8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The `.read` callback in `struct phy_reg_desc` and its default imple=
mentation `rtk_usb2phy_read()` are introduced but never used.

Pre-existing issues:
- [High] Unaligned MMIO access due to incorrect pointer arithmetic on `void=
 __iomem *` when mapping multiple PHYs.
--

--- Patch [2]: [PATCH v7 2/6] phy: realtek: usb2: introduce read and write =
functions to phy_reg_desc struct ---
commit 8dc103211b6a1af9aae2648b712feaff2df2fd7f
Author: Rustam Adilov <adilov@disroot.org>

phy: realtek: usb2: introduce read and write functions to phy_reg_desc stru=
ct

This commit introduces read and write function pointers to the phy_reg_desc
struct to support platforms where the vstatus register resides in a big-end=
ian
memory region. It also provides default implementations for existing PHYs.

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index e8d0f0119ec0a..5e483c853f02f 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> @@ -130,6 +132,16 @@ struct rtk_phy {
>  	struct dentry *debug_dir;
>  };
> =20
> +static u32 rtk_usb2phy_read(void __iomem *reg)
> +{
> +	return readl(reg);
> +}
> +

[Severity: Low]
Does this driver actually use the new read callback?

The vstatus register mentioned in the commit message is write-only in this
driver, and all existing reads appear to continue using readl() directly. Is
this read function needed, or is it dead code?

> +static void rtk_usb2phy_write(u32 val, void __iomem *reg)
> +{
> +	writel(val, reg);
> +}
> +

[ ... ]

> @@ -988,7 +1000,6 @@ static int parse_phy_data(struct rtk_phy *rtk_phy)
>  		phy_parameter->phy_reg.vstatus_index =3D index;
>  		phy_parameter->phy_reg.desc =3D phy_cfg->reg_desc;
> =20

[Severity: High]
This is a pre-existing issue, but does this pointer arithmetic cause unalig=
ned
MMIO accesses when configuring multiple PHYs?

In parse_phy_data():

    phy_parameter->phy_reg.reg_gusb2phyacc0 =3D of_iomap(np, 1) + index;

When num_phy > 1, the loop increments index. Since of_iomap() returns a
void __iomem *, adding index directly increments the address by exactly
index bytes rather than the register stride. Could this cause an alignment
fault during device probe on systems with multi-port PHY configurations?

> -
>  		if (of_property_read_bool(np, "realtek,inverse-hstx-sync-clock"))
>  			phy_parameter->inverse_hstx_sync_clock =3D true;
>  		else

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815091340.2691=
0-1-adilov@disroot.org?part=3D2

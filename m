Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4794B37E5F3
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785948; cv=none; b=swo0nhVMIkSGYobGBFbaZiPoNNVcFwGnHSlrysCAm960pE2vo5sJZH/jM+c7ODuaOfnZsce0BViJBjc27379D4cxlGmshMZSdH0/QU+lmZrz5zvm4pu4KM0iBUYvYN7esNqbm4+znOyyO6zCRJlFDYeWUERpamPoF2bVMNgaaXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785948; c=relaxed/simple;
	bh=7kKrAmmjFAN7CuZVX82lJCfLRfojf5Holxi5VCo1bgU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GZsmhOq17Gw/cRLNdySIoFieIIXsyS1UwXpy5Nc32vp02gI5IVwvq/jIwVUSNOTjh2Q1f7qbcdfezrYBxl7UgtFqNqXyZY4xwB5B/n1DRShHsYf28e8F/8ktexAqTjytk6I3nP38FG30njin86wPspR2pBb9/TXaJIM+UJcjbw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SACZC0rU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SACZC0rU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7368E1F00A3D;
	Sat, 15 Aug 2026 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786785946;
	bh=XwVsrbpyNxrPa83PCfe9CKvUxX2Vh0qUNcUXGJwfAOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SACZC0rUNCCKvjs37Lz03CEmMiZQbIzSbOeKRXXTS1R5SRY0RWWSSP6eiKHrMpswT
	 z6suDcE1eOX49NQbfIZ2Cn94j9Z7Imp6/rEKRHf9p5FEcatGRWkmfFNiivBy2xRRHb
	 B1sYkInWeq3v8e2P5ZPvRA9hVGX+/IjWQXqwTWWYRDaVFkmqEa+rz9jg6AeO8EMq7z
	 56tLjPEh2zSccVZHNbX38tKkaI9rtRtaO6aoiy7RaP6JbyA/CiY4P58UwF445UvXW2
	 HcwTdjBA1cTyvNr8aT9NNWyrxKlEwwKhBjzfIMMoEXWJKUFePfnoGfjz9jGfJ3QWKZ
	 ruwUUQhF/Xl2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/6] phy: realtek: usb2: introduce phy_reg_desc
 struct to the driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260815091340.26910-2-adilov@disroot.org>
References: <20260815091340.26910-1-adilov@disroot.org>
 <20260815091340.26910-2-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 09:25:46 +0000
Message-Id: <20260815092546.7368E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Repeated `of_iomap()` calls inside a loop redundantly map hardware=
 registers without corresponding `iounmap()` calls, causing permanent memor=
y leaks.
- [High] Incorrect pointer arithmetic on `void __iomem *` creates unaligned=
 I/O pointers for subsequent PHYs, leading to unaligned 32-bit accesses.
- [High] The return values of `of_iomap()` are not checked for NULL, leadin=
g to potential NULL pointer dereferences during MMIO operations.
- [High] `rtk_phy_write()` overwrites the entire shared `VStatusOut2` regis=
ter, clobbering the configuration of other PHY ports.
- [High] The driver accumulates per-port PHY calibration values into a sing=
le shared `phy_cfg` structure, causing all ports to be initialized with cor=
rupted data.
--

--- Patch [1]: [PATCH v7 1/6] phy: realtek: usb2: introduce phy_reg_desc st=
ruct to the driver ---
commit 9a2c62ecf6aef3b339ebeb8b5606b980417dd955
Author: Rustam Adilov <adilov@disroot.org>

phy: realtek: usb2: introduce phy_reg_desc struct to the driver

This commit creates a per-SoC phy_reg_desc struct to hold register offsets
and bits that vary across different SoCs. It adds a default rtd_phy_reg_desc
and updates the driver data to point towards it.

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index 248550ef98cab..e8d0f0119ec0a 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
[ ... ]
> @@ -190,29 +199,31 @@ static int rtk_phy_write(struct phy_reg *phy_reg, c=
har addr, char data)
>  	unsigned int val;
>  	void __iomem *reg_wrap_vstatus =3D phy_reg->reg_wrap_vstatus;
>  	void __iomem *reg_gusb2phyacc0 =3D phy_reg->reg_gusb2phyacc0;
> +	const struct phy_reg_desc *reg_desc =3D phy_reg->desc;
>  	int shift_bits =3D phy_reg->vstatus_index * 8;
>  	int ret =3D 0;
> =20
>  	/* write data to VStatusOut2 (data output to phy) */
> -	writel((u32)data << shift_bits, reg_wrap_vstatus);
> +	writel((u32)data << shift_bits,
> +	       reg_wrap_vstatus + reg_desc->vstatus_offset);

[Severity: High]
This is a pre-existing issue, but does this unconditional 32-bit writel()
clobber the shared register's other byte lanes without a read-modify-write?

In multi-port setups, all ports map the exact same physical reg_wrap_vstatus
register. When configuring port 1 (where shift_bits =3D 8), writing
(u32)data << shift_bits will correctly position port 1's byte, but write
zeroes to all other bytes, entirely erasing the configuration just applied =
to
port 0.

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for
reg_wrap_vstatus to be NULL here?

The pointer is acquired via of_iomap() in parse_phy_data(), which doesn't
appear to be checked for NULL before being dereferenced in this writel().

[ ... ]
> @@ -974,6 +986,8 @@ static int parse_phy_data(struct rtk_phy *rtk_phy)
>  		phy_parameter->phy_reg.reg_wrap_vstatus =3D of_iomap(np, 0);
>  		phy_parameter->phy_reg.reg_gusb2phyacc0 =3D of_iomap(np, 1) + index;

[Severity: High]
This is a pre-existing issue, but do these redundant of_iomap() calls create
a memory leak?

They occur inside the loop iterating over num_phy, repeatedly mapping the
same physical region without storing all mapped pointers or unmapping them.

[Severity: High]
This isn't a bug introduced by this patch, but does the pointer arithmetic =
on
of_iomap(np, 1) + index create unaligned I/O pointers for subsequent PHYs?

The return type of of_iomap() is void __iomem *. By GCC extension, adding
index advances the pointer by index bytes. For num_phy > 1, index becomes 1
or higher, creating a misaligned pointer. Subsequent calls to readl() or
writel() on this pointer will perform 32-bit accesses misaligned by 1 byte.

[Severity: High]
This isn't a bug introduced by this patch, but does the driver accumulate
per-port PHY calibration values into a single shared phy_cfg structure?

In parse_phy_data(), it iterates over all ports and calls
update_dc_driving_level(), which modifies phy_cfg->page0[4].data:

drivers/phy/realtek/phy-rtk-usb2.c:update_dc_driving_level() {
    ...
    phy_cfg->page0[4].data =3D __update_dc_driving_page0_0xe4(phy_cfg,
                                                phy_parameter,
                                                phy_cfg->page0[4].data);
    ...
}

Because phy_cfg is shared globally for the entire driver instance, it seems
the calibration math meant for port 1 is added cumulatively on top of the
results of port 0. Later, do_rtk_phy_init() pushes this heavily corrupted
array to all ports.

>  		phy_parameter->phy_reg.vstatus_index =3D index;
> +		phy_parameter->phy_reg.desc =3D phy_cfg->reg_desc;
> +
> =20
>  		if (of_property_read_bool(np, "realtek,inverse-hstx-sync-clock"))

[ ... ]
> @@ -1060,6 +1074,12 @@ static void rtk_usb2phy_remove(struct platform_dev=
ice *pdev)
>  	remove_debug_files(rtk_phy);
>  }

[Severity: High]
This is a pre-existing issue, but does rtk_usb2phy_remove() fail to call
iounmap() to clean up the mappings created by of_iomap() during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815091340.2691=
0-1-adilov@disroot.org?part=3D1

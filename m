Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C19B375F8E
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786786195; cv=none; b=nWOmfR+WXmEDZFbvrCx2wERNaIid9AtPPH4WtgymSMin/nOfEVdhadmTrGNzY9lCALNVsu6XzUPV7iPjjcFB5y0dfdcHKIKyo4ld/+TOYs6G1bferjE7Ff8jBlEUcxrYpP3Bf957hQxsIjufDs0Yp7sbTjM6eFDdaV3H6R8exHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786786195; c=relaxed/simple;
	bh=Gf4+h5Z8PMXznnzIcNpdG3O88hTKGadpxDTpT6jO4/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HeyuqsSaA7PQIUcse79lh69wS4gAen/5oxs6EjK3g/vDjofn3LB8GTmkrqKY2mcYNUFeDaFtUIXiA66Ipas9r2cFNRVXkbQ8zKEsREKfVdvYsKUkOpHNhurAjM3U24rp+fBUWGnsKjoI8IfyM73oWscu9ltxVzFrVaq5/vEFXSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDbSp7dt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDbSp7dt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61ED1F000E9;
	Sat, 15 Aug 2026 09:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786786194;
	bh=yxcmxBndzvKDGTFViWT6R+/5sUpaWul9J56V9sHIJck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kDbSp7dtycgOgBWpuG9GwZ0ACsGk0MfRmok2AYXCdC+vcrN28C3TgY0Q2nNvDKSJK
	 bifxKP6l1+PmOTAPJt6mImEyfBfvH6xv0Ra6ZqwWadjH/cLpFnOGIw3INfE68K/kIA
	 AYtBb7lnDKFlUGkpliS4A/+8lCdgGk15bsBa+Na1r+y/WRodUGuUXQQIK0fJyu6nqk
	 sLLcoZi4MZ9uPAL3MUG6V4f2zZZGn57rPcY+UkebmZlEtEhbpa6vF5xA7kD6csdjiW
	 qXGshdNjVYVR3oPkD+wzvIbfWtMi3ts4kKZYlPskK5tiKodaOsT0KuO0tZleReNcAo
	 EV4pO6EChB+ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/6] phy: realtek: usb2: add support for RTL9607C
 USB2 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260815091340.26910-6-adilov@disroot.org>
References: <20260815091340.26910-1-adilov@disroot.org>
 <20260815091340.26910-6-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 09:29:53 +0000
Message-Id: <20260815092953.E61ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Medium] The rtl9607_phy_cfg structure omits the .check_efuse flag, causi=
ng eFuse parameters to be ignored.
- [Medium] The page0 register configuration stores address 0xf3 at the wron=
g index, corrupting debugfs output.

Pre-existing issues:
- [High] Unchecked return value from of_iomap() leads to a NULL pointer der=
eference.
- [High] Pointer arithmetic on void __iomem * causes unaligned device regis=
ter accesses.
- [High] Signed char integer promotion corrupts register writes on architec=
tures with signed chars (e.g., MIPS).
- [High] Silent failure when do_rtk_phy_init() fails for multi-port SoCs.
--

--- Patch [5]: [PATCH v7 5/6] phy: realtek: usb2: add support for RTL9607C =
USB2 PHY ---
commit 6a5b4e2235314d4730ccd147be12148b19afc984
Author: Rustam Adilov <adilov@disroot.org>

    phy: realtek: usb2: add support for RTL9607C USB2 PHY
   =20
    Add support for the usb2 phy of RTL9607C series based SoCs.
    Add the macros and phy config struct for rtl9607.

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index 2ddad7be73534..990ceca37ef8a 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c

[ ... ]

> @@ -1342,6 +1384,29 @@ static const struct phy_cfg rtd1315e_phy_cfg =3D {
>  	.reg_desc =3D &rtd_phy_reg_desc,
>  };
> =20
> +static const struct phy_cfg rtl9607_phy_cfg =3D {
> +	.page0_size =3D MAX_USB_PHY_PAGE0_DATA_SIZE,
> +	.page0 =3D { [0] =3D {0xe0, 0x95},

[Severity: High]
This is a pre-existing issue, but does writing 0x95 here corrupt the regist=
er
on architectures like MIPS?

rtk_phy_write() takes data as a signed char:

drivers/phy/realtek/phy-rtk-usb2.c:rtk_phy_write() {
...
	reg_desc->write((u32)data << shift_bits,
...
}

On architectures where char is signed by default, a value of 0x95 is
interpreted as a negative number (-107). When cast to u32, it undergoes sign
extension to 0xFFFFFF95, and after shifting, it can clobber the upper bits
of the shared reg_wrap_vstatus register.

> +		   [4] =3D {0xe4, 0x6a},
> +		  [12] =3D {0xf3, 0x31}, },

[Severity: Medium]
Will this map to the correct debugfs output?

Address 0xf3 mathematically maps to array index 11 via the strict mapping
formula in page_addr_to_array_index(). Because it is placed at index 12
here, when rtk_usb2_parameter_show() computes the target read address
dynamically, it will read from 0xf4 and display it alongside the expected
0xf3 data.

> +	.page1_size =3D MAX_USB_PHY_PAGE1_DATA_SIZE,
> +	.page1 =3D { [0] =3D {0xe0, 0x26}, },
> +	.page2_size =3D MAX_USB_PHY_PAGE2_DATA_SIZE,
> +	.page2 =3D { [7] =3D {0xe7, 0x33}, },
> +	.num_phy =3D 1,
> +	.check_efuse_version =3D CHECK_EFUSE_V2,

[Severity: Medium]
Is the .check_efuse flag missing here?

Without .check_efuse =3D true, the eFuse parameters like check_efuse_version
and efuse_dc_driving_rate specified in this structure appear to be ignored
by get_phy_data_by_efuse(), leaving the hardware uncalibrated.

> +	.efuse_dc_driving_rate =3D EFUS_USB_DC_CAL_RATE,
> +	.dc_driving_mask =3D 0x1f,
> +	.efuse_dc_disconnect_rate =3D EFUS_USB_DC_DIS_RATE,
> +	.dc_disconnect_mask =3D 0xf,
> +	.usb_dc_disconnect_at_page0 =3D true,
> +	.do_toggle =3D true,
> +	.driving_updated_for_dev_dis =3D 0x8,
> +	.is_double_sensitivity_mode =3D true,
> +	.reg_desc =3D &rtl9607_phy_reg_desc,
> +	.force_host_disconnect =3D true,
> +};
> +

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but looking at the existing
parse_phy_data() function:

drivers/phy/realtek/phy-rtk-usb2.c:parse_phy_data() {
...
	phy_parameter->phy_reg.reg_wrap_vstatus =3D of_iomap(np, 0);
...
}

Does this code dereference a NULL pointer during device probe if the device
tree lacks the required reg properties?

The return values from of_iomap() are assigned and subsequently dereferenced
without any validation.

[Severity: High]
This is a pre-existing issue, but does adding index to the of_iomap() result
cause unaligned device register accesses?

Looking at the existing parse_phy_data() function:

drivers/phy/realtek/phy-rtk-usb2.c:parse_phy_data() {
...
	phy_parameter->phy_reg.reg_gusb2phyacc0 =3D of_iomap(np, 1) + index;
...
}

Since of_iomap() returns void __iomem *, GCC treats the pointer arithmetic
as 1-byte elements. For multi-port PHYs where index > 0, this adds exactly
1 byte to the base address, which will trigger alignment exceptions during
subsequent 32-bit writel() calls on architectures like ARM64.

[Severity: High]
This is a pre-existing issue, but does the initialization loop mask errors
for multi-port SoCs?

Looking at the existing rtk_phy_init() function:

drivers/phy/realtek/phy-rtk-usb2.c:rtk_phy_init() {
...
	for (i =3D 0; i < rtk_phy->num_phy; i++)
		ret =3D do_rtk_phy_init(rtk_phy, i);
...
}

If do_rtk_phy_init() fails for any port except the last one, ret is
overwritten by the result of the subsequent PHY's initialization, silently
ignoring earlier failures while incorrectly reporting probe success.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815091340.2691=
0-1-adilov@disroot.org?part=3D5

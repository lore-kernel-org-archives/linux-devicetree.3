Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BE2375F8E
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785994; cv=none; b=NaaxIf+MHb98kBzZuz6kP3xEzdekzZyLMaa1CN8+W6xhBJYbEBqPbT3IjDMh001bDuan8s17Hc3Cdn/NRHVBVpxxmtHRCjFI686bluy1BsHy4t93B9zNjbdjbkJFroYpl6SPaOe1JPzK8W/LOJaIlkbh+JMioyyW1olE+sGkWiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785994; c=relaxed/simple;
	bh=lGFDhdV4yo/RmVdv2fTXUi6NbupzxrfxUjLMiZBF2Hg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IQevZ/CbICrGyfez9z/Yff29GyYbZoWNbVl1NgRcHBQ/THWYG+GohiWwgsIBJb3ys2/VuR5j+cp6mimg5i4td3SbPQRi61fWckTDStFNZaKBnpWvqLv6Mz7HIEGB/+CdAhp5QXwCa/YpVA8jEWufwpqvoEvZhgSqaOIM139efXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joy0NYlr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joy0NYlr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863DB1F00A3A;
	Sat, 15 Aug 2026 09:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786785993;
	bh=954vqBAV7CPL7BRytItHgK3ROpUM/l5DnrdwjjcKuro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=joy0NYlrBU4Ej08KkzggmQhr0qtyd3q//BbMhEeWQq3F8Mt8f2X27xNUUFab+0Q5s
	 DidLieZOqOsUWWJJAfH67acnhXi3TYoJqkKxDlt+7QEclVyrazikq+BbdlRHz+AQYa
	 BpHNpxKIA20mPqq8Z3vuYZ0ZHAUhbHkvCrRi8AXOSuDq9TOUemB0MOLw0iZEp+4zqt
	 w5XIqyfQP8oPAc663DYWp9IXnDjAYSDmhhkU1+gpkQAnOVxezqgCcJyQcwfvgdgyQR
	 Z21S56LwqAIP15DCuhXvZV6th91V4FdnWAw/0T0Me85wRO7/vpHaBtZbmTxMaohCaH
	 bvdH7MrIPkuMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/6] phy: realtek: usb2: introduce reset controller
 struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>
Cc: robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260815091340.26910-5-adilov@disroot.org>
References: <20260815091340.26910-1-adilov@disroot.org>
 <20260815091340.26910-5-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 09:26:32 +0000
Message-Id: <20260815092632.863DB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly introduced PHY reset is deasserted too late (in `rtk_phy=
_init()`), causing fatal MMIO register accesses during `probe()` if the sta=
tic configuration omits explicit initializers.
--

--- Patch [4]: [PATCH v7 4/6] phy: realtek: usb2: introduce reset controlle=
r struct ---
commit f14473a9b55e70977d451ec39af7f337818751bd
Author: Rustam Adilov <adilov@disroot.org>

phy: realtek: usb2: introduce reset controller struct

This commit introduces a reset_control struct to the driver to handle
deasserting the usb2 phy reset line using=20
devm_reset_control_get_optional_exclusive().

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index 5e483c853f02f..2ddad7be73534 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c

[ ... ]

> @@ -676,6 +678,15 @@ static int rtk_phy_init(struct phy *phy)
>  	if (!rtk_phy)
>  		return -EINVAL;
> =20
> +	if (rtk_phy->phy_rst) {
> +		ret =3D reset_control_deassert(rtk_phy->phy_rst);
> +
> +		if (ret)
> +			return ret;
> +
> +		usleep_range(5000, 6000);
> +	}
> +

[ ... ]

> @@ -1055,6 +1066,11 @@ static int rtk_usb2phy_probe(struct platform_devic=
e *pdev)
> =20
>  	rtk_phy->num_phy =3D phy_cfg->num_phy;
> =20
> +	rtk_phy->phy_rst =3D devm_reset_control_get_optional_exclusive(dev, NUL=
L);
> +	if (IS_ERR(rtk_phy->phy_rst))
> +		return dev_err_probe(dev, PTR_ERR(rtk_phy->phy_rst),
> +				     "usb2 phy reset is not working\n");
> +
>  	ret =3D parse_phy_data(rtk_phy);

[Severity: High]
Can this cause a bus hang or read timeout during probe()?

Since the newly introduced reset is only deasserted later when consumers
call rtk_phy_init(), the IP is still held in reset here.

However, parse_phy_data() can perform direct MMIO reads against the PHY to
cache default values if the static configuration lacks explicit initializer=
s:

drivers/phy/realtek/phy-rtk-usb2.c:update_dc_driving_level() {
    ...
    if (!phy_cfg->page0[4].addr) {
        rtk_phy_set_page(phy_reg, 0);
        phy_cfg->page0[4].addr =3D PAGE0_0XE4;
        phy_cfg->page0[4].data =3D rtk_phy_read(phy_reg, PAGE0_0XE4);
    }
    ...
}

Will this cause issues when interacting with the PHY registers while the
device is still in reset?

>  	if (ret)
>  		goto err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815091340.2691=
0-1-adilov@disroot.org?part=3D4

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFF3346A1F
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779306722; cv=none; b=i+MBw6fVTiS4GXRAgc6FROyfEoE92BOVFHxrs11+RBX4Pu+CHypGtywTnjsR20vNGdL17oHqiQkKNYzxfmHzDFj9PdonFqGk8bK1O2HUjI/Xb1AMojeQmjjif4dmxlvNsl3n4FUyhaoc7+4FSqN/SP5cTRhvjHRkNV1iszhl1TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779306722; c=relaxed/simple;
	bh=ZxH6qDDxliBSFL1kA4dNCgc0NySsg1Wg2gDHFLWR590=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G+xDDP9TN0q93s1YxEW0PW8vIrs0UC3ta1Eg5PpimmrHzuIU4TgbVzIiUGId1qeRC77rfM0NPkhbRARuh2Wn1y1JMeqswSDAYSv0GoVkXKcc84xOdde9r/F27KKNlNP/nUN6TSPwp6xzhjgqjcW89XmRsjijqMC4hOkT/N1gUjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wpuh8+ZI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wpuh8+ZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578AA1F000E9;
	Wed, 20 May 2026 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779306719;
	bh=Sr700ZLkhK3DU+BHdplyKh4fOsWZkqc+eF3VoCNCO78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wpuh8+ZI35IFIiV9dQ1wKZUnY3OsYHVZg9LYyBd9YOEO2nPBLJ59PV4zIUKzyc88t
	 YMVR75EgJjDMZq8IAoOYJHNiwgYwS++S1bzdI0oa0VP8b0786/0itWMwtojrPs4Iju
	 PmAy1SNPjMDMCEiow3AEiEVs1qzpvD8EptNMmeFQ1+JC+UNmweHmHgx6T8f1VMfzVg
	 Yah7DyFXQb5NpEQ9yeYGtNpcawO4IWURXTqI3KsI70oCZNx/4wz8RYmo+2kI7bcjvs
	 P197tjXiYaS1n8A5VXGj7MbojOYtMTLWalWMycXHQ7DQCniygfNnTuw6kf66IAqn2L
	 T5YsitrzJDDDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] phy: realtek: usb2: add support for RTL9607C
 USB2 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260520175728.720877-6-adilov@disroot.org>
References: <20260520175728.720877-6-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 19:51:58 +0000
Message-Id: <20260520195159.578AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing error handling for of_iomap() leads to NULL pointer derefe=
rence
- [High] Incorrect pointer arithmetic on void __iomem * causes unaligned me=
mory accesses
- [High] Resource leak of I/O memory mappings
--

commit 45e50610a9cf3e4d1ba9824c0450199938805d5b
Author: Rustam Adilov <adilov@disroot.org>

phy: realtek: usb2: add support for RTL9607C USB2 PHY

This commit adds support for the USB2 PHY of RTL9607C-based SoCs. It includ=
es
macros, a PHY config structure, and logic to clear a "force host disconnect"
bit before writing parameters.

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index 16c5fc3191dec..69f0f5279b5ef 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
[ ... ]
> @@ -600,6 +617,19 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, =
int index)
>  		goto do_toggle;
>  	}
> =20
> +	if (phy_cfg->force_host_disconnect) {
> +		/* disable force-host-disconnect */
> +		void __iomem *vstatus =3D phy_reg->reg_wrap_vstatus;
> +		u32 temp;
> +
> +		temp =3D phy_reg->read(vstatus + PHY_9607_FORCE_DISCONNECT_REG);

[Severity: High]
This isn't a bug introduced by this patch, but missing error handling for
of_iomap() in parse_phy_data() could lead to a NULL pointer dereference her=
e.

drivers/phy/realtek/phy-rtk-usb2.c:parse_phy_data() {
    ...
    phy_parameter->phy_reg.reg_wrap_vstatus =3D of_iomap(np, 0);
    phy_parameter->phy_reg.reg_gusb2phyacc0 =3D of_iomap(np, 1) + index;
    ...
}

If the mapping fails, phy_reg->reg_wrap_vstatus will be NULL.

Does this new code risk dereferencing a NULL vstatus pointer if the device
tree is invalid or memory is exhausted?

[Severity: High]
This is a pre-existing issue, but does the driver leak the I/O memory mapped
by of_iomap()?

Since devm_of_iomap() is not used and there are no corresponding iounmap()
calls anywhere in the driver, could this exhaust I/O memory upon probe
failure or driver unbinding?

> +
> +		temp &=3D ~PHY_9607_FORCE_DISCONNECT_BIT;
> +		phy_reg->write(temp, vstatus + PHY_9607_FORCE_DISCONNECT_REG);
> +
> +		usleep_range(10000, 11000);
> +	}
> +
>  	/* Set page 0 */
>  	phy_data_page =3D phy_cfg->page0;
>  	rtk_phy_set_page(phy_reg, 0);
[ ... ]
> @@ -1374,6 +1404,33 @@ static const struct phy_cfg rtd1315e_phy_cfg =3D {
>  	.write =3D rtk_usb2phy_write,
>  };
> =20
> +static const struct phy_cfg rtl9607_phy_cfg =3D {
> +	.page0_size =3D MAX_USB_PHY_PAGE0_DATA_SIZE,
> +	.page0 =3D { [0] =3D {0xe0, 0x95},
> +		   [4] =3D {0xe4, 0x6a},
> +		  [12] =3D {0xf3, 0x31}, },
> +	.page1_size =3D MAX_USB_PHY_PAGE1_DATA_SIZE,
> +	.page1 =3D { [0] =3D {0xe0, 0x26}, },
> +	.page2_size =3D MAX_USB_PHY_PAGE2_DATA_SIZE,
> +	.page2 =3D { [7] =3D {0xe7, 0x33}, },
> +	.num_phy =3D 1,

[Severity: High]
This isn't a bug introduced by this patch, but does the pointer arithmetic
incorrectly misalign the base pointer when num_phy > 1?

drivers/phy/realtek/phy-rtk-usb2.c:parse_phy_data() {
    ...
    for (index =3D 0; index < rtk_phy->num_phy; index++) {
        ...
        phy_parameter->phy_reg.reg_gusb2phyacc0 =3D of_iomap(np, 1) + index;
    ...
}

Since of_iomap() returns a void __iomem *, adding index increments the
pointer by exactly index bytes.

Could this cause an unaligned memory access exception (leading to a kernel
panic) or fail to map the correct register index from the device tree?

> +	.check_efuse_version =3D CHECK_EFUSE_V2,
> +	.efuse_dc_driving_rate =3D EFUS_USB_DC_CAL_RATE,
> +	.dc_driving_mask =3D 0x1f,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520175728.7208=
77-1-adilov@disroot.org?part=3D5

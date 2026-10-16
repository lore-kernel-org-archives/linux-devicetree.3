Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CD348DB36
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 18:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174542; cv=none; b=t8DY93Q8CfvMuNEIiutcw10oQ2fIBMWrwrfz+3bFHgflUVqNMsYeoVV8OGRaSXX9AEZrwvZ1FQ/EJ2vI5l8+qcLaRcY6Qv0hPgYV11ByUcZTdUxBEkVfiun6t8TJxZ9fohobxSpZJvuLC0kUggNdm6SYu3XrG8N6dA6xSnVUtno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174542; c=relaxed/simple;
	bh=EqXL7OEzIjuS+qpPUMOBDjZGAiXqHj4h+4shjicXH0g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tNnBe0/en0YbIpb6IRdqlm889CnlwiVg1i9jB9XBvvgo5mIOxioKpisEolaH9nlRPfxnDSKR3YhcQXhVIG8GA2xHSC+b3k9/TE4yC8IMswrlFpq4jgkdKGB5bPwKoVECknagJN4XDoD/6JkXLQ9tI/FAzjEl9fB0azRfhbdZ82U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cctKyv8k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cctKyv8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40CE1F000C8;
	Fri, 16 Oct 2026 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792174540;
	bh=7DRLFNZeCfhDGAvyw/2znK3pXUlxykPmQA/zF6XluF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cctKyv8kkedD+hQ3YPXzsEI5NFOGsun5YrtkJmwKCRmuVeroaRIKMnxszzysoAovq
	 PU/ckF0t6BM7hRrHfytl/xKGpySiAphR1x90r5QPrONNJvVtBZ84DF5YvK35VjYctv
	 B+fQXjQnbqGkZUP0KB/jp5bB5X7tZHg+gRu9PsYBq74OW76sjmKYxs0HtBEVQxRla/
	 iNxInKIJC4HsNXNu9rWVdulP2cRydcTeKuZzRfXAf8z62ZBUN0lRFzsdBPxmL2wI83
	 GdZ0eORL7Smbx8dsiP4bdA9Yh7vfHe1/glHTXXZWCE+Z9jcJtVB6A1Yp87HWwRj0TG
	 mnjeYq14BDKow==
Message-ID: <sashiko-outbox-174760@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/6] phy: realtek: usb2: introduce phy_reg_desc
 struct to the driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261016180314.31760-2-adilov@disroot.org>
References: <20261016180314.31760-1-adilov@disroot.org>
 <20261016180314.31760-2-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 18:15:39 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: phy: unaligned IO pointer arithmetic on void __iomem *
- [High] phy: realtek: missing NULL check and iounmap() for of_iomap()
- [High] phy: realtek: off-by-one array bounds check allows out-of-bounds a=
ccess
--

commit a5449cff40ee54bc6f98436955a56c20a0155c71
Author: Rustam Adilov <adilov@disroot.org>

phy: realtek: usb2: introduce phy_reg_desc struct to the driver

In RTL9607C SoC, there are a few differences in usb2 phy compared
to existing RTD SoCs, like vstatus register is at certain offset
from the base, busy bit and new_reg_req bit are at different bits
of the register.

To avoid duplicating these variables across phy cfg and driver data,
create a per-SoC struct that would hold them and with that add the
default rtd_phy_reg_desc to which all RTD SoCs driver data will
point towards.

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index 248550ef98cab..e8d0f0119ec0a 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> @@ -156,27 +164,28 @@ static inline int utmi_wait_register(void __iomem *=
reg, u32 mask, u32 result)
>  static char rtk_phy_read(struct phy_reg *phy_reg, char addr)
>  {
>  	void __iomem *reg_gusb2phyacc0 =3D phy_reg->reg_gusb2phyacc0;
> +	const struct phy_reg_desc *reg_desc =3D phy_reg->desc;
>  	unsigned int val;
>  	int ret =3D 0;
> =20
>  	addr -=3D OFFEST_PHY_READ;
> =20
>  	/* polling until VBusy =3D=3D 0 */
> -	ret =3D utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
> +	ret =3D utmi_wait_register(reg_gusb2phyacc0, reg_desc->vstatus_busy, 0);

[Severity: High]
Can this dereference an out-of-bounds array element?

In rtk_phy_toggle(), the bounds check uses > instead of >=3D:

    if (index > rtk_phy->num_phy) {

This incorrectly allows index to equal the array size num_phy. When
do_rtk_phy_toggle() uses this out-of-bounds index to access the dynamically
allocated phy_parameter array, an invalid phy_reg element is passed to
rtk_phy_read().

Dereferencing the explicitly added desc pointer from this invalid phy_reg
element will immediately cause a NULL pointer dereference or memory corrupt=
ion.

[ ... ]

> @@ -957,6 +968,7 @@ static int get_phy_data_by_efuse(struct rtk_phy *rtk_=
phy,
> =20
>  static int parse_phy_data(struct rtk_phy *rtk_phy)
>  {
> +	struct phy_cfg *phy_cfg =3D rtk_phy->phy_cfg;
>  	struct device *dev =3D rtk_phy->dev;
>  	struct device_node *np =3D dev->of_node;
>  	struct phy_parameter *phy_parameter;
> @@ -974,6 +986,8 @@ static int parse_phy_data(struct rtk_phy *rtk_phy)
>  		phy_parameter->phy_reg.reg_wrap_vstatus =3D of_iomap(np, 0);
>  		phy_parameter->phy_reg.reg_gusb2phyacc0 =3D of_iomap(np, 1) + index;

[Severity: High]
Does this code handle of_iomap() failures correctly?

of_iomap() can return NULL. The driver fails to check this return value and
proceeds, which can cause a NULL pointer dereference later when
reg_wrap_vstatus is offset and dereferenced in rtk_phy_write().

Additionally, this maps the exact same indices (0 and 1) redundantly in a
loop up to num_phy times, which may leak I/O memory if mapped multiple time=
s.

[Severity: High]
Does this pointer arithmetic result in an unaligned pointer?

Adding index to the void __iomem * returned by of_iomap(np, 1) increments t=
he
address by exactly index bytes (e.g. 1 byte for the second PHY in a dual-po=
rt
configuration). This creates an unaligned I/O pointer.

Executing a 32-bit I/O access on this unaligned pointer in rtk_phy_write()
can cause a hardware Alignment Fault.

>  		phy_parameter->phy_reg.vstatus_index =3D index;
> +		phy_parameter->phy_reg.desc =3D phy_cfg->reg_desc;
> +
> =20
>  		if (of_property_read_bool(np, "realtek,inverse-hstx-sync-clock"))
>  			phy_parameter->inverse_hstx_sync_clock =3D true;

[ ... ]

> @@ -1060,6 +1074,12 @@ static void rtk_usb2phy_remove(struct platform_dev=
ice *pdev)
>  	remove_debug_files(rtk_phy);
>  }

[Severity: High]
Does this missing cleanup cause an I/O memory leak?

The teardown function completes without calling iounmap() for the regions
mapped by of_iomap() in parse_phy_data(), resulting in a permanent I/O memo=
ry
leak on driver removal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016180314.3176=
0-1-adilov@disroot.org?part=3D1

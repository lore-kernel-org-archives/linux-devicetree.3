Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9748748DB2B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 18:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174529; cv=none; b=S69ufGRJCFvOlW0XxcgchTekENsBoNHrJ7mIri0wewDcR91LXt/XV0RHMNYODLQxUutVhj8fYSV+zLgGx3f+YLO27a9dWhB/kNnLbN+Zr7JKur+y6wiRHnVpKJn+Ts1+V6YP1THN0Fvxg36je5TX66XoxC7jNaiVd6bIrG30ylc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174529; c=relaxed/simple;
	bh=r9PYC4eGZXOzbLHba1oVWYHNXObQyKtj0RaLdgYSnlY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=J+GAGzisLIFkHfK9o/OVx50iHE3Bq3qmBa9SmA+9rkNi0NiS/ktVCcpUeVBtpmdHhS07xWq27LNkqq6Ai6Yq1dE8ICL+aAXZ3lRCGTDGo5L13cYQJwA7PVJNDS0sAN1sOJzl4Mh0bPuvWDj7wDZOqMTmrqIXrxOdfZqDiiMaAIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nA6JeHP2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nA6JeHP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2376F1F000C4;
	Fri, 16 Oct 2026 18:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792174528;
	bh=g3838epcQ90A4CFP6/f2+EZAMF2xkCMDkMhALJrr/mY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nA6JeHP2oyu00Kgv3l2gEHiC57jXJgUCN207hcuAtjMVRMBbXRHHiKR0y2hV/n45H
	 H7HixgdCxFd7A8RCeJF5uYuc3mevFzTvHfgYEr3GhDHNMGqYoe0MZLtgWnrnrV/Gdt
	 El/qmczI/Mm66XaBsNnZwBr68KbvBpeTYjUiKogiXkHw6tWK9pOwGeWXPBLvENW31s
	 wbYj0NndaXnw+KZMwDdf1RPiIU59zxigT1FfNBhMVIFk5w51dOC3nUHOC4vqTw9/Qo
	 XwzIaRvMlvUHZO92YId7aPBDJTmibLoefonZzUIR77OthdObq2N318iipYtZV+mQz+
	 Gu96m2raPY21A==
Message-ID: <sashiko-outbox-174758@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/6] phy: realtek: usb2: introduce read and write
 functions to phy_reg_desc struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261016180314.31760-3-adilov@disroot.org>
References: <20261016180314.31760-1-adilov@disroot.org>
 <20261016180314.31760-3-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 18:15:26 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] phy: missing NULL check for of_iomap() in parse_phy_data()
--

commit a9528213c2ade387d2252d526e2e1e2c2162eeba
Author: Rustam Adilov <adilov@disroot.org>

phy: realtek: usb2: introduce read and write functions to phy_reg_desc stru=
ct

RTL9607C is a big endian SoC with little endian USB host controller but
vstatus register is from big endian memory region and thus existing
writel doesn't work. It needs either __raw_writel or iowrite32be
instead.

To handle this situation, introduce read and write function to the
phy_reg_desc struct and add a default variation that is going to be
ponted by the existing rtd_phy_reg_desc.

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index e8d0f0119ec0a..5e483c853f02f 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
[ ... ]
> @@ -204,8 +216,8 @@ static int rtk_phy_write(struct phy_reg *phy_reg, cha=
r addr, char data)
>  	int ret =3D 0;
> =20
>  	/* write data to VStatusOut2 (data output to phy) */
> -	writel((u32)data << shift_bits,
> -	       reg_wrap_vstatus + reg_desc->vstatus_offset);
> +	reg_desc->write((u32)data << shift_bits,
> +		       reg_wrap_vstatus + reg_desc->vstatus_offset);

[Severity: High]
Does this code risk dereferencing a NULL pointer if of_iomap() fails?

In parse_phy_data(), the results of of_iomap() are assigned to both
reg_wrap_vstatus and reg_gusb2phyacc0 without being checked for NULL:

parse_phy_data() {
    ...
    phy_parameter->phy_reg.reg_wrap_vstatus =3D of_iomap(np, 0);
    phy_parameter->phy_reg.reg_gusb2phyacc0 =3D of_iomap(np, 1) + index;
    ...
}

Later, in rtk_phy_write(), the reg_wrap_vstatus pointer is dereferenced here
when writing to the register. Should we verify that the device tree memory
mappings were successful before they are used?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016180314.3176=
0-1-adilov@disroot.org?part=3D2

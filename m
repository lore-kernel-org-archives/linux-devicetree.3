Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84434388E44
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748593; cv=none; b=hRMKHQ7Jl3lQtL1URPvuKUvgB34hUfFT6SDG3+ph2c/0Ic/Mvyqr0ouW25SfyalvGHQjuS45MmbJnyDJysVaLTpjg+Jo2NvpayxIKAb4zn9950e3FaYt00BmS9v7bmyfUlyzgQzj2BFdOw2mubNK06t4n2gpOozGYFTeUtI/LNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748593; c=relaxed/simple;
	bh=qC5ivVBc46oj3P71ToO454+n+irzIYTZnK33a1eCNk0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q/BIx1fHlJDRjLqN+mcSCb36qHZ6Xd+ZqyCT7CY7PYrjylzlO11/NvNSdeY0Bxa19MkAIh5QbE3fq6SmIqoXQzzdcOEzP9zseDj9ytCm07r5AxshzOic/2xTBPru0tbaXyInBvwTyo8gufFjS8BBoApd3NSgbs7hSHdbRFfrx88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRV4ZLoH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRV4ZLoH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9041F00A3A;
	Wed, 26 Aug 2026 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787748590;
	bh=MJABSHQXgtG8wL6xDsCQLCdU8nGFmXe71QzCWKIPexk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hRV4ZLoHnj1vHXJ6vBpa+B/MwV/kleczJ2IjS2SXz1t4HAJQA9Wie/KVCiO//IMIP
	 yQetZBmTD7ZHDA+GsdI4yNwcRqG6RTMV1Zod0F2DmYTwUalU/TKkyceCS/3dE6UBnP
	 EkG99EdQmFPkx+X2lbm0lxDgN1FOzylmnwStZXzKLV9MHCLRcQy/pZzkbOzfNEOC5M
	 pEp5A2NoAfs85dPnyqE3GwWHkw0RxGEoo0sH7tmxY9FWD8i4N8ALAy5sM5aTxtJlYW
	 jEKixSXdGnkv5Y5MH+vQdcos2lNirWFjWR59j6hbCxUqZM5jv8LN/up2YuezQ0nO0k
	 i/+kpCspaJ7/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: mediatek: xsphy: add optional repeater support
 for USB2 ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Julien Massot" <julien.massot@collabora.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org
In-Reply-To: <20260826-mtk-usb2-repeater-usb2-v1-2-e8e48e2fd6d8@collabora.com>
References: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
 <20260826-mtk-usb2-repeater-usb2-v1-2-e8e48e2fd6d8@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 12:49:49 +0000
Message-Id: <20260826124950.5D9041F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing PHY operation delegation for `.power_on` and `.power_off=
`.
--

commit 8dbeea901dbdb1f9b33b21bd4a5f16b9ad7a5a78
Author: Julien Massot <julien.massot@collabora.com>

    phy: mediatek: xsphy: add optional repeater support for USB2 ports
   =20
    USB2 PHY port sub-nodes may carry an optional phys property referencing
    an external eUSB2 repeater.
   =20
    Fetch the repeater during probe using devm_of_phy_optional_get(),
    initialize and exit it alongside the USB2 PHY, and propagate USB mode
    changes to it.

> diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/=
phy-mtk-xsphy.c
> index cc1d66954212a..7bc3d6794d7b9 100644
> --- a/drivers/phy/mediatek/phy-mtk-xsphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-xsphy.c

[ ... ]

> @@ -438,7 +444,11 @@ static int mtk_phy_exit(struct phy *phy)
>  {
>  	struct xsphy_instance *inst =3D phy_get_drvdata(phy);
> =20
> +	if (inst->type =3D=3D PHY_TYPE_USB2)
> +		phy_exit(inst->repeater);
> +
>  	clk_disable_unprepare(inst->ref_clk);
> +
>  	return 0;
>  }

[Severity: Medium]
If an external repeater PHY relies on the PHY framework's phy_power_on()
(e.g., to enable core-managed regulators, resume runtime PM, or invoke its
own .power_on callback), will it silently remain unpowered and inactive
because mtk_phy_power_on() does not call phy_power_on(inst->repeater)?

For example, mtk_phy_power_on() currently only powers the internal instance:

static int mtk_phy_power_on(struct phy *phy)
{
	...
	if (inst->type =3D=3D PHY_TYPE_USB2) {
		u2_phy_instance_power_on(xsphy, inst);
		u2_phy_slew_rate_calibrate(xsphy, inst);
	}
	...
}

Similarly, could the missing call to phy_power_off(inst->repeater) in
mtk_phy_power_off() cause imbalanced power tracking or resource leaks in
the repeater PHY?

static int mtk_phy_power_off(struct phy *phy)
{
	...
	if (inst->type =3D=3D PHY_TYPE_USB2)
		u2_phy_instance_power_off(xsphy, inst);
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-mtk-usb2-r=
epeater-usb2-v1-0-e8e48e2fd6d8@collabora.com?part=3D2

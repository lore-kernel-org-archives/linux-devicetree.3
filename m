Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E604931DDBB
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362591; cv=none; b=YQb/n5XjdIt31UCTMcul1Ivh38Vbf7K6I9tym+37a4GmeFrD9ciA8KNW34AKSRfF+IVE8xhs0icVWkR3ekoeqI3bZc0+XvgJByyD7PQlouxrVizkGAkQBeY6+MpcOlAe+hVfICqPN4RViHrI26quXSyO3waWmLBMR0gbBUEcbFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362591; c=relaxed/simple;
	bh=UOfrjb+FEIdB2ixtYgyKdlzrKKVec7EiQJCYYcW9qHg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jAt/s+1VP+Ae9uJQh2f46Oq5Ci70X7KhWVNKXny8WvVYRbVUiQtuiUTiID7j8rK3Hksamf/Li4bwh9eiLdYvNws5xXfAsDzUCmVuKEsa+nE8+9OP7mU//dUUzVcdBW4mRpDBJeQZruzFc4CJ77l5ymrHAImuQhVnqa5zp5XrrMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bg0A/QRw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bg0A/QRw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE5F1F000E9;
	Mon, 10 Aug 2026 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786362589;
	bh=jlalvyiyDmb2SBE4WzGkySfWGm/AjNpIU++rR7WIYuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bg0A/QRwHamFcdKLmlQEaZjemUvFP/dbca3XFNqP6/hXHlrZ61u8o22zGa2EmEZBx
	 WwP3IbC9pGbAv4HxkqnBtYcYdQptXCHkh0TgQfY893+DL1KQQYlqY+1Nkkzsxf0GE0
	 NH+bZUdAEIaWmynFUciSnG3x2pPzNbuMP4FiKAHevfYPxKZuoLV4vHpLUVCsVWtVqL
	 VWKxqb/QNZ66m2WUsBEqg19lFB+Ibt0RGbJShWpw4YUoaXz35zGCdstI5p9jhyRKmg
	 EVcIE5UTlo/pebAOg+z5PqeKCI3pr+nrCInWpq70LVv9GURWOI9IbzQXtrHpXkQWdG
	 Tcnqas0Fphl+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] phy: qcom-ipq806x-usb: parse the tx-deamp-3_5db
 property as documented
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260810-msm8974-usb3-v1-7-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-7-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:49:47 +0000
Message-Id: <20260810114948.5EE5F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] The patch breaks backward compatibility with existing device t=
rees by replacing the `qcom,tx-deamp_3_5db` property with `qcom,tx-deamp-3_=
5db` without providing a fallback. The commit message incorrectly claims th=
at no in-tree device tree uses either spelling, but `arch/arm/boot/dts/qcom=
/qcom-ipq8064-v2.0.dtsi` actively sets `qcom,tx-deamp_3_5db =3D <32>;`. Con=
sequently, the driver will silently fail to read this property from existin=
g deployed DTBs and fall back to the default value, leading to an unintende=
d hardware configuration change.
--

--- Patch [7]: [PATCH 07/10] phy: qcom-ipq806x-usb: parse the tx-deamp-3_5d=
b property as documented ---
commit 0d730340df80865649e4381722ca35e1603f1cad
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

phy: qcom-ipq806x-usb: parse the tx-deamp-3_5db property as documented

This commit updates the driver to parse the "qcom,tx-deamp-3_5db" property,
matching the device tree binding documentation. It replaces the old
"qcom,tx-deamp_3_5db" spelling.

> The driver reads the transmit de-emphasis override from
> qcom,tx-deamp_3_5db while the binding documents qcom,tx-deamp-3_5db,
> so a device tree following the binding is silently ignored and the
> default is used instead. No in-tree device tree uses either spelling.

Is the statement about in-tree device trees accurate? Looking at the source,
arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0.dtsi actively sets
"qcom,tx-deamp_3_5db =3D <32>;".

> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qu=
alcomm/phy-qcom-ipq806x-usb.c
> index 3d3e9d6da298c..86e8e869a743f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> @@ -561,7 +561,7 @@ static int qcom_ipq806x_usb_phy_probe(struct platform=
_device *pdev)
>  				     &phy_dwc3->rx_eq))
>  		phy_dwc3->rx_eq =3D SSPHY_RX_EQ_VALUE;
> =20
> -	if (device_property_read_u32(&pdev->dev, "qcom,tx-deamp_3_5db",
> +	if (device_property_read_u32(&pdev->dev, "qcom,tx-deamp-3_5db",

[Severity: Critical]
Does replacing this property without a fallback introduce a regression for
backward compatibility with existing device trees?

Since device tree bindings are a stable kernel ABI, systems booting with an
older DTB (or the current in-tree DTB) might silently fail to read this
property and fall back to the default value instead of the configured value.

Should qcom_ipq806x_usb_phy_probe() maintain support for the legacy
underscore property as a fallback?

>  				     &phy_dwc3->tx_deamp_3_5db))
>  		phy_dwc3->tx_deamp_3_5db =3D SSPHY_TX_DEEMPH_3_5DB;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-msm8974-us=
b3-v1-0-1a47e1185524@oss.qualcomm.com?part=3D7

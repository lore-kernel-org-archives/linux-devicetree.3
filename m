Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8C73CAA38
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363461; cv=none; b=rIfpXd9l8fuvCI9HHXxpiPffkoiBF4FGXnfArokFZj5TFUlJi5E9651IAyWj/bK+gyGaQIVzd12cG2n3uQCcj9Cy4jtSZvDeDK4am30knTfwljwnsKFzgf75SjE44VSmFWYdz9UEyB8Ml8s2amniFDlHa+SiEM++CltHf6f9yOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363461; c=relaxed/simple;
	bh=DFqfHE90r7gM7BUWt4i0HbP1CBrRaMQmK9+/1x/Pgis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fDw3tZklHEuX66ZKtVPpn5z0tWyELilwJc7KGqZJRjW5ZGPHQzONXag3NmdPX+ZiwD67KND1yBHvU8z4nFgnf3CtwL4eUdmFVqpjkD14CnN5RoQo1w/iiNGoMl4iQTzBqKul1PoJAz/jG2sozo0Dilm9NaxRZ7rsOaNQJ96CiHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWrQSfXf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWrQSfXf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401251F00A3A;
	Mon, 10 Aug 2026 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786363459;
	bh=qxsIEl1rwFqOGlrp/qdX3U5VONn9ZrHAnlXGv8Tfqro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QWrQSfXf76nvYGzoZLkQRTIPa3pvpW6wTEKAXd9dOMhu/zFOpbZfW6faq65yqubXd
	 fjZlyEhiwOZKgm8w+p/09XgyagFJtsftTTVJIjpfgTTsvEd44M/b0bmz9TZ4w2lotV
	 ht5fvKNqBjH3kUq92t5TWqsFJT4OZl9OT8oyI4M4OAbDRa7LTMrnx4+AaXFLYZkQRY
	 TAW+/sEv5rotflS3YoeSa0qhHb4cGfbXlf8Lc1uwXiSy90PRPesxvlEbCpFZ9gd5Ok
	 KTVcZiCRXnfgSt5u4vl9/Ed33LmQtpstHVhKhei9/W5rhuy7SeKJnQXRzt/kxECJKo
	 YMrACA9QMto7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/10] ARM: dts: qcom: msm8974: add the USB3 controller
 and its PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810-msm8974-usb3-v1-9-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-9-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 12:04:18 +0000
Message-Id: <20260810120419.401251F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] DT Schema violation: the `compatible` property for `usb3_ss_phy` us=
es an array of two strings instead of a single string.

Pre-existing issues:
- [High] Data race on physical PHY control register between two uncoordinat=
ed drivers.
--

--- Patch [9]: [PATCH 09/10] ARM: dts: qcom: msm8974: add the USB3 controll=
er and its PHYs ---
commit 688cb2c7a84a066e54c52b8eab7f37e81311d8fb
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

ARM: dts: qcom: msm8974: add the USB3 controller and its PHYs

This commit describes the primary USB3 controller (DWC3) and its High-Speed
and SuperSpeed PHYs for the MSM8974 SoC. It initializes both PHYs to ensure
proper upstream enumeration.

> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8974.dtsi
> index 06c0af0aa3176..bac3c8772e0a2 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi

[ ... ]

> @@ -713,6 +713,53 @@ blsp2_i2c6: i2c@f9968000 {
>  			#size-cells =3D <0>;
>  		};
> =20
> +		usb3: usb@f9200000 {
> +			compatible =3D "qcom,msm8974-dwc3", "qcom,snps-dwc3";
> +			reg =3D <0xf9200000 0xfc000>;

[Severity: High]
This isn't a bug introduced by this patch, but does mapping this region
expose a data race on the physical PHY control register?

The dwc3-qcom wrapper driver maps this region, calculating qscratch_base
as 0xf92f8800, and performs read-modify-write operations on offset 0x30
(physical 0xf92f8830) during role switches or gadget start/stop.

Simultaneously, the newly bound phy-qcom-ipq806x-usb driver maps the
exact same physical address bypassing exclusivity in the usb3_ss_phy
node below.

[ ... ]

> +		usb3_ss_phy: phy@f92f8830 {
> +			compatible =3D "qcom,msm8974-usb-phy-ss",
> +				     "qcom,ipq806x-usb-phy-ss";

[Severity: Low]
Will this compatible array cause make dtbs_check validation to fail?

The DT binding schema qcom,ipq806x-usb-phy-ss.yaml strictly defines the
compatible property as either "qcom,ipq806x-usb-phy-ss" or
"qcom,msm8974-usb-phy-ss".=20

Providing a string array of both violates this definition.

> +			reg =3D <0xf92f8830 0x30>;

[Severity: High]
This is a pre-existing issue, but returning to the mapping overlap, the
SuperSpeed PHY driver explicitly maps the exact same physical address
(0xf92f8830) here and modifies its offset 0x00 without coordination.

Since both drivers perform uncoordinated read-modify-write operations
(sometimes with large delays like msleep(30) mid-RMW in the PHY driver),
can concurrent operations clobber the physical register state?

This could lose bits like SSUSB_CTRL_SS_PHY_EN or LANE0_PWR_PRESENT,
corrupting the power state and breaking USB enumeration during concurrent
plug/unplug events and runtime PM transitions.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-msm8974-us=
b3-v1-0-1a47e1185524@oss.qualcomm.com?part=3D9

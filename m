Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5594641B37D
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528279; cv=none; b=G6JqyYOOQ2+qX5DRwDMVXJSoUvRLDHX04B+sXqOsUo1IdBJQMOwvQqHpFFUVFUYd9fxcpmcm0l5IBc/6tVxmjiIrJAY8ZutJGlmFeJ3Ie1HmSlf4bZe9ELeVePRO8g4Q/hW1edfcvlAfrbSGo9DLK6AtMkSDVkHUr8cOnnEci9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528279; c=relaxed/simple;
	bh=3WSdP+d4/UJzoHWkDojZ12Lv9qdHyBoVLGbCmKY/Cc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NwZp19GH6aAl+axia/wQCKJMvfgjA6lO5CbZz/RFmFehg1UJX9eaOGzHuf9Pd64LVriQ64dTTaVTqcItIAlSWwaLVUsD1p5yiFVVa8rI9dNDiuIgzxtkB3Pw8WLWc/toYBlbecThpXcoYfXBaQ6d/iH+GBT3LjN7zjKDDH8y16g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VN3+mus5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VN3+mus5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DFF1F000E9;
	Wed, 12 Aug 2026 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528277;
	bh=if0Csk/A9EcSIrsPRD2aB9x/Gl9MgImspW6Oz99kkVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VN3+mus54DvmqRwFNmi5e+6EB4tukUNkrFMGMJU8Lj+D0C+uK5TP354mj+a1B+dkN
	 gCsgTFvGs6Lqs+9d1cJ71xcubdfFURt24Jn32Fw17KkJS1kbkKfmw7NL7PIoKwos3Y
	 hWMGNTXmHU6AM/4OUBtnVjNui0lVTpps4RRcu/ic4KY+487W1lbbN858CC8SYw/5SD
	 EkAqMM7hNjk8B7azASHUrFAEAqRew7eB/yHmhWQLrawZzHLgU8Mm5asdVIGKPWFz4U
	 7TQ6dXHY5rv3LdupggZD15euBSnx+x/VyClMKoBhQyLyw8ULLfmxgQ0LlEGCp92lhV
	 B3d237hguigJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/14] arm64: dts: qcom: ipq5018: Add USB Super-Speed
 PHY node
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812-ipq5018-usb3-v2-3-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-3-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:51:16 +0000
Message-Id: <20260812095117.50DFF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `platform_set_drvdata()` in the PHY driver probe function =
leads to a NULL pointer dereference on driver removal.
--

--- Patch [3]: [PATCH v2 03/14] arm64: dts: qcom: ipq5018: Add USB Super-Sp=
eed PHY node ---
commit 97eadd80983348dbdd8dbea710c772858c61ccf6
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5018: Add USB Super-Speed PHY node

Add USB Super-Speed UNIPHY node and populate the USB DT clock on the GCC
node for the GCC to gate the PIPE clock supplied by the USB3 PHY.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5018.dtsi
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -179,6 +179,23 @@ usbphy0: phy@5b000 {
>  			status =3D "disabled";
>  		};
> =20
> +		usbphy1: phy@5d000 {
> +			compatible =3D "qcom,ipq5018-uniphy-usb-ss-phy";

[Severity: High]
Does enabling this PHY expose a NULL pointer dereference in the driver upon
removal?

Looking at the driver for this PHY in
drivers/phy/qualcomm/phy-qcom-uniphy-usb-ss-22ull.c, the
qcom_uniphy_usb_probe() function allocates the uniphy state but fails to sa=
ve
it to the platform device:

drivers/phy/qualcomm/phy-qcom-uniphy-usb-ss-22ull.c:qcom_uniphy_usb_probe()=
 {
    ...
	phy_set_drvdata(uniphy->phy, uniphy);

	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
    ...
}

When the driver is unbound, qcom_uniphy_usb_remove() retrieves a NULL point=
er:

drivers/phy/qualcomm/phy-qcom-uniphy-usb-ss-22ull.c:qcom_uniphy_usb_remove(=
) {
	struct uniphy_usb *uniphy =3D platform_get_drvdata(pdev);

	qcom_uniphy_usb_mux_select(uniphy, false);
}

This NULL pointer is then passed to qcom_uniphy_usb_mux_select(), causing a
crash.

Should a fix adding platform_set_drvdata(pdev, uniphy) be included to preve=
nt
unbinding this device from causing a kernel oops?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D3

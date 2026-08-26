Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD41345CAE
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764786; cv=none; b=jUUUvRZdAvKLOTSt3GAwUpWRz+3oA0UBglcrO8IglzKmYsskslbh/FWGxDARmbSKQrGujHb+iXAlijzm1S2QI9UIhtSJxSNY7N5NWKzeVmG3vKUlj9shOQQDWgKUu9yotKon7JqYeHPZ6v9Rm/Te73vR9YOJh4QzkljNx5rYe9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764786; c=relaxed/simple;
	bh=Y7Y8kQbD2L+Jj1iw5z/w1+LstEisR5Q+eRDdSuMwk8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rDjlrwq5LffTUYvvGeGK7rviJtp5wHJdZ8XcTme+PuCKhxkjuB7OOio2KcBooIGcqFGdR9w8ehas4po4KsrrnI02BtJPexU/JzwdDv2SDc36uTaxczETUZT64uS7z0qF1zprN8QHIeYQG5m2GCiqHZSor1wS+Uyu1lg/BNdXpag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=embOOI2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="embOOI2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6141F000E9;
	Wed, 26 Aug 2026 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787764770;
	bh=uHyXm+BOanKliWB60UDmv5iBUXK3VdSPhikNVeJoSKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=embOOI2NaN+/5tkxCWkhV5f66NLcYjywaeUggagb5pPRNKCe2Jcjv/Qsh5Ouu5rvE
	 byODlW1deBgotffMIUCujvmIbOZy3lNpQyM5fcnkczGHsWPmUOssluhsRBVPghaQ5V
	 Gz8WXeEd91UDWsdubQle+1zCxoj015I5tcYtn8T6rquX1wDu1zRq9NOhNHDS9B31Rx
	 BwwjY6Un+XhSxT/hygPCRxgg2xK7GztVsUdGW6hjyA3oyyyJDVG1XFQ5c3kgfEncVc
	 tdUEUL9D3ssZWbtfToWTH5IPDi5jhotmzKU7e4oHLcTtBBYZZzyK0OBsPspy1QfRQG
	 LboAjkauSy7mA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: conor+dt@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-5-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
 <20260826-eusb2-interrupt-v6-v6-5-ae2601cfa80c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 17:19:29 +0000
Message-Id: <20260826171929.DC6141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The driver performs a fragile resource lookup for the USB2 PHY b=
y hardcoding index 0 instead of resolving it by its defined name.

Pre-existing issues:
- [High] The legacy wrapper driver (`dwc3-qcom-legacy.c`) completely misses=
 the new eUSB2 remote wakeup interrupt logic, breaking remote wakeup on ups=
tream eUSB2 platforms utilizing the legacy binding.
--

commit fb96885fe62bdb840bbac9d8be2fe275a3e945ae
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets

This commit modifies the dwc3 qcom driver to handle wakeup interrupts
differently for eUSB2 PHY targets based on connected device speed. It checks
for an eUSB2 PHY and configures DP/DM interrupt line states accordingly.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f43f73ac36ff1..9ba7ea31b524f 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
[ ... ]
> -static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
> +static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int=
 port_index)
>  {
> +	struct dwc3_qcom_port *port =3D &qcom->ports[port_index];
> +
>  	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
> =20
>  	/*
>  	 * Configure DP/DM line interrupts based on the USB2 device attached to
> -	 * the root hub port. When HS/FS device is connected, configure the DP =
line
> -	 * as falling edge to detect both disconnect and remote wakeup scenario=
s. When
> -	 * LS device is connected, configure DM line as falling edge to detect =
both
> -	 * disconnect and remote wakeup. When no device is connected, configure=
 both
> -	 * DP and DM lines as rising edge to detect HS/HS/LS device connect sce=
nario.
> +	 * the root hub port. For non-eUSB2 targets, when HS/FS device is conne=
cted,
> +	 * configure the DP line as falling edge to detect disconnect and remote
> +	 * wakeup. When LS device is connected, configure the DM line as fallin=
g edge
> +	 * for the same. For eUSB2 targets, the lines are swapped and rising ed=
ge is
> +	 * used: DP line for LS and DM line for HS/FS device detection. When no
> +	 * device is connected, configure both DP and DM lines as rising edge to
> +	 * detect HS/FS/LS device connect scenario.
>  	 */
> =20
>  	if (port->usb2_speed =3D=3D USB_SPEED_LOW) {
> -		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
> -					    IRQ_TYPE_EDGE_FALLING);
> +		if (qcom->has_eusb2_phy)
> +			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
> +						    IRQ_TYPE_EDGE_RISING);
> +		else
> +			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
> +						    IRQ_TYPE_EDGE_FALLING);

[Severity: High]
This is a pre-existing issue, but does the legacy wrapper driver=20
(drivers/usb/dwc3/dwc3-qcom-legacy.c) completely miss this new eUSB2 remote
wakeup interrupt logic?

The device tree for the Qualcomm SAR2130P SoC actively uses the legacy wrap=
per
binding (compatible =3D "qcom,sar2130p-dwc3", "qcom,dwc3") along with an eU=
SB2
PHY. When this SoC suspends the USB controller, dwc3_qcom_enable_port_inter=
rupts
in the legacy driver configures the interrupt polarity incorrectly (as fall=
ing
edge instead of rising edge) because it lacks the eUSB2 checks introduced h=
ere.

Is an update required in the legacy wrapper so that upstream eUSB2 platforms
utilizing the legacy binding can correctly detect remote wakeup events?

[ ... ]
> @@ -683,6 +705,17 @@ static int dwc3_qcom_probe(struct platform_device *p=
dev)
>  	if (ignore_pipe_clk)
>  		dwc3_qcom_select_utmi_clk(qcom);
> =20
> +	phy =3D devm_of_phy_get_by_index(dev, dev->of_node, 0);

[Severity: Medium]
Will this break if the USB3 PHY is placed first in the phys property array?

If index 0 retrieves the USB3 PHY instead, phy_get_type() will return
PHY_TYPE_USB3 rather than PHY_TYPE_EUSB2, falsely evaluating has_eusb2_phy
to false. The DT binding schema (snps,dwc3-common.yaml) does not enforce
the ordering of the phys array, but rather relies on the phy-names property
(enum: [usb2-phy, usb3-phy]).

Would it be more robust to use devm_phy_get(dev, "usb2-phy") to resolve the
PHY by its defined name instead of hardcoding index 0?

> +	if (IS_ERR(phy)) {
> +		if (PTR_ERR(phy) !=3D -ENODEV) {
> +			ret =3D dev_err_probe(dev, PTR_ERR(phy),
> +					    "failed to get usb2 phy\n");
> +			goto clk_disable;
> +		}
> +		phy =3D NULL;
> +	}
> +	qcom->has_eusb2_phy =3D phy && (phy_get_type(phy) =3D=3D PHY_TYPE_EUSB2=
);
> +
>  	qcom->mode =3D usb_get_dr_mode(dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-eusb2-inte=
rrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com?part=3D5

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEFA471CE6
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806306; cv=none; b=HArdv7IzC7UKMefrMDWV7kdsXzQ4tUB6OZWvPe+nZsqx+6IYGJgwaCBhFeJF+zVQAH2Ho6SPe1BqB/2lElL6HQBKITooPsI0pEljXGq5FcNJiP8FAbNYLgKpUf/E8Jmm3DXoXMCzszwgBToiTba5mGQU3/Fr/OWDZRnXqmKXb7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806306; c=relaxed/simple;
	bh=+Z2o2+OeWwf7TMSK6JgFeKAT/ZHDmeqoaq76XEuH288=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c6jNflUatnmQgkCIz5wh+AQFwmw5I9pSDFvuKdYtccYkL+dhPWBjyKtlPWXq1mSrFUdlSP9UB2i0o0GWAscdf2qpF4WnLmi13ZNVufLqtTLzTFoFU1f5sLbZAzUXYVMa3k1m+LeMJEzU/MIWi9S+yB3Oj5IdS8P6g/RrA1RneqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhCTzTbI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhCTzTbI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1152C1F000E9;
	Thu, 23 Jul 2026 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784806300;
	bh=zTHmzbpmqcAkcVzqNFSrhGQW6IhnCGf+SrtuCSFJ24w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NhCTzTbIdxxXsQpPQuPUVm80tZmjDffm3qFZLd5uAt9RfWfTt5tEQxdk+M1+hS+RL
	 C6Yr0IkKpYXBy2ZYutGT6/Fxr1JKEft7nCJULIMvASwCsYPe8v+/WK97XcsPOhAn0r
	 unCrdtRgLT6RQGNaFtv0BqW3CdOxavmSWme2qkzTydhwaUvirlAC2WhOHOMhRdR5Sc
	 Lt4BcEWp7h/rXw5i7T9hJlYzGcsHwk7mq7W/qq8/M4yL9G17Xf7IImQyIwZ7Y/cdNc
	 QVBDT9cO0Vy60PSLV4ggM5kFBYvnfdaOW58Skj2NVDISB8iU1BWgaKmNKTsbjv8eDU
	 HKJi4pLPYpsig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-5-f32ea6c1a318@oss.qualcomm.com>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-5-f32ea6c1a318@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:31:39 +0000
Message-Id: <20260723113140.1152C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Resource leak on devm_phy_get() error path in dwc3_qcom_probe().
- [High] Probe fails due to unhandled -ENOSYS when CONFIG_GENERIC_PHY is di=
sabled.
- [Low] Comment describing DP/DM interrupt polarity contradicts new eUSB2 l=
ogic.
--

--- Patch [5]: [PATCH v5 5/5] usb: dwc3: qcom: Modify interrupt handling fo=
r eUSB2 Phy targets ---
commit e7aac8b655de03b8e81bfa727922960500cb9ae3
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets

This commit modifies the interrupt handling logic in the DWC3 Qualcomm
driver to support eUSB2 PHY targets. It queries the PHY type during
probe and configures remote wakeup interrupt polarities based on the
eUSB2 specification for different device speeds.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f43f73ac36ff1..4c559b97c6276 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
[ ... ]
> @@ -289,8 +298,10 @@ static void dwc3_qcom_disable_port_interrupts(struct=
 dwc3_qcom_port *port)
>  	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
>  }
> =20
> -static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
> +static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int=
 port_index)
>  {
> +	struct dwc3_qcom_port *port =3D &qcom->ports[port_index];
> +
>  	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
> =20
>  	/*
> @@ -303,12 +314,20 @@ static void dwc3_qcom_enable_port_interrupts(struct=
 dwc3_qcom_port *port)
>  	 */

[Severity: Low]
This isn't a bug, but does this comment block need to be updated?  The newly
added eUSB2 logic below configures these lines as rising edge, which
contradicts the behavior described in this comment.

> =20
>  	if (port->usb2_speed =3D=3D USB_SPEED_LOW) {
> -		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
> -					    IRQ_TYPE_EDGE_FALLING);
> +		if (qcom->has_eusb2_phy)
> +			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
> +						    IRQ_TYPE_EDGE_RISING);
[ ... ]
> @@ -683,6 +703,19 @@ static int dwc3_qcom_probe(struct platform_device *p=
dev)
>  	if (ignore_pipe_clk)
>  		dwc3_qcom_select_utmi_clk(qcom);
> =20
> +	if (qcom->num_ports =3D=3D 1)
> +		phy =3D devm_phy_get(dev, "usb2-phy");
> +	else
> +		phy =3D devm_phy_get(dev, "usb2-0");
> +
> +	if (IS_ERR(phy)) {
> +		if (PTR_ERR(phy) !=3D -ENODEV)

[Severity: High]
If the kernel is compiled without CONFIG_GENERIC_PHY, devm_phy_get() will
return -ENOSYS. Since this check only ignores -ENODEV, will this cause the
probe to fail entirely for configurations without generic PHY support?

> +			return dev_err_probe(dev, PTR_ERR(phy),
> +					     "failed to get usb2 phy\n");

[Severity: High]
Does this return directly without jumping to the clk_disable error label?

Earlier in dwc3_qcom_probe(), clk_bulk_prepare_enable() is called.  If
devm_phy_get() fails with an error like -EPROBE_DEFER, will this leak the
clock prepare and enable counts?

> +		phy =3D NULL;
> +	}
> +	qcom->has_eusb2_phy =3D phy && (phy_get_type(phy) =3D=3D PHY_TYPE_EUSB2=
);
> +
>  	qcom->mode =3D usb_get_dr_mode(dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-eusb2-int-=
handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com?part=3D5

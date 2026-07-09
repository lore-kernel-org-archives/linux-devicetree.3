Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB633EA946
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588073; cv=none; b=K+tXkqFvVG8Ho71Ep3YGj7OB+pEzsNN/P9mWKHo2AcWKb6hULR9qtjqDTqVj4vfDicerbo8FKAZId6G/jKy9aw/Co7MrJsdwRNoC6mnsbf1mWbPK5XrPq1jwLPKOY09Ak1My0FdXxUKkCDgbvet9ceQQdZoCSA7wdSL8qCffsa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588073; c=relaxed/simple;
	bh=NpSEw1QY/OCLTyPKRpryvxLlYxO0LgNIjvsoDYy1dcw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zz25eI44qasi6OjCJ2Na/5sWsFqEoHkhjvp9LylNl/WaMgLrXF0VeVDrXyPsctVOZxDkeqoBHNLAlhoB/NktqLZHnN2G5+Fq+PbWjckV1KPLRDrqBUywP0YiiGiWPYHihxr1F1RkU2DxZGDPF4HPf2xRvhozUssFZ2boJUUkZs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HclzqrJT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HclzqrJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7F61F000E9;
	Thu,  9 Jul 2026 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783588071;
	bh=sgHKIv59V201sw0kPW41aIEnzoVPUR9uKvcvP/f1/Ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HclzqrJT6ZjjEJUT9l300/S7upI+nWhmD6NgzZCuiBAnTAIDS/yYFvGkDU+F047l3
	 PMjXElyCGJ9g5xFDgRFN5Ve25d5MsSVLpGzz4rAI2adlewKLWHbbeh51FEDSA1H5tD
	 6ajd4ex6IBq1SYkQ+9fngbatCnwhsV4BflXqF8PzfvKniccPJ3BfgRHqLV3WMQ7qg0
	 +xiDWrrNKbvtWU6DqfSONtbuMm5xRgu4lzgm+sYM3yUn1tsh6YkQAptDeth4re7mJi
	 QmU3Z7OwkEab8x363tUD4SQBbe8hFm+vhvoZ87C6JAbDV/ABkGFifPh7rVdCgJa9Jp
	 9ihbMXSmAHpBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-eusb2-interrupt-handling-v5-v4-2-d4f993925608@oss.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-2-d4f993925608@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:07:51 +0000
Message-Id: <20260709090751.8D7F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing wakeup on disconnect for eUSB2 PHY targets in host mode.
--

--- Patch [2]: [PATCH v4 2/2] usb: dwc3: qcom: Modify interrupt handling fo=
r eUSB2 Phy targets ---
commit abfd7961b2abcf9ee261f91bb2feaa36f4706570
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets

This commit modifies the interrupt handling for eUSB2 PHY targets in host
mode. It updates the wakeup interrupt configuration based on device speed to
correctly detect remote wakeup signaling on the eD+ or eD- lines according
to the eUSB2 specification.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f43f73ac36ff1..65996d47da1f0 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c

[ ... ]

> @@ -272,15 +273,23 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
>  	disable_irq_nosync(irq);
>  }
> =20
> -static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *por=
t)
> +static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom *qcom, in=
t port_index)
>  {
> +	struct dwc3_qcom_port *port =3D &qcom->ports[port_index];
> +
>  	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
> =20
>  	if (port->usb2_speed =3D=3D USB_SPEED_LOW) {
> -		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
> +		if (qcom->has_eusb2_phy)
> +			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
> +		else
> +			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
>  	} else if ((port->usb2_speed =3D=3D USB_SPEED_HIGH) ||
>  			(port->usb2_speed =3D=3D USB_SPEED_FULL)) {
> -		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
> +		if (qcom->has_eusb2_phy)
> +			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);

[Severity: Medium]
Will this result in skipping the disconnect interrupt cleanup for eUSB2
PHY targets? It seems we only disable the single interrupt line used for
remote wakeup here, mirroring the omission of the disconnect interrupt in
the enable path.

> +		else
> +			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
>  	} else {
>  		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
>  		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);

[ ... ]

> @@ -303,12 +314,20 @@ static void dwc3_qcom_enable_port_interrupts(struct=
 dwc3_qcom_port *port)
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
>  	} else if ((port->usb2_speed =3D=3D USB_SPEED_HIGH) ||
>  			(port->usb2_speed =3D=3D USB_SPEED_FULL)) {
> -		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
> -					    IRQ_TYPE_EDGE_FALLING);
> +		if (qcom->has_eusb2_phy)
> +			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
> +						    IRQ_TYPE_EDGE_RISING);

[Severity: Medium]
Does this setup miss wakeup events when a device is disconnected?

The standard USB configuration uses a falling edge to detect both remote
wakeup and disconnect (SE0 state). By using only a rising edge interrupt
to detect remote wakeup (K-state), it seems we fail to configure a falling
edge on the other line to detect device disconnect.

If an eUSB2 device is disconnected while the host is suspended, it appears
the controller will not wake up, leaving the host out of sync with the
physical port state.

> +		else
> +			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
> +						    IRQ_TYPE_EDGE_FALLING);
>  	} else {
>  		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
>  					    IRQ_TYPE_EDGE_RISING);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-eusb2-inte=
rrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com?part=3D2

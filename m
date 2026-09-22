Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8853A397
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075945; cv=none; b=CbJjamxnE74yl2vnhDj+qcY7C2qam2vY7PoYzvb4Fyrkd+HZaXadls83HIRfNVCEQlXX1RAKFWUR/VPXTu+RCE2hfVbFOuzDtlOxLptjfL9IltZ9CUs91Z9qO71Vw4Oisq6sZAXeqDMij4XJcYS21qVJCQO8ej7GUsuOyU5/4L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075945; c=relaxed/simple;
	bh=jOmikA/O5fP9pDV1XBzoBiTDTyTc40YXTiJ8sKQG1ts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VYzgT6zfKdX65fXlxqWVBZZj6DALweNx5hYWRcMMlVk9UzIuRWRUw8JZg720dNjN3hsBYArlB1WvfBrdehs7cYoNJP1AALKKtcwinLyDAy+kaPCHJOvaojRO2n54jdUNkU/jT8pxYFUkfIZ7UehiMqOQhztgjAmUpP958TlN2nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGGqE83f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGGqE83f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BC41F000FF;
	Tue, 22 Sep 2026 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790075943;
	bh=9nIpG03lJ0YfXPoQK6DiDiPPqzvvaOv8r65KUl1uIC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kGGqE83fmcceWe2Q0q2X/WjmsQNOsLKROgvvZGD0PA2LAWQXjVg2jvI+HvepBkxjl
	 9vj73W2zhOxkgh3mkXE1ygmQF42olYicI7fZ6P9hWMI/Yp4F81Hh2M9U8h7yNN/m4h
	 2XmdTjxddLpbPAvEGwo2xwhagvQPHBaYflphJ0tbCRsfMWM/6Yi+Ei6q6VzwxqfOZW
	 DSjRECENMaEzLWTLToavk2jsVh6pKZiiQIY5H+4EUF/xyhDQl0c1a/FwyIh8dQICpN
	 3gxM2b95ygEcJBdfp/E45Iml7Xa0oXzPOjEwhz7YSIDUAuzrpNs1SPsPzJwmWLUP9g
	 zsWtzMSU5c4yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sandie Cao" <sandie.cao@deepcomputing.io>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 11:19:02 +0000
Message-Id: <20260922111903.32BC41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] dt: incorrect clock assignment for USB3 port B and C companion PHYs
- [High] dt: incorrect hardware interrupt number assigned to usb3b controll=
er
- [Low] dt: missing Type-C and PD bindings for claimed port features
- [Low] dt: space indentation used instead of tabs for usb3c node
--

commit 01e320732a69960438751a5d51ee72cfcf2179bc
Author: Sandie Cao <sandie.cao@deepcomputing.io>

riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB=
 phy support

This commit adds USB device nodes to the DeepComputing FML13V05 board,
configuring four USB-C ports with various features like PD 3.0 and DP 1.4.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b=
/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index 804abc85602ab..55b0f63dcb2e3 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts

[ ... ]

> +&usb3b {
> +	status =3D "okay";
> +};

[Severity: Low]
Are the 'usb-c-connector' nodes and OF graph linkages missing here? The
commit message claims Power Delivery and DisplayPort Alt-Mode capabilities,
but without these bindings, any kernel-managed role switching, PD negotiati=
on,
or DisplayPort muxing might not function when a Type-C device is connected.

[ ... ]

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index b9977e78e096a..ae3f8bb1e5ed1 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi

[ ... ]

> +		usb3b: usb@81400000 {
> +			compatible =3D "spacemit,k3-dwc3";
> +			reg =3D <0x0 0x81400000 0x0 0x10000>;
> +			interrupts =3D <125 IRQ_TYPE_LEVEL_HIGH>;
                                      ^^^

[Severity: High]
Is this the correct hardware interrupt number for usb3b? Since the adjacent
controllers usb3c and usb3d use 148 and 149, 125 appears to be a copy-paste
error (perhaps it should be 147?). Using the wrong interrupt vector could
prevent the kernel from processing USB events on Port B, causing it to fail=
 on
boot.

> +			interrupt-parent =3D <&saplic>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB3_PORTB_BUS>;

[ ... ]

> +		usb3b_u2phy: phy@81500000 {
> +			compatible =3D "spacemit,k3-usb2-phy";
> +			reg =3D <0x0 0x81500000 0x0 0x200>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB2_BUS>;
                                                ^^^^^^^^^^^^^^^^^

[Severity: High]
Should this use the port-specific clock (CLK_APMU_USB3_PORTB_BUS) instead of
the shared USB2 bus clock? If the independent USB2 host controller is disab=
led
or runtime gated, the USB3 ports could lose their companion PHY clocks,
leading to initialization failures or USB disconnects during power manageme=
nt.

> +			#phy-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +               usb3c: usb@81700000 {
  ^^^^^^^^^^^^^^^

[Severity: Low]
Does this node use space indentation? It looks like 15 spaces were used
instead of tabs.

> +			compatible =3D "spacemit,k3-dwc3";
> +			reg =3D <0x0 0x81700000 0x0 0x10000>;

[ ... ]

> +		usb3c_u2phy: phy@81800000 {
> +			compatible =3D "spacemit,k3-usb2-phy";
> +			reg =3D <0x0 0x81800000 0x0 0x200>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB2_BUS>;
                                                ^^^^^^^^^^^^^^^^^

[Severity: High]
Should this also use its port-specific clock (CLK_APMU_USB3_PORTC_BUS) inst=
ead
of the shared USB2 bus clock? Similar to usb3b_u2phy above, relying on the
standalone USB2 bus clock could cause power management issues for this PHY.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922110231.3426=
011-1-sandie.cao@deepcomputing.io?part=3D2

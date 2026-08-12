Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03514359A6B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550193; cv=none; b=JQY/kEk04w+ZLbSIPbJ0E3I3FW+yb868iggSYHWs4q+8XbH6HTonhRuw5OPxdPKr0l+cCXjoUQqHZLO2w0Jnla/T/g/gN5DWRow6Hd3DgEkJAd2NWpbKhs44zfzVBvOgsCIP9qCZyilFpSofg/WVsfTPwsrlg8fr+w2cLbZKU7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550193; c=relaxed/simple;
	bh=hz8MxFBQMnnXOloM6kM34y7gPVkhMJ6hqy4IUTq+Sbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c/uiMv3nCpci3ZMH8WUqDvANzfnnVxRhBD+KRe5L+A8wNv+erUxGfhIdQTr+KV1YXJjNNXiqvT5xmFOvF18RZ6sarT4RrWsXiOvItP4yP3Tprb9wCSR4U01Kfd2kgwzUhpHKouYd2VkBzt8/aQlFWjgxXPiyBL7yto5XzrpXrOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKxsgwaJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKxsgwaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499EE1F000E9;
	Wed, 12 Aug 2026 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550191;
	bh=sGvxxdW0ijxYG8mUse19l12AvdDLAeTFoZjznis2MBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PKxsgwaJHKkzsQ3O+X7iPbQ8Kh5/JDFkddEbduNsoUVI+YW+LJ0x640S5ArDmoKRi
	 OzX64bJrg9GW7vcmjtbo1moqcAZgIet1whDN4kmFqK30jWFdLuxKUtQM+ulAUaodvz
	 upBklkM7NhSl+UypnQfwCXqDbdFR6O67CAxLKQC/lPfHJytB1KhyfG4hodCRIbvS+u
	 J4z+xMAKzhzYuFD5ifPQ+BkBElhbBEjcucVnucLG+blC1isRaGpOTqpgrtLFkw7ZnU
	 nn2HeguG4v6MdWUabkdsvRU/TPtppXfOa1DBlWqPSvFnSLudgqZflbyl+GVW9XZyj9
	 hFmRvXBLETnzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/9] arm64: dts: renesas: r9a08g046: Add USB2.0
 function device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812141940.246223-8-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
 <20260812141940.246223-8-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:56:30 +0000
Message-Id: <20260812155631.499EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unprobeable Hardware Dependency causing USB controllers to fail
- [Low] Missing Device Tree Binding Documentation for new compatible string
--

--- Patch [7]: [PATCH v7 7/9] arm64: dts: renesas: r9a08g046: Add USB2.0 fu=
nction device nodes ---
commit 300a9b2b9e754dfa39a649f78e39731613f70c2b
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Link: https://lore.kernel.org/all/20260707145135.247565-3-biju.das.jz@bp.re=
nesas.com/

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index 2d8c8fd8a01cd..7cf29aed52110 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -1105,6 +1105,44 @@ usb2_phy1: usb-phy@11e90200 {
>  			status =3D "disabled";
>  		};
> =20
> +		hsusb0: usb@11e30000 {
> +			compatible =3D "renesas,usbhs-r9a08g046",
> +				     "renesas,rzg2l-usbhs";

[Severity: Low]
Is the renesas,usbhs-r9a08g046 compatible string documented in the device
tree bindings?

It appears this might cause dtbs_check to fail with a warning since it
is not defined in the valid enumerations within
Documentation/devicetree/bindings/usb/renesas,usbhs.yaml.

> +			reg =3D <0 0x11e30000 0 0x10000>;
> +			interrupts =3D <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_USB_PCLK>,
> +				 <&cpg CPG_MOD R9A08G046_USB_U2P0_EXR_CPUCLK>;
> +			resets =3D <&phyrst 0>,
> +				 <&cpg R9A08G046_USB_U2P0_EXL_SYSRST>;
> +			renesas,buswait =3D <7>;
> +			phys =3D <&usb2_phy0 3>;

[Severity: High]
Will this create an unresolvable probe deferral?

The renesas_usbhs driver calls phy_get() during probe, depending on
usb2_phy0 here. However, the usb2_phy0 node only specifies
compatible =3D "renesas,usb2-phy-r9a08g046" without a generic fallback like
"renesas,rzg2l-usb2-phy".

Since the phy-rcar-gen3-usb2.c PHY driver does not match
"renesas,usb2-phy-r9a08g046", the PHY device might not probe, causing
phy_get() to continually return -EPROBE_DEFER.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812141940.2462=
23-1-biju.das.jz@bp.renesas.com?part=3D7

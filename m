Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208596;
	b=dCVnII/zznlonpahP1XlM6yzElpj8EHxRxCiZXiUtNDUzCBULflE5AsWdZv5JiBdqU/O
	 MMKK89WtltRu0uwQOuiRvPiR5jNGhfz6w78duq5yxM7h0GAQJWPSTZnGfXptJuvrhqIaI
	 hhLc1StHNq3HwZeX7WMMuks1yhPxK1il0cgcBwPOFlueJARwjwzZnMdetxwT9fu1F0JMN
	 RUkuNqXQkdfHELheTZSOc+C5TwuxSEmVZunH5jftDN/1/mNAIeh9g7jpG0a7kvXjfCs0C
	 OBnDy8bYDHbYWn7aiSxSBoWaEcXQV39EtLK2NZR7kxhijgW2kHosChTeGAyJdqCsPRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208596;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kQ4f7qL6OLama07naGJvhWBgUFWpikiCrCIrDrKAzqM=;
	b=etyUv4lrdrQBeDv0hF6lxLOlC6K+WIcrXHo6UdRrytg6y6yhh23Pjkgv/0mDob/FD/ZZ
	 uilEOSp2+4cYAo8BLBAbS94z4cDulJvtrA2wSUFvwAWIQm0EuIRGiYlLBg+cMdFBajgfY
	 jOApb1Z9mFp0/HohndhzDkMPSIClDxbPbixuoZyoc/sCddjwCehL+yEk/Mzkx0sDgnqYk
	 EKt11+IhTdNhLtxLlf3XRXbGXNcOrgO4bcwWFji3gG5ai1IvT+oXBpXvqRJqBCk5hFWXB
	 Iy5udeuijGYBvIvZHrr5vhSZ6hE4kFScX+7Nkq4/87ZyNG3wwYhudWUkAxxYVt6D7qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k1QxWlUn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB71C606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k1QxWlUn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDA11F0089F;
	Mon,  9 Nov 2026 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794208595;
	bh=kQ4f7qL6OLama07naGJvhWBgUFWpikiCrCIrDrKAzqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k1QxWlUnmeXuRTlssnoqXgSKjvaO9zsiiRfdKbWTuS6qVRei28AFtLk0LIFz1gMys
	 jQtLSDEwGGmMYBfa2QIPhdo9ZjXUEN1dVDBJ0DsOKpbpg4E38g0W3VuJXz/FyombYR
	 cnEAhzcjsi6UosI3rlf+i/r3jDO/iYVLUhaEVHUIk1VDH9fAK4NelOp2ABAX3lClWj
	 0NZv8bU73R1NYyU2G8kR8KDL/jYqeLg4XyrDngXrv4pC0zdGQiQ5fddPZQq6dQBWST
	 0guNzBR4we4V1Bup7+0xHdMHsgA3tS//MtnJo0fdgcLVDpk27Jaf2iVy22wcq8hMfk
	 ROoZOaVi2F6oQ==
Message-ID: <sashiko-outbox-204536@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/4] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261109065606.62641-3-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
 <20261109065606.62641-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 07:16:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: nuvoton: ma35d1: usb@40200000 reg size 0x1000
  truncates DWC2 FIFOs
--

commit aa9ff21b68491f1e002468f4d400c0d7fd2b192f
Author: Joey Lu <a0987203069@gmail.com>

arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node

This commit adds the dual-port USB 2.0 phy, dwc2 gadget, and ehci/ohci host
controller nodes to the ma35d1 device tree and enables them on the som-256m
and iot-512m boards.

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dt=
s/nuvoton/ma35d1.dtsi
> index 7228ad4735b5c..72a1659207fa7 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi

[ ... ]

> @@ -431,5 +439,62 @@ mdio1: mdio {
>  				#size-cells =3D <0>;
>  			};
>  		};
> +
> +		usb: usb@40200000 {
> +			compatible =3D "snps,dwc2";
> +			reg =3D <0x0 0x40200000 0x0 0x1000>;

[Severity: Medium]
Does the 0x1000 register size for usb@40200000 truncate the dwc2 per-endpoi=
nt
data fifo region?

A 0x1000 window only covers the core global, host, device, and power control
registers (offsets 0x000 through 0xe04), while the dwc2 driver defines
per-endpoint fifos starting at offset 0x1000:

drivers/usb/dwc2/hw.h:
#define EPFIFO(_a)			HSOTG_REG(0x1000 + ((_a) * 0x1000))

dwc2_driver_probe() maps the exact length from reg via
devm_platform_get_and_ioremap_resource().  If the controller runs in slave/=
pio
mode, dwc2_hsotg_write_fifo() and dwc2_hsotg_rx_data() access these fifo
registers at offset 0x1000 and above, faulting outside the 4 kb mapping.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109065606.6264=
1-1-a0987203069@gmail.com?part=3D2

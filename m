Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F8A2C2374
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780746562; cv=none; b=k4bZv7WEcvqAM48/iw/is6bUkMqckFN1pu/oasEGnTRaMRSn8n1afSXto8T4rW47eA9aj80qgaoUStLn4lYjwiavu6DnAFdpprVY0JHuYNyGO02gsea7kVSaHJtp7aODvTLZ98CO717t5HL0kBMhjmpJwM+En999a2EK4/Fll2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780746562; c=relaxed/simple;
	bh=TXxaa0hr88gvaGYe3kubA2J2vzP3XFuWS1pRAn4alPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J3n7ZTa3VXr8+L1kb/q8jmhOdxJQWd6MIqY5b+yOPBhPCwjBsq1J1R5oisDgn+B+MYq58bYi9nHfnqbMc+9eUooMpH1ds+hQF7yAKuyh0c95m8xhWz9MQe0WBN9JKsxjD4k0elZbGAmAcIeiaavI8zB7SlYy/oqf61DAJ1IJSso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7HAXDSX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7HAXDSX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FFC1F00898;
	Sat,  6 Jun 2026 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780746561;
	bh=trNrhoulzt7edJycrHlDpACtdVsxW+An5cECgOXGgRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A7HAXDSXKzXkIXvu+S5kP1j2ouvWOUoxj+gTbaqrEFvIdLmIHW0Qz2qneHcqKqJoo
	 UAw6KJUeDYr+/kk495uK9a5FxxsmEkEDqpIcuyHi/BO9wnEZ42fkkTYuxFd5RFZ+Fi
	 NzmCziUyOJBpyoS/ZLjPA4aly9WxLga4i3sYogofUSRJfTC+lpcJPNYhU9O7e+SqyI
	 FyovdRBW2uxRM5bhHgIFVYFTdC45JvRxfZ834n6FGvzieD4foC0J1UwGRfVr3AXU/m
	 99Uun2W+JSvAxfiTqAW7PYLuwRRHW7zl3uQUwGTZfTC0gbOELOIVfcgx7yYuh/SavR
	 ehuGDiABYLCoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPC-T6
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Pardini via B4 Relay" <devnull+ricardo.pardini.net@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-2-8a8857b39daf@pardini.net>
References: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-2-8a8857b39daf@pardini.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 11:49:20 +0000
Message-Id: <20260606114920.B9FFC1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect `bus-range` property in PCI root port nodes causes pri=
mary and secondary bus numbers to overlap.
--

commit a2c7d2bee242af770a15bcba84f406c04640467d
Author: Ricardo Pardini <ricardo@pardini.net>

arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPC-T6

The FriendlyElec NanoPC-T6 carries two on-board Realtek RTL8125 NICs.
This commit describes the fixed function nodes and attaches ethernet aliases
so U-Boot can inject stable MAC addresses.

> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi

[ ... ]

> @@ -635,6 +637,20 @@ &pcie2x1l0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pcie2_0_rst>;
>  	status =3D "okay";
> +
> +	pcie@0,0 {
> +		reg =3D <0x200000 0 0 0 0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		device_type =3D "pci";
> +		bus-range =3D <0x20 0x2f>;

[Severity: Medium]
Does this bus-range create an overlapping PCI topology?

The reg property places the PCI-to-PCI bridge on primary bus 0x20, but the
bus-range property specifies the downstream secondary and subordinate bus
numbers starting at 0x20. This claims that the secondary bus perfectly
overlaps the primary bus.

Since the child ethernet node uses bus 0x21 (reg =3D <0x210000 0 0 0 0>),
should the bus-range start at 0x21 instead, such as <0x21 0x2f>?

> +
> +		rtl_eth0: ethernet@0,0 {
> +			compatible =3D "pci10ec,8125";
> +			reg =3D <0x210000 0 0 0 0>;
> +		};
> +	};
>  };

[ ... ]

> @@ -651,6 +667,20 @@ &pcie2x1l2 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pcie2_2_rst>;
>  	status =3D "okay";
> +
> +	pcie@0,0 {
> +		reg =3D <0x400000 0 0 0 0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		device_type =3D "pci";
> +		bus-range =3D <0x40 0x4f>;

[Severity: Medium]
Is this bus-range similarly overlapping?

Like the node above, the bridge is on primary bus 0x40, but this sets the
secondary bus to also start at 0x40. Since the child node is at 0x41,
would it be more accurate to set this bus-range to <0x41 0x4f>?

> +
> +		rtl_eth1: ethernet@0,0 {
> +			compatible =3D "pci10ec,8125";
> +			reg =3D <0x410000 0 0 0 0>;
> +		};
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-rk3588-dts=
-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78A8322C73
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528563; cv=none; b=Wre7s3i8DAB/9Wmhbdky4ryna1Zpic6nXaWgYpvitVNDSU7S6CxUytSoHDmHLGxfVD3alosvwr4U0ZXldReiX9cWTdeuyoNJUYObJjuG2nGLNDW8h0Az5NeTx9pJUldmncsFrDMlP/oNxcOoKGUak9GJMIQ9StyF+8GXq1df+RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528563; c=relaxed/simple;
	bh=b4Uso0jEJDe0Nrems27O2ceV+wRdNGtP4DYl2yXqyuM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fvDxy+rtsuyeJyNVVyWaTDsvzCMT5RjDVT6h/5u0i0vBwzqVSwa/G7bhOgDK/6nuXfRC7Xt6mL7SRrDRFo5A8efsAwNGTkomKNYjIjdYg8JC4zuKAiZaKeX1mOT6M+NJ2Y6jXNaGtWPYEGjrfO5hIfGPSxzkVKB/lP3EuUt3bAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xq13hzxQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xq13hzxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007CF1F00A3A;
	Wed, 12 Aug 2026 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528562;
	bh=015cT6wYQP0mrinIlhVZBT2quUZXCmnTUNJNShjeGR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xq13hzxQKYO/F7VotocMw2QqdWBMDHf35gOTWzlTnu8jw5j14qwrdIc1NPqwl1Fda
	 zqwtu2RGJ9pWrhqzZkpNdR3U1cwZjdgMjH+leQQbFNDeU3/N2EIqEtk4tjdAEfs+B/
	 LAGyagYR7uT8MIdVHOOw0Bzt/rcvepk/yplKCqKaDnce5e46DMBa5Lr3ijnFyNp/Tz
	 PD+b6IwJAhTBcLWhNACxYRob7578LGeeE0WctTsao2AUmFIzPYP929aOdKakfsh3F7
	 925CH/I/gQ/BOIyPs1QzAPiGrUY/OFPaCzS24HJqvXM4CrLO0kC1iYNo3LjVU91t+w
	 OkMzQ7hBKlC8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/14] arm64: dts: qcom: ipq5018: Flatten usb
 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260812-ipq5018-usb3-v2-5-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-5-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:56:01 +0000
Message-Id: <20260812095602.007CF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The flattened `qcom,snps-dwc3` node provides a `reg` memory region=
 size (`0xe000`) that is too small to cover the qscratch wrapper registers,=
 leading to a `-EBUSY` probe failure.
--

--- Patch [5]: [PATCH v2 05/14] arm64: dts: qcom: ipq5018: Flatten usb cont=
roller node ---
commit e097cafa032cb2e224c3052691cef507b25b9831
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5018: Flatten usb controller node

This commit flattens the USB controller node and updates it to use the
latest bindings and flattened driver approach.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5018.dtsi
> index abd12b31a5147..7b8c9465f4442 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
[ ... ]
> -		usb: usb@8af8800 {
> -			compatible =3D "qcom,ipq5018-dwc3", "qcom,dwc3";
> -			reg =3D <0x08af8800 0x400>;
> -
> -			interrupts =3D <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names =3D "pwr_event",
> -					  "dp_hs_phy_irq",
> -					  "dm_hs_phy_irq";
> +		usb: usb@8a00000 {
> +			compatible =3D "qcom,ipq5018-dwc3", "qcom,snps-dwc3";
> +			reg =3D <0x08a00000 0xe000>;

[Severity: High]
Does this reg size correctly cover the qscratch wrapper registers?

The Qualcomm wrapper driver (dwc3-qcom.c) artificially expands the memory
resource size up to the 0xf8800 offset. Since the new flattened node here
only allocates a length of 0xe000 bytes, won't devm_ioremap_resource()
fail with -EBUSY during probe when the core driver requests a region that
extends beyond this parent device boundary?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D5

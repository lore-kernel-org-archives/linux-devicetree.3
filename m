Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1B13E7653
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 10:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828255; cv=none; b=lqa6gvuGGxUVLkuFrxnmhzVENgxxUfgU7q73Mep3yVRgLSvxqwVgoySmV2kDlmZdmEeNu1UuvCsUuP+y4mD0d9LWhVrvwqniOVCjfW4Gs4h26VU5wldZfDYafzBsHRI8XvkEWUAdwQ+Pr50f7jIg9ydmElEpViMyjnOzno4Czgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828255; c=relaxed/simple;
	bh=o+pkJqTY+BE6Pk5qZ0km2EooOUOWAwdotQFbJMV563A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bZQ4L/7b/6MvzktCvbDOADf4Ool24Z0jJauSp7nHXJJ0v21dAkTA8Q6suqZ+hZJzAVBlvtcP56XTDtsR9jxhI5KOegSHS90puaWPRESc0jm7CtC1ozKYa/PKpQXKqc8347pWp9YKn4CqfNytnXsFa6FLn4VRfL1VJaSU3A6i5bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mopmS/98; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mopmS/98"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00221F000E9;
	Thu, 27 Aug 2026 10:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787828254;
	bh=XqFhVEYzA0E4Mc3oReIpo9oUTpp7rvTPK1zXvarU+Sc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mopmS/986XZk0tjxO76JGJ8Pu2P3FnGc1uSmGR4+/e5/6B3Hjks29oi+HcLegjes+
	 rH1R38JMPUPaV2e9f3zcAll11/kqQg6zIOr/vlYG4pLKzw787hoWJ/gSRurSDk2dIe
	 5fXeG0yZzNDTsdEc+GeI2s8TDy/WgHP6Fa8f30/thX11mAy3AGMlhv0CIguQTphVWf
	 N9JSDwffZGZuLd3ZK/rw4R1AZGG6CtuWABxn5u4sAmtGj1a17/KqCQZGoVGYVCWJgl
	 5d2PjqhNFGa2QvOTZiax7w05KZJz1pAcjb/JFfz8JF2WMI9iAr97dLRFDjNhTh/ELR
	 B3xotUwI3rukQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: rockchip: add ISP nodes to rk3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder@ideasonboard.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-rkisp2-v3-5-e91ff0a604d6@ideasonboard.com>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
 <20260827-rkisp2-v3-5-e91ff0a604d6@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 10:57:33 +0000
Message-Id: <20260827105733.B00221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Mismatch between the number of interrupts and interrupt-names in th=
e isp0 node, violating the dt-binding schema.
- [Low] The newly added ISP and IOMMU nodes are not sorted by their unit ad=
dress in the .dtsi file.
--

commit 9cc7cdafa66ffa2298585c4888f169256dd48661
Author: Xu Hongfei <xuhf@rock-chips.com>

arm64: dts: rockchip: add ISP nodes to rk3588

Add device tree nodes for the ISP and their iommus on the RK3588.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index fc1fdbfd31622..22b78465a8235 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -3590,6 +3590,63 @@ gpio4: gpio@fec50000 {
>  			#interrupt-cells =3D <2>;
>  		};
>  	};
> +
> +	isp0: isp@fdcb0000 {
> +		compatible =3D "rockchip,rk3588-isp";

[Severity: Low]
Are these new ISP and IOMMU nodes sorted by their unit address in the .dtsi
file?=20

The standard convention is to order sibling nodes strictly by their unit
address, but placing isp@fdcb0000 after gpio@fec50000 breaks this
chronological ordering.

> +		reg =3D <0x0 0xfdcb0000 0x0 0x7f00>;
> +		interrupts =3D <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names =3D "isp_irq", "mi_irq";

[Severity: Low]
Is there a mismatch here between the number of items in the interrupts
property and the interrupt-names property?

The rockchip,rk3588-isp dt-binding schema strictly enforces a maximum of 2
items for the interrupts property. Including three interrupts will result
in a schema validation error when building the devicetree with dtbs_check.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-rkisp2-v3-=
0-e91ff0a604d6@ideasonboard.com?part=3D5

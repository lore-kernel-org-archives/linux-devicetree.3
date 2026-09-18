Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F85207E00
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737905; cv=none; b=O274V9VWe51l5RrwRbn1bEHb0tfsJRG1ZWCiB8DuBLB3utfdfMc8p0SqublydwumVB3153wuPfH/921gVCnGr2Jo7YLmmzJ9o2pr2Wh8EkQRyKMBinYiihrZGCPz7CVMo74sspZOusJ9v/elSQ3aGBkwQU/odDeM78ftI9EC/+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737905; c=relaxed/simple;
	bh=QfkXsmNm1HRBuLpk/9ZbLVNXh0EEg7RrbFl88uukOzg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TiZy0tMmVebJR0l5Rs93aLv6vBC2Z4LPCGaKDX7+EMwsuMQVPpsk5xl8y0QzRb42HT/dCAxct9twCQkCxgP5Aicpm9ACH0h4qfvsHSerHLo2DwAhmFH/MbH/4/SLfFYv0ZpEyFlssKCS8T2iY59IyBNSseydkvQipvScCNEw0w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQ8qPNL4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQ8qPNL4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053191F00898;
	Fri, 18 Sep 2026 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789737904;
	bh=gGx4iFjZkK0r7aljPq5+5YReCk1IG74kd70bgU1Us/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XQ8qPNL4PbEEKWxJwY4xvytFHG1ZlJqiyJfCqArPdSVRpwueUIVTHYtswTr+O6WVk
	 ZHd2aOn6w+cOFYOwdkiknLpOvqF8XRSRWLz0Ds6DScEQFhZywm+sOBIXkaE+Z5K7pK
	 DAtLg4PuPrw/ffS0JS9ng0B83yVup3nGu1zp96BebRrKUSJjyPVf0rHLqzIK3xmwuH
	 ABAxuk4Ifp6Y45lEDy+IpHnxIXn4nTYVWbY1uVpJl8rvT1Q2Rc6uHwnLr5bJxmhcdp
	 KtvG8CPab26MQenWgSZ1+gx7Y7w1NRWYDumONa2hIqXm6rmpBdJTujywX0cznU27/W
	 U/TDFg+SqQFLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/14] arm64: dts: apple: t8112: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260918-avd-v1-4-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-4-49977931f455@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:25:03 +0000
Message-Id: <20260918132504.053191F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: incorrect node ordering for avd and avd_dart
--

commit 840ff1be86e16002d57c9c6bb1578c5e4806bc81
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t8112: add avd nodes

This commit adds the avd and avd_dart nodes to the t8112 device tree.
It configures their memory regions, interrupts, and power domains.

> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/a=
pple/t8112.dtsi
> index ec248ca052cb2..83b1bc27dad76 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
[ ... ]
> @@ -987,6 +987,30 @@ pinctrl_aop: pinctrl@24a820000 {
>  				     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20
> +		avd: avd@269080000 {
> +			compatible =3D "apple,t8112-avd";
> +			reg =3D <0x2 0x69080000 0x0 0x10000>,
> +			      <0x2 0x69090000 0x0 0x10000>,
> +			      <0x2 0x690a0000 0x0 0x4000>,
> +			      <0x2 0x69100000 0x0 0x10000>;
> +			reg-names =3D "code", "sram", "mbox", "ctrl";
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 667 IRQ_TYPE_LEVEL_HIGH>,
> +				     <AIC_IRQ 668 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains =3D <&ps_avd_sys>;
> +			resets =3D <&ps_avd_sys>;
> +			iommus =3D <&avd_dart 0>;
> +		};
> +
> +		avd_dart: iommu@269010000 {

[Severity: Low]
Is this node ordering correct? Standard Device Tree conventions require
subnodes to be sorted in ascending order by their unit address.

The avd_dart node has a unit address of 269010000, which is placed after the
avd node with the larger unit address of 269080000. Could this trigger
stylistic warnings in DT validation tools?

> +			compatible =3D "apple,t8110-dart";
> +			reg =3D <0x2 0x69010000 0x0 0x4000>;
> +			#iommu-cells =3D <1>;
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 674 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains =3D <&ps_avd_sys>;
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-avd-v1-0-4=
9977931f455@icloud.com?part=3D4

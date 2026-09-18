Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7110F3A9623
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737936; cv=none; b=XmrESWZPZAixTXxVERrhdABJoDETWxYOXlVXrZMIIz2Nn/Oy4BupxMK49L7/XNRr4rkDDtfXEzDY0Mjnr/jnpX7uuD3ss/3x6zR8s2f+AlGVi7mi8A+QE6lDqbbr9UY3CAPLqCVX2YsBTCi1eOB347NKxQWMZhzLeXDP5sNYC0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737936; c=relaxed/simple;
	bh=loLZntxpmWbcP+LTjh/I1/b+pB4lKz9GHwkLgJsTYlQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RHuz2Rx1di3b5BK0RvTAj+P93tc/0FOYLEob3FFJ2DTocGJQWSdToBHScaxUOD3v4xePiD1dldZKv2Af6JXiNinWapkoR7EtiJU39qS8Io1x7ObnsL15FxH5I5sfe1CUDL9Wt7f9SPz9BXK4MUoCGVLXYr94emURohQcMPhSz7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxGfCzE6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxGfCzE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2A21F000FF;
	Fri, 18 Sep 2026 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789737935;
	bh=sFEDfM15VAueXKfIhimmHajT5vAlBghnOOOusJTeSxE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NxGfCzE6EetTrRW0tUSECH78Qx2VHOnTgIwp5+fWZ0jOkIUwvtrBV/l+MyumLpczo
	 V2PVkIbpOQaVEuNMSdld5e2IayChsGqCwlXmUl8/P6i+NwUTcof5bra4sd5HJkbkzX
	 rIeTPgRxlLKS98qD7GagtMRgPvLu+BTiSgCkL8wj6e3I+Gb3aqUPeHmgzqIp7cl0ZJ
	 CldC79JN73PFlL5SxDs3ONW5VurTldilDm8v2V5G0vGjpq0ZFfSIT8aULptgoEhr4I
	 VHSnVgq6qyxC2Cp/7sG78hOrQf4V9oXlHlYtxoGrIqvGzDAYRDw7dNZZP/oxy8KDVk
	 /VtzQ9RqR6fEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/14] arm64: dts: apple: t8103: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918-avd-v1-3-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-3-49977931f455@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:25:34 +0000
Message-Id: <20260918132534.CD2A21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: apple: t8103: avd nodes are not sorted by unit-address
--

commit 7d170c5397d0b0258ee0909282aba065f8ee4b9e
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t8103: add avd nodes
   =20
This commit adds the AVD (Apple Video Decoder) and its associated DART
IOMMU nodes to the t8103 device tree.

> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
[ ... ]
> +		avd: avd@269080000 {
> +			compatible =3D "apple,t8103-avd";
> +			reg =3D <0x2 0x69080000 0x0 0xc000>,
> +			      <0x2 0x6908c000 0x0 0xc000>,
> +			      <0x2 0x69098000 0x0 0x4000>,
> +			      <0x2 0x69100000 0x0 0x10000>;
> +			reg-names =3D "code", "sram", "mbox", "ctrl";
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 540 IRQ_TYPE_LEVEL_HIGH>,
> +				     <AIC_IRQ 541 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains =3D <&ps_avd_sys>;
> +			resets =3D <&ps_avd_sys>;
> +			iommus =3D <&avd_dart 0>;
> +		};
> +
> +		avd_dart: iommu@269010000 {
> +			compatible =3D "apple,t8103-dart";

[Severity: Low]
This isn't a functional bug, but are these nodes sorted correctly by their
unit-address?=20

Device tree nodes are typically sorted in ascending order by unit-address
to maintain readability. Should the avd_dart (iommu@269010000) node be
placed before the avd (avd@269080000) node in t8103.dtsi?

> +			reg =3D <0x2 0x69010000 0x0 0x4000>;
> +			#iommu-cells =3D <1>;
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 547 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains =3D <&ps_avd_sys>;
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-avd-v1-0-4=
9977931f455@icloud.com?part=3D3

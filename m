Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46602F6596
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888158; cv=none; b=aRiNix4sLUhmvV9X3XeCXyulSfUO5Au7HcRFBDxx1S1hEnOAjQiQGeZtRrNTjpMejAPuQT1ZVYUbryl3LTH+Xphg1kP4QbtlL9TNiyE/bE9hRZXYgjzGqoptI+ZRss/MrPVjkH3kLojW0l7ND1weOl7bChgwYz5APFgwC8lNr48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888158; c=relaxed/simple;
	bh=8yZLjMI5WihHjbAEa7ijerifffhXAzd9E0imy4sYpaw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R5ik/EmPYGh7/4cLJnSlauLB5AL0RQJ678ILxYS3BubxLs3lPJ4gaX+BBwhTwU8h3oz1AvCp7FNIIDdldMRw0RdNk587+M5NNE8i/zpg91UsdNGFOh8XDA3CO7AEL0eQWgL+sYOv/8OPpEnPe5oi4uCsvtRWknWRbNCiBHk7KLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2zIZA/o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2zIZA/o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1961F000E9;
	Fri, 24 Jul 2026 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784888157;
	bh=OtyWDnOBApNCxckAKFNIIFHtMR9TFsKT3xO3Xo4RHDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J2zIZA/oa/Z3n4EdapK+T6JvKvmhoI1tLQ9PJFF7zh+fCsHWvZQpqhCeBDjaoafRF
	 skO117IzMbvNNBt7h+UKY3Rfmp/sK7+HX1buQyFB9v3uakC25IXKO4CEsRd/SgS1Oe
	 m2OWSJTfBOCLAy8DoNb8TzRfc1qpN4rwOZkKNMxTt46Mfu9yVcWXNLfnGl7360i3cA
	 9zlHiqp1t2JwuXM6Ni72mXntVPqpXlVvP/RFaYNb6Rcjh3UpofEWQTE8yB/oTeTj/s
	 vMtqPykdkphPEllxeKwF3P29NnksRIiu5X5CTAFYfHO2R/1qVpjntotVKJIKnEKscC
	 BJbYyccFrpVyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/6] arm64: dts: qcom: glymur: Add PCIe3 PHY and
 PCIe3a controller nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-glymur_linkmode_0724-v7-3-65c8469c6b65@oss.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-3-65c8469c6b65@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:15:56 +0000
Message-Id: <20260724101556.9A1961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Hardcoded literal '0' is used instead of the 'GIC_SPI' macro in the=
 interrupt-map property.
--

--- Patch [3]: [PATCH v7 3/6] arm64: dts: qcom: glymur: Add PCIe3 PHY and P=
CIe3a controller nodes ---
commit dd1c15a3b44d0578ffea10fd2c542a6e374a70d7
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add PCIe3 PHY and PCIe3a controller nodes

This commit adds the PCIe3 PHY and PCIe3a controller nodes to the glymur
device tree. It models the shared PHY as a single provider, updates the GCC
pipe clock parent array, and defines the PCIe3a PCI node.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi

[ ... ]

> @@ -3722,6 +3780,280 @@ pcie3b_port0_ep: endpoint {
>  			};
>  		};
> =20
> +		pcie3a: pcie@1c10000 {

[ ... ]

> +			interrupts =3D <GIC_SPI 948 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 942 IRQ_TYPE_LEVEL_HIGH>;

[ ... ]

> +			#interrupt-cells =3D <1>;
> +			interrupt-map-mask =3D <0 0 0 0x7>;
> +			interrupt-map =3D <0 0 0 1 &intc 0 0 0 848 IRQ_TYPE_LEVEL_HIGH>,

[Severity: Low]
This isn't a bug, but is it intended to use the literal '0' here for the
parent interrupt specifier type instead of the 'GIC_SPI' macro? The
'interrupts' property just above uses 'GIC_SPI', so using the macro here mi=
ght
improve consistency and readability.

> +					<0 0 0 2 &intc 0 0 0 849 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 850 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 851 IRQ_TYPE_LEVEL_HIGH>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-glymur_lin=
kmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com?part=3D3

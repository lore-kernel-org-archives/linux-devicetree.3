Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700811;
	b=fUQs5Kuq6KQXw286qqtZv/zY1FfTvrq4YGPYCGDgTEGDUmmvVig2zYS/jsIKhzWJlwE/
	 Eu1LX1tXERN8Iy7eYTHaPBP5oAGr37v4Nmsaz0S7S+DA6AIfX1iDiMyTnmwpTsXQHaJdz
	 YXJvTZAnWONMuXfodkfP5HgNpqDGkSKdmAAk0gTET93XRNexc5rDDFuJVI5IwZqhQcwod
	 d03yywvBGuZuvfo5hfn8Koa7tW+5wYbFuuu2if6ZG7rs8A/n+xJRN8IJCvroykzOh1gKf
	 sT7vZDPGutQpqPjHKhdb9koSb/J+9WjRB5CaVq9ZEqUou1FaP3s+ltaT00qhsDMfUBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700811;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YqQ8kd3J7ixc/rzNPwCzJ4zBvbIvPqaTvXbdU3EvLU0=;
	b=UcT9EbY+ZSQYsCAGPq02wHKhf7Xck1TQFuGrmq1gnDVw8GW95w2Jjr/60GDSFtWFAq46
	 2t9zuz56FNLf7rDvnZibnlurNoNW+6SQBjkKosFbtFXmAvZqDdDjjrZl79/JVjqROIgFe
	 FDKa1Vsb16o7x34ZL2AglRpVrZuLA/QlRxfmnA/XrcDmvOaIcx1u/vLK6dK+jdGIEmALC
	 Bu4odqDQgsYZVkpr0PtnMuQQHUgRQbhYukMyxi57DbdjO4HZxzazZDG5Zm06YpxM3wnyD
	 725PSOCCVcTgGg21CKfSrK5ATGL/FOctfmVtsKTdDsijexzeG/ABTpWr7HJcs5d8sfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nXWN6teH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28BA606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nXWN6teH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196721F000CF;
	Thu, 26 Nov 2026 13:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700811;
	bh=YqQ8kd3J7ixc/rzNPwCzJ4zBvbIvPqaTvXbdU3EvLU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nXWN6teHq6xIdtMl2XLMWgkmkY96lOhknn9TGLHr4ibz7JPBF1dAejRWUIuXDuz9Y
	 GFX0xOFXwvdHtc8vD5c3lhUudoiqVDDVeySeIl2FAUcgdj6Ia905Xq7gJ/BYx4XX6V
	 G6W88Syr84PSjL3zrxM8EyyfYw0tDnuyKlflFQWeS9m5tU2d5XoMI2dA7hpYHMZzsq
	 Pzd69bE6NByE5DFgkzRLdKYrDYhr2d4GxwTyVBeaTxWNGANgVG76A1AT5zERWGLjOp
	 GHDFEsrSKRGd1Q/nYvKGTWfiJMdwuvXd1hyhvFpk/O2G/cxD+6v6+fj49DGxhwBRlk
	 lsqBeCHGYi3Hg==
Message-ID: <sashiko-outbox-235642@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: nord: Add iris video node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gourav Kumar" <gourav.kumar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-nord-iris-dts-v2-1-bb88dc5832ea@oss.qualcomm.com>
References: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
 <20261126-nord-iris-dts-v2-1-bb88dc5832ea@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:46:50 +0000
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
- [High] arm64: dts: qcom: nord: undocumented iris binding and child
  iommus nodes
--

commit ab1d158c6cd044102623ff66075b408a2a4b580f
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

arm64: dts: qcom: nord: Add iris video node

This commit adds the iris video codec device tree node to nord.dtsi and
populates its clocks, resets, interconnects, power domains, and OPP table
in nord-embedded.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boo=
t/dts/qcom/nord-embedded.dtsi
> index e6d0bd21744e2..8af7d13b30eee 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -380,6 +380,94 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
>  	pinctrl-names =3D "default";
>  };
> =20
> +&iris {
> +	clocks =3D <&nwgcc NW_GCC_VIDEO_AXI0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_CLK>,
> +		 <&nwgcc NW_GCC_VIDEO_AXI0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
> +		 <&nwgcc NW_GCC_VIDEO_AXI1_CLK>,
> +		 <&videocc VIDEO_CC_MVS1_CLK>,
> +		 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
> +	clock-names =3D "core_iface",
> +		      "core",
> +		      "vcodec0_core",
> +		      "vcodec0_iface",
> +		      "core_freerun",
> +		      "vcodec0_core_freerun",
> +		      "vcodec1_iface",
> +		      "vcodec1_core",
> +		      "vcodec1_core_freerun";
> +
> +	interconnects =3D <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +			 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +			<&mmss_noc MASTER_VIDEO_MVP0 QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +	interconnect-names =3D "cpu-cfg",
> +			     "video-mem";
> +
> +	operating-points-v2 =3D <&iris_opp_table>;
> +
> +	power-domains =3D <&videocc VIDEO_CC_MVS0C_GDSC>,
> +			<&videocc VIDEO_CC_MVS0_GDSC>,
> +			<&rpmhpd RPMHPD_MXC>,
> +			<&rpmhpd RPMHPD_MMCX>,
> +			<&videocc VIDEO_CC_MVS1_GDSC>;
> +	power-domain-names =3D "venus",
> +			     "vcodec0",
> +			     "mxc",
> +			     "mmcx",
> +			     "vcodec1";
> +
> +	resets =3D <&nwgcc NW_GCC_VIDEO_AXI0C_CLK_ARES>,
> +		 <&nwgcc NW_GCC_VIDEO_AXI0_CLK_ARES>,
> +		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
> +		 <&nwgcc NW_GCC_VIDEO_AXI1_CLK_ARES>,
> +		 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
> +	reset-names =3D "core_bus",
> +		      "vcodec0_bus",
> +		      "core",
> +		      "vcodec0_core",
> +		      "vcodec1_bus",
> +		      "vcodec1_core";
> +
> +	iris_opp_table: opp-table {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-240000000 {
> +			opp-hz =3D /bits/ 64 <240000000 240000000 360000000>;
> +			required-opps =3D <&rpmhpd_opp_svs>,
> +					<&rpmhpd_opp_svs>;
> +		};
[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index 56778dd444e4e..c73db8cdeafb7 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -2371,6 +2371,34 @@ pcie_smmu: iommu@9980000 {
>  			#iommu-cells =3D <1>;
>  		};
> =20
> +		iris: video-codec@aa00000 {
> +			compatible =3D "qcom,nord-iris", "qcom,glymur-iris";
> +			reg =3D <0x0 0x0aa00000 0x0 0xf0000>;
> +
> +			dma-coherent;
> +
> +			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			memory-region =3D <&video_mem>;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			dma-ranges =3D <0x0 0x0 0x0 0xffe00000>;
> +
> +			status =3D "disabled";
> +
> +			non-pixel {
> +				iommus =3D <&apps_smmu_1 0x0940 0x20>,
> +					 <&apps_smmu_1 0x0944 0x0>,
> +					 <&apps_smmu_1 0x0960 0x20>;
> +				iommu-ranges =3D <0x25800000 0xda600000>;
> +			};
> +
> +			pixel {
> +				iommus =3D <&apps_smmu_1 0x0943 0x0>;
> +			};
> +		};

[Severity: High]
Are the binding and driver changes for "qcom,nord-iris" and
"qcom,glymur-iris" missing?

Neither compatible string, nor the 9 clocks, 5 power-domains, 6 resets,
3-tuple opp-hz entries, iommu-ranges property, or non-pixel and pixel
child nodes are documented in Documentation/devicetree/bindings/media/ or
handled by drivers/media/platform/qcom/iris/, so make dtbs_check fails.

Because iommus is placed in the unparsed non-pixel and pixel subnodes
rather than on video-codec@aa00000 itself, platform_dma_configure() does
not attach the device to apps_smmu_1, causing iris_reserve_iova_region()
-> dma_iova_try_alloc() in iris_probe() to fail with -ENOMEM if bound.
In addition, placing dma-ranges =3D <0x0 0x0 0x0 0xffe00000> on
video-codec@aa00000 causes of_dma_get_max_cpu_address() in
dma_limits_init() to cap the system-wide dt_zone_dma_limit to 0xffdfffff
whenever the node is enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-nord-iris-=
dts-v2-0-bb88dc5832ea@oss.qualcomm.com?part=3D1

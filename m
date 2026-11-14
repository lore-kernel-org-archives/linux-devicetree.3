Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626861;
	b=IO5WNuP8cCt2ALAZfXRVegdG789LwPnYw0z6KZm1xkiLYlBn/ArKfesAGIUjKONB0Vs/
	 L+xlgYwCvnBk6+UXmil+GFEICFWYioEOAbUVAyOMnAZRwaJhkUYHgrO24MhtP6Y0y9Q1E
	 jLML+2hPaV9Vx5PwlJ/8Ngjx8nZN6pRKspkhK3IqoipkOqtwDs/mTwb0PRS65xuq2aatf
	 M7UAXsT+Ms1KjOeK/5ui3gKWYoTo4e35AjOknWReKfr5JHl9QYuJ05Vg9HKUplcOl7oe7
	 i0B1Kt2sJ2x79CiyWMoR6wG0D1Ufn5cd29DGPzRUcKa4CG6SkiCh4iLhDu/fHLCtSrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626861;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=e2bOgwvj5KRcvk3NVLiGfld3GIH8rb40So/3hFk2c4A=;
	b=FbkyRGT0jxdKChWapvSwqMOBjEviYKLPp7mB7NiyVwQPheRyxbutMiyKxo/FjPmZJU2c
	 a1mSRbqnRPNlG7c0Y9slZUHbjCBB2yIDY9dkd6WTRgIwbXSImIL2XP5nfaKBTVwLNhxjx
	 yibozqzhzLY9ANOs8swHLKdIBi3R6E5u9GJK8CQhSMacVVs9xg+dvuGiXENwl1CF28VkZ
	 o4i7SO2LrHO0isZB6GX4CFYz1z/V1O9jRoTtsvHKziue1xhy4ENaviRGKRMKnm7bfA/sb
	 h3ZnDwjfSHw+1EXU1NfqIWKr5kjTSNswYjlh3Zh/KwSi8pfrJQI0sPtmBP8SWOgUvsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AHShBAH9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5220C606A89B
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AHShBAH9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBAB1F000C4;
	Sat, 14 Nov 2026 03:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794626860;
	bh=e2bOgwvj5KRcvk3NVLiGfld3GIH8rb40So/3hFk2c4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AHShBAH9Ubua5BtNf9wjkQwDAxbDRWsEKojKN32FspzcAQZUedrl//vQfsJrC4Od+
	 /W0stIPdWX5649fJ0sZyL/YLIQrpsNyUwGEyqdf5jNFBUlcKEQcUTMzty9xSfOgKHL
	 2P2YeSjDPKE61s+N3Bb0ljDDV1UA+Yzpp2H/VAuSIzNYUXcEAas82VESVHafHz1TPp
	 ZJX59ZUzojfTiBtIEAhCIgavzO3njYYYs83OweddS6TUhu9iYq2VyCRDRvX2yxO8p6
	 L8WK8ImmtzzBhoGc2014Q4WVuvV8byBsC3+Kn4fA0a84EODW75B+wqQ6c+or2x3pcI
	 oyIFlGq2vTsLw==
Message-ID: <sashiko-outbox-214107@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 11/12] arm64: dts: rockchip: add NPU (RKNN) nodes to
 rk3576
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <f9f4f43cd1c4c8c6cee0371b4b92badf37e68832.1794615323.git.gahing@gahingwoo.com>
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <f9f4f43cd1c4c8c6cee0371b4b92badf37e68832.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 03:27:39 +0000
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
- [High] arm64: dts: rockchip: missing resets in rk3576 NPU power-domain
  nodes
--

commit 4129f134d43a1e4e19c937117eb7565caa3c233d
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576

This commit adds the two RK3576 NPU core nodes and their IOMMU nodes to
rk3576.dtsi, and labels the NPU power domain node.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index 7828736bf9ac0..6ff95066d4701 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1131,7 +1131,7 @@ power: power-controller {
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> =20
> -				power-domain@RK3576_PD_NPU {
> +				pd_npu: power-domain@RK3576_PD_NPU {
>  					reg =3D <RK3576_PD_NPU>;
>  					#power-domain-cells =3D <1>;
>  					#address-cells =3D <1>;
> @@ -1350,6 +1350,74 @@ power-domain@RK3576_PD_VO1 {
>  			};
>  		};
> =20
> +		rknn_core_0: npu@27700000 {
> +			compatible =3D "rockchip,rk3576-rknn-core";
> +			reg =3D <0x0 0x27700000 0x0 0x1000>,
> +			      <0x0 0x27701000 0x0 0x1000>,
> +			      <0x0 0x27703000 0x0 0x1000>;
> +			reg-names =3D "pc", "cna", "core";
> +			interrupts =3D <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cru ACLK_RKNN0>, <&cru HCLK_RKNN_ROOT>,
> +				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>,
> +				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
> +			clock-names =3D "aclk", "hclk", "npu", "pclk",
> +				      "aclk_cbuf", "hclk_cbuf";
> +			assigned-clocks =3D <&cru CLK_RKNN_DSU0>;
> +			assigned-clock-rates =3D <594000000>;
> +			resets =3D <&cru SRST_A_RKNN0>;
> +			reset-names =3D "srst_a";
> +			power-domains =3D <&power RK3576_PD_NPU0>;
> +			iommus =3D <&rknn_mmu_0>;
> +			status =3D "disabled";
> +		};

[Severity: High]
Are the power-domain@RK3576_PD_NPU0 and power-domain@RK3576_PD_NPU1 nodes
missing their resets properties (such as SRST_A_RKNN0_BIU and
SRST_A_RKNN1_BIU)?

40f898ca63cc ("pmdomain: rockchip: cycle an optional power-domain reset on
power-on") and commit "accel/rocket: let the core suspend after a reset"
rely on rockchip_pd_power() pulsing pd->reset when powering on the RK3576
NPU domains, both to clear the undefined bus interface state before QoS
and register accesses and to recover the IOMMU after a job timeout reset.
However, none of the RK3576 NPU power-domain nodes in rk3576.dtsi specify
a resets property, so pd->reset remains NULL and the bus interface reset
is never cycled:

arch/arm64/boot/dts/rockchip/rk3576.dtsi:
						power-domain@RK3576_PD_NPU0 {
							reg =3D <RK3576_PD_NPU0>;
							clocks =3D <&cru HCLK_RKNN_ROOT>,
								 <&cru ACLK_RKNN0>;
							pm_qos =3D <&qos_npu_m0>;
							#power-domain-cells =3D <0>;
						};
						power-domain@RK3576_PD_NPU1 {
							reg =3D <RK3576_PD_NPU1>;
							clocks =3D <&cru HCLK_RKNN_ROOT>,
								 <&cru ACLK_RKNN1>;
							pm_qos =3D <&qos_npu_m1>;
							#power-domain-cells =3D <0>;
						};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794615324.gi=
t.gahing@gahingwoo.com?part=3D11

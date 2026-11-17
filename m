Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920404;
	b=nOtcqC1ml6j1eH5uxtZ5pybhrEF929DLbQB7WXd2ZaSbo2HUiIPjy0ELpZVIwaMG1ntJ
	 Espv8TNzC+qkxTrXAoqp7Zxx4DX/c1jAXI/D4hFvOZo1Ha9m7kIOdHZKZyQXes+GGvwV7
	 rQztUb+Vn/Na/WpjqW+CBHX6iwMKdtd8EaHnbu0rUDzdDc9o5OJJTae1uZHp9eBdsYEXI
	 e0VrniYloJwIj248ORfSrWR43glOlAklB/ZuC0F6+5xPLVhE9A7Ix3GsQ86InwLN0oViP
	 XbxJixTb3BQuZxcccHsGVCf1xH0BjCJ3HMJq0axU9cqtAE02BlG8tWV2kFpPp6+fdlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920404;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m6LIvCwP15mUBiDqs9Jzn5Z3nx7ThxnO5ejEh3LdSE0=;
	b=IGRQvmRrQpZ5kL+o//q5Iqi/1/Ag3VQ4wjdxHNee0MqbO5ZjFNwFNn1ezlV8w8uVJSEC
	 Hq8jZt/WlGiy8q0s48DGnjIpb3HXQB7DZgS5+G5lS8bR6hTgN9UHbTB16MMpdAFVbqH8p
	 ZWvFwWG4UXUmYUBNmxywgr4tKc6eLrEOIyJNPZ43ZPbYfuMWZSyMKyoFVsCkcpsd7/+qE
	 LqOggvbpCxuMJwa421vfzovrqpdtbAPiN1eF+wW2Pc/4y0vB7npYfNp5r66i5f19XgLxh
	 h6CkZFEKY6fJU7MC9zQgCs7v7RFjnUhalI0ogUVvOi0YpX0RG+z8XT8Bb0EDN83jeXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="k54v/jqS";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F4D606A88C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k54v/jqS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F3A1F000C7;
	Tue, 17 Nov 2026 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920404;
	bh=m6LIvCwP15mUBiDqs9Jzn5Z3nx7ThxnO5ejEh3LdSE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k54v/jqSEldKkdppPjDh3Gpn4WRl3hF4+GmlcHhxKVarYLrs0RHKo4mf7bRGUNnmF
	 iUHAWiUSO2ewgc2GtndK+xBIIynAZPS/vmcrne7XFuJfz215WUeoRMImg3H34IrjID
	 R+DRBLv1oBTNz0TWktTf8erCtKhKbuYAEvD2k+YdJYuNVtjWtGOsEs/tnLPvseraRf
	 WfVTJzlLgtW/bEz70SFRLOhHgri3doA0ZhevorXUfDpEJaNmrzQrad9vac5f3/v7u9
	 hgPixhq008A26cuNuNo4xAmA3Oe0Evmg2DAUS35T3qJ9v9ddKoysczLB5U4oVwRvzm
	 H7WO7xEkImT1w==
Message-ID: <sashiko-outbox-218823@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8167: Add DRM nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117122802.728987-1-l.scorcia@gmail.com>
References: <20261117122802.728987-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:00:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] arm64: dts: mediatek: mt8167: missing reg =3D <1> on rdma1
  endpoints breaks CRTC_EXT
- [Medium] arm64: dts: mediatek: mt8167: undocumented
  mediatek,mt8167-dpi compatible
- [Medium] arm64: dts: mediatek: mt8167: unconnected rdma0_out breaks
  mtk_drm_probe()
- [Low] arm64: dts: mediatek: mt8167: non-generic display node names
  with indices
--

commit 550fb79e6d290ccbb35fb88f6c76ac7ea3a27e5b
Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>

arm64: dts: mediatek: mt8167: Add DRM nodes

This commit adds the devicetree nodes and aliases for the display subsystem
on the MediaTek MT8167 SoC.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8167.dtsi
> index 27cf32d7ae35f..2bcdab2934f4f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
[ ... ]
> @@ -120,10 +136,325 @@ iommu: m4u@10203000 {
[ ... ]
>  		mmsys: syscon@14000000 {
>  			compatible =3D "mediatek,mt8167-mmsys", "syscon";
>  			reg =3D <0 0x14000000 0 0x1000>;
> +			power-domains =3D <&spm MT8167_POWER_DOMAIN_MM>;
>  			#clock-cells =3D <1>;
> +
> +			port {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				mmsys_main: endpoint@0 {
> +					reg =3D <0>;
> +					remote-endpoint =3D <&ovl0_in>;
> +				};
> +
> +				mmsys_ext: endpoint@1 {
> +					reg =3D <1>;
> +					remote-endpoint =3D <&rdma1_in>;
> +				};
> +			};
> +		};
> +
> +		ovl0: ovl0@14007000 {

[Severity: Low]
This isn't a bug, but ovl0@14007000, rdma0@14009000, rdma1@1400a000,
wdma0@1400b000, and dpi1@14019000 include instance numbers in their node
names.  Should these use generic node names without trailing indices
(ovl@14007000, rdma@14009000, rdma@1400a000, wdma@1400b000, and
dpi@14019000) to match dpi0 (dpi@14013000), the MediaTek display bindings,
and other MediaTek devicetrees?

[ ... ]

> +		rdma0: rdma0@14009000 {
> +			compatible =3D "mediatek,mt8167-disp-rdma", "mediatek,mt2701-disp-rdm=
a";
> +			reg =3D <0 0x14009000 0 0x1000>;
> +			clocks =3D <&mmsys CLK_MM_DISP_RDMA0>;
> +			interrupts =3D <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
> +			iommus =3D <&iommu M4U_PORT_DISP_RDMA0>;
> +			power-domains =3D <&spm MT8167_POWER_DOMAIN_MM>;
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +					rdma0_in: endpoint {
> +						remote-endpoint =3D <&dither_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +					rdma0_out: endpoint { };
> +				};
> +			};
> +		};

[Severity: Medium]
Does leaving the main pipeline (ovl0 through rdma0) enabled while rdma0_out
has no remote-endpoint cause mtk_drm_probe() to fail on boards that do not
connect rdma0_out?

When mtk_drm_of_ddp_path_build_one() walks the main pipeline from
mmsys_main, it reaches rdma0_out, where of_graph_get_remote_port_parent()
returns null and mtk_drm_of_get_ddp_ep_cid() fails with an invalid-argument
error instead of a no-such-device error:

drivers/gpu/drm/mediatek/mtk_drm_drv.c:mtk_drm_of_ddp_path_build_one() {
	...
	if (ret =3D=3D -ENODEV)
		return ret;

	/* If the last entry is not a final display output, the configuration is w=
rong */
	switch (temp_path[idx - 1]) {
	case DDP_COMPONENT_DP_INTF0:
	case DDP_COMPONENT_DP_INTF1:
	case DDP_COMPONENT_DPI0:
	case DDP_COMPONENT_DPI1:
	case DDP_COMPONENT_DSI0:
	case DDP_COMPONENT_DSI1:
	case DDP_COMPONENT_DSI2:
	case DDP_COMPONENT_DSI3:
		break;
	default:
		dev_err(dev, "Invalid display hw pipeline. Last component: %d (ret=3D%d)\=
n",
			temp_path[idx - 1], ret);
		return -EINVAL;
	}
}

Because rdma0 is not a final display output, mtk_drm_of_ddp_path_build()
aborts mtk_drm_probe() with an error on boards without a main display (such
as mt8167-pumpkin.dts) and before evaluating the external pipeline on
boards that only use rdma1.

> +
> +		rdma1: rdma1@1400a000 {
> +			compatible =3D "mediatek,mt8167-disp-rdma", "mediatek,mt2701-disp-rdm=
a";
> +			reg =3D <0 0x1400a000 0 0x1000>;
> +			clocks =3D <&mmsys CLK_MM_DISP_RDMA1>;
> +			interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_LOW>;
> +			iommus =3D <&iommu M4U_PORT_DISP_RDMA1>;
> +			power-domains =3D <&spm MT8167_POWER_DOMAIN_MM>;
> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +					rdma1_in: endpoint {
> +						remote-endpoint =3D <&mmsys_ext>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +					rdma1_out: endpoint { };
> +				};
> +			};
> +		};

[Severity: High]
Does omitting reg =3D <1> on the rdma1 endpoints break the external display
pipeline whenever rdma1 is enabled?

mmsys_ext has reg =3D <1>, so mtk_drm_of_ddp_path_build() builds that path
with crtc_path set to 1.  When mtk_drm_of_ddp_path_build_one() steps from
rdma1 to its output port, mtk_drm_of_get_ddp_ep_cid() looks up the endpoint
whose reg matches crtc_path:

drivers/gpu/drm/mediatek/mtk_drm_drv.c:mtk_drm_of_get_ddp_ep_cid() {
	...
	ep_out =3D of_graph_get_endpoint_by_regs(node, output_port, crtc_path);
	if (!ep_out)
		return -ENOENT;
}

Because rdma1_out has no reg property, its endpoint id defaults to 0, so
of_graph_get_endpoint_by_regs(rdma1, 1, 1) returns null and
mtk_drm_of_ddp_path_build_one() fails with an invalid pipeline error.
Adding #address-cells =3D <1> and #size-cells =3D <0> to port@0 and port@1 =
and
using endpoint@1 with reg =3D <1> on rdma1_in and rdma1_out (as in
mt8365.dtsi and mt8183.dtsi) would allow the driver to follow the external
path.

[ ... ]

> +		dpi0: dpi@14013000 {
> +			compatible =3D "mediatek,mt8167-dpi";
> +			reg =3D <0 0x14013000 0 0x1000>;
> +			clocks =3D <&mmsys CLK_MM_DPI0_PXL>, <&mmsys CLK_MM_DPI0_ENGINE>,
> +				 <&apmixedsys CLK_APMIXED_LVDSPLL>;
> +			clock-names =3D "pixel", "engine", "pll";
> +			interrupts =3D <GIC_SPI 172 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains =3D <&spm MT8167_POWER_DOMAIN_MM>;
> +			status =3D "disabled";

[Severity: Medium]
Is "mediatek,mt8167-dpi" missing from the devicetree bindings and MediaTek
drm driver in this tree, or should dpi0 and dpi1 include a fallback
compatible?

Without a matching entry in Documentation/devicetree/bindings/display/
mediatek/mediatek,dpi.yaml, mtk_dpi_of_ids, and mtk_ddp_comp_dt_ids,
dtbs_check fails on both nodes and mtk_drm_of_get_ddp_comp_type() rejects
the pipeline when either dpi node is enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117122802.7289=
87-1-l.scorcia@gmail.com?part=3D1

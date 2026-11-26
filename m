Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677038;
	b=cZ6CN6bn4prAAgq15tbFE7SzgPRHc2/1wGqsL4GaKrY/+orIsP9DVykigpfGsg2ZjAYD
	 e808SSRXSvRGOoJK6l89tSYhc4ABGUiQHW7rHhFHZH0YNpKXueFj5ZlI7p+My82Z3SxHk
	 6J4oEhrOmr/4ULcbXSSWpexzHVjIlxhbyHyJzYn2ExlK7wS+XNjEWAEMENURcHs4Qq9ov
	 E/p2LbMHk1FYdqUSfUVL7bwXw+CWgSdka19XgUaA6vtJU5C5LXjU2XO7Y7S3qZQTK3ySn
	 /rwS//iB2whQyfscHQ5i4z83dsSNmiRB4dbUODUQ62p6v58FNWIZrMDW1B478axCk/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677038;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d+9rcdBQj7tUd8U71B3qEx4rjjcXuuGgfgx8n7D2E1Y=;
	b=cyWtxng4UXfW5XgaYz0WM2j6eAYYM3CBJzRbQXTiZY5fTyrQKHHlKTnX8NeAnsejFDPw
	 HIAa0SSK++2l3BHDuO+z/2E1XSZNK8JI1GIEUkdU0rZN1p2PHzlNc84FcpeppJKlmzVM6
	 nCb2BGAKQGEOFSC4LTsJCSTvjoMMLfsKljC38TXi45a/bKqNMrM82+5HC51bTJB4pb7vq
	 EmFi6V4Fz8MUZaXECuK0xXgjGVVEpEKNKO7Yh8UdrX9Gq1OmY0iXflkpvPQgFkoPba89D
	 lMoXaCHfv+g7x3CoNTZZZU0ao4pfjfgB1DdZDOxgWhNPcouKQ5qCbaL81z1DkNLntHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mKD2t/v5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A28606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKD2t/v5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B991F000C6;
	Thu, 26 Nov 2026 07:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795677038;
	bh=d+9rcdBQj7tUd8U71B3qEx4rjjcXuuGgfgx8n7D2E1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mKD2t/v58UM7H0ZGcyJOZXJQ7kOTPhcWvrqj/3kaib0CIC5AtEd+Vz7ARShqHcRJC
	 jvwz/5r+Hq0nhI9Wkv2xbjdEiTSKIH6hM+K7/016PHCCwYkn02qT0XW2YVwdGCBm2I
	 aZRpOhmKzMPbwhPiA3oczofg6qj+/bqBdtLtHq6er0J9TNx9nvEEWG23iZaON7qKnr
	 7D/81nxqzqB4wIQlyoBFrN6FOu+mN58yz80FelkSb4c0JvhjkasZ6dqajLclTUTIJO
	 03WOs1wDrTjJH/rCzotjfYY7jocZxBaGA4WoW9Y0RzPEXYqgh7U8nz7GSGF0VBy2Le
	 LEwjsd24tz71A==
Message-ID: <sashiko-outbox-234934@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 21/21] arm64: dts: qcom: hawi: Add DCP support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jayant Shekhar" <jayant.shekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-21-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
 <20261126-jshekhar-v3-dcp-v3-21-f1e9d7505039@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:10:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] arm64: dts: qcom: hawi: dcp virtio node placed under root
  instead of soc@0
- [Medium] arm64: dts: qcom: hawi: dcp left enabled in dtsi with
  unconnected endpoint
- [Low] arm64: dts: qcom: hawi: sde_disp0_vdd_active violates
  qcom,pmic-gpio schema
- [Low] arm64: dts: qcom: hawi: duplicate tlmm block and unsorted nodes
  in hawi-mtp
- [Low] arm64: dts: qcom: hawi: raw integer 13 used instead of
  IPCC_MPROC_DCP macro
--

commit 93016695cd15832073fccedfcdc7a71d20169a8f
Author: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

arm64: dts: qcom: hawi: Add DCP support

This commit describes the Qualcomm DCP VirtIO transport, display
subsystem, IPCC channel, IOMMU configuration, and DSI display graph in
hawi.dtsi, and wires up the DSI0 display panel and pin configuration on
Hawi MTP.

> diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/=
qcom/hawi-mtp.dts
> index c38e5fab7a2cb..50484d006db6b 100644
> --- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
[ ... ]
> @@ -995,3 +1007,99 @@ &usb_dp_qmpphy {
>  &usb_dp_qmpphy_out {
>  	remote-endpoint =3D <&pmic_glink_ss_in>;
>  };
> +
> +&dcp_dsi0 {
[ ... ]
> +&pmd8028_e1_gpios {
> +	sde_disp0_vdd_active: sde_disp0_vdd_active {
> +		pins =3D "gpio2";
> +		function =3D "normal";
> +		input-disable;
> +		output-enable;
> +		bias-disable;
> +		power-source =3D <2>;
> +		qcom,drive-strength =3D <2>;
> +	};
> +};

[Severity: Low]
Should this child node be named sde-disp0-vdd-active-state?
Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml requires
pin configuration child node names to end with "-state" and sets
additionalProperties: false, so sde_disp0_vdd_active fails dtbs_check.

> +
> +&pmh0110_d_e0_gpios {
[ ... ]
> +};
> +
> +&tlmm {
> +	sde_te_active: sde-te-active-state {
> +		pins =3D "gpio86";
> +		function =3D "mdp_vsync";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_esync0_suspend: sde-esync0-suspend-state {
> +		pins =3D "gpio88";
> +		function =3D "mdp_esync0";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +
> +};

[Severity: Low]
This isn't a bug, but hawi-mtp.dts already defines a &tlmm block earlier
in the file and keeps &label overrides sorted alphabetically.  Should
these pin states be merged into the existing &tlmm node and the new
&dcp_dsi0, &dcp_intf1_out, &pmd8028_e1_gpios, &pmh0110_d_e0_gpios, and
&pmh0110_f_e0_gpios blocks (as well as regulator-display-panel-vdd under
/) be placed in alphabetical order?

> diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qco=
m/hawi.dtsi
> index 77d704fa6cf74..9d22243b97d77 100644
> --- a/arch/arm64/boot/dts/qcom/hawi.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
> @@ -6854,4 +6854,49 @@ timer {
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>  	};
> +
> +	dcp: virtio@9be8000 {
> +		compatible =3D "qcom,dcp-virtio";
> +		reg =3D <0x0 0x09be8000 0x0 0x1000>;

[Severity: High]
Should virtio@9be8000 be placed inside /soc@0 (sorted by unit address)
rather than directly under the root node after timer?

All MMIO peripherals in hawi.dtsi live under /soc@0, which defines the
SoC ranges and 36-bit dma-ranges =3D <0x0 0x0 0x0 0x0 0x10 0x0>.  Because
the root node has no ranges or dma-ranges, placing virtio@9be8000 under /
fails root-node dtbs_check validation and causes of_dma_configure_id()
(including the call in dcp_subsystem_dev_init() for display-subsystem) to
fail to inherit the SoC 36-bit DMA range, leaving dev->dma_range_map
unset and clamping display-subsystem to a 32-bit coherent DMA mask.

> +		interrupts-extended =3D <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
> +				      <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
> +		iommus =3D <&apps_smmu 0x15a3 0x0>;
> +		iommu-ranges =3D <0x0 0x84000000 0x0 0x04000000>;
> +		dma-coherent;
> +		mboxes =3D <&ipcc 13 5>;

[Severity: Low]
This isn't a bug, but hawi.dtsi includes hawi-ipcc.h, which defines
IPCC_MPROC_DCP for client 13.  Could interrupts-extended and mboxes use
IPCC_MPROC_DCP instead of the raw literal 13 to match the other IPCC
consumers in this file?

> +		mbox-names =3D "dcp-power-tx";
> +
> +		display-subsystem {
> +			compatible =3D "virtio,device34";
> +
> +			iommus =3D <&apps_smmu 0x400 0x2>;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@1 {
> +					reg =3D <1>;
> +					dcp_intf1_out: endpoint {
> +					};
> +				};
> +
> +			};

[Severity: Medium]
Should dcp have status =3D "disabled"; in hawi.dtsi and be enabled via &dcp
in hawi-mtp.dts, as described in the commit message?

Leaving dcp enabled in hawi.dtsi with an empty dcp_intf1_out endpoint
violates Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
(which requires remote-endpoint on every port endpoint) on any Hawi board
that does not connect a DSI0 panel.  At runtime on such boards,
dcp_virtio_transport_probe() still wakes DCP firmware and
dcp_dpu_kms_init_dsi_bridges() sees the empty port@1 endpoint and adds
dsi@0 to the DRM component match list, which can never bind without an
attached panel calling dcp_dsi_host_attach().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-jshekhar-v=
3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com?part=3D21

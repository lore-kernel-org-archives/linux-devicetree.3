Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737085;
	b=Rc15iFIsapbO1TM14gNhCqULv/0+LyjpXZn8w1kTI5v3lKuqwhEQeOL+4RmjlbHv3dvC
	 UR8GgAohPZ3lwpsok5f9HwwPnvXv4gffaIB8lp3yMOx1bQT0jRLeemtVuOheNc/0HAnCo
	 Q0SyBGl6UhVFvGpP7sIde5QbyV1D0EwSkKETkQxYdR9rmeK66JQ76EXbRnn+yCG5sc0hV
	 P/c6TdhFBWMO3iwAPQTB7DBadnFgBZP0Lg+B7N8pnxgbfWPWj7t8cCuYOBqE8dv2HF1P0
	 CwPyNYykB8S73ZhR+IMZ43DvSEs+XaftAE+IAKPnnSlTWh7zhEOD5r7EI/FPA4ct+VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737085;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=21YTsaUIzqwKpv7uvmR8FnltNXuMCMLU81BLzlN5RkI=;
	b=d9Pso8kBVLqdWKKPo11p0KC0ZUXzlGzzdHheheNU75e4NTT/8tWPHYHZr3MYwc+4qBsL
	 NaQcOhw6g1MhVtdc/7OtHjWTdH1UzS6lfYa6RBxEHCetKo92J7O5MzlHIwRdm7RmPONN7
	 tzg//fwJdnO+M61ARIXpRn1kH2fe/Do+0vBb82EvRj7ovYby62cYHOYhLnAJ8XoOvkNLq
	 IoMSEdjk7t452tlo30cDTL5HGYQDpjSGvQV20fhF7c3OohYuFOE21r77odd9Cy2VXvtE5
	 zEcVjrmbm4sZ2zmwlBQ/VLfGj0KY36Q/IgZSN8X6TiCBBJGe61es8lVsCEFP8v+5d2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UnykI1v+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E136606A31B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UnykI1v+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C1E1F000C1;
	Tue,  3 Nov 2026 20:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793737085;
	bh=21YTsaUIzqwKpv7uvmR8FnltNXuMCMLU81BLzlN5RkI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UnykI1v+Itt78na5Z36W5O1LCpzg6PyihARN6su5Ib470myi14uFLUTfDGYHNagRA
	 r185rwgLGQBWsMDN41/arlTpdN/sltS+UnYcoLZaaaGLvII3SMu6eFdKZB0zTDNfGB
	 IJYoh6BUL/bnt/Op1er3xsmEMSyROZPaDlR/q6Ec0/WAzdzXnZMo/ccLtsoY6+yNSQ
	 gNr/bGWgyc3pfWnjQqk+dmL04EVhWfyd/5Q4DaR7Ykh6iM+idn/iLVVydIyUhxUtp8
	 wCJdgH5PXIaJpXwLOZfj8L4yd8g43q9JwhwSoIRXI/U2Gd0VEj3vtiDgqy7NdZFkKj
	 NCwAdmBGEVkBQ==
Message-ID: <sashiko-outbox-195980@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 7/9] arm64: dts: qcom: agatti: Add OPE node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261103-camss-isp-ope-v13-7-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
 <20261103-camss-isp-ope-v13-7-c2cbf15a39b1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 20:18:04 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: agatti: duplicate OPE SMMU stream IDs in camss=
 and isp_ope
--

commit 0728079779703fd918786c156a61313ff87b0a37
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: qcom: agatti: Add OPE node

This commit adds the Offline Processing Engine (OPE) device tree node for t=
he
Agatti platform (QCM2290), describing its register regions, clocks,
interrupt, interconnects, IOMMU mappings, and OPP table.

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index d9f4cbfd2861c..8f2b451b8f6e8 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -1990,6 +1990,83 @@ port@1 {
>  			};
>  		};
> =20
> +		isp_ope: isp@5c42000 {
> +			compatible =3D "qcom,qcm2290-camss-ope";
> +
> +			reg =3D <0x0 0x5c42000 0x0 0x400>,
> +			      <0x0 0x5c42400 0x0 0x200>,
> +			      <0x0 0x5c42600 0x0 0x200>,
> +			      <0x0 0x5c42800 0x0 0x4400>,
> +			      <0x0 0x5c46c00 0x0 0x190>,
> +			      <0x0 0x5c46d90 0x0 0xa00>;
> +			reg-names =3D "cdm",
> +				    "top",
> +				    "qos",
> +				    "pipeline",
> +				    "bus_read",
> +				    "bus_write";
> +
> +			clocks =3D <&gcc GCC_CAMSS_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_OPE_CLK>,
> +				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
> +			clock-names =3D "axi",
> +				      "core",
> +				      "iface",
> +				      "nrt",
> +				      "top";
> +
> +			interrupts =3D <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
> +
> +			interconnects =3D <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
> +					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
> +			interconnect-names =3D "config",
> +					     "data";
> +
> +			iommus =3D <&apps_smmu 0x800 0x0>,
> +				 <&apps_smmu 0x820 0x0>,
> +				 <&apps_smmu 0x840 0x0>;

[Severity: Medium]
As reported by Sashiko on v12 [1], should the OPE stream IDs (0x800, 0x820,
and 0x840) be removed from the camss node (camss@5c11000) in
arch/arm64/boot/dts/qcom/agatti.dtsi now that isp_ope (isp@5c42000) claims
them?

In arch/arm64/boot/dts/qcom/agatti.dtsi, camss@5c11000 still lists the three
OPE stream IDs alongside VFE's 0x400 stream ID:

		camss: camss@5c11000 {
			...
			iommus =3D <&apps_smmu 0x400 0x0>,
				 <&apps_smmu 0x800 0x0>,
				 <&apps_smmu 0x820 0x0>,
				 <&apps_smmu 0x840 0x0>;

When both camss and isp_ope are enabled (for example via
arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso),
arm_smmu_master_alloc_smes() and arm_smmu_device_group() in
drivers/iommu/arm/arm-smmu/arm-smmu.c match the shared SMEs for 0x800, 0x82=
0,
and 0x840 and merge camss and isp_ope into a single iommu_group and shared
DMA iommu_domain:

drivers/iommu/arm/arm-smmu/arm-smmu.c:arm_smmu_device_group() {
	...
	for_each_cfg_sme(cfg, fwspec, i, idx) {
		if (group && smmu->s2crs[idx].group &&
		    group !=3D smmu->s2crs[idx].group) {
			mutex_unlock(&smmu->stream_map_mutex);
			return ERR_PTR(-EINVAL);
		}

		group =3D smmu->s2crs[idx].group;
	}

	if (group) {
		mutex_unlock(&smmu->stream_map_mutex);
		return iommu_group_ref_get(group);
	}
	...
}

Furthermore, if isp_ope is probed by the IOMMU core before camss (such as
when camss is enabled via an overlay), arm_smmu_device_group(camss) matches
isp_ope's group on SMEs 0x800, 0x820, and 0x840 and returns early without
populating smmu->s2crs[idx].group for camss's 0x400 SME.

[1] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-7-702254689feb@oss=
.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-camss-isp-=
ope-v13-0-c2cbf15a39b1@oss.qualcomm.com?part=3D7

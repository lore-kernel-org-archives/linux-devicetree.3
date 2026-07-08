Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE8031355C
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489819; cv=none; b=kBr2z9k8CpNRbitwxI5bh/2SUO41yHpqwA5XmY02x9SeQb3vuGQL3TzcN7GwlGPbq0eNT5juGGtmzJBSjuLHjFZTGIhPau5367rYZcHB3YAGZDMqehsSWvoqYxJqX5cU9eSX4XJQrUTntwtazy/glUm5I4bW+anvnG9JncIKl3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489819; c=relaxed/simple;
	bh=ii+a+u3w+h1uLc7MHadhzulLGZYx9LbH1c+1aaSRwgs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WiC1WV1pgCt8lmRQe9VWYCOKhmN8n30ZHpl6vcIZxtZFng4dTjsnaaMetbCHO7lwz+8j9Ztn+mpXIFuLJLO4KYc0R++WpBV7eU8VZS+E0IAbG528RyPU8/y85NAd0jMHgOnH7hjrBLIMW1Ipf5QgkVkxQhLURGI06sI0kBWhYKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVIYxfWk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVIYxfWk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90C91F000E9;
	Wed,  8 Jul 2026 05:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783489818;
	bh=pr4gNT/19Zou1KeFEFEC1pzLL21JwJaxml6zXNvWwcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bVIYxfWkxS3i2rygfkuvyKsZnMUr/pmcS9aP99ws1KDdQeVSVYlwmB0aE8bSPHZGp
	 qansaQ9eZm4zwelg3WBB7KTP0CNyPElD1UYqEhEPPQjdqmLJR++QzvRubdYEnVUJcY
	 ar+p1dy5LRufHoB7C6OzOJDWB8eiMEtVzoFClvXZzTFsA8amf9Xr3dgkAjR0L+ljY6
	 J+TB9wKFfDFmDnG+UKHSxh+J/9GVKTtgQDd9ltmr++aoFUojpDd0EV7K9XUMzVAOkT
	 TI536W92fBDGQDUg1LyQxf6M/a06eyKo8Tylr/xA4wWFVmMnWOMVrPrf/b9QeOzXWA
	 wcEy31QPy53wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com>
References: <20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 05:50:17 +0000
Message-Id: <20260708055017.A90C91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `interrupts`, `interrupt-map`, and `iommu-map` properties are =
incorrectly swapped between the `pcie0` and `pcie1` nodes.
- [High] Missing `msi-map` and `msi-map-mask` properties in both `pcie0` an=
d `pcie1` controller nodes.
--

--- Patch [1]: [PATCH v2] arm64: dts: qcom: eliza: Add PCIe PHY and control=
ler nodes ---
commit 3e6d0e6b1d707ae4bb730aa1670a7c5e1a2690b4
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: eliza: Add PCIe PHY and controller nodes

Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
(PCIe1). Add PCIe controller and PHY nodes for both instances, and update
the GCC clock references to use the newly added PHY nodes instead of
placeholder zeros.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 977de44b816e4..7cfd242bc1929 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi

[ ... ]

> @@ -1786,6 +1786,367 @@ mmss_noc: interconnect@1780000 {
>  			#interconnect-cells =3D <2>;
>  		};
> =20
> +		pcie0: pcie@1c00000 {
> +			device_type =3D "pci";
> +			compatible =3D "qcom,eliza-pcie", "qcom,pcie-sm8550";

[ ... ]

> +			interrupts =3D <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,

[ ... ]

> +			iommu-map =3D <0 &apps_smmu 0x1480 0x1>,
> +				    <0x100 &apps_smmu 0x1481 0x1>;

[Severity: High]
Are the interrupts, interrupt-map, and iommu-map properties swapped between
the pcie0 and pcie1 controllers?

Looking at both nodes, pcie0 claims GIC_SPI 376 and iommu-map 0x1480, while
pcie1 (at 0x1c08000) claims GIC_SPI 141 and iommu-map 0x1400. If these are
reversed, hardware interrupts and IOMMU Stream IDs will be cross-wired.=20
This could cause DMA transactions to trigger SMMU context faults and route
endpoint interrupts to the wrong handler.

> +
> +			interrupt-map =3D <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-map-mask =3D <0 0 0 0x7>;
> +			#interrupt-cells =3D <1>;

[Severity: High]
Should msi-map and msi-map-mask properties be included for this controller?

Without the msi-map property, the PCI core cannot map requester IDs to the
GIC ITS device IDs. This will force a fallback to the internal DesignWare
MSI controller, limiting the system to 32 standard MSIs and preventing
MSI-X support.

[ ... ]

> +		pcie1: pcie@1c08000 {
> +			device_type =3D "pci";
> +			compatible =3D "qcom,eliza-pcie", "qcom,pcie-sm8550";

[ ... ]

> +			interrupt-map =3D <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-map-mask =3D <0 0 0 0x7>;
> +			#interrupt-cells =3D <1>;

[Severity: High]
Are msi-map and msi-map-mask properties also missing here for pcie1?

Similar to pcie0, missing these properties will break MSI-X support for
devices connected to this controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-eliza_dt-v=
2-1-e6281da26408@oss.qualcomm.com?part=3D1

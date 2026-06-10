Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A6403E90
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094236; cv=none; b=HlsNs/hM0eYL7/iInj9Lg6bmC+AN1XU7MSY0Lou72prra3qoNrlkuyJWBmFI4nBfKhMKmcd4KfqSdpjcIw11zDbqZZw/6ha6Co4mlu0GOT6eO8rRLlwRCEW60Eqt+ULSZ+3W2d8j2/6Sq+BEbbskrWArok5MWrh+aBj32K8k+Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094236; c=relaxed/simple;
	bh=V0mbJqzXlSCOuNFxLBw9XYjjN8mbOlxqq5szWq3JHrY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JMHxWGQZ1VC8ghFrqo5lfO724qHiXKoKT6u/G1nC6IC4zCIjqwNeBXPGb5HlFzUpUqeL1QkfPJWDxOSjivk0Z80dCkpU5MIM8TmtQD47KLBcx+oz2XZpopilcti4eUV6PhgC/3JUS68QYGkdNsvKloOpuuJQQoovP+ABMB6t+/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dD8p5CJF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dD8p5CJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B67E1F00899;
	Wed, 10 Jun 2026 12:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781094235;
	bh=hBsn+lwd9hXDDcrMYvF9WP67yF3fAau7tWvcylFjtbw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dD8p5CJFKTeSgbs+3qP/KJuGixAoUgLAqnZz0WMnca44+Fj/YfX0X6OeRQ4J2p4Cr
	 Hyy7WJDfDz/4yUB44mCXPdReuUX+1e1aKvfNLTwurCGMb+Xiezvuh/QSttnZRuh+PQ
	 r3hN2zAkdCZR/gIi9qroYg5rQmNpZaBG8NxEiG4jsN2n9IxFYHiKBY6Rnbfcq6jz8/
	 ZAHuPfDb1k9FPJbLuQjTt+1q3kCjHE5i1YS5sZv7mespLLcW2XQZ8xRchg+hHFTPRL
	 e73bLdHbH8jMwFt3DfTV1tHnmhbfcNT8TRLxQnxXOHI/9USXfDxXY1laEyDEs9MprO
	 NfFWYmQyAMjGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
References: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 12:23:54 +0000
Message-Id: <20260610122355.1B67E1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `msi-map` device tree property in PCIe controller nodes.
--

commit 0646a5585317fe9881a2b5cfe976f1ab1485cf3c
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: eliza: Add PCIe PHY and controller nodes

This commit adds the PCIe controller and PHY nodes for the two PCIe instanc=
es
on the Eliza platform, and updates the GCC clock references to use the new
PHY nodes.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 4a7a0ac40ce62..c4f0923710bbb 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
[ ... ]
> @@ -716,6 +716,361 @@ mmss_noc: interconnect@1780000 {
>  			#interconnect-cells =3D <2>;
>  		};
> =20
> +		pcie0: pcie@1c00000 {
> +			device_type =3D "pci";
> +			compatible =3D "qcom,eliza-pcie", "qcom,pcie-sm8550";
> +			reg =3D <0 0x01c00000 0 0x3000>,
[ ... ]
> +			operating-points-v2 =3D <&pcie0_opp_table>;
> +
> +			iommu-map =3D <0 &apps_smmu 0x1480 0x1>,
> +				    <0x100 &apps_smmu 0x1481 0x1>;
> +
> +			interrupt-map =3D <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-map-mask =3D <0 0 0 0x7>;
> +			#interrupt-cells =3D <1>;
> +
> +			linux,pci-domain =3D <0>;

[Severity: High]
Should this node include the msi-map property?

Without an msi-map property to map PCIe Requester IDs to GIC ITS Device IDs,
the generic PCI device tree parsing code will fail to assign an MSI domain
to the PCIe bus. This prevents MSI and MSI-X operation for all downstream
devices, forcing a fallback to legacy INTx. The property is also required by
the qcom,pcie-common.yaml binding.

[ ... ]
> +		pcie1: pcie@1c08000 {
> +			device_type =3D "pci";
> +			compatible =3D "qcom,eliza-pcie", "qcom,pcie-sm8550";
> +			reg =3D <0 0x01c08000 0 0x3000>,
[ ... ]
> +			operating-points-v2 =3D <&pcie1_opp_table>;
> +
> +			iommu-map =3D <0 &apps_smmu 0x1400 0x1>,
> +				    <0x100 &apps_smmu 0x1401 0x1>;
> +
> +			interrupt-map =3D <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-map-mask =3D <0 0 0 0x7>;
> +			#interrupt-cells =3D <1>;
> +
> +			linux,pci-domain =3D <1>;

[Severity: High]
Is the msi-map property also missing for the pcie1 controller node?

As with pcie0 above, omitting the msi-map property prevents MSI/MSI-X
capabilities from being properly established for downstream devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-eliza_dt-v=
1-1-7bb72b75fc5b@oss.qualcomm.com?part=3D1

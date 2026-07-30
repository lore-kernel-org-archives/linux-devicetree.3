Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF053B27EC
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413210; cv=none; b=fe2CCO5q18xD0OLJfnVPq9/KI2PbRFGFSiL2ZfcWUJTMHDxhhcqWIdL5GZbQvAWFLCsLQvlqFqY6gRLN/8jggf/l7mEmeMwrBYC+0hvWQzj3GS7w03CistFy+D5gVrTX0qKhexWreWYq1nJJjRY0c9JrZDwHRb7v3n5i9BKqvpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413210; c=relaxed/simple;
	bh=VBb0XHShjOjW8s3FyloVaOFSmZIDAXl0VvT0QziwUGE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WvFQqQSBl0Kf60rYiVfl09DzX0KCUuy0hLpeSxJOvNrPj6GIOcHzlkpTiw5E30oZnBPafqIdrwYw6bd4O1a8BKSe14JJKYF38CWTMF+adBsLjtJadOEpaM0Ry93nKGtROTLJ5HJbhV4BfEsp8PxC6FbtmRmEd7IhtmqQZynvMTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdUv/YB2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdUv/YB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7501F000E9;
	Thu, 30 Jul 2026 12:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413208;
	bh=Nb1SANbfdMcAmBw0a8okcR82uy9jNT06OJDVlObTjtI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mdUv/YB26zXynVNZPVu7ocljG4b5rCHjwcj33hFkwUoDX0oU3ta+UbrCV7wM7Bb9o
	 G/sLT21yRtKUr3I9CBidWxhFQcHQVHwy71b/GwBeUgvGFW+Egcn2pavD7nWs/80F4E
	 MDT3mQOefPB5VPlIT9rnr9tUKukNLP8PSCD+27woXyrYOwje2cbon9EnqwWsPWaKQZ
	 xmWCGRXS6B1WfX26IvK9v2u6WunqZn2o760m56AkFTJZhVs4xwDpBjYU9SgF40SAUR
	 bvjTbb0/1fmF4H3wVdocMbc4u4jZiOiS70pWhQE3JR6DKFERKwzA1Kd4c9AdXUXJKY
	 zKPzmcRnYMFlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/22] arm64: dts: qcom: sm8250: Fix the PCIe iommu-map
 entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-iommu-map-fix-v1-7-83405d37ba41@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <20260730-iommu-map-fix-v1-7-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 12:06:48 +0000
Message-Id: <20260730120648.9C7501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Modifying `iommu-map` entries from 4 cells to 5 cells breaks b=
ackwards compatibility with older kernels.
- [High] Adding a 5th cell to `iommu-map` entries breaks PCIe on SM8250 bec=
ause the QCOM PCIe driver hardcodes a 4-cell structure when parsing this pr=
operty.
--

--- Patch [7]: [PATCH 07/22] arm64: dts: qcom: sm8250: Fix the PCIe iommu-m=
ap entries ---
commit a5815a8c934e5c94f8aea5e79e5ac8f47d1465b8
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: sm8250: Fix the PCIe iommu-map entries

The commit updates the iommu-map entries for PCIe to include two cells
for the IOMMU specifier, matching the apps_smmu #iommu-cells property.
This resolves a warning from the OF core about 1-cell entries targeting
2-cell #iommu-cells.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index 7076720413ab2..c6f49ae9d253c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2190,8 +2190,8 @@ pcie0: pcie@1c00000 {
>  				      "tbu",
>  				      "ddrss_sf_tbu";
> =20
> -			iommu-map =3D <0x0   &apps_smmu 0x1c00 0x1>,
> -				    <0x100 &apps_smmu 0x1c01 0x1>;
> +			iommu-map =3D <0x0   &apps_smmu 0x1c00 0x0 0x1>,
> +				    <0x100 &apps_smmu 0x1c01 0x0 0x1>;

[Severity: High]
Does this change break the qcom-pcie driver's parsing logic?

Looking at drivers/pci/controller/dwc/pcie-qcom.c, the driver has a fixed
structure it expects for iommu-map entries:

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_config_sid_1_9_0() {
	/* iommu map structure */
	struct {
		u32 bdf;
		u32 phandle;
		u32 smmu_sid;
		u32 smmu_sid_len;
	} *map;
	...
}

If the iommu-map property is updated to contain 5 cells instead of 4, will
this hardcoded struct misalign and read the wrong values for smmu_sid and
length?

[Severity: Critical]
Will this cause a regression for older kernels booting with this updated
device tree?

Prior to commit ccb2fd725d41, the generic of_map_id() function in
drivers/of/base.c enforced a length check that assumed exactly 4 cells per
entry. Adding a 5th cell will cause that modulo check to fail and return
-EINVAL.

Since device trees are often treated as firmware ABI, will older kernels
fail to parse these mappings entirely and break DMA isolation or cause SMMU
faults?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iommu-map-=
fix-v1-0-83405d37ba41@oss.qualcomm.com?part=3D7

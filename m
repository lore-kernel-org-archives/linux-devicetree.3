Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA0039DBF7
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307313; cv=none; b=Q3pfdMkeAmc/wqsxAnofZ8aofZ6xOE9KdSAVZ44xlnZUWBTJ0fXIfrPwRKhW1X7A9SL7SnfvDTAMrzgGxgvigouba9RC/OD+sCNZJml9+pW0IDIeHPIltBxIfkF/EciCIQzzDhBG/8vxPq0CvGYRYqVx6BcsQBcjfAT+pXyyzBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307313; c=relaxed/simple;
	bh=0iRMUIppQQQkilqJwCsvDcx9/ZUSBs8z8ye4eqeLCeI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bjdMipmSg/NsHl4fDIzDvi0UIaDSX+OVCHoNFUMVE8kmE1Y1Fcah7R3bHWranE8u4ODvjek71eFWX+TaXcm+BU61JldSjUwN4TdPaZrn+go1PrnQsg6nESG/VGHcEU0eIKXFzit3kfjz9CWfO2+Kzu9s6KBKHhsiopFKUwa4LEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiD2GpDK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiD2GpDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140031F00A3A;
	Sun,  9 Aug 2026 20:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786307312;
	bh=PMHcunN2PELlLd22jIo3s3Zq/9lfxZiPoMmP3bHyy7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CiD2GpDK+VqVAhbJZjNaqBqcaD/sU0qbdk1DWgJhV3grm9rsHN+3Z5CxI6pcpFwR2
	 uxa4HDVseCh2TUgWg9kcdnaJDKkLN87WWzNjyN4g3Djs9aNqx7m57yJIpOS+qdxoSU
	 dEPClCWDYoR0vKm+swX+HiRLHLnn6dHnzNT6O4j8ZnGqFa/9DV4HsHbdB4yJ2+Anez
	 khv50kpjRB1S3HZuPn/k0sw3FKNCj+rnK+OD8wlXsB9TB8jitg7gMEm6M8whL3dUr8
	 dtRApbt8V/6eCCVy4agfmVNw5frqODXboBHJm0OG6pO8J9gf81TqJ3jNgILGmpTVu9
	 gx4zMXL0Gf3aA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: iommu: qcom,iommu: document the
 MSM8974 IOMMUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-1-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-1-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 20:28:31 +0000
Message-Id: <20260809202832.140031F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing top-level 'interrupts' property and incorrect unconditio=
nal requirements for new direct-mapped instances.
- [Low] The schema fails to conditionally require the `reg` property for th=
e newly added MSM8974 per-instance compatibles.
--

--- Patch [1]: [PATCH 01/12] dt-bindings: iommu: qcom,iommu: document the M=
SM8974 IOMMUs ---
commit b29444ad6a6fa61aa71980a7c581393333c88d6a
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

dt-bindings: iommu: qcom,iommu: document the MSM8974 IOMMUs

This patch adds per-instance compatibles for the display, Venus and GPU
MSM8974 IOMMU instances based on the ARM SMMU v1 spec. It allows the driver
to carry per-instance prefetch tuning tables and stream ID maps, and updates
property documentation for direct-mapped instances.

> diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Do=
cumentation/devicetree/bindings/iommu/qcom,iommu.yaml
> index 93a4890253170..43dffe41e3b8f 100644
> --- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
> @@ -30,6 +30,10 @@ properties:
>                - qcom,msm8953-iommu
>                - qcom,msm8976-iommu
>            - const: qcom,msm-iommu-v2
> +      - enum:
> +          - qcom,msm8974-gpu-iommu
> +          - qcom,msm8974-mdp-iommu
> +          - qcom,msm8974-venus-iommu

[Severity: Medium]
Will valid configurations for these direct-mapped instances fail schema
validation when qcom,iommu-secure-id is missing?

If the OS programs the global register space directly, statically assigned
iommu-ctx@ child nodes aren't used, requiring interrupts to be defined at t=
he
top level. Because interrupts is not defined at the top level and child node
properties are unconditionally required, adding a node for these compatibles
without qcom,iommu-secure-id appears to fail dt_binding_check.

Could the global schema constraints be adjusted to allow top-level interrup=
ts
and conditionally relax child-node requirements for these new non-secured
instances?

[ ... ]

> @@ -50,13 +54,23 @@ properties:
> =20
>    reg:
>      maxItems: 1
> +    description:
> +      For instances using the qcom,msm-iommu-v1/-v2 fallbacks, the
> +      optional "SMMU local" register region used for interrupt routing
> +      configuration. For instances with per-instance compatibles, the
> +      SMMU global register space, used for stream mapping configuration
> +      on non-secured instances and for the implementation-defined
> +      prefetch registers on all instances.

[Severity: Low]
Is a conditional allOf block missing to enforce the presence of the reg
property for the new MSM8974 per-instance compatibles?

The description states that reg is used for the implementation-defined
prefetch registers on all instances with per-instance compatibles. Without
requiring it conditionally, incomplete device tree nodes missing the reg
property will silently pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-msm8974-io=
mmu-upstream-v1-0-87f5cd492560@oss.qualcomm.com?part=3D1

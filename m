Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE0044A3FF
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093130; cv=none; b=CaZ/XCXn2aleRQGqBg6V4Cl7FYLbkgaPH12sMDlGk/xyBmX9XB6F2awVfP9mr9LDvEulpuXy46q0PswCQDiQNEwyYBuKytTNOx2SXXNguKGSv6VXHY2QuDcKi4W6u+zclPTu4VibufPvet4Eevc2fkOF5O7CBbbU/16FciEFnRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093130; c=relaxed/simple;
	bh=0ugaeCH4JuoVuuUNQwG9vZzV16Pady6LgVqXNv3H1ZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uuDTtQzSkFRctg0LGGwwRvqM5pcc4n7+EohQDJLeOcv7flzMPvipowOh04CQKFCu/atflm6gq3r1LSvB9em2LIYtqzXfWrBARLfEJQ4arj8G5oqlyLlkhSejiSKPlEVTG+ECTFHeC3dVcUP7MvbGv0QSWExN7d8ghh3el/hcINY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bC9fACl7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bC9fACl7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B631C1F000E9;
	Fri,  7 Aug 2026 08:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786093128;
	bh=e9RtxnccOus2kOIQr7C+s1cSnAGHh2er9unEEHS8oLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bC9fACl7aZ9jE7ryk4PKns9qjPU/7BTe+zv4fOwFoN4W33tAqVaRRvsdBemDYPSbu
	 fhAmJe7RgGAKDsLcXMl0uJEcH/NJRKOFui5kd4OloPXAaEqg1It7IQ7vcMVJ5m60q9
	 UI+fJ/2fYtMoQXTNeffK/HbESXigzKMDkLObVLSyuRXBm6JvOfKZ2eMSRPLHF5h5J8
	 mZrckg/nmrfOSKwC1k9NNR3sWaBHawJ4kpOJ5HOb6OdzS8/kP/j1zzH8KiyXxJ1A4t
	 hQi19AJd+Mu/WUxuFpV5S0QEMMc1F5147FlSnBhMc74oPA/YVGugE6LJ6mwYtt4Rrg
	 VLhMaCQiqkQOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/22] arm64: dts: qcom: msm8916: Reserve low IOVA range
 for Venus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-14-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-14-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:58:47 +0000
Message-Id: <20260807085847.B631C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The IOVA reservation added for Venus is ineffective because the qc=
om-iommu driver does not implement the `.get_resv_regions` callback.
--

--- Patch [14]: [PATCH 14/22] arm64: dts: qcom: msm8916: Reserve low IOVA r=
ange for Venus ---
commit d8c0142deff84cf404f92b187d9bada3c787a2bb
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: msm8916: Reserve low IOVA range for Venus

This commit reserves the IOVA address range below 0x25800000 for the
Venus VPU to prevent unhandled SMMU page faults and spontaneous reboots
during video decode. It adds a reserved-memory IOVA node and references
it in the venus node.

> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/=
qcom/msm8916.dtsi
> index e39743e220438..b9f63d9f2c775 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
[ ... ]
> @@ -114,6 +114,17 @@ mba_mem: mba {
>  			no-map;
>  			status =3D "disabled";
>  		};
> +
> +		/*
> +		 * The Venus VPU reserves IOVA below 0x25800000 (600MB),
> +		 * primarily for non-pixel buffers using different Stream IDs.
> +		 * DMA into that range triggers unhandled SMMU faults and
> +		 * spontaneous reboots, so reserve it to keep IOMMU
> +		 * allocations above this boundary.
> +		 */
> +		venus_iova: venus-iova {
> +			iommu-addresses =3D <&venus 0x0 0x25800000>;
> +		};

[Severity: High]
Is this reservation effective on this platform?=20

Looking at the qcom-iommu driver used by apps_iommu, the qcom_iommu_ops
structure does not implement the .get_resv_regions callback:

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_ops {
	static const struct iommu_ops qcom_iommu_ops =3D {
		.identity_domain =3D &qcom_iommu_identity_domain,
		.capable         =3D qcom_iommu_capable,
		...
	};
}

Without this callback, iommu_get_resv_regions() will return an empty list
and silently ignore the iommu-addresses property defined in the device tree.

Could this allow the DMA API to continue allocating IOVA addresses in the
reserved range, thereby still triggering the SMMU faults and system reboots?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D14

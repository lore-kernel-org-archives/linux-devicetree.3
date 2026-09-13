Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0552390C8A
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326527; cv=none; b=OhZCdB5Yj1eiugN6qdEIQolRgEfYSMaNO9ihOakLZUNj3/7JIYIC5qRXHuelBSjAWKvUmaw7ZLZXCy29QfZ3dshaHAECXLsK0Dr5qbroThABOg35lI7c0JqW6tS66T8ZmF3sptP4xSpHoq9yJOdXwL66cXlOxiq2rkTdDzo09sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326527; c=relaxed/simple;
	bh=mIgipHdntfdgaE4JwZqIzk2xggisuXU1N6oUFqP2fA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TmlUiSSIpP2L+2/m8J69kRx/qQ3UQVoB6oML+24RbfI/APgUPofirPJur+xgcUkJyAR8i3JJKVKSzzooOIuYfNAF+izliurvBb3ITWMx95iyyQPlFwrbVrkrqwo8bc9+QRwKpvO0spNKnapLqdtMNG3Olpa0PExG++taUFpF1DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aClP7j5v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aClP7j5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABEC1F000FF;
	Sun, 13 Sep 2026 19:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789326526;
	bh=GkbjOBseKELkuiDKaNVXbupgrHMMUsefn1EEPAtiJKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aClP7j5v3uwouech6BB9MD/D1ra7WECMfOZusF0H5QCNcyZOonUdFVJ4vKEA6f00f
	 wtmBDdTVf/PBol2ioe1uZF3fbKBryEF0+cRIlbzra1TG2R2ZTshdmb0KBvPP0uMLzo
	 GF6j3QJmA6EGUGNehdck8I0zw/MQKY9/NeNXwiMNTTDFybUn7C6SrV2aUhuUbTPp4z
	 odAF35mHJBV5CypT6cz+LGDWEfwu7WysOCUhoPlzeJrTQmPkfonXaLUxnYgFtrnoUU
	 IFl7iAnvxe7h6WiIztBaJD6mLsTig4xltSSnAZHs8bHtJqS0adauhP2JtSTSDYt6lM
	 xWE5ARD8aRRjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/13] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-8-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
 <20260914-vpu_iommu_iova_handling-v4-8-9b9074a73c41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 19:08:45 +0000
Message-Id: <20260913190846.4ABEC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing IOMMU configuration for dynamically created dummy platform=
 devices.
--

commit 27813a8c872ca25525366d3507070b27ab569ab8
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Add Iris context bank subnodes

This commit adds non-pixel and pixel subnodes to the video-codec node to
assign specific IOVA address ranges to different SMMU streams. It replaces =
the
single iommus property on the parent node with subnode-specific configurati=
ons.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index fcd88e5f5d7ee..63e9ad58097f7 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi

[ ... ]

> @@ -5473,6 +5475,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ON=
LY>,
>  			 */
>  			status =3D "disabled";
> =20
> +			non-pixel {
> +				iommus =3D <&apps_smmu 0x1940 0x0>;
> +				iommu-ranges =3D <0x25800000 0xba800000>;
> +			};
> +
> +			pixel {
> +				iommus =3D <&apps_smmu 0x1947 0x0>;
> +			};
> +

[Severity: High]
Since these subnodes are dynamically instantiated as platform devices by the
Iris driver using platform_device_register_full(), they do not have matching
drivers and will never enter really_probe().

The platform bus normally sets up IOMMU and DMA during really_probe() by
calling platform_dma_configure() -> of_dma_configure().

Without the driver manually calling of_dma_configure() on these new
sub-devices, will their IOMMU mappings remain unconfigured?

If they are left unconfigured, could the video-codec hardware streams bypass
the SMMU IOVA allocator or fail DMA mappings, resulting in unhandled SMMU
context faults when a video encoding or decoding session is initiated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-vpu_iommu_=
iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com?part=3D8

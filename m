Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6483815DF
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326963; cv=none; b=N3ivVN8heF8a9D2dD128ED0rL7wF9HaKytg7P6pD+cCf3M8eEm3R7wDicEUssqF2Cw+LD+CvPNvCg53Bt0zOQyquweqlXDb77RSNMrswlJIoEG97kG1YWSArd5xr7Z7fzXo3MLBIMAsM5H41Kh6t+KkJFBNixbbnEZ3vvqq/rGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326963; c=relaxed/simple;
	bh=dz+3YLgUf8XYAAsl9SAUOouWWpSyHPNGNhKieGQ3URU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HpDYI617VateuWgntzEL7ebj0lBN/k/C1BjiWlOPIjlfItQodQtNoRFa94Jd04mBf38WsDldIL07scbRFwAjtOdYliteybQB9Af6/UXM7A/Lr1BFu7wa/u/Upt4BAH0vYAzglOtfnDOCaZyddWPWCWkKSjT/IHed0nE/xltvFHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/q2iC25; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/q2iC25"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574251F000FF;
	Sun, 13 Sep 2026 19:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789326960;
	bh=UMUN2EcDucwS2s0Yj9OtV9WWZm+jQDh9eXr0yjUmkEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/q2iC25TuCweJrSvtuw+WB51EayxOa4+Ka1kn3I+h9ZLFhfAU0JLdUEcTt9xF+Bs
	 6alQZeNxHcDTbLDE6vb5fbLik5dZc8JKmNbbWamKxrdb+FVcjOnka8mxM5xobLx1EI
	 KiGDA6/DACPbawEMofB0Qc+Lhf2440bFgeQ4hkpQxAFX/dDmpNe5SonSgllknOsasP
	 Vj7qPfOT2DUbt7OkuC6VuwneNyW2DIzjA29ZMUkZu4NXP1yiYIwLxmaEdMs/AsOAlM
	 EPjJi1nor5rLJI+aw6zIghFqPpO738yBAAjkkMW4rFN/xJkzewQnlpw0ZRxWgd0tvk
	 CQhNRGK1IrOUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/13] arm64: dts: qcom: monaco: Add Iris context
 bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-11-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
 <20260914-vpu_iommu_iova_handling-v4-11-9b9074a73c41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 19:15:59 +0000
Message-Id: <20260913191600.574251F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to configure DMA and the IOMMU for dynamically cr=
eated subdevices, causing fatal SMMU faults when the parent's `iommus` prop=
erty is removed.
--

commit 7baf55062247d31a2ed357168e7566838a0d7a92
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: monaco: Add Iris context bank subnodes

This commit represents a subset of Iris VPU streams as subnodes in the
device tree to associate them with their respective addressable ranges.
It removes the iommus property from the parent video-codec node and
places them into the new non-pixel and pixel subnodes instead.

Link: https://gitlab.freedesktop.org/drm/msm/-/work_items/100
Link: https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kern=
el.org

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 395d32d368443..89ea87a274a15 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -5403,12 +5403,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_O=
NLY>,
>  			resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>  			reset-names =3D "bus";
> =20
> -			iommus =3D <&apps_smmu 0x0880 0x0400>,
> -				 <&apps_smmu 0x0887 0x0400>;

[Severity: High]
This is a pre-existing issue, but does removing the iommus property from the
parent node here actively expose an SMMU translation fault?

The qcom_iris driver dynamically creates these subdevices manually via
platform_device_register_full() (for example, in iris_create_cb_dev() in
drivers/media/platform/qcom/iris/iris_probe.c). Since no driver binds to
these newly created subdevices, platform_dma_configure() bails out early
and skips calling iommu_device_use_default_domain().

Previously, this was masked because the driver could fall back to the parent
video-codec device configuration. By removing the iommus property from the
parent here, the non-pixel subdevice is left without IOMMU-backed DMA ops.

It receives physical addresses instead of IOVAs, causing the SMMU hardware
to block the unmapped transactions and triggering spontaneous reboots.

Should the driver be updated to properly configure DMA for its dynamically
created subdevices before making this device tree change?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-vpu_iommu_=
iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com?part=3D11

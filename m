Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670EF5650F4
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967291; cv=none; b=Bii232m3nOccYflqdUxIkFp7M3NWVXfYwjWxz3DBhU30VojP2zZSkbln4X16CUTEOFFK0/l8L/iDuwv4/BDG+KExyH36c5bjN1a1gLVau8JlGAbyBVtDcBEJ0DD+TlFGT48OCUwR/UHuLK5quWQePWjSe1nShUKvO43FjEj/3Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967291; c=relaxed/simple;
	bh=QV7qM6f0zTojw/y2bV4NMMYgIxSSUkAItQGZ+Ndq80A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lo6ATm/vZo3STQDsdGDMT0CtyOXRx6nIcgU180rxIKF71vrvxvNdWdbfe1K2KbWb6f/tGtrvA9JdsFgpKgkf2Tba8gxX+EwlD6j7anVz7tuO/UVpdRn9VKQ3bOGAmFUCm4Hb8SzB1bW80YQIJVn3eIHYLCVJqGGQ7s1LWduTnuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ccswoh3z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ccswoh3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0CA1F00A3E;
	Wed,  9 Sep 2026 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967290;
	bh=8RTijtYuKQDdgeOyRI+Sxz8Um+qEHSs2pCJWbsnlhEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ccswoh3zq3DptSHGcyd2rbzMvjVyKvN/huQbfA+/Xr2NT4tSONkM291iHzCaY465B
	 D+snJh5vPXi2QNf3Lie3zlMr0/WdL3oB6H4xll7ri6pviFVsYb5WiqOMEFCqRHCgKp
	 rq+ft3llPicwh1YF53dBJf5yyiOFRY+1puoCbn6P4O4MJQ1ao7pVOLcbeUpE85S2Pp
	 lgzUdvoCR/e1gqK7LwNoHTYMXHZHdPFqWZ0c7gOZJAOYIwzzrFduVtUKcv/7UJ16kb
	 BDlYCeUY6lFxwJ2tHCrAWpLNQxrRsgwxukcZxIFjdhP/otJu1Lk15haM5fMilOr9kR
	 ItSyJcQ++AkLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/13] arm64: dts: qcom: monaco: Add Iris context
 bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-11-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-11-2fe43ae45495@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 15:21:29 +0000
Message-Id: <20260909152129.CC0CA1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing of_dma_configure() on dynamically created context bank sub=
-devices, resulting in unmapped DMA and SMMU faults.
--

commit 6813696691410944233b1d75d049bcb783208f85
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
arm64: dts: qcom: monaco: Add Iris context bank subnodes

This commit adds subnodes for the non-pixel and pixel VPU streams to the
video-codec node. This allows assigning specific addressable ranges to each
stream to prevent DMA allocations from landing in the restricted low 600MB
of IOVA space.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index cfe39f923224f..e4ad5960c9785 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -5404,12 +5404,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_O=
NLY>,
[ ... ]
> +			non-pixel {
> +				iommus =3D <&apps_smmu 0x0880 0x0400>;
> +				iommu-ranges =3D <0x25800000 0xba800000>;
> +			};
> +
> +			pixel {
> +				iommus =3D <&apps_smmu 0x0887 0x0400>;
> +			};

[Severity: High]
Does the missing IOMMU configuration for these dynamically created subnodes
cause DMA allocations to fall back to unmapped physical memory?

While this patch adds the context bank subnodes to the device tree, an earl=
ier
patch in this series ("media: iris: Add non-pixel and pixel context bank
devices") leaves the instantiated platform devices without DMA or IOMMU
configuration.

Because no driver binds to these dummy sub-devices, the Linux driver core n=
ever
calls really_probe() on them, meaning the bus-level platform_dma_configure(=
) is
never invoked. Without an explicit call to of_dma_configure(), the IOMMU is
never attached to the sub-devices created in iris_create_cb_dev():

drivers/media/platform/qcom/iris/iris_probe.c:iris_create_cb_dev() {
	...
	pdev =3D platform_device_register_full(&plat_dev_info);
	of_node_put(child_of_node);
	if (IS_ERR(pdev))
		return ERR_CAST(pdev);

	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

	return &pdev->dev;
}

Without an explicit of_dma_configure(&pdev->dev, child_of_node, true) before
returning, doesn't this unconditionally trigger unhandled SMMU page faults =
and
spontaneous reboots during video operations when the VPU attempts to access
the unmapped memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-vpu_iommu_=
iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com?part=3D11

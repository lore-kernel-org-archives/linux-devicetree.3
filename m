Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7DD3B8105
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326349; cv=none; b=ptaDlioA1btbmPzMQRHOLZtsWH9jr9qFHoS+xocFx5MT+ZkrjDAo+aVumWetIG0VvYF90h15XknlCoqQq8uzL6dGxx6av35UkJWtgjcCdZhbV6ZWmNQIBCaw8KNJ8jAeE4RpRHySjTJVIOcFromg4KzcI5KAslRrGiNda++C03Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326349; c=relaxed/simple;
	bh=k2A+FX+iK3wYpfkQZEMC5Und8al4xVRSMUX0EeZZ2Vo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LsPvT2mu+ziyXwUSlEevZvhkJ/Fq2eq1jyPwK5C6vCWi+um+3evuon4+joG0nkL2hqQslmgNKTVfK8KF6Mnd/L8UKX+ik9184i7/FpKAyxhnSFYwsOLKDb598B29tVwJvH6etuy500nyLTwpSk2gF0cJRsgDnn/p1kIGMett/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUGlKNSk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUGlKNSk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DC61F000FF;
	Sun, 13 Sep 2026 19:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789326348;
	bh=VSDyBfnoo01tA82YL6X/0aPHKkWHp3LyFQ2FIdnYFq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CUGlKNSkBZ+uU1ZJU7lIj4U5cOg5gSJDVltaCEP/J/LuNTr+4gwzlrlUKqX+rfiOM
	 tvewQHML+Czg8k4OKJCaEyqYU2cwANuM/ESJbmAdQEI+hqbp2DnIpqlfP2ez1Id6Mf
	 LSVo0ALVCOdonqJPD3hNZBnymmUjWETbz5Ze/+wudA3DE8hPtMEemT+u5u19DDlaAk
	 6xxznTSGQuzFv5YAd75glHAiP4jyYmSaVKGf+Mw4hJiKegRrTMrxQC4svCu9xPJx8b
	 SHFQV5FUNjDYRUokr5BaYliu/qrO5ItVskx7DKevaf97BCer3uOdKxTbbticXGY5KK
	 yQMCRNB/Cy2qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/13] arm64: dts: qcom: sm8550: Add Iris context
 bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-9-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
 <20260914-vpu_iommu_iova_handling-v4-9-9b9074a73c41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 19:05:47 +0000
Message-Id: <20260913190547.E4DC61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Failure to skip address and size cells for non-matching nodes when=
 parsing `iommu-addresses`.
--

commit a702abacb77d093fbe2f72280c242fce5e476787
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm8550: Add Iris context bank subnodes

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range. This patch moves the address range restriction
to specific VPU streams represented as subnodes.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 23604436add30..60164b853ae07 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi

[ ... ]

> @@ -3701,6 +3699,19 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ON=
LY>,
>  			 */
>  			status =3D "disabled";
> =20
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			dma-ranges =3D <0x0 0x0 0x0 0xe0000000>;
> +
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
This isn't a bug introduced by this patch, but it is a pre-existing High
severity issue that requires fixing.

Will this device tree layout expose a parser desynchronization in the IOMMU
code when handling nodes?

If an iommu-addresses property contains entries for multiple devices, the
parser fails to skip address and size cells for non-matching nodes:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
			if (np =3D=3D dev->of_node) {
				int prot =3D IOMMU_READ | IOMMU_WRITE;
				...
				maps =3D of_translate_dma_region(np, maps, &iova, &length);
				...
			}
}

Because there is no else branch to advance the maps pointer past the
address and size cells for non-matching nodes, if the parser encounters a
phandle for a different device first, it evaluates np =3D=3D dev->of_node as
false.

In the next loop iteration, the parser then misinterprets the first address
cell of the skipped entry as the next phandle.

Could this desynchronization cause the parser to miss IOMMU reserved region=
s,
allowing the IOMMU allocator to allocate IOVA addresses that overlap with
reserved physical memory regions and resulting in SMMU faults or memory
corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-vpu_iommu_=
iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com?part=3D9

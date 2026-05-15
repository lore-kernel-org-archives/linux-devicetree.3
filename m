Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740CB30648A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 21:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879829; cv=none; b=jRvKtbrXf5rEuWMfYUHXmTFT72vAKs2iCJJT9NdiXX4dPFxl+erTdze5n2iHFKkaIjIiRKeXAro/FUZ23X2WbaGU231YPdJFgs29BZF5UfvSuO+NLMY+9Q08clDh+0ZCQ/Zmad48ItLoN7CyMk88YXIB5jrHxBnHum81w9yjt5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879829; c=relaxed/simple;
	bh=y+rElgqW2y1ZBqK57KvlGwC00oPxlztxlvwsXn8yRyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gssqVyhIYeaLzVKVDGM4k63IRzLQqTKOJ4svvOwCYq/D9eWYK2TE4N8iIzkumKx/s0yNO6jOF9wzBg/fQQ8bwoKuhcLrlIvEdM6cIAWARnLuA9BNEl5xuV6oOmksqs4gxaKiqzDYi95T1n5lRn1E93QfG7a4xY5PRz2jchdk2hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZbEHyFq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZbEHyFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6797EC2BCB0;
	Fri, 15 May 2026 21:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778879829;
	bh=y+rElgqW2y1ZBqK57KvlGwC00oPxlztxlvwsXn8yRyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IZbEHyFqf7MxW47bSiIzqQsSJ++B42Kocx6P+jf6awC0nmMMKTnfSKIfOTCYHmob9
	 1na7PqcG0efAORk3ByzLWYRHsmBqf5XBJXBH/P7SqFaVr0UlPfbWoaISEaSa1fjljM
	 rHe1woetCsPFF+qCGZ6Sgb+aBJTcC/kOGAJSBrNBSN5qqZ+l7tYnTIFq41jBoc4nRg
	 RO0KDgPXNn4euoxkQw7ia/YddSXvsSlVbxTs8Xb/4aJeOFPFI3O42FGGGnPdYyFKCY
	 BVEDn/aXtsI5zsMcbcmA/zvTmZ5tnBUIa6KmmI+1XD8rqxA8mQLjhsPLUyxujSDspw
	 Nwr7ZXndKY/ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: tegra: Add iommu and dma properties for
 Tegra194 QSPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-tegra194-qspi-iommu-v1-3-57dfb63cd3d6@gmail.com>
References: <20260515-tegra194-qspi-iommu-v1-3-57dfb63cd3d6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 21:17:07 +0000
Message-Id: <20260515211708.6797EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware misrepresentation: QSPI node falsely claims GPCDMA's SMMU=
 Stream ID to mask a driver bug
--

commit 5a99acb609c512098a594cb6c335a984b6c04380
Author: Aaron Kling <webgeek1234@gmail.com>

arm64: tegra: Add iommu and dma properties for Tegra194 QSPI

This commit adds DMA and IOMMU properties to the QSPI controller nodes for
Tegra194. The commit message indicates these are required to prevent flash
storage transfers from timing out.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 1d659454a6f9f..0e0a20befe9e6 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -923,6 +923,10 @@ spi@3270000 {
>  				 <&bpmp TEGRA194_CLK_QSPI0_PM>;
>  			clock-names =3D "qspi", "qspi_out";
>  			resets =3D <&bpmp TEGRA194_RESET_QSPI0>;
> +			iommus =3D <&smmu TEGRA194_SID_GPCDMA_0>;

Does assigning the GPCDMA's Stream ID to the QSPI node misrepresent the
hardware topology?

TEGRA194_SID_GPCDMA_0 physically belongs to the external GPCDMA controller,
which is the actual bus master performing the DMA transfers. Device trees
must strictly describe hardware.=20

It appears this configuration might be masking a driver bug in
drivers/spi/spi-tegra210-quad.c, where tegra_qspi_dma_map_xfer() maps buffe=
rs
against the QSPI device rather than the DMA engine's device pointer. Faking
the same Stream ID places both devices in the same SMMU group, which avoids
translation faults but breaks IOMMU isolation.

Should the driver be fixed to map memory using the DMA provider's device
pointer instead of adding the iommus and dma-coherent properties to the QSPI
nodes?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-tegra194-q=
spi-iommu-v1-0-57dfb63cd3d6@gmail.com?part=3D3

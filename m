Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454A73CF67D
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695604; cv=none; b=lKTx8bs6HsglkWXCN/prbFhJd13WbFp4KlmI455LoZ0jluU9YvsLHynv5nrJ3dqNxUcVi/NxQffD2I9VrbfoDcousdXicDjkc22B9mgqDgIsCRu3I2BvmDjaCS5MrZfZUhaosTktIQEk45mDfhSkUAQFOqC7SJwxKvjDqxfmmBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695604; c=relaxed/simple;
	bh=Ma5f/ApManxIAy3nbHyaGGGvd2w3iXBlcgmRaxL7kjc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fwxo9iksGNdLwOcdbB/es2PcAIFYisZs+9J8POlxLuSli/CGyh3YAmnYGaXvkIbvcbj7OOAaeeconPMQldJadORifLD58eOV+zwDihwOEqiC98acoF83cTsoFITNSJ/ksZAl7W6XngyuimfCVq0o+Z2bvTp/8AXkoR03rPbAi/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5EIaFvj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5EIaFvj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F21E1F000E9;
	Mon, 25 May 2026 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779695602;
	bh=ofyVIs8TfbA7LGeVtqMR4QRI4v4qMgR5S+yiG0aM7PI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m5EIaFvj7BU6H7h2t/pF/7KzvKPtyizqRFZ4Q3yj9Ej8+CA+Js/p0N2uG4fDnOl8C
	 7xA/4vJ20U1smimxCf2cdM/2mP5d9lqGY+97JkRHyJ4OADGUYK5pklMJxO004EgZg1
	 2CuFO+zGzLB1Ph9SsETBzwhlXoJ2+ZEu73aTWyd7eZFoESkz/bu4so7Vg5n00xEITd
	 1sD3QYK7zPiCwjIuHH6sttHWMCjsFDpvSpv3PTllGvmK2LdZPcxXknVEDzP8Q2Mzp2
	 yeqmuZHqLzb/7Wkpmi0Pa50hpsJJfLPHTUeydXcw+BMwSzP3mSE+YHxulhNbbiyqug
	 t0zueCxpAFVyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: tegra: Enable DMA Support on Tegra194
 QSPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525-tegra194-qspi-iommu-v2-2-a11c53f804b2@gmail.com>
References: <20260525-tegra194-qspi-iommu-v2-2-a11c53f804b2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 07:53:22 +0000
Message-Id: <20260525075322.4F21E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling dma_unmap_single on an unmapped DMA address during the DMA=
 mapping error path.
- [High] DMA buffer overflow causing memory corruption when reading unalign=
ed sizes in packed mode.
--

commit ab48224cb433a33d32049c6cfc39eea2bdf25194
Author: Aaron Kling <webgeek1234@gmail.com>

arm64: tegra: Enable DMA Support on Tegra194 QSPI

Without dma enabled pio mode is used and flash storage such as the one
on the p3668 module times out and cannot complete any transfers. In some
cases, these timeouts cause hangs and cbb faults.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 1d659454a6f9f..e2ddbc6715d5e 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -923,6 +923,8 @@ spi@3270000 {
>  				 <&bpmp TEGRA194_CLK_QSPI0_PM>;
>  			clock-names =3D "qspi", "qspi_out";
>  			resets =3D <&bpmp TEGRA194_RESET_QSPI0>;
> +			dmas =3D <&gpcdma 5>, <&gpcdma 5>;
> +			dma-names =3D "rx", "tx";

[Severity: High]
This isn't a bug introduced by this patch, but enabling DMA mode exposes a
pre-existing issue in the driver.

In tegra_qspi_dma_map_xfer(), t->tx_dma is mapped conditionally only if
t->tx_buf is non-NULL.

However, if mapping t->rx_buf subsequently fails, the error path
unconditionally calls dma_unmap_single(..., t->tx_dma, ...).

If t->tx_buf was NULL, t->tx_dma is zero or uninitialized.

Could this lead to unmapping an invalid DMA address, potentially corrupting
IOMMU page tables or triggering a panic?

[Severity: High]
This is a pre-existing issue, but directly switching the controller to
DMA mode makes a buffer overflow vulnerability triggerable.

In tegra_qspi_start_dma_based_transfer(), the driver calculates the mapped
and transferred DMA length by rounding up to the nearest multiple of 4:
len =3D DIV_ROUND_UP(..., 4) * 4.

For an unaligned SPI read (e.g., 5 bytes), len becomes 8. The driver maps 8
bytes and programs the DMA engine to write exactly 8 bytes into the client's
t->rx_buf via dmaengine_prep_slave_single().

Because the client's t->rx_buf is only guaranteed to be the requested 5 byt=
es
long, does this cause the DMA hardware to blindly overwrite adjacent memory
by 3 bytes?

Could this out-of-bounds write corrupt adjacent heap objects or KASAN
redzones?

>  			status =3D "disabled";
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-tegra194-q=
spi-iommu-v2-0-a11c53f804b2@gmail.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BE94279F8
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148371; cv=none; b=mXMx5gnlusV2aOTcnzWxiBw6QRDdc7KWJcP7RwAPbzwuaYjRQMeRMLoj4N7Cae4HcdRF1ZFWHPzxTKgTjv8uczsfBRSO1asRUIKngvWypUZ4cpiRtSs5Xcu3Lf87WSwH9uK5JgYEtGwX16W4rLI7bAV98NAwCljr6FYNssNmru4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148371; c=relaxed/simple;
	bh=7sO2IAKA4xNJ5xxF8ScnAqbwek7IBFspAMd/OVu1k04=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LO6vMpohHjrrG0t3Fwpjb7ImWb497vXlpK2rvNs3jwW2A+X1JogfRXOp6rSdVTVRXfHacToszCykotvjKm315NLt6av8BLmUgaEy3B6J+YnTEnrNGJSvzOGPrNsmubZ/WY6STF94p86WPkgriKlqZRHW+G1i0MtJfrtNHf0C18g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ek6M+LE/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ek6M+LE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9731F000FF;
	Wed, 23 Sep 2026 07:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790148367;
	bh=+9burehW5AQolPuwkkCuJ/YRjFDvFxqWfm0nE7tYyNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ek6M+LE/BKlP2L13J15xwUH9Kpp8eszaFIKvdthhD9jdq7HQhLvDmcGi4O7FWtTUQ
	 OFbe3+6RaMD5sCkZABGz4xtJ2utNPYqvfc41cWQEYRqC5eEqkcbIKudjlaAcEpMg9Q
	 gCSl8gSM9acfZkUwLeDINhhW/+7GHJHyyJ2gtUsVoPReWZROo5Tde6RNaWIMhMVgr9
	 bWOMYRfGXVLWJkTDJt3+Mxd+V4NP8O4Hlbn+zyudwYaJnJPSvX6BMbvhPiUENxlN7H
	 hIjTThOQPXdfZrEM2AAy9Di4YzSEsMuPuwInfOKm2DEt3P1lcuDtLy2ybfBDhtoCIO
	 dJ342TjAELzRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] irqchip: Add Xilinx Versal NET SMMU CSR
 interrupt controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tushar Nimkar" <tushar.nimkar@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-smmu-changes-v2-v3-2-87bd09ba9605@amd.com>
References: <20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com>
 <20260923-smmu-changes-v2-v3-2-87bd09ba9605@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:26:06 +0000
Message-Id: <20260923072607.0E9731F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] irqchip: spurious interrupts due to handle_level_irq with latched =
status
--

commit 2d37d393fff3fd3914b9e3ef7cecbd4d6f1c364c
Author: Anirudha Sarangi <anirudha.sarangi@amd.com>

irqchip: Add Xilinx Versal NET SMMU CSR interrupt controller driver

The Xilinx Versal NET SoC implements a Control and Status Register (CSR) bl=
ock
in front of the ARM SMMUv3 to manage EVENTQ, PRIQ and GLOBAL interrupts. Th=
is
commit adds an irqchip driver for the CSR block that registers as an interr=
upt
controller and chains to the upstream SMMUv3 driver.

> diff --git a/drivers/irqchip/irq-xilinx-smmu-csr.c b/drivers/irqchip/irq-=
xilinx-smmu-csr.c
> new file mode 100644
> index 0000000000000..b29aafd01dbeb
> --- /dev/null
> +++ b/drivers/irqchip/irq-xilinx-smmu-csr.c

[ ... ]

> +static struct irq_chip xilinx_smmu_csr_chip =3D {
> +	.name		=3D "xlnx-smmu-csr",
> +	.irq_mask	=3D xilinx_smmu_csr_irq_mask,
> +	.irq_unmask	=3D xilinx_smmu_csr_irq_unmask,
> +	.irq_ack	=3D xilinx_smmu_csr_irq_ack,
> +};

[ ... ]

> +static int xilinx_smmu_csr_domain_map(struct irq_domain *d, unsigned int=
 virq,
> +				      irq_hw_number_t hwirq)
> +{
> +	struct xilinx_smmu_csr *csr =3D d->host_data;
> +
> +	if (!xilinx_smmu_csr_hwirq_mask(hwirq))
> +		return -EINVAL;
> +
> +	irq_set_chip_and_handler(virq, &xilinx_smmu_csr_chip, handle_level_irq);

[Severity: High]
Will using handle_level_irq() cause spurious interrupts due to the latched
status in the SMMU_CSR_ISR register?

Since handle_level_irq() acknowledges the interrupt by calling the .irq_ack
callback (which clears the W1C SMMU_CSR_ISR register) before invoking the
SMMUv3 device handler, the CSR block clears its status while the underlying
SMMU line is still asserted.

Because the source isn't deasserted yet, the CSR block will immediately
re-latch the status. When handle_level_irq() unmasks the interrupt after the
SMMUv3 handler finishes, this re-latched status will trigger a second
interrupt. The SMMUv3 driver will find no actual events and return IRQ_NONE,
eventually causing the kernel's spurious interrupt detector to disable the =
GIC
line.

Should this driver use handle_fasteoi_irq() and implement the .irq_eoi
callback instead, so the CSR status is only cleared after the underlying
SMMUv3 driver has successfully deasserted the source?

> +	irq_set_chip_data(virq, csr);
> +	irq_set_status_flags(virq, IRQ_LEVEL);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-smmu-chang=
es-v2-v3-0-87bd09ba9605@amd.com?part=3D2

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794037893;
	b=MJFCvwIvv8AwS0W9qDpggdLuFEz4Hrhy6cp2yqLJpOtZQkDcy30/G8Xg9dRGEKHICvW0
	 WAd1aWI3WXZpw0/gqcRQBMEPIH0SYlqJJLh2o+4zD55XcrOlv+sgFRrCUjnKdrchadMPY
	 relJa1pRaHDIaGOvRZnQExbeVurgQRJmeLUDmfKrkpqQ/nLEtL1tfCS3X1UoWvq7fcqbs
	 MfYJ5sEgjv7dLyMnNmdy+7B30KNGS0X/k1zCLdim61msCrwkend5Y0Mf8bllDM5P4KkFa
	 46Jm0ivCx2lUIsYZyWAvarYDzhv9znk9eK8EbMxCAmFi6XS8KONDG0/UC+lsFAFWsJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794037893;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b5IYMV4d9Z7NpUsIUkaCBLU2eKmBpnsCZB7gKWQtRT0=;
	b=SBmtz6ZJ5d9I1gaeq1j1s+PxHKgUcoM2lkKuPUtAiDsmBZRjRMEl7RBeiRHeyvkOFUEI
	 evAAffz0rw0NGjQmcf6CASFgULcgjCHRPn+N5ZtlkY6g5kj4H4Lit1Lg0B9/nvhDqVrRP
	 XBggXCam7DGMp7yJWnkiLt+DZJOdpn1nAOxVO8yEVHHyGJ8sB0St74z3kSKSwgNs6rB4K
	 PL3CgF4ggwaRh3Wj99QJziaPvd2BGnzKHiYevV2wLOiTBVg8hy8/4mnYLCRifcODxuC1Y
	 1GpPCmCCtEdNnunFcobumACAbEEGeNgjDRf7reZmX0UFaW4ijDopdGTVz07KgsYlC+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MMsnKvAH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5508B606A326
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MMsnKvAH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A5B1F0089F;
	Sat,  7 Nov 2026 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794037892;
	bh=b5IYMV4d9Z7NpUsIUkaCBLU2eKmBpnsCZB7gKWQtRT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MMsnKvAHByjlPOLbJNfn2EVsAtptw8w0qjFlmHqQgo9evbDYZEr8s1qskwu8NefTB
	 WAxmnNXN6i/3gtGDQgCc+MnN8GQZmLGc4KRFwSPXKBV5EiRX+F7kooEwSkSh/D4Zip
	 80Kh72shffs2m4jfuYBLS5T24rCBiwRy43tSYn34IIjguED/wf2nU12UctLc63JIkA
	 R6i4dDbwDnW9HO53ZI9RR8rt+3l4Y9B5x0ikUdcyGfwTodJWtf/m1yadsV1llRvCO0
	 lurmKcB7j91UgDfNQbXLT89KChzqGVW08NTf2sKRp9ZLRqHvq7Fv+oS4zud/UR8onK
	 6piM4C4uFMRpw==
Message-ID: <sashiko-outbox-202729@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] spi: cadence-xspi: Support dmaengine for sdma io
 copy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107072044.17574-3-jszhang@kernel.org>
References: <20261107072044.17574-1-jszhang@kernel.org>
 <20261107072044.17574-3-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:51:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] spi: cadence-xspi: unreleased DMA channel on fallback in
  cdns_xspi_dma_init()
--

commit a84278759465bccce36b68c10064eeefdfafaa8b
Author: Jisheng Zhang <jszhang@kernel.org>

spi: cadence-xspi: Support dmaengine for sdma io copy

This commit adds dmaengine memcpy support for SDMA I/O transfers in the
Cadence xSPI controller driver, falling back to CPU transfers when DMA is
unavailable.

> diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xsp=
i.c
> index 3687853e4ce4e..d9996ec42edda 100644
> --- a/drivers/spi/spi-cadence-xspi.c
> +++ b/drivers/spi/spi-cadence-xspi.c

[ ... ]

> @@ -355,6 +363,122 @@ struct cdns_xspi_dev {
>  	int current_xfer_qword;
>  };
> =20
> +static void cdns_xspi_dma_cleanup(void *data)
> +{
> +	struct cdns_xspi_dev *cdns_xspi =3D data;
> +
> +	dma_unmap_resource(dmaengine_get_dma_device(cdns_xspi->dma_chan),
> +			   cdns_xspi->dma_addr, cdns_xspi->sdmasize,
> +			   DMA_BIDIRECTIONAL, 0);
> +}
> +
> +static int cdns_xspi_dma_init(struct cdns_xspi_dev *cdns_xspi,
> +			      phys_addr_t sdma_phys)
> +{
> +	struct device *dev =3D cdns_xspi->dev;
> +	struct dma_chan *chan;
> +	struct device *dma_dev;
> +	dma_addr_t dma_addr;
> +
> +	/* The Marvell overlay has additional SDMA access-width restrictions. */
> +	if (cdns_xspi->driver_data->mrvl_hw_overlay)
> +		return 0;
> +
> +	chan =3D devm_dma_request_chan(dev, "memcpy");
> +	if (IS_ERR(chan)) {
> +		if (PTR_ERR(chan) =3D=3D -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		dev_dbg(dev, "DMA unavailable, using CPU transfers\n");
> +		return 0;
> +	}
> +	if (!dma_has_cap(DMA_MEMCPY, chan->device->cap_mask)) {
> +		dev_dbg(dev, "DMA channel does not support memcpy, using CPU transfers=
\n");
> +		return 0;
> +	}
> +
> +	/* Map the aperture once; only the RAM buffer changes between transfers=
. */
> +	dma_dev =3D dmaengine_get_dma_device(chan);
> +	dma_addr =3D dma_map_resource(dma_dev, sdma_phys, cdns_xspi->sdmasize,
> +				    DMA_BIDIRECTIONAL, 0);
> +	if (dma_mapping_error(dma_dev, dma_addr)) {
> +		dev_dbg(dev, "Failed to map SDMA aperture, using CPU transfers\n");
> +		return 0;
> +	}

[Severity: Medium]
Does cdns_xspi_dma_init() leave chan allocated if the DMA_MEMCPY check or
dma_map_resource() fails?  Since cdns_xspi_dma_init() returns 0 to fall
back to CPU transfers, cdns_xspi_probe() succeeds and devres keeps the
unused DMA channel exclusively claimed for the lifetime of the bound
device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107072044.1757=
4-1-jszhang@kernel.org?part=3D2

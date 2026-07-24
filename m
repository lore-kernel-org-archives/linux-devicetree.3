Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A8043846D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902649; cv=none; b=PCAp01zm71qIxMT/RMduWKmwq+YVZDVrzR+tAmDLrCmzOnvfEInhobP6QzpoTfPzUijV6sayyGh+gGhrrcWpyv0wv03JVqB40El937CbeZwahUsq9HtDEWskzKRbsNeY3PobflqxQIJQBHPLorAOTkZVJhz6rojFCSmNTQyNaWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902649; c=relaxed/simple;
	bh=uN29I31m7dGKyPbht8eDVuqI/u5h32guWGlWZiClqTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uylms+B8pHq3QCRQTeMI5i5EGjm+H60j+FM2ulkOFFOSMQZqV/Zz8y9najkyRwUxzg5TkVzT21fZxe17P1iM1+25uiZOUNXpHy8Ikg/Y+QYksE5QBRV3MI9rqPUbcEgRYOV10bWew5llHPBHDhnrcImDejUHT5NwwKKvkP+B2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9R8uibe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9R8uibe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4CA1F00A3A;
	Fri, 24 Jul 2026 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784902647;
	bh=7WZ0WWinafsmED00mGJh2RzhqgN9M6wojgzYauTQhtE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W9R8uibev58DrrncuswtJKA3QgJZaUrUR2E5iaoWdF1SjAVFO+Qa02Rf4RdWvQFTJ
	 UuAjY0JKYqXswlQ8repK9CfTCXF2LgUDxrLffBeDWN32o/fc8apNdMphZE0bLnDy6C
	 2GKyH8TWW50eyYVDnRNh86OqqALzEu3ZUZfVxUOSkLGOtQq3aC6+yopcKMe2jehp8i
	 Ca4IkItnBcAaNXILWUyihUPqGw0UfHHOQEkGyda4NrCqEzbwelrKp+IHtz3dAPbMy/
	 NBzEE3TBSBLrnIcFt54sSmYjF1ePTl2sP148lNof85SuxtoYTURZrJIgsmTz7K/k8r
	 57LW3uYXnrJ+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/7] net: xilinx: axienet: Introduce
 axienet_config for MAC-specific ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723123838.125145-3-suraj.gupta2@amd.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260723123838.125145-3-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 14:17:26 +0000
Message-Id: <20260724141727.3F4CA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] In `axienet_start_xmit_dmaengine()`, if DMA mapping or scatter=
list preparation fails, the software TX ring becomes permanently desynchron=
ized from the hardware completions, leading to a double-free of SKBs and me=
mory corruption.
--

--- Patch [2]: [PATCH net-next 2/7] net: xilinx: axienet: Introduce axienet=
_config for MAC-specific ops ---
commit 1bd6db20edd05b230c296fde4c925b468a67473b
Author: Suraj Gupta <suraj.gupta2@amd.com>
Subject: net: xilinx: axienet: Introduce axienet_config for MAC-specific ops

Introduce an axienet_config structure to abstract MAC-type-specific
operations. This prepares the driver for supporting additional MAC types
beyond the existing 1G Ethernet.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index fcf517069d161..b3deba1d96f7e 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
[ ... ]
> @@ -939,19 +976,21 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, s=
truct net_device *ndev)
>  		goto xmit_error_drop_skb;

[Severity: Critical]
This is a pre-existing issue, but doesn't this error path cause permanent
desynchronization of the TX ring and a double-free?

In axienet_start_xmit_dmaengine(), just before this context:

	lp->tx_ring_head++;
	sg_init_table(skbuf_dma->sgl, sg_len);
	ret =3D skb_to_sgvec(skb, skbuf_dma->sgl, 0, skb->len);
	if (ret < 0)
		goto xmit_error_drop_skb;

	ret =3D dma_map_sg(lp->dev, skbuf_dma->sgl, sg_len, DMA_TO_DEVICE);
	if (!ret)
		goto xmit_error_drop_skb;

If skb_to_sgvec() or dma_map_sg() fails, the function jumps to the error pa=
th,
drops the SKB, and returns. However, lp->tx_ring_head remains incremented w=
hile
no descriptor is actually submitted to the DMA engine.

When a subsequent packet is successfully submitted and completes, the DMA e=
ngine
invokes axienet_dma_tx_cb(), which unconditionally fetches the descriptor at
lp->tx_ring_tail++:

	skbuf_dma =3D axienet_get_tx_desc(lp, lp->tx_ring_tail++);
	...
	dma_unmap_sg(lp->dev, skbuf_dma->sgl, skbuf_dma->sg_len, DMA_TO_DEVICE);
	dev_consume_skb_any(skbuf_dma->skb);

This will fetch the skipped descriptor slot instead of the one that complet=
ed.
Since the skipped slot's skb pointer was never updated, it will still point=
 to
the previously freed SKB, leading to a double-free and memory corruption.

Could we fix this by decrementing tx_ring_head on the error path before
returning?

>  	/* Fill up app fields for checksum */
> -	if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL) {
> -		if (lp->features & XAE_FEATURE_FULL_TX_CSUM) {
> -			/* Tx Full Checksum Offload Enabled */
> -			app_metadata[0] |=3D 2;
> +	if (lp->axienet_config->dma_tx_csum) {
> +		if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL) {
> +			if (lp->features & XAE_FEATURE_FULL_TX_CSUM) {
> +				/* Tx Full Checksum Offload Enabled */
> +				app_metadata[0] |=3D 2;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723123838.1251=
45-1-suraj.gupta2@amd.com?part=3D2

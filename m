Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D00C424D41
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275349; cv=none; b=fcKD55l5UO6kJJvt0rsD8eU1EBqBnKVe8fNM/9g+ZmkpkpWBKCfj1YZ2eSJo9Bh8qDKXoT+G/L/RrjWWsD7DMGkTiTeoNuLj+ECuqIYLSOyeHvAEMdQ313va0v5luMiLustBzSTNclkxoqQAVGLAupRDLrCLVElYtFKuEj4uc2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275349; c=relaxed/simple;
	bh=4ATx+E0pBar9NpgiVMb9kUTVK3qaMaxhYcSCfehiX6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SibeVPHaKeiaO/aXXhSIBwjN/TupdSaFm1fLsPc3URrCuTpdOnsvniF8+mrB5PUnvM93bMe9gS481Y3QYztqFHRZko0UloRcEGEeITgmYe3jOP+guJLqqsQ2j6BtO/43X+yFKwMM56Z1NqZPmSDGPznpFwEraVBy+uFV1LkjxsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKTq5Y3/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKTq5Y3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150101F00A3A;
	Tue,  1 Sep 2026 15:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788275348;
	bh=hGUYie3+Fu+T+E11srcuh0jechQQFB8b+bf6mcCD/L4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKTq5Y3/F+VpBeP8Nnq4xDwexHonyeRzMjZQP7/KRQTAFvknh45CPbp+4bWMNSBMT
	 zwjc5dj/wBZPbYJkczgQzl4Is/1s1DopDIq37cSP9jeIEtmaH7M+s+ScVvN+VLd+Rp
	 1c7XyatVpQEBocimK4yUkBv8eKYrF44Sd10hvba5vdpsiYe4q2iOWGd2h9YKCyel++
	 PQ+T+EdSzApFa+yMJCrFA3TmNRU6nZXn98WvWFxWzX9/HB5cud5YCuch7J7xCvXQhZ
	 DKHZIQpNewsXmIQG5b7Fl4GnOdtPWCwsowYnCMXOHFXDmyExyWavd7VXLM2uGqmc8y
	 pU0ujhMHGmXaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/6] net: xilinx: axienet: Introduce
 axienet_config for MAC-specific ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831150816.1020883-2-suraj.gupta2@amd.com>
References: <20260831150816.1020883-1-suraj.gupta2@amd.com>
 <20260831150816.1020883-2-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:09:07 +0000
Message-Id: <20260901150908.150101F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Incomplete abstraction for TX checksum offload leads to broken che=
cksums if misconfigured.

Pre-existing issues:
- [Critical] TX ring desynchronization in axienet_start_xmit_dmaengine() er=
ror paths leads to use-after-free and double-free in DMA callbacks.
--

commit 166384442bde8d7169bb6c9fd071e535fa3f9c73
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Introduce axienet_config for MAC-specific ops

Introduce an axienet_config structure to abstract MAC-type-specific
operations, preparing the driver for supporting additional MAC types
beyond the existing 1G Ethernet.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 1722b7038f340..a4963da53b306 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
[ ... ]
> @@ -939,19 +976,21 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, s=
truct net_device *ndev)
>  		goto xmit_error_drop_skb;
> =20
>  	/* Fill up app fields for checksum */
> -	if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL) {
> -		if (lp->features & XAE_FEATURE_FULL_TX_CSUM) {
> -			/* Tx Full Checksum Offload Enabled */
> -			app_metadata[0] |=3D 2;
> -		} else if (lp->features & XAE_FEATURE_PARTIAL_TX_CSUM) {
> -			csum_start_off =3D skb_transport_offset(skb);
> -			csum_index_off =3D csum_start_off + skb->csum_offset;
> -			/* Tx Partial Checksum Offload Enabled */
> -			app_metadata[0] |=3D 1;
> -			app_metadata[1] =3D (csum_start_off << 16) | csum_index_off;
> +	if (lp->axienet_config->dma_tx_csum) {
> +		if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL) {

[Severity: Critical]
This is a pre-existing issue, but does this error path permanently
desynchronize the software ring from the hardware ring?

Looking at axienet_start_xmit_dmaengine(), if a failure occurs during
mapping or preparation, the code jumps to xmit_error_drop_skb. However,
lp->tx_ring_head was already incremented earlier and is not rolled back.
This leaves the abandoned ring slot containing the skb pointer and sg_len
from the previous time the slot was used.

When the next successful packet finishes transmission, axienet_dma_tx_cb()
will pop the oldest entry using lp->tx_ring_tail++ and retrieve this
abandoned slot. Can this lead to unmapping the wrong scatterlist and
double-freeing the old skb?

[ ... ]
> @@ -2861,9 +2993,6 @@ static int axienet_probe(struct platform_device *pd=
ev)
>  	/* Setup checksum offload, but default to off if not specified */
>  	lp->features =3D 0;
> =20
> -	if (axienet_ior(lp, XAE_ABILITY_OFFSET) & XAE_ABILITY_STATS)
> -		lp->features |=3D XAE_FEATURE_STATS;
> -
>  	ret =3D of_property_read_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
>  	if (!ret) {
>  		switch (value) {
>  		case 1:
>  			lp->features |=3D XAE_FEATURE_PARTIAL_TX_CSUM;
>  			/* Can checksum any contiguous range */
>  			ndev->features |=3D NETIF_F_HW_CSUM;

[Severity: High]
Does axienet_probe() advertise hardware checksum capabilities without
verifying the new MAC capability flag?

While axienet_start_xmit_dmaengine() now correctly gates the DMA metadata
setup behind lp->axienet_config->dma_tx_csum, axienet_probe() still parses
the xlnx,txcsum device tree property and unconditionally sets
NETIF_F_HW_CSUM.

If the device tree specifies this property for a MAC that does not support
TX checksums, will the network stack pass partial checksums that the
hardware never completes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831150816.1020=
883-1-suraj.gupta2@amd.com?part=3D1

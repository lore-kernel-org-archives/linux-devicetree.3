Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E7C3D76
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186013; cv=none; b=jw3R6hkI3Lv0ChAkiMC6vGXQocQlzktF5j3TnH71IXD/QOuL4SUIOQ261lP7R3zy/l0C+LxxeErTZ3hH0QdFphT+1XivxartmQjN3wWQJt69jieeotUi29jJYw6GyYs2KTg2DIqxFLPor2KuSjMOzYER7ANXNNxSfZWP1iKip8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186013; c=relaxed/simple;
	bh=OuTBzxwKnCCZ8bsY8bEPDGnkvehj8fIRpzF5rtWx9pU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SWEjhlyBShTv4V0K7lzIugd9Y0kWoXphbQkZ3tQa4jWDiRGObfYwpMXhwO+cp5oBB1XJJiI2QM9lpdqNCfrPyyLv3Wx/LKkg4RKpRyi6y1RMmceENcGnVi6leZO/uav6NJ/JC0zB0HpRYyTmj9tEViX0JFM4i4e1rJnqRCpgsus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5E/bjWI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5E/bjWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6D21F000E9;
	Sat,  8 Aug 2026 10:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186012;
	bh=iCFZ3Ki1OCRaO+qH4N2FfN9xphqjpMM/stdLkPMrn84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O5E/bjWIxN3GuwZ9SiKY//xyRZ7CWScAI3nSXorUCWjJ27EYsKuLzRfslBDVaFva4
	 2YnoiXUuhJdecqdGtDPL93iuXc5umet3Zjwl9BD8W2aqt5gnJ/iyPvZj8r1mHiExNl
	 DmVinlKpZV5nX5e7ID3nLi/Qk3QL47mXVIJYfSfIVRqPptMqTghFGar5ZowS4JXZkt
	 9Ru+e56t0G9QaJ56U85k97x0TELB1s0S1Kp7X1QFR6PJAWI0JKAkkBeJ6tj7nDar8M
	 6mQZpkaC3OboxulYBN+mzbmfNs+kI44M0Mi0hp6n9Gg4cL8PKwlT6qI0PzyCUHG01p
	 QY0oqKlClddZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/20] net: xilinx: tsn: add the endpoint RX data path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807104431.157230-7-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-7-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:51 +0000
Message-Id: <20260808104652.3A6D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The RX path permanently stalls if memory allocation or DMA mapping=
 fails, as there is no mechanism to recover an empty RX ring.
--

--- Patch [6]: [PATCH 06/20] net: xilinx: tsn: add the endpoint RX data pat=
h ---
commit 913acc776e2acc162774e82ae72c55335c3d4e98
Author: Srinivas Neeli <srinivas.neeli@amd.com>

net: xilinx: tsn: add the endpoint RX data path

This commit adds the endpoint RX data path for the Xilinx TSN driver. It
implements RX buffer allocation, submission to the DMA engine, and handling
of received frames via a completion callback.

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/ne=
t/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> index fa21d59ade165..207ca3242a123 100644
> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c

[ ... ]

> @@ -42,6 +43,17 @@
> +static void ep_rx_submit_desc(struct xlnx_tsn_ep_dma_chan *xchan)
> +{
> +	struct dma_async_tx_descriptor *dma_rx_desc;
> +	struct skbuf_dma_descriptor *skbuf_dma;
> +	struct xlnx_tsn_ep *ep =3D xchan->ep;
> +	struct sk_buff *skb;
> +	dma_addr_t addr;
> +
> +	skbuf_dma =3D ep_get_desc(xchan, xchan->ring_head & (RX_BD_NUM_DEFAULT =
- 1));
> +	if (!skbuf_dma)
> +		return;
> +
> +	skb =3D dev_alloc_skb(ep->max_frm_size);
> +	if (!skb)
> +		return;

[Severity: High]
Does this silently drop the descriptor if memory allocation fails?

Since xchan->ring_head isn't advanced and the descriptor isn't re-armed,
transient memory pressure will permanently reduce the number of in-flight
descriptors. A similar silent drop occurs if dma_map_single() fails just
below this block.

[ ... ]

> +static void ep_dma_rx_cb(void *data, const struct dmaengine_result *resu=
lt)
> +{

[ ... ]

> +submit_new:
> +	if (READ_ONCE(ep->closing))
> +		return;
> +
> +	avail =3D CIRC_SPACE(xchan->ring_head, xchan->ring_tail,
> +			   RX_BD_NUM_DEFAULT);
> +	for (i =3D 0; i < avail; i++)
> +		ep_rx_submit_desc(xchan);
> +	dma_async_issue_pending(xchan->chan);
> +}

[Severity: High]
If the ring completely drains due to allocation failures in
ep_rx_submit_desc(), will it ever recover?

Because refill is strictly driven by the hardware RX completion interrupt
here in ep_dma_rx_cb(), an empty ring will never generate another interrupt,
leading to a permanent stall of the RX path. Is there a fallback mechanism
like NAPI polling, a timer, or a workqueue to recover the ring when memory
becomes available again?

[ ... ]

> @@ -329,6 +492,12 @@ static int ep_init_dmaengine(struct xlnx_tsn_ep *ep)
>  		rx_allocated++;
>  	}
> =20
> +	for (i =3D 0; i < ep->num_rx_queues; i++) {
> +		for (j =3D 0; j < RX_BD_NUM_DEFAULT - 1; j++)
> +			ep_rx_submit_desc(ep->rx_chans[i]);
> +		dma_async_issue_pending(ep->rx_chans[i]->chan);
> +	}
> +
>  	return 0;
> =20
>  err_free_chans:

[Severity: High]
Does this allow the interface to open in a wedged state?

If ep_rx_submit_desc() fails during initialization due to memory allocation=
=20
or DMA mapping errors, the failures are silently ignored, leaving the RX=20
ring partially or fully empty on startup.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D6

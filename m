Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E373FBB72
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827137; cv=none; b=gi2YefSELzz/8oZgWHsZA+GQDryPJJv1eGr+jMJh3V9A3nt3QAdAGf6ji3vjfd3tC3Pw6kons0d+iwNZkt53lRdJ3Y68NcxtC6ft8ACsj1NccEStDuQQpu7WZ9f3eMNC7gEseBKsQNv4+A0TtcD8Lthj8gmbryMkulCddBtta48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827137; c=relaxed/simple;
	bh=G0FCaX9pxxi6yLxiY+SHgkftYXdz48v0B+4kmzuUU7k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tCjJ7rwtYKnRgB70Iu7pw2SHO+zrPuehxrO7xkvKdrL7ljdrsTKQlyHP2ZuLTOqwYJtfAP+Z9PeEvD33u1TnKbl4x+NksG5Yro2/PCL6L+yw6zAMdpV+HX3rXZwE4PI675lGIJ33wU94J1QXzN3q+dwk8fF8CXtmrpeWMKO0KDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkOU2/wP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkOU2/wP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194A51F00A3E;
	Tue,  4 Aug 2026 07:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785827135;
	bh=aCl1MY1EFDFaGzePDpFsDeIv34iEDZb/kfbREfBZWas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XkOU2/wPTN7KFN0Yb28mH4gYeF8sEdqlijJ9TfLXbtRpVTTZsOKQaHx02s+COSHqc
	 HRiFI9Xk7sV0dQCNzv+Q6xxGw2/d0SPwq+kx1qe70sLSFl0o1by4a+fDTnHE4E4HFp
	 wgAGv9g6N5BG2Uww/PKxodTQSSZvuFpB5ad4nxfxxv2LZK2GgqOTBkoK3xcrofExtT
	 zAbHMvCxz7cHcS9hR4ixfCPa5KO7zFe1XqhfpD4Ya1FSAuHQxg393q4KyV/CYYh941
	 8puIY5EvHaNF96/R2SDNvOPEbJtVNINL4Zhs7ypNLTa4689MNwsL2z4b4IMVRua/VU
	 ixEEXoG+0bAFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/3] net: stmmac: Use pagepool instead of
 streaming buffers for Tx
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803070513.4657-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260803070513.4657-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:05:34 +0000
Message-Id: <20260804070535.194A51F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] `page_pool_recycle_direct()` is called outside of NAPI context, le=
ading to potential lockless ring corruption.
- [Medium] Unnecessary `PP_FLAG_DMA_SYNC_DEV` flag causes redundant full-pa=
ge DMA syncs, defeating performance goals.

Pre-existing issues:
- [High] Unconditional NULL pointer dereference in `dma_free_tx_skbufs` if =
`tx_skbuff_dma` allocation fails.
- [High] DMA mapping and `page_pool` memory leak when `skb_frag_dma_map()` =
fails during transmission.
- [High] Double free and Use-After-Free of TX queue resources due to dangli=
ng pointers on teardown.
--

--- Patch [2]: [PATCH net-next 2/3] net: stmmac: Use pagepool instead of st=
reaming buffers for Tx ---
commit a91ef91a303112e59c32621c9138a02b37e37769
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Subject: net: stmmac: Use pagepool instead of streaming buffers for Tx

Use page pool buffers instead of streaming skb buffers in stmmac_xmit
when snps,pagepool-tx-buf-quirk is enabled. As page pool buffers are
recycled, the overhead of dma map/unmap for each transmit can be avoided.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index ee44bd6f4d48e..4aa6b1d1507bf 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1712,7 +1712,10 @@ static void stmmac_free_tx_buffer(struct stmmac_pr=
iv *priv,
> =20
>  	if (tx_q->tx_skbuff_dma[i].buf &&
>  	    tx_q->tx_skbuff_dma[i].buf_type !=3D STMMAC_TXBUF_T_XDP_TX) {

[Severity: High]
This is a pre-existing issue, but is it possible for this code to trigger a
NULL pointer dereference?

If the memory allocation for tx_q->tx_skbuff_dma fails in
__alloc_dma_tx_desc_resources() (in stmmac_main.c), it returns -ENOMEM. The
error path then calls free_dma_tx_desc_resources(), which loops over the
queues and calls __free_dma_tx_desc_resources(). This ultimately calls
dma_free_tx_skbufs(), which unconditionally indexes into
tx_q->tx_skbuff_dma[i] via stmmac_free_tx_buffer().

Since tx_q->tx_skbuff_dma is NULL, would this result in a panic during
device setup or XDP re-initialization on memory pressure?

> -		if (tx_q->tx_skbuff_dma[i].map_as_page)
> +		if (tx_q->tx_skbuff_dma[i].buf_type =3D=3D STMMAC_TXBUF_T_DMA)
> +			page_pool_recycle_direct(tx_q->page_pool,
> +						 tx_q->tx_skbuff_dma[i].page);

[Severity: High]
Is it safe to call page_pool_recycle_direct() here outside of NAPI context?

The page_pool_recycle_direct() API requires execution in NAPI softirq conte=
xt
on the same CPU, as it bypasses locking (allow_direct=3Dtrue). However,
stmmac_free_tx_buffer() is called by dma_free_tx_skbufs() during device
teardown (process context) and by stmmac_tx_err(), which is triggered from
stmmac_napi_check() directly inside the hardirq handler when a TX error
occurs.

Could calling this lockless API from hardirq or process contexts race with
NAPI polling and lead to internal page pool ring corruption?

> +		else if (tx_q->tx_skbuff_dma[i].map_as_page)
>  			dma_unmap_page(priv->device,
>  				       tx_q->tx_skbuff_dma[i].buf,
>  				       tx_q->tx_skbuff_dma[i].len,
[ ... ]
> @@ -2201,6 +2205,8 @@ static void __free_dma_tx_desc_resources(struct stm=
mac_priv *priv,
> =20
>  	kfree(tx_q->tx_skbuff_dma);
>  	kfree(tx_q->tx_skbuff);
> +	if (tx_q->page_pool)
> +		page_pool_destroy(tx_q->page_pool);

[Severity: High]
This is a pre-existing issue, but does this code leave dangling pointers th=
at
could cause a double free or use-after-free on teardown?

Memory arrays (tx_q->tx_skbuff, tx_q->tx_skbuff_dma) and the newly added
tx_q->page_pool are freed or destroyed, but their pointers are not nullifie=
d.
If a subsequent resource allocation fails (e.g. during stmmac_xdp_open()),
the error path calls free_dma_tx_desc_resources(), which loops over all
queues.

For queues that were not successfully re-initialized, it re-executes kfree()
and page_pool_destroy() on the stale, dangling pointers.

>  }
> =20
>  static void free_dma_tx_desc_resources(struct stmmac_priv *priv,
[ ... ]
> @@ -2335,12 +2341,32 @@ static int __alloc_dma_tx_desc_resources(struct s=
tmmac_priv *priv,
>  					 u32 queue)
>  {
>  	struct stmmac_tx_queue *tx_q =3D &dma_conf->tx_queue[queue];
> +	struct page_pool_params pp_params =3D { 0 };
> +	unsigned int num_pages;
>  	size_t size;
>  	void *addr;
> +	int ret;
> =20
>  	tx_q->queue_index =3D queue;
>  	tx_q->priv_data =3D priv;
> =20
> +	pp_params.flags =3D PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;

[Severity: Medium]
Does using PP_FLAG_DMA_SYNC_DEV cause redundant full-page DMA syncs?

This flag instructs the page pool to automatically synchronize the entire
allocated size (up to 16KB) for the device. However, as seen later in
stmmac_xmit(), the driver manually calls dma_sync_single_for_cpu() and
dma_sync_single_for_device() on just the packet payload length (nopaged_len=
).

Would this result in double-syncing where the page pool redundantly syncs t=
he
full page on every allocation, reducing the intended performance benefit?

> +	pp_params.pool_size =3D dma_conf->dma_tx_size;
> +	num_pages =3D DIV_ROUND_UP(dma_conf->dma_buf_sz, PAGE_SIZE);
[ ... ]
> @@ -4742,12 +4773,14 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *sk=
b, struct net_device *dev)
>  	bool enh_desc, has_vlan, set_ic, is_jumbo =3D false;
>  	struct stmmac_priv *priv =3D netdev_priv(dev);
>  	unsigned int nopaged_len =3D skb_headlen(skb);
> +	gfp_t gfp =3D GFP_ATOMIC | __GFP_NOWARN;
>  	u32 queue =3D skb_get_queue_mapping(skb);
>  	int nfrags =3D skb_shinfo(skb)->nr_frags;
>  	unsigned int first_entry, tx_packets;
>  	struct stmmac_txq_stats *txq_stats;
>  	struct dma_desc *desc, *first_desc;
>  	struct stmmac_tx_queue *tx_q;
> +	struct page *tx_buf_page;
>  	int i, csum_insertion =3D 0;
>  	int entry, first_tx;
>  	dma_addr_t dma_addr;
> @@ -4814,13 +4847,33 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *sk=
b, struct net_device *dev)
>  	} else {
>  		bool last_segment =3D (nfrags =3D=3D 0);
> =20
> -		dma_addr =3D dma_map_single(priv->device, skb->data,
> -					  nopaged_len, DMA_TO_DEVICE);
> -		if (dma_mapping_error(priv->device, dma_addr))
> -			goto dma_map_err;
> +		if (!(last_segment && priv->plat->tx_buf_quirk)) {
> +			dma_addr =3D dma_map_single(priv->device, skb->data,
> +						  nopaged_len, DMA_TO_DEVICE);
> +			if (dma_mapping_error(priv->device, dma_addr))
> +				goto dma_map_err;
> =20
> -		stmmac_set_tx_skb_dma_entry(tx_q, first_entry, dma_addr,
> -					    nopaged_len, false);
> +			stmmac_set_tx_skb_dma_entry(tx_q, first_entry, dma_addr,
> +						    nopaged_len, false);
> +		} else {
> +			tx_buf_page =3D page_pool_alloc_pages(tx_q->page_pool, gfp);
> +			if (!tx_buf_page)
> +				goto dma_map_err;
> +
> +			dma_addr =3D page_pool_get_dma_addr(tx_buf_page);
> +			stmmac_set_tx_dma_entry(tx_q, first_entry,
> +						STMMAC_TXBUF_T_DMA, dma_addr,
> +						nopaged_len, false);
> +			tx_q->tx_skbuff_dma[first_entry].page =3D tx_buf_page;
> +
> +			dma_sync_single_for_cpu(priv->device, dma_addr,
> +						nopaged_len, DMA_BIDIRECTIONAL);
> +			skb_copy_from_linear_data(skb, page_address(tx_buf_page),
> +						  nopaged_len);
> +			dma_sync_single_for_device(priv->device, dma_addr,
> +						   nopaged_len,
> +						   DMA_BIDIRECTIONAL);
> +		}
> =20
>  		stmmac_set_desc_addr(priv, first_desc, dma_addr);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but does the error path in
stmmac_xmit() leak DMA mappings and memory when skb_frag_dma_map() fails?

If mapping an SKB fragment fails lower down in stmmac_xmit() via
skb_frag_dma_map(), the code jumps to the dma_map_err label, frees the SKB,
and returns. However, it fails to unmap previously mapped fragments or the
linear segment, and does not advance the tx_q->cur_tx ring index.

Because the index is not advanced, stmmac_tx_clean() will never process the=
se
leaked entries, and the next packet transmitted will silently overwrite
tx_q->tx_skbuff_dma[first_entry]. For the newly added page pool buffer, this
permanently leaks the underlying physical page allocated from
page_pool_alloc_pages(), which could deplete system memory over time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803070513.4657=
-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D2

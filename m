Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336060;
	b=UX/OdHg+2UU4OuZRz8G2hTfGZN+o8DBjZbrww075blBW+unkQv9/zYpCkcYgHQkNIOGp
	 oh6N9dv2L7R1D/Blc4s/CXbTCXeG7A+n7ejceWSOOvI8uYW7oLButBo1gQT509FdZ+L0v
	 mP+5ij2RUKGVHNXXbH8RqDc1OUaqNkPyviTBbT3225fEgzOI/xKM/gBoD9sq3VW97Lhba
	 eXgnCJ7pTIFHcs5DgzV0PDnygZLrOfIJnQ9bEqwRa8j9j4s07LnXTd0RQCux7fdDGN4CN
	 kVQoPsjEJXsDyO7pHlplpNTi4ANCj3XdkT+Q38A68rKf22kgWhhaNwnVIv6wt8z0JaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336060;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jyKryrWn+xQmHsXdCmWWGaXe7onHeG0/BdUG5LQZgXM=;
	b=CgpXfqgIRxghMq8kDaWI+sQS8bOcZb0NAe//qADyRYTTM1VQOEbJDblCM+fUI8jyaJEB
	 OLMUatgWZpZnqIrha4eJNzKbHcdi9+aq9gPmBnLDFp/djKerx05qKewWE+LizkLyUo29L
	 4v4gB1K0zAARsU31oYSr75DWnh2VjV7be6KlqXGkbIj2HHhuJOlDsRyKtDHp4RZaFdrSN
	 L14f15ZbVmSiZol+tox4fauxBNuOL5ExVOUfa+AKSMFKukk1mCvoFB9OQIlhaua1xwBJi
	 gQgNjIbM9n+GUqCf2lRXnorcBV1g+wA8tqOcga6zh4xusIC1sFaj++ei1De2T+/Td8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DzLnwcTH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A7D606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DzLnwcTH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F0E1F0093A;
	Fri, 30 Oct 2026 04:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336060;
	bh=jyKryrWn+xQmHsXdCmWWGaXe7onHeG0/BdUG5LQZgXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DzLnwcTH4jUeyi7jpp/vk0sXPbaSvAWoitwyLMcmxUaF9Z40Pofw0nNvcVq045kNr
	 7kf4R+gjaRXGaLdN5Xzw32/jvWQmUqtq7qsFdwBCXQ7XJjswFIwa3NogVvjYB4J2sT
	 cuc7s8lTsvf86iZaAI5OqllzIJjiI3s6lDeOOv25qQ+ZbuFqr0Drg32MbIrgcTMKcv
	 KvagEPaAUtKFF1I8KCr9vj5pOZctlczAziY6AUShlRHXzCpLEirA5RPpUPdTqfSJl3
	 xvy2KAzLIZ4EgUB2PRgdsMyXebVBna544PxU8BzmSNbb3YrW/W0cSbadoKw8DTG1U6
	 I9c4Istlub+/w==
Message-ID: <sashiko-outbox-190433@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 02/12] net: airoha: Reserve RX headroom to
 avoid skb reallocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-airoha-eth-multi-serdes-v6-2-c899462c4f75@kernel.org>
References: <20260511-airoha-eth-multi-serdes-v6-2-c899462c4f75@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] DMA synchronization size mismatch in `airoha_qdma_rx_process()`.
--

commit bc83d88c9a8c6fa433da204ea6d6867b3be7fa46
Author: Lorenzo Bianconi <lorenzo@kernel.org>
net: airoha: Reserve RX headroom to avoid skb reallocation

This commit reserves headroom for received packets to avoid reallocation
when pushing protocol headers. It adjusts the buffer offset and decreases
the DMA length accordingly.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index f71fb18197ecd..3fe2561c85f17 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -543,9 +543,10 @@ static int airoha_qdma_fill_rx_queue(struct airoha_q=
ueue *q)
>  		q->queued++;
>  		nframes++;
> =20
> +		offset +=3D AIROHA_RX_HEADROOM;
>  		e->buf =3D page_address(page) + offset;
>  		e->dma_addr =3D page_pool_get_dma_addr(page) + offset;
> -		e->dma_len =3D SKB_WITH_OVERHEAD(q->buf_size);
> +		e->dma_len =3D SKB_WITH_OVERHEAD(AIROHA_RX_LEN(q->buf_size));

[ ... ]

> @@ -616,8 +617,9 @@ static int airoha_qdma_rx_process(struct airoha_queue=
 *q, int budget)
> =20
>  		page =3D virt_to_head_page(e->buf);
>  		len =3D FIELD_GET(QDMA_DESC_LEN_MASK, desc_ctrl);
> -		data_len =3D q->skb ? q->buf_size
> -				  : SKB_WITH_OVERHEAD(q->buf_size);
> +		data_len =3D q->skb
> +			   ? AIROHA_RX_LEN(q->buf_size)
> +			   : SKB_WITH_OVERHEAD(AIROHA_RX_LEN(q->buf_size));

Does the length passed to dma_sync_single_for_cpu() also need to be updated
to match the new DMA length?

Looking at the code just above this context in airoha_qdma_rx_process():

		dma_sync_single_for_cpu(eth->dev, e->dma_addr,
					SKB_WITH_OVERHEAD(q->buf_size), dir);

Since e->dma_addr is now shifted forward by AIROHA_RX_HEADROOM bytes during
allocation, syncing the original unreduced length causes the synchronization
region to extend past the intended DMA data buffer by AIROHA_RX_HEADROOM
bytes.

Could syncing this extra memory lead to unintended cache invalidation
boundaries if fragment sizes change?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-airoha-eth=
-multi-serdes-v6-0-c899462c4f75@kernel.org?part=3D2

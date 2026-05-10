Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB0382373
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778421903; cv=none; b=Kv76tqKkSki//3D9sL2+z27SKG5VjhB/MD4pkEzlGMYb7MuFI2QOU325uzOzui26EMaXuaeYxHvCrtW7n74z8JfWE0dDzVTSAc1nf1Z/EoomaD7qN+YRdGZIWIRK2hGoIycm1YVtBv6pZfZK33GlSfrjnIgbmZcMz/Fzo0sP5lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778421903; c=relaxed/simple;
	bh=GtWKs1KCV3wtWROYH/iJOkN3c51gaY7h3o+yVBnZh4g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=puMXjdgV5YV52VuijczEa/w2WPtk//SWBoZ1QFPnI3FS9iV3b/1Dc3BQvv1n8h7D39nMrRa2o9c71wAf+HzUJJyL8jIstoa4bydrW+j7JPAu5ZVUDyvmjfV23/sAmzTN/1HSSAtmxb0yyi9zHTU7xyuPXY/4nMRPvottjQb+9U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MryFUhi6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MryFUhi6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B244EC4AF0B;
	Sun, 10 May 2026 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778421903;
	bh=GtWKs1KCV3wtWROYH/iJOkN3c51gaY7h3o+yVBnZh4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=MryFUhi6//eWENZO0R+JsmCOdqptl89NelIOCnKL8nrPrlL7/8aKBeiDYHINPjPl7
	 YQkFUCQvjVlMKlWKGmIsfLgDnmRT6TQfvdf5kihYZaXTqnETTmVZNth+NO6pNY8CCW
	 NdH4HlLkkWLe7iqzEOtbKoXJzcCEELmldeUkEMZy9laNzJbY15TwF5x6xa2dJDNX6u
	 BKJ8ogSxxnNpY0R5YNxirR6hrg53q9tqtd1U1p1zt5TKqOBN8rZWHhrQ5LqQPdhupV
	 u9AZwsgZa8cgQ4GaGaWN/7kyf8iw8zdbrqZ2S/xe1kYSkM+kHK9e2/B1b0nXImmiNw
	 x/SnRNPo1h7CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 02/12] net: airoha: Reserve RX headroom to
 avoid skb reallocation
Reply-To: sashiko@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260509-airoha-eth-multi-serdes-v5-2-805e38edc2aa@kernel.org>
References: <20260509-airoha-eth-multi-serdes-v5-2-805e38edc2aa@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 14:05:02 +0000
Message-Id: <20260510140502.B244EC4AF0B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing bounds check adjustment for RX packet length allows buffer=
 overflows
--

commit f34e8812cb62dd63f96801a39b0d65ee905cd258
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Reserve RX headroom to avoid skb reallocation

This commit reserves NET_SKB_PAD + NET_IP_ALIGN bytes of headroom for
received packets to avoid skb head reallocation when pushing protocol
headers into the skb.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -627,10 +629,12 @@ static int airoha_qdma_rx_process(struct airoha_que=
ue *q, int budget)
> =20
>  		port =3D eth->ports[p];
>  		if (!q->skb) { /* first buffer */
> -			q->skb =3D napi_build_skb(e->buf, q->buf_size);
> +			q->skb =3D napi_build_skb(e->buf - AIROHA_RX_HEADROOM,
> +						q->buf_size);
>  			if (!q->skb)
>  				goto free_frag;
> =20
> +			skb_reserve(q->skb, AIROHA_RX_HEADROOM);
>  			__skb_put(q->skb, len);

Does this code overlook adjusting the bounds check for the RX packet
length?

Earlier in airoha_qdma_rx_process(), the software validation check
uses the unadjusted lengths:

        data_len =3D q->skb ? q->buf_size
                          : SKB_WITH_OVERHEAD(q->buf_size);
        if (!len || data_len < len)
                goto free_frag;

If the hardware descriptor returns a len that is larger than the newly
adjusted dma_len but smaller than or equal to the old data_len, the
check will pass.

Since skb_reserve() shifts the skb->tail forward by AIROHA_RX_HEADROOM,
will calling __skb_put(q->skb, len) with this unvalidated oversized len
push skb->tail past skb->end and overflow the skb_shared_info structure?

Similarly for scattered fragments, could an oversized len passed to
skb_add_rx_frag() cause out-of-bounds memory accesses beyond the allocated
page fragment?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-airoha-eth=
-multi-serdes-v5-0-805e38edc2aa@kernel.org?part=3D2

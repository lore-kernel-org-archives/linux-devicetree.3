Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D81E437861
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783200; cv=pass; b=Wm9fpVS7EnTtryoSUV0aCbaxtwpSCWsEAATp1M5QeUCC0Pq2UKd0kd0ZBgE+whUYCpfDzffBx0OAie7GOJbvt2aMpCIqoHjZJJmTlc56KsCUOiVuwGtuBflKqj1/IjdPhZW0HnIEfXwV5PUHuA2mmYhn55pDcJafp8vJqqIRsF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783200; c=relaxed/simple;
	bh=d1GdJzffowGAnX7SgkQLsLTnYKo3xtqP/dyMoi66AaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OInqkuLJrbMmGW7UUg8d7UINrgICisCNFMbbCUrBwEmYmKYSoNSGQ9pfPrRnEmRpMIZqL0KINRqpXFxkUe+R7YhhcUycNvN04Skjr0rd4EiH2hjga7xy847tIJ4oZZEISuWXAlwsKMYCug6nn2nA9u+RQDY2l3ZneRp1h3pSwZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cAreKfbx; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cAreKfbx"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ccdf36f63dso29335ad.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785783198; cv=none;
        d=google.com; s=arc-20260327;
        b=j5KvqiHHA8BwxQmToZH0+Z3L9DR52KfK15CO45HIPnUCsvLhAs1QWyXiM6ZpWNeVL2
         iLuHq6INCXjsa4r9/GKn/lGIhSXORtKnFvks5B2vx2sG4x7XcEIu6N0QmXorvg03Dwf9
         SFJ9hv+2eNVOJeXA16Bzg2c2dNXOIR9jLg6GX46yZUeWmHfQflL0wiIUSqpXx+DA7alO
         uUYrM6l0O0Xym3pI2xgWkKzEF54ZDXdMx5JR5R3cwl49gBdo6tOQZ5Qk9717Gs+egTjl
         4k7Z9OEiAAYT9qzWH7sq/ZtR/b4+McUtndF19kPHx/AT21nthtCpZJFzTJb0ZeKJ7WwK
         hHQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEGYHAhaI5Y4Bh50/L1Jde5LSR6VhkVNUjGLHvvRFMg=;
        fh=TnvGtam4fhYo5sYNQifdKSyBTeXx7VGXh6hBlCxCOmU=;
        b=F+uGpIWEZr1mnxCIscfu/56HaQEom2rAIwP6USMbWJrlwyRjPXYbeeu/pt3lSqXQGw
         09fg96UHJA4/vC675/lUretALFscz7jP2FfQ02+4pNFvD8WEN/tWJTnPXhha+VTUPoiP
         O0o8dt49qfZNvVYcgeKAAa/3r3z8/Lxr8lkbWknfBkkYu1TC4QMZRZlqTPiwZyAs5Edu
         EV0qRrsW2AayzFS89tlQNzf22q8NqFSG8b5cbJk5Hd/MxEmz7SgIHTUpuHJy1zWYGsok
         d8A4qYFdEJ8NO/UJsGrdac1wF9ULvA6NNes7TY7spOTSf1ceNCdgFHMoHbfjgW5YEoxN
         bFdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785783198; x=1786387998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEGYHAhaI5Y4Bh50/L1Jde5LSR6VhkVNUjGLHvvRFMg=;
        b=cAreKfbx24pEd9QkWLjY2iIsA0X8yGOoCWK6phpeKAJOIBUUvuC9GzezY06m5ClYwj
         7QuSB17MySUupo2bLoeYmVweNa/uNQNEqw+PNnK43YyXgLKrKG1K/l3g6TLAu/Gkt05F
         /C3cmIDHHFEMa1gvP3I26SI0AoLwIlgW5ODyGYI3UzBzB/CYs2a3u1hicmny74gzwDst
         POm2yDv72h/69n82VUFVNMDpCW/cRhCvddXTRuEPIyQkcc76jUgKycyPxOpcrxTDvMk8
         Cqq0+5XGOEojPOpe18EqqlCEwJ/3ZON8EIzPKYsQCPrdoUkKG6NjCZFBFeAuPhOOoKig
         QVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785783198; x=1786387998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEGYHAhaI5Y4Bh50/L1Jde5LSR6VhkVNUjGLHvvRFMg=;
        b=DqgzSbTCBnDXKar5XCiFRqRDniQ9palnH0T9bZzDh0ylOBAoSTEowqhteHefU2CQ2k
         Sc9vovrbuu4uHlUSDS7ivaVxxwZ4Ndmyedzc5pyI+k+O8cQX+95smjW3T8RSw/5iJeGe
         h6ntKYLfs8ogNvq5+DLhfAwozlQO8sFRKuFVZSlvcMzufs7OZQRz8LMNld1uSUt5ljZX
         bCimyh8R+mhxmdr7qX0Fwg6ZgZEDVezvtJn/tsDz8nQdtm1KNW5RRBghUWZ6ITSIAte8
         Tdh8+b7f98miUhJCEk8rHvkDNB8fIi24XXxDCCFls+T6wt4bw5ILXGnfoDng/VXb6DK/
         F0Rg==
X-Forwarded-Encrypted: i=1; AHgh+RrXbb7YJa8TTOuln3zBW/6pbQf/04bxUjgeG7zdRoZoSpyJHC6IfFDj2ngx0d3gGHKaYYeB6CVqZFd3@vger.kernel.org
X-Gm-Message-State: AOJu0YxamB8lSeDemaPWMZiSrCokJP6XtTt3QO5HpjKlhklH0ySqRynd
	zkxwNX8heBwbu3uZBEocCj3iJsdVLR4M4XLiFtgNHZBvj053jNLhh+vO4kwqD+DTYDMaUPvcXKV
	movcc+tJ6TbfuRvujbZs0Xf7q92WVmVSPmVDM4Vd3
X-Gm-Gg: AR+sD134tpM+7GZcjG0/edrD287AXqxeC0EENJ7s326T8ERBRioBAEdWDMapM04nQIv
	J2rp8z77eo8mmCyphr+WDipJTFpxxZqq3L9L9824kN8qn7Li+WxYq40fT2lHgR4zOPKsZBZlTqq
	w1w46e/mU80c4SAXAPJfTFOcaiSehWrRAbkVsVgNUlxK8C1KNLu5TgNQ775h1XdvcdcTuYBmxya
	bMUReKjd8z9tW8cLpPMKzubfQFwNZRZfiUvz9HdmcUDkXUhGuzuPmI5kz1KDL7bP72bX/fIgZs6
	aNDnILJ9To6AWsBBYi5Fdr7sgxq96gFPwm25C9C0CGzZQrpstf2C80k=
X-Received: by 2002:a17:902:d60f:b0:2ca:be81:b469 with SMTP id
 d9443c01a7336-2d08c64e00bmr2176265ad.0.1785783197790; Mon, 03 Aug 2026
 11:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260803070513.4657-3-muhammad.nazim.amirul.nazle.asmade@altera.com> <CAHS8izN1mCBH5=ERy9OKaeC4Wz2-v2N2oGDW34P=ZoS7oo2aOw@mail.gmail.com>
In-Reply-To: <CAHS8izN1mCBH5=ERy9OKaeC4Wz2-v2N2oGDW34P=ZoS7oo2aOw@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 3 Aug 2026 11:53:05 -0700
X-Gm-Features: AUfX_mxKt7Hw3ljuyeXscU2rYJEdlvkjRCcwEfsOQmBdLq4h2KD5KKl3NZxDn60
Message-ID: <CAHS8izO_wq4GRmbej=A0zQymB+mBrruD8zGtS5Afa2OGuSN9Qw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: stmmac: Use pagepool instead of
 streaming buffers for Tx
To: muhammad.nazim.amirul.nazle.asmade@altera.com, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, dinguyen@kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, 
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 11:39=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> On Mon, Aug 3, 2026 at 12:08=E2=80=AFAM
> <muhammad.nazim.amirul.nazle.asmade@altera.com> wrote:
> >
> > From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> >
> > Use page pool buffers instead of streaming skb buffers in stmmac_xmit
> > when snps,pagepool-tx-buf-quirk is enabled. As page pool buffers are
> > recycled, the overhead of dma map/unmap for each transmit can be
> > avoided. There is a trade-off of copying from the skb into the page
> > pool buffer, but this helps where the copy is cheaper than dma
> > map/unmap (for example with IOMMU invalidate cost).
> >
> > Currently page pool buffers are only used for single-fragment transmit
> > in the non-TSO path.
> >
> > Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.=
com>
>
> Whoa!
>
> I haven't looked at the patch deeply to be honest, but using the
> page-pool for tx is a bit interesting. There is no other code that
> uses it like that I think. I can't think of any blockers off the top
> of my head, but I think there are places where we keep a global list
> of created page_pools on the system/netdev and the code parses those
> lists may be assuming it's a normal page-pool, which is a pp used for
> rx and attached to the an rx queue.
>
> Just Ccing the maintainers of pp to know about this use case. I can't
> think of issues again, but I wonder if a more-expert has thoughts.
>

Ah, yes, gemini reminded me of the most critical bit. The page_pool
actually doesn't do concurrency checks on allocation because it
assumes allocations only-ever come from the napi, and can't race with
allocations coming from another napi. Does your patch account for that
somehow? Or can allocations in tx come from multiple cpus in parallel?

Full feedback:

```
  ### 1. Concurrency & Memory Corruption (The Lockless Fast-Path)

  page_pool allocations (page_pool_alloc_pages()) are lockless in the
fast path (pool->alloc cache). They inherently assume exactly one
allocator context (which natively maps to a single
  RX NAPI softirq).
  If this driver allows multiple CPUs to concurrently enter the TX
routine and allocate from the same page_pool, the lockless cache will
immediately corrupt. To use it in TX, they must
  guarantee:

  =E2=80=A2 They allocate 1 dedicated page_pool per TX ring.
  =E2=80=A2 The TX ring is strictly protected by a spinlock (e.g.
__netif_tx_lock) during all allocations, or they are utilizing strict
CPU-bound XPS.

  ### 2. Slow-Path Contention (ptr_ring Thrashing)

  Even if the locking is safe, performance will likely tank due to
NAPI mismatches.
  page_pool keeps its speed because pages freed by the NAPI context
are dropped directly back into the lockless alloc array. If a page is
freed by a remote CPU or an unbound context, it
  falls back to a spinlock-protected ptr_ring.
  In a TX flow, if CPU A injects the packet (ndo_start_xmit) but CPU B
handles the hardware TX-completion IRQ, CPU B will constantly push
pages into the locked ptr_ring, and CPU A will
  constantly pull from it. You lose all the lockless benefits of
page_pool and just burn cycles on cross-CPU spinlocks.

  ### 3. Memory Waste (Page Splitting)

  TX injections are usually small (e.g., bouncing a fragmented
header). page_pool allocates strictly in PAGE_SIZE chunks unless you
heavily orchestrate page_pool_alloc_frag(). Standard
  SLUB kmalloc() or skb_alloc() is almost always cheaper, more memory
efficient, and more cache-friendly for TX bounce-buffers than spinning
up dedicated page pools.

  TL;DR: Unless the TX allocations and the TX completions are strictly
pinned to the identical NAPI context/CPU, and they are allocating
massive buffers, throwing page_pool at the TX
  path usually results in lock contention and memory inefficiency.
They are almost certainly better off using standard kernel allocators,
or at minimum mapping DMA_TO_DEVICE correctly
  over standard per-CPU locked pools.
```

--=20
Thanks,
Mina

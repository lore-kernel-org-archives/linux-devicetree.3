Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CA3426D03
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782389; cv=pass; b=Im5qgUKQTpq4Dz1iR6x9Eiwpw8ZXunfMPXbQZL0HgAetxdzQCJuEzk8qFbK1Ir5nUv3StlI3vt60xaZtbCOxtHrMQxykz3ISTc58B+Crh/OUPOJuPVBDblaxJBFoaWGgk92TD6WTpODLgoXLPQdeQchvXoFD8VnKYJy84amljcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782389; c=relaxed/simple;
	bh=ysEVWKF2WWNcsBakZlX2KYejEWt8550NvykEr9wiGg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSh3jC9+yLttwhJPZ60Lx1mwT45JOgwWxrp8YXbDWh/IBNYa+43sSCRzA9k/N+Hp0iVmM9ZFLzwzH/OK8X5bhp6qTb9cwRsYuvEuu4FOoKsUT9CH0d9fTFUE4OhLpkDg82kb6zW2tHXrRbSolQ8BF6hO++bex2Fm/8aodFZt6js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hhTEYTAI; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hhTEYTAI"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cede6375caso20425ad.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785782387; cv=none;
        d=google.com; s=arc-20260327;
        b=ORXJDN/jL6CyaMNWi8B8bF8tSOeEvoacXzbd0mx658Rz7t/sF4jWq7eCphf+zu3FGZ
         yCC9CwaMQfrEzlU/gOHZ7nIV5HOIFlAwz91CohHB5bB72c7oLtEIhLv4+dWade7kPDtw
         6mmcQM4n82TWT8s5o8ej4M55jC7vWLvvX2kLTdS5aD/1E1A8h0kk2fks/40bf41CasNA
         eqtnEbnUAmgc1YaII7NMy7FRkKegqhu81OIqE4P2KihRFMaMr9DVkcW/aRNg3hdk/3gK
         a86uxSp0xsOzGXLqVNFD+HGUOpkemkqUNrHWCesRfH7r0hWk0F8Cj6RPIechDNX5K9iN
         0Sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysEVWKF2WWNcsBakZlX2KYejEWt8550NvykEr9wiGg0=;
        fh=XQXZxoYWHl8SQ6VmkbNDENS4k9SclyOa2Khav5bZhq0=;
        b=KcHoeb157tTJSYXHmEda1JYBMIljM/xxnkCcK1Fng2nHTeSSXIfNjTNBIcBLa4PR77
         Rhu59WCrLuyQb9iV6vRCRdld5n6AWrgy/eZREGAiSh4wln2rn25gg1TCMHUOTT3+EbTW
         GjOd7mnRBntZ/sIXKK++Nyv40rRPOLBcRrMvi9Errep0AylYrKGeIhcLEH32vSDJulYc
         SmlD0hekqZcBQBCYgyX1zCmGI9s9r4yVK5EB4orCoJvId4+WBvawJACaVWSjNByiQugm
         LqX/gMj3R/kxpdpIK/cKPI0Qpo2e71ZZQbx09+CXYJleFWhb2ewQStQmFbq988JIbYHN
         L/QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785782387; x=1786387187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ysEVWKF2WWNcsBakZlX2KYejEWt8550NvykEr9wiGg0=;
        b=hhTEYTAIsp82823RsktqvjAXf+CdTejZpB5eMTtHRKTXdoxI0wjmKvnJ8jcRxnY/Bb
         bs2ywk/ESUu5eWzL4rPeQso1YlWQmgY9SJ3RdmNp3i3eBFHkpEsR6Ln30GASQCX7HA9H
         0iGbXmS0pyqezHMqsErnWE0+2P/fnLlJDQrjuAOJ/SeL18UfjSsq4Zacmg4vE8wEtGVO
         sSssdbP7TpKs14fTecjxGeCzTGKwNSd3tyQVi7YHDtUAtg/+WJrOv1u4X6wMWUryhHGr
         tjgxgTwMb1iW2h1QM/dl7FBY8zmeGOyJixTlQIMcXqupYhxFI/nSGGHU4Gnyx2XokpmI
         t1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782387; x=1786387187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysEVWKF2WWNcsBakZlX2KYejEWt8550NvykEr9wiGg0=;
        b=JAmhepVK8Ec7651fHybqWCLsVcLbQhnmt9BAQKhzhYb7RURQlQhZDvBHmbHZ7mcaPE
         klSKEpes6pLe1k8BD18Ums0YNqHJ1qISEDSqqqtCOBKStgi4tiUy+ix8z/5E34KHJo3i
         U+zZkMVv3uPgZJLSfYcU6WiKYJNA1jPHOTOElzHsY+LskMr25NXDYAfPcmTmZJmtCuVA
         bMn/kKr8T60gqcctDIsSkYkLZQSG62L74V3L3JB6eM36d0sF/nDUAsMT74O1C5Vu09tW
         n+wIzAIVYWaqhYDIU32qQK/E8OPcjKTnm0Z+DomoeZy6Qb4GLOi52r5hP2JTD/OwF9Dz
         B7ig==
X-Forwarded-Encrypted: i=1; AHgh+RqNTZcMPlXZ7HYYN4ef/Jvt0kxXXj+kOeNZzTLzbzbKX9cYENjxBck4oaiyEz5+Egh/GEIhje6AirgI@vger.kernel.org
X-Gm-Message-State: AOJu0YxBQpmgrrNhYpNMPOVbImq7txbAHdhy/OCo2w/MmIKUphG7riuC
	R5gBZUBKqzuIALE7P2p9vxw6I929jZ+1D76pUxokDX69E6iXubpja+cMfBe8yIA629zsdhQgplJ
	k5F4+0disphqaE5fln4+IWRjktdGI2Yw3bLjFhTtCvLjp5Oi4rHmr5ySH
X-Gm-Gg: AR+sD113ypGk1eKgLZp3uqcyafOd2h33kHBZvsZ4+14qRcizYyYrRPdBmOY9rAsrmho
	CQ/i7yOLapA1UndAXdW/JZH3l9TGfJf9FrSFuPPy5YuSrHmNT1xsUHd09vNaa6ESNhglf3Xsyx3
	DrPe54NPT9PiRwg1yDOi/aLIVD82ZJ1Y+6tt3C/qcFS0JXxEI3/OFLTUEtOaegE0pfr7M1WrhSs
	Br7HxbCp54Ptn96HSm4g/426Fl+gJB8pQStqmthpOiGT4/uRjA0yWn2K0b1sDOY2tmL683cd1+S
	/1FL2lpVbu3cX42yv2mdSNTAnFpAwgAo+/WRMdvO4zJf
X-Received: by 2002:a17:903:8cd:b0:2c0:defb:557e with SMTP id
 d9443c01a7336-2d08cda9b92mr1251285ad.1.1785782386773; Mon, 03 Aug 2026
 11:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260803070513.4657-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
In-Reply-To: <20260803070513.4657-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 3 Aug 2026 11:39:27 -0700
X-Gm-Features: AUfX_my-IXUAAmiOm1dPrWOoSLO_UNWLKoIxVmuwUTZRIKlicpuwAkpUNxi7N9c
Message-ID: <CAHS8izN1mCBH5=ERy9OKaeC4Wz2-v2N2oGDW34P=ZoS7oo2aOw@mail.gmail.com>
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

On Mon, Aug 3, 2026 at 12:08=E2=80=AFAM
<muhammad.nazim.amirul.nazle.asmade@altera.com> wrote:
>
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>
> Use page pool buffers instead of streaming skb buffers in stmmac_xmit
> when snps,pagepool-tx-buf-quirk is enabled. As page pool buffers are
> recycled, the overhead of dma map/unmap for each transmit can be
> avoided. There is a trade-off of copying from the skb into the page
> pool buffer, but this helps where the copy is cheaper than dma
> map/unmap (for example with IOMMU invalidate cost).
>
> Currently page pool buffers are only used for single-fragment transmit
> in the non-TSO path.
>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.co=
m>

Whoa!

I haven't looked at the patch deeply to be honest, but using the
page-pool for tx is a bit interesting. There is no other code that
uses it like that I think. I can't think of any blockers off the top
of my head, but I think there are places where we keep a global list
of created page_pools on the system/netdev and the code parses those
lists may be assuming it's a normal page-pool, which is a pp used for
rx and attached to the an rx queue.

Just Ccing the maintainers of pp to know about this use case. I can't
think of issues again, but I wonder if a more-expert has thoughts.

--=20
Thanks,
Mina

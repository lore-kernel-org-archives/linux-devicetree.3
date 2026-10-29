Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793259734;
	b=Ra6QJL551P0cM0UHQvZku/qZp+ek96X2ekiud7AVzTX7YrRTjK9zXBBDj9s3eprqXTcc
	 dL/cqhYGletszQbzClFqHfEXGpQte3toWYaIVQoXFq++tXepMCyPP7gV6tyUfdh0+GbzE
	 uUSjojKarJmC4Th3oczf2/K1sk+OBh2roxcRQW4yYuNHFPXlD2TtMUcuWwaXzjcAp7iOj
	 E2aSBjcYhQL2gzUUD5wulloFXokM5zfmWgsq5xmyP/tkrGg7YFrLOcLda997dfA45LgCW
	 tNUlr4jlziZqAjCSsWqehDwNpOxDqz+dzHF2eUTHeq8Pn/MvSafzWNGOsjjfmjYWkxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
	b=mo0M4xPpz5hcPvwxxCk/9ftmm5TwzYzD7W8Ptj3D4o5xfEY4b2Xul8MdpYT2iZ+npGNP
	 Qtguzf9Cqxttq7Fs0jNTi5l6vCH3j4ye7zObTi3IG2cbzoEmCOman6x5h6yAH/+1eOWle
	 KVSCI2QueK3zHkpuj+FVCR5UibLi45MIoXDU8Fx3E9GawHp0ZDXib0uv2huosFH52Mt2s
	 zherbQ4YTiT4KTYQGAsPm96E6nBDjGd0CJTfbPyZ9Q5fExsUPg/vt+ccdx7+ADjGMeUeg
	 zbZ/K+46iQQSfpDKnAmpiOmqDtl67501H7JTB+rMCwejT9kC4afh3+vz3fQhgy1le/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGc0Y9V9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D4A606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D4A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGc0Y9V9
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c498fa2f365so233146266b.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 00:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793259732; cv=none;
        d=google.com; s=arc-20260327;
        b=qpz3dY8Sc6pc04ysGdU1AcYAJ9twAdi8yfS5W9eTykKhawLwU6bQJq1cg8oWVUtCFo
         zHcfOT6Yjz+0gHMy2wCO3H8v27GfbQJRHXpz+OGcjRM5Ow8qLM/ARDH3wC8po5dBouv1
         435LJg4VSZe3rbf11z9XhN8/1ncVopkERk9rOv2YbdJvYXzzXf9DM+CNe8wGOEwU876l
         DvgXqGLkyDE3bKwr/K8rAFCw4Htnll0t2lNbniIdwP4Um4XmqkVOeiwaIezJett1Vfj/
         rSMqdxCFQIVGqUY2Tj8La/4Rw70udFFx3TVsqiL329FHTga1ycJKULI1zFTr/nhSJW7o
         xt9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
        fh=+GNI5yZtszwFfKZmFMixli3ZYp7T2FGWKwjT2rkm6vA=;
        b=gZahxp9l6q3W+iDO7QVWWA6WW70DBh+Msv88Vz4io0F9DlQSU/tiMHLsxWJurQ88Wv
         5RatGeT6zSbOcxcrs1G9juomtabbzY6tvZArOJY2CJLlv6TuuijYRxtJeGq88M7qXyUx
         eSSERR2aC/UP9/kf3/h9lVQIHdZ1YwKjB1gHbp8yS11SehJ6Bg9iGxk6mIqf3+WVCXQS
         xB7kEANQQOK6sw/0pMzgIxk+jbeWNXdOWiKL6bcJCnT5RhiyhIxug+HnRlyDBKf4DbBm
         QKlApwFOiXCKL2sbiEPSee6jmHUX0/4O/+9/VVi59Z/aVW4hamq8WS/9ppJwYRR0UOc3
         0uWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793259732; x=1793864532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
        b=zGc0Y9V9yQhkIss1bYi176ej2dIv7fz3bctn8ItT8bqV4TE0UelQmq2Gikz9hLf9Hz
         vNHl+yFKBv76Vfu7Mg4/OWVcFBObMsIzU0zhaG3Uq3plDzVC/AP2q2OCraNH2ris5/im
         Zqb7RhRuV0Q1CZHmUEiYbs4cJE6Mg+Tkv665xqAuAvHX5O5/PC+Z+ZwaQoJQ0oBKybhE
         Mpf81dGZ9wDrJnNiMpbsgK9LEX42jxZxNRQo3HCEkH2W0TlP81/EcvOZ6ZEfPoGjABXN
         PoQlOF76E3JGhpf0sthOBkS0X5fUgRGZVYUW/Ft2YJqpukUhNo+w/IqwKx4EuoRIxc6G
         CEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259732; x=1793864532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
        b=F4DxuZGg6GFm4AIJP7McHV4n0HZ8r8hq/RJWzLMUu1NAzc1b5X9BGz7HKrqBF78rxq
         Ushq2wy4pHbDPKSZLh9ZNnmCRxRjEduu1aRh/APWgZKkYZB9DcqxQS3vra/juRBnlOiY
         GKDII7jpwGNpYKR5BP6t84r9YnKeLWe2bHOPiC5kAUxZ+1Jeimqrzswqud4vJKHOklFk
         QC2cYqnOuDiy0gVb1SlLXVEOOJmmQNnqnCysmUNrwo19XAV9GQ7etKrhWfHCpZWzVdml
         mPFWdUC4cfFWlGKIrlvk/E3IAlRgIi4QIuzDt8Ir7EYDkPrpxqYn2NG8gX/FnP/9Bb1o
         gSXA==
X-Forwarded-Encrypted: i=1; AKwUvBzdm0mpzc2LnZcO99y4Aq7DSImSbRaqWtpFc8nSi+KQPv/eXJt5HJmMZdgtgbvlvIjnX3GKn/5gkkGp@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0ZLO3lUtNbhW+fp/py8FluALvFRdNYogZMs+2+jdQB4Pew4zk
	HBcJ9cY/ybzgiMLfgH0KmjRR7v0bjPXKUeYKCD9db8xa0j8fsvYWCrLb7cc6Vf8mxoQdyCXFOTb
	RBuDmfWTxCvTO3Qo1dwiii+dIdKZ0u7w=
X-Gm-Gg: AYBFou3z75fyXajDM5xhtXNm1gR/2Xi+8LRJ9so2LCRSLPtwXgbcAsiETujpTWyFSkP
	qgninB02D6daUe4Oyu3U+LZkZUNiGM7pdvOiWGkYrMlOyki3pKS8PNxW5S+FuiZ5lkwEKKXLf60
	3PUDsZN9QbCGpGF7uh99BGh4kizL91fB44/dpJHtUN5jYC5lrcWWTMsKJYtVY0U+yxHrD8qx/3F
	wTPl4pMquxHT1zo1bDQmWZ3g4anzvffK/o9N77GVBY0QpVRZ0oQRoljsGzlXPKDY8azihvHrVjq
	wQT6b7XZxtBtDaZuj06XsQRdEjV7L3aPa8XzpWiyXUoMXD4/7yIDeojfu8f3utjj3iZO4Jl99rG
	Vbqn4D2rZQ6bugYlipq4G8oV1urpVgmRnKkG8lsE=
X-Received: by 2002:a17:906:fd45:b0:c49:bf6a:28fa with SMTP id
 a640c23a62f3a-c49bf6a2c46mr282671766b.28.1793259730604; Thu, 29 Oct 2026
 00:42:10 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792988985.git.zhoubinbin@loongson.cn> <dcb49d67055cc41af3bd68cce01c05e73a7c2787.1792988985.git.zhoubinbin@loongson.cn>
 <auIe15pAb8ZZWbnV@lizhi-Precision-Tower-5810>
In-Reply-To: <auIe15pAb8ZZWbnV@lizhi-Precision-Tower-5810>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 29 Oct 2026 15:41:57 +0800
X-Gm-Features: AclHuK8kbVDGgdNrbovyTyakUo3h504IwuEClXkjkVVljd7312xDrPpt32lzyXs
Message-ID: <CAMpQs4KMbvRpF9axnnEbO6Rcna77WqHQykv4jvw-EOnSbH8FBw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dmaengine: loongson: loongson2-apb-cmc-dma: Program
 CNDTR when advancing sg
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank:

On Thu, Oct 29, 2026 at 12:12=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Mon, Oct 26, 2026 at 12:31:22PM +0800, Binbin Zhou wrote:
> > When configure_next_sg() moves to the next scatterlist entry it updates
> > CMAR but leaves CNDTR at the value left over from the previous entry.
> > The controller therefore keeps using a stale transfer count, so the
> > hardware does not move the amount of data the descriptor describes.
>
> How it works at 1c0028e725f1? not test ?

Let me clarify how I found this and what I actually tested, since
there is a fair concern the patch may be redundant.

I hit this while debugging a CAN-FD driver. Reading through the
Loongson CMC driver I noticed that loongson2_cmc_dma_start_transfer()
programs both CMAR and CNDTR for an SG entry, but
loongson2_cmc_dma_configure_next_sg() programs only CMAR. The
asymmetry looked wrong, and I wanted configure_next_sg() to program
the same set of registers as start_transfer().

I instrumented the driver to read back CNDTR before and after
configure_next_sg(), and forced a non-uniform descriptor by
temporarily making period 0 shorter than the rest. With the CNDTR
write in configure_next_sg() reverted, the read-back stayed at the
period 0 length for every subsequent period, and the TC interval
matched that length =E2=80=94 so the hardware was reusing the first period'=
s
count. With the write restored, the read-back tracked each period's
actual length.

That test required a non-uniform descriptor that I built by hacking
prep_dma_cyclic(). As you know, cyclic mode itself is uniform by
construction =E2=80=94 buf_len % period_len is checked, and every
sg_req[i].len is set to period_len. So in any real cyclic user today,
the hardware CNDTR preload mechanism already reloads the correct value
on each CCR.EN edge, and this patch changes nothing. I2S audio works
fine without it, and I could not have found the bug from userspace
alone.

So yes, this patch is arguably redundant for the current in-tree
users. I kept it because it makes configure_next_sg() consistent with
start_transfer() and removes a hidden "all SG entries are equal
length" assumption, also I'm happy to drop it.

>
> Frank
>
> >
> > Program CNDTR together with CMAR so software and hardware progress stay
> > in sync.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 1c0028e725f1 ("dmaengine: loongson: New driver for the Loongson =
Multi-Channel DMA controller")
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma=
/loongson/loongson2-apb-cmc-dma.c
> > index 8b8d530d60c3..c654e0572902 100644
> > --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > @@ -266,6 +266,7 @@ static void loongson2_cmc_dma_configure_next_sg(str=
uct loongson2_cmc_dma_chan *l
> >
> >       sg_req =3D &lchan->desc->sg_req[lchan->next_sg];
> >       loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CMAR, id, sg_req-=
>chan_reg.cmar);
> > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CNDTR, id, sg_req=
->chan_reg.cndtr);
> >
> >       /* Start transition */
> >       ccr |=3D LOONGSON2_CMCDMA_CCR_EN;
> > --
> > 2.52.0
> >


--=20
Thanks.
Binbin

Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCAC3876BE
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 20:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781729389; cv=pass; b=J+E7b69dI7mcWOH9fGckwJTXNCRe+JDnR1eSjy5sneJ5MNInUOfO1GxVKSthL8xB4AD4akk5FlesV1i/x9uL7hClDVYOWZ9YOQlW1IhgM3iI7b8zk4mTBHQZEetx7+dHHqMLCeJsd9Dz4sn5ndcM3T0+3dX8cEg6DbaWwnlB+Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781729389; c=relaxed/simple;
	bh=8riQs28c5CEk2XTXUUBXYJHl6xc4h6FhZF3t0ruzM/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plWCk1/HLIgzJavNXTNfPNC2m2BbVBw/GXjib36GKkIyN32PkwV4JcFtmegFagkPoZ5Ffg6TfjBtaWzCCJzdnxyZLvqvKPP8gvZl0P0H6pmFWzUslQqp26lfLEqwyMjtvq4DNcodmvgkgwjzg3EOmF7zjoACt88qzd18dNyL2L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QauogLM5; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QauogLM5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-463b2f6fc9dso191985f8f.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781729386; cv=none;
        d=google.com; s=arc-20240605;
        b=T33MBAr45i3XH1EYfwtCQyK2SmSJpuiXUtinNZ7R0+5ZRXCGbbPJNgH1G19XqFB09x
         /ZYZ7xwgkmgAR3fU3rMk58aNGqGFOm0Jppcxdu3qwAAjIq0H+yV1W4QdYywhIuK/FrBV
         owXmeBzaCsjz5pMNd8soux5s7py3N25hj+IgKKWzw/AZOBHdMpTngHZsBogXKoqK81ex
         hQozGm9xSzvvWggKUq4nUweMJnO+Cs7DYvbUBSdKQxwK2VRItbuaWLq+QcyLO+TF+53Z
         L5Xl9zwDL3kRz++BdGf/lzMGgxt2FSeCr92JDYdLQZ3s0Fdr9Ov+3fKuSg30BmTVX/T4
         FWhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=StSvglLaxppt7VqPKeSB/sD5CeiYnjB2MJ3tpzdtgys=;
        fh=BJ9hdSTYaLH5oLcUC0dWNQe8LdVFA4+e6z1mLTLE1bk=;
        b=fWWj1aaXcuCg5GjHD6OFB/x63F/ENOWNS6BBUPUiHdamO3fYppuXdt/5986TqghtAr
         MUccTdEI4VAuW1RzAaesDlB187CrMuQcNn35uwDHc5WmEBDrumPVfw40lwwKryD9xSeI
         jqDl0Ud39CFsh88nC8VTDjwu3nRKr7y09a2h6Wmn9KPVqDRf2MaFmcwn1xX0R0jXB/5c
         QbCKDeqr0cd6g4m1aiXx/1QdEmM0X5PnNWjg1aZ/uqOPtn4WRKivgBo85Tv0cqAek/bk
         6xHtS2jgRS3ruhxLRfobmnficza278Wti4UAG1S1XGjkENzybp2fCAq/3rammenGUxYA
         CgZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781729386; x=1782334186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StSvglLaxppt7VqPKeSB/sD5CeiYnjB2MJ3tpzdtgys=;
        b=QauogLM5z3vcR02KJOAwodPmp1SbhNgnfDTWwSGr7oBe4pneIR9CZ8z3g+VJGK7ZE3
         d2g9dP/mgrhiwsNGo4ZP309N9aHw+jDc+cUfcB7XsDgf9AdyHOCTC8h3pFJte1KrC6NV
         J2hFYEbOpAT6PxEr50+9Kxmx0SJ+cKo++bjGWmIUcDLy3GQLCgpcE/UirKjpUpOuuN9W
         E6rlDxUW0VNvoRqZtOj/Nma4Pz03KHqvlq3GjzNzoj3sLDzdK2V1rcp392js59/+pZuh
         Nv+0iGag7kqC6TLVULf38Gm6AR9zyxxCBy4njCjQVnb8bckv1HNh05DzXNF471OhzkPh
         yQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781729386; x=1782334186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StSvglLaxppt7VqPKeSB/sD5CeiYnjB2MJ3tpzdtgys=;
        b=HEkrG9Am/RYJ/sggL5lq2ed1XCAAx/nirxxuBoRu6NuCwTZSW3W1HGJMj88neq/3W9
         coEe/+q19OUyapLqkQtWJS3f/1eaH8jN/mqRUcubZ72d0Vu5f0Nq4eu7EhSE3WCbvlqG
         EqfFjXdFupYx2miopPOz66fSZUUA/dUi9P8d9XDP+loPz2CbI4vQ6KvzT97rGiDMr/48
         odiK6r7s4sQQHY4P8yoG12H08OLqZ2IowPgXKNSoYHlN7jFrkDUPk6DFPBu/a92C7OJR
         Vevs9P6LHLe6l8UBIeXDyueKy+kkp4krtRhUuSO+Si1OoDMt0Mi8ciVlAMhRg5FIRmG2
         RoiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+JTM5EL6yDUJlVnHxnqt+zH4goP7e8PfFY8f/tEzebiF4Gft2iGItSVMy6AcYcFhFQ001ZHYZWNvlo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj2EjaY1mwXR0pKYg+Yieq6eqeKdwiOqkGehGEHj6eY8mw9LE5
	Py/DpE1mPOI2LdOR1JEelS55whdOto/r9v6FQIXJ5ZDp+OuLA0Si+NweyWmOXz5clzh3ADL4bJ+
	dJiQj6NZ3Jz7Yea89HZm9BmiYZnNNh1M=
X-Gm-Gg: AfdE7cls8pNfJKzlWVLttfADOzPhTD+VxVRDYEzdC7SZtOsDPgSS20O9fNSMWIoFpp7
	ggVy4Qh1uSEINAvlYpbsJDX7BGShLw8BccBQJg6qidhirBb6R/vek0xr4CW31f8HH6un4Zdvw+g
	pJ6SA/bVS+1pyjQceJXMvV4/PHwUmDa+TvKWtdyX2OKISAini3idknUKaWtxlHRsusGdBZ80B4T
	DAdLeACgYyiFiz4txs2Ce/rlDIUq7bLQ0Y1J4Wue5z3Zt3WVLDHvIp6Xkh73uF9IhHfHRT1bmxt
	2D9JajQlp23jIEFfQXpJWEfa8s9lB98jsByRYM781tIje9IsSiGcJzPoW4M=
X-Received: by 2002:a05:6000:1289:b0:45d:41e0:467b with SMTP id
 ffacd0b85a97d-46235e9acb4mr7940736f8f.3.1781729385759; Wed, 17 Jun 2026
 13:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 17 Jun 2026 21:49:19 +0100
X-Gm-Features: AVVi8CfEsllEJEwUR32cqZ4L1WJgMIiJ_74re8ZjTdVt3p2wYsrPrSguI2CW5nk
Message-ID: <CA+V-a8vdxgBUs4Z3GYJEtP82zAUA0gTKCCfu1Mj-O_1XabVD_g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC
 clock ID
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jun 17, 2026 at 11:19=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Mon, 15 Jun 2026 at 16:40, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the peripheral clock ID definition for the Real-Time Clock (PCLKRTC=
)
> > on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
> >
> > Note that the LCDC_CLKD clock is utilized as the operating clock source
>
> PCLKRTC
>
Oops my bad!

> > for the RTC IP.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in a branch shared by renesas-clk and renesas-dts
> with the above fixed.
>
Thank you for taking care of this issue.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

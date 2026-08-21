Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19041380FC5
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 20:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787344694; cv=pass; b=fJ3ieHVMfZ93oYikdU5MQi42bLeEgxKwvjFrtBVAEwrI2t5bi64jZAjd80Tx5PqZG0VagsUDdFhwiI1szP5AARzzCNx0UvVHMpg4yPoMHsPWszTIhODnssPrEtoK3LikfRF4BNaSF9KK0VT14AVUuYNs7PNM+85mAYL2hG+lZMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787344694; c=relaxed/simple;
	bh=q13Ycl/3I6Y3/7hapb9RKt5soriwKmS57N1y723YsvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nL9339iG9529vfhkPpiZnZBPTxY2VdY9iC+A5ZjSGP2otnMBn74XZf81MwNVbZPOqt/9ivR+MsVT/Emcl+OEtImcyLbxudYuoB2drsowAIWHMxO4mAb7ObZw+a4W9/N2jkIp3F4D0NOuMa8hP5C9b406SuScc0GvfoxPyW0Jmgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQ9A5zcB; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQ9A5zcB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so736604f8f.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787344691; cv=none;
        d=google.com; s=arc-20260327;
        b=gPiAmH0j6Jf4SeFgUikg+659VvjT6YoAIq15swzbw2v4ykZvYcua6OJKcGxUQwKrSg
         He70FKOIuI2Jn/d0BjdZWlgAoe9EnPsFHNb1SFqoIdoXIVP3XgdLcRxrjwbbfjc0lg/p
         WzwgqbSimXTX6Q5IY+7Dt32SPRckkDdDY/LFssokuuWhNAcmJUymUQEGH6d2NUMpK5Oh
         ntUrm8WhRuBHw1zStmE55JhPAf/W+fv0GrcY7+uuBbqQKV30buz0UTcwemzWzArpAgEu
         lRcf7n5Eh6seeeQnzxj9BAYHhOtb8ScRccVQzpVcE0Nm64BN+QskTwd1DDiC+LlZucUP
         PC3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WdiOzXvDUkVsjFuM6APRwKIWsDPLxu7zb+fOUcgUmVg=;
        fh=7vNkI87l1MKEiE23ISUqxjASTefy9b9zeVp8tb/Mt2Y=;
        b=B6hdtsPgqIOCtMUy5U12YtkNaJJGd9O/ZBwlHm/SIysQhWUAwSsxWvq7G8GncJBaOq
         dpMgD8ER8iPpP3lx53ZuwIoU2QGU50nE6BfsEVpKVLJ9zc2C0M9FKsMjko+jl2aVZO3b
         vOxVa6BfcsW0sVGB13j5HFl93enDwlKbAtIV6wq/YDrKHUWZVhp2sBce9hf8HwDJgih/
         2tBQqTUGgL4qogzlFWIQ+r3gqIJx4fccn6yG+LuTXHwFZT2gj3zYqBRVs35LismKlErF
         oRd1d6aDOQGfD3dQVHGFQ64xhk7xfiyjVANoRjxGIE1gboIEgmYwu2nV6ew02fnXNDZx
         MfAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787344691; x=1787949491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WdiOzXvDUkVsjFuM6APRwKIWsDPLxu7zb+fOUcgUmVg=;
        b=KQ9A5zcBl3DkMppGuWyduTfxngmqFkUa0HBrwBJbMIpcZ2W6DeDtMgp65E97pLIrCM
         /tvEBMv4M4j8453YUHmAloMGtHAonGcl8RDdN5ePn/Nv4CTGgNOGZCwAi/WF7ujJkY2l
         3OchERuv85mq/y3goLPUFrgRfXEM1Y67v8CxeiPZvgRpSNAqkYVQVlaLU6de2ljYvVus
         PGgiwl7MmsgE14UbtAOGY9ZQmJXrbECocSyDGxLPKdglbP1+pT0UzI1IwIWfb162sIAd
         ChdsLqmP5hg6ORsgZ9vhGJk/EG3IGdWRIDquLr9ZNh4aVGXKvc090ta1Fz3eV6eq0xqv
         ID8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787344691; x=1787949491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdiOzXvDUkVsjFuM6APRwKIWsDPLxu7zb+fOUcgUmVg=;
        b=MZOCw+WXZaFfmOFMShsnQVXRF4g60ALSbuXBE1+VCdJI5zvhOziGz9tNKxdeS6Ukg1
         3nw7GU4YY+NGfFbYHBq0Xidczgt+QEFGU9USVg0mFsG8dO+adC24E+SA8EbTZG70veXr
         YEqEpiZXeVX9sewdHqV6yjgsuXLoQWK79VIqpJE/I61y7uzAefOtKtMVmjstKpsk1Zcv
         306gv9w3XOaYbotjAWzFMmBvuyDFJgV3+Z8tQdQS4lA22eQofSk/7bVpFVb3uEv0cUCv
         z2yJ2pOGpohDrJGMkzZKxh9lbXk7Q72qiBR9Dri8y3jMPsnxzeZiIPzy9Bqp3U5mO8aq
         NByA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+rhKszJ6gqZxz6XTkC2rdtdFO8EFAn46nI9f3YDylo35yyKYGn3RLYo7/Eomo5dNreoUj3R/tR4mT@vger.kernel.org
X-Gm-Message-State: AFuF++kdJkp8q4691ZXcPE7e6uAFkpkDsBtaUs+lCcfYPxtcittKFaq7
	maBJJEHuvov3nhEdjOFVesqJiDwIYaTwE6D14Il5+4HOvlJUxZnvOx2iKi1W62+5FJdIfb2J+OL
	Ag4Fd/nIXLhl2j7djJzj6sefxzvI5zHU=
X-Gm-Gg: AR+sD13cQTonkoMGfeXHHFadDQS4S3WNgMHqBohO5/q8pxhm5MX1RsCG/7ogQoRzAYK
	ssbOMDyQUChDenqdvEIol74rtEc57ibwtZAPnXF1Vi1PADWQqsLB8zs7Ie/7QnauDJm1PdmGblF
	Y6yjHd/cPCtU7VfpbGmgEa2ddnU7oTxOCuPlsKe5zH2MTAnA/PJJV9pQoYpR+BMTLe6NW+N56ig
	jr2qJgas2QUoDa7/ZKTQ5f8AlYLiyeeX6aqvKXLLIgTpAGnFZJrUkILLRP/kuByXzpCEax9JOa0
	E1n3UzvPk+T1su/z0QOfmX7IdLCfpovOJ/gRXgoDqi8zKxU/jSf9dQjdkn5N+yli9fWK7xw5ogx
	vxLjwSaJRPmbYnnsbxHo7ZrjQrbTJc6M=
X-Received: by 2002:a05:6000:1884:b0:47f:9557:8d77 with SMTP id
 ffacd0b85a97d-482c0b97893mr12816144f8f.10.1787344691056; Fri, 21 Aug 2026
 13:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260821135608.275233-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260821164050abd3ceed@mail.local>
In-Reply-To: <20260821164050abd3ceed@mail.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 21:37:43 +0100
X-Gm-Features: AcwNN1VVl2XSQKPQVSNLcdE-KwXFGBkc_Ti4Au0DGXEzggezb14PYhbpLUOzD68
Message-ID: <CA+V-a8tp8EEJw9NLRfpiM5pve8GBc41iL_s=5=MqZaSHssOzbg@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] rtc: rzn1: Add OF match data to gate SUBU
 register access
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Fri, Aug 21, 2026 at 5:40=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> On 21/08/2026 14:56:06+0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/N1 RTC driver selects SCMP mode only when an optional xtal clock
> > is provided at a valid rate other than 32768 Hz. Without an xtal clock,
> > or when it runs at 32768 Hz, the driver uses SUBU mode.
> >
> > However, the RTCA0SUBU register used by SUBU mode is not present on all
> > SoCs that integrate a similar variant of the RTC block. Allowing SUBU
> > mode on those variants would expose RTC offset operations that access a
> > non-existent register.
> >
> > Add OF match data to describe whether the RTC supports the SUBU registe=
r.
> > Reject probe with -EOPNOTSUPP when SUBU mode would be selected on a
> > variant without SUBU support.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> > v4->v5:
> > - Renamed rzn1_data to rzn1_rtc_rzn1_data
> > - Added a print message to indicate that SUBU mode is not supported
> >   on the variant.
> > - Added a comment to indicate that the xtal clock is NULL when SUBU
> >   mode is not supported.
> > - Added Suggested-by tag from Wolfram.
> >
> > v3->v4:
> > - New patch
> > ---
> >  drivers/rtc/rtc-rzn1.c | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> >
>
> This doesn't apply cleanly, can you rebase on rtc-next? If you do so
> today, I'll include the series this merge window.
>
Oouch, I'll do that right away. Hopefully Im not late.

Cheers,
Prabhakar

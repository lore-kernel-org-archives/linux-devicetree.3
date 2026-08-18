Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B428E37AA74
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 21:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089016; cv=pass; b=n788P24+G2B5d6XbbScRbnYzRmoKyfivdZ6lNf74SojA/LD6i44Shb0IQYpoK6AHSMWZf+q3oWqCzS7gUhOp0twJj2BP6nlSWAjAObzK1z4kyKWJWn0Vbh8SX3iE7Ognf+Avh7PAD5+D8hJmD3xp9Lt9uk5l3oRSUzvUEQI2Rxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089016; c=relaxed/simple;
	bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIkSdwNEgf7a2k0on6VkRinb8wFoAZ5s5lKE/4i45M7W+PzSlHrLn+38F7dfu1WC4OejGdAgGKmf6g1FuMWg80WnJePXWFcZLA3/y8HhYXHmYcRIqrAiKwh5+rIvMnq53SbU3U7P4P2BDoij+vwi+ZgfOn+91mABP0FDeLQqSAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfKJivyY; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfKJivyY"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-758caf52714so130791137.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787089013; cv=none;
        d=google.com; s=arc-20260327;
        b=i5hiPOvY46zSl0aH/YKZMQT/+iiTyanSDE872NGecomC+8vvUDXKkQhrXx8V66ng9O
         Tn0Emt5ccd0iPZBeV3cOq/4f69ulIy4Qz6Kt9hCNMIHcZJqaoj8LUynXsrvuStk2iKC3
         7pAvQ+wcJ29ngAiP5NdqHlwIUJYnWIzpn5/SHoEshU2eD7J4fxF7NpWRprHXetCbkFwB
         Eq2SPqn/Ys2US33ctQJmS9wVbzM309TENPTctZ6QcFL86T7K5tvM18CZ1XvZIh5YgcQC
         wNNyUfnFdmHXB/5lVpX6Zj4JkRffqccZb8w4HLAol4bzRPs68hiAdnxK48T/PGzYugoL
         m0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        fh=zeXTy8dhzI4Q0OF3LliW0l3QGegdIYlCsAN60QlfTJo=;
        b=SfGMvYJsTaBmICgUVABQiXptEwkvIhH2EqbFVNsiYkZuWDpSPR/CWH/dNV9McLPBbr
         UuZaTeeroWbJ/hzQNsp79Bhm3WXzFekBn/mEsFvK59A2s5Jc2S0uHGKvBwxfAtRzHZSU
         H7jrAM3c4RFP1cDVGcx1hu7sXwD5NUN7w6AuB83IXAdSAyHS9gPLX1+w11kwLpu0Tvn5
         1qvvNOcHiGyHmiDKQt0LuIlZJpeTcw1LaP/8yk2gWHX/aEPzCEf+axeDeXOJ44y/nICm
         DTN6UK96H2yuju3rXV3ZazHhOvHmnhGoOsIy/sq7Nzl5u7iamFqbpsW42WFpShGnx9+X
         pY5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787089013; x=1787693813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        b=EfKJivyY3Zsxyw3NllYkg2PF9zayhDDLARkVvR4uSf9RSc7ixt6ZxlN9boKTDJaxnP
         1YG+EIxNIt6kLWZ3Xz4p/5umB1MA43ySl/0qOlDbMR/ehTct6Yg0ct4HQofUmLZLlQgF
         NnSx09CX3dfDmxYlFKPKWFPbf5H8Gww4iJ3MCnXWrYOYS0rJJOtsSonGsxKciNDgzrEA
         xOa4I1VkhiLRDwD66O0SP5BwwnVYPfZWk9NGFA4+HbjclwdpifFJG0My4wHpwEizJaOL
         /F6Y/lqL+5il+WlOHzdPWKfYVB5h0UOVZ8eTRknB6JVLCvUOfknsqCcyXyclnWmXVZcQ
         TVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787089013; x=1787693813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        b=XYwQj7/AJPCgWaBVOF8JyRsVbUxiJ5YunESKHBEui85JTeg/azsjlYcmLB1mtm/vPI
         XP7T3gwu06cA5plDqhrBDile9tz39UioJa6DTPznpQOLxqrFYjx9Qwx23bR77Qksg15d
         JEm+yD7TZkttuncnMeXXmkSml+sRvSPm/VakQNfuUZrT6IJKonV8/lfSA2Ho6QU4kpQM
         /OnQhsh6WKtyhqvI/rrqssx0zp2WFShQsWBL6yHIysQjRpLNJgzLxjubaGEwmsI/kVMu
         A3VY20zxbvYgrNQc3lo5ElJEEHB5HbEblZUJcXF+FKXdc5O9p16Md0lMbTseDYpmzp18
         Xtlw==
X-Forwarded-Encrypted: i=1; AHgh+RpYOUoOWDTwfK1cEK/xME0QtfDUBKbPX8iW41yd1oxNI/uj30I19ZZdG5bgtb+l/Gvr7n6keHptBGdG@vger.kernel.org
X-Gm-Message-State: AOJu0YySfsc94Mjj7nk64Z33aJ/PUQ7QJuSS2Tt3tlEELMmmX9c8n5pL
	Yib0RBfku7jmyV+KAOO/Ft4D2V+vH5sKC5tEjszAjo7r/I+do2a8GMuiIQWEWKU/2/5EcuxNKpM
	nJ9J6T72OntDWZzjafOZLd4E5C6Sb3B0=
X-Gm-Gg: AR+sD121eUDkdLl1xSR/ZHhUx7dCp6Lx2WK+LpY1IFmwndXg99wrWfD5D14tvGk7Xow
	W/GeB2NMd7K+Epak28YOzYs8sNpeiSZcBRenGgpO7wX5Ia9/yopz2sK6iKsRPYQk0F0QCRcllBF
	mWd6Sea7QF7+Aa8coQrreRUgB7MZuXez2S50TNksexnYLwIlp6c2JFVC9YX1BZxk4TJ5DygJ+mo
	TglLxJk35+BVEOJoNle0h/JmHYdwqzt6LL1M+SXX6PRXl61sAd3fYBgM1NKFbB048uC65xiCR4T
	2XLxF3Z38ZGbJOduT3NTdlmyV3LiufT3TalUj7kW6AKFdhQu9e/O2WGYK1Q/7K6df2AezrbT+4T
	q3EqlOJxk+zBWSyv1ruumhWoWH/TpUojyAVn3xKS9f36u2336GAgr5N8RhBKR79GyVml1Eu/lhH
	M7g0cdZlcYJIJWBvsYRXQQV26DiV/52I4jv5ub
X-Received: by 2002:a05:6102:3fa6:b0:6cb:d562:b96a with SMTP id
 ada2fe7eead31-777b89f4818mr417941137.14.1787089013591; Tue, 18 Aug 2026
 14:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703152215.192859-1-richard.genoud@bootlin.com>
 <20260703152215.192859-3-richard.genoud@bootlin.com> <aoQibj7sCd6o8W6h@monoceros>
 <CADvTj4r=uBJyJdmK3T+jD_Nitg2NBs7fZgtE5p6wt9zwWgj6DQ@mail.gmail.com> <aoTMMAGbWelnjJTo@monoceros>
In-Reply-To: <aoTMMAGbWelnjJTo@monoceros>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Aug 2026 15:36:42 -0600
X-Gm-Features: AcwNN1WNCOQhs7S_JPB6wAilK0gfWlIi5mTrdxNK2MAHoPVv5VHOpQRIxBhuAGs
Message-ID: <CADvTj4ovVmY-TN7u_yj6me88qNEzr_0xbuC9DerPguFGdgOEBA@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] pwm: sun8i: Add H616 PWM support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, bigunclemax@gmail.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Tue, Aug 18, 2026 at 08:12:43AM -0600, James Hilliard wrote:
> > On Tue, Aug 18, 2026 at 5:00=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek=
@kernel.org> wrote:
> > > I didn't look at Sashiko's feedback
> > > (https://lore.kernel.org/all/20260703153337.B5AFF1F000E9@smtp.kernel.=
org)
> > > but I would expect that not all 9 high-severity issues identified are
> > > slop. Please look through these for the next revision.
> >
> > I sent a v8 that should have fixed all the sashiko issues along with a
> > bunch of other issues:
> > https://lore.kernel.org/all/20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmai=
l.com/T/
>
> Damn, I missed that because my usual check for newer revisions is using
> the sender as key (because subjects occasionally change). You didn't
> write about your patch series being coordinated with Richard, I hope it
> is.

Richard was working on this for the same project/board.

> Just looking at your changelog I think most of my manual feedback still
> needs addressing. Can you (or Richard?) please go through my feedback
> and address the things still relevant for your v8 please?

From what I could tell most of the v7 review is either already fixed or
inapplicable to the v8. Probably it needs to be reviewed separately.

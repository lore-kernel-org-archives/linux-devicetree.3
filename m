Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794743666;
	b=hswzDAfenwzVUy6RM01uRgsfuMo3G8tdRNZrNoSQjd+S0yxp20h3jv/vV4FcHYw7u2lI
	 wZSLassTPywQ6VjJVasbSEuIDGx870r9+6loiKokI94E7kBRxLS69Vl7fgzuL+2fmbxYJ
	 JsbV5JuZ1Z0HfQYGooFXAPZcWdBQ2jUBdcPUggmNkFNWwZqg4VHpmpZ2d9G5wtIAeOLID
	 uFrJaOYTG9kY1Xr8r4kRqZI95Sc3VVZGWMiXfQp6GLKb/IvbwNFYjSKWhfw5S0afLJbC5
	 LlCxug+i7CjOf/qLCH1zTF8s+IEE/83zjARr1zyldw+3wnqWtb7B1xUu+BPXiEsR0jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
	b=wvAGD7iP7eTqLkqeUhdXZIRKEmLucFzK8mO/mwxVuXDFVTVe66gcr5JoXEpLpDKtYfjx
	 J8I7BC/te8VFPVj7zdU4aOn4AXqefTxzaYtzwV8Wxtml6PLV4ZIFi450zOxAAj/IyDDi2
	 s050iQX71pZCseMJRlJ5a+u6IZXfCau9kZm0KQGhfJQcxC6ZtG8YgqfLe7Kcqjkrw32te
	 GvrgUTOW5+E4GVB9NZ5hsuv+ZI5olV8bzqQ60sPRICH33h9qFB81hp85ASujIvUGem3rF
	 1jOBfxcPOexYVc+pQKPwSr4lb/RHAHHKLFnnNnDvnbUhn1gpdOrkJU5OPnHTXGdU4Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTrBdHJA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B0A606A882
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 11:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82B0A606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTrBdHJA
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so7235181eec.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 03:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794743666; cv=none;
        d=google.com; s=arc-20260327;
        b=W4V+r/9vRdVjqzkAnGTYHH0M1Fq9R60pO0dQsXz+wb+JQnVv5S9svnhfGcSK+Y8qG0
         Wvb4HJutwK/26XAX7840lNkcnPBHzMCCKq2N7fzZnwTQSRtCegfELMoOfn/nyaLJrFn1
         hCyaeGBKV7xMss8sWO8rwp9rVfVzq7ONK8+yJi7XDSkLXssyH1vVfpNrmzSJSm3HkciA
         1/dnzqwOhYKoDOe8SbizLtJOhFDtiQ6AS3ytxHVxW698fPK6fzCZXXrdYhVuIdoQjbKz
         vAl1tGMDS7BNSrwIANG5CoFYbEmVRoHamrkuOhaUmlfk2nU3LTq57TqkPYerhCMIIAsW
         gkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        fh=x3C/48Tfh9/I1jWMMyTEJa4Yx7CCShpkpFTHUOJjl/k=;
        b=N0Mry1M5PjMdzpSy6TmSBX8nkYau8qBhTPNkPhywt4IBCG1VpQTgRQjld1KHE/w6K+
         6CsEENgADrgg6ZoQ9m30zsuZEKL+G4+XNVtTQZ6EdfLLPH5eTu5Fel1XYRmR0B/3I6ym
         7dPrQavEcJXyvET5HZ2ksVoWCmZ02FlQMbpVva56tGebPgil9MDJWwmHLZgrl8DtU0mi
         jIRO4CI5NSIirxkDxuD8Yrk/3eXrt9qAJoaq/e2iUIZXGKjeDze13SNMve2WFYhD+0Wd
         6qFfuEG+WIWfmVE/df8waQf/vSdn0UORCqxU5nAAAkyR/cLGpIpeYGRry/NFD9DERITg
         uhgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743666; x=1795348466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        b=tTrBdHJA3EGwmoZUxQrkbZUVwQBHP3AVn2M7YykEYWfQzkdbVbo06Dt08bxI7pef9n
         2s5g3e6ZjDuUdLINOz/16cOa2/67Qga+pbtgDTbQFxvCV7/wYiN2HvnbTM9v2KHTKMDn
         lXhXKg70kdruDYacOcw3OrnPpwE9x3GVwE1cjyM4WQkTet3p2ruaVtk4iuD0Vg5W+40t
         KP2+dPxFKTHI5qnPljVlljIzh7r9ZubPmJpP/c23PhesDSTedONJirXt706HnDYtn2+I
         UuhxxKVd9i/wMgFDGMAuCSok9bEAJUAMXM1t5xxd2EobaTIgnXd0jaE5l5G9qIC9Zxxb
         fIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743666; x=1795348466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        b=0veKrRxo0HK1U6wruemzFlDpmZXCxnqUgp37FkxinoevDmCUjHeCfC91CeaQhPcA8W
         b3P9Uono+rEvgZErvng13TbmXX3k3jbv2zTGp5VWo+7lXWU7LWxeQBGGFPgeL03s0NRz
         gNRz9Pq2NoQGdOLelRbGjo/xdleHpkEuJCHYOeC40TIvA+tEHRLwbKMb5IWwcb+Wp4LL
         Ti5HoMDKa9bztmkz7fNZvyjLoJSdyEbDcW8EX7yvr9/lfWXtCwJQX1URKm2RspAeL9qU
         o7r4OasCDzBTJRuLEECGyWJGcylgUl7jdY13QyrRbBMKAeEcmcZioO+fyW3ZBxfW1jWg
         0I7g==
X-Forwarded-Encrypted: i=1; AL+hErE2DqCcJjumB6vJomqI5L0bl/uJP2nzu4VVoNUaKNsCwbnL+Kix1J/wO7s/4ivGx4VKlWdzUDNtJmqf@vger.kernel.org
X-Gm-Message-State: APuU4Z+UNTM3Zfr3tuS2jUF3ylZArOi9zaVaSeonNaFYRDXtUeKlRZ7R
	iUFAFozh9RI4hTCYucpjDBgW5VeBt3PmBID5FYPnvOAvEGSrvjvEH667uuIa1jmB1OlA2cl3Wdn
	BaAhsOep5wfE9DTIgo23/6fi1zy5K9Es=
X-Gm-Gg: AYBFou2A6D9WPBeEhD6vayXaRLrG6CGO7fdYn+/8DBSvM6qlnDAlK7MDf78jvsnZ/a1
	HT+V9dmer/Hsf0DBcGdjzVmCMcTbcs9ZGX0vM7bt5W11Jx0u3OWxnecteEP88Ml8nLbYMzDGxFQ
	NE/nUrAufH49+ghegb3TEzBcK9W6hPEQyEtBb6n23+4L+xYnb28NnQw4Ijqx5dX3yP0YK9RKFAL
	Y0PJmAuiGIiWkWGx+e/xdAfwS+LxVknUMfwuYX5uv4LRgQMegA1Jn2kZIUFs23qH3zsgEtWW2kt
	1S0KR/SJnfwSoXSD9wVVchIHPXNuHM9aizp2jwVElJV7ENhV0qm40UNg9SSgczjwuSdBXizfoKB
	8oTrZkmAeZI5ita5ukkoWu9TTfNK1tl5eXU7h942rXaJNBOialhvwGDW60PVlRzy7EY+uDLIwrl
	fk54JLnJ5Wm0zAram/l8uaKZq5FR00AA==
X-Received: by 2002:a05:7301:52c5:b0:36c:a281:1bc with SMTP id
 5a478bee46e88-37966a5ba74mr7873015eec.16.1794743665605; Sun, 15 Nov 2026
 03:54:25 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113145708.261530-1-clamor95@gmail.com> <20261113145708.261530-3-clamor95@gmail.com>
 <179474058020.3790083.7531788945003507652.b4-review@b4>
In-Reply-To: <179474058020.3790083.7531788945003507652.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 15 Nov 2026 13:54:13 +0200
X-Gm-Features: AclHuK-EzmuYPh1U1Wrw3n2IgQZOy9QQQk19QQZyaFRGFCYZ5HQfcbePna83mwQ
Message-ID: <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
3 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are requir=
ed
> > for the correct work of the CSI block. Add CSI pad A and pad B clock ga=
tes
> > with PLLD/PLLD2 parents, respectively.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-t=
egra114.c
> > index ec537efac692..08e425365469 100644
> > --- a/drivers/clk/tegra/clk-tegra114.c
> > +++ b/drivers/clk/tegra/clk-tegra114.c
> > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void=
 __iomem *clk_base,
> >                                            0, 82, periph_clk_enb_refcnt=
);
> >       clks[TEGRA114_CLK_DSIB] =3D clk;
> >
> > +     /* csia_pad */
> > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE=
_PARENT,
> > +                             clk_base + PLLD_BASE, 26, 0, &pll_d_lock)=
;
> > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > +
> > +     /* csib_pad */
> > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RAT=
E_PARENT,
> > +                             clk_base + PLLD2_BASE, 26, 0, &pll_d2_loc=
k);
> > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > +
>
> Change seems ok in itself, just a couple of things I'd like to check with=
 you.
>
> Seems both the CSI and DSI can use the PLL D and D2. Can they be used con=
currently ?
> If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
> DSI counter part does not have ?
>

CSI pad clocks are used only by CSI and CSI does not change rate of
pad clocks. Saying "DSI counter part" would not be correct, DSI mux
switched DSI clock parent while csi pad clocks do not touch clock
layout of CSI nor DSI.

Same layout is used in Tegra30 and Tegra114 inherits it.

> Also the DSI get the PLL through a fixed factor 'out0' but not the CSI ? =
is it something
> you have checked ? it just seems a little odd.
>

Yes, out0 is a fixed div2 of DSI clocks and that is code reflection of
hardware. CSI pad clocks do not have this setup in the hardware.

> --
> Jerome
>

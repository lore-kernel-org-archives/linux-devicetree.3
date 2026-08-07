Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC1F47669C
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109433; cv=none; b=lbWxbO3kEMpa1xQ8m9HDE1o4tZOIXFvEbWWrJDhRRZGUkNQeE2ftxy8a9hFjUfMMAZtJpGe7pdHgxEXop9UJBlWoOGelTPZlQ0NZ7fdt9EqpWxATeuHIOpFlxOp/nTb4FDpsLPfCbs2u3SnOZxe/g9+Qfpuic7cQrBESz6/BD/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109433; c=relaxed/simple;
	bh=lNRMCMZWJrIGh1fhRbztqbQIc9J7TxN7ZrtNGrtgNXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAntADJtLi2rXETl2SzaWKCs0TW52s23tUbJCqY4Q0irbztVLXzCRio+3if//EGu30F7CHoN/ZKV8ayDBqyyDp6e1tupALc3Neq5iNH2c6fIu3TorMMlH3tRekgPP3K/dUTKKecWOMsYuAjDGlZdl3JpNTlBnPX8W56i4eKCYWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c167c58f2so25000411cf.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786109427; x=1786714227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/AAuSUTI9BlhHsMbAPbLkKHE3Mv88lOoxgJOEPTw6U=;
        b=WKXDg2UMVpDRCjFaQab15PUUE1lim0EkAkKbhuXUt54bpALOiT1PFO5xq69M2hQRir
         UPDDJnP3d6615rIhQOnGtzr+a/386cg+iP3+sc9O63knNvyZnuPHMzUt2GvqetpJRmeT
         K9hQlwOuAiWRRiiFU7OPoIFuLNP1wNzqUu6prcWKqTL/qgrpCiPLbWqrxyiI6tQLp9ND
         z/WqmEmngSlemb2RJG3mPJ4ndfcBNo4dfY9/PjiGHCEZnbeNsYUFB+q5nOpY8s7lwZLF
         OMZK2CkBdS5Lw+PAIqNwNhv0c7N2yevDgUb0nzPcHdgcfrkJy7L30sZT+SX08LxU+/po
         aDTg==
X-Forwarded-Encrypted: i=1; AHgh+RpqvUpTxSbcHntRvhM/C+d/JSjRPA6gPtmyj2tAL9KRguULHFATC8hs6CZyGs/OLVO+il17Jar2GU6J@vger.kernel.org
X-Gm-Message-State: AOJu0YxRZ/SQdayeEb9c4FP20rosoiDzYD516hFPz+Q/qypWBx5e6ixg
	MQpCL2I9xLxpdi1mbX1MC/FCMTgLaBEL1lXWryo+V6mwDsrtGSavvCN8eJjdEKuc
X-Gm-Gg: AR+sD117fVjipQo2brkWoaTskKucQ5/ZhHTXvKCYRwvUIphOjThuc67oraD3deFpkY3
	j55hDEaeZSAwNO0Y0QVwxt5TNPPpsf4BLiRCiTuzgEt0o5GoYa6Jd8P7xF6KilFK3U+E5ye8hO+
	9Bm2uA6YKX7fHQIIyXM/r4LfoYK1GW8+zdN9d6qkLyiu6yKptAlZuFaL8yo6YjqIwHH3Ojdo0BU
	E7lLcRLz4PA8hHSEqqX4Am96AbphKIYy9wvfXDtpfWTRuLjJm2sv/uCbmmq9dGq8xV3zDF2uzOW
	6KZHRzQn6aF3ukHUPaIVuzxQbeyH2ox7lQyoByVXtd/c2X2YmsWZyxMBogqRVq8PTEIvNnvMn4u
	Kaz1mGoF5v7x40yjgRccaMVzinJ9sb4IjFuwqQ5PCY+MIRNkuJD3eTJqNBPm9pNl9WfrATShux4
	/2KSkI6waMDHKa+jAuOshxMHkQNtnGSgGihUVcJNdUtTXz9tYfUi5UaTAuZPY4Eld1JYrwt1tJ8
	9uyQZKbeiW7dW3CeZWpvxd0E+O5X3FeqWxjJw==
X-Received: by 2002:a05:622a:1482:b0:51a:8696:cb38 with SMTP id d75a77b69052e-52ce5f616femr241573831cf.7.1786109426627;
        Fri, 07 Aug 2026 06:30:26 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d1662af31sm11758751cf.27.2026.08.07.06.30.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 06:30:24 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-74ab99038afso1804379137.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:30:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoIsqTXRF67twcEoxHI7lQ6i6JgmJnc9ZZqqy5ax/F2kCk+gCwWKzYgtJ+N4v+uAlXxpdEkfTrgSAgh@vger.kernel.org
X-Received: by 2002:a05:6102:1491:b0:740:2d40:a234 with SMTP id
 ada2fe7eead31-760e934083fmr7749766137.9.1786109422395; Fri, 07 Aug 2026
 06:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260720-fractal-prodigious-spoonbill-86f534@quoll> <CA+V-a8tfCL58j2TvoO1VhhDAZf=8LB89R4O0SycLghYGf7Rr4w@mail.gmail.com>
 <2323f9bd-0b1e-41be-8c8d-6906b66b625f@kernel.org> <CA+V-a8sHbc9WSqmzrONjWbLY1+SSEhK3kGOjL9zmVmhSttD31g@mail.gmail.com>
In-Reply-To: <CA+V-a8sHbc9WSqmzrONjWbLY1+SSEhK3kGOjL9zmVmhSttD31g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2026 15:30:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwPdPwKV++3GBvm_yEY0pqvT-KxBr==g8LQFRvZkBnjw@mail.gmail.com>
X-Gm-Features: AUfX_mxDi0guSe9Khaez7xiSfow3Ijch9zm2XE5dr_dyKyhIvomQpIBNYO4wzk8
Message-ID: <CAMuHMdUwPdPwKV++3GBvm_yEY0pqvT-KxBr==g8LQFRvZkBnjw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 20 Jul 2026 at 13:14, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Jul 20, 2026 at 11:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> > On 20/07/2026 12:50, Lad, Prabhakar wrote:
> > > On Mon, Jul 20, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > >> On Thu, Jul 16, 2026 at 01:34:27PM +0100, Prabhakar wrote:
> > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>>
> > >>> Move the RZ/T2H and RZ/N2H clock controller bindings from the gener=
ic
> > >>> renesas,cpg-mssr.yaml schema into a dedicated binding.
> > >>>
> > >>> Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/N2=
H
> > >>> system controller integrates additional functionality beyond clock =
and
> > >>> module-stop control, including reset control, clock monitor support=
,
> > >>> write-protection registers and other system management features.
> > >>
> > >> Nothing of above differences got reflected in the code, so I do not
> > >> understand this reasoning. Binding is exactly the same as the old on=
e.
> > >>
> > > A syscon regmap is implemented [0] as part of the RZ/T2H CPG driver.
> > > Since the RZ/T2H clock driver uses this syscon wrapper, a function
> > > pointer is implemented to handle the RZ/T2H-specific configuration.
> > >
> > > Also, as the initial implementation used separate device tree nodes,
> > > Geert suggested splitting this binding schema off into a dedicated
> > > file [1].
> > >
> >
> > I still miss the difference. Can you point me (can be short diff) to
> > actual difference in this binding?
> >
> Fair enough! You're right that the schema text itself doesn't differ.
> I'll drop this patch in v4 and leave the bindings in
> renesas,cpg-mssr.yaml (unless Geert has a different opinion).

Given you no longer add a bunch of RZ/T2H-specific properties
and subnodes, I no longer see a reason for the split.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

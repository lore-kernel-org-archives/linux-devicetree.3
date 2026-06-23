Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AD92E2286
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 08:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782203380; cv=pass; b=uNriy+WWqqUtE6I8Or/vYQ5nzr+i0z9lgcN6LAuUiG3/ErOCCiq9xHf+3Q09xsqiemVaDfFHpke5lS1Tsp9ZobepCkHnztAAcWPFZT9JdKxLjPFFreNBWu73xeOoGYkJRzIljT4S9WHj5anKCoUs69aqwFTxU5qKfshQygqG8Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782203380; c=relaxed/simple;
	bh=C+rVe3rgMlyulc0E1pMbdDXcZKdISk0r3L7hAmE6two=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzuSTeL/o8Io/2VSHFm5+onxFX145Izw0gRIoRqMsDA/INZqf6p9o3hpml+wGXD3v2shpmVDvp245FCoCHRnegWyE9sdOvMaoHiLbSIKBCr538ea7lElJNjSsmDLC5LaG85LbfsOMzUGqLYffW2IskvZclvBRyhCCLWjj3B2fro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NX2jRg9a; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NX2jRg9a"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-462ebd5d37dso5140958f8f.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 01:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782203378; cv=none;
        d=google.com; s=arc-20240605;
        b=Vl3y6qkxLjuZN4JCOpZhKUTTgOtWOBaEUs4YX6XW/pxwQ7inGhcw/qv8BGVcque2vu
         9KKvi/6/FafyXnU5oXo9YN3zCJwptXhnABa6FPVyx2kvTRqir1auj1EzLjncwrg5xUIl
         yJF3TvgeWo9v8yPjLf44nWvytUvo1J0JNEP6HoOOutaIqT4OdyAxohUUEHSNPhYIsXpI
         fPPRFWsqk+cagzQGtA0QUOmOa4AxaUx1Ghwvhct44W1R0MahwKUj+xBaTsZXs8WTe0XU
         E+OI84aoX9Bo9ahExRUgCWl7YqxrLGbRKCXXwhqJlWKT8sPsmyLInT+qhv9iglNrP6kP
         Pb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrBfCI0KWhncSe2793Dm3kx6USZ2APOlz/hUKpRJG0I=;
        fh=yvK00E5q8nlpFf+we5YXkHNcvtzBBoKyhs7o3ehG2x4=;
        b=YzA3QaRJizF4xTQzqnWlM9ZyKJ1ea6Y2JoIvPi1vriUmdeUe3P3V5cvUl0XCciLmPj
         w5LwjnnnGXP2SKLJzakgugYuhYXMD6SXqMFFsYt1NHrn9z4nt74fE9Vt/LU7CkqGvQZ9
         Gof1QDiSFes3Hhr0vky0CbllGRVs0PCz4l3rGPOZMKw1XidBeH9IdHwu3m+gi9aFiQFO
         POSwGLc5gDleVANAPfKFYGgSxA0yrR/AOq0GgxKIaBu1tMV5ZPGHthNKXqOFyLW9Y+gy
         ax6aIK3lhVOGFpmUiZ2j8XanYi8Zz3/IXjfM8/kwPfjj3ZEfkU+eKQxOvkuR/1v327hY
         VHag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782203378; x=1782808178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrBfCI0KWhncSe2793Dm3kx6USZ2APOlz/hUKpRJG0I=;
        b=NX2jRg9axX9TBTAw0TFksFRyFltIIlBDUJ/R1TUVoX4uRuUzeu9Q4/BLyoI/qTMdcN
         vwox3hajpR9s+XkRsvFh+x41iBOVOxNaDvXN56lACGbLR5+Lu/9KV/B6HZEyDZ0PgfZE
         aP7UuTnnJwlRGs2r7bhdNvHreBlUnQcko7ci7nCSWhQsxmN9PJI6IQrN3/7GVeBwF1Rw
         Nfj0kkqGsoOlwFPrnMM5e7i0bVFcXpn3uOAtT/GdZmV3bjlx3D8xyhbkZwryj9vTNcnL
         HSVRmMHrRDKuojRluNSssAKJXjqXbPDmQuqzk82BYSqKZRrae4INgRDCxYVDvtfSxdap
         wJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782203378; x=1782808178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrBfCI0KWhncSe2793Dm3kx6USZ2APOlz/hUKpRJG0I=;
        b=XsPrxvvAw6oUK4SRpJa9uhww8OI3ZBNra114FqtrF/xKqcUaQDjbOjy+2/eXTMfARF
         MJLOCMlYsLFr9MZPAMKCUHTBJ5TqCj9ws4ZqjdP4uOKUQw64AmiHJYbgHv9qH86mhNrD
         nrpNrzxVYP1iHgkHi16DTy4xR4G0cj6l5cvEG39GRUYZy0FPKXYSuo0bIi/1ydaH4TBU
         gFLFxlz8Pou5PLNyISHDQPH13uLTSdnC3r8cuzmTLPNk9DmM2OzRIfvnwH2izkXCIyUi
         StRpfLjtVbUbuvaayFBpSP4064VyVourFvQ4FZ+5GkYFM0X1DmWfC/s6I9zDfjEcNyXB
         GF5w==
X-Forwarded-Encrypted: i=1; AHgh+RryWlhzWsXTj7W2v+pztPAqi+4r9d1xbzFNXSP+Zeu3fg02AiLIujPAZtX50s++ibYp3r6W4xKlRnFF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj+d5J8GBfUJcJIT05YXnYBhID8iuc0n5HT2NX9y8DODKqBbaS
	33LZ+YODKi8PwghDoGQhROjgPNaSSoo4sAGYYKm9akwNrJ5ynJy98g1nS301fbykQhDGfDqtD2y
	15EvKdID1VVdwZ5UC3Tx3x9nsmwyEgmk=
X-Gm-Gg: AfdE7cntZaxR723D6gTXhLCSXX96XmZGU4Xi/vq5VAQwi8O+Tf3IGh+d7hwOXcdLCHF
	U+E47RnDCw29KlMzpW3dQDKT2z5NHfsAD61Cofh6WQFahZb8F79JtBH7eeZxqh6HqielgC6PDEQ
	hlrA8GxjUVNNArNp7HZFMuR/08tj19FjmGRRQDjjDfoLzXlvijBtOzoXuhlI4N8IlFehr2Iief+
	qRfPcip7t5BHUjrMf6whxrKPCYXnGIkxN0nuISJjLj6D4F28M/9z5t3a/N9mboY1rcsf10mijLf
	b5Z/1CmqFbst0l2PdHhX6ck8LQ/uQl56mygCRjLttTP7FzdrZSP9yxbWaUw=
X-Received: by 2002:a05:6000:4817:b0:464:c5be:37f4 with SMTP id
 ffacd0b85a97d-46add279a05mr2659263f8f.29.1782203377562; Tue, 23 Jun 2026
 01:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <50a908557bb3ce5f14b67396d1e73e70289a583a.camel@pengutronix.de>
 <CA+V-a8uGho2RMhreDgieOOZTggUALoF0bGyjdEEDvyL_75sAyw@mail.gmail.com>
 <fuefvecgjdqbnbvpvam4gmewmpmhofllyq2ootwi6cjqhnyoys@edjzqlh6fjw4>
 <CA+V-a8sRxoR96TRM2V3cFXS5NPiQUVrUJCWwkh7o10cGYPU9_w@mail.gmail.com> <txpkke2xogecipyetascqajgaxamd3ualcuhsibxf75llzcym5@xgcn7efcbmp4>
In-Reply-To: <txpkke2xogecipyetascqajgaxamd3ualcuhsibxf75llzcym5@xgcn7efcbmp4>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 23 Jun 2026 09:29:11 +0100
X-Gm-Features: AVVi8Ceuc3mOlVkEu2V82Unm6uncN0y20DQ8eINHTMm2bh1FOOcG0M9fbuSJgo0
Message-ID: <CA+V-a8tiRc0J74e73qLyLgQOey1GLNoa5VbRgpEN9ZCy7hH-4w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] PCI: rzg3s-host: Use shared reset controls for
 power domain resets
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manivanna,


On Tue, Jun 23, 2026 at 7:04=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Mon, Jun 22, 2026 at 03:53:57PM +0100, Lad, Prabhakar wrote:
> > Hi Manivannan,
> >
> > On Mon, Jun 22, 2026 at 3:30=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Fri, Jun 05, 2026 at 12:54:46PM +0100, Lad, Prabhakar wrote:
> > > > Hi Philipp,
> > > >
> > > > Thank you for the review.
> > > >
> > > > On Wed, Jun 3, 2026 at 9:16=E2=80=AFAM Philipp Zabel <p.zabel@pengu=
tronix.de> wrote:
> > > > >
> > > > > On Di, 2026-06-02 at 20:50 +0100, Prabhakar wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Switch to shared reset controls for PCIe power resets to prepar=
e for
> > > > > > RZ/V2H(P) support. On this platform, multiple PCIe controllers =
share
> > > > > > the same reset line, requiring shared ownership of the reset co=
ntrol.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renes=
as.com>
> > > > > > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > > > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > > > ---
> > > > > > v3->v4:
> > > > > > - Added RB/TB tags.
> > > > > >
> > > > > > v2->v3:
> > > > > > - No change.
> > > > > >
> > > > > > v1->v2:
> > > > > > - Updated commit message.
> > > > > > ---
> > > > > >  drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
> > > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers=
/pci/controller/pcie-rzg3s-host.c
> > > > > > index d86e7516dcc2..a5192e4b58df 100644
> > > > > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > > > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > > > > @@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_=
get(struct rzg3s_pcie_host *host)
> > > > > >       for (i =3D 0; i < data->num_cfg_resets; i++)
> > > > > >               host->cfg_resets[i].id =3D data->cfg_resets[i];
> > > > > >
> > > > > > -     ret =3D devm_reset_control_bulk_get_exclusive(host->dev,
> > > > > > -                                                 data->num_pow=
er_resets,
> > > > > > -                                                 host->power_r=
esets);
> > > > > > +     ret =3D devm_reset_control_bulk_get_shared(host->dev,
> > > > > > +                                              data->num_power_=
resets,
> > > > > > +                                              host->power_rese=
ts);
> > > > > >       if (ret)
> > > > > >               return ret;
> > > > > >
> > > > >
> > > > > I have a few questions about this.
> > > > >
> > > > > Can you move rzg3s_pcie_resets_prepare_and_get() and
> > > > > rzg3s_pcie_power_resets_deassert() up before setting
> > > > > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B in
> > > > > rzg3s_pcie_probe() without ill effect?
> > > > >
> > > > > Can you move rzg3s_pcie_power_resets_deassert() up before setting
> > > > > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B
> > > > > rzg3s_pcie_resume_noirq()?
> > > > >
> > > > > Those would have the same effect as the reset already being deass=
erted
> > > > > by the other controller.
> > > > >
> > > > Yes to both. I have reordered the sequences as suggested, and it wo=
rks
> > > > perfectly without any ill effects.
> > > >
> > >
> > > Are you going to respin the patches incorporating the review comments=
?
> > >
> > If I have not mistaken, no code changes were requested; it was just
> > that Philipp wanted to ensure the shared reset worked correctly after
> > shuffling the code around.
> >
>
> Ah, I was mistaken.
>
> > I can respin the series if it fails to apply on top of pci/next.
> >
>
> Sure. Please respin once v7.2-rc1 is released.
>
Sure, will do.


Cheers,
Prabhakar

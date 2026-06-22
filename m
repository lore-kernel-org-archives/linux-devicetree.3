Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563133101A5
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140067; cv=pass; b=J6RNa68nRWTMkoHsX+wVik4U9UTg+HCIiUwH1UBk0w/QPOQUhj5f6hCVkfRJf51ERp/hku7dWZ9ooBD18oAXHP3WG8tQ4TxbvT16HboHIn+O5aizquPVuAalG7+l589f2r4rPtBnu1MePB1aZB/gnYB8lCG7il7sGHtKE4zxnys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140067; c=relaxed/simple;
	bh=U1089BIw7iIyDBnxBwST4w5ZSkTY2BwrC/I7xAP7GTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aP1f/bVq+Xe0VBvPPKt/RtD62bOpqpJlR8P/c4RYGb201Qdq+GPFtaiWkPD4RkT/5GGzwvLzGlC1LAktoTQOufHBTHLpgLlXx2OqjzEnjAvDJpegIrbcQbcFpokeHObkCiAEpahGMTiWySo9l/Df4KUYw/1opd3BfhmLWP/KkiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnnMZjUG; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnnMZjUG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so39191645e9.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782140065; cv=none;
        d=google.com; s=arc-20240605;
        b=i5+u/irgDWzA9fJ7Ja4W5E2+BrmESssrwUaA8wh7XN+byCckQmutE1Ot7DnSsPdMc1
         nD76UsDF0giRRQ0yV4Mc3ge2NnHjLyQyN8hLR12VVVxk145yfz7VMVpfyipW5HNgk2C6
         Mi9F5ESXOZL4BLdTAV/VO9vd1YjX+C4JhjWQun3IhU+RX+j/fRmpLkyaQzgdYQ84f7oK
         Z6tZ2nps0sDX7c1ARE+yF+1KtuiEpWeQN5XKsxCIbvOqFz1ZCnAR7kDWSRlbM91ZExBJ
         QQcpYVMF5aJWqk/tSdrGF5pNspT/4YWOvojAEfXaX/c0/gIU3QMttaIhVrwr3QFAZvr8
         TkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EverwGFGy7q/WGbEqhoYn+l8o6lObHXXPInFSiUXHk4=;
        fh=edVXPwCofq4586U/hllioOYy0/zL+SjJInVA5XvJSfc=;
        b=L4eX6/mJkgnQgp5ssghk8HnqGiby/kpfuGR4sYGrov13KrxpVdvTr/GLiadtKqIOVD
         Yu8P0+BEIN5TWIpC0gCHl2/KfXbLbUNEMMufd8eqr2L2gzZQJ8BWszXtizE8C3XwQafY
         YUFq6I9vQxwgqJPfvgHcYx+WLPZzK9Yld+4o789HbmJhQOIQC8QLCH4ZP1GCLljJC+IK
         ++ZxN7ooJW0I1vcxF2SV0MsFmhNpNAh1OLvBIKy/iOWxqueimPAYhWjmRosmjbfkh+dp
         GVX6eaOyXZ8Ncc5IzsqssbaA/Co0b6ZaJFirMDzr0wB5jDFCguNjM5MzzMNbiHGRkg+C
         iYHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782140065; x=1782744865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EverwGFGy7q/WGbEqhoYn+l8o6lObHXXPInFSiUXHk4=;
        b=OnnMZjUGLY8Vd9Jq11a3ICcakyWkDJbmxP5GXQv8OrX0LMYVTGoi1cYdFdj9gMCXav
         aHeyFiqFvIOLHtNJ8bnKLwI/iF9IlinIRw5PcZ+eJm7eTjPYajVYjpeDx2KOgK4TRnjD
         kq8FmWyAfTTYQyK4GkXR/SfqDzWq4lzu8y+1GcYMOorwvPnVsNfJIfIVWVoEEjsB9fJe
         bfxFI0SNFSNlwpwgmy4I+q1Rso+eDayHBmmE29Ds5BnVfgRjEmYP+bIdj8vbab9nr+Pp
         trmJByfEbRTo40U9t7Yr4sWWA1rmKhqr5VIx4gqRjAhDJCZor80608z1iFzwJZO8ybIh
         3PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140065; x=1782744865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EverwGFGy7q/WGbEqhoYn+l8o6lObHXXPInFSiUXHk4=;
        b=b9RI2bTBNWvgLeFr6NAn+l3M/CRvd4lVhXEtT8KNojs7/1g2JZXrGgCU4VvCP9S3GY
         IhSP4bq5NjkNhvT/hV8nlnViq5lFTCxSaWf/nPEwva3SHzFj1tllb2KbzT1DI8g4Zvhy
         ZBA2PHAfDCPL9YdYhV+TIogdWfywTZ1iFZo6g9BC9Jg4EO6Nyd6104FxlWiR+m11FdXb
         70lMDcGmjGRoJ9wwtR7o6tToQ3dy4HREASnAjbc8UvmNwjyHIjo50Pjy+pn3rdmlqjw7
         97xZQyp13cXD7NI5/IxQR9V7mKGQ6lNOO3S+Cjt+/EnaTaxh0gujgvwMDCKS6fqG0Odv
         lL0g==
X-Forwarded-Encrypted: i=1; AFNElJ9KLJdlbnEkg1NRd9TjHxLpv4qC55/hW0nJFljbWug3us+RX0dqArfdLONNJSRqkbf4cyvcGKkvYVRH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3OFC/aEyMn00xdUJEGTv+XtlKobZDvPzq4NzFDF8rVlqwBsKh
	ja9gVvF8hqXbS1TLq12JdVcjcarSMNVXz+N68J4vkDfZdGLRyACfbfXfgNlwlr5NJ1ohkHVupvG
	+tsLCQ0CYQQXqm4V52x7PUFG/CbSkXoI=
X-Gm-Gg: AfdE7cnxJ2tAzw/lqyBnftteRUEyQUzNR0JBRH2fkDVmskbI9tPdbosKaU72ZwzA6A6
	r7vSg75+NEXz2GOOT9gJ3FoM7FovYAnjlIeQT9eKBZY++TwZ38BRWos+RazDDE6ltek3rbGDehZ
	/VsqQr12R6oi2tVFt6HBZ+hbel5826EqlgSWw9vN8BHWryFxXdxjEQ+2wS7Vq2jSUoVW3cbwe1X
	llAATOazjL5yjl54dZGEQ2dtrQHl8CZ94svvy/hYL+jEiME68z9vw0rRKDCr0lak6G3K67iTfR3
	KSp9ARJ2jhWSJWH4uTY2UWdF1VwO3MjJ3mMlUupgly2rM4xl9KdGAdIStg==
X-Received: by 2002:a05:600c:5489:b0:492:4668:27b5 with SMTP id
 5b1f17b1804b1-4924668299emr206639315e9.6.1782140064335; Mon, 22 Jun 2026
 07:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <50a908557bb3ce5f14b67396d1e73e70289a583a.camel@pengutronix.de>
 <CA+V-a8uGho2RMhreDgieOOZTggUALoF0bGyjdEEDvyL_75sAyw@mail.gmail.com> <fuefvecgjdqbnbvpvam4gmewmpmhofllyq2ootwi6cjqhnyoys@edjzqlh6fjw4>
In-Reply-To: <fuefvecgjdqbnbvpvam4gmewmpmhofllyq2ootwi6cjqhnyoys@edjzqlh6fjw4>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 22 Jun 2026 15:53:57 +0100
X-Gm-Features: AVVi8CfxL1LYbXI4i0sLlo6UNgqoA-R9n854OJS7t3HTOGk64xjVruCWhx7GIqc
Message-ID: <CA+V-a8sRxoR96TRM2V3cFXS5NPiQUVrUJCWwkh7o10cGYPU9_w@mail.gmail.com>
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

Hi Manivannan,

On Mon, Jun 22, 2026 at 3:30=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Fri, Jun 05, 2026 at 12:54:46PM +0100, Lad, Prabhakar wrote:
> > Hi Philipp,
> >
> > Thank you for the review.
> >
> > On Wed, Jun 3, 2026 at 9:16=E2=80=AFAM Philipp Zabel <p.zabel@pengutron=
ix.de> wrote:
> > >
> > > On Di, 2026-06-02 at 20:50 +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Switch to shared reset controls for PCIe power resets to prepare fo=
r
> > > > RZ/V2H(P) support. On this platform, multiple PCIe controllers shar=
e
> > > > the same reset line, requiring shared ownership of the reset contro=
l.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > ---
> > > > v3->v4:
> > > > - Added RB/TB tags.
> > > >
> > > > v2->v3:
> > > > - No change.
> > > >
> > > > v1->v2:
> > > > - Updated commit message.
> > > > ---
> > > >  drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci=
/controller/pcie-rzg3s-host.c
> > > > index d86e7516dcc2..a5192e4b58df 100644
> > > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > > @@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_get(=
struct rzg3s_pcie_host *host)
> > > >       for (i =3D 0; i < data->num_cfg_resets; i++)
> > > >               host->cfg_resets[i].id =3D data->cfg_resets[i];
> > > >
> > > > -     ret =3D devm_reset_control_bulk_get_exclusive(host->dev,
> > > > -                                                 data->num_power_r=
esets,
> > > > -                                                 host->power_reset=
s);
> > > > +     ret =3D devm_reset_control_bulk_get_shared(host->dev,
> > > > +                                              data->num_power_rese=
ts,
> > > > +                                              host->power_resets);
> > > >       if (ret)
> > > >               return ret;
> > > >
> > >
> > > I have a few questions about this.
> > >
> > > Can you move rzg3s_pcie_resets_prepare_and_get() and
> > > rzg3s_pcie_power_resets_deassert() up before setting
> > > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B in
> > > rzg3s_pcie_probe() without ill effect?
> > >
> > > Can you move rzg3s_pcie_power_resets_deassert() up before setting
> > > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B
> > > rzg3s_pcie_resume_noirq()?
> > >
> > > Those would have the same effect as the reset already being deasserte=
d
> > > by the other controller.
> > >
> > Yes to both. I have reordered the sequences as suggested, and it works
> > perfectly without any ill effects.
> >
>
> Are you going to respin the patches incorporating the review comments?
>
If I have not mistaken, no code changes were requested; it was just
that Philipp wanted to ensure the shared reset worked correctly after
shuffling the code around.

I can respin the series if it fails to apply on top of pci/next.

Cheers,
Prabhakar

Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300FA3E8C46
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744971; cv=pass; b=i/X2gX9PZHvCzohVYWr8bP+ZOqku6y/xH1VysOvgyxf/4cvzQp/yxPxeRQ1PrQFXxZKPckrfBpUpI22jzHZw9riwKsjoyfQN3E+Ie3U0lUKSQUl/J5+VgH/uvIZy3IjOUZ66klhU3nkrx1jQSxfpFCj3d/sENMEgy1dmS1ymahI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744971; c=relaxed/simple;
	bh=+/9wgcUIWX9IAAUfj8TCtTHYJM6EUs1rELw9Q2zMQWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ES+a5VNMpSJOEeyCGekbxedmxmPiToZ7Dx72G5lhf8G8mDG4N71hwPANCqyQWRvKaWkf4c5BF3ID7DkcfhaWCG8tI2NG00UiGBPiWONwq50w2bqhGVFGxPzmfQxDGmVI4OXslSk8gl0noDQGFo/feI5MBmW6/chcfWKSLu9y4HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqXNDHUQ; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqXNDHUQ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46ee68c3b7aso2929630f8f.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782744967; cv=none;
        d=google.com; s=arc-20260327;
        b=B9KnkT2tkuTDvlutcE0MZIBhrj5R0+ggO4jQiL+OqKUjHjIIKNqp0N2ObKtLQOBQLr
         iUQVbIoC2rTCYl5eSEZUTc1Xlf6KpXxh4evH3kHr1vmZMaoMcn62idfbEsA3sMO3bcmG
         +Vh9xR++7eqNj1P3IvpdAzol5wgD6XgcCuo403yuib12dbBtl/BDlUb9DN+2j8ZN5qdq
         bx13QN5xhBEYEF9ym1zJCoxZFOkh6sYZiOeO5oV79Bstqy04cWQ9tneUHSY3LlX4GOcD
         jF390DDSreQFWb47pUs7c8g1OL0hvctMy/CCgAcA9OOzzMTmv3h1nLLpH5z/bDlGuMM9
         RpkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cg0nj+nO7raxM91vFADNla65NdWnOShdokPbAPfZ4QA=;
        fh=4Z9dB/RRKRedVvfBwIcPiRbdf2B7qSMpij8PByGPl7g=;
        b=Wh2WF3YSpfr4U6SbI4+jzSQimF5xZgQa4TFA+jLb6VdIWfnpgOrh01xwC43rJwEM+5
         f2VvM9Ji4KEo3QeXou0SSMrrLMTdd53kGXHlUJorvVCs5dMAoXkomXFqAG8zQ/jsQNqO
         XNkqkiANnXCOkg6l9pAr8G+wcK8Ks5Om8egpt88enjArtp/ojbF0/fH+cA5D/o/LZ209
         ELUQ56tW/5BSj+n3B9yhY3InK8PrcEMT86//maNYvUamClDpGebUTVNT1+VpOcFGv2qm
         3p5UE9KvnYyv9m9f4ACYCXpQpOqSuTmnDGkluiw9wWwA6nRbcNRcNG1rt1LGhj8yqtXE
         VJxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782744967; x=1783349767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cg0nj+nO7raxM91vFADNla65NdWnOShdokPbAPfZ4QA=;
        b=CqXNDHUQGycD8TWc5Y829JYP/JedyVL5xNDdeV+MYl3nzObEwx7uplne30eoNOH/M/
         9UNrr1NK9cWIpKRaRAVEQK84HXKMIztG6wWYs5EBZ5J8SlFRGmSUo1PPYE5iCr+QRose
         T26AURsUxEarpwb/xY1WP07OeYJrK8C2ZUknI9V50alafJ7dSv+rJwVxQLQCOmyFtpL5
         I15zxAa4g4d5DLDVDDSNqYFZPcBe8dIcLZL0fHf+7Judz7WJo5trAtsmeYXe3p1Oip5K
         y4Sgeia7FO2jBBhC6qZ2Ul7akMyWgJHWXYlU2saQF7YxsLx3cBaRwfxF4UTvhR4FfZsp
         WODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744967; x=1783349767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cg0nj+nO7raxM91vFADNla65NdWnOShdokPbAPfZ4QA=;
        b=q0a34k1M8/c7Pg9PZdecHMbmg+KE9rQ2hCHnJc9p2iBjnHoQoPpxx2Y+3JKoSua3gN
         paKMriM8kgOju5P65OnjTMs/0/T6m2AwCslz9+h2ymQ4bbetOp6+boUJKlXr/gl9/ATZ
         nrUCTYtzesZ0js/Ms3TLnKPyWibVcaUPu99N8unYtPMLBwpmoXIN9Z9Yn9KN2QFjEiND
         TFzjTPqTC3L1yXWbPgZFfsyZECO0LfP63CxDko8YRQnZeAJ81kDEljia/7j1IGidarw5
         rm2hGnzjIrKyVILdStFR1hcba5GASFt8GWS1MrmQFEKURhrPtKgrrs4WkJT69PU/dST0
         RTvg==
X-Forwarded-Encrypted: i=1; AHgh+RqSoH2kidqLrP9kiCzJ/8PQEZLe8s09MKl1T3xDuL0DJU6zieXOX76d5j/+HfIQvhFLJ83v2IEtWP2Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdGM4DbJvp5kcRMmoz+RlWgeOtA1sLf4ggaUcYXt0D76p06zV
	tw5ndHpmVh22MAywKrvO/5ELym+vvKfdnvnkuGYRJ0tAGg9bxeoCS4t7iftzTi2W6JGwr30jcTG
	u8jGH5SLh1+6JPIZHgcVGzf6N25XBifE=
X-Gm-Gg: AfdE7clChCdeK9oj+hw8Sn1zVvOWrFFKdtnKtm6xiyd0Iin/mcfRFre+UCakphXf1we
	4HDTuzTfPiWuzZ+F58Hh/CKV+JqWH06btIos5Xx++fbbDpSmAnKZO8IrYtQ4yhWVhvq+oHIoKPn
	v1XTLn1HjlYMnyReFeki/n9G/JbvpXFoG01Oeu2ZbZQHcv9PJ/1iMy5mh5FzbdGPCuzGBGBbBkf
	O4CVmbXNwG84C15xl0YyCRBh5veJlQYVhA6sNvh4CUW/QMBwe8IPFB+EkXtMwyMPqgRvW5MG8gf
	lwaM3xczlZRIKWAV0em6QBS/sAcdbvM9X6geTr41Gqz74o3m27aDlKIFvTbncqlaTfCo3LaNyYw
	m5mAKg/hJfwufvzk=
X-Received: by 2002:a05:6000:4208:b0:441:1e41:194 with SMTP id
 ffacd0b85a97d-46dbfab53a2mr26248348f8f.17.1782744967392; Mon, 29 Jun 2026
 07:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622170733.1703585-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV-OWEd732BpM1XSJiu+7d+ABGYpxYUe8OUSkVV5X2Wdg@mail.gmail.com>
In-Reply-To: <CAMuHMdV-OWEd732BpM1XSJiu+7d+ABGYpxYUe8OUSkVV5X2Wdg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 29 Jun 2026 15:55:40 +0100
X-Gm-Features: AVVi8Cflxc-TFENMnQmfkdpU70UG_4X31nRwUCCV4ZYKWZbAtMO-azM9MIk3nT4
Message-ID: <CA+V-a8t=PGgB5-o5=oHVXE63_nZj5nA-ZmacPSBA4dx-99qaRA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk-common: Add memory nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Jun 29, 2026 at 2:03=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Mon, 22 Jun 2026 at 19:07, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add memory nodes for the RZ/T2H and RZ/N2H EVK boards.
> >
> > These boards populate 8GB of DDR memory, which is exposed through two
>
> GiB
>
Thanks for taking care of this (and below).

Cheers,
Prabhakar

> > address ranges.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/ar=
ch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > index 1f575ea23db4..a0e1e4b1f23d 100644
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -30,6 +30,17 @@ chosen {
> >                 stdout-path =3D "serial0:115200n8";
> >         };
> >
> > +       memory@c8000000 {
> > +               device_type =3D "memory";
> > +               /* first 128MB is reserved for secure area. */
>
> MiB.
>
> > +               reg =3D <0x0 0xc8000000 0x0 0x38000000>;
> > +       };
> > +
> > +       memory@240000000 {
> > +               device_type =3D "memory";
> > +               reg =3D <0x2 0x40000000 0x1 0xc0000000>;
> > +       };
> > +
> >         reg_1p8v: regulator-1p8v {
> >                 compatible =3D "regulator-fixed";
> >                 regulator-name =3D "fixed-1.8V";
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.3, with the above fixed.
>
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

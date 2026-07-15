Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7A04A2E0E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137297; cv=pass; b=mqA24Vnw+2AwrTn7723ds8TDuuiR/tTM5WPUdwnhVZS/HY9pSdW7T2z1hJZmNmY/8gQODckYPgsuis1lLBLzZuEDViDZ7hO5Lm8Eh3O+LIomqU2MAP1sE62r6dq2sq6cch9tzZ1ULkUeY4eI3h+ISdHArCi0kE3ycySBTn9NeZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137297; c=relaxed/simple;
	bh=dQW6TQ1rFh953Dt2vhupwt1QO2viiCbkjMu0LKVypn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0S16wt7xHN+CWkyPSKbmY0QDXif7HNibcTbokEaGxxHC6esv+H5Zv5gozbzqp82HkgzHpOWMuXN1BfnwZcszmawwu7c/sC7VniKGPI+3BayYDajT+h02Ct479u0ookQSZI3TpGscnSXmxGUfkvswipYo79Lb8ncot1Dik9K9/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keE8Cafx; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keE8Cafx"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8080651d2cfso10983757b3.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784137294; cv=none;
        d=google.com; s=arc-20260327;
        b=WUwzFriI0d/sX3yLOzy73PmEhEhwYS4s1vc0Fg6iVxH/SfkuEoLR7xeNXXjNdFhlrb
         cOoByz/laU9gq8MhLatHFOxbRcqpfVLa+0wb6wQUjJr3d5lG38nxfaCEjdUeYNl3X/qo
         87MbEbmwxnnG2eDewOI0Mvw4LMsvmHHTbzoDCQshIaS8mdcgTQn2xWwislShqHSU+lwg
         J6BsDilKVSyJzO3LDbvSVuEhtSK+5VjN0XHxya30V85UqAQU/H95PlKci278fENIBHy6
         ZAHBxTNPr6Zvt+B/Q4TBhkQzde7YAHahRwJGzFrDbXPLXFBJAuoGom4YwlPrc0B/A3yk
         uH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zg7A5Jpo8DbdBBYZQVt5X+er30m85xx835hMZvBqipc=;
        fh=eMEAyXaBrRCQ2yIO3J4jteNRsC63LFObw+2w67APfGc=;
        b=BAVSJO07DXPVpnUMEqsqAu2gq37fAwgQ1LjtIYZX/E3M4NcxX4wPbn37pbVaXGLb48
         cMHnnxZeyHtCFdl9m5S6lynHzCF3XlefvDGTLU8G8tu30qYWaSBYny5s99WDfTJ844d4
         dftQ7jvoQM9gEP14zXrr13aZ5ugq7n+KdzPzePXTn+AcGgIIMFtp23dlCFmWTvHg/tmM
         cyuP8pqgxuXX49AagWL/MLWJyQyhz87DWR4DdZNX3OKbDmNnxAOAtAdoyIEjaRpTa5J3
         o7hHbkZObD89q/fC3V3BP0t+t5OtSNYDc9Yha9GwdEgVT2hkN8Oztd0MWKZHCR356cP7
         GtNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784137294; x=1784742094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zg7A5Jpo8DbdBBYZQVt5X+er30m85xx835hMZvBqipc=;
        b=keE8CafxvhAfvlAbTCC8APgWNgLG9v0NUd9rQN8AAqXDNAVznN/p3F0feedR4L45MK
         IbX3Il31eDMIzgcD7W7AvsnIhL+JYr3WH7dsxBL3o7qT1CeiQybcIxIJv+ZuayO9Ik5m
         Fg4KGhht50htQvNKqXPYElFQfv7DtZjWoLXDiJzhnsrCQIJ9CyVeOjnybfuXT1jtfpyk
         rOZRkzuy3W8PmMzQ6UTSeDy0lOewXILUxFLHzCALag0jVqa7TbP6MtNALm0walEXda+A
         polnloDiHeZZ+2AmI+F1M65Mxcs0DjZc1BSKa4FGgz84MnIxuMh8fcmOfuhkgvzFGvQT
         0mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784137294; x=1784742094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zg7A5Jpo8DbdBBYZQVt5X+er30m85xx835hMZvBqipc=;
        b=LtsFkUuISicktGyBbeATvkGDUViqGCY95QklHe9HuQHsjXzp7Vd1YXiuaPs2T2XcvS
         hS1g9bMcxVb1ofbo9YGjnJaqsI3VgF5rhdQvNpjaj53gJTsEG9scYNR5MEHX50Su0sri
         jhF3oF9Z0JFuSiwBwL9bPne24hFsTMdW50e2ZbpE8fAoji5Dj2vBQsEuqFch4Hh/bLM8
         Od7I18np+G21BNUjHAI0NNgSNxhQ08czKcUuUYsyqwudMnmfeRvcooSZqb56cGAB2S+f
         MmqBcMwttwJ6HHdzIme5vgYK1ZyhDG0KFmMe3Jm5CiTwi52mNq9iPGQcbo+vQZt/sIwP
         GOaw==
X-Forwarded-Encrypted: i=1; AHgh+RqD1I6Ot1Xs/CAUHnAcOjJflcj5rnHDI9uXnytL/LMQu0TejksM00AfG2QDiTl8tdGIHjmQcfZU8zXt@vger.kernel.org
X-Gm-Message-State: AOJu0YxKGt+BMcNXDMnX2w0naGSPkstgqiNIm6Bt/y7HFvgewu6xxTNT
	uzsjeIIzORDD1RzNAtlls4BhKoUqFaeJLJA5XyKrgnJVCqeZE5lzi7vO7NsFppatCU0b8EgrPDv
	OvTXNNK25SW5X0RbiSHNThEwoEyT+kUQ=
X-Gm-Gg: AfdE7ckLzR7msIGZuJHy9akKltanAAp47w5DQ3HRmTygaEvxunEEiBJjDZr5zWz/6l/
	IKz1xuokTrtTgwRg0UQsf24rzYhsVedjmtJyntQv4MNyyjSuXnSFKs3yIx9Hld/87JkKySXibVO
	ZNsvXUdd8NfWhGrN1BWLjvqHThmQ0gyUI01qE/+pU5mzHAmS+7aHvz9pFC9/kN16QVa0IFJp2fx
	NREH2DF/zJzwwK6xVzIhAJQ3HJckxi3loNT6BNU8tAXOQItgff1cmJmbMaSBZZai/r5qlbNA4G5
	osGv+5r870ljVhIWpB9TwJn80ecwHjQ=
X-Received: by 2002:a05:690e:1447:b0:664:d93f:b5f2 with SMTP id
 956f58d0204a3-667d7a98cdcmr11438958d50.1.1784137294186; Wed, 15 Jul 2026
 10:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715051939.64652-1-royalnet026@gmail.com> <20260715051939.64652-2-royalnet026@gmail.com>
 <20260715055448.AEA021F000E9@smtp.kernel.org> <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
 <aleBPE5YHlC7pLpi@venus> <CAEWPSH4AYfSR_DBcLFr6a=SJxnAAcjoK612v+g-TpP046qTBmg@mail.gmail.com>
 <alfCQd689ATJOdwM@venus>
In-Reply-To: <alfCQd689ATJOdwM@venus>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 19:41:22 +0200
X-Gm-Features: AUfX_mxAn0tlPy3Nu6Juugzw1ag0FrnBRekTl-ObKL4Q73o9n5lkkPOvfoeeM0s
Message-ID: <CAEWPSH6L79Kb9wQna9Cg8yGMJAN88__PwsuXvA+oo+fPStLoYg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sebastian,

> Not implementing all features in the driver is perfectly fine.
> Ideally you return -ENOTSUP if somebody tries to use the S/PDIF
> DAI interface instead of I2S.

Done for v2: the codec registration now exposes the S/PDIF DAI as
well, so the DAI indexes match the binding (0 =3D I2S, 1 =3D S/PDIF),
and hw_params() rejects the S/PDIF interface with -EOPNOTSUPP until
that path is actually wired up.

Thanks!

Igor

On Wed, Jul 15, 2026 at 7:28=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Wed, Jul 15, 2026 at 03:19:54PM +0200, Igor Paunovic wrote:
> > For completeness: the driver part of the series currently wires
> > up only the I2S interface (DAI 0); the binding now describes both
> > interfaces as per the hardware.
>
> Not implementing all features in the driver is perfectly fine.
> Ideally you return -ENOTSUP if somebody tries to use the S/PDIF
> DAI interface instead of I2S.
>
> Greetings,
>
> -- Sebastian
>
> >
> > Thanks for the review!
> >
> > Igor
> >
> > On Wed, Jul 15, 2026 at 3:00=E2=80=AFPM Sebastian Reichel
> > <sebastian.reichel@collabora.com> wrote:
> > >
> > > Hello Igor,
> > >
> > > On Wed, Jul 15, 2026 at 08:55:37AM +0200, Royal Net wrote:
> > > > > Should the constraint be set to 0 to follow standard device tree
> > > > > norms?
> > > >
> > > > Fair point. The current RFC wires up a single I2S DAI, and for a
> > > > single-DAI provider 0 is indeed the norm -- rockchip,dw-hdmi does
> > > > exactly that for its one DAI on the TX side.
> > > >
> > > > The reason I picked 1 is that the controller also has an S/PDIF
> > > > audio output path (the vendor driver exposes both I2S and S/PDIF
> > > > DAIs through hdmi-codec), so a DAI index becomes meaningful if that
> > > > second path is wired up later.
> > > >
> > > > Unless the DT maintainers prefer keeping 1 from the start to avoid
> > > > changing the cell count if/when the S/PDIF DAI is added, I'll switc=
h
> > > > to const: 0 in the next revision -- please let me know which you'd
> > > > prefer.
> > >
> > > It should be 1 from the start as the DT binding is supposed to
> > > describe the hardware and be stable. But in the next version you
> > > should look into updating the commit descriptions to be less about
> > > the kernel driver and more about the hardware. Maybe something like
> > >
> > > > The HDMI RX controller has two digital audio interfaces, one for
> > > > I2S and one for S/PDIF. Allow referencing connections from audio
> > > > codecs to these interfaces by documenting the missing #sound-dai-ce=
lls
> > > > property.
> > >
> > > Apart from that it makes sense to document that argument 0 means
> > > I2S and argument 1 means S/PDIF interface in the property description=
.
> > >
> > > Last but not least drop "A value of 1 lets a sound card reference
> > > the audio DAI as <&hdmirx 0>.". Instead you can add this to the
> > > example section at the end of the file.
> > >
> > > Greetings,
> > >
> > > -- Sebastian
> > >
> > > >
> > > > Igor
> > > >
> > > > On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM <sashiko-bot@kernel.org> wr=
ote:
> > > > >
> > > > > Thank you for your contribution! Sashiko AI review found 1 potent=
ial issue(s) to consider:
> > > > > - [Medium] Incorrect cell count constraint for single-DAI provide=
r.
> > > > > --
> > > > >
> > > > > --- Patch [1]: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-r=
x: add #sound-dai-cells ---
> > > > > commit e6b0bac0b97f568ce749084e6c1e728bcd258b10
> > > > > Author: Igor Paunovic <royalnet026@gmail.com>
> > > > > dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
> > > > >
> > > > > This commit adds the #sound-dai-cells property to the HDMI RX con=
troller
> > > > > bindings, enabling a generic audio codec to capture incoming embe=
dded audio.
> > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hd=
mi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > > > index b7f6c87d0e06a..83c10d9997c8e 100644
> > > > > > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.y=
aml
> > > > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.y=
aml
> > > > > > @@ -78,6 +78,13 @@ properties:
> > > > > >        The phandle of the syscon node for the Video Output GRF =
register
> > > > > >        to enable EDID transfer through SDAIN and SCLIN.
> > > > > >
> > > > > > +  "#sound-dai-cells":
> > > > > > +    const: 1
> > > > > > +    description:
> > > > > > +      The HDMI RX controller registers a generic HDMI audio co=
dec so the
> > > > > > +      audio embedded in the incoming stream can be captured. A=
 value of 1
> > > > > > +      lets a sound card reference the audio DAI as <&hdmirx 0>=
.
> > > > >
> > > > > [Severity: Medium]
> > > > > Is this cell count constraint correct for a single-DAI provider?
> > > > >
> > > > > Looking at properties:#sound-dai-cells, the hardware exposes only=
 a single
> > > > > generic audio DAI. Requiring a cell count of 1 forces device tree=
 nodes to
> > > > > use a non-standard syntax like <&hdmirx 0> instead of just <&hdmi=
rx> for a
> > > > > single resource.
> > > > >
> > > > > Should the constraint be set to 0 to follow standard device tree =
norms?
> > > > >
> > > > > --
> > > > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/202607150=
51939.64652-1-royalnet026@gmail.com?part=3D1

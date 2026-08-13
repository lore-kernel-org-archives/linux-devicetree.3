Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43BB35975
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604862; cv=pass; b=J1vlatoAn99xwFTdfm7IixwNfHiK4xf430dOvXfuvXipowSWoXNGfeD1qgcFJAg8bMj9996GB7ZPTAz5n8fHjOhUMg+TkdxWhOZgBOWd0GAnrzb8UG2HpAjFzb6JAzIryLsGv/4ST5BDOTUMSDo9a87dv3LP0vqw9ZxF6vrfKFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604862; c=relaxed/simple;
	bh=dp2Ah3Jwmh/gxnQwhiJlHI+1ue3KxNmPH1XRHbvfACA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qow67Eqc4IcZ9KSHJQD/IIIjMd8gN2CZ9mMFc3uRqBCc3+ccJytJwj0y4eH8yho2JPC5KgpHDI4QDzZFUR3VepxHuOMaxhby9prUgqlRQWs8ndrISk7Y0BhLl8x+6iLxTen5yFta/K7yi/1s/5ocNxCTpLsdcpdp0v9VvXDu4gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYIZX/Fa; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYIZX/Fa"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-747355a8565so94911137.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 00:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786604859; cv=none;
        d=google.com; s=arc-20260327;
        b=Z3+WSTj+BZ00fM/R1cJvgy6atUBrSj3B2gw1NZqwQqxRW8ky/k73u0P9BZktMkGui7
         QLjQDZZ68XOvVVnnt1sAxcaN/uLOucvBdxB+SE37o32ohmVOc+/4VS7TZis6B6v+lTcw
         w0p1LjWsTzMMjnG2ipjfyFpnQtKbngHKgry2SDCB5myjY8aYrHZPqz5ikWKfEpE9/DcQ
         40QJsb9gSAgLSA6Vaf15v7UKxs3UxJotoFT/NvnLkUhRNWbqA02FfpLML1wjEfAf1JnQ
         JHhpMNFawDsh7Tj7o2v2BE3+C+px6anGgyfdN5nmhVtV1RKLPeofEDy6ztLKZQEEAxtk
         Zwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JawJ392oLiwqJSSKv/chS0lFTdfl550m6jZnWA87huc=;
        fh=EHGLQ1tVKl64oCaAiEoCiaGm/55klzT76TWlyZvqUGg=;
        b=iJEeexMDvFzQl7jB1UXTNRWojPuDFalbgd2XRDEEO3LFTyb1wH/GgBOhvPYxIGmy7A
         c6sWakuEvYcJf4ilcsqx5x3vWd7p6x6oPDJiCpC11uVvka3ic6+sV8+2bcak7ZTnIK7O
         hNkKFlQm28vDtj+blOenMecyb3k/k8PkHFdVAEcE46FCO8xlCnuEyjJA9E4/c+3HS5k4
         nI9MUKBfXK0Drq+7Uqies5gxxvopRielp/AV2U5Cu7iaMaw1Qf0+8NXJdoFR3YuVCTf0
         QSLTEbhRCoitVZZKTsYVtDbpOAeRzX+6qMSulLyLx9R/v6bwsVj9tzokuaxxWLlfTW7f
         rODQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604859; x=1787209659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JawJ392oLiwqJSSKv/chS0lFTdfl550m6jZnWA87huc=;
        b=fYIZX/Fa5gclE/jOLG6DI0FhjSn6YJgKg8BBjUN9iYID8IOWyo1fMNFla8mSRv7vVi
         ZvtWgKUwQ+Ssy8bpTTL1K9/f2BBWgiy5crpZMiBL4DFRi8Iq+qoxyraGNUB3SVoPeti+
         IkwxkUcJfCAjxKcRDvH+Pz6dwftJMvBxCzm31W9xyI8zhHJkNN+vXgnhWt4FVfAqHF2g
         Wc4thEvOpuFsrfQS5Ro+C29aIaA37HMW8SBXogXxmvPEh8sDKzhB6AH8q6JbxkDV3Qa5
         RVxq0vFhciDH6Qb2j6NpbFeSbNa1sPxM6r0SaD/c4BHf2adHvLrHeXslepv60TjThl3q
         02oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604859; x=1787209659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JawJ392oLiwqJSSKv/chS0lFTdfl550m6jZnWA87huc=;
        b=VCWYh3z8piGUL3pD05I7LOxyzEznJ3g6nbfnLCiMDn02ZEAqC8q/S/piGRTwMIUcXw
         kg6GtE4XJlcivzB6+cyS0vaFCQtMhaNNnAtvxRRD7LvF77YL9t4jwZoqaDkaDaMUQjqV
         TXlINCJix6viSRW78sZyoK0hr3tqj5fBUr8Rks45rgboj8MxLA+mmy/QUMxyBuuDGbHG
         z5VzP8FfP9JfRK7Ppq/pMBvy7L57cBIhWcqkGmSrEoCGP2N2XslMVgNJqsJ0ifTN7W0j
         vsJNc7xUKt7ZdPf74NsMHv7G8RFk09Ly65x6A9dpf5FdLSaEtxMMUMZqhiS4OOSmE50V
         ncsg==
X-Forwarded-Encrypted: i=1; AHgh+RpFhyBUfXW+v4vItwhlcB8apgcW38VUW5B6/Efwgof3CQ0LgZMPtvkX7NOjSjXzVM+df8CltGfZAhR2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg1gDSHkG9BBGSudIAeGa53OOK0ULjOTEQExmnpVTWLqctS8Ul
	WBS2c9zYR+C8ts8GYRzzUgv03CZTBb415H2b5egUOctpTPbkUTdn4WXUKXFphIoATlRVJjFQ3kN
	gqklNtQcSkPxnaxbhezSR1NT088oMrxM=
X-Gm-Gg: AR+sD13P4fKw5Gs7OseoqYuk/APH3qlnc3jlmejIhTLN28M2lpBOWemk3+S3Kqv8D0e
	CEtZFXOmIXh3dyDFV/5KqB/V6WH4xRTMduZWQIIPCmGlXFo7VslMoi3iE7pD4wuJ20qWBLqPQJo
	Lms696biuDCt5q6UPafVuetxVQLL+j/i6tEEb7wGKzxbGgrNG4UfQwFToztNyzi3jjllNlcIgeQ
	RGC1Udc5qxpWcljmH9fgjStgRx6nPBt+FjZq3zHQNAXedWl1r0rEEtA5dL1ogUJ8p5VxpYZPclN
	8k9BHh/vg2VET+VabirNjZyJyB4bQYvBF0YB1r63lWQOislk8gg2kr50rw==
X-Received: by 2002:a05:6102:f08:b0:745:6721:8c2e with SMTP id
 ada2fe7eead31-76db527b110mr828054137.2.1786604859600; Thu, 13 Aug 2026
 00:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-1-5d67e0efa6c5@gmail.com> <20260807135417.GA63178-robh@kernel.org>
In-Reply-To: <20260807135417.GA63178-robh@kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 13 Aug 2026 15:07:28 +0800
X-Gm-Features: AUfX_mz7a9dcIAK-s5cvIzuRv5XGFroygtfy3R9a9idtSFOSgE2XnApE3cVRlPY
Message-ID: <CAPBH0A8NjrYVGdPBegFo+DcZDL-YGRHAzC3MzDc33Gvamd_dHQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] dt-bindings: arm: aspeed: Add Anacapa EVT1 EVT2
 DVT board
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=887=E6=97=A5=
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:54=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Aug 05, 2026 at 09:02:29PM +0800, Colin Huang wrote:
> > Document Anacapa BMC EVT1, EVT2, and DVT compatibles.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
>
> Missing Conor's ack.

Thanks for this,  I will add this in v5 patches serial.
>
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b=
/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > index dd7996960de3..1c2656d99807 100644
> > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > @@ -84,6 +84,9 @@ properties:
> >                - asus,ast2600-kommando-ipmi-card
> >                - asus,x4tf-bmc
> >                - facebook,anacapa-bmc
> > +              - facebook,anacapa-bmc-evt1
> > +              - facebook,anacapa-bmc-evt2
> > +              - facebook,anacapa-bmc-dvt
>
> alphabetical order
Thanks. I will modify in v5 patches serial
>
> >                - facebook,bletchley-bmc
> >                - facebook,catalina-bmc
> >                - facebook,clemente-bmc
> >
> > --
> > 2.34.1
> >

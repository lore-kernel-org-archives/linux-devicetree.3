Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794509294;
	b=ZBzRfqatSX9Sic0Wp088a43ug1ZNY2i51qCbrdJOAh/3dZbvnYUOJVJmRrW4sBUps8C2
	 9Imbcx21wD64QeeqzTRx1/klZjpH0Qg1oqLLHUWsX1zTZ16vwmHNNKdQ5yRjWslSG2V9A
	 LXrP7Ja532jt61TT+lUWkKHk4togKUAODi+rqrT1c4DH5GyvAOO6nKkV0rSvP2Q5x7bW8
	 IWuzXY2TMIM1KDjMionPNZKn9wEx8OkmLj1dJzkMn/6PhhUHUguV/sXWUST1YzIMumqys
	 DKs1cnKxerX65hTgjSgEIAgwAVTi5vM6+tPQaEtJgH3afm8SjOJchpzMWFGpIl/SrNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2ZNo/BoPv1da9h6ldNRtbZX7H0ERFUHxFb1OvAOtsY0=;
	b=nKWgr2iliyzifyuiioMyJZPGNRt9yvSSTxmm546YQzeGdhIbe/wAi5vBGswjLsCAzpxB
	 rwaq3uzUuPatjPluI58BtQjdBnVyevGN7FIbOINehu3J7zFB3+9ofX0pwd72J4gegwpbj
	 KMCV5NH6QX+94I1f3YqKnUXlqazclLNrPbrFhXRXOEQBUqNhqVq3ALSuWgs/ciooGkTfU
	 Hle9gL4o6AV2RmAX0xsLVxIDs3KM6O7vbSkhMVQt/NMuEZvaP7N/8p/SKoRNffzUc5zDc
	 q9+9C1ILF+otEjGMiN6Z8aHbTnpjwYLPWMuAR7hyEVWwPZ/zxDeL+sqaPGzILOq9jvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xoVYenJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1BA606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C1BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xoVYenJ
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365d725440so422521cf.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794509293; cv=none;
        d=google.com; s=arc-20260327;
        b=Z4sBVW/UZsW4R0PtTBfLSIJado0WH023G+addQ5GKhHbQVoWCsQqsRAfnWhZxPkmXK
         H94F+UvR1jYpQBAPzEeQWZXKEy2zvA3zGzbkCb1YnMhNl8kXs8Z80wU276S6dkFeP9ir
         yyhpLumNzqlMXwpnWruJafNeGf+8ucoGcpyi2ViNGx6AoMbWk+C1lB9qiM9T+0UHhSVJ
         j5Au95DmcPGHyxQVlKX2//epbbsDrmlOQg/ZBN/m2RVy0vl4ZWJzWHA9cAXaczfoCcK2
         +KW6o7ToYjEHUmvmxZ0RxuFZWKxoIZGwhmEEJQ/nBUv3t3mcOw9N5040Ixs2IEdq8R9s
         s6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ZNo/BoPv1da9h6ldNRtbZX7H0ERFUHxFb1OvAOtsY0=;
        fh=rR8RR7x6TS8XwGDYyVue95saa2rE5FHx52LoxDMftYY=;
        b=e0fjhPbzr/uYYHaCeJOGw81ppEmLki51GiYavJdK/Opm8a6xet158LIywKVIFGNqIl
         T/jFvux/c295KhjHuuftHH2JYhb3berAoihSo6Vzq16qRVpaMfWzABs/ADVYRvvvGPcr
         c3foXDAlAcdBXmfD7agEt3PqTeD4/M5lwHTqEPCsXK5ubXCPDEu93NKmJtukheGVHMA7
         jOQbaH0JCU2+5Nb6ejDTKgBhZWFNDT/oWE2/EqKWlYPcFp5GKoGU2FB0Sg7XluHkkgI/
         gc7JwJf/bEGaAknH2xCvaXFQMh/PJh/UedjzrJN1krJM6FlRWftcRRLv1kuDGDcdy1Ai
         n1fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509293; x=1795114093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ZNo/BoPv1da9h6ldNRtbZX7H0ERFUHxFb1OvAOtsY0=;
        b=0xoVYenJNOHYVK2tk3GQfolNIKeukJZ32f/YHV41rGHEFcfGWKY8DZAT5ilu1wxECC
         pRtnOL5FnjC8U4DbCjzMoj/gGseWk41079Yc8xscAIe6N8uXfVn6pMqstuXadzT18sdN
         Ei1OEWF7hhOXRwOyxBNzHG6y1ldj0MbN7OApgdP2vIOQWTHd9fk3W10sifNDgr3ordE4
         s8ZMzTyHKM1/LSLY8UmNNPt+XjoYFIbkELNNsLNkLdD6dz6HmdV+JY0tEe1YRKBCeCCh
         Sa5thdQu4rhEJCkhziV/TfDJ9BSfG7fAcXteNGgJLKP5ovJVqoFaoWuZxe22+FBRPT2P
         Y6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509293; x=1795114093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZNo/BoPv1da9h6ldNRtbZX7H0ERFUHxFb1OvAOtsY0=;
        b=haM5IhRyxBWsgzNkQqGBC2CNOmKjbIvY9v+l3HcZHwr9ZSFPyiVe6hO9ti41mQbXsO
         EqqnZaolT/cccRyNYCnfil5/0ZXLAyq7x1hBuJCdCN5pE4UylHuzN03RXOkk/ThbEkbL
         aAstBzL0g75QmbyxWD1hWcQjdVw1HHdwcNfR7ecg+mz1RQTt5k4RxAWI6AqNLYJMRh5F
         Osyy2Kq4IYClshqBy7hFljef4UXS2r7trvZhvkclMFY1zMT/iWNWuZJEG/WYZOm4wvXC
         n2X46FI3jpmPUHiXpDu+6hNUvEjyEfx0RQG6t9TU0IXQ099jVqmP/0Eg4T8j2xG6KJ2f
         B21g==
X-Forwarded-Encrypted: i=1; AL+hErGDoCPu18CbBQRbLJG8UO5/32oFWW+Rahnwrvkc4LFVruXg1csFRsBMPPWhan0eu5fEsezgbBrATjru@vger.kernel.org
X-Gm-Message-State: APuU4Z/o2+Pw0XTe5zx6gRRqrrGc8CduURu7F/IRTl0c0p/7/xA2H+Fh
	d1s8yyIJVoHt+hC+NNHL80N3jqFmRFQGQzAw5Wj3q1tsj83r/fh3lqRv9x5FCpzbuPHvpLZytxs
	Jwwe+cfi/vIhhgfK2B2+WRwO/pjkHwejtrAKXqMI=
X-Gm-Gg: AYBFou3zO1eptxITp6/RGlyLDL3BAshw/ZVcC+gW6oiviVN8udaI6zf8Q87IRRxTg27
	QB/t8VzRbNHfuSkYAfovXP1BU4CW1fH7FPHdqhXzlvH0PUb1RoD8X3xX4r1DY3n2E2ofyvl/7tD
	Gx8H9sqvTaOHC1UE8ZgHRllm43N69h6MOJpm1TotUHT6DtW1+ksmyalfP/Yf65yhIzFF12X4KFx
	MNxUgm/GAs0VtBPILnqiHuLEAmgaOX5jUI7t7sxS81aFMmBDqugZv/9XcmMDnZ+zyErp1KPHfzl
	qtMp5vJH+wEB+Ea7P3XZ0TxIugLdLkivIY9CzCeqQXp5Vx+cxgwI8GI2Wd1DYPTsQCJcCXrpkp4
	YWNE6pc42W8kjAziykC3OOdONitZtsZxz605Vmzo9fZazd6XN/ahTV7p0Aw==
X-Received: by 2002:ac8:59c9:0:b0:536:5e62:4647 with SMTP id
 d75a77b69052e-55ac755ea49mr5719511cf.16.1794509292920; Thu, 12 Nov 2026
 10:48:12 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111212921.290857-1-artem122novak@gmail.com> <20261112-reprise-jukebox-41fb305e9044@spud>
In-Reply-To: <20261112-reprise-jukebox-41fb305e9044@spud>
From: Artem Novak <artem122novak@gmail.com>
Date: Thu, 12 Nov 2026 12:48:00 -0600
X-Gm-Features: AclHuK83CGLq-frSEcoEahwnbtEAvhllMZwb7XrHT3XQ7fzapMydAcTCyK9acmI
Message-ID: <CAPufuhZPs66hiMzHZPMLBiOAOjJxaePo=9OEvcxmxyQdKFxBVA@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: vendor-prefixes: Add Casio
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

I wasn't entirely sure whether this should be submitted as a
standalone patch or together with the board binding,
so I marked it as an RFC.

I included the vendor prefix in my October 22 submission for the
fx-9750GIII binding.
I guess, regular patch would be nice, in this case.

Submission from before:
https://lore.kernel.org/all/20261022063902.471383-1-artem122novak@gmail.com=
/

Best regards,
Artem


On Thu, Nov 12, 2026 at 12:13=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, Nov 11, 2026 at 03:29:21PM -0600, Artem Novak wrote:
> > Add Casio Computer Co., Ltd. to the Devicetree vendor prefix
> > registry.
> >
> > This prefix will be used by upcoming Devicetree bindings for
> > Casio calculator hardware.
>
> Why is this an RFC?
>
> >
> > Signed-off-by: Artem Novak <artem122novak@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 5471a06f93f1..f05475072eec 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -303,6 +303,8 @@ patternProperties:
> >      description: Capella Microsystems, Inc
> >    "^cascoda,.*":
> >      description: Cascoda, Ltd.
> > +  "^casio,.*":
> > +    description: Casio Computer Co., Ltd.
> >    "^catalyst,.*":
> >      description: Catalyst Semiconductor, Inc.
> >    "^cavium,.*":
> > --
> > 2.56.0
> >

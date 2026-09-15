Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789E4BE435
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503360; cv=pass; b=ErJOioqWyxldO37n1YTwnavez1vKEkQJDiatpa8c5luFUoQTIQ/CuNRDFcE8vJs9XwQUN1hqYO+AwmXO/HRlZrlACH57FzZ40OvNG0MSVMHJ20I8OdrfcH4DVMfaAs2eWNeP8aH90vx8ZQdSLRI43KlwgX3VzZ2CP77UT+yN1bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503360; c=relaxed/simple;
	bh=tIo4II1d9ForEs6449DJ6tBTc4LuD50qTRo8+K+5e2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wt/aNyzzY0oDXLEySTbadBhIcB6qxI4+4rW9ua5ucSdseuJjJhuntgzfwMzgRhDYe3AjxpTdGrZsrBBxcCyTt5UH0KTcys353YRVZh6a1QVMfjKGqis+6Y7eUgdesAOWzkvhQzJmp4Xx0y53KJ6Tc5kXEyvAaSlXMaHbtIubqoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMFK/xdh; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMFK/xdh"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5f3317027so36936a12.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789503350; cv=none;
        d=google.com; s=arc-20260327;
        b=FMD2kUGHxZLUWvMTTy32fw+X72OHuUnK8sedWjF4URlJcziyua2JiU0xYVoRsVLS7L
         nyeGSVuikhDkKKCzFLA1J5SBguMVC2XL6zwHAllm/usK6ylQFBOVptzDxG6aLHu+dnrP
         3xdJ8p69Ebza3g3ZN7vdQy+wuk0AqlILUsPrJIb/vTuhB0B2RNDCUwv/cgoSru/AuysE
         GSV3kMnlG9qFJoW1sDQ/6oQ88Pn13FEnhmQ/C73Hii7OFeUg+z/s00tczBwdoibD96tL
         nqw2w2wNraFwCnuabVyb5jRgsdr6MsdZ5g3JFnhSlA99N7OUyqrNa85iP/3lWNt5w+QA
         oGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EMk9jyFcs1z/vsVIU7tgrrT3h1+jFXhNZlrTV/0Lq28=;
        fh=Hp8d1PnyNehHxh8KzeQOy1/yfnr7oc0smYbqFQBQaHg=;
        b=cvHpkEfUS0uJ266X1tv7wmmkl4Ehisahvv5gHY6TKsM5fNTrc6/wJKr3Py/jdMoS8c
         ihj6lP2a7Pmzq9W5NbR9bCGKG5M+H+eQp48lkrf1LgvsVfKRX43MHnkv18xd0bbvrezO
         RzeHxd/e4jpfvju0ajDyrPXcjRGN6T/2tW8GZQMsiz8vBpKezA+1ZG4qKuwCcZAy7QJP
         E37WZ6k6D53stoRiRf7gqfr0eQCclW3dwhsHqyhIYdF9il0thu85rhX825xUxxOJ4VPU
         HS89Erxafc5P76bE2PBKX2f5bPJpq1NJ7NVGVoi1fBjWghrhbZzNuDPLYZVCHeqPoWEX
         zBkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789503350; x=1790108150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EMk9jyFcs1z/vsVIU7tgrrT3h1+jFXhNZlrTV/0Lq28=;
        b=kMFK/xdhuVPYWFau0SVnAOI0dP1+C/ya4QEGqAnK+/WVuj4My0qAoQvVI+BKoY1ZwI
         NNABdWF+rnRpE/BFKhqhZ/72374Gy9eqKQpfsepDHKgixJYqiLHKeF7uqSuwRIr+AFw7
         8JTPpKKSxCJQVvxWu8uSG9skZAQ2M3M9ggXG2ixYT19P0Ks5ehXSvpBZtpa4O59JsnUE
         AEmjUlBrtixnd++kPKKOnZG0n0ogjzJEPniFUASQttiJrfpK73sW0IsgwVTbUlIwDL83
         B8pt1JK0UJ20OQjry6Fy4j7Drm8AoJ0UIWSLyNEBfmWDCEDeQ0whVitGHVB5nO2aKI8B
         vaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789503350; x=1790108150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMk9jyFcs1z/vsVIU7tgrrT3h1+jFXhNZlrTV/0Lq28=;
        b=tEE7YvcHpPFRZR1X6oKQfK6n26vm2N3q6OYlz/z92YODaep1FGECnC4OUL0RnJkurX
         f80WDicBZvAMq1vJTqmDEjUH/KHxqymG/C+x6OqJe3OHuqzGuSFZvUqj4kYjOYJ5BuhI
         UsaTrukOtkbH7QA1WvB+/qenComBg4TeKTSKB5jUbW/DJ8udgnfl1/r6a9HvHB4/+FJs
         /XtVV75v3FqaUYDSjkfGK5leKFP1xtwFkAUurW563Tir1FZcDp9BPysGCNpb6wHuxqsX
         Tzrooy4O+VybT08+hXppf2SiyOENn4X334GtlhSN587NKWqMDrF5bmnxcNHVA+YdGjRx
         1/Rg==
X-Forwarded-Encrypted: i=1; AKwUvBztH8H9b+/XhaWyASbkKEhTowl3s/MBdSlGT6R5R0EBC2HNI6sLgY9VrOT3jy3aw8sTXtJGNF6ApbVQ@vger.kernel.org
X-Gm-Message-State: AFuF++nD5vjQ5EwumdYxEBbDHE4N+eWWkTCUZS+aSbNOO/Xoqut9leim
	/EaIi36BThOgEjioNk28nKSSwbxBGaIthjCATXyZYMeKVPhvXuFfclL4NhnsbgLLFwtSRK40s/3
	LzbEi65mcc0p80NwiYp0gV8/3Ebd7uoQ=
X-Gm-Gg: AYBFou1+fowwJaP7sy2UDGEqH2ok3jF3U61YnuoiImU/lJ++hHGAGh9+WG6gk86xh8A
	fzdSVkJr1p5a8N1Y8xb864zTTxhiMgy9g67NuzC3MyC3qGPBThPz3w4Wm8iJxTqMS6kde53zWsM
	yAFSlukTuueSdhmrij8eG6IEDQtlotasDh0vPzdbmVHOil5EPzYvtWmZ5pxPa8LukExsSS6vaGO
	lsdETvVYAzGrBsI5oIoS2miZdUbVu1+9hjya/qBiwBk6arBzUWBYT5syBLm+i5rNhlG9sicIrz3
	Zz+RASLRiU9zEzQQ7MNZWUCot2p5OrKsw6V+LNShCof4epgNM4MfLrA=
X-Received: by 2002:a17:907:94c1:b0:c21:7bf1:2c88 with SMTP id
 a640c23a62f3a-c29b86f6a30mr608631966b.2.1789503349926; Tue, 15 Sep 2026
 13:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-ti-dra7-omap-sham-fix-v1-0-c430f01b4e13@gmail.com>
 <20260911-ti-dra7-omap-sham-fix-v1-2-c430f01b4e13@gmail.com> <20260911082406.05e2a212@kemnade.info>
In-Reply-To: <20260911082406.05e2a212@kemnade.info>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 01:45:37 +0530
X-Gm-Features: AcwNN1WHlqVruIX69u_0BS3IFoNFccfPURE_yLQbZJm0y0g2wehRCyWKILewqPs
Message-ID: <CAOWyW_5s++Sz6EFEX+zGTca_-xZvK29B88UzoEzsaP+QavF6CA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: crypto: ti,omap-sham: Add OMAP3
 compatible and deprecate ti,hwmods
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 11:54=E2=80=AFAM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
>
> On Fri, 11 Sep 2026 03:41:58 +0530
> Bhargav Joshi <j.bhargav.u@gmail.com> wrote:
>
> > The OMAP SHAM driver supports OMAP3 SoCs, and "ti,omap3-sham" is
> > actively used in existing dts. However, it was previously missing from
> > binding. Add "ti,omap3-sham" to the list of valid compatibles.
> >
> > The legacy "ti,hwmods" property is no longer needed as TI OMAP mirgrate=
d
> > to "ti-sysc". Mark it as deprecated and remove it from the required
> > properties.
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
>
> What about also removing ti,hwmods usage while you are deprecating it?

Omap 4, 5 and dra7 already use ti,sysc wrapper and don't actually use ti,hw=
mods.
but legacy omap 2 and 3 still use ti,hwmods but I don't have hardware
to test changes.

Since omap 4,5 etc don't use it,hwmods keeping it in required causes warnin=
gs,
Deprecating it and removing it from "required" fixes the warnings for
modern SoCs without
breaking the legacy ones.

Best Regards,
Bhargav

>
> Regards,
> Andreas
> > ---
> >  Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml=
 b/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
> > index d69b50228009..3ef05890e13a 100644
> > --- a/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
> > @@ -13,6 +13,7 @@ properties:
> >    compatible:
> >      enum:
> >        - ti,omap2-sham
> > +      - ti,omap3-sham
> >        - ti,omap4-sham
> >        - ti,omap5-sham
> >
> > @@ -32,6 +33,7 @@ properties:
> >      description: Name of the hwmod associated with the SHAM module
> >      $ref: /schemas/types.yaml#/definitions/string
> >      enum: [sham]
> > +    deprecated: true
> >
> >  dependencies:
> >    dmas: [dma-names]
> > @@ -40,7 +42,6 @@ additionalProperties: false
> >
> >  required:
> >    - compatible
> > -  - ti,hwmods
> >    - reg
> >    - interrupts
> >
> >
>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333F309EFC
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786930830; cv=none; b=nijiqn9vqUr3rYcYpzb/pWKEQkHNPeoAY6bfz91sd8VnvOdJXAzJM/va1HhIQoVVLX1/nU0hyIE8oNosBSSky2Ku6+vFHy5ipoyHLhVS3vjlKJtTfS6FF2bGevfg8QNAjITai0KDaceTgEXA8IEiDk3jkkAZ3WXMUvjpSDZhP9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786930830; c=relaxed/simple;
	bh=+SFQS3Xql8qI5SrwyyrToKYdmyHcfdchvt98xd4AVtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEQjcASpjLDOHZ+b+7J7N8KMrNHQJhvUpwlibja5R6kaeXpfRn2StIXgf9l0w0n0aOp6IqvjhHPRXRv6MUpKZuzHTjeaDyNIbf6m91uiO+PXRmS2QO8EBEN+vQSOoaHIoKly2Jzo8vjIVT4ft5LSZeUyvxeANGUZ5gnrK098oDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihSSmwnn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihSSmwnn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100A81F00A3F
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786930828;
	bh=wII6hxnB1dc212LTMU6AIct1KNscBDOB/iEUH2KCUuM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ihSSmwnnc1yOyWDCnGpvPsjL7QCdNft89TZfep0jaX7LsslCU34fAnAmX3qOrJ2dC
	 jHc5IGfKEi00AyEDyuVacmQm2TwMEme4PrQjiXVMqglWhijvH3nqFTXUGqS71NGk2X
	 mVm8OJ8eRNUs5+RSQOJEJ0Cf5ismmtrzvs2BRhWe/4AXq1chDVy8zUiAzmen6qPdH9
	 uLSgp3txjkzXkVyj8ZMAIojzt1Ov4v8qbJRKBPNzOiXxrjjy8qZrAXuO9xqCGuPJ6c
	 sbkRzJVUnAPkJGYGw34mAWCTeH3DIH7DVjXMUuK5xVCm6/XvqA6XCvEUGmFUDTPROp
	 9sEVGhluHTQFw==
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f904e80eeso2890318f8f.1
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 18:40:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpkwTMnR/R6MuWNtt6QDq0Oy1cuS+TLEk2uAbF9sVRcDuLN25iI+IO1rDKvY+Xr82yw+yGmGdp3BOjM@vger.kernel.org
X-Gm-Message-State: AOJu0YwlE2yKyvSvumlxrRlao8TNK3U0ydVTMyuyCr7/l1kchVEdkYsl
	hjANmDrUcWAYnhdsS6IFQusBOLYrcLE4G0N9O2ifjdtag3LL7763rbSypDqYBl7ndKROwm4KjQj
	+ySbEcgIphE6XYdsbVz9aiKWmlb7unzI=
X-Received: by 2002:a05:6000:4386:b0:47f:8ff9:c9bc with SMTP id
 ffacd0b85a97d-48160753971mr32144040f8f.14.1786930826717; Sun, 16 Aug 2026
 18:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815015722.1736831-1-guoren@kernel.org> <20260815015722.1736831-3-guoren@kernel.org>
 <TY4PR01MB144323654B3A6569BD23F918E98D92@TY4PR01MB14432.jpnprd01.prod.outlook.com>
In-Reply-To: <TY4PR01MB144323654B3A6569BD23F918E98D92@TY4PR01MB14432.jpnprd01.prod.outlook.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 17 Aug 2026 09:40:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQWkniMxoMfyNVinD_s-ECHQtAnf9+Qskb8d3Wg1YDRBQ@mail.gmail.com>
X-Gm-Features: AcwNN1U-V9USqqdyFxIKoqUZgLzbx7pRn_uMfX8m-Sf4VAPhfcyAolyCfwlzBZ8
Message-ID: <CAJF2gTQWkniMxoMfyNVinD_s-ECHQtAnf9+Qskb8d3Wg1YDRBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: Add Xuantie C906/C908/C910/C920 compatibles
To: Shengyu Qu <wiagn233@outlook.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, robh+dt@kernel.org, 
	conor.dooley@microchip.com, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 3:45=E2=80=AFAM Shengyu Qu <wiagn233@outlook.com> w=
rote:
>
> Can't we just replace all existing dts' thead to xuantie? So we can
> remove thead here.

Good advice, I'll try that in the next version. Thx.

>
> > Add equivalent compatibles using the newly defined xuantie vendor
> > prefix. Keep the existing thead compatibles to preserve compatibility
> > with existing device trees.
> >
> > Cc: Conor Dooley <conor.dooley@microchip.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: devicetree <devicetree@vger.kernel.org>
> > Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> > ---
> >   Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Docume=
ntation/devicetree/bindings/riscv/cpus.yaml
> > index 5feeb2203050..5aba1e8ed195 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -67,6 +67,10 @@ properties:
> >                 - thead,c908
> >                 - thead,c910
> >                 - thead,c920
> > +              - xuantie,c906
> > +              - xuantie,c908
> > +              - xuantie,c910
> > +              - xuantie,c920
> >             - const: riscv
> >         - items:
> >             - enum:
>


--=20
Best Regards
 Guo Ren

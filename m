Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622CA401A38
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553747; cv=none; b=difLvNerrFtRAbiq6bR5PGmQ1PczUB2zvvD3bicLd065jx3KcdXpkLqkHNQNFqcArXtFsPOM1VzzR5jd6L+8AKBVSgpKSGE+jyrks2Hs26PuwT1gK09CplMSLKxJujCKwQvB0QXNxoiRHJMsAEDW1nF/0MNeYX69RhOUfHneMmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553747; c=relaxed/simple;
	bh=EUAeZZiWir+om8O/lfmhWKlIvgnl/Vp0lghxn/70ykI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKFMYbnaQBomqjaPt0hSFagBVaYVVud76Qd8XkLXjZLwTV2ehY0mcWMON2gaTi27XFh0Bg4P6lyseJo4Ik50qV/ipD7Be+muVUdf5TGazNVjCEfkW+QS7Pl5cq3ZqJtIylt5y1b8cRuvC+YDYoasrltzyF3Q4u99NhmCRHhSzyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so144979166b.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553744; x=1778158544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nuQFrVM35wc/XdWiWZfeFiOqf6xuZFSJEgb1hfqaX5M=;
        b=KSRFQHjErDJpIley+AyITQQt8fdM0/F7WKWl+9Wd1sfz3ty/Gaxhqk4thBdy9tKyYr
         seBh+CRQDcgXEbVUOZehJY0mrf/JqOhRO/DIx456jwIugxh8EiYuPveOLoGN2qk+h50w
         4EJBH+UYkJQ/Lr8Yvo6GbENrUnAdF9LNs30dmg4AGJt/MydWeDb80pWuU14EdSCRDgmF
         2dQk2dKAqj9FgGNvASoyRq1OdlxRSPyElh+57uFcme0wNtHPwmKgIH0PK5uWK9T6hSpx
         EHiyz4hOhdPpFnw1b1iPg2b9+4bBvX2YWpMQeiQXQoHcQXDX6nXdCysisXg4+GLJJ3Od
         l8aw==
X-Forwarded-Encrypted: i=1; AFNElJ8fFBVjWFThfSP+gCdGf9AxTZrTUvfQtMoqIibCbg8M5krigKfb4EN9Gg63zfZM7OZiMQETWI6gz3/0@vger.kernel.org
X-Gm-Message-State: AOJu0YyG8+M2MwKQX8fZUYvkf7HOQZHdFgTkZSo9hCK3ccuO/TBsKEyU
	NmimnKfLTbD0pm9paUCS5MEkFna2mGSH/CbN8pxNzCtjDZULGSEqpAgCzG6rwStMeQo=
X-Gm-Gg: AeBDietNJo3uqoQOPMtVH44TEReT4Yf/Z0NN3pKR0tjOfqTNGkfiXH851F/jxQAufOz
	M+dr43pgqF2HlYtu7pz3U003GkyXunMo0DRig+kcxZr3OUjVF3v+W3I4rJfHNC6dseOHyBUsQye
	9lQqKvBVOOl2SCxDbfnPkJtHNugzOPjT440kZuwjdjxFKO6R/9SmKnn35k2RVfh2a3Ga46itCEg
	S65BvJ2Pk0JxA/Xamj5+BFsqcFQF7pyj5+Q9b6kHv0zrFCoxNhOo2JshdUSBLyaq+ZHFHPcRSyj
	cIuvuzvs76VLvNm9MQm5zckNVzus6auL8dHEnxQvW3cb9150r0rdFvDWpC0dQM6K7iD1hbZd9hg
	IkIleUCBjTS15o7h8QOjfouAxWQsyGLEPa2201sPak/X7lCvFtj+KEiPi2IcLFNAYh5bS6yNJ+q
	hEvueetsClBhKtLkt9LujhjCX2vksmxkKVivNOZOPVWbjMfBazTzcQ/RqMp20jzqcpXAVG7/ze
X-Received: by 2002:a17:907:1b09:b0:ba7:3578:f627 with SMTP id a640c23a62f3a-bbac6eb68e4mr167852566b.37.1777553744102;
        Thu, 30 Apr 2026 05:55:44 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb985e1d589sm231267466b.52.2026.04.30.05.55.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:55:43 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67785ef88feso1488390a12.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:55:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ91204kkX+XdekL52CE/CCFbUkJPEqh5c7Qcu0gjaujD5J6siwzg2qhfqPfm8OZV5Acvfqo1VACAtjt@vger.kernel.org
X-Received: by 2002:a05:6512:10c8:b0:5a4:175a:ce72 with SMTP id
 2adb3069b0e04-5a8522dd822mr1025501e87.39.1777553399625; Thu, 30 Apr 2026
 05:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251025043129.160454-1-iuncuim@gmail.com> <20251025043129.160454-2-iuncuim@gmail.com>
 <20251026210905.GA2941518-robh@kernel.org> <1935223.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <1935223.tdWV9SEqCh@jernej-laptop>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 30 Apr 2026 21:49:47 +0900
X-Gmail-Original-Message-ID: <CAGb2v64z9RMsGiy0skudn4cgo=RajxCho-vaXr5rUo5HPpqjPQ@mail.gmail.com>
X-Gm-Features: AVHnY4IT6nLdgfoMRlxWNV7nGADa-98ikdi3BEcPI2XpUYcTyVZLvYz4C1kzI-g
Message-ID: <CAGb2v64z9RMsGiy0skudn4cgo=RajxCho-vaXr5rUo5HPpqjPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 3:01=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Hi,
>
> Dne nedelja, 26. oktober 2025 ob 22:09:05 Srednjeevropski standardni =C4=
=8Das je Rob Herring napisal(a):
> > On Sat, Oct 25, 2025 at 12:31:24PM +0800, iuncuim wrote:
> > > From: Mikhail Kalashnikov <iuncuim@gmail.com>
> > >
> > > Add a binding for D1/T113s thermal sensor controller. Add dt-bindings
> > > description of the thermal sensors in the A523 processor.
> > > The controllers require activation of the additional frequency of the
> > > associated gpadc controller, so a new clock property has been added.
> > >
> > > The calibration data is split into two cells that are in different ar=
eas
> > > of nvmem. Both controllers require access to both memory cell, so a n=
ew
> > > property nvmem-cells has been added. To maintain backward compatibili=
ty,
> > > the name of the old cell remains the same and the new nvmem-cell-name=
s is
> > > called calibration-second-part
> > >
> > > Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> > > ---
> > >  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 56 +++++++++++++++++=
+-
> > >  1 file changed, 53 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8=
i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i=
-a83t-ths.yaml
> > > index 3e61689f6..b2f750ef2 100644
> > > --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-=
ths.yaml
> > > +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-=
ths.yaml
> > > @@ -24,18 +24,23 @@ properties:
> > >        - allwinner,sun50i-h5-ths
> > >        - allwinner,sun50i-h6-ths
> > >        - allwinner,sun50i-h616-ths
> > > +      - allwinner,sun55i-a523-ths0
> > > +      - allwinner,sun55i-a523-ths1
> > >
> > >    clocks:
> > >      minItems: 1
> > >      items:
> > >        - description: Bus Clock
> > >        - description: Module Clock
> > > +      - description: GPADC Clock
> > >
> > >    clock-names:
> > >      minItems: 1
> > > +    maxItems: 2
> >
> > How can the max be both 2 and...
> >
> > >      items:
> > >        - const: bus
> > >        - const: mod
> > > +      - const: gpadc
> >
> > ...3 entries?
> >
>
> Because old variant uses "bus" and "mod" and new variant uses "bus" and
> "gpadc" and none of them uses all 3 entries.
>
> Although, I guess we can simplify and just use "mod" in both cases.

Yes. Please just keep using "mod".


ChenYu

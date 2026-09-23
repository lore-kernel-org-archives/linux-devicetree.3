Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD823905F8
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153221; cv=none; b=jt8Tr9dUeUadnf0+f57UR12nQJIG6UNPDgaH+pD7ZSKIzYieH8NhC8I40Uo59gbmNoVR+VKMTAvF1GbeCreSZRSRiL/fnR20G4x+6PMjpt8BfTEgwGpG9QjbY6t8DBg5xrVMqsNgJduxEgbZQqmDQdKgcTKHera5wQ+z5NURfe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153221; c=relaxed/simple;
	bh=2sF6HcEmIN6i9YfzqHKDXrFIWEywko+HERAlV6bYON0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgNmfGczF5zK2UPytcd8i0K7wCxwQJOyJLD8wBTcbymU+cJNyy6Jppn8YE6jhkYDNngFa+F8sfYCU1iWNB8ewfISRhSPwNpxLyBaoawcfRZnFJjvIzDQjAa4Ljwxv0ZS2/NUzZ5c62hHB02kFgeG7nCcgBy3UzOhEkedu5WDVQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso426410a91.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153209; x=1790758009;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WH/722tAMbnl/tgB9xRugJRNbibX3vChJ1sMrdmR3wo=;
        b=oDV+sf28upQRtS5s1Oufi+Zmx4sLZ6Ffe+EJbyMMUgaQrATSIQajdV1OrI94Q96v6F
         0Omu84HhJKONCU+CJQyGufZWJNA7fhpiCOZY8A+p57kiAVfyiqHQwEf28ZwIVCcQdcVr
         7hPTJ1yfCxgFn2hux6aegPPrDtCZpwILkwxiMChEB7dlAzV4enOQ5Mcre679b3SGpI8I
         oy+ndZs79NEZAOjykR9GfaoY6uW5qK9pumje1ysTWh5s07fpGSshp7kuFyCEa8n5NBUj
         VF8aPC83Cv3uT0TJH0KVftWSHpoTv0ShSI2O9Fsvk48AfQLbrMKXx8bvSOghWsebGmrr
         F58w==
X-Forwarded-Encrypted: i=1; AKwUvBySoCVpngtJoxl+vPh60Ax6W/eomGwS9iZvu5NmB7DRzTyXPz/X+GIDNRI3IUgfT+ZG5M2/TYzCQ0Uo@vger.kernel.org
X-Gm-Message-State: AFuF++legImo7P0x/Roj5knIl72xP3kzwovShRHz4A3vWhtxBJTzJou0
	yHNSWBg8hkCw9Xnh7Kkronf3JYaVzoaptYSjgOFyTkYoygpqrqompj8ipHnxIW4gle0=
X-Gm-Gg: AYBFou0E7JglcOlpMkrbVoBW+zrwZ0wx7viH807kpAuPVXzs4Y5TlqP08c6hhe0x/LE
	75EnkzBmNoAr02gQA6VhtbBQzd3TPAx8VUQ5mQfpahSBggu9SA7WLuAu7OSqBN8ebno8yLLQTum
	/m63WQNR7Y1XwMpwt+ICLb1F5rRS06U4xZIVRX4PkusIGlmJPX4sYkV+T07J+1FfjLT13CshqSP
	31jh7FFR8nAaUhvBXnmh9wkmKmH10vnZ9TZdWjtB9J1EMcqJByXu8pj4uWedN24YEG6UeyZuZbE
	kofBbh66KEUMU+vZS6NolPWnIFpeRMRTWChHOjJAaZmWoCNGxWglOTRP6oRvltIXTPLl55hRKV/
	BeRLJgddqp8mcKNqbbMoRta4GEl8Avmk2wV0lFKQadiUv2Dfl/SZ7hECEEXZ4XqufddhnHBYLVs
	JJ0BvNwZK7cVGf7BrAnXQZNrayrJT7qIGaYnrdgPU5W6cwRdDdKhoIflMG66+eJPlQdPoE65A0I
	LPv5LK87G+OTbytdUA//lGmwBkqUKQhp3StCecrPaR2nACT
X-Received: by 2002:a17:90b:4d0d:b0:39e:6a81:5a97 with SMTP id 98e67ed59e1d1-3a07e716582mr1655437a91.43.1790153209372;
        Wed, 23 Sep 2026 01:46:49 -0700 (PDT)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com. [74.125.229.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae66asm4754563a91.3.2026.09.23.01.46.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:46:49 -0700 (PDT)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144df39b6cfso508852c88.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:46:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBo28p+fp3msy12b/qauEivh/boiTgZRI8olZKoXS8vgyLchQVsDUp0WckjVDKHMO/vBZ5PghKVZyP@vger.kernel.org
X-Received: by 2002:a05:6102:4b12:b0:7ab:d3f6:6225 with SMTP id
 ada2fe7eead31-7ac17ad2eaamr2011675137.0.1790152849573; Wed, 23 Sep 2026
 01:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com>
 <20260921131951.187981-3-biju.das.jz@bp.renesas.com> <CAMuHMdUx5-P97CFEH3Dif1g4K=NPfkDkE=3vrzjZB-TsyxqO8Q@mail.gmail.com>
 <TY3PR01MB11346F23E0C28056BC78DB36B86822@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346F23E0C28056BC78DB36B86822@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 10:40:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUEv6721mZZ4k4hNoGViOMH2-MZjihUMMD3Lzgjx3ZXA@mail.gmail.com>
X-Gm-Features: AclHuK9ykcDd56aG5463bJ4OIjALo7IIr4gtPS0DT59s2kcKIHbEZhe-4TowiIQ
Message-ID: <CAMuHMdVUEv6721mZZ4k4hNoGViOMH2-MZjihUMMD3Lzgjx3ZXA@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: can: renesas,rcar-canfd: Document RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Chris Paterson <Chris.Paterson2@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 23 Sept 2026 at 10:19, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 21 Sept 2026 at 15:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Document the RZ/G3L (R9A08G046) SoC support, which reuses the RZ/G3S
> > > (R9A08G045) CANFD bindings as a fallback compatible.
> > >
> > > RZ/G3L has 11 interrupts and 3 CANFD channels compared to 8 interrupts
> > > and 2 CANFD channels on RZ/G3S.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> > > +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yam
> > > +++ l
> > > @@ -47,6 +47,10 @@ properties:
> > >                - renesas,r9a07g054-canfd    # RZ/V2L
> > >            - const: renesas,rzg2l-canfd     # RZ/G2L family
> > >
> > > +      - items:
> > > +          - const: renesas,r9a08g046-canfd  # RZ/G3L
> > > +          - const: renesas,r9a08g045-canfd
> >
> > I am not sure it is a good idea to use RZ/G3S as a fallback
>
> I am also 50:50 to go with either separate compatible or as a fallback.
> Looks majority is favouring for separate compatible.
>
> So, I will send next version with separate compatible ??
> even though lot of differences which are scalable like
> "renesas,r8a779h0-canfd"
>
> >
> > RZ/G3S:
> >   - Selects receive message according to 128 receive rules,
> >   - Sets the number of receive rules (0 to 128) for each channel.
>
> I believe it is a typo in RZ/G3S HW manual as RNC0[8:0] it is 9 bit
> Field unlike RZ/G2L which has 8 bit field.
>
> Since it is 9 bits, it should be 256 receive rules.
>
> > RZ/G3L;
> >   - Selects receive message according to 384 receive rules,
>
>  256 + 128 = 384 for 3 channels.

OK, such a typo would explain it.

> >   - Sets the number of receive rules (0 to 256) for each channel.
> > These differences are not explained just by the different number of channels.  However, it's not clear to
> > me what is the real impact.
> >
> > > @@ -270,6 +283,11 @@ allOf:
> > >                - renesas,r9a09g077-canfd
> > >                - renesas,rcar-gen3-canfd
> > >                - renesas,rzg2l-canfd
> > > +      not:
> >
> > Can you really stick a "not" here? Yes, apparently you can.
> > Still, I find this hard to read.
>
> Other option is
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: renesas,r9a08g046-canfd
>     then: {}

Hm, empty block, Perhaps it can be combined with the other RZ/G3L
check below?

>     else:
>       if:
>         properties:
>           compatible:
>             contains:
>               enum:
>                 - renesas,r9a08g045-canfd
>                 - renesas,r9a09g077-canfd
>                 - renesas,rcar-gen3-canfd
>                 - renesas,rzg2l-canfd
>       then:
>         patternProperties:
>           "^channel[2-7]$": false
>
> > > +        properties:
> > > +          compatible:
> > > +            contains:
> > > +              const: renesas,r9a08g046-canfd
> > >      then:
> > >        patternProperties:
> > >          "^channel[2-7]$": false
> > > @@ -292,6 +310,46 @@ allOf:
> > >        patternProperties:
> > >          "^channel[6-7]$": false
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,r9a08g045-canfd
> > > +      not:
> >
> > Likewise.
> > This one can easily be restructured like
> >
> >     if: ... renesas,r9a08g046-canfd
> >         ...
> >     else: if: ... renesas,r9a08g046-canfd
> >         ...
> >
> > to improve readability.
>
> Ok.
>
> If we are taking separate compatible route, then this is not needed??

True.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

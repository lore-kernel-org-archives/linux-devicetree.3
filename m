Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F9346EC86
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794884; cv=none; b=biFNx7I/X/OYekEcETm0YyeOsjKgoCGyUf7bmUROhmYbMNc31VJ/GfbLbrM4zb6mUSrYLMePNGAZulI6tl2i0OxaixKfqwsAGQaj5UGXx+B/RPDQHypiaB2VPDGYrVIEsDa5603+zhERlem3vTHSNylDjn4jE8a4ZvpqBYX/pB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794884; c=relaxed/simple;
	bh=aBKCXRC1k4NcfO23sprYjoI6K6Bpz0LlCdKLEKHyjAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nm7SPMZ7mKQJQeFzyEdgVlEWqVp2Z2pdva7Xe2MNE/n5wqqCIcablfOEPliozFWvLVrEt27jjQDdr/HKOJj2mxMfoFnsnnIZtzBirNWFDJCGiEKegjd7fv+lyGA2KJGZycbUZdJhFvq5L4ImRPmuQ9aQRI/99GfmwIm6mrH/Zto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5e935294673so1448880e0c.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794880; x=1792399680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=II14nzlPS87+eKDd3Q5pRhl10wTigOj5K9H4e1LTQ1I=;
        b=gjw5Jym04DptFGJhpmPn5wfTc7tusDz/r7V2noDpH+cr20mYp6jwNp9owcRb0zGoVL
         aduWLrc/A7ebqlo3eDs110o6rp/cnGpZxPQbhvKARJoIjathuqXL4aDw3RMagzos+8AY
         cWrwKnpsaotW6JKjSEDKU4guAsxEAlUbo18gtad6oLQHkLqDsw3r5HH2DWkav0nLlbQd
         IiaNxpsJ33KAvALBe7hAhK2gi/Hihl7ddQUc9kNLOBTyxFnEg+d6z39VGa47wiI/bXLP
         ihVLeKVpDFScwe3nJKxBrd6o+3rLO7mSv65KK0x9+GARfRX5qlM5PsIcw06JzBGBylsH
         GLoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtbSlJ53NNK7lQ8Z5DKCv/8/MaT4xDr3fE/EXpCu1aAuRjHlQDwnrI19BTQ5LGAuuzWpWC6HQfm+uL@vger.kernel.org
X-Gm-Message-State: AFq9FYINoo3frlBG2Gi/ahF0Hzt3vw7gzyelLeuw8YM3/pbv2KYLg9eN
	rEF4p4sxyTy3+nvlDOp8fCpqR5jiNpgu2k8I2uYyw9c60MRKkWUGU362wj7PI/X+
X-Gm-Gg: AYBFou2O8099ejp+MULJQurON1uuI3fyDM+z0MTpmkey20QqtMbm2qcczJLKgzshhCf
	5Nh7xvWhbtZNlMPOZWttg8nnMzsNzcAe+6xSp0ZjtA04ohfXmVf5SjpyHtHfD1HQ8wq0VSJygO1
	ImYt1ddW3pehfdUwNd5C1UBOfAvbvxLmwOuqFnhqtOWC7ApiigsdBRLbocoTGF5lsmB/mT2IENb
	egGGR1oVDpIowz1A49l/xkzo9iSg+BxpvvM+lRpBXNub4sN/HRaJL+Fg0gzgYb+iMevCGBVXYA0
	Mrd37nW2ZBtG9PGXcS6xta05taHPl+7O4EPN7Em+nxhlS+5f34e1wK1VAHkyX2BoURQ07+1lAVP
	xEHzpSTU1U8Fxt9g2gPJ3vv6L5zUVNScuK+tIuRG3SchEySI1AllBCL4YNWXusG37DVqM7Z+cXJ
	7qzxoBXAEyZc2vqwDRNYu260ZQACXazYJyX8Vz0rZ/0K2aLWeU0qLEHyjNOZosT81ZmewLSpY/g
	R4DqEhyafwCkKUInJ6HoqoDlHe1ivWkGpEHv0Ynan1LgGbMusw=
X-Received: by 2002:a05:6102:839b:10b0:7ca:9176:ae11 with SMTP id ada2fe7eead31-7cb39f909b2mr1503338137.9.1791794880665;
        Mon, 12 Oct 2026 01:48:00 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003ae1577sm6102606241.0.2026.10.12.01.47.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:47:58 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5e37ce204cfso2012664e0c.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:47:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxnbgZyNg8daM4LTFemtNMp8trtEtZiy8iyxdSqkgVI4gbEcQx5viQBLRa4GNVqcp04RRMA9mZmx6xH@vger.kernel.org
X-Received: by 2002:a05:6122:3c4d:b0:5e6:cac7:9ff7 with SMTP id
 71dfb90a1353d-5e91e7ad625mr2370389e0c.21.1791794877726; Mon, 12 Oct 2026
 01:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
 <5bc1553b-465b-42d1-a4b0-66a514b897d3@ideasonboard.com> <CAD++jLmBbMUjO-tbiQ=+G8tf=4RyKQ+=h2y=o2C+g+NY7HsqQQ@mail.gmail.com>
In-Reply-To: <CAD++jLmBbMUjO-tbiQ=+G8tf=4RyKQ+=h2y=o2C+g+NY7HsqQQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 10:47:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXO+pZbrgG52zxOZ2W1aVcC9OT4v0Sd9C-HTHQXixksUQ@mail.gmail.com>
X-Gm-Features: AclHuK_P9aWhNfgjy-bm9dcFKp2tM6k860xhbXHPLm1PhxRGU9PV-PZpA0ja_mE
Message-ID: <CAMuHMdXO+pZbrgG52zxOZ2W1aVcC9OT4v0Sd9C-HTHQXixksUQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
To: Linus Walleij <linusw@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 8 Oct 2026 at 15:26, Linus Walleij <linusw@kernel.org> wrote:
> On Wed, Oct 7, 2026 at 12:49=E2=80=AFPM Dan Scally <dan.scally@ideasonboa=
rd.com> wrote:
> > >     interrupts:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    items:
> > > +      - description: Combined ISP core interrupt
> > > +      - description: Full-resolution DMA writer line-tick interrupt
> > > +      - description: Full-resolution UV DMA writer line-tick interru=
pt
> >
> > As with the IVC, perhaps an interrupt-names entry would also be useful?
>
> I think interrupt-names are only used if you have say 100
> possible interrupts and only want to specify 2. So you can
> look up the 2 you need by name.
>
> I don't see any situation where sparse interrupt supply
> would be applicable for this IP? It's just 3 of them.

How come we suddenly have three? There's still only a single
possible compatible value
Perhaps tomorrow there will be a different set of three?
So that's why you should add interrupt-names...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB313DA5C9
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601925; cv=none; b=PjTACeYPkylH834dstv3mTnDhp9wCvQ/dmmv9o8M22C+OgEiVP9s1OMH+0751+5oW45pe91byCy7F65+Sw8eExLeEcufr2cMg78mLDgnJdhdzfJhNAO8yucYHybm7rng+FSWqZGezg/gYzc2RQy/UP/g29hstb1vNSIxJfUA0sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601925; c=relaxed/simple;
	bh=9eBJ+rLvoPYL0juBJf2hbQ+0ADpXvr1r9kf9+5acKxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PK0gyGsN7hyQGjaqDZKxw9XHuZBusDXtXSxmMrDKi80zv32zq4YIwbE4NHeI0aAbnAQsvb9+tqwgb2Zc08eVklZo9e1Of6kkl+lafLWf3CXBgeOReYlf5YA43GallpnQB6QVh9nuXj20ZL01bZxHII9uoaaZ4hcsDH0Mjd04o8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ff05af29b4so729369137.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 01:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774601920; x=1775206720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ6H4EuAGDMRYfK/6DhwFkTF5tOZGWN8+jPb2MdRLyQ=;
        b=KCaZTs4GIVYhzMVp+kSfWA+4OPkzt+fYZQAdvslXuzY2XiGGaG5JqIdm0+j92wpxkc
         Lqai91IL8fzeiuhN2uGYqw+X2yL92Z/yZ6P6dyQYqrgl3b9vonMB9hpXTFSvtPZruTV1
         rFwF5EkPyP/lczUaczf2ZeC9tP05slXYFoyQaZN8hlZykzRzDNYHvxJ8ovtLq6Yyuxon
         VHZDsFf4urW+48+U+nqmqipwfSuDHn/0IKswOyRy1Q1FaGD0F6ACKC1SV2zvCsr13FmG
         Es3LabhbeioMek+tD08hJ5SlZFe7xtgXgQkTbSPr+IaSZTsPdH1EEmOnGQvxeRcFtAdl
         zOrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVyS7qS3b6K5Rkj4+SKnkEtYc9mnTjHkvcZlY+fXD6cYHZx4bbiCQ37UCFWuWQLsCzRZxp5kldHgcz@vger.kernel.org
X-Gm-Message-State: AOJu0YzQtb2TMuBWV/4ywZyyaH2zK7wLeNDo6ZV0I5QQlpuSg1aWZ5Um
	pqYfbETTtmHB2l2vcfaqH4khDl9RzXzmc3TjH8UMhbslLG8gsEiFrgLWl3wwaxb1HmQ=
X-Gm-Gg: ATEYQzwGDW/8SnGjyLikc/q0z0UvpxBcrN9PrKdj5dfgi1PA4yalJVKoyC6f8A+DFzC
	hIETMnws799O9oGnQAnTls3u8HP+t2HqrE1jUo4bcTRliIziu6OVlJo0JT4bQHJ2EKopuTVuttM
	LZQPt3RO4AmKTN7oovpdxmA7u5zrESK3jHNEnwAEMHjG1pgTvf4ZGvJWYlOS1fKYkB7FuuvHMXP
	F1vlZDCzJEv5k/9AmD8nuq4cj5sxb20GqqIwuk83qZ4wAtWBnSq5vwDNLBQM54nZNdzaIxMN0Kk
	cBaug+7LCfF/Bt0kBGzgyXMb5QMPsBSe8FdpE+N8znQK0PL4ZDJW9twbg6KgaxAFp/nDxYzF689
	F7Tp1VN3zK/bQC+vWvoe2aHv8U13Y0MUxMM9nMOAZYotJnMdx95vdGLcYa7mVeFOx9wVCBCh9G/
	CAVDufFL0Of2lphw+Mqr2574w6R+zsZpW7rKC83h3iA2q4HqEadRLeR4ix5BR/
X-Received: by 2002:a05:6102:5cc7:b0:5f8:e3a9:4135 with SMTP id ada2fe7eead31-604f90f6c17mr623534137.11.1774601920486;
        Fri, 27 Mar 2026 01:58:40 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604db6b31c6sm4754134137.10.2026.03.27.01.58.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:58:39 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6032ece43b6so452640137.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 01:58:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXim8i5l86vEE5xLHiB6m3uwRRShVqW6ZE2zC0pm+dbKNiTtcBOihxI/Z2VWdiJGRvUiGeCbSmTVBn1@vger.kernel.org
X-Received: by 2002:a05:6102:3c82:b0:5fd:ee19:8b30 with SMTP id
 ada2fe7eead31-604f936fc1cmr564249137.35.1774601918808; Fri, 27 Mar 2026
 01:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com> <2ad69ee6-9170-46dc-a963-71f327192bad@mailbox.org>
In-Reply-To: <2ad69ee6-9170-46dc-a963-71f327192bad@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 09:58:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=7uzaR2Zj==STiHEfqNf02vpEOOdwJuaqpzdxh_Q5-g@mail.gmail.com>
X-Gm-Features: AQROBzCCf0IPvdkdR2ssvnnJ_xpvUSm51aZ4644j2VSJYknbtlruA69dvm0rnxo
Message-ID: <CAMuHMdW=7uzaR2Zj==STiHEfqNf02vpEOOdwJuaqpzdxh_Q5-g@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 21:40, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 3/26/26 11:07 AM, Geert Uytterhoeven wrote:
> > On Thu, 26 Mar 2026 at 05:24, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Add missing cells and reg DT property into DTOs to fix warnings like this:
> >>
> >> "
> >> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> >> "
> >
> > All of these are dtc W=1 warnings, right?
>
> Yes, I slowly started linting and validating the various DTs we have to
> remove leftover warnings.

As this is about display and camera, I am pulling in some multimedia guys.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

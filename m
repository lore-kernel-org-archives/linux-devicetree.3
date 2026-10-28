Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180873;
	b=xOVSajTWwbBa9tYOhnqPdbyVb2fcVnIkm6SRnYnIqEFFdbqq74aW1cAl7ldATrxC17a0
	 WO9Kixr3YtAtB5vWAe4ODkNQkf5kVmTdbZZvjv3wk6yjaGl+IGKkuQd7uei3WRiW27iuJ
	 nZITHjbg8vVat5EpQTvkDN6S4Yc8DgWnA0N2u6nchCLG3zLCf5GUlvfZR2Yl5LIGgNfXG
	 eGW4+yOysv8eMrYorb6FAiND4DE7wneVNOM+g1aM1C6ezleBwN6t2benJW392dqQmIPN0
	 BYOfXaPOstA5XTM/5sZQ8DWHuf4p2tCGukHg21Cf8YkwsfFzy5fswWMRUy8gwwzzRgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180873;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i6WwPrncRptE8GYzBIDI4FfU9ppzTybRR7dkLJbVscM=;
	b=X3sVxfOyJ6GA6rDvq+xlxN/lt3qXGgbq3HkolQlSn1f0vjUxUmXZPiq5FMLifnt384jk
	 LpEjiE0tgHgJsuXYvcaBlJFHfFLu+U7K/ymu6hz1mtlBDTKQnxQSgSyQn35hRYt/uZ4to
	 S9Zoyzt4tRXF2ACICF2oYnailRb/kGlkQS30CWeng3J8zwFc8LSQYWQ9KCuqgYorgoBh0
	 yvjnCi30DE88aWOLNO+go2EgcW37aV9sqw24r/bNhFxQiIRBhXWRVHctLvEL/o+vAAQNz
	 3L7szRaXvw38K2Gm6XW49XFztbX0rdAboo+iqBlo4jUv3XRs/rx9XXAagPMXSPgmLkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BAD606A327
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0BAD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9909e82513fso574011241.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180872; x=1793785672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6WwPrncRptE8GYzBIDI4FfU9ppzTybRR7dkLJbVscM=;
        b=nMwjUdDkqqPnC1tfefZ39PEM059jAESz31tnw54vU9O+wrci3WBfmK4ywuaQbT+w1+
         O0rP57L8U4SjMJSuHJVXUl/yn+hq01QXf7848qjhDFSRd/YgMvE4aZUyfzf3tn6a8Nne
         vErFRE8nh+J2ZRagyIuRItGSZZFzOJuZjQmQWhNdpWhZeQ1P58kxPQW+wx12Bw/+lN8+
         yi2/AS5QPSLjz7Gbry1wo3eB04hN5LFdmeCV3AiE9bB8lS7mFcTa1hCy67EaUF0zOIZK
         91GRC6JmMrZnCX0jQd9v4tEONuS2CwMtHntHAoR5U4ufzpNL/N+NYwcGFC5MI90i9tMq
         WUIg==
X-Forwarded-Encrypted: i=1; AKwUvBxQtrV8m/hEqU6VVUJBGyPS1TcLi1iCmFSMAZDW9APofWU3X6MPCjd3hI73BJF9X3rLYEJQB/g6nRMj@vger.kernel.org
X-Gm-Message-State: AFq9FYIjxEUSCOqFCsA1MGF10vJC+YFxJ4ka7udGFT4wzv32+LyT6XeS
	0gnfafLUFZ004mUb//BGGMQChpC4C4F1mlssUZt7aHUWDdXDusFd3gIvrECbyaPV
X-Gm-Gg: AYBFou3jdww69+vCG9cOaRTY5x5xS3eH8sylqhrlS0j1r+rzxIMCQAftrBMJL+wSUp6
	v8iJAMXZgyqnNWcb6WQWWsl33zfmgyUyhbVxlaM9s6Qx4vhqs3xMvkuYL1U3VpssPgGPquqrz1/
	q992NEriN4534fEo/g7VsmIl3aekiTZxNvaR9cqHS6gFVQacgXbfzTR/K2o74BR83ndy6B5kO6Z
	ItF4obso8otrnMTWXjUjFCSVy9LMUxKMPXA/VQTU4UYAiFjgMfG7gHMyLRF4wfkpDlkTJi+qsiA
	U4IHxnZhkZbcMoNsvcYqM02lDxn69u3Qapr2CoEaTBdxIWelob3UY/uWVSzcs2kUn73LuCIaS4x
	45qiR7hHS+VHyYPf9UiYIuy3+hCtr/BlNvSKOyQqWVZ9XXu0poxDpGZ5Hcp7WCv45Yb610zn8GR
	M+rOSl3p/YZMcV8R2QS5cOeCx6ZwNJFOcC2uNSpF3J5z20GVSHnzYFvPOYFONMn2pWNFfNQ+MBA
	OM8e/3uROj0jZc2jrODDE34j9TU/XYYKVFxAiJSye7V7S5AjMaS/v3P7UNSWSiJnvyIXWNz6RtT
	O4KIj6aDeBNTKhQ/Ciqq4+bScNAntzwJXt9blISJ8CIOIx4a68aOLoM/MixGDOZYRDc=
X-Received: by 2002:a05:6102:390b:b0:7ca:7226:b414 with SMTP id ada2fe7eead31-7cea14f35f2mr1781190137.19.1793180871787;
        Wed, 28 Oct 2026 02:47:51 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259eb01asm5432963241.8.2026.10.28.02.47.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:47:51 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1407061137.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz/1HhyFxbjUURxfCK5nk29nvQYL68GZSMe1/ydf60gBgGgRpGGy/qfkXpJmcPgwCqWe4qY3w6rKONr@vger.kernel.org
X-Received: by 2002:a05:6102:a4a:b0:7ce:645a:139e with SMTP id
 ada2fe7eead31-7cea1529d88mr1771764137.23.1793180870303; Wed, 28 Oct 2026
 02:47:50 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed> <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
 <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
 <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com> <auG_dr3VFeWaBxKw@zed>
In-Reply-To: <auG_dr3VFeWaBxKw@zed>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 10:47:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYXn_tZ8r5Her0y-TYfN3qd3DZ0JH1N3_fmEUHh4e0xw@mail.gmail.com>
X-Gm-Features: AclHuK89t2jEOgptSQIEsLA7Aen2x9jD1gfdTZXyhURhxZaUPJB2xF4KJi3cnsI
Message-ID: <CAMuHMdUYXn_tZ8r5Her0y-TYfN3qd3DZ0JH1N3_fmEUHh4e0xw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Wed, 28 Oct 2026 at 10:28, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> On Wed, Oct 28, 2026 at 09:38:05AM +0100, Linus Walleij wrote:
> > On Tue, Oct 27, 2026 at 7:39=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > The driver uses Runtime PM, but I see no calls to
> > > pm_runtime_resume_and_get()?
> >
> > It gets grabbed in *params.c and *stats.c:
>
> pm_runtime_resume_and_get() is called in the .start_streaming handler
> for all video nodes (capture, params and stats)

OK, but not from .probe(), which does hardware initialization
before that?

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

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620648;
	b=zYiSBjSwNk5aAZELnwrzDXeo4/0T+3d+svo8NhFq1ZO5Ghf9/b9SVesTd4CHvxBcnYaq
	 qTnD9ykW9EQLTnh7mxYkkHKD1kNemd+gG6fGYxN70fujdlIS8bY6I0bg1xoCfCoIt1wlu
	 wTRDq2KRsvKJVtuZpkUH14a7Y9dnuFwIYqqqw11SW5huHMVqM7kvOK3zdDU35Rhqzlh8e
	 T4fYP34narGrVkl3u7UHcUN5MBZixq2Sx2dw6gtK0DjMtp4GBu+WXLjHko/23/E7Xy0Re
	 G3z6ait5cCsQoT9VhYMpmm+9lgBi/dTItdXIN3bOxbBMBwdipH7Ibo9dpvSy/k2lYeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MoQMMKruj6/n++Nk1VIZBaoDNnUVvF0yb6c2vnsNgHM=;
	b=0xhbSpR2PhiYRpscUOOV7suyPB0rvJUOrF0onvs10RPDP+GIfmfUZTD0XPAaeOqjSRWl
	 4un7sFqKe6U2nqJavrPPfpr5BB+bWkagafocgxNe+BtTQp4wvZ475VLIESp0pY7aMcFoV
	 ZXI//S8p4MNlXza76LLk/PWD29BxOFraHLbVQ0sAChBjOE8ycuacYrvG4fcdDsvZNquZV
	 KK53XUlwvfRJdxEyDG9LH4fEmM8BMqohBztbgcRaJYS1kmd8R/HCIs+Lo901tbsWUyRw/
	 a31ZFGhSDyttv+b2oa6MRiv0AYJgLWEY71D0vc0cj/uJbfWFlVaDeWVZXkt6SGLRu4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7vVDpy3;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5625C60A2634
	for <Devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5625C60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7vVDpy3
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4395d31228so322425466b.1
        for <Devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794620647; x=1795225447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MoQMMKruj6/n++Nk1VIZBaoDNnUVvF0yb6c2vnsNgHM=;
        b=J7vVDpy3hov0idyrQlvjuy0diLZseakBEROSW2svTfSA2K728WtmQ6u+YevPMy+QG4
         d01N0ksHASenkZqJ9owNX3H/GU+Cgn/xvuwYAHioZcPLuMYDvbfOWoFIbsvNuS1RC4U3
         HFGnMcOSuIrEjYJDG1TpvapLxdZMG0P7Gbk6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620647; x=1795225447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoQMMKruj6/n++Nk1VIZBaoDNnUVvF0yb6c2vnsNgHM=;
        b=jkOILJbT7how/iLj/LwHh6iqtCtqszueX8VOSI5sllCAbiEKiJOxZIvYZ1ILO8FTPl
         QbswqmRKnqnltYr+DYMNOuvGmZU/+P8yW0Lc1ej+Wwh8/0w1Fyjdy+0c5l7HJXiPHucE
         kXAIsHK8GaLPh2h6kqbVykrynp7MvN/5jMeAx6cJqgfy/Kxbm3vj52EFp7/8Ve63ZObg
         vRbWsvO50QykWTKhbogCSB1T2oaBlDzLoVxLJxXF15MxXLtwY0UQlmEtDUrj+/caRUP+
         EH7wb9GgyZvQrmhYZSAy8RKTBf+iQ/xWPDtQjN/etrdXAWctn0JpeVcyBDVtnhEkOa0l
         /txw==
X-Forwarded-Encrypted: i=1; AL+hErHZ0mD5IWxFlvfh+7UFqDLzFrLOGLfLTrTCKwSKQO+sm6iDi++ociX2wzIs2Yt3BhLA2VxZuAXlbIip@vger.kernel.org
X-Gm-Message-State: APuU4Z84iQGOGuvI4tlZjZKxKv1oERXAbcHY5jkDMybdMgQU4plRsWEf
	YAItgZ0F5ojyZH/AYAro4zQaCBUEMEsWgrPrFuQbLg8mnmnbdxYbw54Fmrtohrr6Y7nlWFKKsIg
	oSKgafGGh
X-Gm-Gg: AYBFou1O0MSWeYQZWkA6zbUnXpGqY0RMMoBzWURQpJ0EjekTYudFrFAYhXR3XKZ1fBK
	mFDf3J5Ee9kr2DvNf9N+tW/mC7Zqm9cBmumsF0PNrf+BI+hwMVcQctrhMgfSDNKXppq7DLi8ToC
	tNZQKyv/r4lME/Iy5sdg9YSpoF51ml1GQpWgDwzKLpJq3PMmLuCl7dGQnJIwsOULjqsCT1FQPWl
	/GSO6ULAFI+GGHFWh6YUt5ELtV51aEcXEf1wb6kXbY2mtl+JkR/67yzfA8XOGmOmw7PD4Mbio/L
	6q4r0g4mJHf2QLC0wlJmNKr85A5AoOkLgrx49GumefbiaB5tH3cDkLNZFcRvkHIAg2wlfbJf0RZ
	LezcqYLk78feYJ7phLmNXEHV/0mGP40nm87ffzA80niro7AKtXOviB6mFO8Z5X1UOQWnegPSbqd
	lK+PCJ1KK7dAiHF7FnxWxXY1qVj8q492+jPTMXfDGk/pLaU8oRKBS305JLRRcMiFryVt+GNcoE0
	2XPJC8mF+OocE0g3koJ/55LsjlIEuOoVQQnUgmSrmMSWF/n0L56/LpCuk0hTrUHVq+Uq5ZcMH22
	wFjAilyRjiwIXHE3uzgNW22qeOVUhBHx42w2WoHlCZNWom6PmvAkPexsYRlTcClfApOe
X-Received: by 2002:a17:907:6093:b0:c2e:4a61:d436 with SMTP id a640c23a62f3a-c50963856fdmr405565066b.36.1794620646619;
        Fri, 13 Nov 2026 17:44:06 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23afdsm162362666b.13.2026.11.13.17.44.04
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 17:44:04 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-497614c95f0so704400f8f.1
        for <Devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:44:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG9NJk7S2GDn6Mmw4cYbW68jLGPH2RIm6wjE7KHQebdyLKlXC0CmNZYuCHlg3BbH1S4nRloB9+qPgTE@vger.kernel.org
X-Received: by 2002:a05:6000:2c02:b0:493:fdf6:14aa with SMTP id
 ffacd0b85a97d-49c74e22bd3mr9494147f8f.56.1794620643883; Fri, 13 Nov 2026
 17:44:03 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-3-dianders@chromium.org> <at7cBFtlAQOFJ8jG@gractus.seuss>
 <CAD=FV=VqKkxC6-JaxGZOP_TRMwmq5axceT0xDZJhC2WMjxp2Aw@mail.gmail.com>
In-Reply-To: <CAD=FV=VqKkxC6-JaxGZOP_TRMwmq5axceT0xDZJhC2WMjxp2Aw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 17:43:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XS6Ekjeb=a5kEqU7_Y5Bucw1D7H0UzbZfS=17qVth1Ag@mail.gmail.com>
X-Gm-Features: AclHuK_6lVpuSzYwB58kym1CDulRnl8LT1eNGamtTJcSG4OQySKnpGhD8T4I49M
Message-ID: <CAD=FV=XS6Ekjeb=a5kEqU7_Y5Bucw1D7H0UzbZfS=17qVth1Ag@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Oct 28, 2026 at 2:57=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > > +* **Multi-level overlays**: Support hierarchical overlay layers (for
> > > +  example, SoC base -> board family intermediate overlay -> SKU leaf
> > > +  overlay) when multiple boards share large sub-trees not present ac=
ross
> > > +  all boards.
> >
> > That sounds like a useful extension for the future.  An interim step
> > would be to extend to instead of taking a bunch of dtbs as input, take
> > a single (already generated) base dtb and a bunch of dtbos.  You'd
> > leave the given base alone, but find further common things between the
> > dtbs, in the context of that base.  The idea is you'd run fdtfactor
> > once on the raw dtbs, then run it again on a subset of the dtbos
> > emitted from the first pass to find further commonalities in that
> > subset.
>
> Improved the TODO to incorporate this.

So interesting story. Earlier today I responded to David's question in
my v3 about the arbitrary 50% overlap [1]. My current v4 draft makes
this a parameter. It made me think that this is exactly what we need
here for multi-level overlays.

Using the same 438-DTB Qualcomm `image.fit` I talked about in my
response earlier today [1], I ended up running several passes of
`fdtfactor` where I varied the overlap in each pass. Here are a few
notable numbers. I've also added in data with an experiment I did with
FDT_DECOMPOSE=3D1 (see the kernel Makefile) and fdtfactor (these are
gziped size of all dtbs):

* No fdtfactor, no FDT_DECOMPOSE: 9.27 MB
* No fdtfactor, yes FDT_DECOMPOSE: 6.94 MB
* Yes fdtfactor, no FDT_DECOMPOSE: 3.59 MB
* Yes fdtfactor, yes FDT_DECOMPOSE: 3.03 MB
* 5-pass fdtfactor, yes FDT_DECOMPOSE: 2.03 MB

Neat, huh? The 5-pass fdtfactor used the thresholds "[98, 92, 82, 68,
50]" for the 5 passes. NOTE that with the same 5 passes but _without_
FDT_DECOMPOSE, I still got to 2.06 MB, so nearly the same. Also note
that a 2-pass fdtfactor [85, 50] atop FDT_DECOMPOSE still ended up
with a respectable 2.39 MB.

For now, this is still future work that can be in the TODO, but I
don't think it would be hard to implement.


[1] https://lore.kernel.org/r/CAD=3DFV=3DWGTD8FtjPFE5mFSJP343Z9-2HNXHH3g4us=
qpWPVuwPUg@mail.gmail.com/

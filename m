Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224643;
	b=HaTvRe0L56bF3KzxkEjWG7cR5lf5LS/50+xRIsAvIc/kQHPIPyPXG3TwyE0I5pTX7NyT
	 MZDdnxiidz83y145lBmJ+EeVATXWy8f+fh2U9JBmZC4hNKW7PZUo4kKWsl2Qr10j2TsEn
	 Xd3KBMQAfL7ih9iRCUhALzY3YbNRZ81G6H1wKL5LYPeoGbwd1mfI69Pgxa8WNmJzOupnC
	 2F8b6chEnAxbPIDMeWUz79x4RxvdYQoXnA+VhSR3Wi4QIk5S3XxnhdYfBHzmM5gqWte+n
	 MelQ94ZM+cMpJiMcEMNvRdydjEoeY4wyeQnmKw8RU5zeLnKzh64zTzeod7TiHZnktLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=07TvSjlSa6pD44ieWEKulZ7cEs4Mmh25/8EVSbg6l/E=;
	b=t/bbIfe0QlgwmoTO5Azr96rulTcBT1ivMyp0YNZSZVCNR8NgzJRIOf7hpDKnpKvtvp9W
	 8S/4w3cWoTO6ZjQLsVOdRjSqtWy7/LUL6rubayQxKxmTJflrSyqDdLRnXUoY418sxWcDD
	 OzZ4MvGCvaKM2qiDltyLBj6dCn9o6Vc/32+0aDi8Kn1DZfc3FG56Cbwp3NC1xAkRzqzaX
	 s0mdbPrfpfAfhraKPDd65ROMwzJxFlpd/OBehB2e0/VaFCttRWWBoc9AR0Iji9vhO23U5
	 YrE6eDajSt6eFEeqPxmtcEob6zlB+xzT2MpvQK3Bz6mDVOojmGWRErdYQGI7QBDiyeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=h5T+Kiva;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C8606A31F
	for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 818C8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=h5T+Kiva
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2270301a12.1
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224642; x=1793829442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=07TvSjlSa6pD44ieWEKulZ7cEs4Mmh25/8EVSbg6l/E=;
        b=h5T+Kivajk660PyTRvPDoZaTKgFQxdsX+F3RtzA7fgBJl4dp3pcSbTOQ2tDO7hgTNW
         qQ0FksXJSA2iasMKbXMnIrxF5GTphgNd3FGx4QRJFF/Q5yomxowQuAzKIe82Cu9ccrWp
         si+GO9IJPN/EIsLgmhpFrMdPsC/ofXf5iaK70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224642; x=1793829442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07TvSjlSa6pD44ieWEKulZ7cEs4Mmh25/8EVSbg6l/E=;
        b=WV8zKj5zxqoRg9uO1TRe8faTzNEi04RnvokqSOM6S+ChljAVFTAU4xl6H2BkMJup7Y
         XFyWYHtzJK5D4pFPNeDiigegVxDRACQIAM6suuE3HBrTM+U29oNqtDWoIfp2TfGLOGcM
         SgAXnbFQm8BxM0o0qi7DUsmhl1J4H7+z7bCwaxCCg5rdvEaPyL8aUuyYP/hDG7blhGKl
         fw+xqUW0rtPdWlCdio7PbUcPwTPtlCupZDrX3oMlNhIa+tlarAd+d9CIHIp3T7QSpkyv
         wt9o1MD203RSUfW6Wt6F/y67yqCewxn8/GOEzizUzMhWCtyz89pEwhL+EBTG1PY00hyB
         aElw==
X-Forwarded-Encrypted: i=1; AKwUvBxCpB+LC90qmUOAC5xj66xl7gj5wf8Ou/q2w/BlDoDd58FYuWgCDZGoGoisvGvf6QZ0OuVYjcGwi87J@vger.kernel.org
X-Gm-Message-State: AFq9FYLkzx9oqKlDipwgZQWJ8ZWygc+4essSju/TZxExdnwdgDaRFgjv
	KJPBsNOHWgfV3XEaFEbiYna/65QHOi6ZTCWSvFwGOHi0TKem8MYs0VrMPfYeNlqKW3C0jM5ontc
	oZrif3wVH
X-Gm-Gg: AYBFou2HD8nkJJ6nNchlsmZCKcBZC4G+MgPy0nxywJkxWwVjEREmLHJadTXoJgoWEmO
	daOA08oGAHJKn2/DGwnRtKkZPssJoP0bnmH6B4+bkulFWXB9IFmstgY8NtVhPQGdQtFm3rBFNVy
	K4tcK6phIuk2nR0mcmVyH+X45KQERFI2TcDWsVySZ0joVU/OFPf6R7keY9BZ67szl9x3bZKo+/p
	uiZpEBNXL8jg0tGrd9mH9Co0zB+ZEz1KbTJpoxlZqldOunzLmGE9AqxiNSLVMX2RagKseqW4PjK
	ZreH82CuUfzpgZrqC6ECdZqZ6pYEfvQ66pQiHWWa+BSMcAYmbHduP6M19kzscLHbAPpomuI2TCD
	vnEPWneBIBe4Hyv0kpybEXaEY+AsK2rBAwk+A8NLJy/SsXFS9NPd3L0bnlWYvSNrSB6t0e/oEdn
	xbtvf1nbAeZYyQ1Zu6Xx729kHLSRZx1uMFcFzSHwTevViKqMWLEkw9HQrcya/xUTSkhqHZZinPS
	/ZkxJBzsNpQmIVZ9FfjcB2WHaXuzvk2J4eVAfr/2X5NyykvTPpxjBv9JCUeQxjZpYGjJ8bnWmbj
	eeAuZbYYkuTuzqvRj0phIf5vEcdbvMdsTyrrLR8mlyI54+MZ4UVijuQ75YKjpcLU6a2x
X-Received: by 2002:a17:907:3da2:b0:c41:7e99:c6c2 with SMTP id a640c23a62f3a-c49bdfd92camr315032066b.44.1793224641927;
        Wed, 28 Oct 2026 14:57:21 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7bbdc6sm652829366b.87.2026.10.28.14.57.20
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:57:21 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b001cd92bso790103f8f.2
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:57:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5TmpB20keZQnU+fdqucqGvXNtT9YRxL9mbXtq57Y8iVGIpMFsdZnO0EmW75pU2KPt6m/XXhMcJ1cw@vger.kernel.org
X-Received: by 2002:a05:6000:250a:b0:48d:ed98:2a55 with SMTP id
 ffacd0b85a97d-48e5d5995bemr7521102f8f.22.1793224640054; Wed, 28 Oct 2026
 14:57:20 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org> <atrnN0ICA41TU1B3@gractus.seuss>
In-Reply-To: <atrnN0ICA41TU1B3@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXp6rMfE0fwUOFHQ--eetjRu8N=L1pjZP71Lcu5n-yow@mail.gmail.com>
X-Gm-Features: AclHuK8NLTlui-V6h-KJogbMRPIZx2bj01wfY_NZiveWxCtCuxzAidtcDBdEMUQ
Message-ID: <CAD=FV=XXp6rMfE0fwUOFHQ--eetjRu8N=L1pjZP71Lcu5n-yow@mail.gmail.com>
Subject: Re: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor overlays
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

Hi David,

On Thu, Oct 22, 2026 at 10:04=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Thu, Oct 15, 2026 at 11:21:33AM -0700, Douglas Anderson wrote:
> >
> > Devicetree overlays allow you to have a "base" compiled devicetree and =
then
> > to apply an "overlay" to it to add or modify nodes. Devicetree overlays=
 have
> > at least two purposes:
> >
> > 1. Supporting add-on boards (like "hats" on a dev board). In this case =
the
> >    main board is described as a base devicetree and the add-on board is=
 an
> >    overlay. In this case there is a clear separation between the base a=
nd the
> >    add-on board and the base/overlay separation models reality nicely.
> >
> > 2. Supporting a "family" of similar boards in a space-efficient way. In
> >    upstream Linux, there are 47 distinct sc7180-trogdor boards supporte=
d.
> >    These board are all highly similar, but we compile (and ship) a sepa=
rate
> >    devicetree for each. Devicetree overlays can make this much more eff=
icient
> >    by factoring the common bits to the base devicetree and having each
> >    of the 47 boards represented by a small devicetree overlay.
> >
> > Up to this point, the usage of overlays in the upstream devicetree repo=
 has
> > mostly been for case #1.
>
> I don't think it invalidates the concept you're going for, but this
> description is a bit misleading without some historical context.  In
> particular this is a bit confused by the fact that there are both
> source-level (dts) overlays and binary-level (dtb) overlays.
>
> Source overlays came first, in conjuction with /include/ support in
> dtc, and were intended for use case (2) and similar.  A group of
> boards with the same SoC was the most common case, but families of
> similar boards and families of similar SoCs also used this mechanism.
> At the time this was still envisaging that a complete tree was built
> at boot time, and didn't change.
>
> This started to drift into use case (1) since without hotplug (we'll
> get to that), a board with different hats (or whatever) can be
> considered variants of the same base board.
>
> That still required the complete tree be built at compile time (or at
> least bootloader / kernel installation time).  That wasn't great for
> two reasons, roughly matching your two use cases:
>
>  1. Compile time is obviously no good for hotplugged hats.  Even for
>     coldplug hats, it's desirable to be able to complete the tree at
>     boot time rather than compile / deploy time.
>
>  2. Bootloaders often want to support a variety of related boards, not
>     just a single configuration.  That was already possible by
>     incorporating a full dtb for every variant, but it gets pretty
>     bulky and bootloaders are often pretty constrained.
>
> dtb overlays were invented to address these, though I don't know that
> difference between the two motivations was particularly well
> understood at the time.
>
> dtb overlays were pretty much a direct transcription of dts overlay
> semantics to dtb and runtime.  The use of "in band" encoding (special
> properties) is kind of inelegant, but it worked well enough to become
> popular.
>
> This works reasonably well for use case (2).  That makes sense: the
> semantics are based on dts overlays which were designed for use case
> (2).
>
> But, dtb overlays have always been a nasty hack for case (1), even
> though that's become the predominant one.  Overlays can change
> anywhere in the tree, whether or not that's physically sensible via
> the hat connector (or whatever).  The semantics of applying an overlay
> lose information (by design), which means that removing an overlay for
> hot unplug is a complete mess.  The way we encode the information
> necessary to apply an overlay is kind of messy and inconsistent.
>
> Still, they worked well enough for (1) that they've become widespread.
> Herv=C3=A9 Condina is now working on a new scheme (dubbed "addons") which
> is actually designed for case (1), and should suit it much better.
> It's a fair way off being ready for use, but it's a good development.

Interesting. I'd have never thought to call the "dts" vs. "dtsi" split
"overlays".

I'll try to reword this in the cover letter.


> > I've used this tool to reduce sc7180-trogdor device tree files (which
> > are stored lz4 compressed) from 1.71 MB to 213 KB, a 87.5% savings.
>
> Nice.  I suspect this gap would be substantially smaller with a large
> window compressor.  The trick here is that the factoring is finding
> long distance redundancies which lz4 won't be able to see.

FWIW, I don't think the large window compressor would have helped
here. Each .dtb file is compressed on its own, right? This means that
the bootloader doesn't need to read/decompress all of the devicetree
files--just the ones actually cares about.


> > I'll freely admit that the patches in this series were pretty heavily v=
ibe
> > coded. I'll not pretend that I have a deep understanding of the intraci=
cies
> > of how overlays are implemented. That being said:
> > * I've spent quite a bit of time reviewing the code from a high-level
> >   perspective: confirming that functions are well documented, well stru=
ctured,
> >   and make sense.
> > * I believe that what the tool is doing and how the tool is used make s=
ense.
> > * I have had quite a number of internal "the AI reviews the AI" rounds =
to
> >   the point of diminishing returns.
> > At this point, I'm not embarassed to put my name behind this. While I w=
on't
> > promise that there is zero cases of the AI doing something really stupi=
d,
> > I'd be willing to bet that the end result is better (and cleaner / bett=
er
> > structured) than what I would have coded up if I had spend a few weeks =
doing
> > this on my own.
>
> Thanks for that clear and helpful context.  My views on AI are
> complicated, leaning negative, but I do think it can be a useful tool
> and have no plans to reject patches purely because they're AI
> assisted.  A statement like that goes a long way to convincing me that
> I'm not about to waste my effort reviewing slop.  c.f. my rather
> unfriendly response[2] to a recent very sloppish bug report which
> vastly overestimated the impact of the bugs in question.

Sorry if it still wasn't super amazing. FWIW, it was definitely much
worse when I first started with it. :-P The quick prototype was done
in 30 minutes, but then I spent a big chunk of time trying to whip it
into something sensible. ...but obviously (as you found in reviewing
it) there were a bunch of things that looked reasonable to me but
weren't ideal. FWIW, there were at least some things that I simply
made the wrong choice on. I wasn't sure how much you would want
fdtfactor to stay out of the way of the rest of "dtc" (AKA keep my
changes self-contained) vs. actually improving / fixing the dtc source
base. I chose to stay out of the way in a few cases. That's changed in
v2 which makes fdtfactor smaller.

FWIW, I've attempted to get my AI to improve the later patches in the
series based on your feedback in the cover letter and patch #2.
Hopefully this makes things look better to you in v2...


> [2] https://lore.kernel.org/devicetree-compiler/as8RYmIp0pDCplpu@gractus.=
seuss/
>
> Understand that all dtc maintainership is unpaid volunteer time for
> me, so I'm less responsive about reviews than would be ideal.  I am
> gradually chiping away at the backlog, though.

I really appreciate the time you took on this. I've made it a priority
to go through all of your feedback and ensure everything is addressed.

I'm sure v2 won't be perfect, but hopefully it's a bunch better.



-Doug

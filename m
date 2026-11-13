Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547374;
	b=A5q7pUw8Qop3RybAeIAljHu0xbInI+NAyvUYKzLoaHv7q19ARCVJh4hQ8U+g8Hwqlc+8
	 zWrRq9N/DEef3uuF6O0qb2j8zAwQ9Z5mvv3jzcIQV90vcJI954rg8X+aXXmx54N3sxM3g
	 RFcdyrM6RNaZtNzoAl9pvdWKUJiXbvc12JuWGv9Es6my21SxcpCZrKTYvyrpIRhv9ylRP
	 Mi0GKW1OruMN8CRPSNGmN1Bnodb33clm1vekgbTUKieoWtZjhxjSgqG4Bygo+3HiNfZ7X
	 l2RuohEvyi8nVo6zUqjR+63atiPOLGe5/KZX4gwTMH683NUbod45hFq9FTohbUXp77g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ox4n6KYykVTZqhM4hkJTXpATyoWTeYxSGb9cMjYE3n0=;
	b=lAThUn2vYzCtAmPcmSds/oZ+4qBfV5wl+2RNFPSH+UPV9vo/VybUl/fUx8Zh6uLTiSxh
	 Jxy4q0ZfkSCSn/ZUJ38wUHD/DuTu6qnyNtyaEG3MItyRk7st+HjxgIYVMKXyDFlwntjji
	 n7UdV0XlGKkMXTv5vnSOWXQjLTo5MpsFKerobjF7xkwjzexFnYKt5D4zQbYNT3trbXaWZ
	 tRb8aAHYe2j0PTPmGrofiFqukvuM8z45ahWR0sHC+MTJxGyIBL5pFB4R2xjQ2xGShV5pC
	 SLb3kbfQm2tMrCX49ts2UlVsqq+l4dc3Cxh85gLvC6IP8EOElFRehm+nr5HC8/uINsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VQVZbA9F;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4882606A323
	for <Devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4882606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VQVZbA9F
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so791539a12.2
        for <Devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794547372; x=1795152172; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ox4n6KYykVTZqhM4hkJTXpATyoWTeYxSGb9cMjYE3n0=;
        b=VQVZbA9F+I1bBO0pJJ6RLJpLNRHAZjmDqudG4TI3TXiccu6qU1IlT7WQWBFL3hkvjw
         pRnuS52nDnqrMWeHCtFCsiFq3WAT+5YVmSlp7TZWOzYw8/0LslVcS+nm/1lOctFvg4qi
         SR5td6z83nJ+00bu6K0z2rBvZhnMktZl/1/II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547372; x=1795152172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ox4n6KYykVTZqhM4hkJTXpATyoWTeYxSGb9cMjYE3n0=;
        b=QqlAHKLIGSYz0TpaPQ+zowyuJ7XFOYSqEJpB16ROfnaCQjcFHGUG9xhcXWSb/vCzhB
         a+jnyZF+wvZFefUk9yygV+XVBu94zXB5bGWoaqxOTdOx8h4/tSWETMfr4LEjSFAqC82W
         v+uxuAc6s9t0YHW8rIB11lVKWVEKP0qlFA2jRA5Dtshk+XrD1T7jerwiVJHuTFasYWaa
         8qNmvR7oGqGEIPNkCkhPORwrmZyC1099qXaodw3f/nf6cZAHSvMVzc+G5iNuzj8n/2vY
         BAtsFb0wnRmALhTMsqjaMLNyA7fAITfailuFyELBfDXd7giHeJyN+wvUhV4JcmtIY/3h
         5xqQ==
X-Forwarded-Encrypted: i=1; AL+hErFsxt8G+ksOKW51DKj8XKOjdSahNGA+gCvimqWhb5lIrryJ8FZmGnYodPZur1P8hIEHNJGwruWj9DFy@vger.kernel.org
X-Gm-Message-State: APuU4Z+fcUmDqsmN2XVqBYNcX9sJGzi5FlSJAwimmCIZKdtxKWBKqsvz
	jtzZmRIv8dX3JtN4pznOGowolsS1d8aQzDIrAMZOaYEfuTsAm6Ck6iPRZ5uMlqwLSRBp3KQBYro
	qgm01yu5d
X-Gm-Gg: AYBFou1cPko96B2VQAE6uhCb9kXe7BjkC8IRxykxQ7O8A1/5FeW04VvJ1ZcB8aFUqFu
	CZu9JDIKYJCoAqyjisnthBTFQZyst6BYAHyrzA5B3+70NTvg+4Dx23Ctt5UzJcm3ohH2Tod7359
	GByJXkNFt+My1k0CPpYk+KHPJud3QtacAg7usD+xLjfRh396/0RmOh1yobqZcASlSy8rm5sYgEN
	e7aPe0aICw3y9/MbDgOEHr0CwFyiTTqEwT5ddeFPXO2uVubvQwGZ1Tax3TxY400u9SfBKaLMokE
	QqijnRgwJL/ShNCTHgsYzvn/FEVGKj0VBcMDaWONxYt4ZzzTuiTimnh+eved8yhjHulgs9hZ8sp
	WyN+zPfQs+koNArhuVRHDCMMKUnApbLeJQimuYJ3W7+PSljDXGDKqHAew8SXCry2JHSvJ6QOrD4
	I46dfbEFrxD38/Usj1QzmanowErxNJhUe3a7yuhgtvpBnZiZbC2UTA7jcfCEkhY+wTIXBEM7ai9
	84q8JZiQkby4RgFCnwVFaOe2js27p5aDsQyGyj79jWm8rPPBljcJrH6GqSeMpK+Da39ZOFwBMjw
	23EIoN4GC1cfUtF4cUe/q/wR7oJZMelZTiqqKNk76Tz0aFwcfNjUF/eAKePPLkWWMX4A
X-Received: by 2002:a17:907:8e12:b0:c40:231:6ea1 with SMTP id a640c23a62f3a-c5096839683mr112107166b.43.1794547372040;
        Thu, 12 Nov 2026 21:22:52 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b9164bsm52206766b.82.2026.11.12.21.22.50
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 21:22:50 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so554292f8f.1
        for <Devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:22:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHLooxwFvzxQNXMvRCMLvUhXGGc8F7netLVtU5OhNmBhpmB6QoM3TT4o1uPLss70OQvZJLd5Y9O4yNO@vger.kernel.org
X-Received: by 2002:a5d:4f86:0:b0:48d:f831:2681 with SMTP id
 ffacd0b85a97d-49c71f334a4mr2062026f8f.38.1794547369976; Thu, 12 Nov 2026
 21:22:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-13-dianders@chromium.org> <avPsIBLWNrNexcbt@gractus.seuss>
In-Reply-To: <avPsIBLWNrNexcbt@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 21:22:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uy0dxbzoMN6hA7FY3R6hyqcL2j8d2-YeivS=_+dA7NfQ@mail.gmail.com>
X-Gm-Features: AclHuK_tr2qaJcNGS3TJ5jGwHVn7SwIIvG0pdGd-5SNir7fQgEzYdizCECgdiOU
Message-ID: <CAD=FV=Uy0dxbzoMN6hA7FY3R6hyqcL2j8d2-YeivS=_+dA7NfQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] fdtfactor: Add tool to split DTBs into a base
 DTB and overlays
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, Nov 10, 2026 at 8:16 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 02:01:19PM -0800, Douglas Anderson wrote:
> > diff --git a/README.md b/README.md
> > index fcfc2e55d804..61fefc4424fe 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -112,6 +112,49 @@ $ meson setup -Dpython=disabled build
> >  More work remains to support all of libfdt, including access to numeric
> >  values.
> >
> > +## fdtfactor
>
> Pre-existing, but it would be nice to have blurbs for dtdiff,
> fdt{get,put} and the other anciliary tools we already include.

Agreed -- in my draft v4 I've added a preparatory patch adding brief
`README.md` sections for `dtc` and the ancillary tools (`dtdiff`,
`fdtget`, `fdtput`, `fdtdump`, `convert-dtsv0`, and `fdtoverlay`).


> > +        self.filename = filename
> > +        with open(filename, 'rb') as f:
> > +            raw_bytes = f.read()
> > +        self.raw_bytes = raw_bytes
>
> AFAICT, self.raw_bytes is never used again (unlike the raw_bytes
> local).

`_print_dtb_stats()` actually used `len(d.raw_bytes)` further down to
compute `orig_uncomp` when `--stats` is passed, though nothing ever
reads the buffer contents again after `__init__()`. In my draft v4 I've
replaced `self.raw_bytes` with `self.uncompressed_size = len(raw_bytes)`
(pairing with `self.compressed_size` in the compression patch) so we
don't keep all the uncompressed DTB buffers in memory just for their
lengths.


> > +            if 'phandle' in node.props:
> > +                node.phandle = node.get_u32('phandle')
> > +                del node.props['phandle']
> > +
> > +            if node.phandle is not None:
>
> Changing this to:
> if node.phandle is None:
> continue
> reduces nesting and IMO, would make this a little more readable.

Done in my draft v4 (and did the same for a couple of other `for` loops
in `fdtfactor`).


> > +                offsets = sorted(set(lf_node.get_u32_list(prop_name)))
>
> I don't think there's any reason to convert the list to a set before sorting.

Done in my draft v4 (`offsets = sorted(lf_prop.as_uint32_list())`).
Neither `dtc` nor `libfdt` emits duplicate offsets in
`/__local_fixups__`, and dropping `set()` also means any duplicate
offset in a malformed blob will be caught by the overlapping-offset
check right below.


> > +    base_root = FactoredTree()
> > +    next_ph = 1
> > +    for path, _ in dtbs[0].root.walk():
> > +        if path not in common_paths:
> > +            continue
>
> I think this makes the loop equivalent to:
> for path in common_paths:
>    ....
>
> > +        if path and base_root.get_node(path.rpartition('/')[0]) is None:
> > +            continue

We can't iterate `common_paths` directly here because `common_paths` is
an unordered `set`:

1. The `base_root.get_node(path.rpartition('/')[0]) is None` check right
   below relies on parents always being visited before their children so
   that if an ancestor was excluded, its descendants are skipped too.
   Iterating a `set` can visit `/a/b` before `/a`, causing `/a/b` to be
   wrongly skipped.
2. Walking `dtbs[0].root.walk()` preserves `dtbs[0]`'s subnode ordering
   in `base_root` and keeps sequential `next_ph` assignment
   deterministic across `PYTHONHASHSEED` values.

I've added a comment above the loop in my draft v4 explaining why it
iterates `dtbs[0]`'s nodes in pre-order instead of iterating
`common_paths`.


> > +        has_phandle = any(
> > +            d.root.get_node(path).phandle is not None for d in dtbs
> > +        )
>
> I expect this will work in practice, but arguably the condition you
> really need here is whether the node is referred to by any fixup in
> any non-common property.
>
> > +        if has_phandle and path and path not in common_sym_targets:
> > +            continue
> > +        base_node = base_root.create_path(path)
> > +        if has_phandle:
> > +            base_node.phandle = next_ph
> > +            next_ph += 1

For the `common_sym_targets` exclusion (`if has_phandle and path and
path not in common_sym_targets: continue`), that's true in principle
with respect to `/__fixups__`: an overlay only needs a symbol in
`base.dtb`'s `/__symbols__` if a non-common property ends up referencing
`path`. There are a couple of catches if we tried to relax this, though:

1. Which properties are common vs. non-common isn't known yet here --
   `_build_base_tree()` decides that next, and its candidate eligibility
   depends on which fixup target nodes are in `base_root` (so resolving
   both together would need an iterative pass).
2. Even when no non-common property references `path`, `base_node` still
   needs a `phandle` in `base.dtb` if `path` is referenced by a *common*
   property in `base.dtb`, or if `path` has a symbol in `/__symbols__`
   (from `dtc -@`) so the reconstructed DTB retains its `phandle`
   property and remains valid as a base for any further runtime overlays
   targeting that symbol. Conversely, if one board had a `phandle` on
   `path` (e.g. a board-specific label) and another board didn't,
   putting `path` in `base.dtb` with a `phandle` would add a `phandle`
   property to the second board's reconstructed DTB that wasn't in its
   original DTB.

Since in `dtc -@` inputs almost every node with a `phandle` also has a
label in `/__symbols__`, checking `has_phandle` up front keeps this
single-pass and exact. I've expanded the docstring on
`_find_common_nodes_and_phandles()` in my draft v4 to note this.

-Doug

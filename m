Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793409389;
	b=SqTpZgnxURFhxH2a0vEnI7WpngbY7/rA7lNPGYQtcSVUqJkwpt7tAb914NYq2FNRYS4r
	 zp2oZm50PEZg2PBg0Asr4Ev6t3Jfug5S9DRtdXrX7nIUpDv2zZIO0qJs9erez2dLHItYN
	 fg87kB6/hXqw6ILP1u7XiobvJHB1c9+hs4GU7Pts6w2KXtWl5wqq5khmJPNvxbalmFwe+
	 7tJNQ5GCQLqggXb7Z4B23KiNLNpD2FMY7ittmPiKTg4p0KTZQzU7ESJKErqh+O9jj0JAr
	 zfFa1GD2p4q5fOEMCLvMhl27fQbIjOQ33V0gMsmJCOg7LDjJvC9/7rUeDgdttLx75Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793409389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Nzihp1P/HgfQSWtejVyE9BkuDNhZgLetHLW5DYDxxQs=;
	b=cvLQMLBIlXEsXExqRY/AnsJ21Zcs/O3/juteQe/QMiIWch2KNXUgicX7qKTrh9choXGs
	 CPX0TxdCuHQri04Gl8bWao1SQdgjJI/U0Eq+k8cF3zJoBoQZHlry1H+YhVrUjoudnxwOJ
	 D+qWi1/7Jm/YtecL9BNWAEbJBePAk4wkrIVwiA+yI+VzvOpFVmBtX+Zhl0elaredB116K
	 Nho4z7ynrVqg1F4jDq88a/Q8Wt6svhvUWew1YYDzE4bBV7Gv2YPPR5wn1MdhwV886NfqC
	 RHfcacOrpD1WPkh5l3HGVrWyahDFJN3XH2rSC2XsnsYbKwZkSReX6skbfJbPlNAkWzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="AIUUL/yI";
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FFA606A31A
	for <Devicetree@vger.kernel.org>; Sat, 31 Oct 2026 01:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6FFA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AIUUL/yI
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c414e5d282eso162584766b.1
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793409387; x=1794014187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nzihp1P/HgfQSWtejVyE9BkuDNhZgLetHLW5DYDxxQs=;
        b=AIUUL/yIVye6U7If2TA4tSfKVabhzIF8xDam/YDUGKUdTBv8Nk7fiyoVeXMFIifyg3
         44nTtkwpzTdzdnZFk1YdxmFjjgtomSWwPuCIupkDC0AKUFDoJYymMmit4wcqShgnHquU
         nGjcaoJrIB4Dhu+QSqbQKjsTbnMLP96kPw760=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793409387; x=1794014187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nzihp1P/HgfQSWtejVyE9BkuDNhZgLetHLW5DYDxxQs=;
        b=Bb060W1oK+TQyVwJW96+R9Q1yu7pFbAeq2cAmu/XbF0Pjvu3+Dls87kuH2eEQxhgqx
         OcuPE8GV2JomAT5otyRjUgHzfg9TyvmkN8zuwegQpwz5oqmsMMmZyidIuoGV8bS8cloK
         TSLk/4E1MapEDIdfCv1wEQqlv5w/5sRMbt+ccRwSLTAOIGc7qKNOWJWOubhxOt6IsyDQ
         yDkAfOuWXZXDx0odyQH7Qw9/A7d098JNRst9DRD+H1MuUVfC2umOIuJt59bE5BO6EMMH
         1CMVV6f3ccmbxRJ19W7SsiUcpEcsyf/RM/yE2tSQnBIU+vlG5DpXq7FWg9DQ9t58DZz4
         BcWA==
X-Forwarded-Encrypted: i=1; AKwUvBzAbq6PflKnLKUiaypWI8CbkqQ29VoUotHNdta6X12sb+maUwfBY9TwKo9UMeKowVartrZxgemyYiAV@vger.kernel.org
X-Gm-Message-State: AFq9FYI/cvzFTYEgcH/G2NSfmEjlZkV51FIwQx3TywXy5X0TLIO0eUjI
	0AMsqyWSU0GS0jDrJVOF0elJcup1N9JGXoJoaO0eYHb0+wLAZJcwmIIpz4/Sl/lmXIV3ecZFfhy
	R+pjuIcb8
X-Gm-Gg: AYBFou1eC7h1WgdZxlGa4Ztk1H61VMuPffw/s2oK3LvpIeL8XfQIn0WRE/pZAGIvWsT
	7+NXxyjIEWadmF+tnFg025cfupYnURPDcvMylnSzRD8t9CMxr4SewS+LyXSE6ZsQFdhOtgoneta
	Ra72+QO65IvVwACNAkOXvuzr5lH5r9WFEIYBKM/GFalRbL3RYGb+I+Hwr7RRs2gMx8llyA+AaUk
	tkKbeOuVi5mit/AtiNeWS/xoqbpUi9Okm7/LpBCxZisjqSDySflJ/QwGHwCywy48a6xn6KKlhRg
	xLoZPqBcZdVmDFiicYY3ONVL0H44C07FosswQdnTAULrEPDnxsRgt3cJPJUm6zhJMl8FP6W9+ZV
	enrVEFv6uvEjFi8/XZETwi36/v3cvhbfmyTu986SqN4P5xMv77G+p32SoB0fhw5oZAl7VP7IJ7K
	2KdDUt0/BxrAStl649NP2luIoFEYT1j34KDqfpQ/mfgoarznIUtAln0sc+eBDs46twusPIktbyL
	6Qsrsx1PhIwTKTlT8nQhxM1FiomeWLf/gn8AMJhdKrQ1OXixtrJRqhf9HfXXYgH7Cq294/PPY56
	txX38Ijvqfp986YBq2WO5Yzdo8hxIDp2jsk57MwRp/Joc/W6Yd6SjJUZbO5poN2Dji4y
X-Received: by 2002:a17:906:99c9:b0:c2d:c247:5400 with SMTP id a640c23a62f3a-c4ca7b405c5mr351969866b.27.1793409387273;
        Fri, 30 Oct 2026 18:16:27 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4aa12sm122478266b.52.2026.10.30.18.16.26
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:16:27 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1802108a12.3
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:16:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxULRe+DWJ7WyC4yp+0kbv0WLqojo6ZrQo99yBoNMtZYGo5okGddfuKs+9dIfsrk0vbPEg+QlOhPaEy@vger.kernel.org
X-Received: by 2002:a05:600c:a41:b0:4a1:ac66:6ac6 with SMTP id
 5b1f17b1804b1-4ac18c73d85mr83192945e9.26.1793409021466; Fri, 30 Oct 2026
 18:10:21 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid> <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
In-Reply-To: <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 18:10:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
X-Gm-Features: AclHuK8jubqKMZtp2zZmgL9M6Iv-P5KmHBzgb2f1Y0xcGERjxzkWO1A9oKK2NzE
Message-ID: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 24, 2026 at 1:17=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> > kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
> >
> > Add opt-in support for factoring the DTBs inside a compiled FIT image
> > into shared base DTBs and per-board overlays using `fdtfactor` when
> > `FIT_FACTOR_DTBS=3D1` is passed to make:
>
> Please can you add a short paragraph at the start saying why this is
> wanted (the bootloader needs a base DTB plus a per-board DTBO) and
> where fdtfactor comes from? It is not in scripts/dtc, so someone
> reading the git log won't know where the tool lives or which version
> is needed. A link to the dtc series would help.

I think that was in the the "after the cut" part, where I said:

You can see the fdtfactor post at:
 http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

This patch obviously could only land if some form of that series
lands. Presumably we'd also want to import fdtfactor into the local
kernel copy of the devicetree compiler before this patch.

My plan was for this series to be RFC until `fdtfactor` lands, after
which it would include an import of `fdtfactor` as one of the earlier
patches. ;-)


> > - When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
> >   included in the FIT image so they retain `/__symbols__` and
> >   `/__local_fixups__` metadata needed for factoring.
> > - Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
> >   defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
> >   `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.
> >
> > Assisted-by: Gemini:gemini-pro-prerelease
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> >  scripts/Makefile.dtbs |  8 ++++++++
> >  scripts/Makefile.lib  | 18 ++++++++++++------
> >  2 files changed, 20 insertions(+), 6 deletions(-)
>
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > @@ -425,6 +425,8 @@ quiet_cmd_uimage =3D UIMAGE  $@
> >  MAKE_FIT :=3D $(srctree)/scripts/make_fit.py
> > +FDTFACTOR ?=3D fdtfactor
> > +FDTFACTOR_ARGS ?=3D --strip-local-fixups
>
> Patches 1-3 go to some trouble to build fdtget and fdtput in-tree, and
> cmd_fit_its puts scripts/dtc on the PATH, but fdtfactor comes from the
> host. So FIT_FACTOR_DTBS=3D1 uses whatever fdtfactor happens to be on
> the PATH, and the build does not depend on it. Is the plan to sync
> fdtfactor.c into scripts/dtc once it lands upstream? If so, it would
> be worth saying so under the --- line.

Yup, that's the plan.


> > diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> > @@ -137,6 +137,14 @@ DTC_FLAGS +=3D -Wnode_name_chars_strict \
> > +# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs ret=
ain the
> > +# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
> > +ifneq ($(FIT_FACTOR_DTBS),)
> > +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> > +DTC_FLAGS +=3D -@ -L
> > +endif
> > +endif
>
> One thing I'd like to check is composite DTBs (the foo-dtbs :=3D
> base.dtb bar.dtbo entries built by cmd_fdtoverlay). My understanding
> is that fdt_overlay_apply() merges the overlay's __symbols__ into the
> base but drops its __local_fixups__ after using them to renumber
> phandles inside the overlay. So the __local_fixups__ in a composite
> DTB only cover the base part, even though both inputs were built with
> -L
>
> This doesn't affect lga or trogdor, but the make_fit.py path packs
> every DTB in dtbs-list, and qcom has lots of composite entries
> (lemans-evk-camera.dtb, etc). If fdtfactor relies on __local_fixups__
> to find phandle properties, it may silently produce a bad overlay for
> these. Please can you check this? It might be enough to detect such
> DTBs and skip or refuse them.

I'm not sure I 100% understand, but let me try to respond and you can
tell me if I got it right.

The goal was to make sure that we could fully reconstruct
__local_fixups__ after applying the overlay to the base. v2 of the
fdtfactor series handled this more properly, and I'm planning to see
this through and land it unless there are major objections.

By default here, I'm running fdtfactor with "-S" to strip the
__local_fixups__ out with the assumption that today people don't
really need them. However, someone could easily override that locally.

I'm a little unclear how things would silently produce a bad overlay, thoug=
h.


> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > @@ -486,7 +490,9 @@ quiet_cmd_fit_its =3D FIT     $@
> > -             done
> > +             done \
> > +             $(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) =
\
> > +                     $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)
>
> Just to check, does fdtfactor handle compressed DTBs in the FIT, i.e.
> nodes with compression =3D 'lz4' as in sc7180-trogdor.its from patch 7?
> If not, FIT_FACTOR_DTBS=3D1 with that .its will either fail or silently
> skip the DTBs. Either way, it would be worth mentioning in the commit
> message.

Yes, `fdtfactor` transparently decompresses compressed FDT image nodes
inside the FIT (including `lz4` in `sc7180-trogdor.its`), factors them,
and re-compresses the resulting base DTB and overlays. I'l update the
commit message to mention this explicitly.

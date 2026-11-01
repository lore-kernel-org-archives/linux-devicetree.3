Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570735;
	b=OQKQtlD+pYe5uyul3d/nABWC9viMkIYFnrDJ0vh0jRKcgox2u4hJVCfYq0lhxt4G+Nh0
	 yQUFfwkyRomZC6cdWWzWcDLmnxc6eTUcX/fdF21rwU5Z6DD8fWVAqNFDmXfNy/dzGa3Vx
	 Hi6MlcE4R7qk/pmGtCO/MvM7MN6KutQArHegfTK3Y1CSqzdrXsc1YvSh0NWY1PR4Yqc+Q
	 mPyNhaoVA8rX3UEWN1rAS//MUCQkT5W4xU2rOMpiS/8qECeystCEzeH/Dr8HzkAF6gDN6
	 nOsKRMlG6tVQCzW03ndbTLtuSZO01eOZkPlX7mr1v87VODeZyykFytwHfCcUv+Xm9AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9K0wtmHYex3tFk4OFUkhwCzGKrgTqNTBSe+bLpdnXcU=;
	b=fKqLd+WHrd8qjBT7h7MRur/0r2t8Z730F53F9qVTz0j8s6K6XVxGin+Y5ODjXv073Xqm
	 7QcYwfhf01tRsmc2Yku4/V6dyxcD3GhtHJVVd9mRWCcLtXwjQZbuiI6pHvSvQs7J3ne/1
	 43oOsZEuOj7mK/p7CC37ojnHAKhK9doJDEWRSF17wiNjf5+FyM1YfMQdxr+RjIrWig36C
	 XgiP8n9LHszYBCEr9avOR3X+Sizq7xmVQQ/II6tVEU487U/37fjkffIkiqA39I8OHrNwr
	 33/Tx+CieN6/vfm2Yr49H8uuxM8NZ8ruAQRxaoOAc3knCBZOS/Sw8PZEM4sAN6Gwdwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UsUVbIV6;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B585C606A326
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B585C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UsUVbIV6
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c418e215671so299369766b.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570733; x=1794175533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9K0wtmHYex3tFk4OFUkhwCzGKrgTqNTBSe+bLpdnXcU=;
        b=UsUVbIV66uwrk5dnqa1bVg2LjpaKABQa5UqZPr6u0InYVtt0MzGy4JRXg4h4IReKUn
         GlFaC/JH3wAL99gASoayMjyFPd1MWoeew7/A+48SfRCfABahlvkFmLQ0TY+xizrNb13u
         /kOZg82Ks5q1FMWBZ0k0cSE2BH+KpxHTM4TmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570733; x=1794175533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9K0wtmHYex3tFk4OFUkhwCzGKrgTqNTBSe+bLpdnXcU=;
        b=JrRwk8kprpFL7XPw4KO+GPZrWa157ZjYH2roSVBrTTzEkuGa3loRM/okHbI0gwMkDk
         K3jsqqZzV5/W31GQXcJhBYLG3IGJq1p3lKuE2iaEBcuxdDFdnZWvyH2EgCb2VM4CZx+S
         /pf1Q+QbXlpMN+oBWmTwaGr7dh97S8UG6e9EJktmtGEXGfO4pAx0skpW11pYJd+RMLcy
         Rwmg40DK+c/WBoB/FCwyYNdTRjd4HdSaTrc46ZEFLjRQNMdw7mahWywbXmGZQlqzz9K+
         FhmUWki4IHxyNTlz7sFyM4GVXmR9jaUxHPVp4U8c721YmlKTZCPcTCkNAwYox2MtY0vn
         5G6A==
X-Forwarded-Encrypted: i=1; AKwUvByNjIjCTvjK4PexGkkLmucG1F/2Bl386FSiEvMf9P4HlGCipFsKvxB1aPBoJ1PiXD8xo2J/Cei1H766@vger.kernel.org
X-Gm-Message-State: AFq9FYI3siNslI6RyiF/ygb+J508xVe/4qcK4YrysW1MxBMswpsl2o5a
	/5CVaScMd6gHR+XBZ1tKRmTYndNrHJk+DVxfrtbTKar9DeZWXdNZhodP21WOmRspYYDVKDtb70e
	KoUx66G6x
X-Gm-Gg: AYBFou0+TEoLsn7CSoK6xzvCJEssI+ByIvDozNyaxyQaQXC65LeUJ2NsH1h/phwVnkT
	bLpSyFtBiAkSuYHHDwt5THemPSm4LKVd/I4bsltOazOH+uQcSp3WO7GcmiDlUhG7IhPsAkubhAY
	HiD5eblo1MAX1LIAcsFO8MFxSI0TK/y5ivYYRvUED228eBSaf126BTRBlmlAwzNbwuaNkOMnVp6
	eDSYe34OAVJVxm27j6ehmeuplMdeO36ksSuPq+R3T6Rj3UGIVFjY/LHx4R6Jo9LAJwSfPbwwiLC
	JfhvXdB3WKm5SdZL0TLl6J1JLOQ5Pm2rQk7+zg0gA0hciX9d0saxN2HZSTGcIVx5lGwIApkh8OV
	axx5iGblfi/b3kV9NLVYOnYs+6364RrYKP/KkuCVacbL9bLNDXaIIW592/ufiUtfGmt5M3HRdYi
	OElYqA363TypZlfw9dJ+eiV3xkZykDJyAQYkDMJxk4Y03/QHx2/J1KwOrRxB6RdhUISf2gxtAbu
	fN9R7kqyFq+hdaoQ0eaIr11BQMILMDvIbj858XSHXtdG1xhi+bxXug+WBvgMk4vCvjCMhTjGwiy
	oMx85m81em2RnBdq+BcWjxkObqsYxkrq1TSUQ1hzMmFJV8Rqmq5+r6cklcPKV25MWZ0=
X-Received: by 2002:a17:907:3ccb:b0:c41:cf68:bbcf with SMTP id a640c23a62f3a-c4ca7ab31f4mr584277866b.32.1793570733024;
        Sun, 01 Nov 2026 14:05:33 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe93db0sm307426766b.66.2026.11.01.14.05.26
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:05:26 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2273926f8f.3
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:05:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByYgiYnPMaT2WH3DpkxlDEntcl0Dqy+LaMFfZkeU2ctZ87403pgRedXtWrMssNIVdUXEdHNOnKkiMbe@vger.kernel.org
X-Received: by 2002:a05:6000:2313:b0:488:7d08:edbc with SMTP id
 ffacd0b85a97d-48e6e30ba6fmr19894457f8f.24.1793570726049; Sun, 01 Nov 2026
 14:05:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-7-dianders@chromium.org> <CAFLszThT8vt_C+UCbDXO=Yxx=zK04g+6efRb+Ji5MLyj53UCvA@mail.gmail.com>
In-Reply-To: <CAFLszThT8vt_C+UCbDXO=Yxx=zK04g+6efRb+Ji5MLyj53UCvA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XfViXvWVKvpe6vOz6fzMXiD41RzA3ZWC8EbO5exn2ufQ@mail.gmail.com>
X-Gm-Features: AclHuK-LSNoloh3coeDpSRk0j_N6fw2KWjrShe5MdUIGe_-PL_vPdD6U_o-QLmU
Message-ID: <CAD=FV=XfViXvWVKvpe6vOz6fzMXiD41RzA3ZWC8EbO5exn2ufQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] libfdt: overlay: Update base /__local_fixups__
 on apply
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > When `fdt_overlay_apply()` merges an overlay into a base device tree, i=
t
> > updates `/__symbols__` in the base tree if present, but previously left
> > the base tree's `/__local_fixups__` node untouched.
>
> Please can you put the motivation first and use the present tense
> ('fdt_overlay_apply() updates /__symbols__ but leaves
> /__local_fixups__ untouched...')? It would also help to say why anyone
> needs an accurate /__local_fixups__ in the merged tree. Patch 8 gives
> the reason (an OS that wants to know which cells hold phandles, and
> the merged tree matching what 'dtc -L' produces), and that belongs
> here, since this patch changes behaviour for every libfdt user.

Done. Rewrote the commit message in the present tense with the motivation
up front.


> > +             next_lf =3D fdt_subnode_offset_namelen(fdt, node, name, n=
amelen);
> > +             if (next_lf =3D=3D -FDT_ERR_NOTFOUND && create) {
> > +                     char namebuf[256];
> > +                     int old_struct_size =3D fdt_size_dt_struct(fdt);
> > +
> > +                     if ((size_t)namelen >=3D sizeof(namebuf))
> > +                             return -FDT_ERR_INTERNAL;
> > +                     memcpy(namebuf, name, namelen);
> > +                     next_lf =3D fdt_add_subnode_namelen(fdt, node, na=
mebuf,
> > +                                                       namelen);
> > +                     if (next_lf < 0)
> > +                             return next_lf;
> > +                     if (next_lf <=3D ancestor) {
> > +                             int delta =3D fdt_size_dt_struct(fdt) -
> > +                                         old_struct_size;
> > +                             target +=3D delta;
> > +                             ancestor +=3D delta;
> > +                     }
>
> I can see why the copy is needed, since the name is in the same blob
> and fdt_add_subnode_namelen() may move it. But libfdt has no limit on
> node-name length, so a valid tree with a long name makes
> fdt_overlay_apply() fail with -FDT_ERR_INTERNAL, which is meant for
> libfdt bugs. It also puts 256 bytes on the stack in code that runs in
> bootloaders. Please can you either avoid the copy (e.g. by re-reading
> the name after the splice, adjusted by the delta) or at least return a
> proper error code and document the limit?

Done! Removed `namebuf[256]` completely and instead re-read `name` from
`ancestor` (adjusted by `delta`) after `fdt_add_subnode_namelen()` when
`next_lf <=3D ancestor`.


> > +static int overlay_add_local_fixup_offset(void *fdt, int lf_node,
> > +                                       const char *name, int name_len,
> > +                                       uint32_t poffset)
> > +{
> ...
> > +     } else {
> > +             if (old_len % sizeof(uint32_t))
> > +                     return -FDT_ERR_BADSTRUCTURE;
>
> -FDT_ERR_BADSTRUCTURE means the structure block is corrupt. Elsewhere
> in this file (e.g. overlay_symbol_update()) a badly sized property
> value gives -FDT_ERR_BADVALUE, and if the property came from the
> overlay's /__local_fixups__, -FDT_ERR_BADOVERLAY fits better.

Done. Changed this to return `-FDT_ERR_BADVALUE`.


> > +static int overlay_validate_local_fixups(const void *fdto, int ov_lf_r=
oot)
> > +{
> > +     int lf_frag;
> > +
> > +     fdt_for_each_subnode(lf_frag, fdto, ov_lf_root) {
> > +             const char *frag_name;
> > +             int frag_name_len, lf_overlay, fragment;
> > +
> > +             frag_name =3D fdt_get_name(fdto, lf_frag, &frag_name_len)=
;
> > +             if (!frag_name)
> > +                     return frag_name_len;
> > +
> > +             lf_overlay =3D fdt_subnode_offset(fdto, lf_frag, "__overl=
ay__");
> > +             if (lf_overlay =3D=3D -FDT_ERR_NOTFOUND)
> > +                     continue;
> > +             if (lf_overlay < 0)
> > +                     return lf_overlay;
> > +
> > +             fragment =3D fdt_subnode_offset_namelen(fdto, 0, frag_nam=
e,
> > +                                                   frag_name_len);
> > +             if (fragment < 0)
> > +                     return -FDT_ERR_BADOVERLAY;
> > +
> > +             if (fdt_subnode_offset(fdto, fragment, "__overlay__") < 0=
)
> > +                     return -FDT_ERR_BADOVERLAY;
> > +     }
> > +
> > +     return 0;
> > +}
>
> Just to check, is this needed? overlay_update_local_references()
> already walks the overlay's /__local_fixups__ against the overlay tree
> from the root, returning -FDT_ERR_BADOVERLAY if a node is missing. So
> by this point each /__local_fixups__/<frag>/__overlay__ is known to
> have a matching /<frag>/__overlay__ in fdto. If I have that right,
> this function and its call can go, which also helps with the size
> issue below.

You're right, `overlay_update_local_references()` has already walked and
validated `/__local_fixups__` against `fdto` before
`overlay_local_fixups_update()`
is called. I've dropped `overlay_validate_local_fixups()` (and also inlined
the single-caller `overlay_fragment_local_fixups_src()` and
`overlay_merge_fixup_into_local_fixups()` helpers).


> > @@ -1771,6 +1771,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
> >         ret =3D overlay_symbol_update(fdt, fdto);
> >         if (ret)
> >                 goto err;
> >
> > +       ret =3D overlay_local_fixups_update(fdt, fdto);
> > +       if (ret)
> > +               goto err;
> > +
>
> One thing I'd like to check before this goes in.. this changes what an
> exported function does. A base with /__local_fixups__ now needs more
> free space (so it can hit -FDT_ERR_NOSPACE where it did not before),
> and unrelated empty nodes under /__local_fixups__ get pruned. Please
> can you update the fdt_overlay_apply() comment in libfdt.h to describe
> the new behaviour?
>
> Code size is also worth a look. With -Os, the fdt_overlay.c text grows
> from 3040 to 4904 bytes on Thumb-2 and from 4770 to 7983 on x86_64,
> about 60%. That code goes into things like U-Boot SPL, mostly for
> boards whose base has no /__local_fixups__ at all. Could this be made
> optional for size-sensitive users, or at least slimmed down? What do
> you think?

I've updated the `fdt_overlay_apply()` doc comment in `libfdt/libfdt.h`,
slimmed down the implementation as noted above, and gated `/__local_fixups_=
_`
handling in `fdt_overlay_apply()` behind a 3-state compile-time
`FDT_OVERLAY_LOCAL_FIXUPS` option in `libfdt/libfdt_internal.h`:

- `0` (`FDT_OVERLAY_LOCAL_FIXUPS_IGNORE`): Leave `/__local_fixups__`
  untouched. I made this the `#ifndef` fallback in `libfdt_internal.h` so
  that embedded projects (like U-Boot SPL) that compile `libfdt/*.c`
  directly get zero code-size increase and zero behavior change unless they
  opt in.
- `1` (`FDT_OVERLAY_LOCAL_FIXUPS_STRIP`): Delete `/__local_fixups__` from
  the base DTB if present (~50 bytes of code), avoiding leaving a stale or
  incomplete `/__local_fixups__` node in the merged DTB.
- `2` (`FDT_OVERLAY_LOCAL_FIXUPS_UPDATE`): Fully update `/__local_fixups__`
  in the base DTB. This is enabled by default in `dtc`'s Meson
  (`-Doverlay-local-fixups=3D2`) and Make (`OVERLAY_LOCAL_FIXUPS=3D2`) buil=
ds
  for desktop tools and tests.

Let me know if that works well for you or if you'd prefer a different
default!


-Doug

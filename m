Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019423;
	b=pd88MEhow4FwMvGRdm5dVXSNmK/87TPLDg+pA07FAdjzT/XA9d595+ZsurV4av0tdhvt
	 wVpDHuNoD9cpffbYvLcRIwt0tjnnBOhFMJ0iguNvpvg8kFS9JogmY5Rx0TN9DRb5DDwGg
	 Al+eoJM2GhWWPtXfqGr+7Yoh093grZqKzAug9iivdvzSef1FpMTZtND9gW0FI6p3QebtZ
	 H4PP0qeNm1UvKYsxINF6fzTRAs9TdJ9TIRaYaT6PhAWPxh7EkwTYejLNtUUVin0Qk2kgE
	 oJ5dgvcgrzIhzrrkqTqc5nXdmD8cyEmLShSs6lGDXKcHlIF/U0ZJvvpNt9g7W3pK5pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tMihTp7k9HfQ/8WT1EdahC/mJogWkkiaf1y46HrJoVo=;
	b=kcDVd8PCev2SbFspqASt8zWJzqefXdWjVYFSFBM6tOZf2RmDjGdSJQgqpco8xb3Fc7e6
	 xSW3StxX5xU1Gfb1OwlFm/Khgr+NzNgq/DN0eaw9M//qmuH1i58JKwKWRFliPWPYaYoSC
	 YniQnJQYqNurCpZ0rpl/MndUJ3SjkhyyGfne6YldKqCmUZ8dgTduSlbNkvAzSBakXTOgR
	 DtH/n6IcfJWw2gNN61fbK3O9+mPe0cyPALLVjpiSMTFURc9sy9mhU0ppKrtLUs5l84OGf
	 +gyYAE/Shl+Kx9GObXEvlk4FfxaI1QbtT4CW+0QiGoZlmTAFHJ8DpEOtqlsW7YtDBEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cYCqV7cQ;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E42C606A326
	for <Devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E42C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cYCqV7cQ
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso972726a12.3
        for <Devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794019421; x=1794624221; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMihTp7k9HfQ/8WT1EdahC/mJogWkkiaf1y46HrJoVo=;
        b=cYCqV7cQIwyEWV1XW564gYTf0iRXH7zH6Xl2UA2uM3lmQvzMQxSmsEedYcqeklmmYV
         1nHdgBU7MWjH/tqHM24RJ5Ts9esIUg7ppa73umy3qUMTfgsbugUvOH+imfnrM8mkogvf
         uKZuHCBDEI8go12NJOReKX7FEdscrvulCEcXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019421; x=1794624221;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tMihTp7k9HfQ/8WT1EdahC/mJogWkkiaf1y46HrJoVo=;
        b=PGjvH72ooyaJ3g2uLBODWuKcdMI/GWynih55VZd6q/QGq7vhH/NNX6Md/vwXdW5E8u
         S/I9iz1VNu8IcDae6/LS1IzPwegcFkknaUiFc9cTKgqhVXfO6UYtcoD0fpliQKrkXmyJ
         Xun37d3Xnel84rVCGemg+dJTCmzun4cwqlKPyVp1PasMhqT+EU67VgHh+V8SrbWDdLCA
         VK8TNLA7nlxPkigp/fWMhlEO45eZrlkARWlX3ur38SdMZjbtTdqU89PlrUnhFMlWuTas
         13huFEyLFQJiLMcBfhkiAVFL6W5CavAVIILMjhUg4mk/hsDd/xrCwmXPWhu4O/wH2wAC
         aU2g==
X-Forwarded-Encrypted: i=1; AL+hErHL/B2Y7MRW7IEEf2QF2Cr3NQ8CSrQ7A1ICrzSg5BENO1emCm4afTnewpfv7hy74rszxqvdSKJbGDFa@vger.kernel.org
X-Gm-Message-State: APuU4Z/rMi08oKtvSDtz567kdfzsQsZrMngVwaqFIdU9loN0mPVldp2n
	1HhOENvLXaUYeivb2ylgruQnd72N2EaWsbIj9tTFOtx803hry/LuG5FVoLF7DTMY3BJXhTXTaIJ
	WLxID7181
X-Gm-Gg: AYBFou1V9ffEdFD2wvPW6VzC0z+R8ywlW4v6qiCHcRmkhBvM1Y0LImdcUlVVDA/HMVQ
	neTZhuK/FW0+IocTGkXgZww4W+SkmDJ0D7RUniQivVqhPj3WoM4KTruxwOnhnP23wHIN/3IIpw9
	5wj+WZMOEpFwMgrl2UBAnjx7R350ZJOv+qFv9c8geE2Kl1MK0QqFJ8THpPlYy87TYSRwXOVYTZa
	5h+beDJ3BISxMSf3wChwd3aG6PNwascEGfQni12FzNPOd7Wrx30ZhACH4ZUe+UHFCgZS09tvEj7
	SVOdnUEAu5AbRkkw6X5WG/QgdYmernuwG7wCudeib15zU/JnbXcceOw6GFAs4IolaSdCTnX6b1M
	HmJFfzIWh5jkdeFuPniaj6N94mRpRy5npuWPyHmMZWEd8fap4mbFfSvzpIbZmLOavAkymKSd88A
	Bp+z8HpNu4gBF+XCxSuieOPoNhmmR9+ZZOj7GLca8zJDt9vuYQ6rLDXuZgpM28IKyy42oEsNafN
	FEGwaO4w82CPtPbs1Byw57dkyoMohPIb/IyeWzaJ+5atU3tyXhSYkirpoDoQBQW8PsMzI9vJd6M
	6CFck2kNx5hWXREhDvmIXyiEHAKHbqPmlQj1b5DytlOs57OsysEu/fW3BfLTF9ekR+s=
X-Received: by 2002:a05:6402:5d4:b0:6af:dccb:acbe with SMTP id 4fb4d7f45d1cf-6b597524728mr3271676a12.5.1794019421617;
        Fri, 06 Nov 2026 18:43:41 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664b16606sm1262947a12.28.2026.11.06.18.43.41
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 18:43:41 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so10182075e9.3
        for <Devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:43:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzJAXAJAiDnf6xOezm4GwtgrPMfMgtWtAIVOAb7DgL3Hz7XClw6SJtB/U7jmTFy654lSqdgTxUFF3TC@vger.kernel.org
X-Received: by 2002:a05:600c:1989:b0:4a2:397:73fd with SMTP id
 5b1f17b1804b1-4b6ddcf58d4mr71646075e9.12.1794019420156; Fri, 06 Nov 2026
 18:43:40 -0800 (PST)
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
 <20261101220224.1436242-12-dianders@chromium.org> <CAFLszThLk8zag3CK6FD2-vbGD1qiWoAXu9AturXgWbJS9vQ=7w@mail.gmail.com>
In-Reply-To: <CAFLszThLk8zag3CK6FD2-vbGD1qiWoAXu9AturXgWbJS9vQ=7w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 18:43:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UtOj+xxbdj=kCTmBLcUzLFiKnF3SR785-4VR7LHsjtPg@mail.gmail.com>
X-Gm-Features: AclHuK_xBMh5T2Ee19xsoScbltCMtlYr7_uxL9cseOpA5WDwtXTsMMp1O_G3SpE
Message-ID: <CAD=FV=UtOj+xxbdj=kCTmBLcUzLFiKnF3SR785-4VR7LHsjtPg@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] libfdt: overlay: Update base /__local_fixups__
 on apply
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Wed, Nov 4, 2026 at 6:08 AM Simon Glass <sjg@chromium.org> wrote:
>
> > +               name = fdt_get_name(fdt, ancestor, &namelen);
> > +               if (!name)
> > +                       return namelen;
> > +
> > +               next_lf = fdt_subnode_offset_namelen(fdt, node, name, namelen);
> > +               if (next_lf == -FDT_ERR_NOTFOUND && create) {
> > +                       int old_struct_size = fdt_size_dt_struct(fdt);
> > +
> > +                       next_lf = fdt_add_subnode_namelen(fdt, node, name,
> > +                                                         namelen);
> > +                       if (next_lf < 0)
> > +                               return next_lf;
> > +                       if (next_lf <= ancestor) {
> > +                               int delta = fdt_size_dt_struct(fdt) -
> > +                                           old_struct_size;
> > +                               char *new_name;
> > +
> > +                               target += delta;
> > +                               ancestor += delta;
> > +                               name = fdt_get_name(fdt, ancestor, NULL);
> > +                               new_name = (char *)(uintptr_t)fdt_get_name(
> > +                                       fdt, next_lf, NULL);
> > +                               memcpy(new_name, name, namelen + 1);
> > +                       }
>
> Almost, but the pointer passed in still goes stale (my suggestion of
> re-reading the name missed this). When /__local_fixups__ comes before
> the target in the blob, 'name' points into data which the splice in
> fdt_add_subnode_namelen() moves, so its memcpy() reads from the wrong
> place and can overlap the destination. The final tree is correct
> because this code rewrites the name afterwards, but the overlap is
> undefined behaviour. With ASan and -fno-builtin-memcpy, I get
> memcpy-param-overlap at fdt_rw.c:405 for a base with /__local_fixups__
> immediately before the target node, where the name is longer than 4
> characters.
>
> Please can you avoid passing a pointer into the blob? A small internal
> helper which does the splice and then copies the name from its new
> location would also drop the cast, although it needs care not to add
> size to IGNORE builds. Using memmove() in fdt_add_subnode_namelen() is
> the smallest fix, but it still copies a stale name. What do you think?

Got it. Splitting out an internal helper `fdt_add_empty_subnode_()`
in `libfdt/fdt_rw.c` (and having `fdt_add_subnode_namelen()` call it)
works really nicely here. Since `fdt_add_subnode_namelen()` shares the
same implementation via `fdt_add_empty_subnode_()`, there is no code
duplication in `fdt_rw.c`, and it also avoids repeating
`fdt_subnode_offset_namelen()` and drops the cast:

In `libfdt/fdt_rw.c`:

+int fdt_add_empty_subnode_(void *fdt, int parentoffset, int namelen,
+                          char **namep)
+{
+       struct fdt_node_header *nh;
+       int offset, nextoffset;
+       int nodelen;
+       int err;
+       uint32_t tag;
+       fdt32_t *endtag;
+
+       /* Try to place the new node after the parent's properties */
+       tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
+       /* the fdt_subnode_offset_namelen() should ensure this never hits */
+       if (!can_assume(LIBFDT_FLAWLESS) && (tag != FDT_BEGIN_NODE))
+               return -FDT_ERR_INTERNAL;
+       do {
+               offset = nextoffset;
+               tag = fdt_next_tag(fdt, offset, &nextoffset);
+       } while ((tag == FDT_PROP) || (tag == FDT_NOP));
+
+       nh = fdt_offset_ptr_w_(fdt, offset);
+       nodelen = sizeof(*nh) + FDT_TAGALIGN(namelen+1) + FDT_TAGSIZE;
+
+       err = fdt_splice_struct_(fdt, nh, 0, nodelen);
+       if (err)
+               return err;
+
+       nh->tag = cpu_to_fdt32(FDT_BEGIN_NODE);
+       memset(nh->name, 0, FDT_TAGALIGN(namelen+1));
+       endtag = (fdt32_t *)((char *)nh + nodelen - FDT_TAGSIZE);
+       *endtag = cpu_to_fdt32(FDT_END_NODE);
+       *namep = nh->name;
+
+       return offset;
+}

And in `overlay_fragment_local_fixups()` in `libfdt/fdt_overlay.c`:

                next_lf = fdt_subnode_offset_namelen(fdt, node, name, namelen);
                if (next_lf == -FDT_ERR_NOTFOUND && create) {
                        int old_struct_size = fdt_size_dt_struct(fdt);
                        char *new_name;

                        next_lf = fdt_add_empty_subnode_(fdt, node, namelen,
                                                         &new_name);
                        if (next_lf < 0)
                                return next_lf;
                        if (next_lf <= ancestor) {
                                int delta = fdt_size_dt_struct(fdt) -
                                            old_struct_size;

                                target += delta;
                                ancestor += delta;
                                name = fdt_get_name(fdt, ancestor, NULL);
                        }
                        memcpy(new_name, name, namelen);
                } else if (next_lf < 0) {
                        return next_lf;
                }

> Also, gcov shows that the tests never reach this creation code, in
> either direction. As far as I can tell, each target is either the root
> or already has a node under /__local_fixups__. Please can you add a
> case where the target has no such node, with /__local_fixups__ both
> before and after it in the blob? tests/overlay.c already creates it
> first in the root, so that ordering should be easy to cover there.

Done in my draft v4. Both `tests/overlay.c` and `tests/run_tests.sh` had
pre-created `/__local_fixups__/test-node` before applying the overlay,
so `overlay_fragment_local_fixups()` always found `test-node` already
present. I've added `fdt_overlay_local_fixups_create()` in
`tests/overlay.c` to test an empty `/__local_fixups__` (with no
`test-node` child) both before `/test-node` (`lf < tn`) and after
`/test-node` (`lf > tn`) in the blob.


> > +    # verify that /__local_fixups__ in a -L base blob is updated when applying an overlay
> > +    run_dtc_test -@ -L -I dts -O dtb -o overlay_base_phandle_lf.test.dtb "$SRCDIR/overlay_base_phandle.dts"
> > +    run_wrap_test $FDTOVERLAY -i overlay_base_phandle_lf.test.dtb -o overlay_base_phandle_lfO.test.dtb overlay_overlay_phandle.test.dtb
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b a
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b d
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/c b
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d a
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d b
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d c
>
> These assume UPDATE, so 'meson test' fails for me with
> -Doverlay-local-fixups=0 (7 failures in the fdtoverlay suite).
> tests/overlay.c handles each mode with #if, so please can you do the
> same here, e.g. by passing the setting to run_tests.sh and skipping or
> adjusting these checks?

Done in my draft v4: `tests/meson.build` and `tests/Makefile.tests` now
pass `OVERLAY_LOCAL_FIXUPS` to `tests/run_tests.sh`, and both
`fdtoverlay_tests` and `fdtfactor_tests` adjust their `/__local_fixups__`
checks so `meson test` passes under `-Doverlay-local-fixups=0`, `1`,
and `2`.


-Doug

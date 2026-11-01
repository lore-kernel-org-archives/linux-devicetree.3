Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571186;
	b=a+lA/ldrJYeNYAaIqJpzshQuTP0Br+gk1AWwoxTnp63Frs7pBSyaBWJsbJFzgHOwk/9m
	 zyWcTiWvu4I/7+IAfe55fcVZFu/D++v32pwsM5HvSJongwA69I/4TfMxMJx6fTQEz2SO/
	 j/V9nLnL8yg46p1pQw/y9hC/WLyX8rH+QnY/1TrqFEFi7xI5rE0zg8t2UwNcxyyT28fX9
	 CSaSqec8svwmdwT7zif8tzjBIylDTN6qeBbR8s6PObiEN1zG2CBmNnd9GfegC9W4dFXPN
	 4SvUb9EQDZg2mtJ6YLyKtoOs0Cav5Ge3s4HyZbRbqJRz1YEdPQQ2bWeOGpgEmpMZ8Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c5dfra6mnkj3XXcKxeo1MNyxkDUwNUZ/PcTct9GIh04=;
	b=vR7F6adTRbkGhOTdd180ZroLBBKpM4pcy4IMMI1/memZh7W9cEMf7cGlJT46lugDhM7O
	 oAvU1xKyKf8s8v9scWg4g+tIEZH422jIAb1cW313zCe+Iy6+ws0Rxf4bV1s/8LwZiqSzd
	 rrn+telzfCEVdKSo713wr3fdQoVzRk20Hx+5SLdA7iLIgXSSB4yaU4eyLMlw779Eqo8Z4
	 KSH/GIhKwg96Wxd7iBYtQYk/4iEtp5goNqNCMALqpjc36NO4UFIXN/OU21fsN8BkLcyNK
	 k3gnQcpeqkkp+DjmzqZJvb1m8MddN9dLD0stuNCAjljpcWMzu5pnYnTvbDyrvqmRbmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=S++BokSY;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED30B606A324
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED30B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=S++BokSY
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab01c46697so25068191fa.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793571184; x=1794175984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c5dfra6mnkj3XXcKxeo1MNyxkDUwNUZ/PcTct9GIh04=;
        b=S++BokSYk9NR96QvjjnSR20U6inK1EYslKh/LZ288SM6gnh2aLsUnwNdP+YIiwyRrQ
         QuuuhrJdichebY/SSlGY52DckHaFiyGXm+/I70zns+zyHduMHkhB+auo1vNAfjAKC4RI
         I8+/qkobT8lN6eXBbF4zJNBVmgQLOXCfC79vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571184; x=1794175984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c5dfra6mnkj3XXcKxeo1MNyxkDUwNUZ/PcTct9GIh04=;
        b=DNTdihKmu+acfFcaAbBrEa79U9PR5Stj2N8PT8sDe/PIxgxeW/0+rGIedt3V5wgex7
         +LmxAXvLcS3YzUfbyAFSbA6ofjHmNveoFFSPR+VLyh66Q14P6G2sxLG80FSC5Iie5qgl
         VWzDBQezodAQgtCeHn0rTQKhol3d+Ycz2IUtLtnAiW+BLmZZA9vZo+QYm7fpUeLmdD7t
         PWR0y89gXJ0xNy2gudzYxsVGuoL1puliurKjMuJreWMIySWedmg4FIfTSqnvtIalG4RV
         i362JHAEoAKwHe5ykwCVit/vV2aQHoiZji2SOrLHgefJOVMZsqa5unAyv674xYy9RVl3
         lgLw==
X-Forwarded-Encrypted: i=1; AKwUvBwNuGN+5y3OyLDZd2WiacKUT3YDPgxIzvEXdwbCrt470pBl3a/IhCScFAWmePvK18+WitrnwxduHDJR@vger.kernel.org
X-Gm-Message-State: APuU4Z/SkNnPg0/BcOej4bTQ5syewBvCXxumuFktmxnnTuhiGogGFsGF
	OFwF7A2DztO0muoOc8/rwP7SiMNOz0KuyOY54Ue98trjLoVnqTKSJlx4lbL2LzgP9SO4E2QBRwq
	NxQHAyije
X-Gm-Gg: AYBFou0d0kFH1SAgCp8tn6ndy/vaDEnz4V/LPUm7xVdecAHKXzEux6D5bl+7YaJtr0X
	ObHfd8gTOadVFXfnUCw06nqWUnj19bf1OTsNey3FOWgIOEDgsU0t0GarTr+RKdmEbGmvVRc/Dsw
	cjgecsn7QUmnl/8UusPvgMnmOgMgB8XZm93bd/L6QIyuPMnf53ROj+YzuBpxjB2zxfrfWPwA/vY
	A9A4XXYYrN9NL8NjlDDeozNnnUx/Rk78q/1pcRX5lhTaQrVuIvdJ/MxUPQJLuM2Ep1mUkOGx7hD
	kyGTWOwXag6Aimb8e4T/ug5uhX/KRvpoBtjwNw8D+HlYDatbq+UBwwXGWxurGYBrGpQIsinhsS/
	Sta7QKU3a9U9uzXU4KC08089MAhPya0ScVJB33L3wi1GB9My/BYTqViQ+EjEB0wT9PZPWO2XhiR
	J3NWJ12epSnMDw2//CSzMOzlRmzFor195Hyy5hJ9MghUeYUbCDthzWwNeSmUGFOiotYIsUSg3oC
	1ndGwWFW43eQHeRY4tHEuedhdCNqdarsbYl0HKvLRVG+OerZE3tuS2qmp6//FBmyqXy1gBI3B0d
	0mDYfAn4hujKomTow1QDq5ypYGrJo6QYGAeXExLENZbHPerEfLwjY2m7Esb8oEC6jLbQHmo=
X-Received: by 2002:a2e:bea2:0:b0:3ab:2d74:720 with SMTP id 38308e7fff4ca-3acb7a8c495mr20477421fa.19.1793571184080;
        Sun, 01 Nov 2026 14:13:04 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbebe9f7sm17213631fa.11.2026.11.01.14.13.03
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:13:03 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab01c46697so25068131fa.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:13:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByxis0ice2JWKIYJDCRS7TfOKjxiVS6jWNTt9oIhdH6BOKSfxNxiZphFmq0qZCLSAWyzVSFR8DzjVhl@vger.kernel.org
X-Received: by 2002:a05:6000:2c0f:b0:48b:68:594a with SMTP id
 ffacd0b85a97d-48e6e2e7798mr18180529f8f.12.1793570721533; Sun, 01 Nov 2026
 14:05:21 -0800 (PST)
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
 <20261028215600.1713475-7-dianders@chromium.org> <auR-OXOpim7dVTpH@gractus.seuss>
In-Reply-To: <auR-OXOpim7dVTpH@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WLMKquyc_j+gwF5Oz028=yddiq83o2tSCBWcJgTDs8xw@mail.gmail.com>
X-Gm-Features: AclHuK9b_8waCxraHHPdtbLhS5x_dJgluJUdAHgQfu4VL-m5sl2trg3HRikQmXo
Message-ID: <CAD=FV=WLMKquyc_j+gwF5Oz028=yddiq83o2tSCBWcJgTDs8xw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] libfdt: overlay: Update base /__local_fixups__
 on apply
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Oct 30, 2026 at 3:24=E2=80=AFAM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Oct 28, 2026 at 02:55:56PM -0700, Douglas Anderson wrote:
> > When `fdt_overlay_apply()` merges an overlay into a base device tree, i=
t
> > updates `/__symbols__` in the base tree if present, but previously left
> > the base tree's `/__local_fixups__` node untouched.
> >
> > Add `overlay_local_fixups_update()` so that when the base tree contains
> > a `/__local_fixups__` node, `fdt_overlay_apply()` updates it to reflect
> > the applied overlay:
> > - For each fragment in application order, any local fixup properties in
> >   the base tree's `/__local_fixups__` that correspond to properties
> >   overwritten by that fragment are cleared first.
> > - Local phandle references from that fragment's subtree under the
> >   overlay's `/__local_fixups__/<fragment>/__overlay__` are merged into
> >   the corresponding target path under the base tree's
> >   `/__local_fixups__`.
> > - External phandle references for that fragment from the overlay's
> >   `/__fixups__` (which are now resolved to local phandles in the merged
> >   base tree) are added in sorted order to the base tree's
> >   `/__local_fixups__`.
> > - Any subnodes under the base tree's `/__local_fixups__` that become
> >   empty after clearing overwritten properties are pruned.
> >
> > If the base tree does not have a `/__local_fixups__` node, nothing is
> > added.
>
> So, this turned out to be substantially more involved than I realised.
> I wonder if it might be better to make --strip-locals the default, and
> only add support for preserving the local fixups as a later extension.

In v3 I went ahead and addressed all of your and Simon's review comments on
this patch (which also trimmed ~80 lines of C from `fdt_overlay.c`).

To address Simon's point about code size in constrained environments like
U-Boot SPL, I also gated `/__local_fixups__` handling in
`fdt_overlay_apply()` behind a 3-state compile-time
`FDT_OVERLAY_LOCAL_FIXUPS` option in `libfdt/libfdt_internal.h`:

- `0` (`FDT_OVERLAY_LOCAL_FIXUPS_IGNORE`): Leave `/__local_fixups__`
  untouched. I made this the `#ifndef` fallback in `libfdt_internal.h` so
  that embedded projects that vendor `libfdt` directly get zero code-size
  increase and zero behavior change unless they opt in.
- `1` (`FDT_OVERLAY_LOCAL_FIXUPS_STRIP`): Delete `/__local_fixups__` from
  the base DTB if present (~50 bytes of code), so a stale/half-working
  `/__local_fixups__` node isn't left behind in the merged tree.
- `2` (`FDT_OVERLAY_LOCAL_FIXUPS_UPDATE`): Fully update `/__local_fixups__`
  in the base DTB. This is enabled by default in `dtc`'s Meson
  (`-Doverlay-local-fixups=3D2`) and Make (`OVERLAY_LOCAL_FIXUPS=3D2`) buil=
ds
  for desktop tools and tests.

Even when `fdtfactor -S` is used, we actually do need `fdtoverlay` to
update `/__local_fixups__` for two reasons:

1. **Kernel composite DTBs (`foo-dtbs :=3D base.dtb bar.dtbo`)**: In the
   Linux kernel build (`scripts/Makefile.dtbs`), many upstream boards are
   built as composite DTBs using `cmd_fdtoverlay` (`fdtoverlay -i base.dtb
   -o foo.dtb bar.dtbo`) *before* `fdtfactor` runs on them. As Simon
   pointed out on the kernel series [1], if `fdtoverlay` left
   `/__local_fixups__` untouched (`IGNORE`), `foo.dtb` would still have
   `base.dtb`'s `/__local_fixups__` node (missing all phandle references
   from `bar.dtbo` and retaining stale offsets for any overwritten
   properties), causing `fdtfactor` to silently miss or corrupt phandle
   references when factoring `foo.dtb`. And if `fdtoverlay` stripped
   `/__local_fixups__`, `foo.dtb` wouldn't have `/__local_fixups__` at all
   and `fdtfactor` wouldn't be able to factor any composite DTB.
2. **`fdtfactor` self-tests**: Since `fdtfactor` inputs are compiled with
   `dtc -@ -L`, having `fdtoverlay` update `/__local_fixups__` lets the
   test suite directly verify with `dtbs_equal_unordered` that recombining
   `base.dtb` + `board.dtbo` produces an exact match for the original input
   `.dtb` (including all phandle fixup metadata).

Let me know if you're happy with this approach (or if you'd prefer a
different `FDT_OVERLAY_LOCAL_FIXUPS` default)!

[1] https://lore.kernel.org/all/CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=3DQFv=
4DyXNpWY6w@mail.gmail.com/


> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index a19eb1bc4bd8..bf1b9044ff2a 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -804,7 +804,7 @@ static int overlay_prevent_phandle_overwrite(void *=
fdt, void *fdto)
> >   *      Negative error code on failure
> >   */
> >  static int overlay_apply_node(void *fdt, int target,
> > -                           void *fdto, int node)
> > +                           const void *fdto, int node)
> >  {
> >       int property;
> >       int subnode;
>
> This change is unrelated to the rest of the patch.

Split into its own standalone preparatory patch ("libfdt: overlay: Make
fdto const in overlay_apply_node()").


> > +static int overlay_create_path(void *fdt, int parent, const char *path=
,
> > +                            int path_len)
> > +{
> > +     const char *sep;
> > +     int node =3D parent;
> > +
> > +     while (path_len > 0 && *path =3D=3D '/') {
> > +             path++;
> > +             path_len--;
> > +     }
>
> In Python, I'm pretty happy to have the code to optionally allow extra
> slashes to make the functions more widely useful.  In C - especially
> since this is code that may be run in limited environments - I'd
> prefer to pin down exactly what the expected format is and require
> that.  So, I'd suggest this function only take a relative path, and
> make sure that's the case from the callers.
>
> > +     while (path_len > 0) {
> > +             int comp_len;
> > +             int next;
> > +
> > +             sep =3D memchr(path, '/', path_len);
> > +             comp_len =3D sep ? (sep - path) : path_len;
> > +
> > +             if (comp_len > 0) {
>
> Similarly, in C I'd treat comp_len =3D=3D 0 as an error condition, rather
> than trying to handle it.
>
> > +                     next =3D fdt_subnode_offset_namelen(fdt, node, pa=
th,
> > +                                                       comp_len);
> > +                     if (next =3D=3D -FDT_ERR_NOTFOUND)
> > +                             next =3D fdt_add_subnode_namelen(fdt, nod=
e, path,
> > +                                                            comp_len);
> > +                     if (next < 0)
> > +                             return next;
> > +                     node =3D next;
> > +             }
> > +
> > +             path +=3D comp_len;
> > +             path_len -=3D comp_len;
> > +             while (path_len > 0 && *path =3D=3D '/') {
>
> Same thoughts here.

Done. `overlay_create_path()` now requires a strict relative path and
returns `-FDT_ERR_BADOVERLAY` if `comp_len =3D=3D 0` (leading `/`, repeated
`//`) or if `@path` has a trailing `/`.


-Doug

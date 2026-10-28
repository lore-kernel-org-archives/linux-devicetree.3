Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224718;
	b=k2KwR3dvhQXK1n4Bv2WZcz3O0wFqfKnXZVcR5u3DXEdrqg90SqUGo2FUYUr3ddof04vB
	 Ur4oh3UciNhUpT9HdK0yahjqM+aL5c4MTuK/7vBSOrruedp969JqNJ8a7WR6ekSJ+p8cD
	 N4Iy0Qh4RjZjwtQWj9eFMDS/SPtC3O6GX79Cmi76AOoQ8s1lUCXNcSfmbMWKFxf/EeKU6
	 FtplxyWUckd/SA0AepPDrbsxyTBcOowHvTkPFGTv8xLteRjOaq08S4PAhk2sSHBxSxIum
	 D2K3STYtUgYwrnbApQvvMdRO917Ga1PM2EUlSr60iB9JgcWKmVcleYXiOZ0nNHu0xlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yjBj6q9tc23c/gY7l0t6am+Be7ywusZAkkg+litsRmY=;
	b=FepGjqyvnOWdtJQ9gNA3yQ7IkQkSH+HoKggKOPas6sRGYyC8c93OKmLmXgxd5WWK+KAg
	 MkoEsBJM42Xv6KxEmu1jx1sef3auIQ7PoCSCNT70OCSWsTKJ5mkC02d5JVY4hv9CUYpvT
	 RYNoN7pbzrwo20NCxJESDIx5nkvI3UG08psHDAmTF/tPHf3q7MSb4HVtEsVop72xE5Un3
	 LpCK7Ghl0vkKX+UspKn5zKBUSVbhmfQ21Hhr55v0KJsrVtMH1fHlkPoPX179oQoBxTGlw
	 wV/C/HoEHhyYeOVW3KKEI3/Zx8gqo3LFzHi+DuvfP/4F3CT6JmDdAonK40OIhLYbIvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CCVQtAKw;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F6606A31A
	for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D3F6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CCVQtAKw
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c418e215671so192261466b.0
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224717; x=1793829517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yjBj6q9tc23c/gY7l0t6am+Be7ywusZAkkg+litsRmY=;
        b=CCVQtAKwZ2XT7xPg591ycGiU2TE4kkgGhl1Wu8u+gm87OywqYg+84beG8l3ibz8TWV
         gjEFG27gkQbdg/8wlriU1CK6Uqfmjrtv68vvUvsE1KHO98UzlHjhz51dk68iizvxRbyY
         3diDBp+RtZPnAvy/YkhZyFVzTkTUuQ4MuMr0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224717; x=1793829517;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjBj6q9tc23c/gY7l0t6am+Be7ywusZAkkg+litsRmY=;
        b=Z1aSkZ9qcF49cfJpvRWpc+An/tKOI7fgPUvejh5UBqDXAVR+oFHGogXlaAPu8nIi+H
         0+lZHMzvdBl/1G3C5STs3GajK+lcEJwx/4k/7MmH8Us6ZVCS3L6k9LZCkrghuYJH9ek7
         QIPsAi9o1r9BtlfatFy2mzzbYy/rhbXSVfNaKfRYJcDtoGxAfhYCOSJlK5tKyhRvTYQM
         Hhn2RUpsdZEVjzeUJjosO/1TsUsSwAr8sGY+tjYpdpGcpBkZhfkIGFHM1zKMxgEzximd
         +09A0rSbMy/EjqZGWUuLjo8wKN9NI7Ko8wV7FcdLKdZxzCjTqLYH2sIzJugbm5VrWsqa
         L4Jg==
X-Forwarded-Encrypted: i=1; AKwUvBydNo/QgyM+32o3DQWiQOQB2gFKEh0LKN36g8ImLp92dnlpKqOKM4BKtGkLAMbvPYwugTy+qrS9unk3@vger.kernel.org
X-Gm-Message-State: AFq9FYKH00TUpqkW6XvNgZYJSdQMfSKiZMHH/14MoQXTwfggmLxjVnlI
	YKM0em5azeP8yI5XQhkUtH7/urKeg3rJn6TEHd/Uk8PgQoA+DcVCGkBkVIaRK9rldOpKhGsui6w
	GI5JJ297v
X-Gm-Gg: AYBFou1MFJr6lkaJ5aKm/vzC7vtEAElNqE8p8WtqugqRoZNAkP6qmr900U0h8Pa2RWE
	EzWRRynPoC5V/dZaV86N8JzbesUaTnH4QtlVXAnssNa5PqOkq7Sgz9QHoy4Vq56SWtA03hSZkx7
	7sxEeHEM9fP6xblmd7VG2WDCuzoJ9oLJ2UZ/gKNmGOUfV3QRwZQ0S7pCBVcJbwSoRxHR4jqg8fK
	gCLX1jc/CuXUhvfnapXu/B1Vly4K6LvpLWoQKFa6SLxrqJIuiw6CRS8vAMMr8pMfHTjzdIyBok1
	Nw9h+SvpAZ5ls+HVqJiksjO4e+cN0euCAw0r49tD4kuQebuSwFGYrHLE+rdlcFFWVXJ0O13Af8T
	AU6kONLXcJf5YhwLZCqa0kR5gvoscfv5ribUg1Kd7Fd3ndJYESh+rhnzQhHTJKEX6BPJ+GkL9Zc
	t/dbpwQyRFb14OgMnx9rXQdjNPgoyfCOAh6ePppaxQIISZypFONJzPcRz3P2891PawQbFTcWo42
	U94phdZsziZBDtmGeHlMnEYVPFBkAaFMReDPHr5GtWQjEuCY18agwtLNUvqxZDIISlx3OqHeuzS
	QzZgwScudOCdRd9axz01zF5jpppND3BQr4hutxT7sAy9umjrFwZUeZllejmQbarpVdy9
X-Received: by 2002:a17:907:9d1a:b0:c45:c030:732a with SMTP id a640c23a62f3a-c49bdf2ff34mr347612866b.35.1793224716863;
        Wed, 28 Oct 2026 14:58:36 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd35004asm647070966b.4.2026.10.28.14.58.36
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:58:36 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso10237115e9.0
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:58:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByNAeCqiopn8lkqNeFiHkJTskbBSv5iMVmQAExgK56Z+iJpOCC+eiRF2Qu1W+T4dbLvsZo9ZCACWnY0@vger.kernel.org
X-Received: by 2002:a05:600c:6989:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a9647aabc3mr76897285e9.2.1793224715600; Wed, 28 Oct 2026
 14:58:35 -0700 (PDT)
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
 <20261015182221.2931742-5-dianders@chromium.org> <CAFLszThA+Fau4_0NEhXA3ntUmPB8wnuaabVvzNU=CMSpoQQgkA@mail.gmail.com>
In-Reply-To: <CAFLszThA+Fau4_0NEhXA3ntUmPB8wnuaabVvzNU=CMSpoQQgkA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:58:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WacyUDJWaH0W09BVBkhFGabUZ3SJ+6L386QHQLhrE9QQ@mail.gmail.com>
X-Gm-Features: AclHuK-VauY5jFIV9iZhwrCVa183QIFYKTVeSrQKaKqMsei3LLLan46HVAC43ng
Message-ID: <CAD=FV=WacyUDJWaH0W09BVBkhFGabUZ3SJ+6L386QHQLhrE9QQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] fdtfactor: Add compiled FIT image factoring support
To: Simon Glass <sjg@chromium.org>
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

Hi Simon,

On Mon, Oct 26, 2026 at 8:31=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +    dtbo_comp_sizes =3D []
> > +    for entry, dtbo_blob in zip(entries, dtbo_blobs):
> > +        img_node =3D entry['node']
> > +        dtbo_comp_bytes =3D compress_blob(dtbo_blob, comp)
>
> One thing I'd like to check, since the README says this targets
> U-Boot. In U-Boot, boot_get_fdt_fit() loads each overlay with
> FIT_LOAD_IGNORED, and decomp_image() skips decompression in that case.
> So a compressed overlay goes to fdt_open_into() as-is and fails, which
> means the lz4 FIT that the test produces would not boot with U-Boot. I
> suspect U-Boot should be fixed. Until then it would be worth having an
> option to leave the overlays uncompressed (they are small anyway), or
> at least a note in the README.

Added a note in the README for this.


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +            for sub_name in list(conf_node.children):
> > +                if sub_name.startswith(('signature', 'hash')):
> > +                    print(
> > +                        f'Warning: Stripping invalidated {sub_name} su=
bnode '
>
> This only strips signatures from the configurations that are changed.
> But the whole FIT is rewritten with FdtSw, which lays out the strings
> block in a different order from dtc. A configuration signature also
> covers the strings block (via 'hashed-strings'), so I believe
> signatures on untouched configurations break too. The user has to
> re-sign with mkimage after factoring anyway, so it might be simpler to
> fail when any signature node is present and say so. What do you think?

_extract_fit_fdt_entries() now raises an error if any
/configurations/<conf> has a signature* or hash*(1) subnode or any
/images/<img> has a signature* subnode


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +def _derive_base_dtb_description(entries, base_dtb_node_name, comp):
> > +    """Derive a `description` string for a factored base FDT image nod=
e.
>
> This is a lot of heuristics for a human-readable description, and the
> results are not obvious (e.g. ['sc7180-trogdor', 'sc7280-herobrine']
> gives 'sc-base.dtb'). It would be worth using something simple and
> predictable instead, such as 'fdt-base-1.dtb' or a description listing
> the images it serves. That would also simplify the tests.

Yeah, makes sense. Done.


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +        placed =3D False
> > +        for grp in groups:
> > +            if grp['key'] !=3D header_key:
> > +                continue
> > +            ref_nodes =3D grp['ref_nodes']
>
> 'ref_nodes' is only the node set of the first entry in each group, so
> the grouping depends on the order of the nodes in /images. For
> example, if the first board in a family has many extra nodes, its
> siblings can end up in a separate group. Comparing against the group's
> common node set (which is what ends up in the base) might be more
> robust. What do you think?

Sounds good. Done.


> For the argparse description, you really have two completely different
> cases...I suggest the FIT part of it should be worded differently so
> it is clear that the result is an update / new FIT.

Reworded in v2.


> mkimage uses -F to indicate an inplace FIT - with -f used for the
> source .its file. It might be better for your tool to use -F instead
> of -f, and then -O (confusing for dtc?) or --outfile to specify
> writing a separate file.

Done.

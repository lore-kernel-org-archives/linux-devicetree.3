Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188518;
	b=ZmiQ5FBIqHE2fP90kbpDoCCYczN51OMxdhJ5uqgvqJdvN0XFD0ChVGQfRKMUi5DfhjjD
	 R9OmEXqK1NHVNaaIq7uSfBQsU2S3OXg2q+lO8V+V9V1v36KwfwIQcaON9fgAyDUEY9OW/
	 cw+GE8Yx3D20+LK2Ss3C3M+QaqQ0fK6kIUkklO7EwFnPfL0PrQZb1dhncezAfwr3pACXZ
	 sFrDieydq2pCRjjK1QM+p9AZ0hAerdPXT5nwPg5AUcd6vNc3eH90iICN7hwkDJzaHxFcc
	 473N+f6HZgYkQpQ8k39Tc312u8roY4pRAOKa+zOyL5zihuxRAMKCmDLZggXV5zJXzwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
	b=O/jG/JgF8cE0UFwClK1iAXAQPaUaFeM/GxIWe9GrnNhflm6kxC20KRqJAZY6j1v0bxQN
	 6x5j0cH0HZk7y1kqZApf4k3jWsFxZrRUTZqWaMvvBhznrRbEeiGLTMKCCT+B6cVEL8gCH
	 eISQpZ3sc8ckj+jDMVKFQJc99Vi7BBS6i3oBBh0bOWarrkU+eFHwSlxYKGpgHoaoWB8uE
	 tSgiJnBxAoRoys/3DEEvpFZ8HGj/O079DMLL9pABEudnDqgwpKyzG8Bx3yG//DtjmA0ll
	 UKtXor8WoEFDmGvAA+FJLfxOeg1soxKQHKsLCvSJ/oKbr1UJoVfGX5E0HgukK1M/lGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dpCi6kq4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B74A606A325
	for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B74A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dpCi6kq4
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso574912a12.0
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:28:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188517; cv=none;
        d=google.com; s=arc-20260327;
        b=VFW7GMBFF2EPpDz9C1DESQSKk1qC+3PJTEL65WLv/IwqHp9qacA/ZnfP1iRW6/M9ph
         c3Cq5SikrVdmZCLFfv+QxwgOUYDkkHahS3dbD933q+UAoE0Sx6Cd56Hhbv8NjcyyTsNl
         UCkKwoAfLhYExrlA6MYih36ddirUqr7/BJ5VZR2X8jIp6eR1njwqp90lSuScQ4VRi3nV
         FyjovJTM71KqUaxRtvO15iOEbaqBAo8K3zLOp/DcFz1+7KR1B43mVgpRGCrWnuKt+bv/
         A+8Mxd0Qfks6nUGJEpyAWMHSqaxxcMu5APOiRmCFVMmdNCitVThnB+n2CcCIqXZFPZfD
         9WOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
        fh=AEiK9yykYURyM8IR3tzJi+IYvFc0ae84HWzus8YzkgU=;
        b=QQqI1hUJqxl3tpImOhy39Oumgwl1EaS3pMLepv5g8Hs4s2jzWGnaIyoadHViQcB7kK
         6YLoLaBZZT6YJfSUxQnBwOhLlDL59nZHr/u6bbbTHk+N/xa5fvFhJstGtRRjqBVvWqBC
         2IdCoQF5NDPkaBtyexpmwcLQOaidshKOfC9KG86UOnQaDlG6fbBmvoKjIoh8b0wMiUk3
         Wi52VbTeq7z4qhX2OYOq60L3pkYsGPA885r0BhuVEkyTyr90D/VL2q59NfBUFa96QCXY
         HKcyMx074PGU1Zk1WS0v42OjJkaBonkPH2viyscTa9TSFLg7+lWTX6CUVw9UDpccAnWI
         fh7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188517; x=1795793317; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
        b=dpCi6kq4CDyvW1thHF5TaHWlZS/A8ljmB+P9fRGWV9YNiFE2znpfEOiQUBp6s2tzK5
         xJjAjM0Ly8IaXS3GAbQ9AIsDzXmUPUhQw5HNK8RQvfaAf7J6EGKIwQz21cNw41YgKm0g
         NuW4+IXdYQ85MXbzQbV8ZkJtuVhZXXvHnGiio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188517; x=1795793317;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
        b=RbwoT/FLs6PoE2SsMOzB0EbbYyvbqtez0QauUqKW/WWn6LAVShfMtZ3+Yl1S5VLC4z
         ldFQf1PGaPfmaS9eh7xgXGf9WScF/+e3gtkj0XQCzbFmhQaGcaG9XlB+zZa2GCjQkxGs
         zck5vuNoy7TiV+DvwjVgHm0Gx2N+mpto+O3YWGUULMYQcE+20SX+4kOa28eTEHgLf1wh
         FioYZi2jMPVOg7nFSROf7XXJ/ZricrGylBHdm6uP+At3GmdYe+U5fbSr2W0O77jUmjuy
         w0z5wCflqTrWh/dWtqMA0kJ6MmAhZ0v8FfiXCCjN5qf+hPr8RjdLSO2Duap9Ma3y45cq
         3oKA==
X-Forwarded-Encrypted: i=1; AL+hErH/G9OAfnyrqDe8ThETrc7dhm597LDcOHvjoTi0naA5YLyA4e6vdksPNG2LbXHcfLUuvyLnkPYjQduS@vger.kernel.org
X-Gm-Message-State: APuU4Z+hby55Y+8pmgp+zLNG8NeAuAixq+D2bIuPEgeZkkb72M6W2ucj
	ladQ+EdP6BBRzfpjR2E6MpDjEFl7tQylDAXuYn5gXr2Q7+4RCerH0b8iaLK/V2YNcY1uZqcv8as
	K05uTfjzCGuTE5JGWss2UkjkV4zv6J5ZSWTWYBVBl
X-Gm-Gg: AZFdTZcqCuE+WN0xx1NyBftymXZN2Phb5Oq0sOZN00FWz0Zcv/9TEoWGcVuFnkeg1Qz
	MGeVjmYmTKr2sOGxMu7VUYabm1fSA2RYT/tCgdJluimH6RYHElId0zL7uruyhlIJyeId7vHJ5GD
	KMoJ4c0xTQyAY+5QJQcgiflYEC5ol1AzqGgI6Kvf6wLzn5K8XGmYpeb13Aql6my7qiyghOl6bnz
	stjetWgk0v/Eeo7UbVU6SeAhb20oyYUoELlFhpLFrFG3/bTynrgfXWM/v8XVTi4UBiw0kj4vw7J
	7BuDV2tlmO9tC3Vyg377YwbqI0HkS1XrX1gBafbXrtRAm4mvx4JpoiFQXA2jUjcmdFMyPtWkVjQ
	fQBv2U7DnSVeYpWvBgCvoS3iwOFsOFwzjvp8B2Y7vwxJFCzrrrY8r+OpRdG4392vf4wULXuc=
X-Received: by 2002:a17:90b:1d02:b0:3b0:9f78:4c18 with SMTP id
 98e67ed59e1d1-3b40a613683mr3653287a91.41.1795188517468; Fri, 20 Nov 2026
 07:28:37 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 07:28:33 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 07:28:25 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261116205320.1621386-10-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-10-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 07:28:33 -0800
X-Gm-Features: AclHuK-qPItHO7bqTa5oLj6xwjAWer8yBK3PhZJ5Dri-PQsIA-QqfOCBITlcfJM
Message-ID: <CAFLszTiAJz=qpc0vLFaS_rNBy2QRx27fi1=fzH=vU040f0ctbQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/14] libfdt: overlay: Update base /__local_fixups__
 on apply
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
> libfdt: overlay: Update base /__local_fixups__ on apply
>
> When a base device tree is compiled with `dtc -L` (`--local-fixups`), it
> contains a root `/__local_fixups__` node recording the byte offsets of
> all phandle references in its properties (for example, so an OS kernel
> can identify phandle cells at runtime, so a composite `.dtb` built by
> `fdtoverlay` such as Linux's `foo-dtbs := base.dtb bar.dtbo` retains
> complete phandle metadata for tools like `fdtfactor`, or so a merged
> tree matches what `dtc -L` produces).
>
> `fdt_overlay_apply()` updates the base tree's `/__symbols__` via
> `overlay_symbol_update()`, but leaves the base tree's
> `/__local_fixups__` untouched. As a result, applying an overlay to a
> base tree with `/__local_fixups__` leaves `/__local_fixups__` missing
> the phandle references introduced by the overlay (both from the
> overlay's `/__local_fixups__` and from its resolved `/__fixups__`), and
> leaves stale offsets if the overlay overwrites a base property that
> previously had phandle references.
>
> Add `overlay_local_fixups_update()`, controlled by a 3-state
> compile-time `FDT_OVERLAY_LOCAL_FIXUPS` setting in
> `libfdt/libfdt_internal.h`:
>
> - `0` (`FDT_OVERLAY_LOCAL_FIXUPS_IGNORE`): Leave `/__local_fixups__`
>   untouched. This is the `#ifndef` fallback in `libfdt_internal.h` so
>   that size-sensitive embedded environments (such as U-Boot SPL) that
>   vendor `libfdt` directly get zero code-size increase and no behavior
>   change unless they opt in.

The test suite passes for me with -Doverlay-local-fixups set to 0, 1 and 2.

One thing I'd like to check is the 'zero code-size increase' claim,
which no longer holds now that fdt_add_subnode_namelen() is split (see
below).

> [...]
>
>  Makefile                 |   6 +-
>  libfdt/fdt_overlay.c     | 525 ++++++++++++++++++++++++++++++++++++++++++++++-
>  libfdt/fdt_rw.c          |  37 +++-
>  libfdt/libfdt.h          |   7 +
>  libfdt/libfdt_internal.h |  23 +++
>  meson.build              |   5 +
>  meson_options.txt        |   2 +
>  tests/Makefile.tests     |   6 +-
>  tests/meson.build        |   1 +
>  tests/overlay.c          | 154 ++++++++++++++
>  tests/run_tests.sh       |  32 +++
>  11 files changed, 780 insertions(+), 18 deletions(-)

> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> @@ -405,9 +397,32 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> +int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> +			    const char *name, int namelen)
> +{
> +	char *namep;
> +	int offset;
> +
> +	FDT_RW_PROBE(fdt);
> +
> +	offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
> +	if (offset >= 0)
> +		return -FDT_ERR_EXISTS;
> +	else if (offset != -FDT_ERR_NOTFOUND)
> +		return offset;
> +
> +	offset = fdt_add_empty_subnode_(fdt, parentoffset, namelen, &namep);

Since fdt_add_empty_subnode_() is not static, every build pays for the
split, including IGNORE ones. With gcc -Os on x86-64 the text size of
fdt_rw.o goes from 4610 to 4743 bytes for me (I have not tried other
compilers or architectures).

Please can you either avoid the growth when FDT_OVERLAY_LOCAL_FIXUPS
is not UPDATE, or update the commit message and the comment in
libfdt_internal.h to give the real cost?

Regards,
Simon

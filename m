Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805263;
	b=f1RYKYWJCYQ2y3Q0eFW/O421sK6JoOUSQg3WfFP/0ZV9JQmFBqngClZfnkkhgkwbGeov
	 S/OCUg7pDyUZCflHnwEeTd9vZB2O2VZwD8RZ5W/LJR0elOXo2T6G4UW8RGxZcrpK8isrl
	 /B9AWgnAE5z2D6NmsAQ8x5zXccOHmtb7Xt9JbRH0TAw+6KKOsSkJuQQjYM6axY2I4QKcF
	 ns7nc+x9BcbWNgIKcoK8dR/Fw363jm8NP9I6hxbrcJrQdp8zRYyF4kibobWI35YdOqz2M
	 +N511CZY71+sCRnRxZ4+Olrw8q9smK74sKuM0m1T1Gyh7l0Ujat0dItStiAHiEMuO7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
	b=ekVS/qz1hev3frghV8j2aH15yNrFK2DfEADwkdQiC8NggGrWcajrsu84sMBNXnHDZ9c9
	 KyCDTuP85+pNIXg5DFjCaO9/c8HNnSazeAqln5UhgObZHzmPIw6F7PSPEF5yfDnaZxlI8
	 zVX+tAPrwOwHg3J6g9ZD5Issk5xGS1d0Yr4c6zyeAbeY6qnwwCCbxolFqM8ksPxPxV4d/
	 +wFBhZFSXxIv7wu1GEVRx+s7vNlzz+f0MQAZFKHBYbFlwLpKq8KfpYov8RXrzyT1+6Vx1
	 50CdytHMD89HLs+fYXlmh/2jZ1boAwt5xmQlqM2h7Zs+b4igqJCjmPqC7FKnUK9hbCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YQ6wMMsG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161C0606D81B
	for <Devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 161C0606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YQ6wMMsG
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so1215116a12.3
        for <Devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805260; cv=none;
        d=google.com; s=arc-20260327;
        b=af1pV0rd69hfg8OgiAtPJE7ugdcwmPIGYk5SuXhxntONqiP2ZyC+6A+x2hLryRXDjq
         Rgs9OPEjVy3e8MSvYUcKmILvCp6zruMwcQLsVKbmB66nKnbJAq5vqgKDrtK9GX3Hqr3y
         tG9WsGLP0FWZrJdIx/0RUcp1FtB1MjkU9iNMK3vSfHKXCqwq868ia93vOJz8QhwclcrR
         VFRrAnWCHbrSh/58HwsR3WMYxiqkb5BNpA01Qsa0/BNmepXsMFhY5PW7186FbLgPZShT
         3YVSiAq/OWCHZ3C8zDwINkTqeDzBmbjE4fjHiVSZKhQes35OZYWEXyxqdSaUnc6A1Kpq
         fcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
        fh=Ihq50HN6vGXi4tHI8Xc+my/89pQeOihdxcNIFxfqXz0=;
        b=JG1uPe0yd+1Hu1nR20Slog/fFm9nqeaFFiBCkn5Pyz4xhT7PzYzecYsy06dHA+hj2X
         q/gSRhyM8H8tw2BTYKD0/u9wZ1zf9meS2Qo4S+vCXbZgWlnXdhlKjRlbE18L/YKHu4p/
         fgUNIYk1JXtisw6EdqKOujgD2VzqihfQqxdf0lti3HqwCMWSFHny+8ZVX0CRBm2AVGIw
         NsB4Cvh91igAimA3WAh7JgX9p+aBKvNbt7TkMJArge1BwtrV0gSUTkrI0wfutoUh+Gke
         7cvmWu8Slo7IAfE7L8GUB0T67olXJipU79w/NJHwFaYmw7UQX181XRxsu/a3IOzFJ+81
         iwPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805260; x=1794410060; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
        b=YQ6wMMsGBsQPo+F1c/0iM9292MWRRRqOc2Ys4vqqsUkmFM8CQzcH+G/eG0+UUNaWMX
         CiURxuJq5Hi8mWJ/PKKiOi0zj2HaopnbY20+WoMYMquZBJjzeJteLOrJpoDB8U3t9skf
         hPT4/waxCbaubuo1soDK7gkDX9MK84WldFjzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805260; x=1794410060;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
        b=EppPZjyBm5qgyCqdtfkKqLIXxIauR87Ngd4Tdvb3i0jHXAGifi++jVOau2xJokCuGX
         Cm3Xhutuj0cLn9NBnX3P8kwgcMQB5CaJM9nfhWRLKkujeF4vPrO9QKckUHF00xVT4u6s
         HdKOeNewEP2onGLS9SX2jwlLGmo6QGfEfT5+Zk8hOJ6jg+m/MRC+Eh59NsypJJuG0zBv
         S3kX7JrftyXbMEwx4jb/Px7ETDKM1hkEacr52WWUJhpEPy3re02qCN7Lv/o6U7fSKbdd
         gFsSuP/BwGyLgJARxoGjrqiNti6Wp2n9utmdEeHWZtqDVq7fTvgIq/yphcrL86kuQ4/r
         rkPg==
X-Forwarded-Encrypted: i=1; AKwUvBxX9oX8zf29vX7T3QIVfu+l0wIhM+UqdyJaI1weHNVtwb/EtMOEGxqYRvfE9ShHlSmq7SBvlTyz0NaK@vger.kernel.org
X-Gm-Message-State: APuU4Z8A8xsbrpcH+RRfoFeYRgyGD6ktUx+ryRjEY0DK2n6uwUxHqfuj
	jTygxnYF/kCleJpzGJ3tOA0dmAWWXn+JvDWjb/RiHz6dHN99fcsiu01czGCBFeiPyVjOCFaqon8
	ExMRw04psK10gSvZuBkFLAIHwBJkLXcUTKHV+R1vB
X-Gm-Gg: AYBFou2H5QSXU8XbfPX2mAbNcOIcvXMcTwRQyutOxvy04ZNBRQUA743Wxhc0PxW9QcD
	XU2V39UuZOc46u9LKaKb9A0XrK897+LW01ghWeIYJmiwGzxwZjDG1bsRlK7SiFLZFnQtGgovsOc
	iw7xhKZfwqe7Nv6wu0mxJZ1egsLU9HWomOoww+2jIBVMCBbqUe0iqsjpRea+U4gYCcoSiwkjQmA
	AWd5buOWQfcPbbrFRJw5gqxXvVQMm7P+Od3YFeJh7XhNRKPDhpQvUP1wygzsBUOucJ3E5BSEOO7
	kgpQcav+DqzZU56hSeB5CDE7ajnTIPsMec4xFo+F8SAUC2FZJZIlPk0RFEb1hFUOmDwBEsvdC7E
	rN2SHixXTbWOpiRnMH1RQ07jhJlLBhp1WyYCPWwNPZqWk42TWG/pGJ0/CqzVBpIlunyaBV/k=
X-Received: by 2002:a05:6402:5295:b0:6b5:5fc8:9cac with SMTP id
 4fb4d7f45d1cf-6b55fc89e42mr1846232a12.40.1793805260561; Wed, 04 Nov 2026
 07:14:20 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:17 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:01:33 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-12-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-12-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:17 -0800
X-Gm-Features: AclHuK8qa3D63ZO_9r8BX5LxaLgLW4FwLJ9apCehDmSsDt5GX7DSX6uYUevIrMw
Message-ID: <CAFLszThLk8zag3CK6FD2-vbGD1qiWoAXu9AturXgWbJS9vQ=7w@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] libfdt: overlay: Update base /__local_fixups__
 on apply
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Douglas,

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
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
> [...]
>
>  Makefile                 |   6 +-
>  libfdt/fdt_overlay.c     | 527 ++++++++++++++++++++++++++++++++++++++++++++++-
>  libfdt/libfdt.h          |   7 +
>  libfdt/libfdt_internal.h |  21 ++
>  meson.build              |   5 +
>  meson_options.txt        |   2 +
>  tests/overlay.c          |  80 +++++++
>  tests/run_tests.sh       |  19 ++
>  8 files changed, 663 insertions(+), 4 deletions(-)

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -1135,6 +1134,524 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> +			next_lf = fdt_add_subnode_namelen(fdt, node, name,
> +							  namelen);
> +			if (next_lf < 0)
> +				return next_lf;
> +			if (next_lf <= ancestor) {
> +				int delta = fdt_size_dt_struct(fdt) -
> +					    old_struct_size;
> +				char *new_name;
> +
> +				target += delta;
> +				ancestor += delta;
> +				name = fdt_get_name(fdt, ancestor, NULL);
> +				new_name = (char *)(uintptr_t)fdt_get_name(
> +					fdt, next_lf, NULL);
> +				memcpy(new_name, name, namelen + 1);
> +			}

Almost, but the pointer passed in still goes stale (my suggestion of
re-reading the name missed this). When /__local_fixups__ comes before
the target in the blob, 'name' points into data which the splice in
fdt_add_subnode_namelen() moves, so its memcpy() reads from the wrong
place and can overlap the destination. The final tree is correct
because this code rewrites the name afterwards, but the overlap is
undefined behaviour. With ASan and -fno-builtin-memcpy, I get
memcpy-param-overlap at fdt_rw.c:405 for a base with /__local_fixups__
immediately before the target node, where the name is longer than 4
characters.

Please can you avoid passing a pointer into the blob? A small internal
helper which does the splice and then copies the name from its new
location would also drop the cast, although it needs care not to add
size to IGNORE builds. Using memmove() in fdt_add_subnode_namelen() is
the smallest fix, but it still copies a stale name. What do you think?

Also, gcov shows that the tests never reach this creation code, in
either direction. As far as I can tell, each target is either the root
or already has a node under /__local_fixups__. Please can you add a
case where the target has no such node, with /__local_fixups__ both
before and after it in the blob? tests/overlay.c already creates it
first in the root, so that ordering should be easy to cover there.

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> @@ -1141,6 +1141,25 @@ fdtoverlay_tests() {
> +    # verify that /__local_fixups__ in a -L base blob is updated when applying an overlay
> +    run_dtc_test -@ -L -I dts -O dtb -o overlay_base_phandle_lf.test.dtb "$SRCDIR/overlay_base_phandle.dts"
> +    run_wrap_test $FDTOVERLAY -i overlay_base_phandle_lf.test.dtb -o overlay_base_phandle_lfO.test.dtb overlay_overlay_phandle.test.dtb
> +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b a

These assume UPDATE, so 'meson test' fails for me with
-Doverlay-local-fixups=0 (7 failures in the fdtoverlay suite).
tests/overlay.c handles each mode with #if, so please can you do the
same here, e.g. by passing the setting to run_tests.sh and skipping or
adjusting these checks?

Regards,
Simon

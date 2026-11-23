Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460059;
	b=4/TWrPx9J3zdcXUs+CZhTLzG8wzeJ8fbajk9QFIgpGoHa9jc/09Wzs8uMEHBuusou14T
	 GK/sujoYklDAmxIlyB4OUUxMIIIamABMo16X3Xm26NUvuxw1CaG/iLNuQZL6IHPDISQyJ
	 KvwYGEr6D4XN5dkCeVNuOWGYedxdyBP8DlmJjHMXSgNOouzIkDv0HudX3D84H6rC20Uo0
	 +cfs+vA7lbiUkQxnz854uUF/PgiSCW3n782XU86jO1gV78gpsvpFqKafi6IF5tHhLA7w9
	 his/uBi/XVqKqmy5iqgZxJKffR0OpeBBT3bOvJ9V9CKJGxwWp4TpHO4PRLljcqLsxjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=two3aFUDlRe6ZZ4UONF4BB5RVIRGpbzjScEc7cSi1BQ=;
	b=2RPHRtHzBI0TdGP7V+j88MnLtJR+vDT2Kd89F/OAaNttYhnDMIol/3ck5Yn0mL2ohHAv
	 Scq85V6vrvaN2/mfMpudkzcAQ+w3FPVf9D6pu9XXMHgluW9EOS5FS/TxlFltS1QdVY/wK
	 Lk7l6YY/2uifH/n0MmwyNeGLUdRG8QHc0fyuPpcz6BktmJ1ajfBQDjmeeuuONiOuBqApf
	 5aOpISQdi11ntiJFmS6UO93SxRKWcz+gmmUawAeHKvm6yP/WF8RcirwVXRcxr6W5jboZg
	 M3h+xIzCt0C80p+bQaMfG7JKnl6D93RqwSAY68tYTmLmrrxZHROaoicGlDaNt8FcCUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Hq9VkCts;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA11F606A33B
	for <Devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA11F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Hq9VkCts
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c506a231b88so516455766b.3
        for <Devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795460057; x=1796064857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=two3aFUDlRe6ZZ4UONF4BB5RVIRGpbzjScEc7cSi1BQ=;
        b=Hq9VkCtsJg0qZ46IiReeuci/h9nnPsHs/tHg2FrJcdjn+txaqCfD6xduWv9mqs0cUP
         b+16oSbSc85jK7PeHZucvr6lhIEMbF9lM6jIRyVGGOM3pKo9UHAU+zjNHGTLLE+fC5gl
         jgO4irTr0+J1un5DAaIB+wuvQOzD0N8KIipBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460057; x=1796064857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=two3aFUDlRe6ZZ4UONF4BB5RVIRGpbzjScEc7cSi1BQ=;
        b=Giexe7axmoYkWH91HE0AOOs4vv5skmpMvHrUYSVb7ZvzdorNKV/UF2D3bqLfOsbyk3
         0xj3h2+lact/lbJaWUEtFE+IwCXIXJa0SSa0PbT0bJgGQFoG0sJ46zy8lqXhz2hIBof2
         QSqCB1aOqApazd+nUMK0foW05aZ4KDeMYdyIx//29X3zMIEvimUuSj8Dl7z4+CxZr7OU
         qWnFWf0VV0KOM8Xb2fcE5nmK7rh7l6Aw03UpELgnWXVGu94pXXA72tKFsln1uwJwVVP3
         u3mnSMvvckHB1w/tgUq0WhSgUtFhM+uKUHpmCKdp+x31tOKmzLfX5Ay0NLwy3502dS8Y
         VTYw==
X-Forwarded-Encrypted: i=1; AL+hErFk5b8QJLu8mjUZR9uZv6dfATqRk4sgGoT1CTjWXhlm7+Yz49ffefZPd+kftyehdul9PXq0pDtB/znR@vger.kernel.org
X-Gm-Message-State: APuU4Z9NgdyBo++AU3+LfvTIOe9ZsrLoBITBDkAFFMmfB9Q9Db6yRQS1
	DdmlgRuRTe/BLH7jYa4assftrhTVQRdiZdaLSuGl1xy1HChCkjbqNFWrqXp88W9HVW7llLR+2Uv
	jVjMZxw==
X-Gm-Gg: AZFdTZfSLcRVzgwG8lE1FEEG+wXtyGMSdKcR6KHP2vO9NMnmBhdCZZSCnHoYh3d89WZ
	CNCQ3eC8DYD5hM63Lm2g8hV4TmTMTiKtTxRkNYf7voc/0TkTHN8RpqZl6GWInl0VzFfmDl/YV/g
	8Oq4N+zZEGbxqQghhmHKrunsAA9a5t8mmSJWz7y9Hy3zGQ8Cg2XZLvPw3b15/ZTaAe9bmXY8AM8
	TXENNNkqIURIhk7TU76cAqipyBt1wJL5sNTEJ2ivMIKZ0o5iQFpqXUCbU+gLh4kEK7ejlCM/TZ2
	bwPVuaOd3roG28UkHiif4X3rVYdlSs7MyzMv4DTexwj9ldFRJ3vLE06m+72iYjBgashqTvXDZfp
	8ff1ysZEx0Y6JIj4AO18EgYwf8Z62RsFBYHvJgUFbWpiML11nbCM7poXhxpON76ewpq86dFxBco
	z0QhlPOJouCOU9O97Wd5Wp3fy3fRj/7dfLcwDncc4jmG2v/88g88iziZiDpF9gfSHxmlnoz+zut
	Kz5SkMlsYS1QZgiK0lMdpVaKClZb0KMpLpi7rleDww//0bRGNz0PB03aNSN2L0dZZxepJblhdWQ
	B1OAWO4fhtSBbTeu7lZgLrHmh4wHbtZ/douNVMiDyoO6JJ+yhr/WCZhJl5+WNHXa36mi
X-Received: by 2002:a17:906:26cd:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c513a5db1d6mr773261266b.10.1795460057233;
        Mon, 23 Nov 2026 10:54:17 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00d2asm452680666b.3.2026.11.23.10.54.15
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:54:16 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so46472935e9.1
        for <Devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:54:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEGlEzXwcULI9+RLd2bk3negwyr3ri5udqdgsDY6cOIuXQncFgkgxawuEBaD6ZbUyln9FqhHu4BzdYj@vger.kernel.org
X-Received: by 2002:a05:600d:8449:b0:4bb:8e95:8ce1 with SMTP id
 5b1f17b1804b1-4bb8e958ce4mr161086305e9.23.1795460054386; Mon, 23 Nov 2026
 10:54:14 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-7-dianders@chromium.org> <avvOUIIn9t00XqY_@gractus.seuss>
 <CAD=FV=WAWUn4t8nyjyFP1if=i1ik1uQ4w=w=28i2MKPr=zsvXg@mail.gmail.com> <awOzcZqcrKwMjE7e@gractus.seuss>
In-Reply-To: <awOzcZqcrKwMjE7e@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 10:54:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U9BRBp482ZNavG2SioZ3BqDx-qH5Qh13k50qMVdN-s9A@mail.gmail.com>
X-Gm-Features: Aa3M54q7_XT74h_vNqApIdx5UmvbqmG72OJ4vaE3NHyGaBbVB8eeNq9DNlLx3DU
Message-ID: <CAD=FV=U9BRBp482ZNavG2SioZ3BqDx-qH5Qh13k50qMVdN-s9A@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 23, 2026 at 12:39=E2=80=AFAM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Tue, Nov 17, 2026 at 08:17:33AM -0800, Doug Anderson wrote:
> > Hi David,
> >
> > On Mon, Nov 16, 2026 at 7:47 PM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >
> > > > On one stress test (walking all ~573k nodes and ~2.06M properties a=
cross
> > > > 438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
> > > > ~1.8x.
> > >
> > > Hm, optimizing pylibfdt has never been a focus, on the general
> > > assumption that if speed is really important to you, you shouldn't be
> > > using Python.  I'm happy enough with patch 4, because it's a speed wi=
n
> > > with a very small and simple change.  This optimization is a much
> > > larger chunk of code, so I'm not so convinced this is worth the sourc=
e
> > > complexity we pay for it.
> > >
> > > That's not an outright rejection, but I'd need convincing this is
> > > worth it.
> >
> > Right, if we're trying to get the absolute maximum speed then of course
> > we wouldn't choose Python. For a tool like `fdtfactor`, speed is
> > certainly not the top priority and Python is the superior choice.
> > Writing it in C would have been a much bigger pain.
> >
> > That all being said, just because speed isn't the top priority doesn't
> > mean it doesn't matter at all. When I started looking at optimizations =
I
> > was seeing my 438-DTB run take ~25 seconds, which is just a bit too
> > much. With all the optimizations I ended up with ~12 seconds. That's
> > still a lot and it would be nice to make it even better, but it also
> > starts getting into the realm of acceptable.
> >
> > `FdtRo.properties()` stood out in profiling because
> > `DeviceTree.unflatten()` calls it on every node (~573k nodes / ~2.06M
> > properties across the 438 Qualcomm DTBs). In the pure-Python generator,
> > each node makes `1 + 2 * num_props` SWIG calls (~4.7M boundary
> > crossings, each going through Python `check_err` / `check_err_null`
> > wrappers and generator suspension/resumption) and allocates a fresh
> > non-interned `str` for repeated property names like `compatible`, `reg`=
,
> > `status`, and `phandle`.
> >
> > Below is a small standalone script (`bench_properties.py`) that builds =
a
> > 1,300-node (~140 KB) DTB in memory via `FdtSw` and walks it 400 times
> > (~520k nodes, ~2.08M properties) with patch 06/14 applied. On my
> > machine:
> > * Default `meson setup build` (`-O0`):
> >   - `FdtRo.properties()`: `2.52s -> 1.50s` (1.68x faster)
> >   - Full tree walk: `3.35s -> 2.25s` (1.49x faster)
> > * `meson setup --buildtype=3Drelease` (`-O3`):
> >   - `FdtRo.properties()`: `1.76s -> 0.98s` (1.81x faster)
> >   - Full tree walk: `2.24s -> 1.43s` (1.57x faster)
> >
> > On the source-complexity side, roughly half of
> > `fdt_node_properties_stub()` in v4 is repetitive `Py_DECREF`
> > error-cleanup boilerplate -- using `PyObject_CallFunction(prop_cls,
> > "Oy#", ...)` and a single `err:` label trims it from 55 lines down to
> > ~30 lines. That said, as noted in the patch notes, ~1 second on a
> > 400-DTB run isn't make-or-break, so if you'd still rather not carry the
> > C helper in `pylibfdt/libfdt.i` I'm totally fine dropping this patch in
> > v5 (or trimming it to the ~30-line version if that tips the
> > balance).
>
> Let's leave it out for this series.  I'm ok with revisiting this
> later.  Fwiw, gotos for error handling are generally acceptable (along
> the lines commonly used in the kernel, if that helps).

Sure. Dropped from my draft v5.

-Doug

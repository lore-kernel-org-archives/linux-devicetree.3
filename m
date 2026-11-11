Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794428120;
	b=PyeiHtocxx85Zvup40rHRJS0Vdz+oAWwWluUWmdeXX8SsSTnHBfgPO2pRf2g9UkzRA62
	 I5jjYoMvqbSuR07u1PRe1873MElRZrSOQ+8Ceio4bGqTsaQe8k7bU0+TPJuj32LR0BoBk
	 cY5CIJe3kaYeZ7Z7EhJnDLeYrGL03ge8UeSvpLeGwGyLdpWAbyO53r5eO6W5aSQ+diqZm
	 /vd7yUUrX8tdaXEgtfu5p+xCNKFUTMdbmRprxmyUkaPYZc5GYxkmNWteLY4gqt2OW6ClI
	 3jK9eq20JSTofeVzNKvV5Eif7oaf5twV6yb2oFdy+YLGrORSARp4llPADjE5w6mvfSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
	b=Qg8FaTy4EZ4eMQ9gu3gSXs1tPDufIvewxbiBQTFUODQPQsSlj5wP6BkqZbI6hS3Gp6hN
	 UDqPWkQMsc1lj3o+d9fcmNPkbzIap9UUngdBXn3vQUX36gUqpw74IeweLaJTjm16YXFMh
	 gFSIMBkMKTwOqGNTbXP7ftonUM7GLaPDS0RFzi7zF9SpfkPxXzGT+CGc5wIpaRMg/1bni
	 uau81OJYEUUMhA3tns4Y0nFncQDRMnQP3mizi1ui6Aju2KJhTbVjMUbhRzZg9SIwjK+eH
	 TIhm2+SsaO8dpoYxdDKUoABq27XsSvub9lofZV1vWIyb8TMu7ekZjuP+Gxlw94pbRtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iQqhYlpi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09CC606A324
	for <Devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C09CC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iQqhYlpi
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4c9abc1824so503391966b.1
        for <Devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:15:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794428118; cv=none;
        d=google.com; s=arc-20260327;
        b=V/16bPH4dEdv5FGlEc4+sXSFYBe4K9iW1CePZzZrkgpmUg040QUcwjjbgOAcm72x0T
         VF+oE4QgFCo1COuupZKxk/194zh2uR7sKJ2HtFRkRxuQQ+VZgFs4hYxdSSYVoFkmO/xP
         Edzc1qeOxZfaieuIZE5/5Jr94S1zb1INsEXLVkXfqYwP+Qv9mWVUWOw5x7TR8hBKMO0Z
         t6589npDAkfxt2goOHo/FxOFaJ9LFyE35tIcC/r/GdUWWuLcmWY1AwLJIOqpHdixfQs0
         acbRT8s/fs9iki9UeLaDx8MPphwwamk5GnGWWjQYtILuRqR2TxJa5+isEKWZ9ybXJZNR
         M+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
        fh=8shIwSz3xaDtH76739WBKV1wl19kWOsFffT5YW8PglM=;
        b=qDhUGL5u8dYPUqAgqcxkbSV78iFxt/B8RB6AAB5fhqjfd71yyacUb8gjtdrrs+oK0E
         YplEPVylGBV6aNcSzN3u9D7OBrHqDzJq1MdgsJyOSJqZx0KWMrBeMlu0ZhLTbM9W9b2M
         XGtIb7UNSEqBGTJ3nVC/S89Vcvy7ZqjayDNSooDULNy/cP1LIexq7UF2s0ATJ+gLnUYv
         POcWsxIeaL0Grp/Ev5NdjzXzQdNF1UIOZLKQkJJ2s1q01V6SQlkoNWRc0oM9an/4RA7w
         iQf+5abgbCzaQ9MEmW4wpPR/kM43/svoIyjmR/2DdSrG5AGI1N8UD9jH5xxz2SFygzDC
         BZRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794428118; x=1795032918; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
        b=iQqhYlpiDzFnw6ASBEjBccgiaVPkZLP1FAaSdtAEVe5kR3uRwNmNV1nIdylZJvsqlT
         G01QdTGkMev8XoSkokAVURNlnVoMEgNCcVOBxXWGIgQnskIgoJAoZT7LNXfrWtBHsnfb
         pLw5xoVF25+2rFnQpLCVi7mdFLVBUyDPoA0zI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428118; x=1795032918;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
        b=qgPbOl+ogpn9mgXG8hjX/lH+KVRzdmjfpEKgoTWah/SFa+O3JImmEtQbph7V2HMZXq
         OVKYXGJMhUCWezkCTf4mXW4Us6eTsKrngjPtGcviT9b0HbgXc6jTPGar4RTryMxzf1kF
         NLg53EW5EHUxjOnGYMt0oM+lNy9xAtHbN2TA02DuXFXUIJ/+SqHBdEfJpu6BO9CZjX3R
         tjaodWFxvNzCPEWWzs9m398/fKE1OlfwzeeVT0ihB7zUoNH+wCHeHBR/9INIj2gi+8Cc
         VdzqP1OgM6zFq2Iyvby6z5i8LyzMlg+C+y69ehObgDPaYCcn8r4MSz3wUnA4enPyh0+4
         ZUHg==
X-Forwarded-Encrypted: i=1; AL+hErGdpC0Z6GS6xL60aeKBF0GPsibfiuv27ESiTdLc75T7GyfWvsA8QWvcQP77XRASl3rnVrvF76thWsYb@vger.kernel.org
X-Gm-Message-State: APuU4Z9AkHUhIiUnudd9VrDD8PqmwX6O8J7jhCqQTYzhRoQiGLuF7wlF
	BftxPOL06fM+95soB/lc3TBtnDObQ7yOMm7a8iXIIe1/Z/B/4GJ+hE9BPeRR4YhPQmPF3uWYD5W
	Is0uZQAapc3h+prc0b4haCCqmXIEz0Za95hy3UYbw
X-Gm-Gg: AYBFou03gcsaoMW5snEZjy71XsrkpGBQOE7eDrK+QEXghxI49V8vqumlEs3eNjv+mvm
	/i17QgeWsTu0Q0bZMUbEb9lD5h6jjIZUkLBFUsCgTl+8/Z5ZurnkjoJVU4x8Ao+Sm44uwHYE8II
	GNjAbMY7WCu2JjSjYS9YYRhTmSZONzH5OXtO/NjBDiUUcrc0eEChh82t1qvylRybT4Bb3khC0hB
	PA2IzBNNCK23S81nE9DNldrNYCXxFmGY82xK+DwImrrQTI0oalporpEtCXvLC3pyPV6jwjbxvXI
	vinO5xiVJQYdMXrC/vMCQRGg1iffm252W4/4vSYFivad/hGE+pE/iR3wf2dzx2vgr39SJeqgYnv
	GnelGXAO2ijAAXUNqKrSTnmPqjRZ9/LygXSuo/MfuAsfoI55fGfVymSrCb+9bUMKpJROgU8Ee1c
	VTiLCSI9Su2+nhbJKK9MOUCCXCx6oAjuGwr7HMNIW0PS76Ub5H
X-Received: by 2002:a17:907:9454:b0:c31:8cfe:9a25 with SMTP id
 a640c23a62f3a-c5066a82a5emr284901466b.9.1794428118138; Wed, 11 Nov 2026
 12:15:18 -0800 (PST)
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
 <20261101220224.1436242-8-dianders@chromium.org> <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com> <avPZeSgU8ABix34f@gractus.seuss>
In-Reply-To: <avPZeSgU8ABix34f@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 11 Nov 2026 20:15:06 +0000
X-Gm-Features: AclHuK-kOq9TFXAlofL_aQgLmTwNgVeU9jF5L7666dJWRKAUQkobhjJQaDq30ws
Message-ID: <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Doug Anderson <dianders@chromium.org>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 10 Nov 2026 at 21:16, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Fri, Nov 06, 2026 at 06:43:18PM -0800, Doug Anderson wrote:
> > Hi Simon,
> >
> > On Wed, Nov 4, 2026 at 6:08 AM Simon Glass <sjg@chromium.org> wrote:
> > >
> > > Hi Doug,
> > >
> > > On Sun, Nov 1, 2026 at 4:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > Add `devicetree.py` providing `DeviceTree`, a non-flattened in-memory
> > > > representation of a devicetree node and its subtree:
> > >
> > > Please can you start with the motivation, i.e. why a live tree is
> > > needed and what will use it? The list below mostly repeats the
> > > docstrings.
> >
> > Makes sense. In my draft v4 I've updated the commit message to lead
> > with the motivation and condensed the summary so it doesn't repeat the
> > docstrings:
> >
> >     `pylibfdt`'s `Fdt` and `FdtRo` classes operate directly on flattened
> >     device tree blobs, where inserting or deleting nodes and properties
> >     shifts subsequent node offsets. That works well for in-place queries and
> >     localized edits, but makes multi-tree comparison, structural diffing,
> >     and bottom-up tree construction (as needed by the upcoming `fdtfactor`
> >     tool) awkward and error-prone.
> >
> >     Add `pylibfdt/devicetree.py` providing `DeviceTree`, an in-memory live
> >     tree representation where each node holds `props` (a dict mapping
> >     property name to `libfdt.Property`) and `children` (a dict mapping child
> >     node name to child `DeviceTree`), along with `unflatten()` and
> >     `flatten()` to convert between `FdtRo`/`Fdt` blobs and live trees, and
> >     helpers for path lookup, node creation, and pre-order traversal.
> >
> >     Add unit tests in `tests/devicetree_tests.py` covering `DeviceTree`
> >     round-tripping, subtree unflattening, duplicate-name and corrupt-tree
> >     rejection, and navigation helpers.
> >
> > > > diff --git a/devicetree.py b/devicetree.py
> > > > new file mode 100644
> > > > index 0000000..f81b8fc
> > > > --- /dev/null
> > > > +++ b/devicetree.py
> > > > @@ -0,0 +1,226 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> > > > +"""devicetree - Non-flattened in-memory device tree representation in Python."""
> > >
> > > I'd forgotten about this but PyPI has Zephyr's python-devicetree
> > > [1][2], which installs a top-level 'devicetree' package.
> > >
> > > I'm not sure what to suggest. Would libfdt_devicetree be too awful?
> >
> > Right. I'm OK with libfdt_devicetree. David: do you have any
> > objections?
>
> Don't love it, but can't quickly think of a better option.

Would libfdt_tree be better?

BTW we might be able to change pylibfdt to package (and even call it
libfdt on PyPi), iwc perhaps libfdt.devicetree might make sense, down
the track.

Regards,
Simon

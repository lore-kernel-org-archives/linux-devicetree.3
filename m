Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795559486;
	b=gN405ZbIQSETCurmtoVN8V2RWEJ7ksWVHw7T4AqBLvcLU7aLJhkslW+NMwtgGEHslKYv
	 2zamVKolWQl8lS+HRvCsZFpPy689pbhOkMii2MDewo+oVInZ6OvTcCl++65BcZlZLjOjh
	 R8US0rTOiERDlrLirLnTF5oS/DUlBlOg08jnLBbYWsFAZWMh2bd8G4Oce2ZPruxqMikpv
	 kAbRBS9/lQUoLy+2M0JnsmZkpyr0mc2Dd7nMSo2jTE+gfBM10aeuuDG784gqjmfuIlAkn
	 XB9EV4PFmkVNo5Eq5E+M++ovOrx9BD3lrSMmfyFCctu85+FV8YCks75b4L3BuRCokXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
	b=SloBTMRr6XHsMx6Ux5A0gbBImof66AJZD0GK8zmYowEiy7lF4pGupzQi8aaFLpG7UxZ3
	 w2SwFB6aP63WwTrDRDl9RjuGOGkWzJ8QKi3eq4G4+1tnxfvtdE5gUwUXsBhZlvVnLFYRp
	 raWaxwx4LXcYPuCe6BOk7ZpCRucO9EQne6tedqK1Ugtxxtsja79MTa/7IeQyWxJ7SyDQ3
	 qG7YQc8boJtBXFh5M+sON2I5wb5TCeSP88bvk83jxtfFwp+K/O/2u64huW6VTV8tIEA7/
	 TokBX+NjnOJGH1eYl5zOBDd/seQlxSq1sIjd47JInmwbyBihBHhFNcfVRj6CGUKRfvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pq6hYJqL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE7F606A698
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE7F606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pq6hYJqL
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso6539880a12.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795559484; cv=none;
        d=google.com; s=arc-20260327;
        b=pSxnvWkknG4xt9Nb6iJWwy0+06x3Gl2HnUhEf5NNeOqmf+xnwrJ968B9c0ii/IF8B4
         XxvF2suvNY6pUDW66ZRq9BLtE2vPTQ3IxGyoKQEJB22hfgBwg+KUREmF13km+5RqG+Cl
         +Tng50glJS+9hVyVQDKipT8SWNQT4YQ3BSVQ5nGqBd8WaPr+W+zurjdIrtCpi1bgW+PB
         QxbQ2ruDd0XeBC7b1vzF6Waf5S2II0WWW6PapIzEBPkpvynPgpfFSpSvgp/gNiznHZJp
         CfoNR+rxiEw0y3E8K35YkmhpwMaD9d9A2jdf2Fuu4kB1+AXbHzuiRK6Hz3w6SQiXovmy
         JccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        fh=/jQIvVxE4cSmPSRmxulZFaCOmdlsZFlSgMSs60D6Xwg=;
        b=JzKMSXMsja58VsFNk0OirubIfgE+mEdkv0aMNP3b6pdZp/YcTzI4tQD7s1ena+0iak
         1Ur1yFpGrAn3++N4d3xDvQmU1odWvO/EOX1ilQMxZ+uaTWmCHiuX63i481uNnJlNS0oV
         7Dc1Xd7CEruyAuRQ5bibRfAHm4KNEhhH4bNzji4qLe0a8yViQ124UVr5VyQsMa0BRXtn
         pei3deZW3W/A4CQjfJyAeCdheiQQ9Rm31LLfKeVtM6G3w0TMbgLQXzkqeFQTYognRppD
         r7bMFQN2uKaS/NuBUoNZIDMwJSwT55vAtoSfjBaXrFxi21xUIWPtnAChCj821MY0JSGi
         Dakw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795559484; x=1796164284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        b=Pq6hYJqLqfjmwjq6l8NZL/b72FkWDY7/prko4BQ8KEWZLjnZPHCUw44AYwkS+F8DRi
         EUeoUtNsUmpvMracnT4N+GgMdEmq/lLExWZTQz/1x2gGNuR3gColGwjZifwMrkotSzq1
         d6CELz6FR9caGvQ5SJQ8Y9tQVYlF1B8Q2XaCePiSHWZdneDCgaC0t5wk53jlieeZPq0K
         Xr/gKY4gRbr8NIvfHqVM+4o2vEDZGfOtkWKPxClj2k43yKXLUk1wVQj7s9WACrQQEpw0
         Q98XJp/kNzbRIEqZyr+UWynhvWGPSRNCMolaQERiuhRGVt3CSC7buBUx16Xoa3CNaJR4
         u73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559484; x=1796164284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        b=WCxJNO0wNLCy2lz9mlOOediy+2Zp/VGsEzHWOd98yhVx7gZNKF4eoWvnlCXHgj4Eqs
         XGfq7EtJN57jCEhZeRSwiXwsXQdcrM5l4bnDyfli7+V/DgXLHZhBcqPdodsoXbxPgM0G
         laO62sgmt/Z1MnoNUI1bnFK9SmlNrae8fj88Fn8XDkDossoA7ch9Ul5EnWFIR9ea00Iz
         A4F0m2RcHuK5kSJ61BzEyB6OQKTimM+nuxAprQTyzsOR7qHiITIg0t3kxACH3lV6QWIg
         37nlEOxeyNPCZhY5tI5n6x5R1xlVep7KleCmEphK3CpPTo7iQ/J13uEGCQEYWqns8VH3
         q8pg==
X-Forwarded-Encrypted: i=1; AL+hErHWr1LAs3Ko3an0JNc4ZpDcngZKn/8qvLg/r4iPYMtbUu326qTn8H4jMHaDnyobBXL2h5ZywAlsCIrb@vger.kernel.org
X-Gm-Message-State: APuU4Z+bBsjN5m3ptw+QaJYo9FsiRPHIb2MJ0aFOB7NaR79ritPffsdO
	oZiPR6EO5tj1Asj8V1XtPxT8BqxIIyJ3XQK+DhvbGmeAtYQ9DIJEIVjdf8bfuI1e1hbn/tNZ47+
	R5d18ZZNrZ/klgJK07YGoAXCgYRICdlZhXlL8zjgymw==
X-Gm-Gg: AZFdTZelGZbMloP+CuuFxjPcHl+m81PHmsUjT9Ln0QsPzzMP329t5/+0LtbasioudR6
	BG03L9k2tfbbBl2LMWyvQvNV0K7UGmx2vv/L64T0A8FGVSl5qgw9+V+HOcdN6lRnQiLbqUpHsX6
	wp3xhj8N+Adv42RXOitPTLwrhpVaicQnirPSj6eKXdRIizkL9nc1K2RDFsS1fkw+U/gA/XFOHYM
	4+4LVcPwMcpy9QaY34stAP+NeCsvh2ugpS2PYN/kLSA1NuCWVZtYUv1NA+FPU5rLHRFRb6P5vVv
	rSn4l7W/dRHzdxUAvWCElI1gUxMTSUx9sWzs+u03l0Q2//erERDklX951xBSMz2xDxEVFxMZ9Jv
	ybT1ucvZ6crd+G4GECGJyJf5yKfr3umf3+VgSBhvPCi3D9G5sFsNEaP9MSbtHIVkMdlyEPGN+OD
	4s1OXhLyIsJKPbVr1+
X-Received: by 2002:a05:6402:15d4:b0:6b7:709f:85f with SMTP id
 4fb4d7f45d1cf-6ba37ec031amr9043918a12.36.1795559484024; Tue, 24 Nov 2026
 14:31:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com> <awXf86suGgKeazZx@google.com>
In-Reply-To: <awXf86suGgKeazZx@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 22:31:11 +0000
X-Gm-Features: Aa3M54olM1DKVBX3EQP9Zt-gD9WnHLwb_Lxu-JjOzcrrRgxAqJXxzL4OnVB7R18
Message-ID: <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 24 Nov 2026 at 19:05, Brian Norris <briannorris@chromium.org> wrote:
>
> On Tue, Nov 24, 2026 at 12:28:24PM +0000, Peter Griffin wrote:
> > Hi Brian,
> >
> > Thanks for your series; it's great to see more Laguna support being posted.
> >
> > On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > The Central Power Manager (CPM) is a co-processor on the Google Tensor
> > > SoCs, as used on Pixel phones. CPM supports power-management and a
> > > number of other features.
> > >
> > > The Application Processor communicates with CPM over a pair of mailbox
> > > channels (the "MailBox Array" (MBA)). CPM provides clock, power-domain,
> > > reset, interrupt services, and more.
> >
> > [..]
> >
> > +++ b/drivers/soc/google/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config GOOGLE_CPM_MBA
> > +       tristate "Google Tensor CPM MailBox Array Interface"
> > +       depends on ARCH_GOOGLE || COMPILE_TEST
> > +       depends on MAILBOX
> >
> > Should we also have "depends on OF"?
>
> Why, precisely? It's not actually a compilation dependency (I tested),
> although it's needed at runtime. It doesn't seem like this is
> consistently done simply for runtime dependencies, and instead work has
> generally been done to ensure everything builds fine and fails closed
> without CONFIG_OF.
>
> Anyway, it's a bit academic, since ARCH_GOOGLE (ARM64) selects OF.

I was thinking more if COMPILE_TEST=y && CONFIG_OF=n &&
CONFIG_WERROR=y is set. I'm not sure if 0-day performs such a build. I
guess since no 0-day failure has been reported in this thread, perhaps
it isn't required.

Peter

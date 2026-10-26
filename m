Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028664;
	b=ennLS609B4pzTYrM2neieNXnvLU4MmYT88nYq0aEHLWhn2th3Wfq91wpg2rnQ3RILzWz
	 gFkIDJm/rxv2GKQy7u49ygyABP8LwThPZAgnkkJPKXDKPJTcq7wrtWPQ5cnnYrLn4MSF3
	 qw3N5jXTaoEvuEh9OZdtPDLoOwH+E+0n/j+1Hq4ApgFiDvovhfB9q1oMlxFCX52q5tCFg
	 vBkvzCOqCLsf9qexuF8ES+7E8dL7fanU7DnltVBxXHD6AaHPreXHCJajoGrshahdkAKtr
	 U9IznQfp6pT5fGNGe5Y/ru1rCrLwrGMlk6fg3eXLS7NXrPb/w9lrAGXAljduT1pQjiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
	b=m5+wWyBplev63eKBcKr47oSWGv7JunrOX1ZDeTqUSDqKkAa8sUmWvYG4hDAwa89jUpoy
	 CQvQDWjUS41SpVxZ6UpaJXjyQhgWnXviyzwKQ23Nt6buL9n1R5BDyVwEkWcUiaBuISd1S
	 L0rAPaLejvXjO4BfzL53+dGAxKD1k26T6dStF+LXpidTP6Fo6D7dPt3P0B8Y6w4mGVnoT
	 HfpP553SYynIfXia+H8Ocia2ePwdyo3jGr04PfkmN6E0WbSH2HARpejCjtpM0N/Q/7i01
	 Gh1zsxaI9NT66uVP5hJwWLiG1fqmhc9wXzgsW/ryophieWvpwFhAOuUzaB495h1a0TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HdF7GBSr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1424606A31A
	for <Devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1424606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HdF7GBSr
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso9666a12.1
        for <Devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028659; cv=none;
        d=google.com; s=arc-20260327;
        b=IR5D+rANzEbdvujxKHU87HDE7TbJmAbmpMebiw3k7DV37iQTQMYhDHifZ5a5odpjlK
         iU+lDmkrlP//gzBofFEt8eqFko5cRI0OIeYZ0LXuWe5Rqz/waJ+tFD8oWosMWSCRMoV/
         vfuPCg+xk8laWBnPOugMvqUdAdww9Q77CGGK1hsXWpf7wB/P3/uIKeH6/OcbwYqFmTv2
         D9F8ZWS9MKjtgKCFBqMrnt5I5ylTABwj4obcBpWMPtfpzlbcGSET1BuDbJQhz+GST+YP
         3s+mykgLz3QP+zzQjQJegyuvCjLNA0m1+aq6QgBt8k8nuw8mxsVIcOwU8MkbJDbF8NIK
         q4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
        fh=JpVe1+nbt3JB86NPtfxBWqV8mCcTjjiTkKwY7BhqJ28=;
        b=Gmd+bvoPf20WhvG8OyxWXh5y+BpRH1fmVBB8dzdw7h08E0jpAOAKWHM4+4lP0uffZm
         KG3GEhrPMAU1BZh4U77Q28BjUBXORt9nAAGcEc6zXfr+ev8rju621aRToMLS7L8ml+KL
         MFoD9gzE6L3Scvgm73uojj8wY0uLA0HKGHNvSbEy8p9gIcQdoXmvn7+YubdxydcscoKK
         /CSjTMRAFiujb97nrb5RW4h55f5EhT3mk9rWgoQMx8WjN8h2gLlzI4g6dHFlHgaunFuP
         dzgIyUWJbnlKTJi5jEt0PzMKoYMkze5X37ASF8tdq6bxglAAv/EwKSnfIwyBQg0TlW6R
         vUeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028659; x=1793633459; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
        b=HdF7GBSrfKecNkLQ3VZyh2wB08QbA6YzaL0rI9DhFQXUEdA59fAoZClie/v/gWKm5M
         xoRLUKnXTkGEoGAJYARmg2ltCKZsKeImSsj9EnNXc3uVH/63uaJV+zOfVVjhvA6cc9rg
         zm6mGTRCjUyrHA6c/EF93c+Tqj2ygjQdpVBVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028659; x=1793633459;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
        b=ek4T+VI3ibb2nwdSyeP7FsAny/rIXfxpzJCYD8/rPKAuzjHlIvymF5EDV6E/3GlTi0
         BZtmL48wOhAH597tyFu0FN/vE3r1WrwaG6kr5lu9KySe7H8iYMfTDrPuCFnVVBbSXesT
         7PoWViFBFqi3Dk1WMaIDnRQdyiKrG0uLOkW83A66yCdMYAcqYdVVoZ1N1z7P+zauxmf/
         fftfDptSQV7nyMzgDc+lNvFjDPZkfONEt5ygLFXB6/xPC7tZRxXsfM9NAN899Ae8LhRa
         54FpajzZyqYhtnfAZTXbjTqVN5BU5x+q1m+7dIYFmnVHBBiPrUrAipWX6y6FIO2YvN/v
         BEjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwODs9y4GPvKXwyQVuNXpukdwdrrmdwD/VAChE94YdpyZoT4IAIeH9zXlY8ONYZX4XuRU1E9CUoWTNU@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4JPYIKI0a+0VSzs6aj38MngwDmG6rt1YRTgyP+woIKn6O3rT3
	Skqu4cUkhUEECJeiTMyNt34xiBwTWqAB8vyAHNw0f8Y9UpLk2+//QBjCmTe0WAdtjYWYwQp8YTs
	4SKJSGgfuPjOEj8HaO6BlPQ31SxLjKImp4yattrAc
X-Gm-Gg: AYBFou1u4joyS2TAE+ckTdAoQWr53qsXtByCWcWkf1vYPmcLKRkG5iNjQKqHj7lVp2A
	NDe4/mylDr6TnL80qAiPknrZB5co9EvDrPZsw7YPolEmC3e4gUjgrWahUPbJGS848tkikF4CBEP
	UNfUPZvlrO/N6NqLX8L7WNCoiUIHqqzxETjoB/EE9Y1/WOqPCWyvLprfBJoYoNRL7gyn/uVj5Du
	jlHQg5X4nfWqT9DDoDfRofaQGjw3Bz/Os7HGNQrqDYyk0Wfercbdvu2ca0U+gr6Xo/W6GXrUVsC
	cZsOrIcFt7t1idlTfCWuUU1mtBA1T8a2A4myuV7+JUo/w/j+9ZHxEcGYJiSuFSDR310D72/uRzw
	pghEbFDiW9d76cAha1E8r
X-Received: by 2002:a05:6402:c116:b0:6b1:d8d5:4500 with SMTP id
 4fb4d7f45d1cf-6b442ff1cc2mr5244408a12.19.1793028658987; Mon, 26 Oct 2026
 08:30:58 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 15:30:57 +0000
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 07:24:43 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-1-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 15:30:57 +0000
X-Gm-Features: AclHuK8aG0D96i-cNQ-5K5VTR-Mm132KiROnF5-iDQubeTf8Ba_jJIWVxAlDylI
Message-ID: <CAFLszTjB-wcxTEKVNo-z0PctkhqavGEh+eiRyiPsMZBPkQbHtw@mail.gmail.com>
Subject: Re: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-15T18:21:33, Douglas Anderson <dianders@chromium.org> wrote:

> The fdtfactor tool can either work directly on a set of compiled devicetree
> files or it can work on FIT (flattened image tree) file. The idea is that
> you'd create the FIT file containing all of the duplicated devicetree
> files and then fdtfactor would "optimize" them.

This is an excellent idea. I have been thinking about something like
this for some years but then when Chen-Yu Tsai wrote something which
used the kernel build (Linux 17c31aded9a1 scripts/make_fit: Support
decomposing DTBs) I forgot about it all. So thanks for taking it on!

Ths script's post-processing of a finished FIT only works for a narrow
set of images. Apart from signatures nodes (where I think it should
error), it also rejects FITs with external data[1], which mkimage -E
produces and binman[2] uses a lot. Of course, mkimage does support
making the data internal, so it's easy enough to work around, but also
likely easy enough to support in this tool once the initial version is
in.

As an aside, this would be a great feature to add to binman - trivial
once your script is applied.

> Add 3-board test cases covering default mode and `--strip-local-fixups`
> to the `fdtoverlay` test suite.

Please can you move the tests from all three patches out of
fdtoverlay_tests() into a separate fdtfactor test set? Then they can
be run on their own with run_tests.sh -t and skipped cleanly when
Python or lz4 is not available.

> 3. Better savings than just a simple partitioning, like between SoC and
>    boards.

It would be worth including numbers for a plain SoC/board split on
trogdor compared with fdtfactor. The whole set compressed with a
large-window compressor would also help (as David suggests). That
would show how much of the 87.5% comes from the factoring itself.

[1] https://fitspec.osfw.foundation/#external-data
[2] https://binman.readthedocs.io/en/latest/entries.html#entry-fit-flat-image-tree-fit

Regards,
Simon

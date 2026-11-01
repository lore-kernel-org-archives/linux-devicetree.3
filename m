Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793569362;
	b=ER9hlWB0VehJsJdbS/F/auGk+jkWVHmpMZaJNWlzYflKLv+8en/mEGGXZGocNuF0S6we
	 U9uP62KBuMaR1qKeA0qwc8VMdl/eWgv5K894DvyaKK36dHga3UKKsqWeyu8nE6PqzGxNh
	 ol2OTBJgVdZvc/hgn8CL2wsu5e3Pvx1lphawoP2r9lN4nIXrO+eUUycMI8XU0Qfpcsexh
	 1MG0CGQYMgvpTJsZdoMwcPjSTh7GzIjtmocid1aB3eTFBHTZoVCC7Rv/dW/5VhkJtsnE8
	 x+SThT5S9ZpxNkbTzFsKUkADrNRKmaxPyCTwD2C3cuIEmgNvAd922pp+4Ln+KGYwQPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793569362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
	b=j1+9k03v4miBZfowE5UE6uqkeBWcHOHP9X3IJZTCKxzJlH+C2IHvfOI+Jbm4x3BC7Snj
	 MF4E+WEtg/eT2qOB0h0qQZZgg1eankCHaNuRyYGPL9aW+bHtV9dHZImxM1SwtaFOH2IhY
	 6o4smbTc+gqi0mgbTsis7CcqTdf8mbJEpSfXg1pfQOgPebnqrbu32Iqsfq8DgsJfjOpij
	 AR5/cNimFA1Vmfe9UQLNsxVAwgjethMTTRY3WeO4wRzPbzbjNLiQYlmurB1nHoeB+d21F
	 bwTv7nkGtTwP6rCf+uv5WWYyJ2jO+CJ2HWO3mAX/YMwSav1OyxygK43GIaxgumSLBRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XPRgO1ly;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E2606A324
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 21:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5E2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XPRgO1ly
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso4756536a12.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 13:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793569361; x=1794174161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=XPRgO1lyCLY0Dr97yQ5W6HeWE4p3Q926Q0f0knwVaSCoub9vJ5Y3GA8JHSk7YuwWDp
         0xmQdazqkIfYHbqSaKVSVreVKDZUiB0wULn8d1bnLNQ9tdsk3IYApr9HNz0rOU92V/pJ
         I84KxgeJiOH7BeZWHhCQJSHwRxM1NbgJ2BRo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793569361; x=1794174161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=D6WjP9c1mXJjgcJdsnHi7FliJBEsNBrwOA9M8mEI8higbE7Ekb4uTtmXu1UZoMMWqy
         wXb4183J8Ur49EiVGf7gMD9YBsQEQ7MxWsuSCkv5GOzlc9H5ZMOWcjhMXv+hc89cW3TA
         N/zyIFSDPHDuT2albP+TEY7CxA95eQ48eDmtszBDZG03vGW3Y2iR5Hl0+Owa2Z0kllmE
         N0br06gzW6rPzvsmRDLA4pfbJWaCnbhY8D3siX5VnMY8p5nmBzw5xlx/e7Zp6R9UHZsk
         cXVAfuhQhzDvkky61jYfifAn9cMtkjD2e8MPGTvw4ezttgyWCMsAy+dwiYXr/pQ/H7x9
         MmgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxABou7SG43e0FaFTe7z8xY5/D+i10TAE9FIvuPNy4eWgCYA9bA0u7B0pkTVVApNgwy8IXJbnPJHoxG@vger.kernel.org
X-Gm-Message-State: APuU4Z8UdvgrFo5EWLJKPZvu/X+0ThdpYWw0OwZiZevs5LqJN0c1oOQ1
	Ik4Xb7XrllcpK5nRME+dlfFPVGTTI5IczLCtQauVsizn9CQ/UKkUpv8h9l0y9AZnxgHxLWfUG7p
	pVezO5Q==
X-Gm-Gg: AYBFou08Bi/qjrpDlT6vKfuudbXAQrn8olBjM47LlnajNuZoX6SrKUUryezURm6EZeD
	g0eSJfWjpx0hRIE+K3eNf5URDIN97xGUBuCd5q2yELQqiFREO7rwY/PxRBivLURsvj7vAPD43Q5
	+KSV8TIMEuKBuHOWk4vIKNBCQBVIa2RwKpjKLH7X8/GX16u88JXZ2zPtbuf6j8lh9am3sGUUFKe
	pfhClh7aMcz3lqoByYympnJT2ztws9CZDjK2qpEaT/AeKycubkEOTwfDDMIQV/lAOcm/cu4Sj0V
	1B1dQPggThBi+FuZyVjKqAU+jRvywO1cA/9PwBsxrNQnAETQS6HZmgFS7lpPbJzB/houGouu22+
	+ZSfSvEsOpwtrxKg9+dZhlqQe7hcDseb0NZmEqkap+1EhXp3V4ftYj8v2tA6CC6eyqWQ8MwtP8I
	gaESpOgZ5XjXJGtoPzCh/KrDu+1zVFgyZ0TEC5wcxx4U19LPCsRD+o2nE0XO+C9zKT71aNi2/GM
	pfp9gGgQ8TpO6V1nQmPZebwnzQvjhnMIk+uuqN8xOnto18UlMWdZQbt5zdiJP8F7FrdKKdwLQGE
	emd006itl1bmAFBvL14fz5nKTmIc0+0W9g0+TElPIf/Rf8f16DyOVDYRKmrMNVS7Usk=
X-Received: by 2002:a05:6402:321c:b0:6b4:2f6c:799d with SMTP id 4fb4d7f45d1cf-6b4d487e981mr6168482a12.28.1793569360680;
        Sun, 01 Nov 2026 13:42:40 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca1a522sm2373527a12.29.2026.11.01.13.42.36
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:42:38 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b4883643ccso3065491a12.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 13:42:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx540mb5NqAuPNtLWhzapAi+/A+cIMIO+fl9QJmK8B+aTxzSHmDpMsI6GIap+io7bLxpuZhcBd8r4LM@vger.kernel.org
X-Received: by 2002:a05:6000:41d9:b0:48e:646e:fb61 with SMTP id
 ffacd0b85a97d-48e6e305b9emr20425341f8f.34.1793569013833; Sun, 01 Nov 2026
 13:36:53 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
 <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com> <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
In-Reply-To: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:36:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
X-Gm-Features: AclHuK83p4a2Vbxf-q7Oyea7vApFkqc_qnBlge2O9IlGicuQhVVmFjLkwyEXh7A
Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 1, 2026 at 11:34=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
>
> > Putting the metadata in the configuration's `description` property came
> > out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> > already uses configuration descriptions for similar board matching).
>
> Thanks for the background. The Xilinx case is a bit different, though:
> the same project writes the string (the binman .dts) and parses it
> (board.c), so it can change both sides together. Here the kernel would
> write the string and the Pixel bootloader and outside packaging tools
> would parse it. That makes it a cross-project ABI, and I'd rather that
> ABI were typed properties than an unwritten string format.

OK, fair enough.


> > The proposal I've tried to push a few times is that it's OK that
> > different loaders have different types of information available
> > to them, but people don't like that. They want a universal standard,
> > which nobody can come up with.
>
> I agree with you here. We don't need a universal set. I've sent a
> proposed spec change [1] which lets a configuration node hold one or
> more match sub-nodes. Each one names its scheme with a vendor-prefixed
> compatible string and carries the properties that scheme defines, for
> example:
>
>     conf-1 {
>         compatible =3D "google,lga-...";
>         ...
>         match-1 {
>             compatible =3D "google,board-id";
>             board-id =3D <...>;
>             board-rev =3D <...>;
>             soc-id =3D <...>;
>             soc-rev =3D <...>;
>         };
>     };
>
> Trogdor would use its own scheme (board name as a string, rev and SKU
> as u32),

Sure. For now I might just leave the "match-" out for Trogdor and
simply have the config file simply be a list of DTBs. Trogdor
currently boots OK with the "compatible" strings. Maybe Chen-Yu will
want to propose something for a newer Chromebook where he can take
full advantage of it. :-)


> and Michal's loader could do the same. Each loader still gets
> what it needs, the types are explicit, and nobody has to parse
> 'description'. Please can you take a look and comment there? If it
> works for you, you can point to it in v2.

That looks reasonable to me. Do I need to respond directly to the
github proposal, or is my response here OK?

Yeah, I can point to it in v2.


> > Should I give it a shot for v2?
>
> Yes please. The DTB list already reaches make_fit.py from the Makefile
> through the @file argument, so the new file only has to say which DTBs
> to include and what metadata each one gets.

FWIW, I still liked the idea of limiting the DTBs that were actually
compiled based on the list of DTBs included in the FIT image. My
current v2 draft still has that feature. It adds an argument to
make_fit.py where we can give it the "fitconfig" file and it can spit
out the list of dtbs. Then the kernel Makefiles use this to limit
things. If you don't like that idea, though, it wouldn't be the end of
the world to (slightly wastefully) compile a bunch of DTBs that we
don't need.


> We'll need a simple
> per-platform file next to the .dts files, passed with a new option
> through FIT_EXTRA_ARGS

At the moment my v2 draft doesn't just use the FIT_EXTRA_ARGS but uses
something like this (which will be documented).

FIT_CONFIG=3Dgoogle/lga.fitconfig

Hopefully that looks good.


> Running fdtfactor can then be another make_fit.py option, like --decompos=
e-dtbs
>
> [1] https://github.com/open-source-firmware/flat-image-tree/pull/66

I don't think it buys us anything to have make_fit call fdtfactor
directly, does it? The kernel build can just call it. That also makes
it easier for people to pass non-standard options into fdtfactor if
they want (via FDTFACTOR_ARGS)

-Doug

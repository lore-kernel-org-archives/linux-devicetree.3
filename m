Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215808;
	b=P51b0e/vqFrUDhXC+C1+SnZEUUF9+DUNQnAht/i7u5GnSni9Cg4fdHKvDU3QEthqlDC6
	 SkT8dDQfe4s9pufhjjaEDnGoEEMxBLK6etuBu8UkBX5E5nr8WFmgN90tr/u/AKRtaqVrt
	 8aeOJllhm8YNYHTa7jFqxrUXm+bUqICaHQVvOh1I5vXgeZuY7jfV2+zIRRiHOOgknNNVY
	 xg62AOF0eNqEBnionqqyg+7aJN+YDms/HVEHceClC8UkpXmQ+lpUQahxMp4pVWIyXFc4g
	 UFe28XCGYcdbcWwF/82uI0QfQL5YijKlR4YgzeaSfsPc0ekUYSP0Yx6y9TenHlo1qOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=5GqNarA8yhniPQn8im3r/1O/fx/VgqmvibkYDqdOfy0=;
	b=NwUOfo+VMdpKhv0GTEuKUOXfhrF1whLajFIRdztq/nLfbCqlyYNvzU5h2vF9Uf4h1vlQ
	 8FSudU6If5DhBTNC4rVLUefYl+n9qvgeAL1kJcRWok7n1WwSJ/d8IbTYD8l0Hwpomx0PK
	 E9R2UssB9S2/TouOt2/eRuyou+xOVjifcjcvgq6OT41ci/sQlqCru0aw604C8N2D5BMfj
	 2abC6q0EhVwWneZ3drBveRfX0p5vVWRkmFN1nTfS1KmM99gB16Au9PpcS6TsCKf6cPFmp
	 1gy56wo3V/lD+erEM8GsSu1N9DKhHGECj039CnaS1y3eCVOKByTLYamWK2O2K0k7hyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fxNmALEs;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDD4606A686
	for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 23:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBDD4606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fxNmALEs
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d581da0aaso193692166b.2
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795215806; x=1795820606; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5GqNarA8yhniPQn8im3r/1O/fx/VgqmvibkYDqdOfy0=;
        b=fxNmALEs7giTEZ/uC2VoLWNHbrXDh/y49zw0XXfkx7c/tRl8Ca7795+3FYcde9jr3h
         UcHDRtr9Bg3wLRStLNAws0oeCq/o+f2OiFtk/qUTK0XDkk+ewDiv+M1so/eheAIe21Jy
         4KTn5W9zN01S2wIpkjJ56qvi9kOd2+FOAQ4sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215806; x=1795820606;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5GqNarA8yhniPQn8im3r/1O/fx/VgqmvibkYDqdOfy0=;
        b=cedeWmH0IvzrBZQeCXDJb1iwOil2PZQ+mdyn5jGHadc+2h2R9iT3CB1yBOgsumFqI7
         4kmSZuYg4B3J1+l6lRhkmJIPAcBt4BdTOE7RaFt0L+SJusOILYEAh/ZRAss+/dJHtNpT
         t7SG8rBdbpN5DVW931ij2TKoWFPRLP1+j5nkXMD5+EBiBB4jj3PGAp8cWuJ4KConKcES
         U9O5+CjBPE7Y5PSjnW5vv5dKVqQ9ytPv5FVOUjYiQMv0ialHsDRgDRalfjlYG3Q4FhME
         p2RD0/OEd2xrCpMdKYO70VncGXqgG28DqdV4Fc5DY90hvBw0+fVaxZ/y3cWT3EWwnUUn
         FNLg==
X-Forwarded-Encrypted: i=1; AL+hErEZ7+DtvoQ7KqxHpd+chXgo8ISNN4iObEx3K+QtlOBk+AqsYaoq9T4a+exVwnEuzV4z491rTjYVcoHH@vger.kernel.org
X-Gm-Message-State: APuU4Z8oHyfMG0334iijcTQNVpemsJNvMmYYuqOFpF6nGaj/3zOB5bE2
	8xHx8TV0bBgwUwBDBYwLaWt9SEz0orCxreULLWs+okggboM7RhZdTN3DrDdu/CP8sTlJPepsa8t
	w0SOmtq5y
X-Gm-Gg: AYBFou2ouB8PGY3tJmTgTlt4tO35C1fFzpMDr+nYNVEeJR60oMqzUJfYNKZBa9aOd5P
	uAoNW/T75sL3CwzqJnttuxvETpfsKprpLmYhtVw2jot8/TwG7LuFNWk1NU3RlJdOtYgaTylkIjB
	bX4Pr/0fbBYig2Q4CICpU4bfb09EDLRIvyKiYCi0AY6wmknJKdcMeQWWEOksY0LKXQgXtL8lTyg
	3xqyyT9WFVO1iFxqcLSzBF/M4BOEsr973ZftRwb+YSS+syqiEfmhUcfVrMioGidApSBzsTxxpC8
	YPfYhqrvRwquBUEqr4uP78D+WVTd9Ml+vamYPaxk6ENnx1qjIooOSTCxP5VGgpCrBCpN/Hky4L6
	NQ+c5kpeI1bArAvg8PsGySkFqi/urMeHHBVtXIF8VqZlnxIr0GTAIW6GgsypT1SmsZUczNrYOAp
	Nxoi/FQK494At953J1AvRNmuxaMzVdc01npOvpmoRtwXMHF9QeLB62DVtgVwMmow/fqIoy9uv+k
	4cu99jtmlFCuTwmfOMkqxzBVl72aS4XLdvJ1H4qwfVjns30vRvtgy9A0V8UjbiuJqnDAZ46pT5G
	v5pNzFngvmm/0v3KNKRSCI9fIsU8nxpSymyQhQ9/q2ttkQi3Hu4SCKI2mu93NeOvmk0u
X-Received: by 2002:a17:906:ccc1:b0:c29:5172:6151 with SMTP id a640c23a62f3a-c513ac9b721mr373328966b.45.1795215806225;
        Fri, 20 Nov 2026 15:03:26 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm139166766b.51.2026.11.20.15.03.23
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:03:24 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso1071490f8f.1
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:03:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF5Ba/kWASjM5odUqEDAWo8l2pdTmCf2J3YrsdO4Oko4gW/lqt1jKf1cbrkXMjJ4QwcyWxr+AHGXDTn@vger.kernel.org
X-Received: by 2002:a05:6000:2c13:b0:4a6:dfe3:fd93 with SMTP id
 ffacd0b85a97d-4abb41f4dc6mr9300663f8f.40.1795215802107; Fri, 20 Nov 2026
 15:03:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.2.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid> <sashiko-outbox-215033@kernel.org>
In-Reply-To: <sashiko-outbox-215033@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 15:03:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U=wMCvb2UXgvSpZxoBNJnMw8fy-JzfYFOtQGs1-=w-MQ@mail.gmail.com>
X-Gm-Features: Aa3M54pRDnkxai3VLH8umlmccjAtNqBNTUBcGhqs9gRyZZN92t4mYXIwkfZVL_Q
Message-ID: <CAD=FV=U=wMCvb2UXgvSpZxoBNJnMw8fy-JzfYFOtQGs1-=w-MQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] kbuild: fit: Support selecting DTBs and config
 properties from a file
To: sashiko-reviews@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Julius Werner <jwerner@chromium.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-kbuild@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Nicolas Schier <nsc@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Manuel Ebner <manuelebnerli@mailbox.org>, Marco Elver <elver@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, Rong Xu <xur@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 14, 2026 at 1:09 PM <sashiko-bot@kernel.org> wrote:
>
> > +# If FIT_CONFIG is specified on the command line (either relative to $(srctree)
> > +# or relative to arch/$(SRCARCH)/boot/dts/), locate that file and extract the
> > +# list of .dtb files to build.
> > +ifdef FIT_CONFIG
> > +FIT_CONFIG_REL := $(firstword $(patsubst $(abs_srctree)/%,%,\
> > +     $(patsubst $(srctree)/%,%,$(patsubst ./%,%,$(wildcard \
> > +     $(FIT_CONFIG) \
> > +     $(srctree)/$(FIT_CONFIG) \
> > +     $(srctree)/arch/$(SRCARCH)/boot/dts/$(FIT_CONFIG))))))
> > +ifeq ($(FIT_CONFIG_REL),)
> > +$(error FIT_CONFIG '$(FIT_CONFIG)' not found)
> > +endif
> > +FIT_CONFIG_FILE := $(srctree)/$(FIT_CONFIG_REL)
> > +ifndef FIT_CONFIG_DTBS
> > +export FIT_CONFIG_DTBS := $(addprefix $(dir $(FIT_CONFIG_REL)), \
> > +     $(shell $(MAKE_FIT) -C $(FIT_CONFIG_FILE) --list-dtbs))
> > +$(if $(FIT_CONFIG_DTBS),,$(error Failed to parse DTB list from $(FIT_CONFIG_FILE)))
> > +endif
>
> [Severity: Medium]
> Does $(dir $(FIT_CONFIG_REL)) prepend a leading ./ to every entry in
> FIT_CONFIG_DTBS when FIT_CONFIG points to a file in the root of $(srctree)?
>
> When FIT_CONFIG_REL has no slash (or when FIT_CONFIG is passed with a
> leading ./ in an out-of-tree build so $(patsubst ./%,%,...) runs before
> $(srctree)/ is stripped), $(dir $(FIT_CONFIG_REL)) evaluates to ./.  In
> scripts/Makefile.dtbs, $(filter $(obj)/%, $(FIT_CONFIG_DTBS)) compares
> against $(obj) without a leading ./, so nothing matches, dtb-y is cleared
> across all DTS directories, and no DTBs are built.  Stripping ./ from
> $(dir $(FIT_CONFIG_REL)) and running $(patsubst ./%,%,...) after stripping
> $(srctree)/ and $(abs_srctree)/ would avoid this.
>
> [ ... ]
>
> > +    if args.config:
> > +        config = parse_config(args.config)
> > +        by_name = {os.path.basename(fn): fn for fn in args.dtbs}
> > +        config_dir = os.path.dirname(args.config)
> > +        dtb_configs = [
> > +            (by_name.get(dtb, os.path.join(config_dir, dtb)), props)
> > +            for dtb, props in config.items()
> > +        ]
> > +    else:
> > +        dtb_configs = [(fname, {}) for fname in args.dtbs]
>
> [Severity: Medium]
> Will by_name.get(dtb, ...) always miss in out-of-tree (O=) builds when a
> .fitconfig section header includes a subdirectory path such as
> [google/lga-blazer.dtb]?
>
> by_name is keyed by os.path.basename(fn), so any dtb key containing a
> slash never matches and falls back to os.path.join(config_dir, dtb).
> Because scripts/Makefile.lib sets FIT_CONFIG_FILE in $(srctree),
> config_dir points into the source tree rather than $(objtree) where the
> compiled .dtb and .dtb.cmd files live, causing process_dtb() to fail with
> FileNotFoundError.  Looking up os.path.basename(dtb) (or matching the
> suffix against args.dtbs) would find the built DTB in $(objtree).

Addressed both for v3 by simplifying how `.fitconfig` specifies DTB
paths: rather than inferring the DTB directory from the `.fitconfig`
file's location on disk, `.fitconfig` now supports an optional
`[fitconfig]` section with `dtb-dir = arch/.../boot/dts/...` relative to
the kernel tree root, and `parse_config()` returns normalized
tree-relative DTB paths (`os.path.normpath(os.path.join(dtb_dir, sec))`)
directly.

With that:
- `scripts/Makefile.lib` simply looks up `FIT_CONFIG` via `$(wildcard
  $(FIT_CONFIG) $(srctree)/$(FIT_CONFIG))` (supporting external
  `.fitconfig` paths too) and takes `FIT_CONFIG_DTBS` straight from
  `make_fit.py --list-dtbs` with no `$(dir ...)` / `./` manipulation.
- `_process_dtbs()` in `scripts/make_fit.py` uses those normalized
  `$(objtree)`-relative paths directly (since Kbuild runs `make_fit.py`
  from `$(objtree)`), so `O=` builds, subdirectory entries, and external
  `.fitconfig` files all work without basename lookup.

-Doug

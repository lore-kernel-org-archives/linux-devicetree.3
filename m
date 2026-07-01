Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA974BCAB0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 17:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927884; cv=pass; b=dHQAMSLQOXYp57Yz8UIdyuVox339M3oEO+omEBVRUx+OZViKhG85GIn4YLJfz+M3+VsWKBbPaJhaL0Ymy+j5r7DDxO/AEP227ot0tkKXaZdVf9zmR9m47LDEb055PtJ9VKRlyMfpNacB6GDVLEdnQxBXA0IZ11mD2WXXcJrEJ/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927884; c=relaxed/simple;
	bh=yoHUY1HPmlvk2DoI2QSvN4UxeuihQOz/3mG/g9FTO7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8s4Fz6h1moH3uEC0TUid1l7LfhxA3+r6qud3s7CiCvwuH9BOV3kNVZTmQjTVsQcOcp3sgGo2JCHQ/L6G/o4MQD8tipaP26fQgCsMEQCBNYJZbT1nDT/v/3u0M1dBVK/0sQTZZ/m9PRknD4V65tQ3SW2jnMfcI1gcuYVG8UzhZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aXIeQpx6; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aXIeQpx6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c81db32393so88825ad.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782927882; cv=none;
        d=google.com; s=arc-20260327;
        b=coqeWAwa004UGrOfsiScWd0PvpTvNPndq7hugCnkHwXs+bKCWXsR1GlyVBS9lpzVNr
         uXLWBobfgNBCg/eiWV1ouqYZzY2lPdmfakGybuXbrloSGCGhtFR7mgytCqFXGpoqv8Fa
         1y5zRb4WYfoECYw7dd6VNU7/IbI7jF//1nGIJFP1FjRmKzbOuG9JzMa+M4iE16hv3hfx
         RgZFATJUFAuL0tb59AGMWHtpF9KtZofK8v48qPRliFGkEtEh/zdW4PObN6aqNaF8T+DZ
         mqCFsm9hFFv/L0K7QEBy9PWlcux/Fe3uUvGjBPMSUkMh4J/Lxc7yrsVTw+xrJnGbUI8G
         uRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+3KB3W8igbPhJZR6fsRkWP2Fgao3oonwJVqpaQObUCc=;
        fh=v6/OhUhGeGTg4SWXSRg6bA5ADcqYrLGm4ZoQNTvHhVg=;
        b=D1WuVW69A6nv+pRKZ4vWUTZbGzBCBqdLpfwP4IovM9GaO2U9VgSJ1cUy4HyUcUzsOZ
         4KECDrRoHYedCDJegOIIwZE1fLPX37zW0ATZwDz4ys9/6HwMv51C4I1WopMKabpOaFGE
         bjO0cvKiZRqwwW53d5ico3tjTc3R6icMFWhXwiKcZAeFZ6vSZLN8j9k2cmJSdTPQMgDw
         N04ltYvb7iTigqeAcDntbUFf3O72p37gJ+6AKArae9DwWc41Tg2IaPlwOJuniQ1+0LrW
         CwoGX60DYPMGnBMzBVWayQJe7B9MVPRizjZsKnO498h2FTQEaz8V7v+W2Sxfg7m0uKZ6
         DQnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782927882; x=1783532682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+3KB3W8igbPhJZR6fsRkWP2Fgao3oonwJVqpaQObUCc=;
        b=aXIeQpx6AI6RnYotHUoqUVB1Xnctiu7un2FeCrJlyqQociDQ7xgiGuDjJ4yVfjPQbq
         9M3CemF/8AuDZ1zvsU9mEjVVB8iMaRyy1171HvRVUbUq3VdpuA7T5q0pqZzv7iniZKtk
         +UDWkIMZnSFZZJKZU0ufyYPDn4mjHW6QT/ifRGDEUIvqImEOkHzt//WOwV+Y2OeVt5GV
         rgXdSWYchGfe3zfNYSpC3KI8p+rErYXIfiFxdxDquC3ex3g7ANkVdmSZA0L4g5iBpsms
         yW4FuwOhPqVpX848SeXBNkBqQq+CMSdd4gJn/PcD6NNtLPI//qOBpms9qgrzUkfvoLRC
         daxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927882; x=1783532682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3KB3W8igbPhJZR6fsRkWP2Fgao3oonwJVqpaQObUCc=;
        b=cChBbXUKwbiIXZRxgbBAlKn1WGZRkTi3VL5VY3PEWWLxF3R/SI5VacLl6R3dALS9k2
         ROV8KqfOTr78tr6iJGIjT8NjkXZVtM8o8anbJqmq9zrhgMTblU5zepg+5iDlClhCZeOU
         Vi1vTLnLnR5EMe7t5DwwK/0lfgsOEa81ypcrVy9vgI3uxbqFuOQwN9V4qbHp5unhpfF6
         jM9PW+fcox4PxzrqJsBFpX8j0fOdXRRL2Vb070TDZPmZ1SrF7XGkRErcbvywqaBbmDIi
         xsTN7PhrSQZvXcVuPKHENXb+ZRFDRMYJjGYAV9t539doD9HKnMFjx6+ECxxKpZtZ/xzb
         +U+Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro/fwFhzvMchdXduetpHrRTSSt1w1sa9mxwhorV4t8WJLS1jjroLOza6RADXiMufe8ctOMRa3Ihc0IJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh/16Jt/Co7PzFztpy3CZmW3bDvtpWkON+yZxg9g00GSHbDoXV
	EcJxdr6h+aMDPRc6FjWAwq18wc9i74r0LNp7APDFl0kk5kMNbZmk9yJPzH2zc5beyfHilDHsURo
	y7SP9EX48XU2cFlX2d5PUhsSJHqSbFYwcNmI5Udrb
X-Gm-Gg: AfdE7cko9fcMrMaN6DcL1jB5bXVGjlAVxRhUjedTcfcoojGRefQeZLW9cBm1kN8ALTB
	w/zhdiN33gAe7yUQeU6QksoErWbhszfZU/A1ZCZMn5XuPEfhSB0zZbg8b2xM+brxuO9hjrmfVNH
	58hL6JSw2YWYitcOk8RfzNZiGCsItGI53xzrf774et9Vbf38W3Pl1s8fCaZ4L2FT8Ua1dOnWUjQ
	zur1cIUTgdoaQrHEXquZIzDsCtq2mn0vCF9ISImJb7+YintIxveJUymmpEVzS0sMP118Y+40CJq
	MPULSXBd
X-Received: by 2002:a17:903:1c7:b0:2b7:b03d:9dce with SMTP id
 d9443c01a7336-2ca7092e3abmr2685955ad.18.1782927881605; Wed, 01 Jul 2026
 10:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-19-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-19-7909f863a645@meta.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 1 Jul 2026 10:44:29 -0700
X-Gm-Features: AVVi8CfVI0-HeGb5BzxacOi52xTnZf0837ZLQ1Li6xufzgI5Rfn0UuYpoo0nJUs
Message-ID: <CAP-5=fX1wR0tKyTiLjpK5JKWUP8j=E4meaPG1eyzTwj1XuKmFw@mail.gmail.com>
Subject: Re: [PATCH v8 19/22] tools/perf: Support event code for arch standard events
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 1:48=E2=80=AFAM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> RISC-V relies on the event encoding from the json file. That includes
> arch standard events. If event code is present, event is already updated
> with correct encoding. No need to update it again which results in losing
> the event encoding.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/pmu-events/arch/riscv/arch-standard.json | 10 ++++++++++
>  tools/perf/pmu-events/jevents.py                    |  9 ++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/pmu-events/arch/riscv/arch-standard.json b/tools/=
perf/pmu-events/arch/riscv/arch-standard.json
> new file mode 100644
> index 000000000000..96e21f088558
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/arch-standard.json
> @@ -0,0 +1,10 @@
> +[
> +  {
> +    "EventName": "cycles",
> +    "BriefDescription": "cycle executed"
> +  },
> +  {
> +    "EventName": "instructions",
> +    "BriefDescription": "instruction retired"
> +  }
> +]
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jev=
ents.py
> index 3a1bcdcdc685..0cf9d26315b3 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -413,7 +413,14 @@ class JsonEvent:
>          self.long_desc =3D None
>      if arch_std:
>        if arch_std.lower() in _arch_std_events:
> -        event =3D _arch_std_events[arch_std.lower()].event
> +        # Inherit the arch-standard encoding only if this event defines =
no
> +        # explicit encoding of its own. Events with explicit EventCode,
> +        # ConfigCode, etc. may carry alternate encodings and appended mo=
difiers
> +        # that must survive.
> +        if ('EventCode' not in jd and 'ExtSel' not in jd and
> +            configcode is None and eventidcode is None and
> +            legacy_hw_config is None and legacy_cache_config is None):
> +          event =3D _arch_std_events[arch_std.lower()].event
>          # Copy from the architecture standard event to self for undefine=
d fields.
>          for attr, value in _arch_std_events[arch_std.lower()].__dict__.i=
tems():
>            if hasattr(self, attr) and not getattr(self, attr):
>
> --
> 2.53.0-Meta
>

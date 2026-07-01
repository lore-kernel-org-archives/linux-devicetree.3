Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC7C2E7185
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 17:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927909; cv=pass; b=EmkMdsdSwSHmWCxc74up9EL9hUy8uLf7soHXfkxdcs4jcAAfrp1nGRs4PYM2U0vPoxLXn0iPdSgbsa/ByXFuaH6xYPikc1VL3685vAy1NrkPt/qQOsvJOGu/+c9pehJppWCmycRqg1MrEvZaF+xSgj/NmLrTREgqN9pmAd7d10A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927909; c=relaxed/simple;
	bh=XSP6FcLY29IUdyu3UKpzzmkVLlCxGVD+UwFi/2oFQMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+wtbNJxBHcJBnfkF8/nwGq5GFvTuoLHVZBvU+tNoqJa8hPAFBJ/EkGPa0T5tIK7MuN+0NUvxTTwBR3vBazsHOUVZupvOxhTLpvqV6FzCYqVl3Z8SQtDuRRRnP6nMTJVUhbJi12wHHasRsUECSZ287G1vZFP0x5xy/IbgDRcLiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HMz/4nGN; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HMz/4nGN"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c9b2ac97cdso70435ad.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782927904; cv=none;
        d=google.com; s=arc-20260327;
        b=hMh/fH0NqX3RICtovHVUribaHlxwO/WOIby79EDmO10XrNjii0Mh8MuHk+32qNBiTg
         mh6yH/1aVpB5QaLhnwQkRGFb1sxMUZvY8n9pYD2Y9jRJVUwF5503Zox/hlcZlqNTZsR8
         nuwewydVHVGqW83pJAur036hb9wpHWAMtu7uy84lfO+bSKgNqoJLVqgCCk0Vh9Yo7mAN
         nCqJ0VhsyBTU1mne/oCrbS/q8vznKNVN5bRAt+RsMW2nKk8HWUx9pv8NIOGcUjCf8BPY
         D/J91Pihw0Q5ZT5gWt8Lz+fuYlZ9tLyBz9+bOfIcxDcwDq1wY6IjJX5ASys1LytH+Ih+
         qhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WnvY/8pdLerNOMgVcd3eg+mIsfzQdgJqCy+yb7eu3E=;
        fh=KiVqF329OxWFYOU4qE9eXp5QgnH9Ud9Cu7jSVzkme7Y=;
        b=LZJiWN/MUqut3rXOR/BN3/5T3WnQk31EVpyzXBUQfA8jAr3LLGcGkHUEzq+44muCof
         T6Trw1HUZKMo2om3JaOYDLNMV3bFq7zFjkvTy22K2Sx8CI+3/+FuwxgaPseV+OUyj5ci
         6UMRl+vFAk2lcES+UXsr+yyjIUdThPgDo1o5aha9ObKmzL+NSD++PusWAiauyVNeos2q
         Z8qzLsVOxzeHXWBPkoDvdCOwaoDSsa0cBMEu9nRHFwkUI9PTnj/PvhQrBGTCwIWpezqb
         qR6mwLc/kW2ugjNlk4Mw9pwM7MGz/LONBAIpUZCrS5ic2ij1OF7YxuHnPsBkln5ONDcU
         Kbow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782927904; x=1783532704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WnvY/8pdLerNOMgVcd3eg+mIsfzQdgJqCy+yb7eu3E=;
        b=HMz/4nGN3uj3wipB2Wc2fG0YLy/EhRZKMpMO2CIFXvKlTKrTmoKvOyKj/lMaIAFJ5F
         31BfSvUgiA/5lYzCpScH0246nCKmntraqsSNMV8Fw8eUghsYngojCMtIhvOmjacSsZnl
         ttvHoyGa/1TtpfVLDBoMksnzu0jqXcNIxHXK88r7kpxqih2y2bOmkrlGsI5o7w3SD0Jm
         ssIiaDbOhB67B9ZfIW/5RJWC8MXvJFswsdQtOr31Avn539H1DCcSRSxQBjuehgSCUwBG
         GbFm1k3Em34wtR68QE2ZgiIGM2Ck64QEHDLYpFZQrp1oqo8N72plYhhnd7I2zjlfL30F
         g11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927904; x=1783532704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WnvY/8pdLerNOMgVcd3eg+mIsfzQdgJqCy+yb7eu3E=;
        b=GiVn/bh1XDlcsKPrtbuGXSJdmg+H/uGXBab8X9/tUVoqXuhQdykft+f5+aJg2XDGRZ
         UoWKSS9zuijsjk/Yq2+aRlbxaHS7RaaeLwDbzeDlLiP1vdUiOrRQPToXz5joyQRCd5hn
         iBTzG4S+B143HVz/mUVfWlg9cXkUDpoIMk9N9g8A7L9QMzUv/tzeCUZO+p9PDuWhAPLd
         Jxt+JqPQjwwU1lVtzuR0E47EbLEceeLrMXftlG20BMkjKJTNm847V1OxL9wdHj6GgweL
         DG5sz9ZTkyt35JucETb9DfsNuc+weYpob640bAHTnZRu0LIw/LlKgdXK6+Sc6nkINjQU
         PFhw==
X-Forwarded-Encrypted: i=1; AHgh+RoRaptf1kCrnlsfvAJiCZwL0G0RuLXOt5bY0V6ZjrecZkOR40P8v3WnRE3lp83S1BZPd2eYI7eyr/nq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3n30X/l3e1tL5keUuhe82+K6+/QCO1hkn3i0JcPzhHi/ornzo
	p8TkrxuUUaokkvNTQwIHHBP2a/h8cNfLNGTrx/7eSZiVzfabjmg2iYY3H1ziQmt8lWcqu28ZPLs
	Tv8+TEQdJlPRwnV6boDnG3YA+wDy/xVEMOS4HPUxE
X-Gm-Gg: AfdE7cmqJBWi8dZlO3GX+p0NsSWGxKVn1px1U6IeS4FUpp4kJykUD4XVJfspGNSxYy6
	9fSrYDmKbDr7MEHIsGvMkYJWl/PgkiY6lSULt3t2ZYwhyZ/1RezYX/r/YwNrlmLcfbndSEsr2dk
	CJ4dmmHTCwUwTxyQ2d2ClUrmsBW1LYE9KomV6Ct2KlEdyy2vHhhPzYQtk3rCzTsk5H77jQ60Nle
	AC3k1rIde0VOS0WuN3yncQinZCEsmK0wUMKZ9gqYWbTr9g6jy4SGH6RS06/aoiDzD9RzUw/jQ==
X-Received: by 2002:a17:903:41d0:b0:2bd:6dad:7ccd with SMTP id
 d9443c01a7336-2ca77f00e4bmr2394415ad.25.1782927903977; Wed, 01 Jul 2026
 10:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-20-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-20-7909f863a645@meta.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 1 Jul 2026 10:44:52 -0700
X-Gm-Features: AVVi8CcF30QiINVIR-rPJZ0l--luoek-SQcSIaomJxOhJ6SUjI8adFi78wHcNvk
Message-ID: <CAP-5=fVBe7Rsf4tkaRiMVPcAD1rHr7PxT-8XpR208C4jaANmmQ@mail.gmail.com>
Subject: Re: [PATCH v8 20/22] tools/perf: Add RISC-V CounterIDMask event field
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
> Counter delegation lets supervisor mode choose the hpmcounter for an even=
t,
> but the hardware may only allow a given event on a subset of counters. Ad=
d
> a RISC-V specific "CounterIDMask" json event field, handled like the othe=
r
> arch-specific entries in event_fields[], that carries the allowed-counter
> bitmask through to the driver's existing counterid_mask (config2:0-31)
> format.
>
> The value is the bitmask directly so no counter-list to bitmask
> conversion is needed, and because the field is RISC-V specific it is a
> no-op for every other architecture's events (unlike the shared "Counter"
> field).
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/pmu-events/jevents.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jev=
ents.py
> index 0cf9d26315b3..516fb73886ed 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -396,6 +396,7 @@ class JsonEvent:
>          ('EnAllSlices', 'enallslices=3D'),
>          ('SliceId', 'sliceid=3D'),
>          ('ThreadMask', 'threadmask=3D'),
> +        ('CounterIDMask', 'counterid_mask=3D'),
>      ]
>      for key, value in event_fields:
>        if key in jd and not is_zero(jd[key]):
>
> --
> 2.53.0-Meta
>

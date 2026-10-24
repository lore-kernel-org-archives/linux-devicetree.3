Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829827;
	b=mYsF0MKWwfQ148iHEsF98KkANkZMmz9nFYuzAdPuiUawyR0B1qHYeGU8wrJqHApWBCp5
	 GCoXZRwioUrSmMJKUkAQoDDoIGCCcthZ4TFIrXAxdjjCHexVxEoubE3iXjkgnD/x91S3j
	 G6Yzb3/ZbtiEq6D8kJuLCUis5uP/HL9kLvyqDzGOgHMBdwyG0JUpqmFiEujBW55atFy9T
	 enOxnBbsZJTAEGn6j8xio4mmw2bHFIIfzm7t6ZhKp77sB5FDUlVuxEyUPI0Leu2RL4F3t
	 6estXZGzRVRscZaLJL25iZGKpggMoeJ3AqHDbiY75nPLMevOkUM03jCGs3nxJksV0Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
	b=EboYg1i/fMRMYz83xutrCMXJMRJkId0a/BYcZolAu2liFc5Jz3pQ6Q9IGUKmQ6PsZM45
	 7bfhZssWdgh6gOplg5a2o4ZSDkM706vCVtDy7Cp83u0W0w82H6EOD+sPoPQqzofou7j0i
	 ujMP3flV/PDEyKiXLBsaYRT2BmAfVytq+onrONznT1WGhI7N695azfVJJU+0NltlJulFj
	 1r4THzSnvgKeY4c1LQfr5C3RmRkXNewpbLDDGUYHWNzuzJbcBIx1tbPLomY3zy0XELqi9
	 8UHcSymTtJRuLNTztuuKrxAi51NwF9ChtDXmyZcM5pM92qq6JC6ipszfk1381XWsTJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="RQ/C/ciB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEEE606A32C
	for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FEEE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RQ/C/ciB
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so2496302a12.3
        for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 01:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829826; cv=none;
        d=google.com; s=arc-20260327;
        b=ER0li1ClpPBBbf38noeXyGNCtz302zy4W8bK4dakYhdeG+S8CEf4rn8Nqb18ETpWtK
         40gfglMHNyy00K+4IP0Iu6usCUFDnJOyuKmcosVzdGtZeDzfL+vcwhxWIAq/gO+KQfyP
         iwPBeDvDpqFOpuf3Ei12HRjmH6qVeBOxX8/RyKgX9m4vBEixbCZ71/L9mca1A2LUpX7B
         r9hkS4U3Hm8EUuznWOFZ1hyB+3/uUwzNhrxK7T6UqAk/qrvo7PN+v5h8ILdaA1dM6WJI
         k8ju9+haDjhxmQKamBsgsjhZwm3x0mM/DUBo+xZG/x1jq1R7a9Xcy7GZ6lnaR/D0qc4z
         wAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        fh=CYkouUmw2VfnRbVFqmK2PAiCf+dR8t7CcITq2vwaOOk=;
        b=ImdzIbPj0oCaOB6Y7jr7NQ2LDhmrtgtiYoh/BtdwP6OH/kgahSS0r9DdqzoolsLdDe
         aHS291/OxuN7qYtfGdItxV3Es+MlACef4dQwy9DWhuQcl49LqKVSvLdK76d4yYaCAU+u
         HaQCGKy11scRL7kec7vFtaRyte+6kHMmij8I2o4N3yo4lktdIQFJyOwOLOGl6DnrbVww
         VDCi/n4nyngj2Fto6enz9KclxVxikY2GIPAf1+uEyvJcvEtFg33Mg/btQporWSoNldLU
         HvuXc/x5ctevntzpJFYSqUSdv7I2Nr3Tj6V8EyRLZkWJvSYjZH/m1HuKVMGpCexlka5j
         waKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829826; x=1793434626; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=RQ/C/ciBKZJHGdvCZm/dYrMbyOFdij4a0YW87tH+vXDq+9FS+P0+VhkPe2yvw8PouR
         1rl5NjCRsmehOHog4MCGLudY+nXK4o7aKeyawk/ABbhLZrLiG/YXwW5Ec453FETEL8A9
         gIgBxk5de6f7THQVvOrLyQmTAT4gg/7K+qaok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829826; x=1793434626;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=iFyb6cmz/SCizS8DImBZH9ZEBzGD3BdlC4OqNynQ2/kaRZvhWumoGVhtzWLbwaydmj
         I6+cIPM9jsL7Viv5k78tZgkj5Qahqmmyd9+3SSSWvhoFvkaCg8WsoOvVRzZib1UKWt0I
         ezyL5MDGBU76+Z/NIeoPJRMBhZBuMujIvsPQwLyBe24SgsDc/ON5A0LrHR5VC0ffyCqx
         Iyk0DhLvWYns3QOWcE7G+RAD6y5dfIgl5W7HE3Gu49TQAnZ7rdBXyf4/59mKhz9YB3vJ
         C4EUt8QMVrmqdg26WpKHS48VilLdm9Bwj/AkJvnXbhDL7L+L2A4Hn+Yr1DJPc/JTeoDe
         km1g==
X-Forwarded-Encrypted: i=1; AKwUvByAXYCM4MqEhSelJS8Ym4yuvEFbqzLr0+uO0NA6sD4mzv5FgwccD3kUWmy4OJmsLqeyVW2Y0t9V5csb@vger.kernel.org
X-Gm-Message-State: AFq9FYI9dZlNm1Q91h31Skpc4ZMXVVSnmVQddrSyDfmb9+fVfJupFW1u
	7rqCY0pYX9yxJBDGLdb8nr+VRviPemDYUco0rKUdWKRtEkm9VAKJFaE8knSETJuLz4Whd5FRZsj
	AEbWzfdt6MqFlP1V0xw9FvE3c3OZLCXzQesRNqmSy
X-Gm-Gg: AYBFou0O+jF2ppvsrWZvcfzGyyxkkwpYts4+kAxvaf4Gs2qF7RNVpI1cxmN+OULuZk3
	H8Uc6N0kIPLVBUPyGnz4PBU0bsdxYi+Pd/aR/P9AgewineOPFWCYPzrT2KCi4BDoEW4ajXxArnK
	Y8cpfTX6qtwrZRrkjzfgyZl1wdptisYtZH4/CIjLb6ke2h16TLiMbsBVgDQOppktX/VnIw/dY2I
	1U0Pnqe6iPgICQxG0pocFNKA+qke22+VE0n76pCmcgJmphDLLEzYTQGIKZ6uFpdJAQ7XuSh9ta0
	Q/spGpzw/PSXXmfn1iNEqtS7sqcBj4Kkfk8pqr0uRqP5t5fjlrdHCl+PCzeniy3mUFTr77Q5nAN
	XO71jBmb+KW9JIQSRKy5efAvrJSvfWyj4qZU=
X-Received: by 2002:aa7:d6da:0:b0:6aa:e46b:2ca with SMTP id
 4fb4d7f45d1cf-6b442ff19aamr1213416a12.30.1792829825967; Sat, 24 Oct 2026
 01:17:05 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:01 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:11:00 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:01 -0700
X-Gm-Features: AclHuK_qmQOwk_OOKs0VN1cm__skt9GZJUv6Fec-Si_oH1IGjBDYDz8yVEqOjak
Message-ID: <CAFLszTidu1NFSJ9dprCHts0-XY73gk-ZPAhz0V9BdYPoCcXmvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
>
> This adds the following commits from upstream:

>
> f3451d12532b meson: Only take the version from dtc's own git repository

The script builds this list from the last sync point (v1.7.2-69), so
fdtget.c and fdtput.c get loads of changes beyond what this lists.
That's fine, but you could mention it (e.g. the new -r and -d options
in fdtput, automatic growth of the blob, long options, strtol()
instead of sscanf() for parsing integers, fdt_pack() before writing,
the libfdt iterators in fdtget)

I built scripts/dtc and lib/fdt_rw.o at this patch with no warnings,
which covers the in-kernel libfdt now that fdt_setprop() and
fdt_setprop_placeholder() are no longer inline.

>
> f3451d12532b meson: Only take the version from dtc's own git repository
> 7a1e01792600 libfdt: pass sources as keyword argument to library()
> 8c37c14c95d9 fdtget: Use libfdt iterators instead of open coded loops
> 89c99ce78ac8 pylibfdt: Add add_mem_rsv() and del_mem_rsv()
> 3750493c8b0f pylibfdt: Add address_cells() and size_cells()
> 0748c384fde6 pylibfdt: Grow the FdtSw buffer geometrically
> 5008d1d6a356 pylibfdt: Replace removed SWIG Python 2 compatibility macros
> 66e1201c3775 libfdt: fdt_check_full: Add can_assume(PERFECT) check
> 214372a27398 tests: Replace trees.S/dumptrees with treegen for making test dtbs
> 4df9ca4c8ddb tests: Add treegen, a pure C replacement for trees.S + dumptrees
> f116f4800edc tests: Dont have test cases link directly against example dtb data
> 9b53b9a4c2f9 tests: Add missing unterminated_memrsv to dumptrees
> 5f919a25d71b ci: Merge make and meson jobs using build matrix
> 6c1426dfa963 ci: Add macOS support to install-deps.sh
> 23fd89bc8ed8 ci: Move FreeBSD CI from Cirrus CI to GitHub Actions
> 3ad5ebbdd9d5 ci: Upgrade actions/checkout v4 to v6 for Node.js 24 support
> [...]
>
>  scripts/dtc/checks.c        |   2 +-
>  scripts/dtc/fdtget.c        | 207 ++++++++++++++++----------------
>  scripts/dtc/fdtput.c        | 280 +++++++++++++++++++++++++++++++++-----------
>  scripts/dtc/libfdt/fdt_ro.c |   2 +
>  scripts/dtc/libfdt/fdt_rw.c |  41 +++++--
>  scripts/dtc/libfdt/fdt_sw.c |   3 +-
>  scripts/dtc/libfdt/libfdt.h |  70 ++++++-----
>  scripts/dtc/livetree.c      |   2 +-
>  scripts/dtc/version_gen.h   |   2 +-
>  9 files changed, 391 insertions(+), 218 deletions(-)

Regards,
Simon

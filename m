Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BEB3B42F9
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532145; cv=none; b=tlxem4PoqHm2BSZfkNHNV85dAFExAJHa9PxVVeiZTQvKCpM/7+f8iGHAZE+8ttIkgNjMX4eUlCxh+M/1ExuDrLi5fw4nJ08tGwzleslhDg2W5oMrmPI9e/qRCn7DbWWB77CxmjuYYQV6GhZ3imuf8AElZVq3DG7EWGyRd3A3yYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532145; c=relaxed/simple;
	bh=SBkUBV3inMBinSlE2EXReUKlgUw2jSOCC8j8xgqt8Ys=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Y8Q7ayZX5r9Zim7yWYcz53DZdON18EfSB2Hk7qDGjfpvv5xmUJvWgeyCv5KJQM2oGGQ7QYqcoEdE3/9ZW1ltd3md7yqtcZk4MAXYqClbn15bIKHidTsYmY6bczFB50boPsW2+u6p7boHnvaVcRGqbjL0Z96O9AswfUXYdS2ikUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZrHjZbP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZrHjZbP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so7487831a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532141; x=1785136941; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dFLZdi7jBgOetxqkL5F8Xn6PniUl5aE+NCedsWROBE0=;
        b=aZrHjZbPdv/VbkHCa5hfhxSGMi4r8XrPLGKwhEFcCI5k1+/oS47EViGwomNBH7mTSm
         XhgL89VJHRIlYStd0+vvLksA3mtuaGO98UZcG1SQz06EDDJDiq1TYwLVKiNGQ7D0zc80
         uY62lJY5XbY6lSur2z3MATWX1V70z++Jgx5z5fSsRPUZS2KCg40hRHo/oEpn5myE2cm3
         5DwD6tLyw/GDE+x3kzY8Q7ZcWcYn80DExOLq/+J58Ax6nt63aY4UyIj0FnxFf53qfYMT
         cq8StcaruMAMTfTifUcHsiGZjNyp7PEaM2aIeBCFXFICWsM6EPWNGmoCqz8A/PpaEL1H
         Q4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532141; x=1785136941;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFLZdi7jBgOetxqkL5F8Xn6PniUl5aE+NCedsWROBE0=;
        b=CwDFDxZ2H9jxzEYlh0EXr+D0iPo8GIfnqsx49vsxZwbi0e0QUh0BGjg+QoMNfM4dV2
         kj7XZISQIM5/eNWYd7oWGY+0qbZr3RlyJkrt2N4xFaX639CvAfN3J5z594yTx02KwOz4
         ZULbr6VoIQntj+v7lwVTwkfinfaJWuG8150ltvIuOHwatec+33DrDpNg0OkoxCJwyrSz
         ttdz4C8mXRAZVQyBdux9ggdhkCjkkde+lwyJV/WqwEZ2bWniu5ei7uByYq0cK8T2wYlT
         o+h0IjAnoUdWH4duDcRzJxW781lqlBPhUFMH8DejSKoqr7SpbgK0vb7RS06dLVLT6XtQ
         uQSA==
X-Forwarded-Encrypted: i=1; AHgh+Rr35PfOuo/vTvp/qvwH5w4tJgpW6DTpMZXgBWJR3r9NwBckaOkUN0Oxr30ildl9hBs1uqq/CYs6ohS0@vger.kernel.org
X-Gm-Message-State: AOJu0YykWk5qMfaIk+troBB6gJ7Hx25M0Z1R2MvxatgsAPw2m+RgYei0
	AXBeOGSsVEW8gmSuXf+rbn40Rh5UhYPXcIvGSOXnwGx5xN6W2mUMZiQv
X-Gm-Gg: AR+sD13tEIRbdxgm/VYtUdWbkg1exHRJM8TBJClxFDQVTlIjq7BvgoQf0Lp2Sh0px+v
	uS+DBgA+zCvwmT26WnEvuelQtEr4zx9tOloculK6L3qYvbZIrRd2x73GSY0hvbojzmAnqgx1Z7q
	QNLuUSwTgESAG7hMeFlJlQtzWQaKbXqbgx4dOcFUuktlejDseZx3YkvXXSQ0np9arkwr3M5N3F+
	AJmQKoCZRBxG0rov+Y+OTashEFy4ZKNVcFOT/mrPMgHR8c/zSsPFDfv1AjhjNUBbyZORoI2A1fB
	dF0rsXBnidnSN8B/4a9Lwh57T+wyGGcfh2fUok0tRa4Kcberp8cS+ryg5l8WE5TrmaAN34tTIEr
	zFjie1ZOucTne+DFVAlnYdF/JgboSfKRz88FMPAHXxsr2pGzwc6Qe4rGjYZUPXfKC1XLeX5NALt
	Nl4NlLQpUvayEcp9tfuowcW4JlbcIQ
X-Received: by 2002:a17:90b:224e:b0:38e:7f52:c8c1 with SMTP id 98e67ed59e1d1-38e7f52c9e2mr3426881a91.28.1784532140841;
        Mon, 20 Jul 2026 00:22:20 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 12/22] RISC-V: perf: Modify the counter discovery
 mechanism
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211938.543975.7016109597042850635.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=1181;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=SBkUBV3inMBinSlE2EXReUKlgUw2jSOCC8j8xgqt8Ys=;
 b=kTziE623vXoAa+JDEunw6f10OBNK2smh4OC+4caPgYt5rsl1d/L9P/MzNiS/0bUGjTtCy0tKZ
 nYPopmmArSXADJnnKy4KEiAAwcwHjgpz6bWgMPJYTo3ZdyCSTOe1n8J
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Wed, 01 Jul 2026 01:47:00 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 74d934238821..c20f1e33c65d 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -1599,13 +1658,23 @@ static int __init rvpmu_devinit(void)
> [ ... skip 15 lines ... ]
> +	 * in S-mode via Supervisor Counter delegation.
> +	 */
> +	if (riscv_isa_extension_available(NULL, SSCCFG) &&
> +	    riscv_isa_extension_available(NULL, SMCDELEG) &&
> +	    riscv_isa_extension_available(NULL, SSCSRIND))
> +		static_branch_enable(&riscv_pmu_cdeleg_available);

This needs to not only check that smcdeleg is supported in linux, but
also that it is supported in the SBI implementation correct? Trying to
boot this on OpenSBI before 6bb6b61c27eb ("lib: sbi: Add support for smcsrind and
smcdeleg") will fail on an illegal instruction in
rvpmu_deleg_find_ctrs() while trying to access the scountinhibit csr in
the patch "RISC-V: perf: Implement supervisor counter delegation
support". The proper mstateen bits need to be set for this to work
without crashing.

-- 
- Charlie


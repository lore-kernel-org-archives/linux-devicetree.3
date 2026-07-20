Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DB03B7772
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532139; cv=none; b=dKOCkUmU1BcqonXPu5FInd5+HMlb1QMqpZCLpF2ApNy9zqqTx990oZQaIVSivSqg+cG5//kUpdI/B5EWah4p6WPt/sFakB19ASnxLd4YLoGo5ZGJGljV65pwT8USprrHH12weuZUr4muBXNH5B8/CD6LCidBlL/cBoNoDDrC+hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532139; c=relaxed/simple;
	bh=qBhu2iKzjNZfNhl5iANbL2aUfkBruPYxRqMle5qLLTc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GajhHWbfclabSoSQGd51KWxpHdtu2gD7zqXANXnR97bxj5oEvPwcAO4/YkO05EOVXjWYcYVY7uFRLCB7MzbPMdAO5sMt0kzt6FbaDC+wyNLt2RGM0QQOK4veOg0NQ69cTrKGQ2kERfawWczdb4EDhiBtVjwZrXPnitWFbKhEJ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ7Ua9zI; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ7Ua9zI"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38101f85591so2751035a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532135; x=1785136935; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7rDy2YQnZjC9nWpz521LfOBEMpKeq+JKB5BWp/OjrPo=;
        b=CZ7Ua9zISHWjqNHbddze5qMCs8cIsQZ7tpiefEABYWxBPVGSQc4yJVUXWBKqLeKeE8
         ZdmP3RURoE5Afm8LtqsXC9whAPZB7JdFOanPbIWd8WT4ijBY7th7FKTplCDmt1joKFuX
         vqgot+h62FRbICY0o/ZY6893ykht1RBNLVC8wP++mLbxalznIfUhBC/dxoCaMOl6FGTC
         Ad9TtyaqFUfGTxLsFTpbxTThq1qX5CwoiNtog84LdhjA/J0KyDDeqFCi8vH5q5yYBCp5
         AFsJz734YT7nXPUaUZy2WXdVzVYCxfwAB516iDrFeUp3cclwKJk8bo8+prtA+g4W9d2o
         k0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532135; x=1785136935;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rDy2YQnZjC9nWpz521LfOBEMpKeq+JKB5BWp/OjrPo=;
        b=XLd4p8V9g5ZQD4fBHrWL036xSElWM6KhztEwjaFhSCvOG0CzSP11irsaMjoOtiywTU
         ZZMpblFy9hlNI1+lVYQYOaPdsMoA1WpTLezcRIn1xswxQEi7d8nIhkm4g3gMK2LFUAQs
         xDH/nSDM7CyqbcIXK3L8+bLceXasuXNEi8fzLUy70CeJlqpFr9xHF30QmheYPwC6VFGN
         uoKcTkeBTvQ4qW5NHUHIIiekF1J3a5k3Jt9WJ8lRbwRbU3JZXxr9gwUMXwF+5cEeCXSy
         pSIRbjeelDa5khmRoJsbFg6jaqCDK0oZn5uWQ9NkwOAiHcv+zg0vaYjnTyfcamNOj6lP
         2c/g==
X-Forwarded-Encrypted: i=1; AHgh+RqOplTZv2xCO7bLgKf0fIo1dxVpWTTZPPEOF++P2zzVIvqG2HJmrEbpYWLhL/fb0oC059MX4xLRLQmc@vger.kernel.org
X-Gm-Message-State: AOJu0Yytwx+orEXl4x9900/rseI4sspuY/1jidn3R09FnxCMlxBV4d7o
	FNiDUROJbBycwyQn/7Mz3DLYiwUxpQnBZ7SFSSV/ixvg4owjIyjXF3G0
X-Gm-Gg: AfdE7cmbbaUTC/GdNRZl5BILJRNhlqhE2NSCn+SE2O83tCCGJLCStvD1cfttgqCi8Eo
	dY1oHSb4TdIkRfhJ2L2/xLGxRWICGV8sSjQi7a1Iz/XoMiMl1vAJSKJOS9Ew8pohQexNr3iaTHW
	jw060v0yPpNmTCMCYV4mxqwGh9jCQHfdfGw0Tp7GkQCxGVp4YxN0FiXZg0BjkIs2YDYrvMY734C
	WZivK9ZrTOzWaCupzxnC6KNRRcC2UiEKm6wO5jw26qBIGbuP8mglJ31IxF0I6wWl3WIQG67st7b
	mmU8pjMtyXN8zRbF456XIokYqJmruyJ/tDywprm4LdeL2jIVMucHgz1RPMnJT3y4gOPA15vQ5Z2
	lfnqyTb9258DeEBIMBV+1ptVWzckrT4o3mKpfdoWMyHalA0F3Jh/xmOCwdRaeBcURNNKN/XEgiF
	XikkNo9tr97ux4TRuTWfRdugFkVK2eqnsZ3q8yO/k=
X-Received: by 2002:a17:90a:c887:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-38e3d26a744mr19412579a91.14.1784532134670;
        Mon, 20 Jul 2026 00:22:14 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 06/22] RISC-V: Add Smcntrpmf extension parsing
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
In-Reply-To: <20260701-counter_delegation-v8-6-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-6-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211935.543975.2748934407130948318.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=570;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=qBhu2iKzjNZfNhl5iANbL2aUfkBruPYxRqMle5qLLTc=;
 b=uKypJmhCBRm/kvczWTSaeADe6ZnWZKogPAT9RNWB2cU/VzqTs+HjCiYkmIUntLvKjnWbFfrXo
 mWWz+WSV1MiBTMwThyOj4KDk1SApmC68RTUbDpPAJQUlRKKfVIsL4JI
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Wed, 01 Jul 2026 01:46:54 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> Smcntrpmf extension allows M-mode to enable privilege mode filtering
> for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
> available in Ssccfg only if Smcntrpmf is present.
> 
> That's why, kernel needs to detect presence of Smcntrpmf extension and
> enable privilege mode filtering for cycle/instret counters.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


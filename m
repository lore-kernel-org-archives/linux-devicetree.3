Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBBB3B7B79
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532143; cv=none; b=cIRikXfllK2jPDCB7jlBi7XxLALObOjwYlIAEB5eI/YvVgkb0+nP/wm0z19HFKmlsrqFfZ2mPY/4Qlwy80RZJWTw5sTACzbf7hfObCkVc7FW9c3xqs8og5uHnWO8YS17dDLwyC558lh6oDtSgTJcs3R8V4Gcu0McR4bX9HP0lw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532143; c=relaxed/simple;
	bh=y1PqojkleYsBjG9eN+IIxqwXAQObYxTJP42EfflWB+Y=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ZKIu4h/YRF6MdMdPxES2BtwA/2ev5HqYWMVLp3PJ/iRn4SMn0wPN/nQToG2gy7G6JsFj5512bwEOVTehMG07CqZRwTQVil4MBCZC1XY6YJToqywiEHvEyb4JtNwmRzu8PRy5zI3jnF5jORLfa2zpOVEYxVSFlCRdHr7Wc6qkfcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICZbhrjH; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICZbhrjH"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1814009a91.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532139; x=1785136939; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TUztZ0b7q+NpMvvYDHyOAMUqlB8mjssu5zGv0A0NKH4=;
        b=ICZbhrjHDP7P4RcV31DeuKFCwPADSBG2PzhE1lMagpk7Y6Cp7wX6stAmT/s14fc4FB
         Vhq9DITgcueZ2bZrliWX7+FpPEb/Zit/N2WGtg2p3qM32l/1kkADY9MlJa9/Tkk8MJ68
         6V6A9HAovwtxlAA/lHbJEDX+yHjPuxaxmS0t5BdRMwUrGOs4XgWA6LW5XqKtmrBAbmYr
         PR/inXfdhalcFTfuXeU5RoSc6lRHHaQxjukv2fHBv9LMHTrHyoYodP7EAAbPwvX3BVt3
         +Cx/vta72vjUOU2vcurJLKNoZ82gn8fRt82CgcuXAWdQgKvRlH6r203X7LxE6zZwcx9+
         Tcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532139; x=1785136939;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUztZ0b7q+NpMvvYDHyOAMUqlB8mjssu5zGv0A0NKH4=;
        b=Y+kTo4+KJ15KdZ9bCNNWaCTuv45rRvtxDe2L8bVf7oJZhzUxsUPtGIpFXhBJSSJlbU
         fewBbPYJ//ySe2DGHXBLLHv1Zk/OvB2KTQtx5uErCpsFXa2QH2mxvKPm+Gq8Gap1HjhN
         Ix1IG8J5RveuYDyVRu1gNsao3xsUYetxvFWmdQABTl7Z7/O6zXbBq5Zil5Hrv+VuGruE
         Zn5De80uq+yxK1TYG3KGW8olm7ZuszWZuPxYjvruxtGSD+lrbK8/5ckST10fkqmwruvC
         pk2SDvWIx36n5GIrGIVs/V7jE9Pnt+J1IG+o8eWj6cdyJAJRJjC8/RLDskOn9EpXQ3Fz
         CmJw==
X-Forwarded-Encrypted: i=1; AHgh+Rrb9Wywah3iott/KxKFtoreMzpt6k2WIfetxFoOPMtHizAqqOaCMCv9M4dP8Mf39/9RGIPRxmwADfjM@vger.kernel.org
X-Gm-Message-State: AOJu0YyLYw7AUmmzsk4pq5x25jYDpbmbRSq3lAKnHuARuvqum9SMWhi1
	ThCXGuxJAWh15HZ/ltJEL7vbx99ssLj041rJm1nGGb7h9gRhTPww/Y8i
X-Gm-Gg: AfdE7cno8nwfTs2yPRrqdlz5yh5VA7KBCBLAN/L62GAPHjgNF4y6yRS7cCuStNlzrlA
	MK6rGTf6njbkjVGLkfy+u3OkCF/Y4sPlsyNgy4oT8cGpAjAxBaQDqUC0KFiNWu+wJdRDDRFBMk1
	UAMp+yhokNsjlS/TySwSTUK/crx9QIfVl1NztEi+sf5QbcCeihYmnhP3bJZqCp3tzcsHYlBNXt0
	SOPLdbP7Tk55+ix2Baagzw0aRkkY7fMv1u8P0nQijoi75R1JYs9IObP3+aDunUfVoLRjQbLwmFl
	d/ONUlczXSNV9VPqGtNQ4I0dqoFAWJVJVNzZxwLaMJYhsE6AGoWfMkK2I1izUKnULooTh8xxUU6
	7x8L54/IG2+mKmpy9yrq78CIMTJpoY9wgCvKGruQ1uJUOKp/2P6aJq5RDqZ9WZOfVg9xlEVbd++
	rTKMNsw010jYL3P82MVr0KVlnY3V5k
X-Received: by 2002:a17:90b:4a4a:b0:37f:9ce1:7369 with SMTP id 98e67ed59e1d1-38e4b54c1e4mr13295798a91.31.1784532138762;
        Mon, 20 Jul 2026 00:22:18 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 09/22] RISC-V: Add Ssccfg/Smcdeleg ISA extension
 definition and parsing
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
In-Reply-To: <20260701-counter_delegation-v8-9-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-9-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211937.543975.4322402942834410024.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=542;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=y1PqojkleYsBjG9eN+IIxqwXAQObYxTJP42EfflWB+Y=;
 b=liGw0+KRk7gLM9mGkWcbN8G4nDkwP2C2I7Zb7ri3m83b9lEN7e/fB+kwHHa/mofODnnb2zsUF
 IyWdYB0weUKAFFVTMYgNMYOglCZKygWyFNgG8v9xFhmJJw7QYjPTAMU
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Wed, 01 Jul 2026 01:46:57 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> Smcdeleg extension allows the M-mode to delegate selected counters
> to S-mode so that it can access those counters and correpsonding
> hpmevent CSRs without M-mode.
> 
> Ssccfg (‘Ss’ for Privileged architecture and Supervisor-level
> extension, ‘ccfg’ for Counter Configuration) provides access to
> delegated counters and new supervisor-level state.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


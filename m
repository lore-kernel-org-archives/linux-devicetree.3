Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B938C2DE
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532130; cv=none; b=IbCPSe/Pe3bB2zlP1LVA+cQEYIffxV/dKtcOoXrS62wOfbr2Lr30lHy8nQF6e08omcxKflA3xDYtWvs04U1y1cIRNwJkC8mwS8YY3gQhoa3t2VImdaW0u0y/czKRb3iMDwVoGse5n+4+l9E2Zr0f1ide6rx2v8v0NtYqHVP4XuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532130; c=relaxed/simple;
	bh=ysgPHA/+x7CEppuRQZHdHoo9X3ZDd6yInqnds9Ij0bo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=axmI7lrqMvOsCy/9eDEGoteksKpGzEmlPuXHgK+00qhiYi2a6y8w/MAwoRHk6/cnRcM0LHtHaa5QREyp4P9K3en0AyVV8vol7cMFFPZ1QXU36soobzJLRoJr0ZJF6sVeI6ypefVvJqKkCX7Lt0Q5PCil6o1LtjKNnfPj2AOYXu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pU3WQB2G; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pU3WQB2G"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e08baf860so7345609a91.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532126; x=1785136926; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0fm7uYEG5s4l2Qi1Q3lmMTkR8sLj78MMwG9bX9Qa+qk=;
        b=pU3WQB2GnNDFPIoEEYt9aYC1IKZ7ZKFiFDmvwgsS6104FDvqEb/IbmFOPlQGzGreMa
         HNOvDPauQktfJOLigoxFOBhF3FSXNpWDTHt2YRiXblgAugWUpGqR6kQMOxXzZnY1CsjY
         4Hw6Hn62zdVmni3dk5T5apP/UB29HelA0PP79fdQGXUcOYb9jQhvPCDocb6zdokF/MHS
         R8CU2PphrFxwUoZwst9tR41L2295bOdu3A6vkwcsNa2NnZPWGblIzfHY2ON+vkriPorb
         pA0pL8YmbAKLRsf8Pny9jnSXZSkdYMaAD8hn5aRKRmklq9wpBsw46DGcbaRwPYpc427F
         9hdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532126; x=1785136926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fm7uYEG5s4l2Qi1Q3lmMTkR8sLj78MMwG9bX9Qa+qk=;
        b=n4PDgKgICu8k8UWMz873GzMpqFk3d84ZMSRsiwTDGaQIUvrBnvwis/rUfvMITSsOAE
         hC4p02lXKQa/H/q04qTsv9cIgx0K0A/ERrF/JZLdaL0Rv7PzOOCb6kJ/7cDTjCn8tvUQ
         uUWl6uPOhnd/e364FltTi6QnrqmBJi2h/Y5zHDhWJlyNN/LQGHyccsifbgrXJpqm98k5
         69gQl6UaQsX0cGXTZFLOiAMJ0CE4iVsn+3q9d2mR/+hheX/fffW5ZrySlYeUxdkowKpN
         /hJXtEhgL9Pwt8PX99coL5ZrItc3D+255op2cPIC310Sh2v0exQIy0jkfBGrPPXhC6FE
         2oCw==
X-Forwarded-Encrypted: i=1; AHgh+Rrma869itjtvCMJqdUu7M2pmu/dEj0Yqw0uwko5vzC0o3bvpV5sMkThpTRvE7OurRvTSA1ItrVQ5ofc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb+o2Z8B8QtKDdxYfRr1a+UfaDymHu7K8T65PaBNZyAdMW5kcH
	OCvF51LX2OAct2KTxZt5gyfMtzV4SKt30/BWTLmjY4tT01TWRIFnA/p1
X-Gm-Gg: AfdE7ckV8O9t6cJdEb2MwhdqD9c80qWoIjeSYPGoMTumIo/UUHDULsi0LQQRrZJpmbc
	4EzsVKgY7gGrv4M0YZarU/2xetvusrbE7NDMP6p0CaMpBFlgtT6bt4cyqDvkdTeNkEOw/qNb8n+
	kJsbxdewDDCA5XC5emhY+uABjcnvc3f9OprNEZHRJN7Mwod30Mp7j7g18bHDGUNyd0cghsY+eEA
	p6kAAbBIqwLXgdfIinhMCQ7kwnMOxPdveyIb9uyia3eRBWBoUTOVO5DcBXCd7I+9D5vB6/rf4/U
	rOQxn/uQhJqDDqrcb48mmJvohRbaPqb9hM8KjKciI00YUri2fg49ftVGRg0ACLQRXMYDZH3ZIqm
	NxeW8QUtLFEy0LGxvj8rSaan/UE7H/LvVByPCAa3p1Wg5hoqN+PAjYNly/BPi0UPuBX9iXrca5R
	yr5h1LlBZ2CU/ZEsIlIv8OElRT3FER
X-Received: by 2002:a17:90b:184d:b0:38d:858c:834d with SMTP id 98e67ed59e1d1-38e4b47726fmr13853861a91.17.1784532126260;
        Mon, 20 Jul 2026 00:22:06 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 01/22] RISC-V: perf: fix resource cleanup on driver
 probe failure
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
In-Reply-To: <20260701-counter_delegation-v8-1-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-1-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211932.543975.10206534637071583934.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=522;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=ysgPHA/+x7CEppuRQZHdHoo9X3ZDd6yInqnds9Ij0bo=;
 b=qvIZNCLm5+fXN3DnRuew6aKjZnISyDx8ToUDRMjQnEAf9oEg+M6noqRVyXRmMKpzp0n+0SKqQ
 v5ga/susCSiBn1ylxb3JFmtsT1uI3nl6wtJUgUv4oCsU6GIAT34AFQ0
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Wed, 01 Jul 2026 01:46:49 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> Sashiko pointed out various UAF and memory leak issues around
> pmu_sbi_device_probe() error paths.
> 
> If the probe fails, here are list of cleanups needed.
> a. Already registered pmu must be freed
> b. per cpu IRQ must be released
> c. pmu_ctr_list data structure must be freed
> d. cpu hotplug state must be cleaned up only if added.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


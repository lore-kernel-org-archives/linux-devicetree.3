Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A509335E957
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110540; cv=none; b=EFvgaJlJJ/2WaA3K4Nq/wAkISpAHFYopTPPX8LmIJTkTR2Fc6lmSb2gCf2/7L4IoaDHhTMSlhD642FysWcIXw50/MR0/OVuJfzPk6OPTiomyv6DPxNQchHV/ePRU9NQ3OW/czYREa8TfNMEdKWp8u4H8iZ26QgvhNG7NF083PLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110540; c=relaxed/simple;
	bh=jfaeXI52jaMlrghTpkWWyKtuS2w1+ywG7Sm/7gz7yk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSRxkv3pto5AL2oDDi5+XS+5XpPFnsu4u8ziAcR7IblYKxYYc68psaI/WUHdbZZTklu0qR/5ebL3YOHwmyG8Vqc+SUl/9Rf8NesNSUOLpxsX3klohTtFzVn5zhK3/ZIDbJWeB28SM35lKQJoLNkdImvjheMs9hyg12TjXrP7Puk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCFp6NX1; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCFp6NX1"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1390f75d8bbso2413794c88.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782110539; x=1782715339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QILN8DTARoWh3OJ/o4dcikoIv6aHuZ0kwC7cM2/BMRM=;
        b=RCFp6NX1Mpj9gN56Px2KTtzCCvvW27QjESJnJA0XpuZs0+N0roJWYFIJL3C2jyvsa+
         cIuA29eqtB9CMnu4ze31Y96/DFz2Fk3fR9z2+gkw2VovMpU9aqqOauoSN4bxNu4mLrIV
         fRAFSbHl8Ax5dnauVKm6Lw3cG6EnEkL6MywPox1UllIc7Iqt54uzvfni8XmAXLEbCo02
         vMN4WPk9reRfBXPBHTEu5gy2DdyqTJN/px907loEkNTBE2UywZdMoM+yyPXWGYQHchNp
         qyvRiPKCdooN7yQnH+FZPSNazUAnCRbjxDklTX++4iTN9GB+Yq2L4FPHK2xipyk4Zuyt
         7H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110539; x=1782715339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QILN8DTARoWh3OJ/o4dcikoIv6aHuZ0kwC7cM2/BMRM=;
        b=kxaAl6ZhezjevOWCq/EcNHMG6d7HKHu/VXv+9f7bQCq7h3zqHlmaDApLwvT/MDdgFi
         yEHVaRP4QM88EBbUpLPqi2HNO5Oi/R2JlqqQ+Y+erOgDXrHzR+8VNGkaVSdblXEMOb7v
         2OM5WE0GyYsXbqYTiksYobHyAvnwEKENRAxlcld3zaSjMrG6/qakGLoOhuOamWdh+BK0
         Cb7bp5PQBvfnPojjgW/eljDUhZ8rNqhXsSSsqLYuF+0JZt+EFe8Dk20h8gh5lZG6KwsT
         OfW/3cfdCObuBacKLi6QvceGhRmaaXeZSmGvNgT+MBNyNwIlXpOr9lRciSDDa52g7yTl
         X5jw==
X-Forwarded-Encrypted: i=1; AFNElJ8yJWLf+I/acs2M1mKucOsnlwJPd2/K/ou659d0pjvimvmQ4hCDOcAuUpAqMW3sWeIgAWgP/57Q2d+8@vger.kernel.org
X-Gm-Message-State: AOJu0YxSrysKJmRO5JfMQeKDS8sNBSN7t+IkHSqYWAWrXvZ8aK5fNnsw
	Ssr6KgTjp59qs24KbTYZr9EmQC7xclqOVB2A+8VYvsIkF24ID5FAXU2M
X-Gm-Gg: AfdE7cn0kdGrqqdPb6ayhK1b3sOzpO9sH7HK+YocYNnLya1aa/+dWjdYQKp9ZL5MU8o
	KNeKwhE6RnV81hqn3Lgw9V12qN9KSoRYDk9P3UmD/F+Vk546O38NtF92/u6mMnTk8liMNC4m+2h
	U/6V8fEQw38QaVQE+zRiYHPTYk/PEnmh4aSGU4VWJhA2i/5zqJMuqqLeEbEuqaj9ChDZ8BFpchV
	hzBkWaIRZKPxlgxkwy+8oyUxfPrxsAx15ImzTpHMOdFLZkEVtTaf1JvF5Zr2T4wYTKOVydK+tOs
	eX0hGCZPTLt56tVx7ZUuoGTbsm7TwPhuT9Ueb9VjOckszIN9QhiTJ9MNr71UAleusPbYLijlscx
	UysqIIQi8wWL3pa99e7+g+QwauKv3h0iSZRWblW75+4NV1J5jjO9S2v8Vw0sf3Y9NoWQFYk0dPn
	fc
X-Received: by 2002:a05:7022:6890:b0:138:4023:8c1 with SMTP id a92af1059eb24-139a4eca6f2mr7435550c88.11.1782110538606;
        Sun, 21 Jun 2026 23:42:18 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adc0fdb6sm6363664c88.0.2026.06.21.23.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:42:18 -0700 (PDT)
Date: Sun, 21 Jun 2026 23:42:15 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anup Patel <anup@brainfault.org>,
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ian Rogers <irogers@google.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 04/21] RISC-V: Define indirect CSR access helpers
Message-ID: <ajjZR-R11yPYWuDp@blinky>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
 <20260608-counter_delegation-v6-4-285b72ed65a9@meta.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-counter_delegation-v6-4-285b72ed65a9@meta.com>

On Mon, Jun 08, 2026 at 11:01:18PM -0700, Atish Patra wrote:
> From: Atish Patra <atishp@rivosinc.com>
> 
> The indriect CSR requires multiple instructions to read/write CSR.

indirect

> Add a few helper functions for ease of usage.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr_ind.h | 44 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr_ind.h b/arch/riscv/include/asm/csr_ind.h
> new file mode 100644
> index 000000000000..6fd7d44dc640
> --- /dev/null
> +++ b/arch/riscv/include/asm/csr_ind.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Rivos Inc.

I don't think it makes sense to introduce this copyright in new commits.

- Charlie

> + */
> +
> +#ifndef _ASM_RISCV_CSR_IND_H
> +#define _ASM_RISCV_CSR_IND_H
> +
> +#include <linux/irqflags.h>
> +
> +#include <asm/csr.h>
> +
> +#define csr_ind_read(iregcsr, iselbase, iseloff) ({		\
> +	unsigned long __value = 0;				\
> +	unsigned long __flags;					\
> +	local_irq_save(__flags);				\
> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
> +	__value = csr_read(iregcsr);				\
> +	local_irq_restore(__flags);				\
> +	__value;						\
> +})
> +
> +#define csr_ind_write(iregcsr, iselbase, iseloff, value) ({	\
> +	unsigned long __flags;					\
> +	local_irq_save(__flags);				\
> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
> +	csr_write(iregcsr, (value));				\
> +	local_irq_restore(__flags);				\
> +})
> +
> +#define csr_ind_warl(iregcsr, iselbase, iseloff, warl_val) ({	\
> +	unsigned long __old_val = 0, __value = 0;		\
> +	unsigned long __flags;					\
> +	local_irq_save(__flags);				\
> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
> +	__old_val = csr_read(iregcsr);				\
> +	csr_write(iregcsr, (warl_val));				\
> +	__value = csr_read(iregcsr);				\
> +	csr_write(iregcsr, __old_val);				\
> +	local_irq_restore(__flags);				\
> +	__value;						\
> +})
> +
> +#endif
> 
> -- 
> 2.53.0-Meta
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

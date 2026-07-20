Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3FA3BADBC
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532156; cv=none; b=HHiSER4aOG+aF3bV5Zi/f7p2DYIQ8Y12GXMWa6f+3deJ6Jl15j2mHOLZVZ2jJ7qHsGwNu5mHByW5lwlATVtLJbyUgMFrasI0vqnNngVu/Wk23jc+q8GvgMWIkd8sPOG9pHWoU4wwxP73Qhx87qQszDg0aQHW5FBJhAOvUIVx8yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532156; c=relaxed/simple;
	bh=dYF7nkp05JxYIKgQ4jHUTlERnRx5T3N6NMRVo9VDNt4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Sty8dZBGSaWQQBPAHWGV+d4c4Z/KalLfuiI9ckk9J0yNqipO9sULc86lFtWtWpxZ+6RBMB96OyRJ3KpkkRZmbuhJqEo/Xc+tiq94FTuhazqvH5y+D1u5HY6WRda1vL7CoavaryQCYIOX38TPNnaQ/eVza39GllAd2ex7Mn0P7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5pBDUVe; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5pBDUVe"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dcbade417so7897362a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532149; x=1785136949; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dcPxSVKmnyDYbDNSJzzUfsfbxgQsODI8nQ8p4qJtspk=;
        b=s5pBDUVeJHFePWG3wFzJxrQ+4jN/SToL25uEMKp37KTVAN9gvs37L89wQY/BBtllvn
         zj8fq6XTbO9acFWMEbRRS1rzWrM5nmOD2puNox/qE4gN6/tWYO+HU30Wk8hcKLLRY6ir
         nouIfYKx8GHx1ePx/eneV9zniRgxKfzgWjo1F4eFVwpJODF1Xh6iVGgfnYLSXfQFg7bu
         gmRwANwsQuUj9aCJchdNAoiNF8bbutQm/NjOOEEUfpkUOi74rSC43DSswBXpxbt6JBVK
         5Q7xq5yXRhjltgfcKmFD7woUN6Fl5WR97MIanwOEWavFwwRGrXDEY2ZqbALn1/7oN9SC
         LbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532149; x=1785136949;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcPxSVKmnyDYbDNSJzzUfsfbxgQsODI8nQ8p4qJtspk=;
        b=NIR7DgrTnJgyY5UDWhUGiflti8cdBlJvGSOAuCjl7eCsGR2+DIu+CUlAVXlhFS31bu
         MXUTaHeMfrfUC/D0/XpcvoRv3unwTjCe+99OWSMtSnxFtd3AI99TcD++iT7FW0iLnGh0
         +Q4hwhw86LJt1gRC6r8hdgJpuX5O/nPlGe1ZLc7CIEgTz1OEWggWyy7yV4d9vKBkmHjd
         qZpcCHzNAYNYkkuLWjHTm3zukBfLa0NED1Ycna5RFS1IWP6pY1xnwTs7r+0wX9SM37NV
         4doaNUhdPudrJTK5Kx3EThf7wUB7sdwwRTy8texW0e9exGfM76yK84E65VfW0Zwh5b3l
         rZ4A==
X-Forwarded-Encrypted: i=1; AHgh+RpAfkEs6zHUNWJEbG1tsCMuwhr5y0EtBA67jj/mVe8yQOG2+v71SgXpsIWT3I/fVmffCj+ESYfMmzsM@vger.kernel.org
X-Gm-Message-State: AOJu0YxdJt+js75yOyfMtzAIQlBNY00CpsIMcXGGoUlcVdiVIb3yDWI+
	W1Ii/RNMFYJO8h9G+yEb+i6C/NuIBOklr5MHquyRN4qxS0EQ6qI/mglV
X-Gm-Gg: AfdE7cnKG/JMZQDvdMAp6rA05Na+O0YrPzJq+gSsh1Csxu4HklKBnVT2OJCPyt7KKT3
	/X1YfFuq6n/okTCsUIdeTnXBqSxLufPkWjKZLb7J1LAWhhw90oOw6g6xrPlT/0WyxBk5WQFSuRp
	YrPCsj5ZU4nizQhV1gqoGhmKQ6yPEip3Yof24npVavEDknaaq8mEFAI2ArdbSABiRAJIdeE7N17
	XD+ThxFArR+E97vaWSvjEqvYP5gT6V/ERoQdZ/QcI5/F1NHT8CgTWyO8+37MoXObAJLpQI8eqmQ
	fxR5pAvmjF/ppXE8MlfNSFNXqsQcNI7YRyZwgxlx76WAPLgEKmhagADLUtsA1Uwq+hSM5gNcFsH
	6Oq79qRUvaNFP57OA/HUGO8N6ISv+MtGRychawsuPCvVIxWMZ1q494LWKPEYeXGaNkmm+GyNDlg
	FH623Rqcb+ZjfSvhIVDoBcsS0xiHtR
X-Received: by 2002:a17:90b:574c:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38e4b585dd2mr13626298a91.34.1784532149122;
        Mon, 20 Jul 2026 00:22:29 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 17/22] RISC-V: perf: Add legacy event encodings via
 sysfs
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
In-Reply-To: <20260701-counter_delegation-v8-17-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-17-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211940.543975.8329989834248386453.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=3146;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=dYF7nkp05JxYIKgQ4jHUTlERnRx5T3N6NMRVo9VDNt4=;
 b=yNzrmMlFIV+5r1fH4TqRRoOIIToHMnHyIVcRLkrmaO7IQjikh+PA4TCmBvZRnz3a2vdy7TVyZ
 PAlFudkjROVCE4aB2ntR0CghpkPkmifUKhLjLdNzlxWYp2bBVNxPaFq
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

# Add your code comments below. There is no need to trim or delete
# any existing content -- just insert your comments under the relevant
# lines of code. Lines starting with "> " are quoted diff context and
# lines starting with "| " are comments from other reviewers.
# The final email will be reformatted automatically to include only
# the sections that have your comments.
#
> Define sysfs details for the legacy events so that any tool can
> parse these to understand the minimum set of legacy events
> supported by the platform. The sysfs entry will describe both event
> encoding and corresponding counter map so that an perf event can be
> programmed accordingly.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 19d9e4750424..8d56bef95a1b 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -131,7 +131,20 @@ static struct attribute_group riscv_cdeleg_pmu_format_group = {
>  	.attrs = riscv_cdeleg_pmu_formats_attr,
>  };
>  
> +#define RVPMU_EVENT_ATTR_RESOLVE(m) #m
> +#define RVPMU_EVENT_CMASK_ATTR(_name, _var, config, mask) \
> +	PMU_EVENT_ATTR_STRING(_name, rvpmu_event_attr_##_var, \
> +			      "event=" RVPMU_EVENT_ATTR_RESOLVE(config) \
> +			      ",counterid_mask=" RVPMU_EVENT_ATTR_RESOLVE(mask))
> +
> +#define RVPMU_EVENT_ATTR_PTR(name) (&rvpmu_event_attr_##name.attr.attr)
> +
> +static struct attribute_group riscv_cdeleg_pmu_event_group __ro_after_init = {
> +	.name = "events",
> +};
> +
>  static const struct attribute_group *riscv_cdeleg_pmu_attr_groups[] = {
> +	&riscv_cdeleg_pmu_event_group,
>  	&riscv_cdeleg_pmu_format_group,
>  	NULL,
>  };
> @@ -447,11 +460,14 @@ struct riscv_vendor_pmu_events {
>  	const struct riscv_pmu_event *hw_event_map;
>  	const struct riscv_pmu_event (*cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
>  						       [PERF_COUNT_HW_CACHE_RESULT_MAX];
> +	struct attribute **attrs_events;
>  };
>  
> -#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, _cache_event_map) \
> +#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, \
> +				_cache_event_map, _attrs) \
>  	{ .vendorid = _vendorid, .archid = _archid, .implid = _implid, \
> -	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map },
> +	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
> +	  .attrs_events = _attrs },
>  
>  static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
>  };
> @@ -473,6 +489,8 @@ static void __init rvpmu_vendor_register_events(void)
>  		    pmu_vendor_events_table[i].archid == arch_id) {
>  			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
>  			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
> +			riscv_cdeleg_pmu_event_group.attrs =
> +							pmu_vendor_events_table[i].attrs_events;
>  			break;
>  		}
>  	}

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


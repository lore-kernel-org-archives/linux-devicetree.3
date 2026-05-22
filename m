Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283E7347C7
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 20:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779480277; cv=none; b=oysKgVaAL1HrwQTf7knq9XH4FFvgUdC1ZR+wEDimkMX2bvaDVbvmn14zGNEvDLVj9BFbHYQlwauks34qDXTgDChQlhlG5e7rZZvgjHAa0gLn+pnQy08l+ZyarMb1HJ652R1XxEXUYHgqXXIGIGWNfTo7X22xV9MRVua9gPtBqWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779480277; c=relaxed/simple;
	bh=eXAO725lIkPZbqs9rR5ieyD3MmzXoPrVoEQeXpDklk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULIQK5/EnggMIXtvatJsYOmp5yq+4EP6yJzQXYP5Q8UPbrNvVkqrsdsf9RPvN+zSqmd+K/juYuBSsu207VXzk1ZLHq9CwpkRl6ocCviW2rzOBT6ZancvseFLwIxbdX7H/9FZ/05w8MytHfarxG75KBfHwBVyeg4Kjcz6NU4a1xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLvH8DRc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLvH8DRc"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso4403311f8f.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779480275; x=1780085075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PLW1g3HpZM2aJI8/CdJpus6sA4AJf8FdzJFCKu9+qJ8=;
        b=GLvH8DRcGUrpjnaWrCpK6okwSmdUAZ4ig+U5bsfWXcVCVkw9vSNZw7Ijvzj92Mkyxz
         Gu4sw5/nBFkNsFikhwc90NsO44+ImzDCqQ71swsOykdXLW2YVqcTx76EhvqjxiLmkg9a
         b27EKhSpB4bo6FSekdXVmCnemkmMeYbJUD+Uw7DTEl+sApg+TVL1Zr7bWQAdYInzImnC
         EHhUJ/o2BDXIJof+4eDNM1z9vIez0EFGW/m/WpJd7fllV+f9/KJaseeDP/WbcSBxhHqK
         M6UfdEGtqFp5mj+0uWIiK+XVUZ8dI4g5R47TK3XOxdLT2BJ3jgoofkQcrW5uyj2UeLgN
         1gCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779480275; x=1780085075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLW1g3HpZM2aJI8/CdJpus6sA4AJf8FdzJFCKu9+qJ8=;
        b=s1mcaDhkd156+ZQ0v7rYTpN2SSsR+yXad6orE0+06Fskt/bJMb99CR6olnhQqYvRb9
         1WDtSU2WBERlPeIlQNbgrPvJ4H6DOnObw6Y/NHR+87roNTsjSroo6Jtn+qYDJUPc4knE
         WgkvfCz9zv60vi68f/SRp9jTgIvSuTLAUEjULwZsnKh1Y6EA/V3zaUPntmo4cwpSdPc9
         qYaBkQC4cAlQDe3cfDKkLNJOxNd8N7BKYF1jr3U/NvjdfJ0CzmujLheFhcjv4ow+XT/O
         PvjcTq3uTpcNfDsmfTtKIEYtSpVKq82RdJfQo6dOxVe/Nj/y20jyPZyC1llli4PzHIR7
         yadg==
X-Forwarded-Encrypted: i=1; AFNElJ/BjU1hBTcNnMUwTNoHh79ZjXkjdFzxyQT09SU3PHmtuq405M+M4+O5laor+J5d4Bt7Zn43xEAmGSfw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5m+gfsHo2ksKFta8PUZBuovGwxys0bmsWy+g9WFUmIhLTf0xG
	+lKIidf3DhTqqhHD7WWoQu73LsP9qIOcnuD9RENWVEsCQZsSwk8CT4AZ
X-Gm-Gg: Acq92OFXQ9zXnYPJBfY6ySLwURHOI36Y5Wdq/1+cFg8A/WW/VnezP7ZjfCRCjXRkl3c
	Ynnc4EjwoMGJtmDwLNF2cZuRLNtB43XIvCBrDto5p+zvawLxzXMAnLOqza4KR/gg2GyHWzJ3Nr/
	Fv2H9mEpROEPMzW/WTPYM2sygUj4PLGb8+45/n18NpD5jJOUmFNo3xwEBnwbFUOHaGC4KFyxfFS
	K6u/cHpVVOThHlvVwOoi0NsDQgqnFUW5Flc/HinvRdxuaEMvB2gob4DU2y/Jz7gvOmRVbEZNm1Z
	42yA10NqE9vtBG1AYRTN9fkTyf8ib0griG/NHnJYLWJqtx/Hse236LtbCZwIy1F2FFBKwBqPZW3
	2+SnYsYgKdETzFGtraYoWmUWetuWi5scwuN9PMHRHLEbxcMOZuaNojpvn9bEJdPpjwCX+zZ5bO3
	P1YOVn5qTbr+5SGx5a
X-Received: by 2002:a05:6000:4a09:b0:43d:762e:76c6 with SMTP id ffacd0b85a97d-45eb38a7f6fmr7805984f8f.7.1779480274376;
        Fri, 22 May 2026 13:04:34 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4ca0dsm6667879f8f.18.2026.05.22.13.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:04:33 -0700 (PDT)
Date: Fri, 22 May 2026 23:04:27 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/12] rvtrace: Add trace ramsink driver
Message-ID: <ahC2y59MHRZa9Ayh@curiosity>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-8-anup.patel@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429125135.1983498-8-anup.patel@oss.qualcomm.com>

On Wed, Apr 29, 2026 at 06:21:30PM +0530, Anup Patel wrote:
> From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> 
> Add initial implementation of RISC-V trace ramsink driver. The ramsink
> is defined in the RISC-V Trace Control Interface specification.
> 
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/rvtrace/Kconfig           |   9 +
>  drivers/hwtracing/rvtrace/Makefile          |   1 +
>  drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 338 ++++++++++++++++++++
>  3 files changed, 348 insertions(+)
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c

...

> +static int rvtrace_ramsink_probe(struct rvtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = rvtrace_ramsink_setup(comp);
> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
> +
> +	ret = rvtrace_enable_component(comp->pdata);

Does it make sense to enable such components (ramsink and encoder) on probe ? 
IIUC they will be enabled/disabled later in start/stop operations when
rvtrace graph is activated e.g. during perf tool work. It looks like
reset (primary activation) should be sufficient, and it is already done
by the core framework on probing.

> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to enable ramsink.\n");
> +
> +	return ret;
> +}

Regards,
Sergey

Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62E374E42
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779475733; cv=none; b=F4zoaldE4/+HFYNnaFXagP8Sd0knllXp7yfiJeBXqSc0alhkFOJ8MFfW2t+UupzBbkStpobauw9U6l8ku9dDGrYR8SU8PazgMe+apC0uwKgyKoD8JqikvzPkwIiuKFhJbfhk/Bdlg8i7oMQVHc9Ep+aUxPrSzdijD3gKKtljHLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779475733; c=relaxed/simple;
	bh=aM8L4hbjrzjWaqYKH3C4Og7rkxtWnVc+YI19js0yyz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXeZA/9G5BbXTgYevljHwnB6bT3RljbXjAMbXCYcPj/zz2HtyaDInOuES3x2per8MnbIM6mJRhMJ6OxQYsMnaZcUYKh8ylMpAJFiwTUK5EqJgTxDhPWeVI18baNPWmigMobSV1pJlcu3Yd1L8Ua4EUEdCJLFvVesOpli+jvrRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eR8B0yI1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eR8B0yI1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so49217735e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779475730; x=1780080530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgG2wYSmCA/XhBo+sOvrK/LdITZZzcYGiSbapkkBFfg=;
        b=eR8B0yI1iyEy+ZVhtVNtUq7D/Ssk8GRJEgV42WxtG/vnPkS09VWodsnHLtvU4YUBYF
         G3MnOqfEsSIjLzkbMc13/FqZl1NWeh3FpyiqtkqRoJ9LNQ6VYiSgzxWM+9424lBpvheo
         72KAq4GI04ydYDw7r8NT6/7g1xC2vBiFACp3CPzkI8fxr+xejK8NU5bFMIjf0t2UfDcy
         g7uOn1Hdcz1iJU8TL7GSBqWystkDntmxPi8/uSFqqOY8m1nmn9a3szBhrcw4B5SZvf8H
         tk5WhHUcqz4N0Ov3GPqzIZ2dBvHChOibusK8H//KJFH+pJ1EIbL05xEMKOBs5JcrLrzU
         YQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779475730; x=1780080530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgG2wYSmCA/XhBo+sOvrK/LdITZZzcYGiSbapkkBFfg=;
        b=M+hkfnWihX5oBOr5fEpkYd7xXyJy+g89lt2lRuTqd+4cv56FlwXYeqObmzV5D9vF+l
         BM/FCn8pzAne4CFTGnd+nfcxpL+rA9Ww4dU6EBXTnggeWmhSpntLmnpHlJtl6wBHxIU8
         siCTS35Dmhw1/Hu9y0HYK4eWfE/ibi/RpxooJYF0ML9N88Fqd/zxMHybYzIJTTbh+qN7
         k+j6uKPLbS9LdSb2z7Wdkj3chkZNinD5G/O5D1knoX9Jh6CMgwkNzrVsPO3YlumwHWwl
         SPXVyb36sZ45eYk0e2f/4AKvgBeiiN4tSOD6as3ZYqEdLUvPdIs05u80FdcaZTJ19Ugl
         06qA==
X-Forwarded-Encrypted: i=1; AFNElJ90uWrKOsGzOzF5S5IzOhO9DfvH5p+bO8qoWXtgk/XUzZEK5Unu0EEu+yZ5cAL6twM5tqJXTFkh3QG/@vger.kernel.org
X-Gm-Message-State: AOJu0YymcX13sSt7vjbNpc/Hmbur837hRC8VckiTC1MTeTdWGpHJdxcb
	WPpv03YG9vtfm9L7wHT0oK2Cfwer+wqwlBrxoiu5GEuy/O3j59xPlJGw
X-Gm-Gg: Acq92OHIj31kGq9T6V3Rbd7y1Lf0l7uaRahuIjp+hFtP7HW/oLTS9G5QoQ9e9EpPUby
	9acFh11ac+CnZn7W7/8jeoksRMot2vqZhFdbi8iJRrwG/o3hGbdaW4AWEWXKxUbHz0mhZVSFF49
	nFDCoWF0HJCaJiC9UCJOdGc3Em6oubFO9Qr1Sf/KLVvdL5Ed3Z/8YZGCxxkwpTcU404jZ7XmBTV
	/7AFzeCosk3Ut2DRHbFSno4t3ijo0XVs/yGgAK1RAk9tBxma09k/BgxvVkB0Nu5t1FLD//tgFLd
	CGNWVgazfAcdKli3iRzrpd6K8kT09h7aVuF/MhRPMzCs+3OTtGwP8DUF+5IZRlZ0clWrg0+141G
	80UK7GzH4mfpfUr7oIIzn2oPgNoF3lyYpKVul02ClZyN1IYYVkNvf6Z2808gWoqsErgnlDe5XAg
	kNReXSGvrHGDKo1wVDFXRYgjnztGM=
X-Received: by 2002:a05:600c:a402:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490426c5be8mr59368335e9.16.1779475729950;
        Fri, 22 May 2026 11:48:49 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd151asm5438373f8f.13.2026.05.22.11.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 11:48:49 -0700 (PDT)
Date: Fri, 22 May 2026 21:48:43 +0300
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
Message-ID: <ahClCwlIMlck-DiQ@curiosity>
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

> +static int rvtrace_ramsink_start(struct rvtrace_component *comp)
> +{
> +	int ret;
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
> +			       comp->pdata->control_poll_timeout_usecs);

IIUC the code fragment above duplicates 'rvtrace_enable_component' from
rvtrace-core.c.

> +	if (ret)
> +		dev_err(&comp->dev, "failed to start ramsink.\n");
> +
> +	return ret;
> +}
> +
> +static int rvtrace_ramsink_stop(struct rvtrace_component *comp)
> +{
> +	int ret;
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
> +			       comp->pdata->control_poll_timeout_usecs);


IIUC the code fragment above duplicates 'rvtrace_disable_component' from
rvtrace-core.c.

> +	if (ret) {
> +		dev_err(&comp->dev, "failed to stop ramsink.\n");
> +		return ret;
> +	}
> +
> +	return rvtrace_comp_poll_empty(comp);
> +}

Regards,
Sergey

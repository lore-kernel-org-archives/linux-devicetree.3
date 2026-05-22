Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C53313293
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779475607; cv=none; b=V46IUGjxPUvwE9Qs6Tmbdu9lQswBSmdc88rdzJUckfJiwtzWWQC3WNRy30plXU/GNwNSWVImzBmlSdw2W48M6CKpW0s80V0yiWJEJsaO5eWbfpviJBksoNRCjvc97joXhc8jodwoKqs9U5t020Be9qm9uZKMc7fD3tZcfdGwmaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779475607; c=relaxed/simple;
	bh=GzDtnjRb0nQBRMepuZok0q2MKwCPtunEFviIoCpDKm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiulKeGnUsW/dBQ6PZdzUf6M2tWE7ZWVOvtDN8PBobhI5LHs4Bun9GR5HXoLqmyo3PpgKWKGpWN1a00zhiHFJSp82ClLKPk96xr300KA865761I4wsliCaOhAFF6ryZhc5WpPc3bsQ2j1MyFFvxz67Hk69l0LKgdQYZlHh9mrZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+nCl71h; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+nCl71h"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-459bf19e87bso4556855f8f.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779475604; x=1780080404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xjfBmImK3MRW7OLstyWN07E1U+bQQsnj/kAHe7GavwU=;
        b=A+nCl71hDlD0zmaWpseczotc8ldmU4TMsTVYTRsLCvEhfTL0ODtfmxrO2PAsXMkdSN
         hsWlXw7BDykhgogfG/w5pqAGbzmg3x2g6Z+cZbi+vGNLJh66QhgQLavmBqkJJRao8kzA
         5vYdDeZTUKvoNdh3dgdlJbcVBD00xQfUfvnSe3l+Dtgjv432A9FmlT2pbZ05Xb7/py0i
         Dye27Bm091IS+yG5uuGemTSYxpIiLYsOAsyV2CO2dN3dZAj4aWpw4ZhDA4jjOsWh9X8+
         xCDmQepWRZPmtpHw2AnlCFGPpndT8iRg+uN4OrM7Qu4oOb59GfIuYGs2llPkGNLsW0t+
         gZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779475604; x=1780080404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjfBmImK3MRW7OLstyWN07E1U+bQQsnj/kAHe7GavwU=;
        b=DdUYJDTSSo4E/+pra+ulr9hf6v8RjlYExPG6p58wOQpRDTz2LN4/Il3i+7RKt5hCdH
         P6xDTZTD4rJCIFFzKKcJOmHoh1+RMBZCtUDnZDNTWW7BomEgkrJ/IQy2le9eluT/bRrS
         onQui1nFkNiqkFWPbP+W/sVgSa1KcbKVtsfjSDt0MorrogbEUsHleoN8tr5PwG1CGmXl
         HQ29HenFDCIZkLeMhqVm0hYbaP41THCRROv76WOVdLOv8dHEsLXpvk1phdSvYAH8dA11
         NXKRe3yI1pOz7OM4TIroSEkoaogr4BCtuJEOXjjdt69FUKUrPaT0KIAvsoXP3HKIMQVz
         R/Pw==
X-Forwarded-Encrypted: i=1; AFNElJ9Hu088IGvTjQvCTChW7NCYW3GsQwJVPRe0cTLu9N975vRII5De7jZRJyNA3LucBl/xHx0v8W4WhAlm@vger.kernel.org
X-Gm-Message-State: AOJu0YwjN4ejd5kuRjapSEzK6k1GzehZ5u76qh5z8Ko3hvn1GLFNL9Bx
	xsSJ7aG5eyfD8RnkaC8xdp0n1IZwppbWNPVFE9e/+kMQqMMPzbuL936i
X-Gm-Gg: Acq92OGaS24hP0bRL0vtsZnixnCmowduFoI54ObJ3inKCXzDo4QJwhPpT1gAZm5HqA9
	9cOoVOX5GatgKAyIdj/6gzu1ru6E+d7D1TpcC6+sLFYTVHQtGjnpxHqYDRipO3RELrAuDcQh59X
	2iavPfqJZHNJKxI0vjvXaGQpq3PwucaX7vZctNj6tZGcPjZuND7X4flkRGwDNVsifkLq+3/pdu+
	sSgWFfraiSKPaYMNsthfWgAEadiowvIVd6XcN4WWo/VskmtslIJEGd1Gr6GYhLNhfcBqBIpYFMl
	krWW9CjNfI1kWEiTpzpfrZOjE705+XzsiI/6bME8CQ+v13DQYZAmEQ6TXkG3aVzfdO2A9I+Z5gg
	FkozxQArYI0he2LAEEgSSLb/k7sWVTr4I50zKlzkxxqM0VHtMtkFWgCP0vNQO8LiulJgYAOYOfL
	piisSip/uXgHJJs/qpz3qiL6spi70=
X-Received: by 2002:a5d:5e83:0:b0:44a:b931:f32a with SMTP id ffacd0b85a97d-45eb38c5220mr7616916f8f.27.1779475603916;
        Fri, 22 May 2026 11:46:43 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb9asm6658651f8f.27.2026.05.22.11.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 11:46:43 -0700 (PDT)
Date: Fri, 22 May 2026 21:46:36 +0300
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
Subject: Re: [PATCH v4 05/12] rvtrace: Add trace encoder driver
Message-ID: <ahCkjH-sGnGLHpG-@curiosity>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-6-anup.patel@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429125135.1983498-6-anup.patel@oss.qualcomm.com>

Hi,

> From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> 
> Add initial implementation of RISC-V trace encoder driver. The encoder
> is defined in the RISC-V Trace Control Interface specification.
> 
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/rvtrace/Kconfig           |   7 ++
>  drivers/hwtracing/rvtrace/Makefile          |   1 +
>  drivers/hwtracing/rvtrace/rvtrace-encoder.c | 130 ++++++++++++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-encoder.c

...

> +static int rvtrace_encoder_start(struct rvtrace_component *comp)
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

> +	if (ret) {
> +		dev_err(&comp->dev, "failed to enable encoder.\n");
> +		return ret;
> +	}
> +
> +	/* set mode */
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
> +			       comp->pdata->control_poll_timeout_usecs);
> +	if (ret)
> +		dev_err(&comp->dev, "failed to enable tracing.\n");
> +
> +	return ret;
> +}
> +
> +static int rvtrace_encoder_stop(struct rvtrace_component *comp)
> +{
> +	int ret;
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
> +			       comp->pdata->control_poll_timeout_usecs);
> +	if (ret) {
> +		dev_err(&comp->dev, "failed to stop tracing.\n");
> +		return ret;
> +	}
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
> +		dev_err(&comp->dev, "failed to disable encoder.\n");
> +		return ret;
> +	}
> +
> +	return rvtrace_comp_poll_empty(comp);
> +}

Regards,
Sergey

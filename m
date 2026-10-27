Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793076860;
	b=fCrr96n83hOM2dMlaRS+7U7PUO9ygcqI/7EPzU+DGZnWuKeKenzwII+Z4R9Wj/OGthld
	 r0CghHe3xwuwFXfizvlddCCvhTgCMaH59wrqVAeAw0seY6n+sFh+xSY6IXGLv92C1a9Sv
	 aciBlxzHMpMABxqRwjEyW7SqZsYK4A+WczD6PcrOtubtZYZVYr80a/pqtWPZmxtrPagBv
	 btnJ+C/CXwufzOODHcP3wxnj9HvfZQgbxIfcYBPGCrm0rNGSgYG24/gaFBS0Rw6vqx6yS
	 hSAoq3qtoZWl1v1ZdK95A6HbSh0WhRJC/R2z+Kgih3446FLonBfQaiKbMFVBU2lgGOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793076860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CBXDyafbQ+bvJr1wyuJVzQYdGq8WtwM/OAYYzlYp/Gs=;
	b=WgxslU9pY2fKToOttMYeYiZk2pqLmU9BlASht0oXr6UXiToqRkeeH5hJLZrYAW/vE1JX
	 P+Ma7BvFtLwYXAQwc0urGyich48sjH6x2gbyxbkRmxHectX2CiJpnDWqBqAsWH2a0Yuq6
	 JdceXIANXfryDmVP2OJBey24Yw1ECca8YrMMQ8mkZENmc7BrcYvymL+O6tXNyfOKDIA7w
	 3w8AaS5b92r6Rm0bR/dFUZVH4zQmLHHjsY3e9OGl+8QyPQlEPNYFSEfd6DF+LuiaAC2cO
	 2HyK+AQ1lERYP1uAOnnhNntY9WPY9q5GRh7Y7/to4VUcQBegig96/g/0BeOVLKnBTLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Lp21g8nS;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10453606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10453606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Lp21g8nS
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14fc585291cso1896846c88.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793076858; x=1793681658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CBXDyafbQ+bvJr1wyuJVzQYdGq8WtwM/OAYYzlYp/Gs=;
        b=Lp21g8nSCK7QvosLUNREqcWC3uyos4X3oHoczIC1sB36odhuo9n4pCe8YPnmB5icK4
         tsEIkkkfyEBwv5PM3ac/hWzz3VP529DY8lQoffxIHhOKJAqL9qGUxAMBWQHZjNvdR3ux
         ZtJdm/UwhGj7LsKso0qQeY3hEEl7BKYGYoRoxsZkFONNhAHuT+Odt4GSCJIdX3eTluFU
         x38NK/3F6EMLrUDR+VIfwbooyVxHBwTQEzQX1ainRCSz8NV3uKmcTcfSOy4aOGa+1kxB
         I7TSu4L86KZlIVfFKjfHQQsI4OaBE4hFAEtAYLCoV0ZkWr2NNAiHZV+ppCQxuoIFnoTi
         mCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793076858; x=1793681658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBXDyafbQ+bvJr1wyuJVzQYdGq8WtwM/OAYYzlYp/Gs=;
        b=ELPVIL/l5C4qecBzaZLRiKvGuMfrY6WUemBIeY1SLjSQ+Hn7h0Umh8o5Jif6VIuOfO
         3/7hGYA6uu2anPckC+Qy6rbzeYcUuOnxlk5VLCZF0u08i6LCjGu9a/LNl3/xK4AN8j8Y
         wNRLINz0BCSGS0QyN5Jj2u2fcj5SuQbrxPDk6OvfkO830RA3PA+eZ2dqIf8EuryUB69N
         LnzzbetYcgCiXgRagdJnzqnqYSghb2vjJl7R/7nQJF2P+1TxTUbxZ4aS7jbSidaY1TUl
         qBEzDpVuytH0Z5SUsoTXu8P6jkf6Roh3WkJOtyLKazTVnKmZkAi6LJllHKk/tWx/tN8o
         8HWw==
X-Forwarded-Encrypted: i=1; AKwUvBwUW2qPiu46wbJ6bSgAtpWmJIwxayMlja8TCWJ2/VFF6K9NtcGpLCxkdUzOhTwIzQA8x1fGdeSRP+ez@vger.kernel.org
X-Gm-Message-State: AFq9FYJQG4YlsbK8y+5iqbwbFA/9hAaV02Ifp6d0TyVQVqYNVwxsK2Vc
	LiYkLFytlkrM2d2VssvpEbb+9lHTzmUz0GNHqcbhM9LctCp9h02TBTDeetWp4Rkd2IM=
X-Gm-Gg: AYBFou2V95OkLszZiG5M2kJHkDn0VDruC/wII3cZvscJEIEcURJaEcLgq2+2nvobO3E
	+B77xffpuEWeTGnrA6sWmDe6a/JNrh5U0AoQnS3QOvNQdsQF4vSmkkSKMxb+q44vriYvcdJdVue
	UhfG+BmoQ0StoSF2QH+dVOy+p6s8G8YCuXg4jqGkTTMrwNqRZTNEoqD8FgvnrVnBzElCXVg+g14
	FbEy05lfDMkkcZ/JREX5i5psrDBSBu2V4cIK3BrgD+0/I7It4W+ksywc3M/eu+pmbleTCS+by2K
	qmGdJeSSp5V2oiscgykYCfPYL+7TGsCc7wgpEG0kI72BJ9atCeNlL0jTE7+j9GKxlmD9r3cSUSY
	6gHLdSaWg7DeQLq0SYZli+vMKfhRxwtLX4dvikTU+xoW1DkmeJqQCWZz4jkcfNMzdtN4r84945b
	fYklPcQ+QsfhNew4pvMjWaiZ9lN1esxk1RUUi1+2CeUcVHzHuDOiYyY/fZSTdk3UcDPobP939qq
	W1XibbbLHsObtIRm5mZQSCrEJlGGtcXLOMURnI9wiS6Her9pyJA+QBadqxJyxRx/mEGT8852zdu
	GhBqL6OXRGTlB0n1K0S1dmrkPvB0H5j1fSLzaN1mdSRQwA==
X-Received: by 2002:a05:7023:909:b0:144:eab0:9cbc with SMTP id a92af1059eb24-199376e0835mr15075491c88.37.1793076857722;
        Mon, 26 Oct 2026 21:54:17 -0700 (PDT)
Received: from lliang-1876.localdomain ([136.226.240.173])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm30437451c88.7.2026.10.26.21.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:54:16 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:54:05 +0800
From: Leo Liang <leo.liang@sifive.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
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
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
Message-ID: <auAubdjHl1V4h16N@lliang-1876.localdomain>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>

On Thu, Oct 01, 2026 at 10:52:14AM +0530, Mayuresh Chitale wrote:
> From: Anup Patel <anup.patel@oss.qualcomm.com>
> 
> The RISC-V trace components defined by the RISC-V Trace Control Interface
> Specification are memory mapped devices which are organized in a
> graph-like topology and described in the device tree.
> 
> Add the RISC-V platform driver for the gtrace framework. The driver
> parses the RISC-V component topology from the device tree, discovers the
> type and version of each component from its IMPL register, provides the
> RISC-V register level control ops and registers each component with the
> gtrace core.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/gtrace/Kconfig            |  15 ++
>  drivers/hwtracing/gtrace/Makefile           |   3 +
>  drivers/hwtracing/gtrace/gtrace-of.c        | 126 +++++++++++++
>  drivers/hwtracing/gtrace/rvtrace-platform.c | 186 ++++++++++++++++++++
>  drivers/hwtracing/gtrace/rvtrace.h          | 121 +++++++++++++
>  include/linux/gtrace.h                      |   3 +
>  6 files changed, 454 insertions(+)
>  create mode 100644 drivers/hwtracing/gtrace/gtrace-of.c
>  create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
>  create mode 100644 drivers/hwtracing/gtrace/rvtrace.h
> 
>
> ...
>
> +
> +/*
> + * Parse the "out-ports" graph of the component's device tree node and allocate

typo: "in-ports"

> + * pdata->inconns.
> + *
> + * Return: 0 on success or when there are no input ports, -ENOMEM otherwise.
> + */
> +int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
> +{
> +	struct device_node *parent;
> +	int ret = 0;
> +
> +	parent = of_get_child_by_name(dev_of_node(pdata->dev), "in-ports");
> +	if (!parent)
> +		return 0;
> +
> +	pdata->nr_inconns = of_graph_get_endpoint_count(parent);
> +	pdata->inconns = devm_kcalloc(pdata->dev, pdata->nr_inconns,
> +				      sizeof(*pdata->inconns), GFP_KERNEL);
> +	if (!pdata->inconns)
> +		ret = -ENOMEM;
> +
> +	of_node_put(parent);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gtrace_of_parse_inconns);

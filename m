Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14280395257
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334485; cv=none; b=jLR3FLc6PXHu8d2yLRYiYr2LmgLF7s4TCAO1kJDdE1WfarZ7FCTpBf+hwM8PTnrnJjJLEU6u/Nd4BXUz0mA97oUn93vTipvJWhGOGNfXvuHmhnki49Qp7bDcmOTInVWxRwLuyA/HGgU5LN+f37H/RrDmTV7yIZp1IQ1RAsxu7Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334485; c=relaxed/simple;
	bh=yhk6Fo6KV7/OvhH8obcEHXLS2gftczfkqQDpnXIlKYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpYsLb9FvxH6WPvQztga4Wzzz3l3vp2oCppRUKDQYB5xKzveh4cM2KbmphttIQtg6ChhEOuU/IRKxlqAG0ZE+2xnyvdbHNjU3YD+IQgmmT8Ueh3OPgZ8OhrEnns2+g2d2uNlW20aTfYTV7zgAG4kgkjuERCPqxL/pzSOAWoszjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LkeqfY11; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LkeqfY11"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b2d3a9e149so2367145ad.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 03:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1776334483; x=1776939283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I5Zrp9xvS+I4fXIy8VYzclw9xOf2k/ka0uhcPGCfNmc=;
        b=LkeqfY11nbZl49MwTNUtuZaA4HQwSk2hPGDHpDj8w1TeVJMbjbdmpwoFDwmrxfQHtG
         CpG4qLJoO5BjEX9298wRgOeqmmcLDYdyErmEfPXp4uygBvagRWAYMyqmtNZBrUUPRJp9
         Hmpc5XwR8WvRfjD1en0Ie72F+bg7RALRKVRQg+miyRt9N5J8Q+KYWtAdvxIlZX8xxs1T
         6pa9/SAdashsIMWxVIBPPSXcnY778z14xNBs2p2TnN46Bet0hVg5rpYAw+h0R1B+ZqDP
         fZrxu0XUCXF3kT4Pk+aPx8rQTx7zHMPVq/Gtznd8se6GLu9P4IO7qVEJi7nReF6G2aGo
         Dh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334483; x=1776939283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5Zrp9xvS+I4fXIy8VYzclw9xOf2k/ka0uhcPGCfNmc=;
        b=SFyUrCjv6JmN4voZbpI1TlrawriO33+FurzXj1V6+f7AD3jHvjlHCErkWBvQJeuRGs
         rDqexY2NkzMVFQOBxd3ocaUusbVDdRUoWX2Q4Gu8EN5aI6Y41TTSGPuFVjGW11bJ4Raz
         GBYrAa47KV4+i7plwM71F0EePZCNqkY18I7mmPis9kJDt8jLDfVbrkFKYbfRVWzB31Oo
         I0the8d/xoynqfHTbnCUzLBT5ONKDmKBXMX8aChW609HGa0YKtsma0FDfitIcMCFVOi4
         aA1h9EdcLMFlyMftlrkVGvUGL7mBJtsGxWHeJixjfoqLyjsNNC9ca3IIbGOoYJgUe99+
         hT5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9o695sajv2uUl6/Ezy7v5iu6LJnRAC/fhZFoHks8OtjokOf4kM2hoBwwsi0yDvEF7jTImezB3utPPv@vger.kernel.org
X-Gm-Message-State: AOJu0YxmWgIp6LkADeIYgdacJtJbRJxZGYQ/j3mDbmrJ1d1PJfZqNeHD
	8dnkA6UY2qX8dx9L+oJ6zQiGTzzl2Yyopwn9yQacV+smDFKntUNB9qbsIwIA4xurbus=
X-Gm-Gg: AeBDieu8Dsaz3AhPSzixEt4DrI7MLda3qV0VEvJcmDi8G1bB8YDExu8r13bjdlk655x
	8MqCJhiHUBhYEvRW+5MraZcW9abX/AgXJ/JvKvAkpvut0gI0CzePER+ufcIsX9/SANmx/TBmQAw
	LyAJXLtOkCgwM5mCcswKI8xz4V7xgf9W1l0jP4A3zrP7lVFW1Qby/kXbuEPiJe6cX+ylWzOApVB
	veXkqRcRt8LOvFDu2yzm4ls26b6RX2BlL81VtVTvVzma3Ngj7jfl08or+jmVXSvI3v0s+naBV8E
	ZV+FYUlGLgik47m6oJIghjLOjKjy6gnqbnNZdx+VLDs4e//4AA4DoSOrtNanPn+QZElXy/73I9u
	YkIKEHmEqvpPJ7k8KF4ntCyT70aU7nZ8hmXnLhxiXRdpt0AqJ+1sfoZmKC7qhjap2BLgDHFVoFV
	3Vn6OVIZlb0puMtk6iAXhxfnDFRMIE74ClT8hLHlC9yOwY
X-Received: by 2002:a17:902:db06:b0:2ae:47b0:dc80 with SMTP id d9443c01a7336-2b5eaa4f615mr26842025ad.11.1776334483293;
        Thu, 16 Apr 2026 03:14:43 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW ([136.226.240.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478109a4dsm51692545ad.18.2026.04.16.03.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 03:14:42 -0700 (PDT)
Date: Thu, 16 Apr 2026 18:14:25 +0800
From: Eric Lin <eric.lin@sifive.com>
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
	Liang Kan <kan.liang@linux.intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
	Nick Hu <nick.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH v3 07/12] rvtrace: Add trace ramsink driver
Message-ID: <aeC2gUsXGy3mr8Zo@EricL-ThinkPadX1-TW>
References: <20260225062448.4027948-1-anup.patel@oss.qualcomm.com>
 <20260225062448.4027948-8-anup.patel@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225062448.4027948-8-anup.patel@oss.qualcomm.com>

On Wed, Feb 25, 2026 at 11:54:43AM +0530, Anup Patel wrote:

Hi Anup,

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
>  drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 322 ++++++++++++++++++++
>  3 files changed, 332 insertions(+)
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c
>
> diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
> index ba35c05f3f54..0577f9acb858 100644
> --- a/drivers/hwtracing/rvtrace/Kconfig
> +++ b/drivers/hwtracing/rvtrace/Kconfig
> @@ -21,3 +21,12 @@ config RVTRACE_ENCODER
>  	default y
>  	help
>  	  This driver provides support for RISC-V Trace Encoder component.
> +
> +config RVTRACE_RAMSINK
> +	tristate "RISC-V Trace Ramsink driver"
> +	depends on RVTRACE
> +	select DMA_SHARED_BUFFER
> +	default y
> +	help
> +	  This driver provides support for Risc-V E-Trace Ramsink
> +	  component.
> diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
> index f320693a1fc5..122e575da9fb 100644
> --- a/drivers/hwtracing/rvtrace/Makefile
> +++ b/drivers/hwtracing/rvtrace/Makefile
> @@ -3,3 +3,4 @@
>  obj-$(CONFIG_RVTRACE) += rvtrace.o
>  rvtrace-y := rvtrace-core.o rvtrace-platform.o
>  obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
> +obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
> diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> new file mode 100644
> index 000000000000..5393423c8f28
> --- /dev/null
> +++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/rvtrace.h>
> +#include <linux/types.h>
> +#include <linux/sizes.h>
> +
> +#define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
> +#define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
> +#define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
> +#define RVTRACE_RAMSINK_LIMITHIGH_OFF		0x01c
> +#define RVTRACE_RAMSINK_WPLOW_OFF		0x020
> +#define RVTRACE_RAMSINK_WPHIGH_OFF		0x024
> +#define RVTRACE_RAMSINK_WPLOW_WRAP		0x1
> +#define RVTRACE_RAMSINK_CTRL_MODE_SHIFT		0x4
> +#define RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT	0x8
> +
> +enum rvtrace_ramsink_mode {
> +	MODE_SRAM,
> +	MODE_SMEM
> +};
> +
> +struct rvtrace_ramsink_priv {
> +	size_t size;
> +	void *va;
> +	dma_addr_t start;
> +	dma_addr_t end;
> +	enum rvtrace_ramsink_mode mode;
> +	bool stop_on_wrap;
> +	int mem_acc_width;
> +};
> +
> +struct trace_buf {
> +	void *base;
> +	long cur;
> +	size_t len;
> +};
> +
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
> +	if (ret) {
> +		dev_err(&comp->dev, "failed to stop ramsink.\n");
> +		return ret;
> +	}
> +
> +	return rvtrace_comp_poll_empty(comp);
> +}
> +
> +static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size_t size)
> +{
> +	int bytes_dst, bytes_src, bytes;
> +	void *dst_addr, *src_addr;
> +
> +	while (size) {
> +		src_addr = src->base + src->cur;
> +		dst_addr = dst->base + dst->cur;
> +
> +		/* Ensure that there are no OOB memory accesses */
> +		if (dst->len - dst->cur < size)
> +			bytes_dst = dst->len - dst->cur;
> +		else
> +			bytes_dst = size;
> +
> +		if (src->len - src->cur < size)
> +			bytes_src = src->len - src->cur;
> +		else
> +			bytes_src = size;
> +		bytes = bytes_dst < bytes_src ? bytes_dst : bytes_src;
> +		memcpy(dst_addr, src_addr, bytes);
> +		dst->cur = (dst->cur + bytes) % dst->len;
> +		src->cur = (src->cur + bytes) % src->len;
> +		size -= bytes;
> +	}
> +}
> +
> +static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
> +					    struct rvtrace_perf_auxbuf *buf)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +	size_t size_wp_end = 0, size_start_wp = 0;
> +	struct trace_buf src, dst;
> +	u32 wp_low, wp_high, trram_ctrl;
> +	u64 buf_cur_head;
> +
> +	dst.base = buf->base;
> +	dst.len = buf->length;
> +	dst.cur = buf->pos;
> +	src.base = priv->va;
> +	src.len = priv->size;
> +	wp_low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
> +	wp_high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
> +	buf_cur_head = (u64)(wp_high) << 32 | wp_low;
> +	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);

The trram_ctrl is not used. I think we should remove it.

> +	if (buf_cur_head & 0x1) {
> +		buf_cur_head &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
> +		rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
> +				RVTRACE_RAMSINK_WPLOW_OFF);
> +		rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
> +				RVTRACE_RAMSINK_WPHIGH_OFF);
> +		src.cur = buf_cur_head - priv->start;
> +		size_wp_end = priv->end - buf_cur_head;
> +		tbuf_to_pbuf_copy(&src, &dst, size_wp_end);
> +	}
> +
> +	src.cur = 0;
> +	size_start_wp = buf_cur_head - priv->start;
> +	tbuf_to_pbuf_copy(&src, &dst, size_start_wp);
> +	dev_dbg(&comp->dev, "Copied %zu bytes\n", size_wp_end + size_start_wp);

Currently, rvtrace_ramsink_copyto_auxbuf() only resets the RAM sink
Write Pointer (WP) if a trace buffer wrap has occurred. If no wrap
occurs, it copies the trace data from the buffer's start address to
the current WP, but the WP is not reset to buffer's start address.

This causes an issue during process context switches. When a traced
program is context-switched out, the trace data is copied to the
perf AUX buffer. If the WP is not reset at this point, the next
time the program is scheduled and subsequently switched out, the
function will once again copy from the start of the buffer up to the
new WP. This unintentionally re-copies the old trace data from the
previous scheduled slice.

Regards,
Eric Lin

> +	return (size_wp_end + size_start_wp);
> +}
> +
> +static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
> +				     struct rvtrace_ramsink_priv *priv)
> +{
> +	struct device *pdev = comp->pdata->dev;
> +	u64 start_min, limit_max, end;
> +	u32 low, high;
> +	int ret;
> +
> +	/* Probe min and max values for start and limit registers */
> +	rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	start_min = (u64)(high) << 32 | low;
> +
> +	rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	limit_max = (u64)(high) << 32 | low;
> +
> +	/* Set DMA mask based on the maximum allowed limit address */
> +	ret = dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_max)));
> +	if (ret)
> +		return ret;
> +
> +	priv->va = dma_alloc_coherent(pdev, priv->size, &priv->start, GFP_KERNEL);
> +	if (!priv->va)
> +		return -ENOMEM;
> +
> +	priv->end = priv->start + priv->size;
> +	if (priv->end <= start_min || priv->start >= limit_max) {
> +		dma_free_coherent(pdev, priv->size, priv->va, priv->start);
> +		dev_err(&comp->dev, "DMA memory not addressable by device\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Setup ram sink start addresses */
> +	if (priv->start < start_min) {
> +		dev_warn(&comp->dev, "Ramsink start address updated from %pad to %pad\n",
> +			 &priv->start, &start_min);
> +		priv->va += start_min - priv->start;
> +		priv->start = start_min;
> +	}
> +
> +	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
> +	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
> +	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
> +	/* Setup ram sink limit addresses */
> +	if (priv->end > limit_max) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> +			 &priv->end, &limit_max);
> +		priv->end = limit_max;
> +		priv->size = priv->end - priv->start;
> +	}
> +
> +	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
> +	end = priv->end - priv->mem_acc_width;
> +	rvtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	rvtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	end = (u64)(high) << 32 | low;
> +	if (end != (priv->end - 4)) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> +			 &priv->end, &end);
> +		priv->end = end;
> +		priv->size = priv->end - priv->start;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv;
> +	u32 trram_ctrl;
> +	int ret;
> +
> +	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	/* Derive RAM sink memory size based on component implementation ID */
> +	switch (comp->pdata->impid) {
> +	default:
> +		priv->size = SZ_1M;
> +		priv->mode = MODE_SMEM;
> +		priv->stop_on_wrap = false;
> +		priv->mem_acc_width = 4;
> +		break;
> +	}
> +
> +	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
> +	rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) & 0x1 ?
> +		 "SMEM" : "SRAM");
> +
> +	trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
> +	rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> +
> +	ret = rvtrace_ramsink_setup_buf(comp, priv);
> +	if (!ret)
> +		dev_set_drvdata(&comp->dev, priv);
> +
> +	return ret;
> +}
> +
> +static void rvtrace_ramsink_cleanup(struct rvtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +
> +	dma_free_coherent(comp->pdata->dev, priv->size, priv->va, priv->start);
> +}
> +
> +static int rvtrace_ramsink_probe(struct rvtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = rvtrace_ramsink_setup(comp);
> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
> +
> +	ret = rvtrace_enable_component(comp->pdata);
> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to enable ramsink.\n");
> +
> +	return ret;
> +}
> +
> +static void rvtrace_ramsink_remove(struct rvtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = rvtrace_disable_component(comp->pdata);
> +	if (ret)
> +		dev_err(&comp->dev, "failed to disable ramsink.\n");
> +
> +	rvtrace_ramsink_cleanup(comp);
> +}
> +
> +static struct rvtrace_component_id rvtrace_ramsink_ids[] = {
> +	{ .type = RVTRACE_COMPONENT_TYPE_RAMSINK,
> +	  .version = rvtrace_component_mkversion(1, 0), },
> +	{},
> +};
> +
> +static struct rvtrace_driver rvtrace_ramsink_driver = {
> +	.id_table = rvtrace_ramsink_ids,
> +	.copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf,
> +	.stop = rvtrace_ramsink_stop,
> +	.start = rvtrace_ramsink_start,
> +	.probe = rvtrace_ramsink_probe,
> +	.remove = rvtrace_ramsink_remove,
> +	.driver = {
> +		.name = "rvtrace-ramsink",
> +	},
> +};
> +
> +static int __init rvtrace_ramsink_init(void)
> +{
> +	return rvtrace_register_driver(&rvtrace_ramsink_driver);
> +}
> +
> +static void __exit rvtrace_ramsink_exit(void)
> +{
> +	rvtrace_unregister_driver(&rvtrace_ramsink_driver);
> +}
> +
> +module_init(rvtrace_ramsink_init);
> +module_exit(rvtrace_ramsink_exit);
> +
> +/* Module information */
> +MODULE_AUTHOR("Mayuresh Chitale");
> +MODULE_DESCRIPTION("RISC-V Trace Ramsink Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

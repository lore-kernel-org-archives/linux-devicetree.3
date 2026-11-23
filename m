Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430396;
	b=Yx2ijtPgJFMX+Uap64lcuSXdrTjZuGsZ3po3rgMFI0zANdPeP8xDwLm4pdvZZ0vuamrt
	 VeTgFouKHmSoM/t4t1rsZzRAdnagopu10KcjLeYU2ap1fbTW9k0xdRo3mmBhgPv3sCf08
	 1H6HjGwGCz9648ZC6RVxbLS7xuingDrqKW1pAYHzneHeDhX/hN2uJuDUquk2XZ5xM40ei
	 2l78Xe8F1t7Ea8u/jrRqhWACIcn1PL6zGjnUv+jLQ3mrr8uF2fSvTctF3Ykf7dBTYTma3
	 1WBv9eRFQL32Evg98dm6PiVRaoQNCLlrJsvFEVSCrziYV5KnBG8GhGeGL8fKWDU+IiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430396;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EhvWa/TiLOlRcTzUI36EfwG0krtjkwcZEbZq1/m6gSk=;
	b=iC4a5a/lNzFmvJodwuGNnUQqVyoG/OJ/xFKPqzjiAlFoeDt3P7Sr54OHueDzWA55XmIS
	 n41sEgKXW7ANrGLjW80InqUUxnOuxG6Dsl0JsgSsnPLuXLYqfjcAikvAnkY9TXnRespoh
	 QjK/hPSUfVkftTrPCozAUvLVulpB7lnJb8KjWOcAa0zGzntJNJYc3X56YavxoUOu7w4kC
	 CIu1x6eXRk5Av52OVEdvvOvAZxm8soenSKqOZ3JvH8NjIEj8SlWJnU5tjuIfkzbHvl7Hm
	 AImxmKjzpGMwLpRtuQiDQwUKc+488y7W9euqBt2BkUbapWv0ho9MGhhgBQsC7KYyjPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AKIoeyuH;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C73606A31F;
	Mon, 23 Nov 2026 10:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C73606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AKIoeyuH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AFE2143D;
	Mon, 23 Nov 2026 02:39:52 -0800 (PST)
Received: from [10.0.129.12] (Suzukis-MBP.cambridge.arm.com [10.0.129.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3BB93F632;
	Mon, 23 Nov 2026 02:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795430395; bh=5QddXLfT5OfirN05d9EK5OYnHt7h8p4SJZwGpR59Lt8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AKIoeyuH3zxcEhnJbMJN7EoREGhj2gBBUpXrCrvrzYJq8edihMc8hjHSwCBWxxvUE
	 jhWOvfaoGmWfyI+L4w70V/MCblzZezBT2Ws11fO4u+Pt2yJBQSApTRqQPlJlVGtnuv
	 ZTe7NawxTupqecjmE8IaAsA8Q0SnfGw+Tu0suD28=
Message-ID: <5989618f-be72-4df8-81d7-5e552b897a7f@arm.com>
Date: Mon, 23 Nov 2026 10:39:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/6] coresight: qcom: add QDCP STM source
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-4-b1a730d2c57a@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-4-b1a730d2c57a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 09:01, Jie Gan wrote:
> Add a Qualcomm-specific CoreSight STM (System Trace Macrocell) source
> for platforms where the Qualcomm Embedded Co-Processor (QECP) firmware
> owns the STM control registers.
> 
> The driver maps only the AP-visible STM stimulus aperture. Enable and
> disable operations go through the Qualcomm Debug Control Protocol
> (QDCP) provider referenced by qcom,qdcp, keeping the generic CoreSight
> STM driver untouched. Firmware controls the block's clocks and power,
> so the driver does no clock handling or runtime PM.
> 
> The CoreSight source disable operation cannot fail. If firmware does
> not confirm a stop, the source is still marked disabled and a warning
> is logged, and the failure is remembered. On removal the trace ID then
> stays allocated, so no other source can reuse an ID that firmware may
> still be applying. On removal the STM device is unregistered before the
> CoreSight device, so its unlink callback never runs on a freed
> CoreSight device.
> 

Like I mentioned on the other thread, add csdev_access() for your platform

Cheers
Suzuki


> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/Kconfig                |  11 +
>   drivers/hwtracing/coresight/Makefile               |   2 +
>   .../hwtracing/coresight/coresight-qcom-qdcp-stm.c  | 550 +++++++++++++++++++++
>   3 files changed, 563 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 6a4239ebb582..f6ad698344fe 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -119,6 +119,17 @@ config ETM4X_IMPDEF_FEATURE
>   	  ETM 4.x tracer module that can't reduce commit rate automatically.
>   	  This avoids overflow between the ETM tracer module and the cpu core.
>   
> +config CORESIGHT_QCOM_QDCP_STM
> +	tristate "Qualcomm QDCP CoreSight STM source driver"
> +	depends on QCOM_QDCP
> +	select CORESIGHT_LINKS_AND_SINKS
> +	select STM
> +	help
> +	  This driver provides a Qualcomm QDCP-backed CoreSight STM source.
> +	  It maps the AP-visible STM stimulus aperture but asks QECP firmware
> +	  to enable and disable STM tracing through QDCP instead of touching
> +	  STM control registers directly.
> +
>   config CORESIGHT_STM
>   	tristate "CoreSight System Trace Macrocell driver"
>   	depends on (ARM && !(CPU_32v3 || CPU_32v4 || CPU_32v4T)) || ARM64
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index ab16d06783a5..d97e334fe1fc 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -23,6 +23,7 @@ condflags := \
>   subdir-ccflags-y += $(condflags)
>   
>   CFLAGS_coresight-stm.o := -D__DISABLE_TRACE_MMIO__
> +CFLAGS_coresight-qcom-qdcp-stm.o := -D__DISABLE_TRACE_MMIO__
>   
>   obj-$(CONFIG_CORESIGHT) += coresight.o
>   coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
> @@ -43,6 +44,7 @@ coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>   obj-$(CONFIG_CORESIGHT_SOURCE_ETM4X) += coresight-etm4x.o
>   coresight-etm4x-y := coresight-etm4x-core.o coresight-etm4x-sysfs.o \
>   			coresight-etm4x-cfg.o
> +obj-$(CONFIG_CORESIGHT_QCOM_QDCP_STM) += coresight-qcom-qdcp-stm.o
>   obj-$(CONFIG_CORESIGHT_STM) += coresight-stm.o
>   obj-$(CONFIG_CORESIGHT_CPU_DEBUG) += coresight-cpu-debug.o
>   obj-$(CONFIG_CORESIGHT_CATU) += coresight-catu.o
> diff --git a/drivers/hwtracing/coresight/coresight-qcom-qdcp-stm.c b/drivers/hwtracing/coresight/coresight-qcom-qdcp-stm.c
> new file mode 100644
> index 000000000000..39c6a2798a0f
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-qcom-qdcp-stm.c
> @@ -0,0 +1,550 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Qualcomm QDCP-backed CoreSight STM source driver.
> + */
> +
> +#include <linux/bitmap.h>
> +#include <linux/coresight.h>
> +#include <linux/coresight-stm.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/log2.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/perf_event.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/stm.h>
> +#include <linux/string.h>
> +
> +#include "coresight-priv.h"
> +#include <linux/soc/qcom/qdcp.h>
> +#include "coresight-trace-id.h"
> +
> +#define QDCP_STM_BYTES_PER_CHANNEL	256
> +#define QDCP_STM_PKT_TYPE_DATA		0x98
> +#define QDCP_STM_PKT_TYPE_FLAG		0xe8
> +
> +#define qdcp_stm_channel_addr(drvdata, channel) \
> +	((drvdata)->stimulus_base + \
> +	 ((channel) * QDCP_STM_BYTES_PER_CHANNEL))
> +#define qdcp_stm_channel_off(type, options)	((type) & ~(options))
> +
> +/**
> + * struct qcom_qdcp_stm_drvdata - QDCP STM source data.
> + * @stm: generic STM interface handle.
> + * @csdev: CoreSight source device.
> + * @stimulus_base: mapped AP-visible STM stimulus aperture.
> + * @stimulus_phys: physical base of the STM stimulus aperture.
> + * @guaranteed: per-channel guaranteed/invariant delivery bitmap.
> + * @qdcp: QDCP connection state; @qdcp.id is the QECP firmware source
> + *	identifier, @qdcp.lock serializes sleeping QDCP operations.
> + * @traceid: CoreSight ATID assigned to this source.
> + * @fw_stop_failed: the last firmware stop was not confirmed, so firmware may
> + *	still be tagging trace with @traceid. Updated under @qdcp.lock; read
> + *	without it only on removal, when nothing else can use the source.
> + * @numsp: number of stimulus ports.
> + * @write_bytes: maximum naturally aligned stimulus write size.
> + * @port_mask: stimulus port enable mask sent to firmware. Like the STMSPER
> + *	register it mirrors, this is a 32-bit mask applied per 32-port group,
> + *	so enabling every bit covers all ports regardless of @numsp.
> + */
> +struct qcom_qdcp_stm_drvdata {
> +	struct stm_data		stm;
> +	struct coresight_device	*csdev;
> +	void __iomem		*stimulus_base;
> +	phys_addr_t		stimulus_phys;
> +	unsigned long		*guaranteed;
> +	struct qdcp_consumer	qdcp;
> +	u8			traceid;
> +	bool			fw_stop_failed;
> +	u32			numsp;
> +	u32			write_bytes;
> +	u32			port_mask;
> +};
> +
> +static bool qdcp_stm_addr_unaligned(const void *addr, u8 write_bytes)
> +{
> +	return (unsigned long)addr & (write_bytes - 1);
> +}
> +
> +static void qdcp_stm_send(void __iomem *addr, const void *data,
> +			  u32 size, u8 write_bytes)
> +{
> +	u8 payload[8];
> +
> +	if (qdcp_stm_addr_unaligned(data, write_bytes)) {
> +		memcpy(payload, data, size);
> +		data = payload;
> +	}
> +
> +	switch (size) {
> +#ifdef CONFIG_64BIT
> +	case 8:
> +		writeq_relaxed(*(u64 *)data, addr);
> +		break;
> +#endif
> +	case 4:
> +		writel_relaxed(*(u32 *)data, addr);
> +		break;
> +	case 2:
> +		writew_relaxed(*(u16 *)data, addr);
> +		break;
> +	case 1:
> +		writeb_relaxed(*(u8 *)data, addr);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static ssize_t notrace qdcp_stm_packet(struct stm_data *stm_data,
> +				       unsigned int master, unsigned int channel,
> +				       unsigned int packet, unsigned int flags,
> +				       unsigned int size,
> +				       const unsigned char *payload)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata;
> +	void __iomem *channel_addr;
> +	unsigned int stm_flags;
> +
> +	drvdata = container_of(stm_data, struct qcom_qdcp_stm_drvdata, stm);
> +	if (!coresight_get_mode(drvdata->csdev))
> +		return -EACCES;
> +
> +	if (channel >= drvdata->numsp)
> +		return -EINVAL;
> +
> +	channel_addr = qdcp_stm_channel_addr(drvdata, channel);
> +	stm_flags = flags & STP_PACKET_TIMESTAMPED ? STM_FLAG_TIMESTAMPED : 0;
> +	stm_flags |= test_bit(channel, drvdata->guaranteed) ?
> +		     STM_FLAG_GUARANTEED : 0;
> +
> +	switch (packet) {
> +	case STP_PACKET_FLAG:
> +		channel_addr += qdcp_stm_channel_off(QDCP_STM_PKT_TYPE_FLAG,
> +							 stm_flags);
> +		qdcp_stm_send(channel_addr, payload, 1, drvdata->write_bytes);
> +		return 1;
> +	case STP_PACKET_DATA:
> +		if (!size)
> +			return 0;
> +		if (size > drvdata->write_bytes)
> +			size = drvdata->write_bytes;
> +		else
> +			size = rounddown_pow_of_two(size);
> +
> +		stm_flags |= flags & STP_PACKET_MARKED ? STM_FLAG_MARKED : 0;
> +		channel_addr += qdcp_stm_channel_off(QDCP_STM_PKT_TYPE_DATA,
> +							 stm_flags);
> +		qdcp_stm_send(channel_addr, payload, size, drvdata->write_bytes);
> +		return size;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static phys_addr_t qdcp_stm_mmio_addr(struct stm_data *stm_data,
> +				      unsigned int master, unsigned int channel,
> +				      unsigned int nr_chans)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata;
> +	phys_addr_t addr;
> +
> +	drvdata = container_of(stm_data, struct qcom_qdcp_stm_drvdata, stm);
> +	addr = drvdata->stimulus_phys +
> +	       channel * QDCP_STM_BYTES_PER_CHANNEL;
> +
> +	if (offset_in_page(addr) ||
> +	    offset_in_page(nr_chans * QDCP_STM_BYTES_PER_CHANNEL))
> +		return 0;
> +
> +	return addr;
> +}
> +
> +static int qdcp_stm_link(struct stm_data *stm_data, unsigned int master,
> +			 unsigned int channel)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata;
> +
> +	drvdata = container_of(stm_data, struct qcom_qdcp_stm_drvdata, stm);
> +	if (!drvdata->csdev)
> +		return -EINVAL;
> +
> +	return coresight_enable_sysfs(drvdata->csdev);
> +}
> +
> +static void qdcp_stm_unlink(struct stm_data *stm_data, unsigned int master,
> +			    unsigned int channel)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata;
> +
> +	drvdata = container_of(stm_data, struct qcom_qdcp_stm_drvdata, stm);
> +	if (drvdata->csdev)
> +		coresight_disable_sysfs(drvdata->csdev);
> +}
> +
> +static long qdcp_stm_set_options(struct stm_data *stm_data,
> +				 unsigned int master, unsigned int channel,
> +				 unsigned int nr_chans, unsigned long options)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata;
> +
> +	drvdata = container_of(stm_data, struct qcom_qdcp_stm_drvdata, stm);
> +	if (!coresight_get_mode(drvdata->csdev))
> +		return -EINVAL;
> +
> +	if (channel >= drvdata->numsp)
> +		return -EINVAL;
> +
> +	switch (options) {
> +	case STM_OPTION_GUARANTEED:
> +		set_bit(channel, drvdata->guaranteed);
> +		break;
> +	case STM_OPTION_INVARIANT:
> +		clear_bit(channel, drvdata->guaranteed);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qdcp_stm_enable(struct coresight_device *csdev,
> +			   struct perf_event *event, enum cs_mode mode,
> +			   struct coresight_path *path)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata;
> +	int ret;
> +
> +	if (mode != CS_MODE_SYSFS)
> +		return -EINVAL;
> +
> +	if (!coresight_take_mode(csdev, mode))
> +		return -EBUSY;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	mutex_lock(&drvdata->qdcp.lock);
> +	ret = qdcp_stm_source_enable(drvdata->qdcp.provider, drvdata->qdcp.id,
> +				     drvdata->traceid, drvdata->port_mask,
> +				     false);
> +	if (!ret)
> +		drvdata->fw_stop_failed = false;
> +	mutex_unlock(&drvdata->qdcp.lock);
> +	if (ret) {
> +		coresight_set_mode(csdev, CS_MODE_DISABLED);
> +		return ret;
> +	}
> +
> +	dev_dbg(&csdev->dev, "QDCP STM tracing enabled\n");
> +	return 0;
> +}
> +
> +/*
> + * The CoreSight source disable op returns void and the user has already torn
> + * the path down, so the source always ends up disabled from Linux's point of
> + * view. Return the firmware result so the caller can at least report it.
> + */
> +static int qdcp_stm_disable_source(struct coresight_device *csdev)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata;
> +	struct qdcp_data *qdcp;
> +	u64 source_id;
> +	u8 traceid;
> +	int ret;
> +
> +	if (coresight_get_mode(csdev) != CS_MODE_SYSFS)
> +		return 0;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +	qdcp = drvdata->qdcp.provider;
> +	source_id = drvdata->qdcp.id;
> +	traceid = drvdata->traceid;
> +
> +	mutex_lock(&drvdata->qdcp.lock);
> +	ret = qdcp_stm_source_disable(qdcp, source_id, traceid, false);
> +	drvdata->fw_stop_failed = !!ret;
> +	mutex_unlock(&drvdata->qdcp.lock);
> +
> +	coresight_set_mode(csdev, CS_MODE_DISABLED);
> +	dev_dbg(&csdev->dev, "QDCP STM tracing disabled\n");
> +	return ret;
> +}
> +
> +static void qdcp_stm_disable(struct coresight_device *csdev,
> +			     struct perf_event *event)
> +{
> +	int ret = qdcp_stm_disable_source(csdev);
> +
> +	if (ret)
> +		dev_warn(&csdev->dev,
> +			 "firmware did not confirm QDCP STM disable: %d\n",
> +			 ret);
> +}
> +
> +static int qdcp_stm_trace_id(struct coresight_device *csdev,
> +			     enum cs_mode mode, struct coresight_device *sink)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +	return drvdata->traceid;
> +}
> +
> +static const struct coresight_ops_source qdcp_stm_source_ops = {
> +	.enable		= qdcp_stm_enable,
> +	.disable	= qdcp_stm_disable,
> +};
> +
> +static const struct coresight_ops qdcp_stm_cs_ops = {
> +	.trace_id	= qdcp_stm_trace_id,
> +	.source_ops	= &qdcp_stm_source_ops,
> +};
> +
> +static ssize_t traceid_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%#x\n", drvdata->traceid);
> +}
> +static DEVICE_ATTR_RO(traceid);
> +
> +static struct attribute *qdcp_stm_attrs[] = {
> +	&dev_attr_traceid.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group qdcp_stm_group = {
> +	.attrs = qdcp_stm_attrs,
> +};
> +
> +static const struct attribute_group *qdcp_stm_groups[] = {
> +	&qdcp_stm_group,
> +	NULL,
> +};
> +
> +static int qdcp_stm_get_stimulus_area(struct platform_device *pdev,
> +				      struct resource **res)
> +{
> +	/*
> +	 * The binding requires reg-names = "stm-stimulus-base"; there is no
> +	 * documented unnamed-resource form, so don't silently accept one.
> +	 */
> +	*res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +					    "stm-stimulus-base");
> +	return *res ? 0 : -EINVAL;
> +}
> +
> +static void qdcp_stm_init_stm_data(struct qcom_qdcp_stm_drvdata *drvdata,
> +				   const char *name)
> +{
> +	struct stm_data *stm = &drvdata->stm;
> +
> +	stm->name = name;
> +	stm->sw_start = 1;
> +	stm->sw_end = 1;
> +	stm->hw_override = true;
> +	stm->sw_nchannels = drvdata->numsp;
> +	stm->sw_mmiosz = QDCP_STM_BYTES_PER_CHANNEL;
> +	stm->packet = qdcp_stm_packet;
> +	stm->mmio_addr = qdcp_stm_mmio_addr;
> +	stm->link = qdcp_stm_link;
> +	stm->unlink = qdcp_stm_unlink;
> +	stm->set_options = qdcp_stm_set_options;
> +}
> +
> +static int qdcp_stm_probe(struct platform_device *pdev)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata;
> +	struct coresight_platform_data *pdata;
> +	struct coresight_desc desc = { 0 };
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	const char *name;
> +	u32 numsp;
> +	int trace_id;
> +	int ret;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, drvdata);
> +
> +	drvdata->qdcp.provider = devm_qdcp_get(dev, "qcom,qdcp");
> +	if (IS_ERR(drvdata->qdcp.provider)) {
> +		dev_err(dev, "failed to get QDCP provider: %pe\n",
> +			drvdata->qdcp.provider);
> +		return PTR_ERR(drvdata->qdcp.provider);
> +	}
> +
> +	ret = fwnode_property_read_u64(dev->fwnode, "qcom,qdcp-source-id",
> +				       &drvdata->qdcp.id);
> +	if (ret) {
> +		dev_err(dev, "missing QDCP STM source id: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = qdcp_stm_get_stimulus_area(pdev, &res);
> +	if (ret) {
> +		dev_err(dev, "missing STM stimulus aperture: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drvdata->stimulus_phys = res->start;
> +	drvdata->stimulus_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(drvdata->stimulus_base))
> +		return PTR_ERR(drvdata->stimulus_base);
> +
> +	ret = fwnode_property_read_u32(dev->fwnode, "qcom,num-stimulus-ports",
> +				       &numsp);
> +	if (ret) {
> +		numsp = resource_size(res) / QDCP_STM_BYTES_PER_CHANNEL;
> +		if (!numsp) {
> +			dev_err(dev, "stimulus aperture of %llu bytes holds no channels\n",
> +				(u64)resource_size(res));
> +			return -EINVAL;
> +		}
> +	} else if (!numsp ||
> +		   (u64)numsp * QDCP_STM_BYTES_PER_CHANNEL > resource_size(res)) {
> +		/*
> +		 * A DT-provided port count that doesn't fit the mapped
> +		 * stimulus aperture would let channel addressing in
> +		 * qdcp_stm_packet()/qdcp_stm_mmio_addr() compute offsets past
> +		 * the end of what devm_ioremap_resource() actually mapped.
> +		 */
> +		dev_err(dev, "qcom,num-stimulus-ports %u exceeds stimulus aperture of %llu bytes\n",
> +			numsp, (u64)resource_size(res));
> +		return -EINVAL;
> +	}
> +
> +	drvdata->numsp = numsp;
> +	drvdata->write_bytes = IS_ENABLED(CONFIG_64BIT) ? 8 : 4;
> +	/*
> +	 * STMSPER-style mask: enable all ports in every 32-port group. The
> +	 * firmware applies it to whichever group is active, so this covers
> +	 * all ports irrespective of numsp.
> +	 */
> +	drvdata->port_mask = U32_MAX;
> +	drvdata->guaranteed = devm_bitmap_zalloc(dev, numsp, GFP_KERNEL);
> +	if (!drvdata->guaranteed)
> +		return -ENOMEM;
> +
> +	mutex_init(&drvdata->qdcp.lock);
> +
> +	name = coresight_alloc_device_name("qdcp_stm", dev);
> +	if (!name)
> +		return -ENOMEM;
> +
> +	trace_id = coresight_trace_id_get_system_id();
> +	if (trace_id < 0)
> +		return trace_id;
> +	drvdata->traceid = trace_id;
> +
> +	pdata = coresight_get_platform_data(dev);
> +	if (IS_ERR(pdata)) {
> +		ret = PTR_ERR(pdata);
> +		goto err_trace_id_put;
> +	}
> +	dev->platform_data = pdata;
> +
> +	desc.name = name;
> +	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
> +	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE;
> +	desc.ops = &qdcp_stm_cs_ops;
> +	desc.pdata = pdata;
> +	desc.dev = dev;
> +	desc.groups = qdcp_stm_groups;
> +	/*
> +	 * The STM control registers are owned by QECP firmware and are not
> +	 * AP-accessible; only the stimulus aperture is mapped (for data
> +	 * writes, not CoreSight management access). Leave desc.access unset
> +	 * so the core never tries to touch programming registers directly.
> +	 */
> +	drvdata->csdev = coresight_register(&desc);
> +	if (IS_ERR(drvdata->csdev)) {
> +		ret = PTR_ERR(drvdata->csdev);
> +		goto err_trace_id_put;
> +	}
> +
> +	/*
> +	 * csdev and traceid must both be valid before the STM char device
> +	 * is live, since stm_register_device() makes drvdata->stm's
> +	 * callbacks (packet(), set_options(), ...) reachable immediately via
> +	 * /dev/<name> ioctls and writes, and those callbacks dereference
> +	 * drvdata->csdev and drvdata->traceid.
> +	 */
> +	qdcp_stm_init_stm_data(drvdata, name);
> +	ret = stm_register_device(dev, &drvdata->stm, THIS_MODULE);
> +	if (ret) {
> +		dev_err(dev, "failed to register STM: %d\n", ret);
> +		goto err_coresight_unregister;
> +	}
> +
> +	dev_info(&drvdata->csdev->dev, "QDCP STM initialized\n");
> +	return 0;
> +
> +err_coresight_unregister:
> +	coresight_unregister(drvdata->csdev);
> +err_trace_id_put:
> +	coresight_trace_id_put_system_id(drvdata->traceid);
> +	return ret;
> +}
> +
> +static void qdcp_stm_remove(struct platform_device *pdev)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata = platform_get_drvdata(pdev);
> +
> +	/*
> +	 * Unregister the STM first: its unlink callback disables the source
> +	 * through drvdata->csdev, which must still be live.
> +	 */
> +	stm_unregister_device(&drvdata->stm);
> +
> +	/*
> +	 * No-op unless the source is still in CS_MODE_SYSFS. Without it,
> +	 * removing an enabled source would leave firmware STM enabled.
> +	 */
> +	qdcp_stm_disable_source(drvdata->csdev);
> +
> +	/*
> +	 * A stop that failed here or earlier (fw_stop_failed) means firmware
> +	 * may still be tagging trace with this ID. Keep it allocated rather
> +	 * than let another source reuse it.
> +	 */
> +	if (drvdata->fw_stop_failed)
> +		dev_warn(&pdev->dev,
> +			 "QDCP STM not confirmed stopped, leaking trace ID %u\n",
> +			 drvdata->traceid);
> +	else
> +		coresight_trace_id_put_system_id(drvdata->traceid);
> +
> +	coresight_unregister(drvdata->csdev);
> +}
> +
> +static const struct of_device_id qdcp_stm_match[] = {
> +	{ .compatible = "qcom,coresight-stm-qdcp" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qdcp_stm_match);
> +
> +static struct platform_driver qdcp_stm_driver = {
> +	.probe = qdcp_stm_probe,
> +	.remove = qdcp_stm_remove,
> +	.driver = {
> +		.name = "coresight-qcom-qdcp-stm",
> +		.of_match_table = qdcp_stm_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +module_platform_driver(qdcp_stm_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm QDCP CoreSight STM source driver");
> +MODULE_AUTHOR("Jie Gan <jie.gan@oss.qualcomm.com>");
> +MODULE_LICENSE("GPL");
> 


Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5BC2E228D
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047779; cv=none; b=j0EUUD7H7kTy6H/CnSwEKUpLqjwcI5Oy8FEKZe+uMoQk4+2b5WKMn+KBtOH4KBufz4yub7S2se6+h7KxZGxjZ3ZMg2szSNuKoB7nE28/k73f8QhmXDAR5VtDzECiXLdNmv81yUK80NPTtmDJwXY/yeWNnplYNYPqwdNlc6nZuHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047779; c=relaxed/simple;
	bh=TSkbGkFVL+XTUvVi5x7GblmWNk5lifpmYcHnemecnXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7ew9paH7lkzifxMhKLT4YZqvvT4H1+Dpxf7FatfX7q4X/1uLcaqBWoj3/U0eHoU/Q+dNMRf9Xk0owN4q0dQWGl+Y45+lYIKctIl6xs4cod1+EJsK54oCvu+r2wJJx813WYV1pfATQwuWAHxgBRiLSrz9Jnnw0oYRLt4feGjRz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXZ3HAze; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXZ3HAze"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1772686b3a.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 09:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784047777; x=1784652577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HdeTbsSWSgcRJkjGwFtwtkGAtH1tcNhPHo6/1vJUvzM=;
        b=bXZ3HAzewg8pX5aZgStfO5WU4jqveONAsHEAJ7fGbkOPh7M8sDBTbn3ncwBjRVws/C
         5pwZm1WyC7v92bMQeKS9hLB8Pbz5bgBmw1PS/Ou/nwd2UbSm6YJATo5xhiLJpQV5YD7A
         4pFjXIPBk8BYlXAbD80J66BXJiIDxOprWOisnY9v7mnUEOeAKSbyJ8EMWaRMfy7MXttQ
         NE5QXcCxCva/wreDnkW7XcYZQDSN58iBclI3EH4GAQMMFktGm5PjPaYZ6GS+npWORGJX
         3io1Oez4MNpq9mDrUBVD5JLlBgFHfYLlGDIjsmicR0ttSpljakAruaxs11VfGbJBeRqC
         JetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784047777; x=1784652577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdeTbsSWSgcRJkjGwFtwtkGAtH1tcNhPHo6/1vJUvzM=;
        b=j8U9lxpORlfsEmfuQE/Qfq08Bhlbzq5doCvUT73tLI6gV2vH1/netbZcqckuHVTmxr
         LkrclIy6J6LciZc/eWEdusTCsAWnt0vKFsDp1udohRPEsaOT6VISsORZycfhF4C4JLU1
         4SjNEkCvS1MErD7xWWgUVbIrZE7VvHUP6gRaoRbjNxlhOEqPucwt2h7/uUC3TlEN7STa
         /pZ2nxd/6LRMd7A4Z7uz8bflBBtFIzJhvhLet6ZL3aq72ioiugPfbPfN/sOchoQXyK0u
         O7J04UtZgDkjdgo8u6UqsZw552F8fo9JCR4ggUdALsrBwc6V6L+8R8LSJkIZTBj2GTCX
         D4UA==
X-Forwarded-Encrypted: i=1; AHgh+RoHu8eVEBy7LzGD+GkLcI1zjnKxZfeES2vEglVjIE1gpt9mTxjF7l17mrTMqFkinBNmaItooXKvlkTR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr+d475RyC7ZOOAZVhAayT5XlDgHvYvhsJj5pZkscCJrmEijwo
	qRXtT3IagwaOlB9e+0FvI+1LQAlGW9Jox4anNteWOBbR9xsaRsMgBQhwr0rH5bLS1QI=
X-Gm-Gg: AfdE7cnI9dsyiQUapWLUcLAAuWZ0CWX4N8QVEjV9VwNnb5/1ZUtNy+W3uiZI8k76sbm
	sTjPZT+FBXVo3nDX+m5bZ5JVTlorS0vx7RSFRzHDL15/5K+0RGBJXHIvn3TzvJCNIVbNGvPBnjw
	p17UXrv18tLBaRP6SFqwXnOlq6kCQ+kdfj5KWSMPdLcuheUDZL92aYfP7ebvJnS1UO+3nYGZHqF
	x5suJ7OOIQoeEAhql4QQ5osojnVyhx90ne8hEK01uKshHay2MDHDtuY1t/Dh5XiYy/qsPoSvGyx
	zTWkridgHUasRiWpdBDU9U/21dX0CmjohLdSWhTam3DCQU0tYkD8fptVeK5U8FRy2+ENMZC4AcK
	Si3k/X2XkW8BvQ4k52tX2guFhbsMwv9tk4LGup3/VUfgJHaa6/84Vup1BQ8K36eQvpSsBrMya5s
	KyErPPsIZxzR1YULhj
X-Received: by 2002:a05:6a00:23c3:b0:845:d284:9e11 with SMTP id d2e1a72fcca58-84889756a2cmr13202329b3a.56.1784047776320;
        Tue, 14 Jul 2026 09:49:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:24cc:3af8:4244:12fe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f238b21sm1817309b3a.7.2026.07.14.09.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:49:35 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:49:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	tanmay.shah@amd.com, michal.simek@amd.com
Subject: Re: [PATCH v5 2/2] remoteproc: add AMD MicroBlaze/V BRAM-based
 remote processor driver
Message-ID: <alZonQmzsVC2EIzo@p14s>
References: <20260709145712.951146-1-ben.levinsky@amd.com>
 <20260709145712.951146-3-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709145712.951146-3-ben.levinsky@amd.com>

On Thu, Jul 09, 2026 at 07:57:12AM -0700, Ben Levinsky wrote:
> Add a remoteproc driver for AMD MicroBlaze/V soft-core processor
> subsystems instantiated in programmable logic and using dual-port BRAM
> for firmware storage and execution.
> 
> The driver parses the firmware memory window from the remoteproc device
> node's reg property, interprets that address and size in the
> processor-local address space, and then uses standard devicetree address
> translation through the parent bus ranges property to obtain the
> corresponding Linux-visible system physical address.
> 
> The resulting translated region is registered as the executable
> remoteproc carveout and coredump segment.
> 
> The processor is controlled through an active-low reset GPIO and a
> subsystem clock. The clock is enabled before reset is released, and the
> processor is kept in reset until firmware loading completes.
> 
> The firmware-name property is optional, allowing firmware to be assigned
> later through the remoteproc framework. Firmware images without a
> resource table are also accepted.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/Kconfig          |   9 ++
>  drivers/remoteproc/Makefile         |   1 +
>  drivers/remoteproc/amd_bram_rproc.c | 213 ++++++++++++++++++++++++++++
>  3 files changed, 223 insertions(+)
>  create mode 100644 drivers/remoteproc/amd_bram_rproc.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index c521c744e7db..b25252acbfb9 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -23,6 +23,15 @@ config REMOTEPROC_CDEV
>  
>  	  It's safe to say N if you don't want to use this interface.
>  
> +config AMD_MBV_BRAM_REMOTEPROC
> +	tristate "AMD MicroBlaze/V BRAM-based remoteproc support"
> +	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
> +	help
> +	  Say y or m here to support a MicroBlaze/V BRAM-based remote
> +	  processor managed through the remoteproc framework.
> +
> +	  If unsure, say N.
> +
>  config IMX_REMOTEPROC
>  	tristate "i.MX remoteproc support"
>  	depends on ARCH_MXC
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 1c7598b8475d..9af895fff06e 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
>  remoteproc-y				+= remoteproc_virtio.o
>  remoteproc-y				+= remoteproc_elf_loader.o
>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
> +obj-$(CONFIG_AMD_MBV_BRAM_REMOTEPROC)	+= amd_bram_rproc.o

s/amd_bram_rproc.o/amd_mbv_bram_rproc.o

Thanks,
Mathieu

>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>  obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
> diff --git a/drivers/remoteproc/amd_bram_rproc.c b/drivers/remoteproc/amd_bram_rproc.c
> new file mode 100644
> index 000000000000..e4a103cf8455
> --- /dev/null
> +++ b/drivers/remoteproc/amd_bram_rproc.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD MicroBlaze/V BRAM-based Remote Processor driver
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + *
> + * This driver supports soft-core processors (MicroBlaze, MicroBlaze-V, or
> + * similar) instantiated in AMD programmable logic, using dual-port BRAM
> + * for firmware storage and execution.
> + *
> + * The firmware memory (BRAM) is described in the processor-local address
> + * space and translated to the Linux-visible system physical address with
> + * standard devicetree address translation.
> + *
> + * Reset is controlled via GPIO connected to Processor System Reset IP.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +
> +#include "remoteproc_internal.h"
> +
> +/**
> + * struct amd_bram_rproc - AMD MicroBlaze/V BRAM-based remoteproc private data
> + * @dev: device pointer
> + * @reset: GPIO descriptor for reset control (active-low)
> + * @clk: processor clock
> + */
> +struct amd_bram_rproc {
> +	struct device *dev;
> +	struct gpio_desc *reset;
> +	struct clk *clk;
> +};
> +
> +static int amd_bram_rproc_prepare(struct rproc *rproc)
> +{
> +	struct amd_bram_rproc *priv = rproc->priv;
> +	struct rproc_mem_entry *mem;
> +	struct resource res;
> +	u64 da, size;
> +	int ret;
> +
> +	ret = of_property_read_reg(priv->dev->of_node, 0, &da, &size);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to parse executable memory reg\n");
> +		return ret;
> +	}
> +
> +	if (!size || size > U32_MAX) {
> +		dev_err(priv->dev, "invalid executable memory size\n");
> +		return -EINVAL;
> +	}
> +
> +	if (da > U32_MAX) {
> +		dev_err(priv->dev, "invalid executable memory address\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_address_to_resource(priv->dev->of_node, 0, &res);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to translate executable memory reg\n");
> +		return ret;
> +	}
> +
> +	mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
> +				   resource_size(&res), da,
> +				   rproc_mem_entry_ioremap_wc,
> +				   rproc_mem_entry_iounmap,
> +				   dev_name(priv->dev));
> +	if (!mem)
> +		return -ENOMEM;
> +
> +	rproc_add_carveout(rproc, mem);
> +	rproc_coredump_add_segment(rproc, da, resource_size(&res));
> +
> +	return 0;
> +}
> +
> +static int amd_bram_rproc_start(struct rproc *rproc)
> +{
> +	struct amd_bram_rproc *priv = rproc->priv;
> +	int ret;
> +
> +	/* Enable clock before releasing reset */
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to enable clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Deassert reset and let the processor run. */
> +	ret = gpiod_set_value_cansleep(priv->reset, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
> +		clk_disable_unprepare(priv->clk);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_bram_rproc_stop(struct rproc *rproc)
> +{
> +	struct amd_bram_rproc *priv = rproc->priv;
> +	int ret;
> +
> +	/* Assert reset before disabling the processor clock. */
> +	ret = gpiod_set_value_cansleep(priv->reset, 1);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Disable clock after asserting reset */
> +	clk_disable_unprepare(priv->clk);
> +
> +	return 0;
> +}
> +
> +static int amd_bram_rproc_parse_fw(struct rproc *rproc,
> +				   const struct firmware *fw)
> +{
> +	rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
> +					  "no resource table found\n");
> +	return 0;
> +}
> +
> +static const struct rproc_ops amd_bram_rproc_ops = {
> +	.prepare	= amd_bram_rproc_prepare,
> +	.start		= amd_bram_rproc_start,
> +	.stop		= amd_bram_rproc_stop,
> +	.load		= rproc_elf_load_segments,
> +	.sanity_check	= rproc_elf_sanity_check,
> +	.get_boot_addr	= rproc_elf_get_boot_addr,
> +	.parse_fw	= amd_bram_rproc_parse_fw,
> +};
> +
> +static int amd_bram_rproc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct amd_bram_rproc *priv;
> +	const char *fw_name = NULL;
> +	struct rproc *rproc;
> +	int ret;
> +
> +	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> +	if (ret < 0 && ret != -EINVAL)
> +		return dev_err_probe(dev, ret,
> +				     "failed to parse firmware-name property\n");
> +
> +	rproc = devm_rproc_alloc(dev, dev_name(dev), &amd_bram_rproc_ops,
> +				 fw_name, sizeof(*priv));
> +	if (!rproc)
> +		return -ENOMEM;
> +
> +	priv = rproc->priv;
> +	priv->dev = dev;
> +
> +	/* Get the processor clock */
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk),
> +				     "failed to get clock\n");
> +
> +	/*
> +	 * Keep the processor in reset until remoteproc has finished loading
> +	 * firmware into the executable memory window described by reg and
> +	 * translated through the parent bus ranges property.
> +	 */
> +	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->reset))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset),
> +				     "failed to get reset gpio\n");
> +
> +	rproc->auto_boot = false;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set DMA mask\n");
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	ret = devm_rproc_add(dev, rproc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register rproc\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id amd_bram_rproc_of_match[] = {
> +	{ .compatible = "xlnx,zynqmp-bram-rproc" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, amd_bram_rproc_of_match);
> +
> +static struct platform_driver amd_bram_rproc_driver = {
> +	.probe = amd_bram_rproc_probe,
> +	.driver = {
> +		.name = "amd-bram-rproc",
> +		.of_match_table = amd_bram_rproc_of_match,
> +	},
> +};
> +module_platform_driver(amd_bram_rproc_driver);
> +
> +MODULE_DESCRIPTION("AMD MicroBlaze/V BRAM-based Remote Processor driver");
> +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@amd.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

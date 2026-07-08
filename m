Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1D730C163;
	Wed,  8 Jul 2026 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508964; cv=none; b=WylkASakK+1GlKpy5cK+51kHb0EHs+XlJ1ooTfrhhKGKqsEFF4MEw1e9tO1b8pTST9nxa5ybvRkMc6x6Eipg+TkUsmSnzdnJo9xqv4SLXZs5Z5hAUw/mtKQdrfVX2osjIcAOEGLjMYp9yB9rmxPgx7GDgg87GuZuI2Nx+lKME0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508964; c=relaxed/simple;
	bh=TOi6wy7nNW7m2FOPg7UBrYpWBi41h9CeKBS2wQXzJt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmxIT+fp6mYVg7aeCPNvETcAe6Yuytgl5W/jGDr+tohbF77fqrjFdn/HxizmQRhR71k5AJiSGJS8W+qz42F0NVQoRhRISXLXBTyHfpM+4akTGYboEmosCBfIXqd2zVvwM3i3ZEueHp5ZIhF4gZXWUCwz+FOjEESOVh7zqcjDYCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cc7SSrlw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cc7SSrlw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490A91F000E9;
	Wed,  8 Jul 2026 11:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783508959;
	bh=XuXjuuzDyi8cgbQulYQmKbsVE4hX7Aw0qIQT8ma46NA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cc7SSrlwx2z3/Y3y8F1os6XLVglgwGjaTk7SJo5ycmz6DEDkAQpuFti8FnbE5dNe6
	 IVy6Klwyj4C2t+px51R7oHfxIKaa8uXjHQbFLcfYHsngwCs1f5tU0n0l+PsRChKegv
	 tg7tX+/rITGDrerTok+liXVhTYeruZ/eusjy72ec/AGBiyvaAKGx3MRDDy9aqkV+P4
	 klFL54vR8jwktJceMwE1SCd1pVOZEWoavi3MJLc/Nz3Q4MVjiGjbdl3BrvZQwiVOML
	 04zyYhXAEtaNckWBCFFp6crYfniVnl8LZqiFWEFPOixMTdv24ajcFQXL+ZNIZ0pTg0
	 JSuuBEAkcB1JQ==
Message-ID: <cf5903d7-9ece-49f0-92a8-9f0dd2c27b01@kernel.org>
Date: Wed, 8 Jul 2026 13:09:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] memory: ti-k3-fsas: Add TI FSS_FSAS driver
To: Santhosh Kumar K <s-k6@ti.com>, robh@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260629072055.896322-1-s-k6@ti.com>
 <20260629072055.896322-3-s-k6@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <20260629072055.896322-3-s-k6@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/06/2026 09:20, Santhosh Kumar K wrote:
> Add a platform driver for the TI Flash SubSystem Application Subsystem
> (FSS_FSAS_GENREGS) in K3 SoCs. This driver takes care of disabling the
> OSPI XIP prefetch which causes DMA transfer data corruption.
> 
> Set SYSCONFIG.DISXIP to disable XIP read prefetch, preventing DMA data
> corruption when the OSPI DMA source address is not 4K-aligned.
> 
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> ---
>  drivers/memory/Kconfig      | 10 +++++
>  drivers/memory/Makefile     |  1 +
>  drivers/memory/ti-k3-fsas.c | 74 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 drivers/memory/ti-k3-fsas.c
> 
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index e5527020ff33..954e47810e8d 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -125,6 +125,16 @@ config TI_EMIF_SRAM
>  	  sequence so this driver provides several relocatable PM functions
>  	  for the SoC PM code to use.
>  
> +config TI_K3_FSS_FSAS
> +	tristate "TI K3 Flash Subsystem Application Subsystem (FSAS) support"
> +	depends on ARCH_K3 || COMPILE_TEST
> +	help
> +	  Driver for the TI K3 Flash Subsystem Application Subsystem
> +	  (FSS_FSAS_GENREGS) wrapper found on K3 related SoCs.
> +
> +	  This driver takes care of disabling the OSPI XIP prefetch which
> +	  causes DMA transfer data corruption.
> +
>  config FPGA_DFL_EMIF
>  	tristate "FPGA DFL EMIF Driver"
>  	depends on FPGA_DFL && HAS_IOMEM
> diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
> index 3ee883c8759a..8dc4860f615d 100644
> --- a/drivers/memory/Makefile
> +++ b/drivers/memory/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_STM32_OMM)		+= stm32_omm.o
>  obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
>  obj-$(CONFIG_TEGRA_MC)		+= tegra/
>  obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
> +obj-$(CONFIG_TI_K3_FSS_FSAS)	+= ti-k3-fsas.o
>  obj-$(CONFIG_FPGA_DFL_EMIF)	+= dfl-emif.o
>  
>  ti-emif-sram-objs		:= ti-emif-pm.o ti-emif-sram-pm.o
> diff --git a/drivers/memory/ti-k3-fsas.c b/drivers/memory/ti-k3-fsas.c
> new file mode 100644
> index 000000000000..a5f42afc694c
> --- /dev/null
> +++ b/drivers/memory/ti-k3-fsas.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TI K3 Flash Subsystem Application Subsystem (FSS_FSAS) driver
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com
> + */
> +
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +
> +#define FSAS_GENREGS_SYSCONFIG 0x04
> +#define FSAS_SYSCONFIG_DISXIP BIT(7)
> +
> +struct k3_fsas {
> +	void __iomem *base;
> +};
> +
> +static void k3_fsas_disable_xip_prefetch(struct k3_fsas *fsas)
> +{
> +	u32 val;
> +
> +	val = readl(fsas->base + FSAS_GENREGS_SYSCONFIG);
> +	val |= FSAS_SYSCONFIG_DISXIP;
> +	writel(val, fsas->base + FSAS_GENREGS_SYSCONFIG);
> +}
> +
> +static int k3_fsas_probe(struct platform_device *pdev)
> +{
> +	struct k3_fsas *fsas;
> +
> +	fsas = devm_kzalloc(&pdev->dev, sizeof(*fsas), GFP_KERNEL);
> +	if (!fsas)
> +		return -ENOMEM;
> +
> +	fsas->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(fsas->base))
> +		return PTR_ERR(fsas->base);
> +
> +	platform_set_drvdata(pdev, fsas);
> +
> +	k3_fsas_disable_xip_prefetch(fsas);

So a driver for FSAS device just writes to one register. That's why I
claim binding is either incomplete or not really a separate device.

Plus how does this work when you probe QSPI before this FSAS?

Best regards,
Krzysztof

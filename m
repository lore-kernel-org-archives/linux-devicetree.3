Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010461;
	b=0KYC6LNXTfkbg6lSnDC/uzIXLQQthRSIVhLex0l7xUgdpH0memk3x8zBhDQ7wIcsnLZ/
	 HCSEKzVwZeU669w1IYbN3fwTw/bOj54Y2EM8hHhGUUVUejRfU6mbvafVR0KSj59heuTL4
	 4QuZxge/X1RGjRd4wVD4e1G/sPVWgo6qLCcmEZahNrAQnN4RjMjPe3FWRoRqmM5CjRqJp
	 E1VKTxIxfFQbpUwAnpkNonIs1HY3YLGuLWq8Qv02kK0RbAJSO0hf6t0Fhl//o0fUJXgCh
	 UQQ8jonM4ONQNSnE6cgIq5Jo6D8t0A21UXNqgxo+8GK40ELRbYDINPN9gsolGxQ2ZwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j3h+xzXMo9Ka0zi+37NKY2m2j24N9rEJ8+Lib0/Avnc=;
	b=XGPlbDJK1n0LV2+DrX4/ficXZcdK17hKLQBdY9oLjK/6FxSlzb7PRitoimTagQP3d5oz
	 TkoqYpmDYoFdEbBeWAiKTGZRIhAH/uBm119cshuzuFphNuBFV+S/XkD6ocGcwmpLUAnyv
	 PQPWd6F7hot2xKZznbGYusQzWyR99qx5Wx8tmIPlpt2Lg7WMgwvEnGSDcNM2WBrQSHTIs
	 BYY8hKH7nbbwFrRLieMfU9Prp1EsTZgg/YZBgnmXHzTFz6uXIY/yQkGwTShhQePlu2Nwh
	 Pk1wh8tHIua2cVQaw/Kbkow8NQHLIwlc7TivYdCy6/1tzIgmpZ9LN4no9ELIRHW4dZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=minyard.net;
	spf=pass smtp.mailfrom=minyard.net;
	dkim=pass header.d=minyard.net header.i=@minyard.net header.a=rsa-sha256 header.s=google header.b=L3bhc5Yf;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F63606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F63606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=minyard.net header.i=@minyard.net header.a=rsa-sha256 header.s=google header.b=L3bhc5Yf
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-844a8bf7e25so612080a34.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1795010460; x=1795615260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j3h+xzXMo9Ka0zi+37NKY2m2j24N9rEJ8+Lib0/Avnc=;
        b=L3bhc5YfFoab1s7uHc58XJa7DBtrnc8eCZ/p025wjWGhzJMARPUEBjdy5ScDC4SsXT
         fP1UKfvqI0e+iV2w8eFI+1rpUDyo+eNfeaz62r7/jvhGXO9t2LQNLdJvixCm65nAUJ4E
         FfMCRhK4o3BX6X767chsFJP4IPLr5b0QeEhKu7N2fqmSHo1sQ4omRezW5dEhlSUIbfiS
         7qSeZU2N6N+NbTGHKqeLgMAQx0xwtv4+9/sd6NNNhrQEICz3WtudXjKtVBlAimpG9VLv
         Q/XKhaFPesCE02W2xTgREdG5nD4p1hBS/24R2CE7f6LWjr/4ubDKiKC16rotCG+58cvA
         ZvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010460; x=1795615260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3h+xzXMo9Ka0zi+37NKY2m2j24N9rEJ8+Lib0/Avnc=;
        b=dpxMLytePQKKte+u8S/720hpW2c8Ac0HR+INJlY6fXuiww9fN60bw6jGzgX8rPE90L
         b1qgxn6rt7uvKqhBCUA82nOrh/hXeHaI2Pv9XXk0Zb0ATlQbrRpSgXjRCNOHqgHlUhg1
         6D4VV26IxiT1f9I4urweL1/sIC3UKoY9Si1R92fcGrwI/zFPkPWMtZjSxxsOHE9/Ly+u
         OgB1LdI97ooe1PW2S9Hqeq2qa53uknoVRb1xS6QHGaPpNzLIn8IIEubiX9YUW6wLJh3m
         qJrguAICQtFEPvv3kVxC4A4riPrcVpCSn1OEXlApwXlDbA0gG8w6Sqtt8pXP51dQoees
         pngw==
X-Forwarded-Encrypted: i=1; AL+hErHV/egf05j22YDDI4Nprr/kb6bJ6d9QcI0wVMWsKcpJNXJ4bQxOFxwyDgyVzCP37WbrfSUUcwirRujC@vger.kernel.org
X-Gm-Message-State: APuU4Z8B4Dg4DrIq57TraEoybixm7M4pkn3xQWWENhvdXbO69r9TnQ4v
	ch/PUHgZTKPhZPa3RNvKKoyPDXt4XbGBx4luHJqr6iNicMVDiiwfw8GEy1rthqECdvW2e1Nigal
	izHNw
X-Gm-Gg: AYBFou3//QaXaV/YJ1sXbleYr23MEB2uX+C6Vrwt07wT0sGMhVh8n3BU2lA0EujqvV6
	dnyi0zkbJJIMfZicKIJwc7tef7xqTkhuKSvV50Yjefzj47f3sKilmgm/hrSKFVdFpB5XWufB7R6
	5ADd3S11hkhFkq8RwIqfxhth58/tliuSTSymGt/XX153qXKpZYd2AMXmzqc28apr/Vs6sNdKHVj
	5Lfh97i2CuKqwJSMYDi/rohSPYqszMlD63rZYA7dW31N2DNbxbN3XHoYl7B0i/BxoflKEkKbkta
	aK6J++UUngNkjk/xDj/ho+GqNaY/Ny6x7ui8F5zR++7wcPEgROUCt6ZVaLEziso4ENmtnjFPGAr
	E5C8nDRY7HsTaR9QflLQmJ64g5u5/V9QcolBb9GJJNbQnmM6B126pMHxsWil8jVlmYw7Sz1pSFO
	W/JLs6IMhS3wnYRjpAoxMob+mBhO6ueseWDERckYJUQFAvfmEDCY+69B0VgvLs65J4xORnrMCrX
	f/M9YWmBjHJyOaMFFFp2+mIEw1oDg+c/LzHU4bDpNRAqoI+PkgvcKEEvdQEFCxCMYqbghsogzG3
	I5DRXqF2PUlYAjQU5TzrJzFRR24twDpMbpQYjyh4fuxt3UerGbnjguNpcfPl5AOW5m3iWDZlwLQ
	bamkd/d37TCjkZqbt+64nVwHpWY4dnuisTwSZgp5K/NCPYQyPsA==
X-Received: by 2002:a05:6830:440c:b0:862:a53e:6f5f with SMTP id 46e09a7af769-862f09325f7mr2471809a34.11.1795010459743;
        Wed, 18 Nov 2026 06:00:59 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:f905:f7ea:fbfe:90c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f0212ea3sm2142174a34.17.2026.11.18.06.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:00:58 -0800 (PST)
Date: Wed, 18 Nov 2026 08:00:54 -0600
From: Corey Minyard <corey@minyard.net>
To: Mason Huo <mason.huo@starfivetech.com>,
	Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net
Subject: Re: [PATCH vV 2/2] ipmi: add StarFive KCS BMC driver
Message-ID: <av2vluKBBHXATu07@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20261118062526.1436893-1-mason.huo@starfivetech.com>
 <20261118062526.1436893-3-mason.huo@starfivetech.com>
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
In-Reply-To: <20261118062526.1436893-3-mason.huo@starfivetech.com>

Adding Andrew, hopefully he's still available to review.

A few questions inline, but I don't see any big issues in first
review.

-corey

On Wed, Nov 18, 2026 at 02:25:26PM +0800, Mason Huo wrote:
> This driver exposes the Keyboard Controller Style (KCS) interface on
> StarFive SoCs as a character device. Such SOCs are commonly used
> as a BaseBoard Management Controller (BMC) on a server board, and KCS
> interface is commonly used to perform the in-band IPMI communication
> between the server and its BMC.
> 
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  MAINTAINERS                          |   6 +
>  drivers/char/ipmi/Kconfig            |  15 ++
>  drivers/char/ipmi/Makefile           |   1 +
>  drivers/char/ipmi/kcs_bmc_starfive.c | 311 +++++++++++++++++++++++++++
>  4 files changed, 333 insertions(+)
>  create mode 100644 drivers/char/ipmi/kcs_bmc_starfive.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccbcdc0799b9..b238fc730c51 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26923,6 +26923,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
>  F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
>  
> +STARFIVE KCS-BMC DRIVER
> +M:	Mason Huo <mason.huo@starfivetech.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
> +F:	drivers/char/ipmi/kcs_bmc_starfive.c
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 538a7d3c65bf..8b51e67d3ac4 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -149,6 +149,21 @@ config NPCM7XX_KCS_IPMI_BMC
>  	  This support is also available as a module.  If so, the module
>  	  will be called kcs_bmc_npcm7xx.
>  
> +config STARFIVE_KCS_IPMI_BMC
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select IPMI_KCS_BMC
> +	select MFD_SYSCON
> +	tristate "StarFive KCS IPMI BMC driver"
> +	help
> +	  Provides a driver for the KCS (Keyboard Controller Style) IPMI
> +	  interface found on StarFive SoCs.
> +
> +	  The driver implements the BMC side of the KCS controller, it
> +	  provides the access of KCS IO space for BMC side.
> +
> +	  This support is also available as a module.  If so, the module
> +	  will be called kcs_bmc_starfive.
> +
>  config IPMI_KCS_BMC_CDEV_IPMI
>  	depends on IPMI_KCS_BMC
>  	tristate "IPMI character device interface for BMC KCS devices"
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index 4ea450a82242..800d570dd4dc 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -27,5 +27,6 @@ obj-$(CONFIG_IPMI_KCS_BMC_CDEV_IPMI) += kcs_bmc_cdev_ipmi.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
>  obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
>  obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
> +obj-$(CONFIG_STARFIVE_KCS_IPMI_BMC) += kcs_bmc_starfive.o
>  obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
>  obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
> diff --git a/drivers/char/ipmi/kcs_bmc_starfive.c b/drivers/char/ipmi/kcs_bmc_starfive.c
> new file mode 100644
> index 000000000000..bff7bdd5ad1c
> --- /dev/null
> +++ b/drivers/char/ipmi/kcs_bmc_starfive.c
> @@ -0,0 +1,311 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +
> +#include "kcs_bmc_device.h"
> +
> +#define DEVICE_NAME		"starfive-kcs-bmc"
> +
> +/*
> + * Every SIO block of the SoC provides KCS_CHANNELS_PER_SIO KCS channels, each
> + * occupying a KCS_CHANNEL_STRIDE byte register window, starting at offset
> + * KCS_CHANNEL_BASE of the SIO register space.
> + */
> +#define KCS_CHANNELS_PER_SIO	4
> +#define KCS_CHANNEL_BASE	0x200
> +#define KCS_CHANNEL_STRIDE	0x100
> +#define KCS_SIO_MAX		2
> +
> +#define KCS_DO			0x0
> +#define KCS_DI			0x4
> +#define KCS_STS			0x8
> +
> +#define KCS_INT			0xc
> +#define   KCS_INT_IBF_EN	BIT(0)
> +#define   KCS_INT_IBF_STS	BIT(1)
> +
> +struct starfive_kcs_bmc {
> +	struct kcs_bmc_device kcs_bmc;
> +	struct regmap *map;
> +	/* Protects ie_en and serialises every write to KCS_INT */
> +	spinlock_t ie_lock;
> +	/* Shadow of the KCS_INT enable bits, restored after eSPI bus reset */
> +	u32 ie_en;
> +};
> +
> +static inline struct starfive_kcs_bmc *
> +to_starfive_kcs_bmc(struct kcs_bmc_device *kcs_bmc)
> +{
> +	return container_of(kcs_bmc, struct starfive_kcs_bmc, kcs_bmc);
> +}
> +
> +static u8 starfive_kcs_inb(struct kcs_bmc_device *kcs_bmc, u32 reg)
> +{
> +	struct starfive_kcs_bmc *priv = to_starfive_kcs_bmc(kcs_bmc);
> +	u32 val = 0;
> +	int rc;
> +
> +	rc = regmap_read(priv->map, reg, &val);
> +	WARN(rc != 0, "regmap_read() failed: %d\n", rc);

The WARNs here seem a little heavy, but there is precedent, so I'm ok
with it.

You probably want to print the register, though, on all of these.

> +
> +	return rc == 0 ? (u8)val : 0;
> +}
> +
> +static void starfive_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
> +{
> +	struct starfive_kcs_bmc *priv = to_starfive_kcs_bmc(kcs_bmc);
> +	int rc;
> +
> +	rc = regmap_write(priv->map, reg, data);
> +	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
> +}
> +
> +static void starfive_kcs_updateb(struct kcs_bmc_device *kcs_bmc,
> +				 u32 reg, u8 mask, u8 data)
> +{
> +	struct starfive_kcs_bmc *priv = to_starfive_kcs_bmc(kcs_bmc);
> +	int rc;
> +
> +	rc = regmap_update_bits(priv->map, reg, mask, data);
> +	WARN(rc != 0, "regmap_update_bits() failed: %d\n", rc);
> +}
> +
> +/*
> + * Write the shadow of the enable bits to KCS_INT. KCS_INT_IBF_STS is a
> + * read-only mirror of the IBF flag in KCS_STS, which the hardware clears
> + * once KCS_DI has been read, so only the enable bits are ever written.
> + */
> +static void starfive_kcs_write_ie(struct starfive_kcs_bmc *priv)
> +{
> +	int rc;
> +
> +	lockdep_assert_held(&priv->ie_lock);
> +
> +	rc = regmap_write(priv->map, KCS_INT, priv->ie_en);
> +	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
> +}
> +
> +static void starfive_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc,
> +					 u8 mask, u8 state)
> +{
> +	struct starfive_kcs_bmc *priv = to_starfive_kcs_bmc(kcs_bmc);
> +	unsigned long flags;
> +
> +	/* The hardware has no OBE interrupt */
> +	if (!(mask & KCS_BMC_EVENT_TYPE_IBF))
> +		return;
> +
> +	spin_lock_irqsave(&priv->ie_lock, flags);
> +	if (state & KCS_BMC_EVENT_TYPE_IBF)
> +		priv->ie_en |= KCS_INT_IBF_EN;
> +	else
> +		priv->ie_en &= ~KCS_INT_IBF_EN;
> +	starfive_kcs_write_ie(priv);
> +	spin_unlock_irqrestore(&priv->ie_lock, flags);
> +}
> +
> +static void starfive_kcs_hw_init(struct starfive_kcs_bmc *priv)
> +{
> +	unsigned long flags;
> +
> +	/* Restore the enables, e.g. after an eSPI bus reset */
> +	spin_lock_irqsave(&priv->ie_lock, flags);
> +	starfive_kcs_write_ie(priv);
> +	spin_unlock_irqrestore(&priv->ie_lock, flags);
> +}
> +
> +static irqreturn_t starfive_kcs_irq(int irq, void *arg)
> +{
> +	/* The interrupt deasserts once the client has read IDR */
> +	return kcs_bmc_handle_event(arg);
> +}
> +
> +/*
> + * "espi_rst" is a dedicated interrupt line which carries a single event: the
> + * host has de-asserted the eSPI bus reset of the SIO block this channel
> + * belongs to. The line is requested with IRQF_SHARED only because every
> + * function of that SIO block (KCS, BT, mailbox, ...) listens to the same
> + * event and has to reprogram its own registers when it fires. It is not
> + * shared with unrelated interrupt sources and there is no per-function
> + * status bit to test, so each occurrence is relevant to all handlers and is
> + * claimed unconditionally. Rewriting KCS_INT from the shadow is idempotent.
> + */
> +static irqreturn_t starfive_espi_rst_deassert_irq(int irq, void *arg)
> +{
> +	struct kcs_bmc_device *kcs_bmc = arg;
> +	struct starfive_kcs_bmc *priv = to_starfive_kcs_bmc(kcs_bmc);
> +

I'm not sure what the hardware does, just making sure you don't want
to set ie_en to zero or something here.

> +	starfive_kcs_hw_init(priv);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int starfive_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
> +				   struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int rc, irq;
> +
> +	irq = platform_get_irq_byname(pdev, "kcs");
> +	if (irq < 0)
> +		return irq;
> +
> +	rc = devm_request_irq(dev, irq, starfive_kcs_irq, 0,
> +			      dev_name(dev), kcs_bmc);
> +	if (rc < 0)
> +		return dev_err_probe(dev, rc,
> +				     "Unable to request kcs IRQ %d\n", irq);
> +
> +	irq = platform_get_irq_byname(pdev, "espi_rst");
> +	if (irq < 0)
> +		return irq;
> +
> +	rc = devm_request_irq(dev, irq, starfive_espi_rst_deassert_irq,
> +			      IRQF_SHARED | IRQF_TRIGGER_RISING,
> +			      dev_name(dev), kcs_bmc);
> +	if (rc < 0)
> +		return dev_err_probe(dev, rc,
> +				     "Unable to request espi reset IRQ %d\n", irq);
> +
> +	return 0;
> +}
> +
> +static const struct kcs_bmc_device_ops starfive_kcs_ops = {
> +	.irq_mask_update = starfive_kcs_irq_mask_update,
> +	.io_inputb = starfive_kcs_inb,
> +	.io_outputb = starfive_kcs_outb,
> +	.io_updateb = starfive_kcs_updateb,
> +};
> +
> +/*
> + * The channel number is not described in the devicetree, it follows from the
> + * position of the channel in the SIO block and from the id of that block.
> + */
> +static int starfive_kcs_of_get_channel(struct device *dev, u32 *chan)
> +{
> +	struct device_node *np = dev->of_node;
> +	u32 sio_id, idx;
> +	u64 offset;
> +	int rc;
> +
> +	struct device_node *sio __free(device_node) = of_get_parent(np);
> +
> +	/* Don't translate the address, the offset in the SIO block is wanted */
> +	rc = of_property_read_reg(np, 0, &offset, NULL);
> +	if (rc)
> +		return rc;
> +
> +	if (offset < KCS_CHANNEL_BASE ||
> +	    offset >= KCS_CHANNEL_BASE + KCS_CHANNELS_PER_SIO * KCS_CHANNEL_STRIDE ||
> +	    offset % KCS_CHANNEL_STRIDE)
> +		return -EINVAL;
> +
> +	idx = ((u32)offset - KCS_CHANNEL_BASE) / KCS_CHANNEL_STRIDE;
> +
> +	rc = of_property_read_u32(sio, "starfive,sio-id", &sio_id);
> +	if (rc)
> +		return rc;
> +
> +	if (sio_id >= KCS_SIO_MAX)
> +		return -EINVAL;
> +
> +	*chan = sio_id * KCS_CHANNELS_PER_SIO + idx;
> +
> +	return 0;
> +}
> +
> +static int starfive_kcs_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct starfive_kcs_bmc *priv;
> +	struct kcs_bmc_device *kcs_bmc;
> +	u32 chan;
> +	int rc;
> +
> +	rc = starfive_kcs_of_get_channel(dev, &chan);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "Unable to determine the channel\n");
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->ie_lock);
> +
> +	priv->map = device_node_to_regmap(dev->of_node);
> +	if (IS_ERR(priv->map))
> +		return dev_err_probe(dev, PTR_ERR(priv->map),
> +				     "Couldn't get regmap\n");
> +
> +	kcs_bmc = &priv->kcs_bmc;
> +	kcs_bmc->dev = dev;
> +	kcs_bmc->channel = chan;
> +	kcs_bmc->ioreg.idr = KCS_DI;
> +	kcs_bmc->ioreg.odr = KCS_DO;
> +	kcs_bmc->ioreg.str = KCS_STS;
> +	kcs_bmc->ops = &starfive_kcs_ops;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	starfive_kcs_hw_init(priv);
> +	rc = starfive_kcs_config_irq(kcs_bmc, pdev);
> +	if (rc)
> +		return rc;

Can order matter here?  Can an interrupt come in between the above
and below calls?

> +
> +	rc = kcs_bmc_add_device(kcs_bmc);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "Failed to register channel %u\n",
> +				     kcs_bmc->channel);
> +
> +	dev_dbg(dev, "Channel=%u idr=0x%x odr=0x%x str=0x%x\n", chan,
> +		kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr, kcs_bmc->ioreg.str);
> +
> +	return 0;
> +}
> +
> +static void starfive_kcs_remove(struct platform_device *pdev)
> +{
> +	struct starfive_kcs_bmc *priv = platform_get_drvdata(pdev);
> +	struct kcs_bmc_device *kcs_bmc = &priv->kcs_bmc;
> +
> +	kcs_bmc_remove_device(kcs_bmc);
> +
> +	starfive_kcs_irq_mask_update(kcs_bmc,
> +				     (KCS_BMC_EVENT_TYPE_IBF |
> +				      KCS_BMC_EVENT_TYPE_OBE),
> +				     0);

Would order matter in the above two?  Can an interrupt come in after
the BMC has been removed?

Also, starfive_espi_rst_deassert_irq()?

> +}
> +
> +static const struct of_device_id starfive_kcs_bmc_match[] = {
> +	{ .compatible = "starfive,jhb100-kcs-bmc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, starfive_kcs_bmc_match);
> +
> +static struct platform_driver starfive_kcs_bmc_driver = {
> +	.driver = {
> +		.name		= DEVICE_NAME,
> +		.of_match_table	= starfive_kcs_bmc_match,
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe	= starfive_kcs_probe,
> +	.remove	= starfive_kcs_remove,
> +};
> +module_platform_driver(starfive_kcs_bmc_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Mason Huo <mason.huo@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive device interface to the KCS BMC device");
> -- 
> 2.50.1
> 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827335;
	b=5Azp7163SUaPr64+gyF292DmiACURD59xIv7Xr81mlPMArv63RkPzdZytYcK8mtfcJvi
	 GGG5LRvU9BClBStmHRFSne8PaEkMMGwqNn+nGCx6/Juo2V6QJkHrQZ7pwrZ0ibNZtHYFw
	 6ko67+MH9RDXCof/b1U3P1zB3svLyVqotHjz7Kgv/ER51oxIoC8NV8nrquj99nXPaCS53
	 qiHlljVHcn1ZaqawzLzwGhMzrqNaUz1MI0chPDpUe6DnOmPdDEC7/JzL1j1GN49HkESYH
	 yDCbzi2uRaNAa7jbgTSUrqt2+CwVNxwR+nVh9BpEs39N4soWaVrt/oFFXPszCwTeXmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xCV27pca+nLYEXCVx4Sr4Tceub1iz4rFNRNzljRO58U=;
	b=5U1GUv+fMM/xPK/vUtVNZuctvWX+1NpYm1icu6wQ0RxKSIti/aysaTPUAtY8LUXScrPQ
	 0RMmTaAk2Htif9lxyjM0fB+WQ/jDJwJbQAXvephP5Inw2qDY1P9k7w2YzmUd8dhepv1Ua
	 jNUigrKyA0prUbUvDAcK3KMBqFjBHJ7bGr3eOkVxDAv7XL8PTW2LDJY7+xLdqlvbJoJ8b
	 ++EN8g1RGmADdgLP6ZG55KR95XroyAc0Ts9BcbFhG9uO0QbLr02B5qow62wZJEua1c59K
	 D6QZfh/fFm/jPaLMV/vtLU2pP8H0hoLSF9WzlIC1vP7LOFUliJhEDwnITu6pXmV4oLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SzQDqCQG;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25383606B2ED
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 21:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25383606B2ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SzQDqCQG
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6ddef424972so942384eaf.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 13:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793827334; x=1794432134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCV27pca+nLYEXCVx4Sr4Tceub1iz4rFNRNzljRO58U=;
        b=SzQDqCQGt0ejlw1eRo4ABndt6nog5sseF9ciZHEaxzKKSFDZDpMPp3ZtlNPpu9OnYz
         6Qyz+O036lOsSPOmWVSpA67sHo/Q3ecxIaDRUtOdjCJrZaRJCwy8r76WB1ioPquL37DA
         GRuKW6ZlWlIE9lwO0EKbZEqxaQ58y36OJwiZhvOu411qfDkNR06bNcXaY0hakWeJ1R2r
         QZT02c35GPFXJ69lASU83xa/YyO1erwQcmgOZre3P7AKfcJ31HLdo7YEDPAUdXM4MnDE
         AUfbKuSp8slBWExrEa2pkliXR1XZOJFqKpFT0V9G7G7awH2sOz1LRCLvX8fwGlH0I9K6
         9wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827334; x=1794432134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCV27pca+nLYEXCVx4Sr4Tceub1iz4rFNRNzljRO58U=;
        b=HfViQzrVpThLaBVU/B4NXYJNMmSfJdVWBXHG5WLUUcnpITuEIE87J+gI3WnSVWmkXI
         bGbYn7MMSenBPaBoRq6JZegvcwSpzWdCPrYJ4xcN8OY0TE3m+/BtSDo0u6HgBlePJ8D5
         nKMeR7T4MwRJfWdbGLC0cdvukJcRjkS5YOzId9PSj9OlhI2AsX/50u4Wo8CD3rA2VJ81
         IQaezKmv+FHjOym0CCI164WHuNIuo8D1Bc3kLfM264axOlaoC9wZN6+HGpZLnSbSJnwv
         h8n2znZcQoYHsBW5pWFcOl1Lxby/I0qbkyWeC+2hZNTn5PBEOXB1tQW72LMhgdC8Yk92
         nJ7A==
X-Gm-Message-State: APuU4Z+FMSgiT+cPbQXY/fVNHltUzAnVwE1FSjvXlcGGByrccISLV042
	soN1WUlh+ZXrmBd+FtC6yqaAL5wM7mKWdF0T0hmItHm63A4HM/opBUH5zAGA+NV44eZGX8GqqYw
	MpSGN7TY=
X-Gm-Gg: AYBFou322yo730mtE8ReQCVT6M6fOZiYjxg5/0IkKhm1r2OrJ+Oh25i33Wg9a5SpaA8
	MWdpd83fiRpdzHMPaji4+Olo5AfjHneoegIi9fchkh54eZ6R3T2ll2CEyU/0WQu/YbMobPjM+Wi
	AZknEoR/hipFVp/HDZZvDI9ekJckkRRK55ahabMiAgBd6Nf1bP+ZLYGusLNEjD85KZkkXIwz/vl
	oY5Jo5d4CQ58nu15F4dFCvhp8NwIb9Z+9lfv9wHy1VxjkYTbiaezDL1wW93Ho98BWPZUBv/qkkt
	go8LaalX4AUqMVCi0M1vbEvKSY04IzUiWdGrzJVTrs3wegWGipZ8b0ltDRu3ZRIuycpo9z+dBLl
	H/fwGEkPWSFGxLlf2aDqcb6g4WOQyJnYHanJvhzl4j10Y135u9CZXZipPGv0KzVa0wKBtoAJ/Bi
	OgHdj2HoNUnY85H9YV8Btc0cMgvmiWsoyop/i1Fr/WvZfkpQoI8vlB6q0mEsqdkHY4UBtYAjMlr
	5WN42yBOGwCqWMviNbXgENz6jHsuHOUY4qfBNYpEXGM+3/4DWpAliATm3DuJ7JZkBH76U3FKFwy
	l/3FDLo1qybq5GP+00wMuG6F8TLXjgMUQ8FkXLIFOtzrQuHiRw==
X-Received: by 2002:a05:6820:740c:b0:716:bbec:d300 with SMTP id 006d021491bc7-716bbecebcamr2303942eaf.47.1793827333868;
        Wed, 04 Nov 2026 13:22:13 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61d382sm2928188fac.13.2026.11.04.13.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 13:22:13 -0800 (PST)
Message-ID: <297312cc-8397-4a4f-b8cd-c28c574f8b03@riscstar.com>
Date: Wed, 4 Nov 2026 15:22:12 -0600
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
Subject: Re: [PATCH 2/4] soc: toshiba: tc9564: add a new syscon driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-3-elder@riscstar.com>
 <sashiko-outbox-196324@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-196324@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 6:50 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] soc: toshiba: SOC_TOSHIBA_TC9564_SYSCON depends on hidden MFD_CORE

I explain more below, but I do not plan to act on the above issue.

> - [Low] soc: toshiba: MFD driver calling devm_mfd_add_devices() outside drivers/mfd/

And I don't plan to act on this one either.

> - [Low] soc: toshiba: Kconfig help and commit message mismatch tc9564-syscon.c

I will do a minor rewording to address this one.

> --
> 
> commit 0d303444d1af16f91e36247fd63b0cb020f8be95
> Author: Alex Elder <elder@riscstar.com>
> 
> soc: toshiba: tc9564: add a new syscon driver
> 
> This commit introduces a platform driver for the Toshiba TC9564 config
> system controller, registering MFD child devices for the chip's clock
> and reset controllers.
> 
>> diff --git a/drivers/soc/toshiba/Kconfig b/drivers/soc/toshiba/Kconfig
>> new file mode 100644
>> index 0000000000000..91adcbe71905c
>> --- /dev/null
>> +++ b/drivers/soc/toshiba/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config SOC_TOSHIBA_TC9564_SYSCON
>> +	tristate "Toshiba TC9564 config system controller support"
>> +	depends on TC9564_PCI
>> +	depends on MFD_CORE
>> +	default TC9564_PCI
> 
> [Severity: Medium]
> Should SOC_TOSHIBA_TC9564_SYSCON use "select MFD_CORE" instead of
> "depends on MFD_CORE"?

I would have used "select", however that leads to a recursive Kconfig
dependency:

error: recursive dependency detected!
	symbol SOC_TOSHIBA_TC9564_SYSCON depends on TC9564_PCI
	symbol TC9564_PCI depends on PCI_DYNAMIC_OF_NODES
	symbol PCI_DYNAMIC_OF_NODES depends on OF_IRQ
	symbol OF_IRQ depends on IRQ_DOMAIN
	symbol IRQ_DOMAIN is selected by MFD_CORE
	symbol MFD_CORE is selected by SOC_TOSHIBA_TC9564_SYSCON

Using "depends on" does not exhibit that circular dependency.

So unless someone suggests a better way to fix this, I will keep
this as-is.

> In drivers/mfd/Kconfig, MFD_CORE is a promptless helper symbol with
> "default n":
> 
>      config MFD_CORE
>          tristate
>          select IRQ_DOMAIN
>          default n
> 
> When a kernel configuration enables CONFIG_TC9564_PCI without any
> unrelated MFD driver that selects MFD_CORE, the dependency on MFD_CORE
> remains unmet and SOC_TOSHIBA_TC9564_SYSCON cannot be enabled.
> Similarly, if TC9564_PCI is built-in (y) and only modular drivers select
> MFD_CORE, SOC_TOSHIBA_TC9564_SYSCON is restricted to modular (m).
> 
>> +	help
>> +	  This enables support for the config system controller for the
>> +	  TC9564 SoC.  It implements an MMIO regmap to manage access to
>> +	  two pages of I/O memory, and serves as a clock and reset
>> +	  controller for IP blocks within the chip.
> 
> [Severity: Low]
> Does this help text (and the commit message) accurately describe what
> drivers/soc/toshiba/tc9564-syscon.c implements?

Generally, I think it does.  It talks about clock and reset,
which are presented as provided by the system controller, even
though the actual drivers for that functionality is implemented
separately (and activated with entries in an MFD cell table).
The regmap gets created automatically.

> In tc9564_config_syscon_probe(), the driver only calls
> devm_mfd_add_devices() to register the toshiba-tc9564-clock and
> toshiba-tc9564-reset MFD cells; it does not set up an MMIO regmap (nor
> does SOC_TOSHIBA_TC9564_SYSCON select MFD_SYSCON) or implement the clock
> and reset controller providers itself. Could the help text and commit
> description be updated to reflect that this driver instantiates the
> clock and reset child devices?

It could.  I'll plan to add a sentence to this effect when I
post version 2 of the series.

> [ ... ]
> 
>> diff --git a/drivers/soc/toshiba/tc9564-syscon.c b/drivers/soc/toshiba/tc9564-syscon.c
>> new file mode 100644
>> index 0000000000000..0d0e2422b82d0
>> --- /dev/null
>> +++ b/drivers/soc/toshiba/tc9564-syscon.c
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/device-id/of.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +static const struct mfd_cell tc9564_config_syscon_cells[] = {
>> +	MFD_CELL_NAME("toshiba-tc9564-clock"),
>> +	MFD_CELL_NAME("toshiba-tc9564-reset"),
>> +};
>> +
>> +static int tc9564_config_syscon_probe(struct platform_device *pdev)
>> +{
>> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				    tc9564_config_syscon_cells,
>> +				    ARRAY_SIZE(tc9564_config_syscon_cells),
>> +				    NULL, 0, NULL);
>> +}
> 
> [Severity: Low]
> Since tc9564_config_syscon_probe() in drivers/soc/toshiba/tc9564-syscon.c
> is purely an MFD driver calling devm_mfd_add_devices() to register child
> devices, should this driver be placed under drivers/mfd/ rather than
> drivers/soc/toshiba/ (with an "mfd: tc9564: ..." commit subject prefix)
> to follow MFD subsystem placement conventions?
It could be, and that's where I had it originally.  I moved it
under drivers/soc/toshiba based on a comment from Conor Dooley.
Under drivers/soc I find 7 C files that call devm_mfd_add_devices()
(although it is true that almost half of the C files under drivers/mfd
call that function).

This driver has the same basic--trivial--structure as five other
drivers under drivers/soc/*/*.c, so I plan to keep the code where
it is.

					-Alex

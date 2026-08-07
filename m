Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E03DB31E
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091841; cv=none; b=ItovprSoT9re9quTqVGfeD53i2QX5ufXskni6CPYyfBeXsf/dDugEYb7WP0QBQbJWtW9XuLVYZeYrhs2zRW83AMImkwGU6c6RkqFz+qEwubGR8HLZP8hHpVOeCjU2JC6zm9ezGj1EASjTKX12vMs3Ny3Xjy0vQ9AnNxfMd/D/aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091841; c=relaxed/simple;
	bh=5Wtm4+fC2TDCkZjPl5iY3esbeKwy0U6HWjzwFQYdxgM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bnE+m+9Di0r1eiyBXfEZwdevRdmCvyoJUJfhD2Y2FbP7R+UC7DGjDV0epVhZ8CXwMfomXAkrug7LW1j/ouuamy7opjjDVzZ5ZnVoO/cAsAK2xkzf8i/SxwR05kXfjxC46BxWGCXCF9fMz0TkOo6vs/9STfDk7TN/ov/xDUTo5D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=d5I1Mzzp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="d5I1Mzzp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495437bb891so16209225e9.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091837; x=1786696637; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7xmdghfSgadBkY6GVQoxPAoUuT5sReEQgJK7Tv/QlXE=;
        b=d5I1MzzpS+Ao+pzGY6TTAP1E78jHPASz3gysSy0m9bzAU7Ziw6uU/A93Cf/TdxpDwC
         34ZeXL2SxfYmfmDkaVWTzSiHVCwX6orEs6GKXMviSFanvl49dcjs37rUkFpk3P0VoY4Q
         2H2pJA0eH4VTyV3LzRZQS1Ozev6/oXl9+fs/g4adCwE/Lva7kKfSsu21tkxNwnzJLj+R
         JOaBa11fqT5G6RyjTt6avVnwKT5RQ2zffKpypR0ekhkZ9UHNyPFT94YTCNWiYrNqSLO9
         CMVtYzHN2TXWOWBEJf8VCB/OuN8R0dHlTZANvmUu0OClO7WZxgukYZzml0G8RRJSjKX2
         WuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091837; x=1786696637;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xmdghfSgadBkY6GVQoxPAoUuT5sReEQgJK7Tv/QlXE=;
        b=ZyQKHHRY41a70U/ERqgOKt78uu6hTTb/epWA42DQ7giguGLPxkXa4mt2Vo3DwcxLl0
         ifL98XPxBm8TujlQrzlx7WgxtNP+wioyhIEwgrKOg0ks8ArZspp86U7rb5rqIkYgVwO8
         22VnxmYUeGPYqG248n2Y5RQ6Z+2zluljz1FKbhns95nYCo6gzxCBGyIaW3tsvGkRcg6+
         ULnNSKULc/3U65QwTDZqlCfkNrkivaDaP03q/QtFQMJmMg0I/xA08EjPv4I61Vv3vdwi
         ij+PpyuGWf2Mf/I++NbmApX9pyVL81u5XsmSDpVDPTHe9+8AhFDdi/3QFaEJjpAqSN/A
         iJCg==
X-Forwarded-Encrypted: i=1; AHgh+RrhfjD58e5vZAOOL4PC0IJJbB6SpaoQqkq383rZMSTo0Bzwq0PKfg4/VigZQc0YOJ8iyDWVPlWFB/da@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx1cWXMcIXGcKeibfwjDlEJisIVGnUeJxMZEQ1AOUI9ZKQE53o
	sh3lzxkbs9ITqiexkJz6ZXRpuVgOBQpeQOufMoBMoJF1TyiH8qwdulIcVyMYZBbWQ+Q=
X-Gm-Gg: AR+sD119Lp8oxW3bziXrYciqpKApPihf4nE72kOsN2FQA1LM6G0HkMEMdrnZpqmq+No
	Q97AjkaOBHHncv7LAtsWdmZ0naDE4H/Wv8YqW4akrMPwzHEFFNmMFV4oTdGKGmlXI2ZE5fqYog7
	VauJEMjMZpjTGnTHpfNpACMMC/CcS7uQgeFMcKB6/3/LrmyOC40Da996Z88E9o2DRpD47JrQIwY
	Izl1Woj+r8QHtx2uoAB3C+JnEMLnLB3+/uXJvAyLMAMrYo/KDIa78o9XlQ9X1AzeJhIFFOyHsx7
	n2Hqpa0ksQjm+zyLD3dHrz8PqiPb3FlwwaCk354poMG7sG7/1wknManFtvQvEhHeaNKsMXD3oH7
	l2bWV3ng5yYq+Vuz5Y5lwD9eTObd2qgyeUwz+Dwh27st6sQec6c+pL7SsL1c9cKVssbsTGrS+qX
	MVPNDEN+cPM3rKEeSB+KojPzpzM2+TkO3mwbSOT3IJuAqM8iUwFxNN56ffvYZOSFV4Ve3gF/I7h
	uLy/BSUhw==
X-Received: by 2002:a05:600c:42d4:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49959fddc5emr56438565e9.1.1786091836967;
        Fri, 07 Aug 2026 01:37:16 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device
 driver
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182923.193353.7287772568467157519.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=5887;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=5Wtm4+fC2TDCkZjPl5iY3esbeKwy0U6HWjzwFQYdxgM=;
 b=BYG8RuH2of4Gbb/wv8dafAtCnP3l9bAcx9jDlUpTUBOYFB1rnN5jJmZOKiXGTGs9fny/HkoHX
 tn9LiVn8tDnCAFLsuoN9DwifuoFqneYc0Efq2nsAEZ61Cjw8cXEYapH
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

> Add support for UART over PCIe between ASPEED
> AST2600 BMC and host.
> This is the host-side driver.
> 
> Based on ASPEED 6.18 Kernel SDK and trimmed down
> and changed to MFD driver.

This doesn't seem to be aligned (72/75 chars per line).

> 
> The AST2600 has two 8250-compatible register set usable over PCIe.
> These act as two UARTs. As there is only a FIFO internally between both
> ends, they are called Virtual UARTs. This patch adds both VUARTs as
> plat_serial8250_port. This is the core driver in charge of setting up
> MSI interrupts. It doesn't bind the whole PCIe resource to allow each
> sub-driver to bind the needed addresses.
> 
> This is not added as a PCI 8250 UART device, but as a MFD driver, as this
> host driver can be expanded upon for IPMI over KCS. It can also be used
> in the future for custom BMC<->host communication with shared memory and
> doorbell.
> 
> This host module should be the entry point for setting up all features
> related to an AST2600 present on the PCI bus.
> 
> Notes on the implementation:
> The host can't detect the VUART addresses, so they are forced to
> 0x3f8 and 0x2f8, as in the initial ASPEED driver.
> 
> The MSI vector index of VUART2 has been changed from 15 to 17.
> The index 15 used in the initial driver was not working.
> 
> Tested:
> Data path in both direction is tested on both VUARTs.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a9..33a0351819e6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4011,6 +4011,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/crypto/aspeed,*
>  F:	drivers/crypto/aspeed/
>  
> +ASPEED PCI BMC DEVICE DRIVER
> +M:	Grégoire Layet <git@gregoirelayet.com>
> +M:	Tan Siewert <tan.siewert@9elements.com>
> +S:	Maintained
> +F:	drivers/mfd/aspeed-pci-core.c
> +
>  ASPEED PECI CONTROLLER
>  M:	Iwona Winiarska <iwona.winiarska@intel.com>
>  L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 763ce6a34782..dd780f72d169 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2573,5 +2573,17 @@ config MFD_MAX7360
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_ASPEED_PCI_BMC_DEVICE
> +	tristate "ASPEED BMC PCIe device"
> +	depends on PCI
> +	select MFD_CORE
> +	help
> +	  Host-side driver for the ASPEED AST2600 BMC PCIe device found on
> +	  BMC expansion cards. Exposes two 8250-compatible VUART
> +	  ports.
> +
> +	  If unsure, say N. Choose M here if this machine has an
> +	  AST2600-based BMC expansion card on its PCIe bus.
> +
>  endmenu
>  endif
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index dd4bb7e77c33..a364b1b5936b 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -303,3 +303,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
>  obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
>  
>  obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
> +
> +obj-$(CONFIG_MFD_ASPEED_PCI_BMC_DEVICE)	+= aspeed-pci-core.o
> diff --git a/drivers/mfd/aspeed-pci-core.c b/drivers/mfd/aspeed-pci-core.c
> new file mode 100644
> index 000000000000..ad6732133ec5
> --- /dev/null
> +++ b/drivers/mfd/aspeed-pci-core.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (C) ASPEED Technology Inc.
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/pci.h>
> +#include <linux/serial_8250.h>
> +#include <linux/mfd/core.h>
> +
> +#define ASPEED_BMC_MULTI_MSI		32
> +#define ASPEED_BMC_PCI_DEVICE_ID	0x2402
> +#define ASPEED_BMC_REVISION_AST2700	0x27
> +#define ASPEED_BMC_VUART		2
> +
> +#define DRIVER_NAME "ast2600-pci-core"
> +
> +static const unsigned int vuart_msi_index[ASPEED_BMC_VUART] = { 16, 17 };
> +static const u16 vuart_port_addr[ASPEED_BMC_VUART] = { 0x3f8, 0x2f8 };
> +
> +struct aspeed_pci_bmc_dev {
> +	struct plat_serial8250_port uart[ASPEED_BMC_VUART + 1];
> +	struct mfd_cell cell;
> +};
> +
> +static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev,
> +					     struct aspeed_pci_bmc_dev *pci_bmc_dev)
> +{
> +	resource_size_t bar = pci_resource_start(pdev, 1);
> +	struct plat_serial8250_port *port;
> +	u16 vuart_ioport;
> +	unsigned int i;
> +
> +	for (i = 0; i < ASPEED_BMC_VUART; i++) {
> +		port = &pci_bmc_dev->uart[i];
> +
> +		/* ASPEED BMC device shift addresses by 2 to the left */
> +		vuart_ioport = vuart_port_addr[i] << 2;
> +
> +		port->mapbase = bar + vuart_ioport;
> +		port->uartclk = 115200 * 16;
> +		port->irq = pci_irq_vector(pdev, vuart_msi_index[i]);
> +		port->iotype = UPIO_MEM32;
> +		port->type = PORT_16550A;
> +		port->flags |= (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
> +		port->regshift = 2;
> +	}
> +
> +	pci_bmc_dev->cell = (struct mfd_cell) {
> +		.name		= "serial8250",
> +		.platform_data	= pci_bmc_dev->uart,
> +		.pdata_size	= sizeof(pci_bmc_dev->uart),
> +	};

In the commit message you're describing that the MFD driver will be used for
setting up MSI interrupts:
> It doesn't bind the whole PCIe resource to allow each sub-driver to bind the
> needed addresses.

But you're adding the UART devices here which now means that the core driver is
doing more than MSI interrupt init.

Suggestion from my side would be to have an array of `mfd_cell` where you define
which devices are part of the MFD, and your VUART lives in another driver.
See `ls2k-bmc-core` for example.

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

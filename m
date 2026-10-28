Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203145;
	b=GwcIaTMXwD5lLUb+RFp8x5hh5VSyOuu0866AFHK2j4aBDGSVbwMSQ0pYkLl2reTBxH0E
	 ViCCYF9JOgoeDxOwFrwEf6URTLxnkTYk9zb9KvdlGHmMEpwg1b4EmVyanUajweDA2g4ga
	 B4+HtIpmo0NrVNzlvsrYy8BpUEOaRz+sB4oRjig3IbrF09qHMUBWBvgCHMQKAYzMzsoD4
	 7ZNckuQHar+opqYQPGtbrUVrFIlgDr4Ib4LiK+OUExyEK3VgLlV045WH90BuDJMAfZsZL
	 GVdBdhwULiJUT+u1o4LCSqOcfd77GOIwR/0ucna9ApfhrpSJzn6hNeJkoyURuhHQ7Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203145;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=YWgUeaJf2DWMtO5OtY26DD5OBKRMrb2ceBSKZznY9xE=;
	b=r8Aen5cbNn+9fAhI24oQpE3E6hnbZ+10+rkjU2ywd4uMsxt+iLqvUiaPKGD7xb0Skw8C
	 u7tEuK7sGP3Bf+akELrpI0DJouTdXm3mZufwNR/nxS/jY6dNrUiVc2nFXuh/0yc2IBEl0
	 GXqPrlBwH+VCX5SIXZj+P6ytaNiJ9aWiUzC5SOSIYFsghS2M5VbUWYaZMbbMcmrzgHiXM
	 /Al7Bw124iFWt5ujliFz4GzPkEBQV03bvPoMDf/rH7dDckFd6q/++MBIial38xTfZd/by
	 aXP2qO3Qgd20U703WI6e4XessWeJCWNlfi7KIk20NXqTBHr9ZJNTvdAcdlBMQGepXOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Zht6+AaE;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBE260A2614
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EBE260A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Zht6+AaE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E5404E41361;
	Wed, 28 Oct 2026 15:58:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E23460769;
	Wed, 28 Oct 2026 15:58:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61D961032900F;
	Wed, 28 Oct 2026 16:58:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793203136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YWgUeaJf2DWMtO5OtY26DD5OBKRMrb2ceBSKZznY9xE=;
	b=Zht6+AaER41P+Lha/RQ/9DJXbsWHeq/QU5VFVtJMx+aB6DD2N3gOMRfQylUcsQf56bNEz+
	/kGU72iv9w51JO/ZVWQnj5zzu/KFHUI/j8u5elvtcO9A16JYZT3qIy1LK1DM1pVUnkRQO9
	4pR4tAh97HCyCes68zeInNj/FC14llaIEQzisSDV/yVVkzce7P1QNdNXaE+NlcFwzGCqdR
	rIo9u2eEs8+2UnJyWg70WYFc7eEwiYTAbNkysVPCOwp9qDSPL5pr9v2geGQjXUKw5LYToC
	Sj1+MyIdz9GAdC017kOBfigdc0c4MMPEPXKXaseuwvg4SCsXH4hTl2cVfQsVlw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/4] irqchip: add EyeQ5 PCIe MSI controller
Date: Wed, 28 Oct 2026 16:58:47 +0100
Message-Id: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3dTK1ELT+NziTF0Ls8REwxRTSwMzCxMloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loAfC1UJ20AAAA=
X-Change-ID: 20261028-eyeq5_msi-86aa1d590684
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello,

This series adds support for the MSI controller present in the
Mobileye EyeQ5 PCIe ports.

Although the driver uses the standard MSI library, the EyeQ5 hardware
has several specific features. First, each PCIe port has its own MSI
controller, which snoops the MSI write TLPs that the port receives. A
port supports a maximum of 4 MSI vectors, and the memory-region
property gives the base address of the doorbell window. In addition,
the GCSR mode selects the role: in root complex mode the driver
registers a PCI MSI parent, while in endpoint mode it registers a
platform MSI parent. The last specific point is that the driver uses
the snooper domain as a chained controller on one GIC interrupt.

The series adds the binding document, the irqchip driver, the EyeQ5
DTS changes, and the MAINTAINERS entry. In particular, the DTS changes
add the two MSI controllers to the EyeQ5 SoC.

I tested the series with two EyeQ5 SoCs connected by a PCIe link, with
one SoC acting as the host and the other as the endpoint. The
pci_endpoint_test kselftest passed the MSIX_TEST, MSI_TEST, and
DOORBELL_TEST cases.

Grégory

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Gregory CLEMENT (4):
      dt-bindings: interrupt-controller: add Mobileye EyeQ5 PCIe MSI controller
      irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI controller driver
      MIPS: dts: eyeq5: add MSI controllers
      MAINTAINERS: add EyeQ5 MSI controller entry

 .../interrupt-controller/mobileye,eyeq5-msi.yaml   | 120 ++++++
 MAINTAINERS                                        |   2 +
 arch/mips/Kconfig                                  |   1 +
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  30 ++
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-eyeq5-msi.c                    | 474 +++++++++++++++++++++
 7 files changed, 633 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261028-eyeq5_msi-86aa1d590684

Best regards,
--  
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309135;
	b=a8ucp0ZYS0U9tTLZVsc1G6nF0p8cIh20jDkZcJ9S4gyPkSJZoGwayC+1tNeFCtU6NW6C
	 F8+mI1MT2jJjv3y2DX/ksIGWepZtGQo+/CMdDDyDbOOZv2ukapZ0lNJvZW/JEX63/JR7U
	 Wx6s7lfxuOvq4o2cBWSs5HkESK5FsbCaIwiG/Za5eGbSxdmbmJWOPrVJw5LvPF8XQHzuA
	 VqWNP19F4652JzMbxdXPxM79wmtTGxN6jzo+7mPB5Z+q8FRpjoZCYaKVwaywKNXcA1UHZ
	 f96xR3E4/JbnZOQoi1lCypBsapUDxD85vKWt0ycanefSLMFja1mhbA9DwFnFlph3q4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309135;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
	b=1QmAy7CuCaLIWF+vHIsvudtUlFd5KATrPj6s7Q55yz8jsAYPm+0IV0GiCxnaUqMTdXoW
	 JPCPv5KzePjl2XWZ3w5KjNC5IlOevnSY/HqEQaijaWq7AeBT9SRybpBQCqg6OCXXr+Z0X
	 FC89aa7V68yU+HlhtMuYCTnryQb1qPYBlBNEP4GfQqnU6wNCs8UCYED0aVOerMZd9AQUS
	 CHRKi6AsJobJxly4W8vUaUh1q8GNVl+MmYOu6gTH0xVOeN9jB5eUuHcSsryoiOsub7LnR
	 dZgwPJEwpsLxJhVlU/ANGs6BpMKMmjEQi5S5PpeX+YcOXqME7b0Jx2ZDk7Wi5LkHFeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LqgpgvPg;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455B0606A325
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 455B0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LqgpgvPg
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so8993a12.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309134; x=1793913934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=sXuL7p50E1ca6a4TXo46CYT5gs3h+6y1eTXOAj4BihzbacVWzzP9neGSw57z8Yf6tA
         yNr1vdFdOGpuxXXvRuWckwE32wZyQGDZV/4BrwfYZHgHGNwkfoqxqD6qpE37ESskAd1M
         sxJVcF821FUWGfkMiUPSTQim8Txl7QkoF04ocTuA1SKlXUEOqfukxKSsw/7GOBwN7MFW
         JbVYPyA/E2L5smuvsX89+fLxJak3AbCJ/J8qa9kfVAvvM7IZSJg+5+526HiPl+tDAzSC
         v8+2UQmeewnv0D/f3cuTRRxC684ehqLVtfMrmq03m8GebT/1aT1EwtcS4HBvpovlP0kR
         VWhg==
X-Forwarded-Encrypted: i=1; AKwUvBzJ6swuCAmACSFqbzIiZ2Y40dlwyStj00TO7efH6kij/+wyCp2cwsY3KuutPcu1DfL/6hb1RIqjVYHz@vger.kernel.org
X-Gm-Message-State: AFq9FYLawc4bx+hgosMGpSodkVyxD6W858/bw/2m3zz/jYx1jVoFPtM3
	sY7KGnadVp9NKweZ9/hSLcw32hFrcfqbSpPsof4CJXpFdP2yxToW52NrtwQpuj6CZx/3WYg5MbM
	TvrnF2EBwKiCK0SQthc+BqvecXTrvArzNcObaNIn2RpZ2N30vOG3zBzvKrsqeyKV27Y4EedJLI0
	ivPYL9UR5eBmFkAY1GU+pf8/88RT6cRaY/Rraib1TIXurxhavDQyb/aZmzeRZgWjgxHd26U9MAC
	LHZoNqTCLzi9O2oB6QVfsLV
X-Gm-Gg: AYBFou1alGvOy1z4kLe5n3ac94azabwnBnsD1KpnyYXUWfaDDsPZyCz5oAszgvE+m9x
	V1BHNXY9BjZUG6WpNcozLphz9OAZw43pbZgc9dWNCLyUcNfKJ/9rDoxxmdy1YfpbLA80hLseFM8
	F6SqepvE5BzaCmzjuC9xAJuOZs0kuflOs9a7Bzmk/2EUbR1vvWHUx1jpfkyfgCuIzZ19ZHwVpO+
	jLma5LMJnXH6VNo0SmLdIKrTr7+JGf/Uw07vJsIg/sRVTnyoy+OMnNP3PN49/h0/JFuxJ1dhQ/j
	N6GL5qnW+FrWyzHkLeyG4V92b6DawkemAT+Wwq8VN+L0a5sA90xflt4JYAmViakLB/xP7VpPFic
	h8WOU4Hiaf+KAsH14kDce1O+OR/Kpkd5nCIN4bFCFIdoQ3elO4iYxcSbVVjZBgeRGh1NAP4Ns7o
	1ouPUlSqWdhP5t39CQCnN4BpNjnJZUPbBdvsG95ra2
X-Received: by 2002:a17:90b:2246:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3ae8957e270mr219574a91.2.1793309134455;
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae845baad9sm611809a91.5.2026.10.29.14.25.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917baea8e5dso1687696d6.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309133; x=1793913933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=LqgpgvPgIyNpeL6HdQ7ov2NdCk69YlkDF331RJho5aooiN5Z8gzKRiDt3DPJvwyMwp
         GTWJlcFO/eje9HH2f/3fTSVkVc+l6yzc+hgZLGibBRQmnPu93AvXGvZe1T3IyE8gJrzq
         mbiMKzpxAeKlCt6qluEeJAmMS3BZmot815Mu4=
X-Forwarded-Encrypted: i=1; AKwUvBxxs4lyKOfgK2YEzkC75pxXd4Wj9MxG6a/V3e95wkhDhg+GgxSuHPYZXdI7CETHNaohQ6CHMIsAqXsS@vger.kernel.org
X-Received: by 2002:a05:6214:45a0:b0:91c:7a0e:3385 with SMTP id 6a1803df08f44-91ca4b7973dmr3564056d6.49.1793309132732;
        Thu, 29 Oct 2026 14:25:32 -0700 (PDT)
X-Received: by 2002:a05:6214:45a0:b0:91c:7a0e:3385 with SMTP id 6a1803df08f44-91ca4b7973dmr3563736d6.49.1793309132301;
        Thu, 29 Oct 2026 14:25:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:31 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v4 3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
Date: Thu, 29 Oct 2026 14:25:10 -0700
Message-ID: <20261029212513.4126083-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The NSP probe path assumes firmware has enabled the SATA IDM interface
clock and released the core reset. The downstream iProc config_AHCI()
sequence explicitly performs both operations before accessing AHCI.
Without that setup, a cold boot can access an inactive controller.

Map the optional NSP IDM register region and enable the interface clock
before releasing reset, retaining the downstream settling intervals.
Perform the sequence at probe and resume before reconfiguring SATA.

Keep the resource optional so older device trees continue to rely on
firmware initialization.

Fixes: 3ee2e6dcaa35 ("ata: ahci_brcm: Add support for Broadcom NSP SoC")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/ata/ahci_brcm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 29be74fedcf0..3b6ed56f3e95 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -6,7 +6,9 @@
  */
 
 #include <linux/ahci_platform.h>
+#include <linux/bcma/bcma_regs.h>
 #include <linux/compiler.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -83,6 +85,7 @@ enum brcm_ahci_quirks {
 struct brcm_ahci_priv {
 	struct device *dev;
 	void __iomem *top_ctrl;
+	void __iomem *idm;
 	u32 port_mask;
 	u32 quirks;
 	enum brcm_ahci_version version;
@@ -230,6 +233,25 @@ static u32 brcm_ahci_get_portmask(struct ahci_host_priv *hpriv,
 	return impl;
 }
 
+static void brcm_sata_init_idm(struct brcm_ahci_priv *priv)
+{
+	u32 data;
+
+	if (!priv->idm)
+		return;
+
+	/* Enable the interface clock before releasing the SATA core reset. */
+	data = readl(priv->idm + BCMA_IOCTL);
+	writel(data | BCMA_IOCTL_CLK, priv->idm + BCMA_IOCTL);
+	readl(priv->idm + BCMA_IOCTL);
+	usleep_range(1000, 2000);
+
+	data = readl(priv->idm + BCMA_RESET_CTL);
+	writel(data & ~BCMA_RESET_CTL_RESET, priv->idm + BCMA_RESET_CTL);
+	readl(priv->idm + BCMA_RESET_CTL);
+	usleep_range(1000, 2000);
+}
+
 static void brcm_sata_init(struct brcm_ahci_priv *priv)
 {
 	void __iomem *ctrl = priv->top_ctrl + SATA_TOP_CTRL_BUS_CTRL;
@@ -376,6 +398,9 @@ static int __maybe_unused brcm_ahci_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	/* Initialize the IDM before enabling the controller clocks. */
+	brcm_sata_init_idm(priv);
+
 	/* Make sure clocks are turned on before re-configuration */
 	ret = ahci_platform_enable_clks(hpriv);
 	if (ret)
@@ -453,6 +478,14 @@ static int brcm_ahci_probe(struct platform_device *pdev)
 	priv->version = (unsigned long)of_id->data;
 	priv->dev = dev;
 
+	/* Older NSP device trees rely on firmware to initialize the IDM. */
+	if (priv->version == BRCM_SATA_NSP &&
+	    platform_get_resource_byname(pdev, IORESOURCE_MEM, "idm")) {
+		priv->idm = devm_platform_ioremap_resource_byname(pdev, "idm");
+		if (IS_ERR(priv->idm))
+			return PTR_ERR(priv->idm);
+	}
+
 	priv->top_ctrl = devm_platform_ioremap_resource_byname(pdev, "top-ctrl");
 	if (IS_ERR(priv->top_ctrl))
 		return PTR_ERR(priv->top_ctrl);
@@ -493,6 +526,9 @@ static int brcm_ahci_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Initialize the IDM before enabling the controller clocks. */
+	brcm_sata_init_idm(priv);
+
 	ret = ahci_platform_enable_clks(hpriv);
 	if (ret)
 		goto out_reset;
-- 
2.53.0


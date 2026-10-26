Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039372;
	b=Rr34Wg2ytRQILWlykkF5pS6YfMnA44S1U1vMWxkKkgA1bmlt0GO8+OXmk4zN6ePspaZy
	 +f6H5A8N7UawkJTshy6qKeSAo18FXK+en8TOo8512um8YBwMNM0V3FdZV787oi+POzP+N
	 zp2mWJfBOYLaKAdycXX3uacU4SfGT3xJ7yEGplS6kQoj8gb68H/OJfYsHW1/Qg9SpM7ZX
	 xUTzVBNimHvEXutlZz3K9NG/g0c5BfT3cMmCLGMbWZKXNQ8Og9YzmK7QC5GHNnFxYRKPv
	 YAPJb5gdXJ5h4vptRt93UlUrHRhVLmI8fD0QSnVPpgOE8RIYCF+yLi47WpEX5rafLlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039372;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mvtMFeEgqCOciHeQyrJ9AYtTF4EED76l0h+Ctv+GHTw=;
	b=lXiDnHYgbH8DOtWnskq2LLbURMwhN80wxQ7zOXnM01UHtLzsb+084kkDYkPn/HTxIj/s
	 Q8ov40umiLFf0IjEfEUFPF+jIiXt+F2k0sDAG+cavymPnno0c0NkTMydlioW8rIoYbP1c
	 V0d1/O0/tOc8cDHu34t6ZY5sawmagQAyKUEo3UdGRYzajBoFDdutTE6yfY7ER2gwQ1p8p
	 HJ6jKp55s5RqSWAn64/GNUMLXhBRnTvO08cs+MEqeTumtsOflvo1812MJ6HJWDxZTLO5i
	 GRukcCwqekbpxLmYKT1tW6QUdtSVv2ykfI8iUs/Llh90D3ROQ4h9leI1OUviACu64Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LIOJVQOW;
	arc=none smtp.remote-ip=209.85.160.225
Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278CA606A329
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 18:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 278CA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LIOJVQOW
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-533778ab0bdso26913601cf.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039371; x=1793644171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvtMFeEgqCOciHeQyrJ9AYtTF4EED76l0h+Ctv+GHTw=;
        b=Qv1A/fDJ1YpRYE8lqJqTcJ+cM3EJUnr+ee58oWHmYb/JuCFkIdFSy6aJlaYvnNiTI6
         3xJ6MqGXqNfXB2d79gAF8tIIOYyLUFc8ZXeoMTPe+kx6g5R5exADvoV+haxSDdEiXj5H
         +hr26XOKm7LKEhlMp2flZTMKNw1qJvQ6PD7+D6/NJY4SXF9rbL3dhiuqoTn1kdSm6eW+
         H0bXl+Og/Rd6QMYtmT9y7hwx97VVpDG8QcKLVwSA8UH+vBZUQIXEJQof29tcQlzLgkwt
         ptfdIAUUQRul4X6RZxWmlrRWJZwFWQMVtNz/jzsi5PdVljkeB5X9JbwsHUjE78CJteYT
         0GPg==
X-Forwarded-Encrypted: i=1; AKwUvBz5BD58zFMY3nZ8Wk2Nc33PulTzoRlGDfl1YoNdPQ4SIZlVvBQyrY5c7KAATo/u2FWxI4UM5PkTyIsm@vger.kernel.org
X-Gm-Message-State: AFq9FYJhPiV2Poa5Z28JSGOBKeezPGLKwSgBPowVoOBcDQboAB1FnnV5
	bw981/ee9x3+u8JE5mXnmhQf+9FvQsqhoudu8Z2cCVoKnj65FNOFT3ZOg1RdBjj8NY+8swJJjr3
	7sLSx+eoJhUVsDDj1I/bzvws8zNU4dZg70vES7NBcgx8YCoyR4jrhpcZ6QyskzFozOSjdyvYq5I
	PaZHJgmO+JdvukrWSYOaEigV4h5HMphtLFWrfIVfdp1/bwH06/KMaqV9ZORZeQVuNUOAMEwLiGB
	bRYw4rNDLsdcJAlUtWsuSx8
X-Gm-Gg: AYBFou3Jn3Ecfk0ISHYXUeMmExDzZJaEr0LPrCVVtLKd3Z6TwSk/vTjTQYQNz5PUipn
	VPybPQ82oFMutadeWrewPBmYVztgF21LSCtGwev26w25pD8MkuwNMJ2T8/1PivqNvMC7T9wYJN8
	50rwxAe4bCALSdr45lzAtDsEQ5AB/douBr4jFFAGgEBhKsTXrnmacBXFLybLUVf04bfn+zrAZim
	94FSWo6Vaf0m8xLreqdBahM5meRXQr0XEx9rRM93tRwRgky7dlg0qdFvdJVBrFH3KEp6rtWDnJ1
	9sYyJA2ksxWwH4/2v4cq2Gna2VZanmRi1wBCDl2629XC3xuIRRaSEqelaPUM/djLNdglmFy4jxb
	CceUN+frzGDK0VrzkGw+ABupQJenRtObUUSKfXycpPdkeTuoBU7Q262Xpr8xTE7umiGX6nuCqNV
	MDkjESTvr76K7D95MgL1qYZzEV7zQ1p9+o9FIZxGLu
X-Received: by 2002:a05:622a:230d:b0:535:a5f8:a5c4 with SMTP id d75a77b69052e-5383b60d697mr122771181cf.68.1793039371018;
        Mon, 26 Oct 2026 11:29:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91c47bbd330sm659736d6.17.2026.10.26.11.29.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so5741737eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039370; x=1793644170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvtMFeEgqCOciHeQyrJ9AYtTF4EED76l0h+Ctv+GHTw=;
        b=LIOJVQOWEm+yBjrPuVXalbtBdskNsAKvaNT5yoKyNwbTpn+54ucSCM8hMN+E727FAZ
         eNjzVHvY8XO/SyJfAcM6yqUY3P12srdSQG0Y3tGf345Hth/6mHpJAdP0Lhg4/kNPxru5
         xNbzYX35LbfCHfPBkSQlkUjPrby9yXmyK2WRM=
X-Forwarded-Encrypted: i=1; AKwUvBzBjEKR95ylzslGRxvCJB382sOcojeKHzTP/aAOW6nQWrjmPtYh7VPvigojDJJLBToRNLOFKIBHqVQO@vger.kernel.org
X-Received: by 2002:a05:7301:1525:b0:369:a113:756f with SMTP id 5a478bee46e88-369e850d487mr10690507eec.34.1793039369604;
        Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
X-Received: by 2002:a05:7301:1525:b0:369:a113:756f with SMTP id 5a478bee46e88-369e850d487mr10690462eec.34.1793039368795;
        Mon, 26 Oct 2026 11:29:28 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:28 -0700 (PDT)
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
Subject: [PATCH v2 3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
Date: Mon, 26 Oct 2026 11:28:53 -0700
Message-ID: <20261026182856.3168686-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
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
 drivers/ata/ahci_brcm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 29be74fedcf0..2ed60806b671 100644
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
+	/* Enable the interface clock before taking the SATA core out of reset. */
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
@@ -369,6 +391,8 @@ static int __maybe_unused brcm_ahci_resume(struct device *dev)
 	struct brcm_ahci_priv *priv = hpriv->plat_data;
 	int ret = 0;
 
+	brcm_sata_init_idm(priv);
+
 	ret = reset_control_deassert(priv->rcdev_ahci);
 	if (ret)
 		return ret;
@@ -453,6 +477,14 @@ static int brcm_ahci_probe(struct platform_device *pdev)
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
@@ -493,6 +525,8 @@ static int brcm_ahci_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	brcm_sata_init_idm(priv);
+
 	ret = ahci_platform_enable_clks(hpriv);
 	if (ret)
 		goto out_reset;
-- 
2.53.0


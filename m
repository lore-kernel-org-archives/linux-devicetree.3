Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042292;
	b=S/PpltLCrV+jHnCFOk7ydxG26rTi2pg0y7xGBsbz6QgWA0tRhcB0/B91q9Q479ZtriS1
	 J2+aW2JReHRcnkYYfFW+SCINyoGEiStojeiS92ti0Zdmk9Xgh+yYRfqDPSMLYHRHRmihy
	 UqUhiFyVMeODnZ5GmCoQw1OMSI0JMB6Ay9AHNXd2R8F8H1N0c/wIW+yGBa/ZxqB95NUEB
	 SiKG2ati5jMDySL39h3khp3yz1D0FyVgNpinEpTmJhf+CbXp6LZ3It6sYujHpg6GBPsNP
	 +7cOTWVsWmrMsIR/qvNqfH8ofBsyAX0G0olTUNTD62HXg6bcM2GJUnyv8L5XD4VQ52w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042292;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
	b=IxaDrXdysQOrQLv/03TnRGUr45NAludtCVBNNuov9i/A3M1JyHgnlPB4iDorC+KtRkIV
	 IB7TAt0pLQ2N6BjBzeNrZa//s9N++5ZIw0MQSQOu05fFwxLCWTfkSFh82IpS2cObBlxpE
	 0y2jxDG3HgGJE3huY+hvGohmQIu794O/zFPEjeGGqA2PImJje/UqTQ8edoJ7Hvcz2RB4Y
	 mGVrjocumfjFAZOWGCId1LmoOLn05raEkofinZzU+o59Uj6MhFvUakR375J94CXUreMXa
	 v2jWmKckTnaEOzpYABxFkrMTOPD52pKNQmOmIPTCCcsGQ+0UYwdl5A543i6xZ24PZwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="H0/Y/cJN";
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DAC606A335
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22DAC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=H0/Y/cJN
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1123118a12.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042291; x=1793647091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=kXO7VCiXHNUKhp32GawYOK39JGoBSrn5Axn/cOqHkSOcOoZ+CfJzVumLKt4Gpb7QTf
         Ztqx4pGO0ps5LmdBHM1UdeLXbZfiNQPem80eNYtCMysYAe5qrLrPzpaklhHZN7oOrkG+
         mSoBzUJzewL8pHUzFsE49YpvnJtBscnlIvkwLq1qzEI3VKuUvXO01wn7dTjw2UFRR/BA
         nPwKsCYmPUHeY7sjEuPVEsJkzgz65EpEA9IrH49Fr6Zt9QNSL+i/iDVLfe5Jx9/pbDlW
         wrf/RrSillxI8COsucCaEePuwlKcgXfHYciFqw/2BtK7yic3jtvV41U2h/DfAH9btkmS
         izzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbckjyHx0MOUKmgYB58aGFzhd1N5ICl41pcoox+n0CV7Y+x7H9kR7b8itU7FSs+OnQaeJa7YVuL8Zs@vger.kernel.org
X-Gm-Message-State: AFq9FYKMNDCn7ReoPoaoU/5qJnlyYQ6HmS/3PNZWO9nYlHzqpLwJfwsd
	Wjp6jlsf/JFuDmFA0a4Bh0TH1IaPXRedbtB5I6mwtWADq1krwp+dTI1tBCSzCkhSz2u1jBzkvsj
	1dRx5pDxoFsYKNVZiiEg85+oMPEGo/e0KJgUWF+9qGI4OqbmJ10dGfsziqy2SljQBnLpyEKrc0K
	D113/VV2gxA/sXBJx9cw3A06OIgbbduNxo9+gTsT1ODEM097xc7SDogzJDbfKhcC5JHkXN/uQuc
	NUcDIoWqXSrKAqzRpvZyw==
X-Gm-Gg: AYBFou2KeE9g8IXW1s+I7GDwMhjI4ejydXaX9vx0Uw9j1QBW/FArRBO1MsGAkkT1uaS
	0SXocLeVGInKmubab0iJzGskrvZs0hV3ZtCHswWGTeSBKK5raE7pNWQbIpxekk4dgiJ9shSY0DL
	gzfC7xWMaZeAnLIw23BfLE5bSDiQDcJ4JZ5EMBs/30my9Ocsjrci1/zuhGEYIx++LbGNSsuHkPR
	3fV9EbtVqNEzWk2jiCAABHYHfXxWtT+QzEyHBnP+8NFSoqi3qb76Vi+GI5QwUXuScL50KiZf342
	Ig5Rw/oEnqZPjfKV78DorWTJ7hs+3MQVXS1a4uPQFT7TZtoQPsWx8JJGUF2iHGVZjJmtvLYascm
	/S1Jhy1icm6jMekIkDb2Df7Gw30kSE/8ACZdboE5bmK8OompP/Npx2ZsmtlnTodlWws6qwMtVHZ
	qEicBnNWPqbANQ79GeFGhhPyClpANU+DoydjhUwjI+
X-Received: by 2002:a17:90b:5827:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3adeae78010mr6429075a91.53.1793042291447;
        Mon, 26 Oct 2026 12:18:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae407e4ce3sm323091a91.6.2026.10.26.12.18.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b8306ba68so87834186d6.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042290; x=1793647090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=H0/Y/cJN7a7qauIF7IdrLCml7qvQ06gT9GI2jIst243tn4hvmjbpGyj0KfD4TmTkhj
         ZZ98Z2ZGRJDRfojvzaC9e0Vf5+ZbvD+a1irJ5vgjfMP8MZ+I0wKX3ibADwAKEq4VvJjZ
         03+AfNWRUeTih2PLMBYeDViIEub4amKWjOWhA=
X-Forwarded-Encrypted: i=1; AKwUvBy6BInUAN8lnNN2nS7iNJJwGDD3EQfjN3trQazHTxCr9qSwbOo4BM6ZjMHklnJTZ44tnca/IJ2eREvo@vger.kernel.org
X-Received: by 2002:ad4:5d42:0:b0:91c:6d30:7c2c with SMTP id 6a1803df08f44-91c6d307d76mr12445346d6.52.1793042289956;
        Mon, 26 Oct 2026 12:18:09 -0700 (PDT)
X-Received: by 2002:ad4:5d42:0:b0:91c:6d30:7c2c with SMTP id 6a1803df08f44-91c6d307d76mr12444746d6.52.1793042289436;
        Mon, 26 Oct 2026 12:18:09 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:08 -0700 (PDT)
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
Subject: [PATCH v3 3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
Date: Mon, 26 Oct 2026 12:16:15 -0700
Message-ID: <20261026191618.3178830-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
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


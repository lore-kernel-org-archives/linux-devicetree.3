Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAD13A7593;
	Mon, 29 Jun 2026 06:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715774; cv=none; b=LXtUzETwMWAx59kb/QycwfTfsEJRGMZtmqcKsmoosJ8GoqAMDtdEOfGZSVnx5wPIWA6GkJbIGRiySKbHilXYSrsmv9DrkIUpDtCk4Wi8OFHvczGdwVLAN9MLlORivHPqaSHyiBLL94+eXJKWxiVvarVAGKRZypHXcBXv8WA9VLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715774; c=relaxed/simple;
	bh=0gtJ2jkDHDroFd/tvTFdjs9XdlK02tL9fNLXJCMYb4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COCLQnHiGTKWqqjpC/39HqE9FOm4wj14Nq1lxmftvW94Oi2jxToT6xpTcftIn625VsRZV++PT/L40k275JaJdqwB74ZLcIkEOKjueOsWnZca6uYHqmEq9b+X8HUjs8DNRfM9rRwvj7ImRsf37zP/MywPVCfyZd298kTuwUHCIrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgMltV/i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgMltV/i"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A16BC2BCF7;
	Mon, 29 Jun 2026 06:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782715774;
	bh=0gtJ2jkDHDroFd/tvTFdjs9XdlK02tL9fNLXJCMYb4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HgMltV/iuPgeub48WZJi5UNGtHADF4P3curFF4GXLEnc5pjZNPEZz+2Epjdt1r+7L
	 qelftI3L2Khr/t3/49q9vmjRKEsYoFUWfN0BL6fK7xtDnt7jicE2eVjaQcU6wt9mFi
	 QynK3Z4NxV33wPDBA6V3PP2AIBCZg9cjIRz7zeENmfNTn6BScbTgNsLwoBbmAXfRHy
	 VBffFYCZiLixphDj2UQxzg8tXonddTlOLIGTxDU/s3o+Wq90vvdyJ6vmh+w7HnhnRd
	 2NVFPBb4kf47+mAVxCgEDHfQh4rnMjmUE9U9hmTCZ66r6DLWW90tdfFNoEB/kMv27E
	 CpC17bZKKRu6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12488C43327;
	Mon, 29 Jun 2026 06:49:34 +0000 (UTC)
From: Yu-Che Hsieh via B4 Relay <devnull+yc_hsieh.aspeedtech.com@kernel.org>
Date: Mon, 29 Jun 2026 14:49:01 +0800
Subject: [PATCH 4/4] ipmi: bt-bmc: Read LPC address and SerIRQ from device
 tree
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-aspeed-bt-bmc-multichannel-v1-4-fc23ee337f7a@aspeedtech.com>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
In-Reply-To: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
To: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715772; l=2682;
 i=yc_hsieh@aspeedtech.com; s=20260629; h=from:subject:message-id;
 bh=EF1+2Ti2wuA06NwsW+QoJlNDr5W2qvG2AEgoxOs4li0=;
 b=D8mUNlVKBhK5Gu/mgQ8KRyUEN1CNPv03ZJ5EwBjb30X1V0G4Oa8eeCxz2irvaf9+E10wC+2xk
 NlEhO1Jg+MeC2Jw2RoKwDKxh0eDBGNOXrLMxbmHqBpwqDkiyalK4VAY
X-Developer-Key: i=yc_hsieh@aspeedtech.com; a=ed25519;
 pk=kLxUeF7g6teciq79it9N3tYNgp3yCspZ+AHlYSnZ0gs=
X-Endpoint-Received: by B4 Relay for yc_hsieh@aspeedtech.com/20260629 with
 auth_id=844
X-Original-From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Reply-To: yc_hsieh@aspeedtech.com

From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>

The BT interface currently programs a fixed host LPC IO address and

SerIRQ number. This works for the existing single-channel setup, but

does not allow the host interface parameters to be described by firmware.

Read the LPC IO address from aspeed,lpc-io-reg and the SerIRQ number

and interrupt type from aspeed,lpc-interrupts. Keep the existing IO

address, SerIRQ number, and level-low interrupt type as defaults when

the properties are not present.

Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
---
 drivers/char/ipmi/bt-bmc.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index 486ecc0b6815..6e1f941e63db 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -65,6 +65,12 @@ struct bt_bmc {
 	struct timer_list	poll_timer;
 	struct mutex		mutex;
 	atomic_t		open_count;
+	u32			io_addr;
+
+	struct {
+		u32 id;
+		u32 type;
+	} sirq;
 };
 
 static u8 bt_inb(struct bt_bmc *bt_bmc, int reg)
@@ -429,6 +435,33 @@ static int bt_bmc_probe(struct platform_device *pdev)
 	mutex_init(&bt_bmc->mutex);
 	init_waitqueue_head(&bt_bmc->queue);
 
+	rc = of_property_read_u32(dev->of_node, "aspeed,lpc-io-reg",
+				  &bt_bmc->io_addr);
+	if (rc) {
+		bt_bmc->io_addr = BT_IO_BASE;
+	} else if (bt_bmc->io_addr > FIELD_MAX(BT_CR0_IO_BASE)) {
+		dev_err(dev, "invalid LPC IO address\n");
+		return -EINVAL;
+	}
+
+	rc = of_property_read_u32_array(dev->of_node, "aspeed,lpc-interrupts",
+					(u32 *)&bt_bmc->sirq, 2);
+	if (rc) {
+		bt_bmc->sirq.id = BT_IRQ;
+		bt_bmc->sirq.type = IRQ_TYPE_LEVEL_LOW;
+	} else {
+		if (bt_bmc->sirq.id > FIELD_MAX(BT_CR0_SIRQ)) {
+			dev_err(dev, "invalid SerIRQ number\n");
+			return -EINVAL;
+		}
+
+		if (bt_bmc->sirq.type != IRQ_TYPE_LEVEL_HIGH &&
+		    bt_bmc->sirq.type != IRQ_TYPE_LEVEL_LOW) {
+			dev_err(dev, "invalid SerIRQ type\n");
+			return -EINVAL;
+		}
+	}
+
 	bt_bmc->miscdev.minor	= MISC_DYNAMIC_MINOR;
 	bt_bmc->miscdev.name	= DEVICE_NAME;
 	bt_bmc->miscdev.fops	= &bt_bmc_fops;
@@ -450,8 +483,10 @@ static int bt_bmc_probe(struct platform_device *pdev)
 		add_timer(&bt_bmc->poll_timer);
 	}
 
-	writel(FIELD_PREP(BT_CR0_IO_BASE, BT_IO_BASE) |
-	       FIELD_PREP(BT_CR0_SIRQ, BT_IRQ) |
+	writel(FIELD_PREP(BT_CR0_IO_BASE, bt_bmc->io_addr) |
+	       FIELD_PREP(BT_CR0_SIRQ, bt_bmc->sirq.id) |
+	       FIELD_PREP(BT_CR0_SIRQ_TYPE,
+			  bt_bmc->sirq.type == IRQ_TYPE_LEVEL_LOW ? 0 : 1) |
 	       BT_CR0_EN_CLR_SLV_RDP |
 	       BT_CR0_EN_CLR_SLV_WRP |
 	       BT_CR0_ENABLE_IBT,

-- 
2.34.1



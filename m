Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D872339185C
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150773; cv=none; b=E9YPALRwAlVc8hJc5v5CrGDZOgisd3qikdHv+UVnFvR7BcjjTvPoobuJLpVjjb8SQxxLIzY1WGG/O1iB+YWl2hzYZ1myM/rj9GQJeN6Cemw2Vk5C4POjVUayub+eiQHGv7jzjsR5wXQBCyx2CC6OqMysq09OVVfXieny+Do2iS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150773; c=relaxed/simple;
	bh=Zy71/fJ74FRfR9wQcyuWyoy8vYdmBl8U1Rx2deFcctA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nUFD1fp5pR8XcrT9sCWKGCdYltCrdOZuCU5CQAdmrOLxzUg/+bJcRZLOuSa5GpePuaGTQp7IWU4DeuD2yHktM3SNQUufOb6ApzMFIJpwbRlfz8yPzYyP19T0E7I/W7JaXGCNyDpc1IxPbnTmhB2Ai6Bs4EvRbGrIbA8da6qK/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcLvoWZn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcLvoWZn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-476d8e647e9so1158769f8f.0
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783150757; x=1783755557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bI47Dpz0RBIpr5k7Gwsk0lZ7yNT7k5Nfr3De7ezpTc0=;
        b=gcLvoWZnA8//jfq4fnf7YN1picdvuNsL1yvJaetALPyyebcjtolT40+p2iJYjOvsmq
         FtZ+6BzQl1FJ85gNVkyCBeAgten25ynRxFqDFCoeHqfS8wLWYrgyw0dpVzDlBckGRNL9
         Ua9sK3cwYpNi62Z0NMRVHupbpM2pe5SgI405RE0p/5hG6ULjj3MDIxMNCfo5S2HBgIBz
         g5ayx60l3kl2A7xQb8pEQbWUm8MwPb9zxDpU9/XNTHjwl6Qy4x554Vg1YfS4hx8eM6fb
         FzMRV6CE4nfDx54BGlpX5RjXYtfXfEVkiPmVmZoI3wqwWNYa1fLzOPtIJve5dv3BrNZx
         LOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783150757; x=1783755557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bI47Dpz0RBIpr5k7Gwsk0lZ7yNT7k5Nfr3De7ezpTc0=;
        b=L0LoUX9+kFBKr7xgOtOFsrI1k0Q8aIfsonVyO/YUoloyJleFllq0bfgcYLIaUquCoq
         ziyFP7dKbe3G4KJTxIxkTJKXyLu5G7M2sIXPnUe2LQCEkzaB6c+a3IRkg9tbNpfVCJOH
         JKphAbtW01nvZ+ZxbGm+Y1YnPZij8Aqdo4nPhbh9E0TxlMsYlgcWDvBkxZCP8NgG8DBg
         6aE9VPPXNVqpz3LrgcI/A75YGh1KdTNwChDbjywMbIPFuL6So5xv5SxngjNuoZAxJZrv
         vTY8jfAm1xaMzb01aFyNqqNXMTOatqymI06hLQRPAlRaMO0NKSjvJHKGfmzJS/5K41V9
         L+wg==
X-Forwarded-Encrypted: i=1; AHgh+RoqJozpRqX+Vlcpdb0URmroNd0ZI7ISvg0W22PoCCEpgGxRWQw7sp3I1jLBv46w3YGQagpH68gWDaQv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9IawX39mo7A5FYbGL8N1H+lvWcA94R2qBu+Gjs2cUk3pFbRG
	l7Al5IMlSYPZsDSv07oWL9pt2hnBEzJ+tmuqHaB0tpPUoiO9l4iaT7DjFnGF77xZ
X-Gm-Gg: AfdE7cnwCUgDyCTXlycF9piXzGzW4TN8htmW1YWBOW0Q0aHS7EsleylpoTByZJip38C
	eAkIywoeUtxZDo6VDLiDwUJuFJaHM8bUZnWMKhsto3AYXeZDlxBCfqequldbm12ZHHJiGO0Re0Q
	K6dXdfzxvPXfEP6rTG1PujpPfewAEO2811LmBQloUXXwP08AGEx70EK1ADcOFmD55OynFzdeR09
	EIvcIPiP7zEHImsvsv5EcmxkshhbnLf+c+gzQBSD5kSIIw59x0bb6QVUeEHQRiQ6KnK0jIW8Dos
	6OumPdtecjp7/Gzd7DWTrZQCRvx8hKotIgEvFRr+NSZINrDMRwtz92ksX4PaWOyMSgPLzErjR7S
	PXFdvo5BCWPGiDCvzAVvV/OYEx/LESsTtBDZTwnw6jKgnL/nLxjpDo37r7HgTu5IUlBbMpBET8I
	yG5IDaU8GMY5hWZKWFzQ98P5FvZiV3YlvLmw==
X-Received: by 2002:a5d:588b:0:b0:471:2631:9d7e with SMTP id ffacd0b85a97d-47aacab5251mr2777565f8f.27.1783150756651;
        Sat, 04 Jul 2026 00:39:16 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm6565488f8f.7.2026.07.04.00.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 00:39:16 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 1/5] phy: cpcap-usb: Prevent line glitches from triggering sysrq
Date: Sat,  4 Jul 2026 10:38:39 +0300
Message-Id: <20260704073843.1750458-2-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
References: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Lindgren <tony@atomide.com>

We can get random sysrq events on switching from USB to debug serial
port mode unless is temporarily disable sysrq for the mode changes.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/phy/motorola/phy-cpcap-usb.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
index 7cb020dd3423..c6cc8fce6940 100644
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/sysrq.h>
 
 #include <linux/gpio/consumer.h>
 #include <linux/mfd/motorola-cpcap.h>
@@ -413,7 +414,12 @@ static int cpcap_usb_gpio_set_mode(struct cpcap_phy_ddata *ddata,
 
 static int cpcap_usb_set_uart_mode(struct cpcap_phy_ddata *ddata)
 {
-	int error;
+	int sysrq, error;
+
+	/* Disable sysrq to prevent random sysrq events on line glitches */
+	sysrq = sysrq_mask();
+	if (sysrq & 1)
+		sysrq_toggle_support(sysrq & ~1);
 
 	/* Disable lines to prevent glitches from waking up mdm6600 */
 	error = cpcap_usb_gpio_set_mode(ddata, CPCAP_UNKNOWN_DISABLED);
@@ -448,6 +454,9 @@ static int cpcap_usb_set_uart_mode(struct cpcap_phy_ddata *ddata)
 	if (error)
 		goto out_err;
 
+	if (sysrq & 1)
+		sysrq_toggle_support(sysrq);
+
 	return 0;
 
 out_err:
-- 
2.25.1


Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B64A3404
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329333; cv=none; b=tgtMtPe2921mloYEewQALdw7cgYh6oWWN+bVTVC8sCH0MY40LqgzB12kX5e6nkui79JWQ33uXGCrfYmHZ4qIKDQl/A+DIuuY7JHVDXuxpQ0KPD51/QFJmbQmevqUIDXAjXsqUYOqbx4RR1Az5PR4TgmKUZcJQv+TL8DAfkyGwhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329333; c=relaxed/simple;
	bh=SlNqGmETJ9Q8UAkQSzGcvlMdwkMGS8oYl0+UlW2dAag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHFFv6lBG4hjvq32NW8zoeRerc676XT7YHG6agFAMGIPwhtKyVxmj+CifI9sqPUNRATXA4YjvDPQ6WIrMgr2oZ8upSOGTNbkkmgMd3biHACUQ2+NE6iSoHCJAP1rqyL0rn0qbSZ0lg26o60zBfwX8PUfn2dOltxW2GsohXEgcyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KthFrw6f; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KthFrw6f"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so2869010b3a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783329323; x=1783934123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PO7sRlb4LngBB0NhQzK1DjshH0p/tRvHLng9mNY0Vj8=;
        b=KthFrw6fWRNwlqAIAFn13froZPY2yRUQbS6l5u3aNoMv0BPpsc9gZ30qkmzLf67B0S
         MONb43xRQOeNS+UNRGoV1nvV60wQ3rGMg+GcAtr7IH2wzn5sjVboqrIi9E7j5Jbzt2pD
         6pCFJdZ+LorGCb4dvss4r9pivDhqJI1OQhWmDmt/iJPXI/E3zruy+S0iW/oWWGRLUkEF
         rv+rrVUDN24D3kXFNb5mjxJM8InnyCHjdW+F3UUcACAsQgIolynmkNsdhRH4buwk5bfN
         ArJl5KUf6aZHc+RQxbkw6qt8SSRKqHw9h8ua6lVCqV+8++21gzJj1ZDE8J4n4qLYrwvw
         2yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329323; x=1783934123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PO7sRlb4LngBB0NhQzK1DjshH0p/tRvHLng9mNY0Vj8=;
        b=mU97xr1VHDmKH3uDdAG7NnxdzKHLybf1LV6prcBsvSIWbqyDeSCPm3xjX2gadARmdv
         BfjEFAfnTkq4xxJ6F7mdex5Dgb6KlTtXOw3ntpS2WcIp3Vw9s+ElQfZrLBkgOwzmlC1N
         5yNr07UdkNz0+6p09k51rvWfQzfDpOWYFOJasD+oTgohPjzzbVA6AjnwU0gkdK3XyoIm
         q4RNOiiq/wv6UNN8ChEbyuU9hs3gdaMiAPSZ3E7qMcZHS82yzF8Nqe6HBdgcrAKXv+qE
         +aqw+UhNYfNktRl5EOMDr42eWR4abWOxqStuTCzz4KU41rloeICN5TPoj2zpppUA6ax9
         7oJg==
X-Gm-Message-State: AOJu0YwZP80Kg6xGKgP+4owU4DaC2yB1w6jYoXV6QQVvfmHhVHi+L2jL
	4kezhr/omJdLITIsB6vRI7XiG9wKl7HjN2E+rizQRIArbLEWhOp0XviO
X-Gm-Gg: AfdE7cnes+iK4FLPHnnpZyYcsPfQ/BF3GX1CrOyzZUDA/E4P0Z5vANuK0cz5vzX/8JI
	aM1zWdkEXtO8Vdoo+2MCiCi0uTyUBIMhg/zkmtFqShspRyo7qOpa+zJHfJSV94m1ZPZn3mcavOH
	33yYcbkDsM/Q8FoKmxeDO23aBXjUfGTcNBbds7t8oXq4K/z+qm8oqUoTeCtXdKkzwb8pGD2IUdJ
	UGKLQMWZ/gtiYCGwvlIduNbCx7OxtU5cHsqS2A4mqqCbkmSPu+/lJy48zf5hLl6JFHoHzIre4f9
	dZT9YLm0Fr5QkUQqoUq7RZT4w1AQQCKW7tWjHLockQsGXCULEvx9a1IwwlxHbVSNQroJ2H7PNsb
	D0LBYRlZ2/jxn21NnspbxlvfTxuv1x7cUSwL3hZNqHSdDeeTuRRmr81JkJP4b0jRoZxSvooLHe4
	ooLNk5/0RXk1a6TC091yQLQOsu
X-Received: by 2002:a05:6a00:bd0c:b0:847:77f0:72af with SMTP id d2e1a72fcca58-847f6ecb888mr7926803b3a.40.1783329320787;
        Mon, 06 Jul 2026 02:15:20 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm3445963b3a.53.2026.07.06.02.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:15:20 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Mon, 06 Jul 2026 17:14:43 +0800
Subject: [PATCH v2 3/5] net: phy: motorcomm: Enable optional clock for
 YT8531
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-rv1126-alientek-dlrv1126-v2-3-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783329287; l=1439;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=SlNqGmETJ9Q8UAkQSzGcvlMdwkMGS8oYl0+UlW2dAag=;
 b=y6ylHRmWgT7jI86bC726VoaKX+LpK4637earqAkTGSrc4CX0YqwDp1WW/spDefa3DoiAUsZOh
 Vi4pQJYhQAiAYpVdofljX7KHjKSc3kOcTx5ju2ZdGCW3K/esm48DEaL
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=

Some boards feed the YT8531 PHY from an SoC-provided external
reference clock described by the common ethernet-phy "clocks" property.

Enable the optional PHY clock during probe so boards can model this
clock as a PHY input instead of keeping the clock alive from the MAC
driver.

This is needed on the Alientek DLRV1126, where the PHY reference clock
is provided by CLK_GMAC_ETHERNET_OUT.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 drivers/net/phy/motorcomm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index 5071605a1a11..3396a38cfc0f 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -6,6 +6,7 @@
  * Author: Frank <Frank.Sae@motor-comm.com>
  */
 
+#include <linux/clk.h>
 #include <linux/etherdevice.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -1180,9 +1181,15 @@ static int yt8521_probe(struct phy_device *phydev)
 static int yt8531_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
+	struct clk *clk;
 	u16 mask, val;
 	u32 freq;
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get and enable PHY clock\n");
+
 	if (device_property_read_u32(dev, "motorcomm,clk-out-frequency-hz", &freq))
 		freq = YTPHY_DTS_OUTPUT_CLK_DIS;
 

-- 
2.54.0


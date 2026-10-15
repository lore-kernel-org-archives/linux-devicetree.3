Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0233C9EE6
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075138; cv=none; b=FHeB8qSwH6cuyFJgGeUaKl1TT22MRmJ0jMQVQswuPSpPv81g4maovK3q1XIL4CrRUNa7JU6W9IB5F88qzhzZio+3Zdm2kMd40tFgiv2l3jZe7khT/XU9iK3mmeYaBNMvoW7dP2525SL489MGnAMpGZ+7lYD85GT1u4nVBjeYzMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075138; c=relaxed/simple;
	bh=4mhyYh9AhJdWh2Z54n/rDsetUsO9wDF5wBn1LCUSmSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=osz4ZhxzOxlg5405uuctCwjjHwhHu9ijsVTN9Zpi4VQc71N0DmxtjQcK+rcYnIieU2X4wkaXaKK8276mJQrIClTTp3io20+nBv8JIac3h0H8e2zRceDWqTTOJT93pPfwXidNKXE3PBofqC/BEfd+ByeE9KoDOPHjhD7Yh+BB6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=fHDn0JsS; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="fHDn0JsS"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91b8306b9f8so63983616d6.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792075136; x=1792679936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrZ4UoU0O5LeVfAO0Ji/pzxgUsFsUywSx2q0o8MOUoM=;
        b=fHDn0JsSQRiQ1IQKzOaAZDzR8HeKmDNC303oCK3wjOVrgAPQy0NnMph3ueZxeEXU+0
         syIfkxDMcff4VygMKizZ5bhXMcb/IznP2nfgEBMDUmnmhCE4feA3uwEEPTpG3UStE9+w
         qjRFN+pxog68RoxJVipo09Is93b/4HJ/SnTid8RXJujjVVXRBStkKhwEr++//r6N1RKx
         VnvMouU7QO7KA/aYaANOgI5X7/Wm1dsB+GxHYcssQjs7SEwLW+yIdqpP+98DC6lZMPmC
         5SVAZbAc9aT9CYMavyvcUS9F3FHm1lr530Jr74bDJJZqZE2oluG18cd5Eju+vJwy0kXJ
         uGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075136; x=1792679936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrZ4UoU0O5LeVfAO0Ji/pzxgUsFsUywSx2q0o8MOUoM=;
        b=ACJ33KufXBqNDdPC55ZNWCkIVTXsPgXFdNJvefEB1xIMp26tRLK1eMlh5mTMdGWlFI
         ro0f7cV8zM+TASKbnY8VNIZLABlLnFFeLg1+/fiXvMcK1OVKJxsB9mAvMBX34VZkocgh
         BBS8p1uPrOpoCftyEA9b9IF7UKfY69mLHfHr3B3baOH8r6qskwefrSeK5r/MEaiSqNVp
         ohDOv2BB2OfHCpA6I8HKKaYMgB5M3F0gjDUBMphs894gPKEG/0g20AqsjRXlpbXqVYwc
         rgHvdWLxuLDYS4ayhTWLqiq0nRulrgY8ol6lH6K+2fNKRYs6D+OGSuESpEfzNR1AAP7D
         KYDQ==
X-Forwarded-Encrypted: i=1; AKwUvByHQcQawWPImrESWo9yv3JENklKYbVa4PrY+sO17wroU0C77IY5YHrLqs2y1ekJwFib+y13fd2HuquU@vger.kernel.org
X-Gm-Message-State: AFq9FYItk3ndDMQHldEswogmYJaxeF1V1qsC7/pqdQh6r9pKOmk96PiQ
	YFeSCumYPHrkg53Xw8BxjgvvzB0MbpQ7Tr3CIlGp+/op7HneJMOkwR8ma1+I/V+6p2E=
X-Gm-Gg: AYBFou3GbGc5/pQypRF6ZUa52qQrYBhtDbYCwIGVYRbwAUIl6q/FRifd5vzYppK/Zbk
	wHqEiKkg4yubiryRlZlTOvxELDktTRYvSA+IVnlz3d18plkAiBhVt2mZDVzohlFNoOuQOtvCz1c
	Ky1AptJgSLEpvpV3LuxLXWoFKcmlZBw2FsJqjFkNFiHZEQFs8jhuIQzdFmqWDODlQMOqM0KJPZ8
	QquvSd8aAV57nb2aEUkxvEnyjzzWnYx6z2NTqOluBqDFvJHv4Te0o6WDYbnilMVW67FIVe3kKB7
	pwqwvyDsCv+9lHU5HjJtAo8uNoZ8J2riGiVZ1uOHSRjKuQ1QeWczoFYHANUskINm56hHWmSoguK
	stacV3UzE/6bH/N0x/Ond8QepLWZVfziVRmBAplg4+XYvhzxLb8C4TbN2Oa4z1iHyQGpfd4tiRw
	7Mavbfq53l0Bfvjb171MNnMkX2YUEz5XaGZtiNU2vrQcGp/lsLrk0HR+pf+Bvuu3eVGpAR3WI/p
	ZIQKHNUEln+0g==
X-Received: by 2002:a05:620a:4411:b0:93e:9292:1ba5 with SMTP id af79cd13be357-93ebd20defbmr3353447685a.21.1792075135235;
        Thu, 15 Oct 2026 07:38:55 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bc6d42sm82581486d6.34.2026.10.15.07.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:38:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: Daniel Thompson <daniel@riscstar.com>,
	ansuelsmth@gmail.com,
	donggeunyoo.kernel@gmail.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] net: phy: qcom: qca808x: Add regulator management
Date: Thu, 15 Oct 2026 09:38:47 -0500
Message-ID: <20261015143849.483339-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015143849.483339-1-elder@riscstar.com>
References: <20261015143849.483339-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

QCA8081 appears in embedded board designs paired with GPIO controlled
regulators for its power rails. Add logic to allow these regulators to
be turned on during a probe.

In order to avoid the complexity of tracking state for suspend with and
without WoL we take a tremendously simple "always-on" approach to
regulator management, essentially relying on BMCR_PDOWN to conserve
power when the phy device exists.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/phy/qcom/qca808x.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index bab26e4c61408..4aba513b9a512 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/phy.h>
+#include <linux/regulator/consumer.h>
 #include <linux/module.h>
 
 #include "qcom.h"
@@ -181,15 +182,43 @@ static void qca808x_fill_possible_interfaces(struct phy_device *phydev)
 		__set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
 }
 
+static int qca808x_power_on(struct phy_device *phydev)
+{
+	static const char * const regulator_names[] = {
+		"avdd18", "vdd", "vdd18", "vdd125"
+	};
+	struct device *dev = &phydev->mdio.dev;
+	u32 count = 0;
+	int ret;
+
+	for (u32 i = 0; i < ARRAY_SIZE(regulator_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, regulator_names[i]);
+		if (!ret)
+			count++;
+		else if (ret != -ENODEV)
+			return ret;
+	}
+
+	if (count)
+		fsleep(phydev->mdio.reset_assert_delay);
+
+	return 0;
+}
+
 static int qca808x_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
 	struct qca808x_priv *priv;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	ret = qca808x_power_on(phydev);
+	if (ret)
+		return ret;
+
 	priv->led_polarity_mode = QCA808X_PHY_LED_UNSET;
 
 	phydev->priv = priv;
-- 
2.53.0


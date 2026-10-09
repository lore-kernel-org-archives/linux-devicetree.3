Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46474F30C2
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568806; cv=none; b=MVKGEOx+I95tesLVD6S7YQZ+Uc53jF9Qg6XiVJqK65yJNyMGiirRTyccjHXaJ631fCFPtS796R2/iIR8o56d43SPh3Pn7qbEQaP9Ew3Bn1o6CZFL5uMwiPM1kZ+av/YXo5XKw/JiPfvSAuq6JHZj3Cty3CRme4/FK3A9lvIxl/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568806; c=relaxed/simple;
	bh=6eO1+2LSIMyeX89pykPYiWNjudyGGYV6WVeZKC5N3Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ES8NKZZjJe/AmeVFT1TCYN146FIkhA0gVcsS2SmOFCpBK9JEPcYuVn1EYhzTYglabK49RiAP4dfLH4qf3dibAOO2rh5MpEhcgDAj68IHh3cKdVKd7HJ0NlqqU875qF0d5SyMHiSfpKU9oBukxGr9NHkSr8QdZJp1Mvr3qBDqJOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwtIKqi5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwtIKqi5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e61f017091so17540425ad.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568804; x=1792173604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YdCEn0KQsIpCkNxLw2Z2IuU9/i3yh0cW61Up5RxhiQ=;
        b=TwtIKqi5EvJGdh3DTKUX/o4vfLYofmrhwY/r1rM48anIPK+tAAvzyaqR+fny7Hw9Ve
         duNg6qYnF6+x48SsIGFtpNqKNziINkhEzIs3XQoqSR7yenTXSKDrDPEmGw5l/zqwCc/F
         mL6srKxTiSkAGyoykSj64Z9nSpRXIO6uYNe54Lu7fdL3KmRUJRtNh72E5SHwblMHFHTT
         ogMwIQJfQIc9QS7aazQIgQjRoLn1SAzRWgKY880jfCDF10kOSA3iqG5rqYh+p80JoSgS
         iVzGFwlRnwSJ5N/05Ot0jnX1yF7svUd8JOQ/Q8qbhk6MB6MK/w4Aop+740I7A+sc5+NK
         ozNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568804; x=1792173604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3YdCEn0KQsIpCkNxLw2Z2IuU9/i3yh0cW61Up5RxhiQ=;
        b=PnPvB60bMm6bVd0+zGwjJ5B5PC/dL8hJnR6JM/3CIsfVg4EtbolcTNTtx0J20X0G+2
         mgzFIq71H/XcCkBFGwoK1jav2IKC0XSnlMgO4Lrc8kJcz1+WUYQRR7IE1QuQVq9xL/r2
         QtTuAjLPNcIhTC2mxNQc+y8D9j+52XTuRBWeQ1uID6K6JQG4cAcvjryy7skElrNVNL5A
         CYUiE9c2gXDhOnoOPd+I/c8fB+0tz1qchqyeCZQ1LOk9wNKBXumwxdAnaHp8/4uL2uN1
         8fLAMNilfWTmAqpeiPa12+3xYOOkg1Udcq7ufFR5kr5qP5NCuzll2Mp+9MnvPAkBGNJO
         2xJg==
X-Forwarded-Encrypted: i=1; AKwUvBzVeoLMdd1N3MNpE3NoNrIkxqHBddSOOg/pUq++7D73FfYLHFqOKZBOMozJDnzR6n4oIyD2+lbh7SAH@vger.kernel.org
X-Gm-Message-State: AFq9FYKuMM7w9GNGOwPdvzwL4y752Ft5vaWO2AEY5Yf6/4zTRgiumNOY
	25wr10RiSEnCFJ50pIHaZgiQoh8i7ErTa19ajRMUIEuCQpV1386K2+aU
X-Gm-Gg: AYBFou1p8JYKf5QDoMPaKI0bPqQ7COycqk3zZMoUZM9+v4CR2ogEEH4/DL1KaC8WuC2
	z+n51PP2YuvM9L4hO1FsGeIipjHtR9D6eUOW23nsXT5G4GtCwelcclpxY+IG4Yv/kUCDVK8boG6
	A8L8MdswUQZUf0wynZ7B0XmiOnnn6K4rmFtwGTSQtQ+Az+SJ1EN60wmnpk7cqllvh9Bv9lO7o7X
	rAH08i8pU4vW74eqTRfRnns420eYbBcfk9Ar4Q8mvD87e5iZHChxKZn+BYjzXttwO+jF4HwQIFf
	EU40TNUWhmDrcUB2tMFEMoRgbLn1g9uLdCoFrbmR9Iuux7JwX8FEzwXh8ZQ1hxUMLXiBh2Fu/Ve
	52XK9ccdyPCNbtITwqd7iCdhDFRxImMadv6Aj2AgiJ2ovmujKql72gOG/ZXYyEFWHNanjQjw11Y
	11CEKc2mzxFhBpcc7vOkV7+iuFtIdV4+YE1XrNE2LxaZ7MQ/2pGFcc8hO6Y68CmjAsDL8FdxvMs
	sd34V6qFH+3onT1SCGJ/u1tGQ==
X-Received: by 2002:a17:902:ec84:b0:2dd:c100:b2c2 with SMTP id d9443c01a7336-2e842cdf949mr24077305ad.45.1791568803937;
        Fri, 09 Oct 2026 11:00:03 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e74asm14167105ad.29.2026.10.09.10.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:00:02 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Frank <Frank.Sae@motor-comm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 3/3] net: phy: motorcomm: Add cable test support for internal YT861x PHYs
Date: Sat, 10 Oct 2026 01:59:32 +0800
Message-ID: <20261009175936.428256-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009175936.428256-1-mmyangfl@gmail.com>
References: <20261009175936.428256-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TDR cable test support for the internal YT861x PHYs, reporting the
per-pair result and the fault length.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/phy/motorcomm.c | 113 ++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index 7078c4a0225d..463e1ea3efc9 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/etherdevice.h>
+#include <linux/ethtool_netlink.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/phy.h>
@@ -300,6 +301,19 @@
 #define YT8531_SCR_CLK_SRC_REF_25M		4
 #define YT8531_SCR_CLK_SRC_SSC_25M		5
 
+/* TDR (cable diagnostic) test control */
+#define YT861X_TDR_CTRL_REG			0x80
+#define YT861X_TDR_CTRL_START			BIT(0)
+
+#define YT861X_TDR_STATUS_REG			0x84
+#define YT861X_TDR_STATUS_BUSY			BIT(15)
+#define YT861X_TDR_STATUS_PAIR_OK		0
+#define YT861X_TDR_STATUS_PAIR_UNKNOWN		1
+#define YT861X_TDR_STATUS_PAIR_SHORT		2
+#define YT861X_TDR_STATUS_PAIR_OPEN		3
+
+#define YT861X_TDR_PAIR_LENGTH_REG(n)		(0x87 + (n))	/* in cm */
+
 #define YT8821_SDS_EXT_CSR_CTRL_REG			0x23
 #define YT8821_SDS_EXT_CSR_VCO_LDO_EN			BIT(15)
 #define YT8821_SDS_EXT_CSR_VCO_BIAS_LPF_EN		BIT(8)
@@ -2563,6 +2577,103 @@ static int yt861x_config_init(struct phy_device *phydev)
 					 sleep ? YT8521_ESC1R_SLEEP_SW : 0);
 }
 
+/**
+ * yt861x_cable_test_start() - start a cable diagnostic (TDR) test
+ * @phydev: a pointer to a &struct phy_device
+ *
+ * Returns: 0 or negative errno code
+ */
+static int yt861x_cable_test_start(struct phy_device *phydev)
+{
+	int ret;
+
+	/* auto sleep would abort the TDR test */
+	ret = ytphy_modify_ext_with_lock(phydev,
+					 YT8521_EXTREG_SLEEP_CONTROL1_REG,
+					 YT8521_ESC1R_SLEEP_SW, 0);
+	if (ret)
+		return ret;
+
+	ret = ytphy_write_ext_with_lock(phydev, YT861X_TDR_CTRL_REG,
+					YT861X_TDR_CTRL_START);
+	if (ret) {
+		int err = yt861x_config_init(phydev);
+
+		if (err)
+			phydev_warn(phydev,
+				    "Failed to restore auto sleep: %d\n",
+				    err);
+	}
+
+	return ret;
+}
+
+/**
+ * yt861x_cable_test_get_status() - report cable diagnostic test results
+ * @phydev: a pointer to a &struct phy_device
+ * @finished: set to true when the test is complete
+ *
+ * Returns: 0 or negative errno code
+ */
+static int yt861x_cable_test_get_status(struct phy_device *phydev,
+					bool *finished)
+{
+	int status;
+	int ret;
+
+	*finished = false;
+
+	status = ytphy_read_ext_with_lock(phydev, YT861X_TDR_STATUS_REG);
+	if (status < 0)
+		return status;
+
+	if (status & YT861X_TDR_STATUS_BUSY)
+		return 0;
+
+	for (int pair = ETHTOOL_A_CABLE_PAIR_A; pair <= ETHTOOL_A_CABLE_PAIR_D;
+	     pair++) {
+		u8 code;
+
+		switch ((status >> (2 * pair)) & 0x3) {
+		case YT861X_TDR_STATUS_PAIR_OK:
+			code = ETHTOOL_A_CABLE_RESULT_CODE_OK;
+			break;
+		case YT861X_TDR_STATUS_PAIR_SHORT:
+			code = ETHTOOL_A_CABLE_RESULT_CODE_SAME_SHORT;
+			break;
+		case YT861X_TDR_STATUS_PAIR_OPEN:
+			code = ETHTOOL_A_CABLE_RESULT_CODE_OPEN;
+			break;
+		default:
+			code = ETHTOOL_A_CABLE_RESULT_CODE_UNSPEC;
+		}
+
+		ethnl_cable_test_result(phydev, pair, code);
+
+		if (code != ETHTOOL_A_CABLE_RESULT_CODE_OK &&
+		    code != ETHTOOL_A_CABLE_RESULT_CODE_UNSPEC) {
+			ret = ytphy_read_ext_with_lock(phydev,
+						       YT861X_TDR_PAIR_LENGTH_REG(pair));
+			if (ret >= 0)
+				ethnl_cable_test_fault_length(phydev, pair,
+							      ret);
+		}
+	}
+
+	/* the reset below does not restore auto sleep by itself */
+	ret = yt861x_config_init(phydev);
+	if (ret)
+		return ret;
+
+	ret = genphy_soft_reset(phydev);
+	if (ret)
+		return ret;
+
+	*finished = true;
+
+	return 0;
+}
+
 /**
  * yt8821_get_features - read mmd register to get 2.5G capability
  * @phydev: target phy_device struct
@@ -3206,6 +3317,8 @@ static struct phy_driver motorcomm_phy_drvs[] = {
 		.soft_reset		= genphy_soft_reset,
 		.suspend		= genphy_suspend,
 		.resume			= genphy_resume,
+		.cable_test_start	= yt861x_cable_test_start,
+		.cable_test_get_status	= yt861x_cable_test_get_status,
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_YT8821),
-- 
2.53.0


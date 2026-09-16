Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF12511E78
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 23:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602768; cv=none; b=F57o1rZ7G0fmWNfQrT1rfe3Ve0aPMeTCCDdWjegh5+Y3tRoCrQpl8j80XuCrQEHL1uuE3kB3Bi/4sOz09OY4TkrA6QCUf8hz79nlNyLwRorY2TWOdGRkmmlw+hBpX44VgydCvVfz4sWJn5iZoNPMNVfiFFaJuMfcFtCIZGMZLFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602768; c=relaxed/simple;
	bh=b2ZTj/hqac5Bu490z9HWnfJ2mMnQbukUiSmhlGwiJTE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRLbmWBWdwX69iWjQqglOKwEHTpmK3DSKpvXtfxZ/7S2ioMZsk8CubkBdOf1rjOCnHFArJWD/tehO8r4NiyguKzwPPyG4ufzMHc32l6SUDW1z8xbJCOzx0TN7zYNWRCEo00WJkFYYaOusxUudA1D5JHs/b7c5NajUqXKXfqott4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffRDvdQd; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffRDvdQd"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so178332f8f.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 16:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602759; x=1790207559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3dUdIXrb4EJhWqsgdcMtWptyH7euJr+vzXL7VI47qrw=;
        b=ffRDvdQdJdSdEZbHdezewo5XgwqPANFkGDS9y+f9rcNfBHbocxxaRI/YSlX29itUTj
         RjT31LKJ50H6Id2lOoTrgsxL7ylFAZ1R94lO/+ztniZmSdvBxWOYKI/q0sIi+EJoG+Fp
         huYbqfw+eWpQF9EkQhe3DkzA7kcJjYcJr8qEbieiXh1gTqeE8JIroc26ef9V0HLLxofa
         jHEXyWI9yGlLTtoQCRS3nbeGgz0HOS3wGPHFmrqGS6Pibcon9j4CCOM9A1xO/tKEh9Pr
         zVwfYmtUW0z3gsihfQNWp68YGlWsY2qdjxAJCpOPb+bxNL80wdYVlJKd5QttjeydAplZ
         bozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602759; x=1790207559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3dUdIXrb4EJhWqsgdcMtWptyH7euJr+vzXL7VI47qrw=;
        b=RYco9LQgsK7elyEY2jCH3Knc3OopnA2g/WhsHKJu1VSn06lqjaRVMPbr5Z+PMoZKzY
         VJQfdsMJ4I0cJZ4T2lEVAHKow3b3ryFH/g10XOVCOjK7DRiaIa9fUbAQ8163/VaqoTlU
         6PkuW2QWqTRjZB3c3lJFSW3xkEQUcz/jH6UqxgaNrGnO0N7eygrpGZsf7mN0mnQyVIK/
         BuFtPB7yzVsttWKp5ui5FkTEFPw4TzGEHJYUkJjxfcHHN3RHOwbUe2khxlcw9Grz7ule
         IkzH3yNVIIUAjjgQ8U7YZgix7sxfcXE5827HtogjZeaPiCmGo3R/XM4fHNkiTFvUR4am
         XDkA==
X-Forwarded-Encrypted: i=1; AKwUvBz4u/19JS3lteE2KO3jDH/oDV9rqX5iKnxi0w/WBcJT5Z1r/mNxiB0Wxwsgbev00E9TLdIXJIMW0AR5@vger.kernel.org
X-Gm-Message-State: AFuF++myFNMrVSfIW1aDbHWwfrw0Rt6uPk1gS9MZvo1b7dlNbDzQOZFQ
	5aw03OgJZY8h2AD6a7G/eTj8+usUFxtc8HVgaM7R6UtwXH0vTdAAlyoc
X-Gm-Gg: AYBFou18fPjRosnifKdMTW8jBzQ0yWXXZiT7qt3OZqJQDrRHYgF798Gr2wdQNPwVK0s
	mmymPyY7q+0auScBV9VJF3sesGvFqessU9tBL6Y5UN20NJEw0XOOQYpX8Df3KdsN+ki2InqZrqi
	yKrpI1iXemZfnLcppf7+L35vzgvQi0as0uCaMYIRdbbrPnrzf7HS/TFqf18um9K881tjmVVnrkJ
	DjbMV3WCutZp5ykPi8o3uOFrpPDszqVW5B7aaItsXLpw3JWFk7JsFyVXycN2HveTuhQAwRWEupY
	C3Q+hx2iWLaGlCoQz4k2Gtga/J7tDJHJioiHTdsClSYVdwVTd8hd0RLK+Y6MdIgNyXrtqndN6tC
	DDuaHPrGM0j8+ICH4ewqPd+FMK/cRAtgPx1x5+dScKUV1zr7UfMe5fqUtsRXJHc4gNu3fXBfDtR
	VxUZxKyy7HXk2OylWO+7XAYvK7M5Cj/7duRUcvvat219brbpG97bjC0+SdkD91c5fc3QCv6cqHX
	d4UM0JdVJOwYlf0qA+xCicYqMKI+HS4pO2n/LKoS4qRvq70rJykEDDe0Jyd4b5b
X-Received: by 2002:a05:6000:186e:b0:487:1413:c644 with SMTP id ffacd0b85a97d-487152180efmr1035266f8f.30.1789602758928;
        Wed, 16 Sep 2026 16:52:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v16 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 17 Sep 2026 01:51:35 +0200
Message-ID: <20260916235200.20712-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index fb3fb522769b..4edad9b3c169 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -989,6 +989,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1701,6 +1707,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index f06eb8b6f94a..f03c1dc0a4a1 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.55.0


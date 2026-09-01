Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14DA4749F2
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251441; cv=none; b=fSiW9YHrFYwsk9DR5Jkt2/IjYR4ln/BDLnTVO2fK+yjPrWC9+gLgFkCb/sL/lSP8K6ZnOs9n0+q63JyRcYVZtNWLb+Kseutbhzpk+wWody+CT6Odk8OKhYpGyOTEqd48ZqhZEhS2qlyhcdWN7RK0/VT5m9tlm7wkRb4LkN6+Kvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251441; c=relaxed/simple;
	bh=A+KcmemH3pMaAVs3lMVfxapvO9ST6yn6NewQtddz0kY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N73u0Sy6WrjxzXnw09UXd1QaPaDWor8zR1pLIAPea/AEDBZ/Xxw5OZ0yhDQKRk5btM5OIrgSGWBiophIArpMzHgccXDDkrIzi4CQfD55w4+5eyQenC1ALZ8ESbNHpIZFoYCT53k+E8ATo2CypxK/PkVd92X4ealzp+46EpI6GyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/uPYQ/O; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/uPYQ/O"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so658819f8f.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251437; x=1788856237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1bFwMN34t/laBcuJvUM/XSHQIvcTBfIZ9zeEVi8dxW8=;
        b=m/uPYQ/ORunukT6fcky54EqVzE2Fsy+v2PILLZzk9hNYWq+ytMHxJMkT+eE01PZJx1
         aeE/3zbRwv2N12mnnCPpxeQnbwZ3f9Br2XLnm4V0/QuSJuyryB1qm2by4NLac4nXUIay
         IkEyMZwYy+6hwmOj+07W3MvTc25YqBXq50Pj8+zAnpB0PROiWo5+ree7MhXdey2cjFij
         5zLfxe3xOug1PbMkO7GDUCp8kkhSr7VSI4jM3E9EY4ImE/Hh06ZQkvLJZ48IV2NnMyT7
         RsjTYsmO2Zq/bNzYbKjinC0+fsPg4SsvdXKMhs2qph7PpPAft/0jiRwhCtyW5A/DAYYr
         HDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251437; x=1788856237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1bFwMN34t/laBcuJvUM/XSHQIvcTBfIZ9zeEVi8dxW8=;
        b=YRZJtpPSqOEqEtzW7yM24WIpxZAJYGlDw/Y1hUjcaMmpKxU4HueSaekHjQsUEK4c4l
         dhUIdM1AS2WsnmkGBLxkUfp310rJva0rf97wKvc39xXayQT+gOGob+rAmGbjj4Vz+XXF
         ZYrlR4TgEs3dGyKHPkHTeLRxacs3Vu80mww0YOmjyX8DyzYV0Yx8n2UJ05MiBIX44U0j
         xlZZAmzYvnbgl10nAENENiaFrIg3w1agTQFbdczYV2Vk2TXPwOhduAcMKl02JaqeJlLK
         Q2enwCOMG68GLoFTvel6CX9pArbXwUZujQSXvB0PDFvqzh2IhyhpFT0PNSJbffkc9vCX
         4pAA==
X-Forwarded-Encrypted: i=1; AHgh+Rqv+XNAphpMvrg97OSNbYlX848Kz6EMdOn2iaTDwCSWp9h+9M0PDAqUVF8xwCPzFficmZ7bJ4v4VCgr@vger.kernel.org
X-Gm-Message-State: AFuF++mKunrZb4CuBBZOYdA9PLwrX5bAHPRqUgzS2U2X7YbjSYTl9fml
	gttXzG+OV2XC/QNs4aK7nBK2MAhg27wdqB0jn5LleF7LqHHoXAP1vIlG
X-Gm-Gg: AR+sD12mZOV0bVcEkOh0xXQ6LB7g6p4cUzkFGfPFCcRp8D+Ks8TSppZq3njZzgeXQnL
	Ktl+QVzkZMWMjLwBjU11E9piC67xKxG4Hx5IZNef+2mAwc+0G6/TCXFVBMqHz6e2hB5DI+jHZk+
	dtdzhLTMMnYmJNBu8viQgmaJLbVs5+lB/cUtn3wQgIxChaxEpYdxnMfouS9Xgp5JkJOMYjiSC4w
	N37oX6igFN5HgpfPYkMUXZoTwZZjKasbspo6xLmmjqqqtSxWFWOtjZE8863QiyBVeKs9jTg+89r
	eF2b1/RuO9f57U83fLehBAe6TOXzqMgsaguUH5HCQvTa0Eb1HptTdB1ROKJMN3pHFPJNYhVp+lr
	FHQwi+J+mtA54un/nrti3hvwgXRd2YN4Etn0BgvhM7mDGiIIpxe+Hk3UAuJsAnNSgAP/IUOY31N
	k+h0ipryPfQOE4p2+uXb0eW0PMo68opQyn3gyhusFHvH3VtmwlR3TJe5R3YyqWfJx+hpazZramo
	nQQIrAEKRNwyzse5SDaBwixl65wqhcDld/IqA/0ag6iuu4WopXX
X-Received: by 2002:a05:600c:529a:b0:49c:cedc:3c36 with SMTP id 5b1f17b1804b1-49ccedc3cafmr333314475e9.16.1788251437016;
        Tue, 01 Sep 2026 01:30:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:36 -0700 (PDT)
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
Subject: [PATCH net-next v15 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Tue,  1 Sep 2026 10:29:24 +0200
Message-ID: <20260901083001.8044-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
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
index a68d77ba5728..e5706b008b39 100644
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
index 2c647238c7ce..87dc0f27dfc0 100644
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
2.53.0


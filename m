Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44816446C0B
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610179; cv=none; b=pocJEte7rmkqWwkirUZaoPjUPYUAJOK6ZXLJ6AcoaVgknHfUlRLZAy/K0AW4UjGlPEMXVBg4POdySSsxoGEoWvgQN6cE8J7+fI/s2CQ67Np9j2VOcpLsBhx5WKZ9gtFv5oBXz2Up8X+3E5n6DMH758sSzpAwA75Aet/HtdxnQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610179; c=relaxed/simple;
	bh=f8kJ27Dkx0TxjXOX+bXZ7Ym1uaIiczOOVH2pKLOBE3w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWKWNgjl4LXomo+m1LYoFSUOAse9acZ/ns94g0bJcMSxeKQUIHItIa5MY66uvFiVNUjfX/Ccl7VFQ+DjOWowSMsSO/nQGmmCW6GaKVN7roke+EmLnvMulwGpvci1+7qKaK0JnVmgMr3Cd4g92dgJuRe+ln3Lr2T3b8TTsOYpbEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pS8JTyzO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pS8JTyzO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495437bb891so5968725e9.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610168; x=1787214968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e2Ryhc7tn9LqwHTaax5YZtF5C+ZMbKW52Z/rvi3GeNM=;
        b=pS8JTyzOtx3ri69PEx+8+S0f6CRe8UXCJlVu05qGZSXhBtdpXxHS0jqtAwF8L/5LvF
         LC+K1iweD231qCqRkm+CMhXvoiI4EmdNoRrvRAU5T1UWJT062mfAmuBecMu2kKrs+La0
         Yra1kLgeyjcACFkBfelyCG6qkLmhoBjDFJBymcbWnaXrtb9n574H21kHsh9g4wXtnbSv
         b/wvHCpyBj+C4mqctu+MK0VgrPXOpjWxFK/REzvGncswjI9nvK/6NiZj06xrZ3ZA+kWx
         LnFvQqlqoLJ3oSb+T+w0zjb0lQGffr2NVGzBX5L3NUEN/NsrrDKPJlpH4ybKMDYYfRb5
         YDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610168; x=1787214968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e2Ryhc7tn9LqwHTaax5YZtF5C+ZMbKW52Z/rvi3GeNM=;
        b=dLXalOShFnlPwDdP42z+mLCY3wSN+ygOEy7yggMTXZ5KBp48GGsSbZOoECyOXprtZN
         PKZW8P0OsZYhWgBAjDQ/cYpfiI5PRNkRWgX5kYaidMnShecDn6xgQ02Y3ijmlIAjhKD3
         go/Njni8SRLkiMvZ1xn5Occdknsjk4InpQ0OO4UT63ULUOwgBvi0Othyb15VIMLdtUlF
         Y0jSJImuRGQb+tdAFl9fuaiGxEtZg3MKwdwnLxTwufKupbAYHUkn15eLsCzqEE9HNFPz
         DybOSsL1dwzYIMLbwrVtd7gBgjwPFfpvVwa9deIERrGJiBlG/3X++2GlwPhi61yCAfXo
         Zv5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoHh5IUzISoZYcS3CNtszUof3QoiCFBCKBEW+11x8TycMw6o7mJy6tyLXEEANrAagln9liil8deSNSm@vger.kernel.org
X-Gm-Message-State: AOJu0YzqxVJLEAffx++3DE3ZIT4YwvhShKDVoPPbaNM3KUoKF1aulwVj
	s3Dboo5zSdmChKHTJpqKs0BD5Wb8/FiZHA8oJziNJkAxRXyq51r5Bu/4
X-Gm-Gg: AR+sD11BVe7FKTkDZOfxo683QyumbqcuNSpR8ntFkCAIaLPldgST+q7NK2NVoCZhRQ9
	f5+aEBGIx5591UP7mqfyiHAXqy4OgdSUikaysiq3xtqs+d1Ovk3VywMitRJysv3mRjwPXoc5zqA
	HKzIUVea8VUXFwjWmRhCpbf0FyLbzpdXofth4LANRnkn/UlZboGLB5VbKoWqF1hHgr+8aOijeTW
	PM/ZOBp0EQ1IKJD68ZKGmfFdKQP1QFO3Aqm7k/CKdlskVCfbORQTyebwb3muP+r665j92tjwKfF
	a/PSJMRSN7u24kaWBXwoR6Wet4hSVxWBV6NOqlBhWPivESzVpN2M0o9RdbKf+fmxbBXzvKwZIwB
	2C6q6z7RHx3+aa3bLQWiJ06viNqgeVBlmqoHVcTNyQm+zJoXuxW9SfI7zkAlvAHysSY168SyRkD
	owwDtl8FeQeDgPPZw5bRHJj+swwndwR3mMnLC3Mvk/apV7Ny08YvgJRSY4nnL7s3J0+FiTAqvpS
	ucIpNEXDwqtKDpDygaFONdO4lxR3pxtAn3oxWvFJdqPqi5+
X-Received: by 2002:a05:600c:4584:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-499821baebamr37440205e9.0.1786610167928;
        Thu, 13 Aug 2026 01:36:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:36:07 -0700 (PDT)
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
Subject: [PATCH v14 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 13 Aug 2026 10:35:14 +0200
Message-ID: <20260813083536.970196-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
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
index ba3efdb0a194..34dbe89328b1 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -990,6 +990,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
index ca9dfc142388..ea554c0d41f8 100644
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


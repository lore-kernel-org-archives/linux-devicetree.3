Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107D63F39FB
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526662; cv=none; b=c8n4qfSKxtsQL4jr+Ait8lleGv/SUdmUU/iO2uLuyBMOJQoTnk4UCGMCWmhSXBYcFrP2ZRlClSJeNTECA2Cgn6KhJPNpLHIMQ/hcmKMw4pT6qGD8blXc9jnxd8Qp+3rFxDSAi+BFU+D334whHSQNTJtETzgjjN5i+H4qh5dpZaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526662; c=relaxed/simple;
	bh=30QNHt/uyMqU2qLsz6aFbvIpIdmUJ01fiuBt57q5BGE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bV+wFBV/Ga+FvJ6jkPNWpFvBRqNqxXsZ3uUOBgYoaxP0s5CjayLT1d046ntvM6xDPCYAFtc+LfC09Ddnn7Tw1591SLZ1nqnoXVvv6oriWED2WJv8q5fABaf7MIfGnJBMjaiucTDfgEygpgwnDBcRHp/AQmuph9zsUTAnKxo0Cb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=stefvXel; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="stefvXel"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49222b6e871so18961255e9.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526651; x=1782131451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=;
        b=stefvXelEs7+hE6oUce+2bPTXSQvm1qihydmKgnMkC314GQI039Ihm6aYez/WWlAHs
         j4/mlU6dlnxkyKnx3tsooeL5HlUgqYNY7yizh9e7YkZf8IAgWM9j0QYhppNor0DC7H1j
         AyYMv7MfYCwAfTVJJBy74tH9zVg0CbkB1MoSD/ewR+kBihBh8h3ls4CLcnZ8+6FWLbxT
         uPcHL2YR+N5Z8fzN4mN607PHJmTi6UUVVOyjPPY2B1idvG9DdIl4W0Q4UjtnCv6d8Gaf
         yx+s+57nHPdbmUUNWS+n8eThuo2n7uuS6aszqC6fYRCexUDDp2no/uQ08HJpj59wXOe2
         T+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526651; x=1782131451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=;
        b=jFNM9bF0G2gB8rjLcTVN+//qN2XQpRLbf5r2V6+zQJahCIOKBVj23Dg2T3G+zWvFsq
         bqNbZe4amuZbdBFjWA1TN6FjQJ+0dJnJCDIPLLDErxMutvveQq307MqPdfRgYgCRw9tE
         82BT77P8PHIYOL/Tj+TQ2zP/1weyFdzoJ6S+USpqWiff1QsGwMMnLS+L111JYyk4C0Xy
         f4K4esj38SDjcx4ENEVyF3vNyT+wcJHGf6pCIDVZoiAJCS8iTRwoLLYu0iLRSAK80Olx
         6oOZOfh8Z+lkfpRIVeEew9S1XGgQ108qRJEtvhWkyO9k3UxC8RxPDdNkisb4poa3NAhE
         9qjg==
X-Forwarded-Encrypted: i=1; AFNElJ+Wopd40IwrswjADE5G030TKtEVPK51YkYz9gnlqgncu/YM+w/0RZygbDkLa0gscpVB51OdjJLrh3pf@vger.kernel.org
X-Gm-Message-State: AOJu0YyBjkPIIIomnV8ufAwCvSpV3xun03zYKLgmnlq0L0vd+bPtihUR
	QZCIIz0XmtWTgOu6zJAyO9EwjxcOAovYNEXr6+CJ/59/yIYMX453PjmB
X-Gm-Gg: Acq92OHT9di3zKHm60nhU0m6uw98BpzWGbhUp+voMhvwggf7TJ9Bg3xnE7nh9BgoC8s
	39izXQjWjyZEIdlsI0S3iJkfSVNOwSG6HV6x6vTCiqdkLUs7AGIUyZ5DmCbAA1/2xM6ByilbioD
	T+J2hKo88qCE8fgQMUQ+YYLaCVsLlGBAF1ez9Irhp5wM11/QvurbYv0RfPt/bgwAILMugNP1Yt1
	BACVVsJS55Rm1lHu0viL6SWvmhWnFjOoCIdedMKF00IWmWJW6Xe9+UuyXgYcFziOhZKQIKioZhf
	54/2toJUAsduCWXdqhh8sAnzImgDQgAEFQi8+2sEFRRrtA5aIw6JFr0DKWTWekmN1Qij/FPadfQ
	0oWnDydrQU22XI+JZ0ZXINgwb86YOLkCzJWZsJNUfkxo/Ufj8+Bc6GvH8Xilnm6iPFgFwkL9haz
	WzoBcQ3z9VwflbphWPrxmvjjCe8uwY+i5ZiAqrYegOg4BbJw+GsdEUSX8=
X-Received: by 2002:a05:600c:4f83:b0:492:2c87:3d34 with SMTP id 5b1f17b1804b1-4922c874027mr31192735e9.15.1781526650826;
        Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v7 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Mon, 15 Jun 2026 14:29:45 +0200
Message-ID: <20260615122950.22281-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
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
---
 drivers/net/phy/phylink.c | 9 +++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0734c98498a9..1bedac517d21 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1035,6 +1035,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1736,6 +1742,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..eb6c6ca34147 100644
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
-- 
2.53.0


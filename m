Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1363FAE0C
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787514; cv=none; b=SBvnJ+Z0G1KDH1mCJLXf1XGrK/SUqLOPFzpgVaADTRehJOn9wyOLVRkV+/tYuDdWB/6OUEk5w1BvQy6IG/gOLwU8p7htT7up43TBGfAHLGXoS3ialbHcNnllDAbgPqjq6F+5UDUNqkIU9nrMkyUsxZgZm+j3rwBjbXIwN5ADEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787514; c=relaxed/simple;
	bh=PvW6l55YU7y+D1r30THykltDeSG0Og5W68W5V8wdrbs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIep1DKBmvQRaHe6SiJhO3/M903SI3O4FVg7FQMb+PwC0o8OrxpqoOwzXYhePXqUUgkeL0HFz4fP/cogo6YsXdThEnGVr72yacfrZRzFaWb8WG31NwEMiU4LTIKo3Uyu3bLk0wbq/NuqSTlf60FS3QwiTRHxJHjr9cwbPEs2vZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A83lcs6k; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A83lcs6k"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so6777765e9.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787509; x=1782392309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBpoQAlaT8nFCgwnSUFeme66HFsPGdI0rDUBeKbrcl8=;
        b=A83lcs6kUprWekHOGtNbuS8uIh7+NCZaEtZn8LMixPUZaFqalZwaQ2TkW59URmIZUl
         K7BaKYOTa3c8GBU4T1cZ79TFvjSBj6SuqQkxiImd9q23+TOYGvR/JbE79SJ3IwadXDDy
         FklXOfjAeYvEGu2zmsUB2zt0huAR8+KCc4Q2SCT3WzRBp83EiAX6k83spx4LNxlx2Dqz
         l92PI5a8fwAF9kWVfJ++F2DLSKI31OygT11+X+zhS7H+mnr4SFgeO+mfVMSidjQf5S1f
         DeJbxhOPIC/JeG6znTErJu6fnGkKyq+8XuqrRluNRsuzLVuiyZ8yV0F4CHVSDamk6b5b
         5UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787509; x=1782392309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBpoQAlaT8nFCgwnSUFeme66HFsPGdI0rDUBeKbrcl8=;
        b=E+2fLwXGdno2kDwpe15AHqHmxAiIYVCb8CJGocMpvbi7KETFimo0bd/QGq9dZdvHMs
         u7Jw/9/Vm8F2hN4/jabgJVWZto4kXsvlhwvew2zzpBprtOyKm1fMAv7Vr4XmRKTmzaqS
         YjnG/Oo8bo21llHsAt0ujHP36FDMv1/NT8s3ebWstenRsbBFG5KjlZf70I1PbB1Zp6A1
         jrLGxl/LOUIM4Ml2/xAdgA2J42wmr8QF5oKOapoB7VkzmmjDGRFwIvbsrDM995GNCsDi
         Hp0aFqBMxvjzmnuJyJ5okln64AuqQXiHLgvveYv1uQDV6ZsNPLNQlMT2FS8R+fOhmilg
         J8dw==
X-Forwarded-Encrypted: i=1; AFNElJ88858SUHjXilrfj/dTpq3VYyFEtC6GJALOkU/Ddgb+61s9QQVDilPsXEwU0FBNOnWWVywUWzcmKxVq@vger.kernel.org
X-Gm-Message-State: AOJu0YyqzOoqMGTTwTx0VQzF+hzxPd5f2P+oyOibGKeno2sBoUima9gg
	snSIOutJ620FzuxW41xx3CyonxYRF4vgQn84pG+Et1wFXajKyFIvHsHa
X-Gm-Gg: AfdE7cmEZ8hL+k/GQPhJch23ENenrrKNC2HAXIPZ9OZg8ROSHacO7z+pUQUAAlusl77
	B8Qlc9ZeyARs0SINvmGg0ELmKMnVQ4jeVu1hBYzUdQX0KqRdFfcrItz++74OoR/tTtE1TYTLbvn
	OIhait+L4DUkMf/wooZxWFkiqYv2tZPfLkbVFNsq36qdK+kjwI3x3G4TW1qmHx9lcZUqOcKDxOU
	aU2IcuwCfA95qcNbVfq5/14sstFczMDVAnAg2Aahhdo4oowl1ztQX7hzcP61gpL2HtPQVsF54C8
	qHNBSObEzH/VXbdMC/etoXw3mdgC8bWBA+H5luDkYjoh9BhCJb1Vo6sbcPXeOCHzTFp96bTkcjF
	1WtPy6qWHs3LqwhxT8DYaUij+Os6G1G5SFjnbHWhR93CEydWp5Zd6OdEoCPc3fh2eXEZbpPqQou
	G8T+igwzqPG5ZFxJE8A+vzPmwPBTItjt8m1li5iB/OStquFA7OJvAjdm2P77nlLw==
X-Received: by 2002:a05:600c:3148:b0:490:b5d0:598e with SMTP id 5b1f17b1804b1-4923412f0e7mr127508315e9.21.1781787509280;
        Thu, 18 Jun 2026 05:58:29 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:28 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 18 Jun 2026 14:57:17 +0200
Message-ID: <20260618125752.1223-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b9a212bd1206..b2b1d57dacd2 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1038,6 +1038,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1739,6 +1745,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..ecf4c384fd31 100644
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
+ * pcs_link_up() - tear down link between MAC and PCS
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


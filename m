Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D542D1907
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271333; cv=none; b=Usx/d3qwyuYaD2nh49iLjED8MtkZh0OP2dphn+urCLhJa6KSYP/mqzKH13vBzCueGIvlnhciuKC1/xuFfAYFPFGNMMlKExbx/827Q93++i/GJokXRZi3fQJYTCKNkApxvwBffhAQq13NRxvx1Nnjn8E7RRZIlhtgrK99LqWhR5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271333; c=relaxed/simple;
	bh=2r+f9uPZ1R4h4a0Uh06IGRRG0WQkscQ8w3n3d26beRo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ihHJFv3p6iyaNypfbLyJjgYBN9PRHAxgeigylFvh6625G4QbCFl11YjP+2KSnqKg7Qgzw9JqtkKCyb7TvmzsGLWnmjCFW/X6uLSUt5O2kBsuTEpsF6HsIqfgHgLy4oAnCSsRDDZFQ1say2hxrXNhPu5dZ9F/biXyJkg0km0HZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pzsszMCX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pzsszMCX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so53018605e9.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271325; x=1784876125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=USxuj5cdXcSxjhj0RWDyCY2SPnAhuicY80xMgRrTLdI=;
        b=pzsszMCXQwQ6w+pscj95dpEQUhE5WyzSVzqsxzDjLFdg5wYvKLnUNrHHlBtUqi5XlA
         Zgq2ao2rYQw4Wqy94XZ9y6jhMy8WXeBPd4Q4WNHi3JKKWmvSPFzx5eYsxLuaxULmEYKo
         WcAJLdQz/HE0VrLuiYwtnuCejzwF1Vv3sM9xuV6gIZLlndaFPXhG+/J+PO/17J8ojRQF
         09dsjDIf7YDKl+TsJ3oB+3hIeZsWiGcAcDkybO2UvJEF3cSnbSHWx3TDzU0J9a52Btze
         mN7GkT3A4KRtSHEN6NubQOeHjnK5uth/2qlGYUHZMtgL2xc3BsmkE+V1PbvGM2AqDBT7
         GpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271325; x=1784876125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=USxuj5cdXcSxjhj0RWDyCY2SPnAhuicY80xMgRrTLdI=;
        b=HOJAS8BrPCjnzSyA2Ns1oUnB2xwWZz8WJ+xpMK8eW9rIbRVqKHSK30C54/ZzHBjyfZ
         mdlsLkrbliDSVhwt301bPeW5aAFvkZfszFLeVFBfhkvlxx3WE+dihMHZsy8ez9xcj34v
         I9Tw1/wXvmlIAkKrrYu+QGBgOMhfh5tiNX8t1E1NaCzDTUnJuM6b0Y9biUNpg/QwfQ2A
         dtvhTuzGvKuogZLLlbQ9Yzbu47rkIRPr6TdUvR+37PEcQs5kDjTj2eckYkqEgy/fRna0
         Jq0caNKEvIUa6MTftExKQuogwiNCJvJae3v/TRYTI9Qx9WgTdnKaIAFt6wk6DuOQQmYP
         iTbA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4jMqALOsQwU5bY/sjuj+2YBliKuAmHT/hWpNcMJmjU6YZsZtQ8Ls0jO+LGHu0EHr5XsOCTsOcbZmo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2q6KhZ02a0KeaQZBArLPGsjIghOeSk2MjwwJGX5FPcN0Mz66P
	Txh/0XpFOWwRM2e3SfzfKoxutSzWb2xwg0Zb6mczoUVpXxxwt//YrWO3
X-Gm-Gg: AfdE7cnGF5DVtUAz2wnOmBZCW9zUYVwIskp4mAGdK4U+esxbqSWCYcMctC8A4R+6m5K
	O+jliiWrCkOkR0F3rExNtjwF3ghIUIW276fmJvuDkctzQ94eIl39Ff8MKwcVNgOlm9ptwg8Swwd
	sGTw8ZsJLeDMNLGJUseJbxL6rkjMuLsqp6Blq6owbUsZ8fBe9ZSu6GUPNpMmdwwGuZO0oRI/G7s
	Afkz8V6CNFVk2/zVNbnUxMknryCZKAjDJKW7oqUFarqOMUCkmd/AjLKSjjQJOmIQh0KIn4aMMTa
	3lvQh1Yn7IpsJYGKjBMtd2YFo4aGBY7Aoh6cUvrKQu8RJy0+68xGe6pfO2XYmF9oVFYS5H2nT1G
	6j/hs35exPWMfiW/uTcuMXW8sfm1PkSZvazp0cdyswOrv2iuKqKPgfjB+B7ZZDARnD8XbnvIphM
	/9j4VwD8BcjV45Wuhm6lfYh4usHr2UoYL8Zty7YczErhn0JwdLng65I9kzeGFo6EX61coFUOfrf
	3aNc6ei
X-Received: by 2002:a05:600c:3b05:b0:493:bb23:152a with SMTP id 5b1f17b1804b1-4954a508804mr12738645e9.34.1784271325219;
        Thu, 16 Jul 2026 23:55:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:24 -0700 (PDT)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri, 17 Jul 2026 08:54:09 +0200
Message-ID: <20260717065448.1498335-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
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
index 1d83b31874fb..e36a6647d7e8 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1037,6 +1037,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1738,6 +1744,9 @@ static void phylink_link_down(struct phylink *pl)
 
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


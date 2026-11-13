Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529982;
	b=dY5zIi++B1IXZP/kr7/6ZtnbP79tT9cQUYpa7P2P5EP3e2xB/TON8y1U16YRq+tnYlZ4
	 ykzccnwzAPRq7w7CBxeOPWeH2ocdXbuVIDI6kYqJ11mrsydP6gH6hqpdZtz3VqTZpbwbR
	 iE6Xx+HonCWcXSPXQLNu4uuEH3z2P/FjfkeDV5pkZw5x9WUX700f4PtJ2wLUOn/jIn9lH
	 WmvmzQ54PIji3ZKhYJjsSU3LYDTVqrjtl0/1A0hjvqB/n3kwNm+OqTW8FaLV7n3+Sq9W3
	 B96A4pCnKLypldhYgDX0skJ2MqIzTNqHGNg5JPOKFZTW7JUdz+xmN4DSXCnDzXQ8J2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
	b=46X+rS6kYnRUUCig6e/iRpRTdeLNungpDjInvFbyoYe9mTs8bKyWsSUr8t3wa7oCt05f
	 zKthG/6KDZoSQ1ShOeByF/wpzv1XQhr00XzfEYnsqD0x7PaMzWaLaQvQT7ybR3ujgPG6Y
	 kVEKWF5yRJvG6BDbiTcMJD42+MLQhrISiLxCyD6Rpa9D84KydiNopjYvO+XRRcloV24Ns
	 76r/VJgyfnwc1uBsyRYgcvaUfAMNDJcriHLdLvnlyrFy5MU9ikbTlyMikqJs/ELorZ2OS
	 R2ASz/D4mDnWvHkRl8h09Luk5qI7zf5DXJHS6bDGboQgWHvkk9MepD7CyUYmElp9eSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvc5nTip;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAA8606D1A4
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BAA8606D1A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvc5nTip
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490f38e9688so251948f8f.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529980; x=1795134780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
        b=hvc5nTip96B3WypW3uIihCn6m8UOACa8UlNljKTVWdH79x19MqSyI6cgBLaNQ4armv
         gR8pniwHo58MdOPpy9Ukwzglxfj3KcC5cr6L+Yb765dR5Q0PbO959wtZ0DHb05+sjQGF
         pfGBu50QH2Eqdr0+4WGWB5f991ce9Dzos758e6uJ7mhb4ywCnuakfKLb43SiZwt7anMk
         3e3dB1WPyfASjC75criq6sW0pRMCmip6CZI+4WzVf1fPvbkMkD5QQl8ESvcThHzMjgVK
         TQFjnFz3Rnwcp9D1iVWIBERA0Jvj/QA9HgmHxLofrtZ43PCStJF6hlx3zDiVc/CYGHo+
         /rpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529980; x=1795134780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
        b=l8mtZR2NM0GSLkx1LFAphR5+UXtKq2UXi79Z0Lboi43UNzr1xvmLux8RDpjSxGtVBj
         fpXZE37abnmy2VVvilQPz7Qupq1KzF7yIawzPBgsmfTBMtxOfMt11QGUihGUf0Jgi7CV
         rrYFlyI3RwvTfFm7h2EBIOfbcLsca7TimJIZGSXIWx6oeqjm2wc+QOW+atJnMtFfJN12
         feDXuhXCsA3YlFQjrt0WctZXD94dTnEcjl8WygZNi6KQcU1GeXVSHR7UGDQ5YZ4yEW4i
         P4gh+o0RnevEX7lCDv++pux2vPe85K8F4q3Rg0NcsWDQEsqFkGnzZaLs1/El3PaJ4pGt
         FfeQ==
X-Forwarded-Encrypted: i=1; AL+hErFeeVTjYX+DZOnWX3J8her62E7Vldo7l9rJ0RHLLl8xcxJUAb+RRIEFnV8k5uHzo6BL0WsJhz8wFIrK@vger.kernel.org
X-Gm-Message-State: APuU4Z+BlRXtpsFwvRabGnbD1QLbuK8zssauwEd/Rw/TmpCshonPktA5
	4err94WN5dilfzquVQ2zIaBJreoFYZ7uQX1Eyioz82MPl3YzfRt+dnte
X-Gm-Gg: AYBFou0ILH2JCv2jbdsvP/9IRA6+kgcDfmpTN5EsPIdVt1Ut0LSn9ycA3zm4G8TazBi
	FYYRMS5Pzel/9RsdJzsAgDQLszdw2w/QuhvQ7BUFov5jglK0S4/WMt35BDA1tcOs7cO6xo7F4HY
	zx0LYSLH3qCpUKcLZwcX6Q/M+wD7lUoxMe0rMsicxta7mDfBMLCGs1LQJDmoW5W6Y/Fs9qJ5/t9
	4ArgOXmekLGnOra56Pc71Tf+DygoQu9CzGHWY4JemOL2t/VQ6mojoOSPBcCcqSosRsctvYFzaYS
	BwH9CHPOkcMSP/m1FpE+Nwt5ovFsCYdpTywQNeP8zHLGBNGX8OPJNLC1jYGx/FDKZKdmqkgRjJ9
	Ffc/c+C0PxdoSY1DaA41o9ixP+viVx+/fuy9eacxOmMScw/9yzv2YDNVrxy9Q6LNL5Aroibo1Xt
	DGk4Li1sqGdi28CYAg8/0NWdVuOfWcgFpe9ZchXb3cfJ/UixU+KbuP7SlsoX0pBo4ebUaO3TfWO
	TLeHEbss4GumJg/Y8Mlu3XeA62F64mOs2KPlr9HL+JoNiHGqAA3gzH6A9o5pBlDm5q8wH0qhcAs
	FTlLlaoWKj7ITX7vsIrFqamujFv/9IqWyK3Csb6gsy1CPjSrdE4IMqsFAb5sPvNz1X0aPVyZe8m
	Z4CwG3VaXGbajkbEN6y+Imd2pycWSWHEN31GpiHw2aedDS982XeCdxQ==
X-Received: by 2002:a5d:4531:0:b0:491:eb12:e133 with SMTP id ffacd0b85a97d-49c6fc9db4emr1471691f8f.11.1794529980179;
        Thu, 12 Nov 2026 16:33:00 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:59 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
Subject: [PATCH net-next v19 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Fri, 13 Nov 2026 01:32:02 +0100
Message-ID: <20261113003217.197757-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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
index 7f91cf3eb951..4f1e494beb8d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1050,6 +1050,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1762,6 +1768,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 418e8bec311d..e8c3f693336a 100644
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


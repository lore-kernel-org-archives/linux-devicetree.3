Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846889;
	b=bL84vnIogNHsMNE+oBH68HheAB3sBLqvuu1cWrZKk8a9N/q6cN9Ki7J91FH62cG/Nmj4
	 ZWhcp2SdEswlVH0xdfh66iBlBNw5lHuxmiSj0xRNvGUxvc6ZjEu2FqHEBLFp/UAo+/X3a
	 WxiwnB3q4nL+/dJJxMxT/9k42G2IP0mQD9kFYMr25TYw96oP/223XBeLRVwssVBvHQIak
	 IfrXzITUtNaNB43S7sb7E4T5iyoaY0FInVb4kkhYCdXd+K+qhW/q3FrZT92YA1oce7TMp
	 370Kbi7nv9mjkuguaNazz3lvtKWt7ZJ7PNc3AkaaIV+H8sbaqNvsrMlOuQAd2MvFA3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
	b=QfP2ln+7KTmbWT21VnbJ0w+eGJjM4QHqDjfENqJrNsKPWYcnawsgXJbp/mKDami7ytXK
	 QEVJ2b4uTX2Dy3JuajA8w68IrLevIUgxU6YbRtX0anfpAmCKrGLGYyvi0m1riUkiIjH3l
	 caKiv+rPGtdD+JcurS4+3FBYSVCrpNE66LZFSuF7aKL21W5QEcJhP2EFYHQ3ObwlSKFBT
	 WEptaunyn7CPKsN4e5IarWam3jG1OQAI2OnxLNxH7EPYJd0ENJr9AqVWF+gmgB+9VDUBC
	 jJiAG66yrezrkU/g91DT7954QdIViHXGBsJOVI9RTnb6GbXDy35QJARuVMReHLsbYdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khscm5EO;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2E4606A891
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB2E4606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khscm5EO
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so18381005e9.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846887; x=1795451687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=khscm5EO2wQ0GmDlIq/x0ONqH6COf/dtb0YR2P1Sz/VD/nyinRdmqw2SvZ4pxGR9bW
         voHoX+GHV2/G5gnrUps/Yt47XjudwHHE1jqjOAwkLZKhFNVavsv0aUjrTvp2S5M3NokH
         PUWiJjSc4HWDZVS4o/vDHG7qRLeBYVNkelMp/moV9fNJl42oVnDvQYB3vlJdqS8hbHpq
         L3z7/8KyTjMascYH8YhvvXubaDS0AM9CN+uZT8lyuq+83xgNg4zi3M5mmWId8pstYJ0H
         x1tS60tDOIZP4viUvemVb1aHqTQk/zvgnELQk0aDt4OR3S/+FarUteduUNKtsdOPeUg4
         i3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846887; x=1795451687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=qz3XL3IvRlJ915JBeznADOZnOY3T2vvHlBnVdv6rUzU6G7Z8jIXrpl05R4hQZysTq7
         oX/vAdJsgfCbvbPe241CvXJThiU68pt4WuqfA3PRUQH9PmvRopkvBNXCsGkzl8ChD3WR
         iJN0VQyytMeydo/1jiV3p4mrYl9JmydYzf3Zsxd+RCpUJ5x7AwKC5KjZfAdvZkTk7qOR
         bOEQlbdA//Co7avjnWtmiakM0vxoK/3Z2Sod9NKhzBYCkhfjFTPuf+ptVqkSXuHBqsBb
         SmnDM015U/ahZYYR+gV4YRya32PAkuJt2mo/ES6lZr18C5H10P1Mokq4cqKywBLSEi28
         K2OQ==
X-Forwarded-Encrypted: i=1; AL+hErHxHoaQT88jNPU5TPz/qEaPp3/A8H/U4lO4Nr5eumPh2S3pZEfVwUUnsPloGrcz6wSYEMQjIqqPNOKL@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wdbb/7RrOCwOLonWEOUzQ39S555gzv+OaAU0pSxDNx3ZRI4dv
	JztFznAKcfDxhzVl7y4fj775C9I3hmP9zS2wCgK5Zs+QdC3dYbWPKGWh
X-Gm-Gg: AYBFou3GnAlW2LkOKCCsfVXW9Tb79sV+ZbTJqTdfeAfXEJ3T0Nz8Fu318NHYq/CF+Mk
	50FiGqvE3LwrkTGTuj7KtTX5AMsqiayE0t1lUnAUgn5OhAEltniml8qIV6q2IWM0U5f6lM/W5k1
	IZJwmF3HsXKQa9sphW8o1Ospxp8HyL4+ArSMjksZShCmRjsjTihvFZobuaYEBT024z0dq4t2Y4s
	Iv1RoDLWXFiy25Gnc/mu/9wK39pNTUsyOC3SuYzk5RiHDkmkngM87IJ+K4ffI+lPhoqkAdiLnOA
	dc8j6g/gTzfbVBqEF6OLsGoG7CawaoowuLovX5uYcvCMKrpdpgUQ06WbhAaN3ZE7xck35y9ture
	wz+njMDrEGsKBz+Cuxb0AtpHMW9JwwldezTTkuT3NLaLjMb/2bLVMLpBivGBLQ4xzgyAXz9G+79
	5zGAftgZW42orboC4VpPDruIES4uZjfkCPJQglZlXqK05AUtJ7mhbSbEiIkQG/OXwSDM72Uxc2h
	oM49wPnUTxNv+C88ffZ/GJJzJmCg6H37FIi1Gcz3IsvAcLVIfVfVgsB8N471PT6II8C6hoEabJB
	DyYZ62sPACmxVfXclpxBHRpz61jnih6waLFrYABnufLzBCEMx2HcEkKoUoOJJLa9er9wg1UQLIk
	JGetCHIahvi9eqDQs1ZP/zPVRDb2oPFoYag==
X-Received: by 2002:a05:600c:354a:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4bb55abaedcmr236465685e9.25.1794846887115;
        Mon, 16 Nov 2026 08:34:47 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:46 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Mon, 16 Nov 2026 17:33:56 +0100
Message-ID: <20261116163412.551438-14-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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
index 8768d8220a13..bf1c5188131f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1142,6 +1142,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1854,6 +1860,9 @@ static void phylink_link_down(struct phylink *pl)
 
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


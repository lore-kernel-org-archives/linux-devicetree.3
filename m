Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8209E39EF25
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108427; cv=none; b=J7DkQIlcPjPK0ewVSHVuHrRpMBvGZagNwsbnpC6s1hGNdedr6nxvNDjoJF/jdrAAOutBmLz4IKqKdSb3nlc8Nw0qIBbHD/cJcMcImfEBswBem+YiZwjv4lCLtDdqqa3xg7/pnnntkhiLmZn+3VDPEmRpn4quNWtqZUO9Vko3CIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108427; c=relaxed/simple;
	bh=aSuv9m3SRfbbDLL6UMHt2VSLxYYZd1xdbxrhJPEfNVg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmEYLC/g/Z7E9i63+5fd/hZAB9EDsM0AfD2SspmeBVGw2Mmml7gTWmAjRH7vRvHrn3adxfidybYuhzPAKSIQBBdYOPWXnkUXXTJoaD2EoRMwUsEa4at41MULNDh7cxpGMGEsdlFA6n0bgh8aUp1ml/qqKhpKnRoLk28cxNsAb6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP1ipZgX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BP1ipZgX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49558ce01afso24293715e9.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108410; x=1786713210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DAXATgTkufRgDBElO/+VP5qlX2m9wHSj0la+spoaFT0=;
        b=BP1ipZgX2ufZt0nRDe/qJpc2neO9ZXvBxa6i6U3bu3TUfB5imRTiqm98b/xQl/0/Ox
         7Jj7nHYisys5HWnnmv+dwZ5yhSsE+wvOVt4xYnHs14Iu1NQmajVRp8nM5mcgfzDJn2//
         +wQV0ZqGhcdGU+2ODVp/X/1zXBNAkxvFM29bSIdOLOJpHbSsfYf6bqsbrndnFhE1LGIc
         wUTtKkyyuAlTWfiguAyezX63OXrDBN9nOj+tEWHYt8fZwN0N1UiZVW9BZRth79ItyZVS
         9sAbE/qfqBrRcw0okBXF9cIzyAVpasRaoHbDO2EBg4RORuHBwLeTIzjsbrHJRAojfqJN
         8nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108410; x=1786713210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DAXATgTkufRgDBElO/+VP5qlX2m9wHSj0la+spoaFT0=;
        b=QOKrSlkNf6JHfmGHYPuR/KVaNQ0yf9OEMlGT73mWOK3+kYABjk7GVRXY2GvoXi3st+
         n1HyxHoKoET5lxoyBNUctJ8+0ST4kt2GoreI9XraiQHmexfdLHPaldovRHKrOj8+zj0L
         /RCfW4BwZ/abHQzpQxV1Z7hL+rcf/vwE3fgzBZgJ0bI7R18oWJiD8+ahoH7IHJeU9lnD
         Oa6z9sEbe5o8rIEg6mT8+eR9I77ApdAXAa2hejTI3M7cBEpG4IRPykcOUUkMEmMYuzLa
         9vrGi3WMYL778uxaE7CUwFyYipJSSMZIcC87QZ0c5t6lcDWtliClg3iAPhoj0k59E2fS
         Vq0g==
X-Forwarded-Encrypted: i=1; AHgh+RoIUzf4z6uEdWZHrDizkr6ITU5LWSDrluIC7z9cbvN20p283SLTphzTOkez/Mh2ULl1cyldJHdU/tz7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ocAepSdLjJGGafXOIHcyaLA3sY+s6p5h8Yl0Ly5QXHyhhL/g
	BfpDtbubxsLgMEm5MA7gl5JgKOF9idW+gaslGxoxA9mDyXoDJoTNw1+L
X-Gm-Gg: AR+sD13+wGxzoC03iXKUNZ9vgdW3W0jx8duyk5oHAwuiUe2wtye4yFJsO3vqBMHt+on
	csnhJrSJVfitWIv6/4VmwwjUUdy8ZZQtejtggWwA6TQu+/2JE4oaNjrT6K4fNTcKh5iyyrcG5sN
	/I+s2HFpg0pNaDEtQne9EDoOOH9Bg90EKopMFEzQyRad1BG0IpPhricAtxHJbdidwozaaQ2kAgC
	pg2WZHn//nM7y2c41OqsFvgzmnwsMfrPVQcuigVavJxdnAke1t7SMOu3cq4njiXN/iLAJi7a54L
	HhV3vajepK5gDS73/Hi3wO7VDmuqvV0il3yn4aa9nBc2RAKAsic+xrMWPrPrFTABZqJfI1dUzUp
	Qqpjf40fHscJAIFdBbLYyNJlpv2jgQluB1ZCQwdN5f6kfXNTx+l1LszjBBKq7+sejsGajZmTVjZ
	Z1o1o8BnTl3HHhWlwK8vkYLv31g/lQk6cEzUdyx9ecvF+jfqdJwl3SU+wCtgEL/RL9yfSzscn75
	I83OVsrJFNY91NBS4sYaQZ1KMuI95SlEjTkf9iqr44duqf3YOTknA==
X-Received: by 2002:a05:600c:19cd:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4994e72f7b6mr296830145e9.4.1786108410336;
        Fri, 07 Aug 2026 06:13:30 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:29 -0700 (PDT)
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
Subject: [PATCH net-next v11 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri,  7 Aug 2026 15:12:51 +0200
Message-ID: <20260807131301.192060-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
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
index 69d4f6675db0..2e8d11573e3a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -982,6 +982,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1683,6 +1689,9 @@ static void phylink_link_down(struct phylink *pl)
 
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


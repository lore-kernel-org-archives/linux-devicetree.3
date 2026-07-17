Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAFC3D330C
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271317; cv=none; b=pG6Ykzr8kq0XMT7u+OG6TA9xa4zpRtv3GUIKUGfNh9PmoDlDUYb3xdfp2Ar+4PwvIhiU+PSBgggEg5hbr+OhRlCxhBUGjy3v9YF4Q+IeQzbZ7v8MvGFezCtHwZOMIMhVB/MAQk5xz+uvg9qCStuwVKMvLF0MN0dO093/HB8hd/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271317; c=relaxed/simple;
	bh=t6rY86OMbolsiiPK/GOuF3k7hVJufXxgtcjDITLWnKE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwmT8u082K6fclH4hfPpeuxdWoU2AUJIwGoA9+YCFyUoNpkHJhQZ3Q8DqxZSsS6I5PLSghU/K4WF3xqOhc6bCCUwQQPUgN6M0UMXK6xxW/fPJgCIEK03QefZQfyCokKKkmq3WXGUDz1Ivtn/NrN5HkjGZmx/PSpb7b7c0gLArK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkatuaPH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkatuaPH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c19bad03so60060285e9.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271314; x=1784876114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G19VSnYnZsX2bhJ6fGMWN3T5ZdGh6Kgv7ZnCXAAQInk=;
        b=EkatuaPH4Ly4HPZhwCjywiSVHXYhXF6Z56LU4mONXr8vBPQBsqIZV4wsDM5x/Tsf48
         aARKotsNamTXlVk1L2tlBR9HM3HCCfSgu5QwZa1bL+/PrzwxuTWavj3k/+UYNFbk0LXG
         p5/2DI/M4AnOGfcupDIQdStNQZ57e2aNHJW4omyGiUMnHJocAmyEVCeDc/lK1R2MPaeH
         hzXBEGuZKCZ6EHZpi0eCxBHlbNcpB8Bzg9WGqZWmZcKl7Ylq6kxT2aPCA06xhGk4VQs0
         QdAnZTe2+sJNZbS+FZlQLU+UQSpPVAl49+Pajhn/Ig36Qa9SBw+/TgINvHoYlA4wH9ZL
         tl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271314; x=1784876114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G19VSnYnZsX2bhJ6fGMWN3T5ZdGh6Kgv7ZnCXAAQInk=;
        b=IPGLulocctdO3MqbaCvI4/jTGj80fBTB69WS1cz4x0yTQaIC80qbphQWAowwYN61PW
         0IW4vi4NupvMJjIbi/53g8M2dT8GCRAVt6j8OfEIYazL2lF+uPzIEPZasfsnQahoZrY/
         vwgvDwGwSaXII9Jz/5LRFaXNbaosoE96FXDMW0R8XN9QQ/CfuUBkUbW0qj9D67nFXbtB
         7LOEU9kpYHUZpBfrgZZAOy3tY2Th4p4iFy3Bxm4Syp/QZUQNXUNJkNfGcVrmJTjz5Cj+
         n/CIzdSooMVbjLSkWmTol099zk4i0KfXycZ3LrbHv8q6ZWPZupEZLS+Zvn/9IA7s5Nb6
         mQYA==
X-Forwarded-Encrypted: i=1; AHgh+Rqvk3h9WuV4ijacweId0y/bnvejCGGXag+gvbUxEWliA2gMYdCVC8SRpdOyXC4WByhzp8o9tA0lksPY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjg9HrkPc+u0Q8aU7Tr5qpW5544wvrW2gnJxhSu/mH5l4SMFtE
	+4iexLOmr5zRd0+QHeJ73NDaLd8QRib6g3E24YBwDxrfdIPG01IemhnG
X-Gm-Gg: AfdE7clszDdpPoIFo84hhzKbmt0wNhRJBWtmujmitvq8Arcm+zUZRDP8XNUiCVv++vn
	/116W9Tonk3Ou1dLraw02TVxDrXPnOq57X4PLiKFVKYHmasubH4q9g8EnhMkv+exudBaI8/mZNu
	VsptOH+ADgFyVTBQb94f4VLqTzRnjS4n7wXkZpZSKhJ7vjg4lmghf8bN0V+JoNEu3l7GsQky7Ih
	7gFIVWplhhHNtvJE2gCxvQO9S1qJ/KLYTRHZ6cInR6G5mZd0uFkInQErvG1Pdz2w63nthEGD9hc
	TSw3GRf6f/hp17s2Acim6d28LpTUrZ7+KJEsA+7lpzUUippsc/e7hW8e8nUhEoTAPK8jobOmYdN
	VlUM9Shfj/zn90zMk7KwgckeGkYwzzHiSyl46wUKSiMzlltLvPPE5/rWt+BhsPdlRA54G4YJMW4
	sP+Lz+xAmRixQrAbQIanZ87E66oDR2emmuN6Z2kfdpvZ5N6NF0tKrylXyxFIPho7hVmijrRvfEd
	nTJ7vDR
X-Received: by 2002:a05:600c:5253:b0:495:473b:f439 with SMTP id 5b1f17b1804b1-4954a3ec6b6mr11503595e9.3.1784271313573;
        Thu, 16 Jul 2026 23:55:13 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:13 -0700 (PDT)
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
Subject: [PATCH net-next v9 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Fri, 17 Jul 2026 08:54:03 +0200
Message-ID: <20260717065448.1498335-4-ansuelsmth@gmail.com>
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

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

On calling phylink_release_pcs(), the PCS will be removed from the
phylink internal PCS list and the phylink supported_interfaces value is
reparsed with the remaining PCS interfaces.

Also a phylink resolve is triggered to handle the PCS removal.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index d96941d4c523..986e0c1e3d67 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_link_down(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -917,6 +919,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
 	}
 }
 
+/**
+ * phylink_release_pcs - Removes a PCS from the phylink PCS available list
+ * @pcs: a pointer to the phylink_pcs struct to be released
+ *
+ * This function release a PCS from the phylink PCS available list if
+ * actually in use. It also refreshes the supported interfaces of the
+ * phylink instance by copying the supported interfaces from the phylink
+ * conf and merging the supported interfaces of the remaining available PCS
+ * in the list and trigger a resolve.
+ */
+void phylink_release_pcs(struct phylink_pcs *pcs)
+{
+	struct phylink *pl;
+
+	ASSERT_RTNL();
+
+	pl = pcs->phylink;
+	if (!pl)
+		return;
+
+	mutex_lock(&pl->state_mutex);
+
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	/*
+	 * Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case, tear down
+	 * the link, force phylink resolve to reconfigure the
+	 * interface mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		phylink_link_down(pl);
+		phylink_pcs_disable(pl->pcs);
+
+		pl->force_major_config = true;
+		pl->pcs = NULL;
+	}
+
+	mutex_unlock(&pl->state_mutex);
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	phylink_run_resolve(pl);
+}
+EXPORT_SYMBOL_GPL(phylink_release_pcs);
+
 static unsigned int phylink_pcs_inband_caps(struct phylink_pcs *pcs,
 				    phy_interface_t interface)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ca9dfc142388..15e6b1a39dfe 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -751,6 +751,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.53.0


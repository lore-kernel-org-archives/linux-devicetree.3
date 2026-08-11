Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C87542D770
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440571; cv=none; b=DjCYMpiJJFzPkWej2HyGc+WXYvdNUU49fqYV4fZuCvKIyLRDZLA3GFVx6KYXfZcKVGLj4fnjyKzc+8h4E8dKWXPO/AAeSs5SPX0rKspyQkax/LEeoZm7LuGAq2/+eps5PJqfDLRlqCSoSvblqHwUkAdFj4HrOE+hL2vCG/AQ+cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440571; c=relaxed/simple;
	bh=LbEGillG3O+kjyj0YMNED85u22Je+WjmMyS6VfSjF38=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvRePYIWGi1p2wjtIAo8GMs+sFRk4IGKEoQTyfi9Bsz9epq0v2BmLn2ishOygSHi3YhHRPAXcW8Stmk8LLArTZeaM7YUgWrMnw2Ndoo7MtV9FDQFjqQ0nGomoJl27oE+hhUo45LOSl4jtBCgP8BDmoWf3PJpC+k1+Wd1KfDyOb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTq0VKlU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTq0VKlU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so31423575e9.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440562; x=1787045362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5mpB2vpD+uaY+L+h47uF+iOxZ8EZmM0AVQF+rKLz4B8=;
        b=BTq0VKlUYk/CAF56VcxgB8DVG2Dhtb3Mqq3bvyvaII2icEd4ceQctCRANCr/sC2qZj
         FARjtBMOariMjPZVKidFl8Y/yk9ikVX4TmH2N74NZMHcLfWzvOZCA/h9NZdZSbRs6iod
         nY22UZXjWr49QA4Qg4zBjloXcx9BuayXRbjMDGXV+J3xLA/aORJuaW4Wf4wv6cC/gnOA
         1CfhL/3AEAvyxScReFIS+2PH9tCs9b9i+uNq+fSKwKlVr7KiXuZ4hO2UhbJ7l1EkjEy8
         G90HTSxlti8Jbcg4z/pQtVgNG2c74bmwvEcLAy8rCAW2CC6p0o5m8gNWImqfMLg8XFGd
         GnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440562; x=1787045362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5mpB2vpD+uaY+L+h47uF+iOxZ8EZmM0AVQF+rKLz4B8=;
        b=k3OAT37cRthog62ltsExThWIoXMYBwjprXVGG3lgA1onnEA1ndnH9RKLSFjBQTcLo3
         usXeU4h/uFZPRr8znYTVopEXtkpzV21HiQ80hv1BHgIDzFYUtpwUAYn3uMejNvRn0sQ0
         0ZYinlZTKCi3V6eqoU4yRlGGfwYwNtPGVYo/ANaBC4RMMsfzu7Yk41eoLwj5Uu3DQSkl
         grgdLaCxGpxouvTigegtfgf+5//v29m3H4xR8EOybBx/x22jMcVuPkpAPrS2BD15JWt1
         dCbK+PYvYQPM7QrXOCe7qUmRUSUruRnAsXjfBbMkU3TdlMkiHxkJkRlsVl+2LnHJfznX
         zCXw==
X-Forwarded-Encrypted: i=1; AHgh+RoUrQio4fBatisWaqfjbRl9plbwO8jzQjbIGEdQ5dd+U2KAXbtO6vAz5NEAAuHByqD4oBIaZFS/u/b6@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2RU8VGzp2KkSxFnj80DGuKDuHK5FYfIZlRP6UnuJdm7DtxNk
	RfrphezmrqTgquo8YiJUMU4QSIuYWbzodrf3a+VAImN7nN26ccGWtNfd
X-Gm-Gg: AR+sD12MUM1idD5k/92P/rMzMl5x7zW65aim3G1bB2t6kqNTRdhzGW3ebPEe1/OrUTW
	J23BL95LHvRm+mGx+2Uw5eUQ5xrsUPNzE5pjLCOFOo/8lz8IZB+7jYM6ziTwkAItXGehRErBp1s
	+6yjtyZdzsVTn9q3JBhHO5TEy8S3Ct8IJmTVT2uY+ajuVq3IMvtecQZzn66oeQlH9ZNIAdJENl4
	B28XiL3QrwMYtJLt+h0TzB/mpkc8OSl7t5a7OCbIfD44Fvh1Y745BJua/JqsLBxQzz3U3gqcNYU
	K7KzbuLxfGNsI3mfV2LoFtcnuHPJLEtAe3FhzTqcqaUciyBssxyT4+HyG8Im1d9596WK1EacvZ8
	IzvXqzhzN78DP/aNO9DIfsSPX4XjiDZB9UF7pNojGlrQ205pvTrTS+oZcVQkyU6Zz7FEVQurRoh
	t/1VHZ4U3dBPijAqUXukjPVl7kIS7bj2paSYc7FKXYazBfTaQI1+dpMbbSiozSjG9nBI0hpVcTV
	knt5C+Wo7bCAQVFgu+ueL9JOnxaZkSi7eFyyQcR/Ew/wi+QimRIxKWboEM+
X-Received: by 2002:a05:600c:4fcf:b0:499:7219:122f with SMTP id 5b1f17b1804b1-4997843073emr24510875e9.4.1786440561565;
        Tue, 11 Aug 2026 02:29:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:20 -0700 (PDT)
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
Subject: [PATCH net-next v13 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Tue, 11 Aug 2026 11:28:34 +0200
Message-ID: <20260811092843.673837-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
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
index 39d742c90db7..ef9ccec0cd81 100644
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529963;
	b=fS/CM/FKiUmJOJLu644/XwLUd7Hvd2S0weX0lR/WpaZHtvEYBUKAvmN+EtZ8lvkzZgP9
	 dohSS3Wm0c3peQGKCNvhknMGlMxmgqWsnikuOPiSgPAH2Q7hjrye5tVc1Zvfb8qTWAAMi
	 dP3t25TMVfOK4XIJXIERT3RZeD/aiFa/fDdh91KBv0aPY6Sa7SSn5Wda0pfatitRy3Gdu
	 lUZXgLjIh/cz1JdZZ2P8JNfIpOgPFt5HWQw8UVyUmPaqmmvZpVMCEL/iVNm1CAsLSX38u
	 DnclcNp9qeC9HSr7kChjcDy+5OhbXIx6EBRyIH1NogjsFZJ+ALMbmlq3JtwrfgxLu2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
	b=j0lVKdUo0YqieBUJkVEMVr/WqmNf92h+ri4dO9BdXNgpx1pV234W/yXx7+mbICgflzTH
	 XQ1KYLosZeKO7E5jcvaop2ioeYWFy94LaF0ikeVTIxG7yRq7/kHn6ekKh8hUA2UzYMLE1
	 SS7bCAUeFROFGEyU/c3Xbyo//tv2Qm6DU0RMGgwk/1dNE544oLy8GUO62nleQhA4RAGqa
	 2RiXUCF5Yv/QVqQXQSYEkYcFa9lQmcyV72pyGa2+Pny0r7kNXYe80pAK84b0W9kH5850a
	 ebF0XHqKFBf2pPEhcHkn198Y7FK6E2KvgkxQOdj3lWOXnKT/ruRztLPQiNLwb6523dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTp29Dl3;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348DE60A3804
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348DE60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTp29Dl3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a208d93758so4865035e9.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529961; x=1795134761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=hTp29Dl3/fXwSC7T1y4v/ZOkf3y2Vs9AD5XVW6sK8tx/9Rd2znf2jvXkFcEnCV99c7
         43Wrvh+i/LIwGppmZT3IoAC7o+9UwWqw/Qwo9UEd25nwMjgAKmCNk9zwwAczTUqSf2E8
         mMuLPFzFlnwRwVLeg0pUCeUg/LFKVRFpzFm6q1LiBhOZVH1oZgqL9IhG9OlGzi9KBB2m
         jNd/628/BaUWjS3x8zw118tRw/p42CEXa2awQrPMrJva/pWpVphkYA7bdM7foEvCF0pW
         XUU6Q425Gq3BR5i4Yc5XzgRXocEsdDgdaDdJDE6/3oY1a6Ymehx9ePjVM/MDM7ZBOCYt
         Wd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529961; x=1795134761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=oltZHF4mw2rmtWHmrDu97lcIkXzgD+H0Bj3f83cr0nFByKNwlnrSd3DtNTIf9Wn/1y
         ij8pYNSvhBonkPhnIBB76cKwL/canBYkyEjzT2fl9kY6jtjdVdEACN5WMJUqKFCtnlII
         iOAKIXfmzzPwDMFvq7ZJHueTIierX0ZdnbLGTqqVEBK8SQnp3FzHgITMx8n9GlhydSFW
         4+J0vLDWQvc/ep0qRXfeGEj9ECB7YJCb6ONP3q4IF3+CKZ2cNd6Dz5USvqVCT2FxOVfi
         4I3CZvf5SSm9u22bR5mEK98xVaRu5ch+nUAg03gqmRrRtLK/5WpId8fCaEvJvykhCLl8
         gVrg==
X-Forwarded-Encrypted: i=1; AL+hErF1eVzRG+Bvbub56czu1/u6hLhswy3i72csdLR8ipPtaJLDfU+w/0Aa++1kew9XLMxiOayk043r+Gba@vger.kernel.org
X-Gm-Message-State: APuU4Z+zib7U3ege4FaxPXcFSDfCk0F3aBc9LRG6qCVins9O1LUTE95q
	lTZ/2bHNtr+akNYGrm41pGoh003tFp3s8WLIwKWqc5jPwHNiP+4gjQOp
X-Gm-Gg: AYBFou2/nHTOGCJD1z+r3rA7lbxzw0SDQjavDTn3gdCtaTolLzxLsQUzmK9UVK5CVbD
	HhHwy5xm2WRoYr4r2addsy9LCLi0QsojrR3WlavmtqxISVwmjuWq8LNXu3zDCsHTkb4/SH7XVEn
	st6L8kJMPt0q9lcimtgnwJIWER0tFEIvW9ZlnP+Xp/jr3s/VQ+AHtnjp93gE/D/Yvo66d7FZn50
	f675zRDjqmrpOYcXQgs4sMHo1rE0MDh9FojVXHd9XBPbLxfzYAJxDh6Rh7utPo7TbNZNn7opYd/
	tgQ8ujSeSKnJwcHklBVbmplhi7mt0be5mxkuwkfyArMfEUIOSJ79+gAZh+S0eLQ8/7Ht6ir4KRe
	DpThnxm4U10oDDAZQjNaVjE6yku3kXjzsbkfgqf96PsJvzFxvy60bt40OZ1AQq21V23d3rMOtwa
	jUNBbkHJHjTiO4eRQ7nhZRGpxz08MGCfphThGnlpzH9o9A5paOEn1Af4+z3NRDfDTJ755tPlvLz
	AUz8xeRK4IY7etWgUNatfjb5vRBElVlBgP5NBDAI9adhhXFOcNc65ehANgocOKVxkNvf+kZOa/t
	2BuRySiFth7xbsBneyXpp4jA89CH3cs8eWTCF20MUqFIS9g7mdzWdBTAgud6fgmoqa5HR2+PELU
	pH5D+tGrgWwoqXVd9xwo0E1zd/vCfC1/hxEInKMANXWJsFikhxdcjdNU=
X-Received: by 2002:a05:600c:c167:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4bb55a92fa1mr18062495e9.20.1794529960557;
        Thu, 12 Nov 2026 16:32:40 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:39 -0800 (PST)
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
Subject: [PATCH net-next v19 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri, 13 Nov 2026 01:31:55 +0100
Message-ID: <20261113003217.197757-6-ansuelsmth@gmail.com>
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 64b00d324988..e2e0b313fd61 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0


Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03B23D952E
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307502; cv=none; b=JyHyK3PhzNr2rA5uWdkWWjNRvwbXejCdw+28sbNLo/eVMagYHIo075Z1qge1QFTdFkSH3wWZ0eCdYocmeFkyMMbrI+KvmgEO8uUmQyUFGls/HP7MPEeyEMiYRR0RXUMsslaMlADNBhNocI5wXC95ozAlQ/zy7vNdrhHw6MPOyQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307502; c=relaxed/simple;
	bh=uxeJVrns8QwyjSHCN9EiUaTLmLVR3PlKWthj3ETOI48=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9kASXwKimCEmSeA0Got/tkNGBQE/nObC+yZJ6YDvLEHRa39f/qsUciEz9nLRssvyj5VUPRFCUSeObckfTuGT7LzVLbajUXmDYhVezRLgcgo32kAc/Arev/By1ue+Hfi1th4KbBL0XHuzzLcy5jGVmLDGannkbl2/bhQVJkSfxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLiBv2cL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLiBv2cL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so14827065e9.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307497; x=1786912297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=PLiBv2cLekUNdda1BtQ70VYAEkNGXQ0oecVfImuMR6e/2CooDOUMOkwX3+xbxZH4lF
         vuqSFyms1MUApdd8CcSPg5f5aFuyMOQGMPdYqzHdgXoJoUHdWhdITB/VIeq7U2T05POI
         Mh6LvY+Xp+ngwrVbDopL/jwvrFLb0QkM1CHpxTcQcdbaYaUDY5pL7+tSEgs7aUkXLDGf
         5aaNdEagVgp3uYrzUHJygaKVTaYc73QPvFV/vBrDgudxaTY9Gq5xdAk/J0oGPNJHzUIu
         vtnndiPiU6MJ3DxjZLiQ55iGSz6t02mE/ztnx9hTq6ChGtGv+QFRIQ2EygbuTK2rzZAW
         uxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307497; x=1786912297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=i+EptWYUX6OLotfaWSBBwReZQ9vN//bSoFXu2j1lov1T4cXeaq4/tp8ZLP+RwqbW7P
         dfhABo5V0b9C+aW7YeLnamVp73QVNVa9TmbXY3wec8t5jIskbmvx2W8PwFvAKMnffqZj
         VCdiEHaWDjtMNpgVut/X2JEu6Dcncne0Xf/az+xAitju6Yj+b/bkEkMSxm9SeYdDVtjt
         rQuHjfwBG2suBuCD0BbNom7vaX1Xb1j8UwZquo1b2fvxg7AIgrj6zqLTcm+ZXEs8zjpd
         5dx+lxVCZtX998IIJxZCto/kiYFT9wasxc3L85/IpNCvbrwVEzK9W2/5rVeOJz6FUmD5
         AfLw==
X-Forwarded-Encrypted: i=1; AHgh+RqblU1BUdWFPD4JzkmF40wUVej29LXtc/lOhvsv5gf17PmwrnBd3kVknj0MxQkpKK5riJM6c8RQhQXL@vger.kernel.org
X-Gm-Message-State: AOJu0YwXssIPcj9mit1DBaFyssSrRM6z5CUcle5DNCL0TGjb+wObZOby
	mU2UZwgbC1zhqC620sBKpdWABzBUBIkeqHG/51dAMM7btuaonV4xIB8J
X-Gm-Gg: AR+sD13JrsASRRnq+aNyPVL+LBMr7v3PLW/yBbXvcVM8ToJSxskQWCkdopJKimge2xT
	iCbY6NkeaSyGsgIbY5m6VVROJ7wQd4XYf4QLdBulsh7Qgw259z1JpplVYz+xlrHnAWDGsivq7mB
	y/0mTT7ukcBqBFjF4WQwUohsCNtdu38UCl/Xqg8eMyVwVUAWAV1c5nlawn7rmoYQWqvv3zcti3p
	MP+HJTxCNk8VwPxU2XIKfhOXFMPguVhvd3RHKkRy1k/jAovtQTiU2Y+Fh6j6ogMqgpGEOLdOtQD
	RJ/kNeWs/DfXqdBgopB+mWObesbeq9Z4KGENH3Sz0WCxg5B5njtLLPCKMPLXepYQxX2ypDmrXF1
	5ELcwmPePnz8BnEnFw4Vmz8du398cT650gq9OCUiv5B5tao6jBZyE5MjWM757mHwTbvkFR3F434
	ASbzypgFONBF7ZATSg3gPGqXmLnSIgUK4N5UGfBcClXM8ddxCVPnNyGpdcQlGn5yBUNmKJsSoX7
	tkg7JJzDRu1/Y9zC7YHXIyaaJOUTb83aZEaGv6viXD4WDFn
X-Received: by 2002:a05:600c:198f:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4994e7cc5a4mr520537665e9.15.1786307496663;
        Sun, 09 Aug 2026 13:31:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:36 -0700 (PDT)
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
Subject: [PATCH net-next v12 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Sun,  9 Aug 2026 22:31:01 +0200
Message-ID: <20260809203116.640271-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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
index b69050f22717..b9a5cd123775 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -1993,6 +1994,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2077,6 +2079,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2107,6 +2110,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.53.0


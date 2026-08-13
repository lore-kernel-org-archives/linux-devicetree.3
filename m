Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C859B3A1A58
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610164; cv=none; b=ahZG+JqvW9PqTa8voQnJRGvVm1+knmnb5PH7amdoAEPfXbSbT8iwIYppl5fRaEzK3ArvoKQIYFSfxSBuDqqG5+bhIbKA10wFrQqfYWD4dISCt47wpZpZ4Md9wHUegs+ygcyjCwU0TRalrbnd/sP2RnD0swF3tOTiMfhfkxUNgec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610164; c=relaxed/simple;
	bh=iZGuI2jZEXcez21BvMLyyL5J5TyyPpxYgd+5RltvGbE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WeZoviVfocGSjLYCIU4vRuhuQk6ej2Rc87AMOEv/WDOLR5uadZOWRSnWKZ2yo6PY83hhQCZ6qG0/SEmnFkUaTVVmvXw06JtkFwj5klAujUdoydlZXo3wXmGvnz33rk40scCTfPdS9q1E9zbJ04Htu3cNe3st5kAWAIuzgcvlzcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbFoo/Ro; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbFoo/Ro"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b966dd74so2934815e9.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610158; x=1787214958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/6xfzqPrssPk1eiQCa0fxb1om8jeBEn9170ILCiYQUo=;
        b=qbFoo/Rogh6FZqCSva0ejfA7WOFQt56sG/mcwYgKCMj8/qLBam/AzIQ0uBKAfnmXnX
         rAkinM9dIYDsI1Dmxp5/yAJ6KIufNFu7/eK51SP+OiEbRtUx/UV4eR63sAJote2XyDC6
         6PcrigW9btCwpavtxPOKtOcr+YYG7KbpII/6Wmd7my3d9VJjdwIJL+qEd9Bo/gO0lDVD
         GP5AIyXOK0QQwI7dVHkG4dciBJrjCN6Izx6XxXV6J1HBIIL1nKLPtRZRUWMyAzrXV2jq
         pzxUK93V1MoB9K1Vtc8nIL6MQDPm/+jUCd84WVR+Xwpr6C8gsotzm3cGYKyUJ8Lu4i5u
         x0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610158; x=1787214958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/6xfzqPrssPk1eiQCa0fxb1om8jeBEn9170ILCiYQUo=;
        b=LVi2tKd6RXTuibQyMbsBovBk5PhTSitxj8LMy6ZQHS6Um9urZN7dkMY4QwNgEwWtgH
         vy1yebHSBYBFtGYdXEli50KpsQg4YzNSSMBOVCouboA1rR+nTKsHuMbbSVQ0ExyjdIjC
         W3LR3w4Pv8w9fHtyy+n0kNVK2fcRxBUn0YySOhppw+2N3IgGDEPNF3abxbm2SwAXgCev
         HwC/NItALL8brZY85DPYrOOEY+iguAVtQgnz+npCDM7XURzL62P456qbNpRG1uBI/Pj9
         B2kDAGGjinBQQGSteX8OGIa38douXC1TWVQvpyy0pB0emzmw4tHKpgnVNpJPiqAl7Ca3
         a2uQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMbEsOj+wKAw2osLQ9m3hFv4/u/UHp8Hd1Eayehh8Icc1f2o8JbYVispS3EWkZ6YfZKkxGf+6xkTRb@vger.kernel.org
X-Gm-Message-State: AOJu0YyBq2MO4FnU9M+TyOwWonG2VG1LuF28n7MzS4gbegCiN38HVqbz
	OguUlDsn8rqfFt+4Aq4K+lUcdnRg5SVSVhyJlLx3/C8rWjSjWOyFMWXl
X-Gm-Gg: AR+sD1046P0Jh+LAC0oVOLKWxiw5KrDAmfNszcwXzqapcPlEcgWt7Hm+yDYKNDZlHqU
	fBgij3YzAsX7+uBVnKfqv3jBks3cZP3AWISKHXTSCq3fkW9zjcdGqczPLJOhqKsZ05F8WzCBmAu
	m6Ey1UylCvI3PczkXkg4aALQo3GPthyg11mfZcdI1raRUyPpf6D/8P59HxDiVjAh0P0UEPajqpo
	HTa0xh1/xFlochb1ZJwLaYsfgi37Lxcvhr/cxhOkfUQWcQyS6UzPSrw8XODIKGbDOpcQSKUYcGw
	xwqDGdhsigZjFva+HA0T+y05stuac24isorQvCDA92aX66p0HgQ2vbrpHficuJKt95mCjLYU4wk
	G61lN4mClBSk2W/BGkn3wNwtQ6zALtR6X+SHCWsokTCkyIT3dlPkYCbeWMPGOLYrEjlkq4qfx0K
	j0Qm62keoj9mCmsW/u3OLa5IFK4n/PMgLRRwIF6SovpRFihomdSrFQ1oatGJvQCQpj2wDTcGiNy
	1kHU84BlKpVwKhHYGueMLlgQQ4SnaKN1HPhepSsC/Dh423n
X-Received: by 2002:a05:600c:3553:b0:499:7ce1:d8a2 with SMTP id 5b1f17b1804b1-499821d1379mr41303605e9.8.1786610157531;
        Thu, 13 Aug 2026 01:35:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:35:57 -0700 (PDT)
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
Subject: [PATCH v14 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Thu, 13 Aug 2026 10:35:09 +0200
Message-ID: <20260813083536.970196-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
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
index 6204e3bba16d..82eae20daed0 100644
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


Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C661246F4B5
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290959; cv=none; b=sumcjHjCVEwoh5LcWEC7hw682ZMBhmBwuNGbveDEAbQvnrAOWp1fIPcAyLK4lE2YRgOuZoEHkqEEA10xnzyvB7U2pUI/hC+ryRk02bcgHLrkTD5iLcrjo4XSsSaAVaFjfKk9UvSrprJy1y8HdJ1Ar2sWdvYUyhe0lNQYoJt4O1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290959; c=relaxed/simple;
	bh=m5HqqAwvf714jhn9AtFujlH/Cfft9cIXbM/MO6suoWc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVb6CcL5NZlDdSpvLPxApsKV89Y27tQSgptddwFEQ8RLZr/Itns6oJsViN646dHRV6MEBe26MXVHu7ZriMuCbtSqgGKn+8kbiCk973AFdew3G2F5trO7PMtKTc5AoQaILCkqimv5kJNO+xdcPBw5JOCk3JbrBveH1xB0vu8j0ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqFFapcj; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqFFapcj"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so1947305e9.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290956; x=1790895756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=aqFFapcj6lWKZujhQlZfnhJKwQcmMWoshA0sNpAjFRspPHqIpyj2tW+ZCnEUs7tvGq
         eSNTkkmXspGkm3qSba9KIGthzRLhX7+LSwDJZ0j5ANgdeny2+IO7CfgaPkJrncWj6pWi
         q9vtngwonrM8G7klVeQQ9j2rOXeZfjj4Mrvu+QB29IiRYTzMfY/ulah5SBGXK1TZtJvk
         3Ghfd/Q/JCluMjeQpScL63ADHzXCmLUOTqHnnbU0Plt3LnlwIQvp8h9CCQxoLpemcQfN
         PX+KLuDzaym7ZakDxYzVZSvkNWhnKQDfmcjIFDwrU8Avc+Yc3kkwVHiQnatEoZ1XNIIz
         AYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290956; x=1790895756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=t2gIV52aluYa5vTmHl6zF/CDpQ5RFlIMqXJc6hu76Ev+FZ5IWWYkpXbsraTvsLBxC5
         iv+O1tYA/ameRgDBjVUKx1CfZliwflY13MbfAZ5P9+NtTUr6q3RmlFo1hV3gb0SEEUJR
         JqmOAM0ysPHxPRVKm4PHa7jjTZSRJqJ+tlUnmFQh6qpOlPu/AC2OHT2RDAmzX10uQR77
         E7Kb8MoC/aMWwgmqtZDCqeoyOqjVggKNDIGgy43/3fdG+bZ4CmMkil5oCD+DKGu5PcdT
         +1MWcvHRd8dJloWEuQBisr3Kj+xJdHKe9lqvow9JIA8PjNadc9EgtZcmSfJaIAgwe9fv
         n48Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8+iR+8mR2saeKMQBaRT1uZhx4LIaHgGeqYurhaRrR6wWmSlEe6csRRsZSM5RyFVvFJfQX5nQCOBr2@vger.kernel.org
X-Gm-Message-State: AFuF++kPaTq7uC35tLFb7Ss7gqVF6ba8yFdEkaXR812H2PIOTGb3gSiF
	kDXPKmQDbDbcHn7o1k/z44gBNBcaXMwq/PbLNPYCeQqdk4gwq2B/w4YL
X-Gm-Gg: AYBFou34dL28P4E+WOZ+XwP2VRgN1OYvhdWxWP7/k7vM4xauYqFJmYSkIbCY5zQs+lk
	GlcnVKxNTGZPNYlTzlgL0iVak0AjhPqccvPyOn3P1yyA2AXTO49rH1Tdh8t8/+Stdc1Rr4aguGT
	VVPkLKtOFqK+GpIwqqib6XmUZxxTLu/RtqhCXGYw5ksbWfuUPwgUQMu6CTKHt33fA8EFT1WZILE
	fR9wEGzQS+6k0f9JJgApdCLB6VoH28enoEZB9Wd7SGjZiMC7JQP6aOqZ5kmm3kCDEcOcE/n68Eg
	gW8GCkZ9aLoP3JXK8+oPeWCKGfFZiWfNVzZSrV8hheoF3yP6t+DIzHNH9qVwjqbz8H3Ssf+MCvp
	5k4VlGUHRSDwgwz/lyxfytpWNapjlrZIh7M0P60QMxseyXwip34u7WW4dpvi6kYFDWWqj3RtXpM
	7r6aWPIi4y+yA8JBo2wbIMDXmeodBGsJB/ST6cUyoTNMwWoPOnvMQnH7/YPbZFD+Us0UAEyFi2b
	/T4a7Kas81F1ORurSwEleqBVxw/VITwOyglZWbTio2FcJvRJqXO8dIAEGF2zNuy
X-Received: by 2002:a05:600d:486:20b0:49f:e8bf:221a with SMTP id 5b1f17b1804b1-49fe8bf24fbmr42002985e9.22.1790290955933;
        Thu, 24 Sep 2026 16:02:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:35 -0700 (PDT)
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
Subject: [PATCH net-next v17 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri, 25 Sep 2026 01:01:45 +0200
Message-ID: <20260924230211.11519-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
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
index 1156e6c61a08..9441afe372c3 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2115,6 +2116,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2199,6 +2201,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2229,6 +2232,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0


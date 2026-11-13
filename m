Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529952;
	b=rdqa5CLfB7pDovg6d8nWu7yTkIoYfQeDiPKhgWeAoQURCZqb2ESmgO81a3kIEXhaDk9c
	 CH6Oo5xIjE4d7KIbjfOiph/XMHPH1h+I5ehoYh7tPWbVuYfBVASyVU4GVpDa1bjMcZH6W
	 LtDGkOCa0FgzauaXYHFS8onnH1g0+J2uvFyQuFGE6NjMfH7Z1xa2Vrv9xX7fngy7JWUYo
	 E7U8VW03YlkQy7C0xtoB5fn46MWb/OQJJJ6vYoUIiRejuaRK8OadejiFBMgo/IooPSaMx
	 lOLXbJwqWIYmJRifcga8tamYJFhqwUAQYDz3wmd2jm/jb9U4gLLFT32cmkiWszPX3Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
	b=LRmGrylvjW9WrSjDFR4DESsXoj7W3YiVCYW0jEUZwbrDUAi+4XtlxNO3ABEIhZjbivMe
	 N5q/MDCTe3ptjsxg+0o4hOOhDpZZdMz43b+agWAhQh4EWqCAoBu1aYTUfjFdm0OZ1oBAK
	 GGTiJ1wSjSLprgzrNNpX0Xo6OgnhDwi/x0h4ndtEq03IMutBP3qjuToP+RjptCLHIbbPZ
	 zNWzNwX2A2UhjSp70dTHeewHflXn7aCASiYYTsmTgYOSgMnqVuxqfQFBDDkIRF8yFotJ3
	 fQHdmS2p/YDFqI8ilir7sZERSKzdCGhhqtWmZl6qOzXFlqc+NYXmO6RhilQMYucr0gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gjqnet9W;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA3606A8A0
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CBA3606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gjqnet9W
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e47347279so125571f8f.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529951; x=1795134751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
        b=Gjqnet9WN/sbUEJTf6Vdlds3Seb7eZti22TD54FtT9971cn/+vOENE35r436ZJ2bbX
         AzkE5RhFryOsnMyYBTQLnJTfLHWJEat8uLl0CCJWiJ5T/Hm1qd/5zapsSDAvMY3+IC+8
         06Tez2QayRutopxficRWi9AH84UgkQnYOPz7vGrKaVYq2Toe2Ctc60M6tRpw8j4bN5m/
         1cf6XKUlVcQLQ7U6f1kxNT0S/weW/nDOcb3gdEj31WqHqgNItWhCFh5wauHF5CsNOa8y
         6VTfCUEQKGABAqUd785EbScZjgj5xZo+r9uUmBe1YpXDVNgjKGbfaiRJX+H7Agw65HWd
         u9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529951; x=1795134751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
        b=R64c0ZRzSijBIMMD8/pM3sBse2/Nor8IPHYvvp2yL72sdlELNya9dj8bDoH4Y9Bpa9
         IchhctxdRTC7HwMw82RizsqGM0OlNGLJQGFBwAtTBMfYYHvH9pP96Lf4TIidenbaDzGq
         Ocqt1HNIeaB73+7Ztk8fpTCodq3Mgojm7/3HBptSma+WhtYY+jS9uvnWXSGdKXdvUrx4
         wQRgdVndTdr/GXBAZN1bH4w1r3GQ5jr/hu5TkeOn3nhGeRSQlSm1JsIcDbXWZGVmJXb3
         QZI1BobLaNLxpXslxz2cWTVkT7qcjybmFAO1DvirgqQ3bSz9hK7x72k6lE1XiK6Gk/0/
         RkpA==
X-Forwarded-Encrypted: i=1; AL+hErGcRipc9fPVH4fQVh7+jmSiM+cMvwvj9mibRcxlXZ/vVxNbquhTHuMDzzf7tuJ0FBKXD7DU4c4dg9N7@vger.kernel.org
X-Gm-Message-State: APuU4Z+S3f7RPCIGGyCtGoW1SRl/MqQVq2kGtASJ/pjKosZZgpLGV7yd
	RelFyR4pkFXhlqmHxIzKsyx7urj73MRLxCqz/NNeGt3BXWr2+Stzy/RA
X-Gm-Gg: AYBFou3jS+DlI3cG4cCBUDTJ2DP1ZLKdZMBZDele7QPuZupFaWT2Q9PF2LxjARTtbJl
	oQ2NaY8IoLePMzQzY1Y3YdC0YwwnNhUUFsjdy5Zeay9OfMfjCb4etZcNjlYzlD/3UTQ3QhkOy4S
	2MuhrbftylPYrrPwh+NInnKZ4RrWWf0cqJSd+2iOTOlR3T+ooHb+vogOxHf2rRUzKAsDbd+gcP8
	QNp33afnykc1OzJAyig6dKCmOVfIi6SSzk2Gg7RvzI4zxm7O9n3Y4vC3Tgm26sxUvhBZheeRe2X
	CiZQk1W3J+EVwkWxYxdsYr75ODDfmXuDg+0LCGKHq18DcjtRk6UB6rydooNCd2Ar8xtdiBKVmqx
	9FRayN1wpFGpSuQObsLs/1wQq2vLab9Ie7kBLWOjM4gYAyHnfTXuXc9JGA4nsfldljaTl3EMxgE
	ijkFXjoUOnOIVu+PU0np8EfZMnh1fkaMBmVKLbnap+ukY070YWAvthPmnwEjddz2AlLw0Z/Jz+e
	rNkS/UqnKuEihoPjvoLmnsYEX1DFsDkVi0svRiuWz23mLd22jQQPPRS4qxi5rfK+r4EMPLBjj8n
	O/NNh0M/hzVYltslekymxqrj4L8XeTq2BCnLmkYqHQ7Vf5c2oghIrzBKcioJ3XzquGfx92zqQ/S
	JE9Dsl/vZFhQuEjVkorHxaWBNfFZDhgIlIVk7oZh9Fb/lpZx0/PUv8w==
X-Received: by 2002:a05:6000:402c:b0:491:4e13:fde3 with SMTP id ffacd0b85a97d-49c712ac654mr2019766f8f.13.1794529950823;
        Thu, 12 Nov 2026 16:32:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:29 -0800 (PST)
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
Subject: [PATCH net-next v19 02/15] net: phylink: make PCS phylink instance access RCU protected
Date: Fri, 13 Nov 2026 01:31:52 +0100
Message-ID: <20261113003217.197757-3-ansuelsmth@gmail.com>
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

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid memory
can be dereferenced and phylink_link_changed() is called on freed memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 5d649903be9e..83620a120f18 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -17,6 +17,7 @@
 #include <linux/phy_link_topology.h>
 #include <linux/phy_port.h>
 #include <linux/phylink.h>
+#include <linux/rcupdate.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -1300,10 +1301,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2145,6 +2146,11 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		synchronize_rcu();
+	}
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2609,10 +2615,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
  */
 void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
-	struct phylink *pl = pcs->phylink;
+	struct phylink *pl;
+
+	rcu_read_lock();
 
+	pl = rcu_dereference(pcs->phylink);
 	if (pl)
 		phylink_link_changed(pl, up, "pcs");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..4a0dc6fa8010 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,7 +494,7 @@ struct phylink_pcs_ops;
 struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
-	struct phylink *phylink;
+	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.55.0


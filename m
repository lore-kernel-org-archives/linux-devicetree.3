Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653079;
	b=NL26p30Pgu0yPVDHMImaGWIKr4xGwR1tDsDPamG18i7K2iuIq3IuEWZCgowEmB2+HjFE
	 Tj2Uv90IeGQfGRKRU+Ah1YlsyfFL7npINkfP1dCf4N7GpBhsUonUp5Bq1pI1VOQxbk5cF
	 liVx+24TO3x01mNj+he6UtwXWUm6yxxEbja0kMqXuvmQyJ4basrLXh6/yQgn2qOoQrSGy
	 6PRO59UDhsvYl/CQkE9btlyMntecGRKjMZTtcZnCRE0K63pFSFbgi8dpyrJz5LxqY8a47
	 Bd053YNdgfUPVYemGBQ9MQ789o+wWStbAtE5EM49d1Z/osPPvJ3Bft2k1uxpre9CjDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
	b=CSXSeZ7YZqXqW6we04vcDmSNH6GiTxfL1UCbecj2Z/zOGMFZXHFEjrNzbWsWgD3DHtI1
	 K0Jb3gUeFSiXJuapikznMecxay6a/8fRycJoBwAB0bYlVvaR97SNhQfo2aiQn2moIjMPV
	 A8hZLQ6tX3dDfGKaE0Y6ZJl9aR7EuVq9vZ7eVGxfu1XfCyLD9MiLP4eQRspcz1yA9O4OA
	 WzuZWCUbVRhqH2iQtrGu3HSz1GxPyEoSwSr4kZkyHu2edCrvhLVy1RpnPjvjNj1sKec1q
	 B24ioi6yr4PyE6vIykkCkxjcPitieI6gKlHh8xXtEQjAyBCvogj3/gfyVsQREFEy5nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0oUyz3M;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDD3606A8A4
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FDD3606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0oUyz3M
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso13955175e9.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653077; x=1795257877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
        b=g0oUyz3M9pE5NvVzo8DmuoJiVKr+lEG6XjqgZnUJypGA4hL5Mi7l8Csc3q2TH8pnSM
         u4eBy0FBllABc2t4SvnHlMp9XIHtsPnWh/g1tlopwD52Kb+RhD7RxE1wyrVRlNeUXrY2
         Pd7Y0GaxEXsMVBuw8QhxfYNe+pchh/B7iaXeXVPJhiWhmtOKsIfoz1a2epPsV74pc2bu
         jQZ5PMLTU/HpLWOFs+Jie6cZolYTMahycMI/6gPJDNHk9Iohv9SU94BuiHsr6KMUsSeR
         5xJT+Oc6/+WmiS6JYVxM5Tm4KSmLCGUzLNSxsmGv8cfcOZdLrGO0TNwXiOmRlUzNT7Ki
         EKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653077; x=1795257877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
        b=z7jL7CKwos3kAUHej6ISiegyCvYD5cEg/VPCk+NBSZb7WQBnDSveqpfFVh0m6yfS6j
         Pk8mY9ZZLiBDBa5RIMMqYpbZpLlwmiiPcPA5ydk+5VwN8Kbuw8YTxE38T4ptwIGlojuC
         et9ow3RD5FacsYlmpfgWaE2QDMnRI4c6X2pzb7Bvd1Or7hbzxyxJ6rlfqYDF5wiaXqZf
         5YCrOifjXwnnVQyngsr7KX85pa6sz9/J6H5zI+vcW9TvVK1bswoluDt5ye0Y61LTV8Uz
         tc4Xd7BaDrdamKEPO4zAyiWn03lxWOr1vMT/HYQKUwVsRdWE54UDb8fohosCF86qtucT
         EaTg==
X-Forwarded-Encrypted: i=1; AL+hErGCwzOz+tDMVC6vnt1E5qyZuQWe72jB0OipKCCzI2A4c77C+hBbE0gbNk5gCW1nyQgR03gW46Qj0Lkk@vger.kernel.org
X-Gm-Message-State: APuU4Z/me+m32dbiiks0cfpvLXVnQ8sn8TafLs9SYCtCy87TXNYJsdEf
	RiO2XQ0YLpr3Wlct4lOvRnIhpiRsn/PLX+6rRvYmn/e/3axBEbIQuxsL
X-Gm-Gg: AYBFou2B161pxcv3CMtyXXxwapSgyDUI762C4poim+BaAyzd6lh7wRLmgpIe/v9gFPp
	3uoa5pCU5Vhmv9RMiuAJPH/vYo/1Vu1OjwSpINwP9liueUNOoNfQO6hY+waV0qd5Qq4raKR7f7W
	w73rvRVNeZA+gQO/a3dSIuhyTjgVaQpbeFcRJBw+BCXHTWs5xCdAAlspYcb/O8NLey4iG76CuFU
	PsCW+atGaDPGKLFNUuZGTa7hHbgP8xzIIkwAob6QSI5oRohdHYzEvvfia6G3VmSd2i/n42bW1pN
	uc1vgN1EWjSvruZUY72+3TSDCX/LLnFFW/N0iN/ollUY+oj+mP37TkakfzlwICHUlOnuI5zdr/K
	xNS3cYEhN+ggl2LnR3Ymmbn2vpf9EyDXZGTFHjn61frIXmYdvpaOjGIKa+/4PrZlL8HqpzsutFs
	irZ9yTnIICvDZcxtF6rw6ad2E0bRMRLbUgUBQA1bKOGuUUo0laIrfpcTnfdl4AlYYeHgSDqNayY
	zwQV0askO1pPDOp7V2Xv/LsqykJdpS0V9Elc9V6BBv6Vw8bhh/RLAO8SeN/IUSJMXvh9DDpqnrV
	ycbEndjGyVAyqocIxYsINfUhksPUwSjrrfmIxmQkJkofhYp+d/as8e2t5SyMOMK6IRZR7CH8dPj
	1jBNWjPNhSqw93f/UODHMnabvzpvMIv28eA==
X-Received: by 2002:a05:600c:8518:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb5de1f1fdmr75369625e9.31.1794653076664;
        Sat, 14 Nov 2026 02:44:36 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:36 -0800 (PST)
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
Subject: [PATCH net-next v20 02/15] net: phylink: make PCS phylink instance access RCU protected
Date: Sat, 14 Nov 2026 11:43:41 +0100
Message-ID: <20261114104426.235620-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
memory can be dereferenced and phylink_link_changed() is called on freed
memory.

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


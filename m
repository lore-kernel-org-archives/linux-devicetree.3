Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846866;
	b=Jdl+QulfWT9BVE2RRvRCrG0Noz9aA2m+OrusXU6umAstPcz/VnUG5F3wndk0DHx2tAyx
	 /9DlKVnfnI+/Z2OS8BNWyJFb96EpI/mwAHxhxJF/m5SFRVT1Y63znuB1IK4KKtbVbxItR
	 0ZfpMdDEtha/RKl/L2HqMcGFq6U3JwbYYLfaTmF3j7Dtye5nUF2dV50SNCSBPlxlZqR5p
	 Wy9ere/PacwPKynK3OnJP7eFWg720nQ23C3ENYUgFHEa4uuORV2eXaOr3k15bNaCGRnj1
	 lbDJNeqPkQZ/aPtoZmpk4ytKow5M59BlZtDAQ5S8XwKQFnIU4EMPe8iFynNa4HgDLbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
	b=gzbVQm3BUjxqPUMtT7xsJy7K9u4OkK0svZgxE7nSfKlEboVArMAKI3tYD2mmZqCs1hbw
	 LkyjhmnYs8ZqIeGy2dqJEeXEOVA4Ew9D6AHiqcGuTgzjyL2iJPUunBHjgP2Rpp4VHFj5P
	 zAh9Hc24STWmeWz4v9eB/yEjdjtwAQ3WyrIJecTuPSW+5xm63OM1y5wnVDJtSsM74F5Dd
	 K/MuFJLI8mGNwAHUQt3ilq6A1VDFJ/bb9mxoVcr1Sk5s8iwO5cFMbcTdr+A3YP6TVKSAM
	 pPnQcw+ZC2HEhrVZ4lk8Cdvkq/dLySwV54fOeDo+atj104ggezv6LqJnaD+uZwfqB3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8PZobkT;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEC0606A33F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEC0606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8PZobkT
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e47347279so1698798f8f.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846864; x=1795451664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=y8PZobkTNSe286sthC9hFeEIYis8FpFW7RElSVsmvEjhLIk5rhlvTHbYfHMdZSs27S
         G+EV170+v9GwVuAl51fLoVMULj9D/mL1FN/R3uLdFFKrt8OYYE/QgPCyxDX/7Q3cLjX8
         ybxq3kVQQolmAIu1eU59Sfwi/A6iIdaIcJ3zkQcFWLKKh+3V9002Ut1jI04cOgijC212
         U7zvppPtoHWr9awCEu1AnUCfDh0YXi5Xo5HlgaOZc3/2XVnaXZ4vYbnIGTmCoC7w25fM
         XMOpS+GBZxvJWJQ8GYM1GRZeRRhNGO9Q9KQkdLJ2j56Er3jHA2BVxaxVIoNYniRGzlD+
         v4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846864; x=1795451664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=b3mTVgSj1HmfExVZRt0FZtLNC6joiMzZZAZROA+4Fbadt30daH+Jmbev8Krf8VcJRv
         8MnKdmLlw1pAicLPkLE25whOtv0Fxp9yUrVNMhv2k6vNiObniJ5SVMbaEO5gMkHX6aU0
         j9EgodGmcJqkgLF366O1Eq0WIYom62jgnBbk05jBdsX01ktRYKERPk7sbN+TKU2YoWks
         O5WOwBPYpGItk3nm7NXiQFlnwroweUbyp2h4tblzsFdnIg2OBZDvzsaH+QPh1FxLtDOy
         RllvCkVhBfWfJTXfdFEKkrTM9gEHFsztYD3UDxIY2NEO3AJW2+pOBigjiDi5MCjLprA9
         t/xg==
X-Forwarded-Encrypted: i=1; AL+hErHGGyFrF/L+F1m1EahejYy8X+2bkUxGWDilHXb8TvMXRchlKij4xvCIzCjHdSj5ftK5M40hqGDhkXzU@vger.kernel.org
X-Gm-Message-State: APuU4Z+ozTyM6s8VI9lnttrGpK+Q76Ap9BIDhoYmmccamG0mUFkWcGMu
	WeKTpFbbJZ26oSUisgQLENQwjqTf/NnzUyedtUHlU4bIrHa8YSLqTs8s
X-Gm-Gg: AZFdTZe2j88+EhGlN/QcMk3UPP9kXNqo2PQ8cXz83E/Dpn1p+NwFkIuISC5vmQ8pYqJ
	WGSxbLDkmGmKB54YtS+ZHGibCLeShDNdKfQnfxZKoHbZkdSYmUo/8CZcA2/Dp9JDExtGlyn0I9a
	OgrO66jrfldzsiscY/aiymR1F7DI17XKvoP+Y7A33qH6cuF/HpTLpnIqvvoHsfohHNNcZixwxZc
	e1zIa6EZhq9+cAFc4lzb9to0O0NKeBsOB0F5oZ6r9gKY99wk1wbOdnIjxQw4qBaCVnFs5a90BhY
	P3QjOCbSC5F6lo7mKQT8UsiwQ6Pyv1a9JFzXjKO5itWqrG6Wnf5sTsOaGXCCIE0MJp3teUux8I5
	TIXkyROBPFene+sFsyzpq639oYE4/y1NPC8pR2qdhzi1X6mCfiNaPZ6/KGjmDCVzF0DtGM3bPkp
	o5mqFsGKwRliIeybTjqUmFS+WuR/HzMWuENSLOMKfjOoJOBC6OVBKDjY2zkCXe5wrixUKGjycGz
	CK+wonFYOY1hHASIGKoT3SAEzqLvThpWOcR9zFFGG1QTJixY1dkUdaBt1xR4tZEKCehuayGMTuw
	7Z+VL7w18BOdkp5yoIqZyfULrzpBMnE/I9K2k/ePCrd1obLrjNINdSrIvrH5hU9SIp03jM3Lb9e
	dIPyLKlx+x2FxPfJ6IGnRlPZLjFWEeXX+nC/9srmWBn/NKU9iThnJgBI=
X-Received: by 2002:a5d:59ca:0:b0:487:13f:f612 with SMTP id ffacd0b85a97d-49c723fb77dmr22962598f8f.37.1794846863544;
        Mon, 16 Nov 2026 08:34:23 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:22 -0800 (PST)
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
Subject: [PATCH net-next v21 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Mon, 16 Nov 2026 17:33:44 +0100
Message-ID: <20261116163412.551438-2-ansuelsmth@gmail.com>
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

Fixes: 24699cc1ff3e ("net: phylink: add support for PCS link change notifications")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..d9d0ace2042e 100644
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
@@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pl->pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
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
@@ -2601,10 +2607,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
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


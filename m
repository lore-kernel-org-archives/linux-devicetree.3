Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653086;
	b=Ma7+338NQ8D1RpH6RwplOgGR3qu2jbJi6BVVh5Dk6aAAEcEwVKY7v94nz9orZTuPngyM
	 dOf+leymjErv4o6zgBCgZPo2taf27Q3j9l3D3DvZVSfFYhPpH90car+bBu2cWZI6KT3bs
	 Ug6VA5v2pFV5KBhL9cHyAhdcdiqe80TWJsNIhCzN8e87Pvh05sq5cYQ0vXi/ri8frZND9
	 c0EVYDhlZ1CZQckCV57X23DLqldFl/iMevsTI2/RvZBodG2OpZ7a6Du5Zd7Vm08wItWTg
	 uEbc7Y09FPbnNQ5sLeIwJcHe7hrNYzVgyS/OK+LiHyPtgn0hJ08R+e7wMenK9UehzmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
	b=XNuSMpcswJNBjdkGFDF1gSjzEGLTp2FAAk6nU6NyHaoUTpI5nCsi5OZm3GO/aWl90jwz
	 C9rB9r/0OnqLD20zoAk88FOuczgNyL+NiRtFtb2wgHW/0lQiX8MeQ4lyUqQjLWy+AFqKx
	 1O1E15pm/XrBRv7nrn63ppGxXUw+Mw2rMTDY3oBt7LV89lf8ijH0aYIxMAHHzoHsRG+FT
	 T7agMd5W9IxvYqHIeeJdcv3qvCULPMZa7COT+f+RB4Bmoj32hHLFDDQQUNk2hMz3Gim4J
	 4RyUCsj+G0c63wtxsx+qqwmx5xNARl387dDGlFp+YN1ms/pMxBOVh5/1HAQqj9wMa+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmJi0bTX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BD2606A329
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BD2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmJi0bTX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so8652495e9.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653085; x=1795257885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
        b=kmJi0bTXpxNex4wVtb9RqMfCtLeBZOi9VvC2XV80cTX0PsmxsT2YBo/c4CMaL8K6dF
         YdBUIycTBCbL6y1WWjzLCl0IAKQTVqGZjZKKkshwQznWls3xbDyw/gpcfzGWcoa+M1Ih
         W0E0Xi0w5rnQLjN4paVogn8ZvKmmdRy7WSvLYaiVc7UqJ4p7ZCbDR727tWONuxe81B/i
         RaMDGW3lu0be9TQMuVNgJmcwX5DxCJv16+67dxTa2zC8R1Y3ETQngec7qK0nmwXqncSb
         GbIyal/oCS7xRIhZqyAXOjwgXkHvFMHzarQReJl7TUtB3tuj6tRX6QIMH7ZdIlESMcDF
         GRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653085; x=1795257885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
        b=TC0R6T7TvCOwOvC2yzfewzvIiNF7Pd96txLIqtotACVisDGe3w5wK74exXmht7p+/o
         3SKwObb0K4GK3RkLKNiyJswmzMsGR11rEGhU7GNU7IG5nU00gl4CXAGy9XwtsI4Pp/o2
         lXn+a20jDCqqau2QfTTJcZGNr8fBhSF1qovin3wVLdajXBwn1BLR80K0tarm7jIJxnar
         JhkxM/xRnRMj8nie/33RSC1p/oqC/me5ZKvif3ebR0zIFfJS19nPe+B5Sw9+tN073UKq
         0LreK5W567RWVsK0kGAnQKcL1F5W5gYfXf186ms0HDnomLzBegfbEw5HMrjzf1EG5MAw
         EZ1A==
X-Forwarded-Encrypted: i=1; AL+hErE0Q56v/oMBxSOZsJAcrFFQ02R9Ub7q+WpFpJr1kK9Icm1HMFoXwbK93ZbP/Shepd6JEGvcqWKdextw@vger.kernel.org
X-Gm-Message-State: APuU4Z/GPddG1OeBrzIqOOeworo2Hxl//rG7XpWas9m9H7+8ExiCvIjA
	kl1akBcffZxL59qVd2I9ytsvdBm377FS2wCJ3QrDkZ35wyg846dw5LpC
X-Gm-Gg: AYBFou3q3eG2wfrFhvMAzUhqaVA5ZkXqjnWvzAeq8tEq4BZDhzKnafZaXWi1mn3WfCu
	FB4E+szDAn8u0daU3knW+cH42jhIEsde96mCINGKs8GmMsIt/mlrI1BR1r9pwZupgjW+66cSRjI
	sjBcCXK3NMJigG1OA7OuW2yHAdLs3ChWVJiNaQHyiyUi0hASxI+FdLDyNqEil5+qSko02LuQ8IU
	DFbXbIv8GYh7egnCBPrUp9LX41fMYgnu6KYmu1GLSVRcCuJKd/wmV42rm6hTAAT+My6R3f5MIIp
	ugT0wyrRcVVXRoNng2DDd1wAH/OmPDyaWdOtCPR/Ar0tlauzMhbwkF0zW6diGzoX5xOGUwjfcf9
	qShY7JVlhgbXNkr6hX3S4zD9bRYgZRUBg6fTYx6H2FheaJuZDHtaUh3NfCnoVa0E3D9/SCt4MXe
	sCk8WBBkpog5wzDD0ODZgqWPr/DXLpHzn9TSzdE482cFOqv5mQcC2YQ2xDfV6jwNeRZIoncHtoY
	VkZZNP/kgB4wC2DxmwKrB2OOkerXT20JHQCLSxo164uFmswe+E7kp6Ipb4vhPweub1s2ABjdjyT
	quuq4OBPOsgcJh7+OIUvtrz8OJ8Xx3Emr6/FyMzvLZfNWToTDpFWh8+zubeg90JPQJIztTkJK6h
	j0nOzOmsx8B6XTu7+uxZHBn4w0o+J03O+Gg==
X-Received: by 2002:a05:600c:544:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb55a662f9mr75106665e9.10.1794653084661;
        Sat, 14 Nov 2026 02:44:44 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:44 -0800 (PST)
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
Subject: [PATCH net-next v20 06/15] net: phylink: make phylink_validate state locked
Date: Sat, 14 Nov 2026 11:43:45 +0100
Message-ID: <20261114104426.235620-7-ansuelsmth@gmail.com>
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

In preparation for support for PCS release/late attach, rework the
phylink_validate functions to be locked under the state mutex.

With the introduction of a notifier that can be called concurrently while a
phylink_create is called or an interface mode validation is being run, on
recalculating the supported interface and capabilities, an inconsistency
can be introduced with 2 validation run at the same time.

To handle this, make the phylink_validate lock under the phylink state
mutex, add lockless variant for phylink_validate_mask and phylink_validate
and add lockdep check to make sure the mutex is held in the inner
validate functions.

Function that already run phylink_validate under state mutex, are updated
to use the lockless variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 53 ++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e2e0b313fd61..a7ec4feb950a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -9,6 +9,7 @@
 #include <linux/ethtool.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
+#include <linux/lockdep.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
@@ -550,6 +551,8 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	unsigned long capabilities;
 	int ret;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	/* Get the PCS for this interface mode */
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
@@ -628,6 +631,8 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
 	struct phylink_link_state tmp_state;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	linkmode_copy(tmp_supported, supported);
 
 	tmp_state = *state;
@@ -648,15 +653,17 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	}
 }
 
-static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
-				 unsigned long *supported,
-				 struct phylink_link_state *state,
-				 const unsigned long *interfaces)
+static int __phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				   unsigned long *supported,
+				   struct phylink_link_state *state,
+				   const unsigned long *interfaces)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_adv) = { 0, };
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_s) = { 0, };
 	int interface;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	for_each_set_bit(interface, interfaces, PHY_INTERFACE_MODE_MAX)
 		phylink_validate_one(pl, phy, supported, state, interface,
 				     all_s, all_adv);
@@ -667,14 +674,30 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 	return phylink_is_empty_linkmode(supported) ? -EINVAL : 0;
 }
 
-static int phylink_validate(struct phylink *pl, unsigned long *supported,
-			    struct phylink_link_state *state)
+static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				 unsigned long *supported,
+				 struct phylink_link_state *state,
+				 const unsigned long *interfaces)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate_mask(pl, phy, supported, state, interfaces);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
+static int __phylink_validate(struct phylink *pl, unsigned long *supported,
+			      struct phylink_link_state *state)
 {
 	const unsigned long *interfaces = pl->supported_interfaces;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	if (state->interface == PHY_INTERFACE_MODE_NA)
-		return phylink_validate_mask(pl, NULL, supported, state,
-					     interfaces);
+		return __phylink_validate_mask(pl, NULL, supported, state,
+					       interfaces);
 
 	if (!test_bit(state->interface, interfaces))
 		return -EINVAL;
@@ -682,6 +705,18 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return phylink_validate_mac_and_pcs(pl, supported, state);
 }
 
+static int phylink_validate(struct phylink *pl, unsigned long *supported,
+			    struct phylink_link_state *state)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate(pl, supported, state);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2117,7 +2152,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	phylink_validate(pl, pl->supported, config);
+	__phylink_validate(pl, pl->supported, config);
 
 	pause_state = config->pause;
 
-- 
2.55.0


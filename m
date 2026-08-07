Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971404749F5
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108418; cv=none; b=iJP6kLTlCmzh6LU+AA2Ajv25kxrNeR41ezdCSskxf5yk+gJCALS87XgR/HtuUQAKNuZkYmKTSOXrS9WeNy4VIi/9opi/UGbdqwuKtqe8BcDJGHPXpukkqLvkm/7nJhwHPTWZo7kaUVu0VhYKxdBwv+lcVQEg1lJ/CeHuDLbdFX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108418; c=relaxed/simple;
	bh=tgAvOh9XZA6ncvHGoLkjkptxgQuOoqAFalDphSpN408=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMB/ODw27VvV4xSx/rbWiv+ACuCKgurVJEJ1UMVbljfl6msE8suE4TWZ6qrrAPgz50r+1FbhfOypNjxdg5QtnepGTkZpBw9ilCR63GczjscsC/Sk6KVCyltws/vpj32zYwFrp9u21oK/dt/5QjGGpAeNFO+4feE9aFZKHqRScA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+R32jsS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+R32jsS"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2660945f8f.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108405; x=1786713205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cyxmK7kPg+0nT2A2qnq5HgZVK8RCoiaE84ocn/veGKI=;
        b=K+R32jsS6SmrOxURPN0mIFZH0GC2KT3XD1SU9NaI2ewDHhoIKpor4Fon0kM6vXRE4S
         HRcL0TnfZiQKumv85YsGBqggacU8iY1hvqZxsrvHfNHgQEB+C/7KgeLnFMZSJPZdVhXH
         B4ZNe8Rf6dwfv9KOA6MXiNFbUSD8L71Toqqrlyl2pG42IjNqFXDubdx+CjwxRigh9/LH
         gCRnO2mzLKABYG0D3W+q6HRAVWMfmjP+vxXGW4D1WBltLpNtQxiCB35qYgYxbRY3k9vJ
         jnowSIS09zOSC7CHYTpbx5Ss9Cgn++dEFqRBMYITpoBGE2WY++mm24oyG90pVe7op83e
         g3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108405; x=1786713205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cyxmK7kPg+0nT2A2qnq5HgZVK8RCoiaE84ocn/veGKI=;
        b=OOPTZHtfSENHp8w16XRivWEPEB/mhIsxnx0tomz3PND9CxresjPIrMCkCbK9W76aQZ
         q9aDfu9weTiGLcjMGC7J/zB6i2G2uMl9XyPE9Hu+zGjJXYYU+KpoRH2KPht2GlSLiF09
         QgGlEWRE8p3UG9zDAxb3hJYiu1Trnkn9hqjxcZCQXQFI7sRJLRl26ZjAIqIwyQig7e0P
         z1b6npHZdi46eh/n5hsUlM+k34a4q5HV4RahvTCizOJFvtJFEHEkLGGZ+a4WZeAaMmVS
         N6eotzV2jPUtAlxrLiRzHIrJuXgFGnVcHmzuxFPEVZzzZw9MRuzzRUMU5rO//9Ku0zeO
         Ts3g==
X-Forwarded-Encrypted: i=1; AHgh+Rou7AVbxHOx3NuaL6XU04IlE9jhYrNJnxxcB2LqL0N0v8qI8sDu/CR3tXQ7gzR6rNcDznuQKOiP6/ID@vger.kernel.org
X-Gm-Message-State: AOJu0YwaOHo5KFWG0r5bpd8c2FKlaR+L+Lq8UGiIA3fGcW8wNjhzVeZE
	/F9lVpvy1m0+VFafShqmCn31xUDWNR9SbgtvxFPdXmZU1opNwwSkQ1cA
X-Gm-Gg: AR+sD12gXBS3Pl28vFJw0Cd55wW/M3HNfNUweTkVuVNTbOQzTc4okg0oxUL4ryBH8q+
	fx4AwBhYBAIBJvHMs5cC5YJu13qJy9tu7hLZGpAa1xcbJ/Nm5yticyNdimSxzZ/3LGSpsm/Gm1R
	cpAsjGVINrceg3wxXtz+EyInoAj4WORgSlvgORMGL35e+o1oVrDD2/RuEryIf8b+Z82H3EusQ4I
	jLx3YGIrgc5CdGaHeYelV2BewmWgamv861P1iz2fhGJ/r/UH2pcfKvV2qANWQWy2Vhq1kAy/Dvf
	RB/Ar74ATFlHl6jkeq+MUWrz/MPLf0XB4ZCNGC8H1OHpN96v1K0NL/zhql3wpilUIlniowD5pQj
	HrYFsbkRuIVHFJiJeZTu8hVljUahzGTl2+JcRNVsRvD+paf+cfrstJEw3Ki+3Z1TIHgSZmCPgkc
	Tk1LiVP6Vk6ETp22P597yMphYZPhflJcjUyC/9vIWFnUqnoTt6uiwX13nKX4vuB0g08JuUe5bi6
	Hm5FBHMAL0C8wtTK0VftWKRJ7nEg1SxUxb5kRGV9BtIMQ29PmaLgC/RJTSoafTy
X-Received: by 2002:a05:600c:4e94:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-4994e6c5eafmr288598705e9.0.1786108404621;
        Fri, 07 Aug 2026 06:13:24 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:24 -0700 (PDT)
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
Subject: [PATCH net-next v11 06/12] net: phylink: support late PCS provider attach
Date: Fri,  7 Aug 2026 15:12:48 +0200
Message-ID: <20260807131301.192060-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for late PCS provider attachment to a phylink instance.
Similar to FWNODE_PCS_PROVIDER_DEL, FWNODE_PCS_PROVIDER_ADD is added to
address the case where a PCS provider is added after a phylink instance is
created and started.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
a new PCS provider is added.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Then we link the PCS to the phylink instance and we refresh the supported
interfaces of the phylink instance.

Finally we check if we are in a major_config_failed scenario and trigger
an interface reconfiguration in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     |  4 ++++
 drivers/net/phy/phylink.c | 41 +++++++++++++++++++++++++++++++++------
 include/linux/pcs/pcs.h   |  1 +
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index f575fbed896d..79fa596c2900 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -69,6 +69,10 @@ fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	fwnode_dev_initialized(fwnode, true);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     fwnode);
+
 	return pp;
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 548e783ae2aa..69d4f6675db0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1908,6 +1908,27 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static void phylink_add_pcs(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	struct phylink_pcs *tmp;
+
+	/*
+	 * Make sure state mutex is locked to protect concurrent
+	 * access to phylink instance PCS list from
+	 * initial fill_available_pcs and late PCS attach
+	 */
+	lockdep_assert_held(&pl->state_mutex);
+
+	list_for_each_entry(tmp, &pl->pcs_list, list)
+		if (tmp == pcs)
+			return;
+
+	list_add_tail(&pcs->list, &pl->pcs_list);
+
+	/* Link PCS to phylink */
+	pcs->phylink = pl;
+}
+
 static int phylink_fill_available_pcs(struct phylink *pl,
 				      struct phylink_config *config)
 {
@@ -1939,7 +1960,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 		if (!pcs)
 			continue;
 
-		list_add_tail(&pcs->list, &pl->pcs_list);
+		phylink_add_pcs(pl, pcs);
 	}
 
 	mutex_unlock(&pl->state_mutex);
@@ -1991,7 +2012,19 @@ static int pcs_provider_notify(struct notifier_block *self,
 
 	mutex_lock(&pl->state_mutex);
 
-	phylink_del_pcs(pl, pcs);
+	switch (val) {
+	case FWNODE_PCS_PROVIDER_ADD:
+		phylink_add_pcs(pl, pcs);
+
+		/* Force an interface reconfig if major config fail */
+		if (pl->major_config_failed)
+			pl->force_major_config = true;
+
+		break;
+	case FWNODE_PCS_PROVIDER_DEL:
+		phylink_del_pcs(pl, pcs);
+		break;
+	}
 
 	/* Refresh supported interfaces */
 	phy_interface_copy(pl->supported_interfaces,
@@ -2077,10 +2110,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	mutex_lock(&pl->state_mutex);
 
-	/* Link available PCS to phylink */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		pcs->phylink = pl;
-
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index f9dcbf58d053..5cdd121b12f7 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -5,6 +5,7 @@
 #include <linux/phylink.h>
 
 enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
 	FWNODE_PCS_PROVIDER_DEL,
 };
 
-- 
2.53.0


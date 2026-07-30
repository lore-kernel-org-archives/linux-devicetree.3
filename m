Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED8400E07
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407104; cv=none; b=p+fn+oy0+0jC1ZAUfFEM5Bffo2zYhTwJHmGpOJhB3VsVR+x/ANxX0daj05HZRqsWVN3DjE14gYQNDeUAdN15o6CT7KJUKCqt3pnahw1Gm8sEatu6ghDv9yImXkD6mrqC/qmxSo3nzNbXRYiiaeB70o2ztrzZytjcICU5JUzSMao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407104; c=relaxed/simple;
	bh=XUz/ShyoXvuqlw5THYosa3ImAZDVrvlgDzE2uZvQ3kw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMdi4PQNElTNRfb8YnE1epA6hmohmZ+9IjLdS3PZs0tf81ayqkdBMo7jggMkxirNUWF63/ZQDX7peq+BmfpKe98YSWGdATT/gPLNn/DNlFaQYpjNsa3TYM3XnhnkF8lg0XsZfiK6Il1/K95No7i3eawd4ntTb0Ej0How1a8gcp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBuNzwJ0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBuNzwJ0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956242332dso16796745e9.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407101; x=1786011901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=;
        b=qBuNzwJ0cMkfi60dyiHLexzN1SKuBukjsHXLRm28/Vp4rF3hClBIDxO8bb5CiOM4Xr
         TfMYzfgUZ8IyFnt50b798vinjERmkSkVVUq6/VjDYCAjBQUSrFKyZq2Y+TablMQpriAg
         JohVKzqstLSh6DZ5A7DqfnoYDMO/MFH/Mtd++Iy5Ch9ohHYd/kdRwCU6kG6ynSQLhx0d
         VOwSOZ9yUZVL9RuniAgQ07HIgtSy2VvUHst11eTsESs4vcJpqtnc5ywzSGR8Soxpo8Ji
         uHEFgEHxknritiKarr362dDHLWl8FE7iDGcUbh0zys8zpXnKDBrpzUNe7nwkGnm3UU1L
         c7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407101; x=1786011901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=;
        b=s29sM5ksCXfAiifrpbTXf9AIJXu8sxR5bsKOOAW2F4ogpf4epNQ2AukMWKQrYZgisN
         ltghqgzjrWbOht/v8vv4fM0NGp3H6JoUMybwLqWlVaQzOpp54Lm/aXCpTfoBHBL8eRSM
         /+FF0icOyv/ZPBh+x7cUl+fDYohhLUwGU27tAMCrM2z/r5uw/HhiOE1a9VhOtndcp+Zu
         nDL4VgD85DzSyXugcNT/Cmiy/ZPDGT1DiCvnmi4F5fsj8tTBzflfIO8PKmMqGIESkExd
         EJFpEekaGvZIU9IUXnvdukSfCRlTnbJG09Pp8lz2TuAng8gdmnmQ3lq0XUFT3yoowHCe
         EV4w==
X-Forwarded-Encrypted: i=1; AHgh+RrYcHOyM+x6moQzIdh/jW+TSM66cydTjL5vzrX/Sk+9bLCZHOAbMZA25Eg5USZC9SxjnPTWmHqZ0d6V@vger.kernel.org
X-Gm-Message-State: AOJu0YydytQ1aHWsMnHblJPk3rIDAInXh1B314CbqoWcnbI79jsfQe0D
	23TP9hT6zwHrcSfosvXnoYxOPa3jvCMtSYhDhGsvWFFQTjLkScUWWGG7
X-Gm-Gg: AR+sD12cIXPAV6rU9gSDN0K+ik7kTgdv/p+8byJcm38E8p9stg6BDZHypq1XSbsxI4N
	aZZgE42MC6JJ+wiaVQFmGFYIHZ007z5hD3YWZgRyVZJQNlLcOoiq8dyYcRb7gL7ppOZvArEoCFP
	smVpL8Wv3CaDTplF0HPB7btMW5e5dpPZtVmnM9CMRzguYx0xEZBEs/FZKbgS70/ehbRqJtpKWqJ
	QayutqxAqL2mFdMe96Eoz/7nTf5OWM8TXPdtK4UV6Nc9TCkNWGf4hd/+xSHLkB0Fv1a8vg0PqKS
	3Q//WUB9bp3sP/PrDTxWcXAejhDNDUuDCcp5Twu6dRfbMeZfTLiLRStm5x40feUyCmRQSeW6C++
	MK7rv5TDkF1IT5iO7f3n77C79ikPbozMQe9+Q9DrIO0yH4pMoc3l9uZ7ZTauz+S+K083kzsleW9
	9L/fqQHPIZcFQes08+6EPVAou32kWykJmbdKw/wJLsELnY1AztmbrP0GZVn3maEb8VNJqY7SGCb
	L4HrH6fLNqFyXN6nYQYq+n7cyi+TvQo4Sf7ylTcyeHTv/z3tEkpKQ==
X-Received: by 2002:a05:600c:41c3:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-49800e7b178mr13191645e9.15.1785407101144;
        Thu, 30 Jul 2026 03:25:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:00 -0700 (PDT)
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
Subject: [PATCH net-next v10 03/11] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Thu, 30 Jul 2026 12:24:14 +0200
Message-ID: <20260730102444.1967900-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

On calling phylink_release_pcs(), the PCS will be removed from the
phylink internal PCS list and the phylink supported_interfaces value is
reparsed with the remaining PCS interfaces.

Also a phylink resolve is triggered to handle the PCS removal.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 60 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a5e2d342a92e..562e09d1838b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,9 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_link_down(struct phylink *pl);
+static void phylink_pcs_poll_stop(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -917,6 +920,63 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
 	}
 }
 
+/**
+ * phylink_release_pcs - Removes a PCS from the phylink PCS available list
+ * @pcs: a pointer to the phylink_pcs struct to be released
+ *
+ * This function release a PCS from the phylink PCS available list if
+ * actually in use. It also refreshes the supported interfaces of the
+ * phylink instance by copying the supported interfaces from the phylink
+ * conf and merging the supported interfaces of the remaining available PCS
+ * in the list and trigger a resolve.
+ */
+void phylink_release_pcs(struct phylink_pcs *pcs)
+{
+	struct phylink_pcs *pl_pcs;
+	struct phylink *pl;
+
+	ASSERT_RTNL();
+
+	pl = pcs->phylink;
+	if (!pl)
+		return;
+
+	mutex_lock(&pl->state_mutex);
+
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	/*
+	 * Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case, tear down
+	 * the link, force phylink resolve to reconfigure the
+	 * interface mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		phylink_link_down(pl);
+		pl->old_link_state = false;
+		phylink_pcs_poll_stop(pl);
+		phylink_pcs_disable(pl->pcs);
+
+		pl->force_major_config = true;
+		pl->pcs = NULL;
+	}
+
+	mutex_unlock(&pl->state_mutex);
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pl_pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pl_pcs->supported_interfaces);
+
+	phylink_run_resolve(pl);
+}
+EXPORT_SYMBOL_GPL(phylink_release_pcs);
+
 static unsigned int phylink_pcs_inband_caps(struct phylink_pcs *pcs,
 				    phy_interface_t interface)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ca9dfc142388..15e6b1a39dfe 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -751,6 +751,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.53.0


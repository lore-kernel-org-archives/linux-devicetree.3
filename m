Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1646042AF9B
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440552; cv=none; b=hoGHHm7qfDmX5pYTr2hYOgGsRJ36vIO/7YDC4JlJr2TX1VzaPe1wmiJ7JiB8aAJUEgTO/ylBUwFmZUyOK4DMiX0ZFcmdQcQ4WfLljeLYH95XrM9DEUc9JSuQ2zhY0tyHbXI8KwHtZuMEJ9ZrYxaJRfqVbTbeWNmxkuHF3QdjERU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440552; c=relaxed/simple;
	bh=uxeJVrns8QwyjSHCN9EiUaTLmLVR3PlKWthj3ETOI48=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XblSCV8dpFSvTjcDUjcBXAwBq6+L4kUWGpR/aYC0lDzgi6Hryl9m4Mz43hNHayFP4mZPPu/xo2IEd7Wf5bgb12gz0aSBRc254dXdYmwaG+cMs08p6OnuIzXgzWPxBTA8c8KAeb7SP0gd2P+M7JwsWe4xMIDCCdVZYWTj1AMd2Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUvm0aTQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUvm0aTQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49558ce01afso4902735e9.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440548; x=1787045348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=bUvm0aTQzetSDcof3XZfIue6q6esK5KkZYVlKTZg+smkGWNvAL8q9am28VIHgd/hV7
         GoXXUeIFWPlurb+PwPRc6qHB0DxSsC6VnV4iQKQJttWheE8H+rQJ23vZOaMbJkh7DIM2
         tAHZmlqywQ1HJY718a6BWAd5vBOUomJgPROxkRshGXoZWv4YfRg8e6bmHrMcdhSKXDXZ
         sNMeHrxm9XJpDpaWvb7mTHxp9qE4bMgqzkL9LhKnLbgQxc7Y64krWJJd8MLERiFUFSrZ
         U1SBXPllOZmQga+eVAwHLR6AzYuHf1HC3n3uBpH3DlsaEdaBuiEIUGndyF6tjobfiTZW
         CAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440548; x=1787045348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=pZxOGSvxo2JXHBdASzfF+4M+eQQorkCFItgC7rXvG2TKx6Ulz4SUPz1cF6vOzGXBrD
         kG4VYBbEk/V+dn5vFkfVKtXSv+ioNdcZbogisjjeaFwlAZk1zu8jk9BuEMoewMKxL/sc
         17P651D9RFan5NLW3S4W/ixzFKYbCPKCT+PSz0C9KadrXD29d/2vhnThVYRVOf/BjeJs
         1cHqajPm+VmQCgPq1NwrizBnWxp4gHJ11Byojh2i+Ghz5DMkb7P489A9Yezcvha8f/5c
         lReKpkKnXHQf3g3tHgM2Ub81iOUGErdllDG9yMwkEo2a6q8g06fOBNZS4mQ44NJHMdB4
         whSw==
X-Forwarded-Encrypted: i=1; AHgh+RrZMXUjkTiLSlp3HVjoRgwRNKIjoQIl3CQpK1IbUz4yTK3DvN9sDOTb4DkmYLBHJVXJezlpKinOQgL2@vger.kernel.org
X-Gm-Message-State: AOJu0YwAOAI07vmfBVo3IQvOb11ZaC6TyEcxvGfxIzwWRyZ+bsgDyko/
	eQM+Il/kLuuYWAPa2KMRM8fhke0DkWLB19B1kIY5k+QmOkWlR3VfIg4z
X-Gm-Gg: AR+sD10JxpgykvW0jFdaaDXLisGmrEx8gfn7O61MAiLqK7LvXkEaDK49+GmYkxqswUp
	IyptDWMPqpt724LpBKU8UEyYtP5uafIQXnsPMXtHJU925QubLB//wjRKg8mLvJqu3N51ymUMfXJ
	M66KjN51m1cw2GBLbEwKtHKW15cBPv2LDSjCQp0T3S4mFz3T0DE9eEUqZP+9pMJFsA+tvkuLi2H
	gH6gCCD/vVs/Dc1LxHbOUrERlbd80yv1F0DS+PjJrVnj4KKqLC8ebp5dGUjOOnB8/08tsnPYt++
	oF+fnAkul0qLE0pi6oAMK4Ynh6ofsfjdcBPxTPXbX6qFC3CZ+C4kyXUuJznn0dSihDNu0ucvBr+
	bzTK6bBtzWIcKytJU+t50a2kA6kIafe2/Od0lvyfQbFKfhqrb0d6xI07ZPDz/kGYfKihje8+rRA
	DcYAn9aXUC4mYrKyupGNII+MD3CCQLWiqbSLEnmq4XTgK/Kjh3qjAVBYxUuBgXqaQAtvInnHAH/
	AnT0Di9S0ou5ctV8nabCFZP1xWnQsolQZMghnUFGijB5d6b1A==
X-Received: by 2002:a05:600c:4695:b0:499:726a:117c with SMTP id 5b1f17b1804b1-49978494f70mr24088285e9.19.1786440547839;
        Tue, 11 Aug 2026 02:29:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:07 -0700 (PDT)
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
Subject: [PATCH net-next v13 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue, 11 Aug 2026 11:28:29 +0200
Message-ID: <20260811092843.673837-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
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


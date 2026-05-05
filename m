Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1FF4BC025
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005663; cv=none; b=TAYycamg9bBsgQv7xdVc91R+S347bFB8RiPjrRkIpU/3GbRPFe5Q9NKSx6V5C7hF/34aVb42pwDOAGgsx1toT3zgk4tvyKRYSDbtyk/8fctbjK2ty14yiVFvrroERfe8i0B01XgO3ylByDFWjXpwP745rGKHGtRL0B0fn1ixb3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005663; c=relaxed/simple;
	bh=z9crCwe7rX7Mram2FgQSb/0FBR5Vy9InpMtWAVeDhuc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gqq4XKVe5a643S0tgHF4JjJRuXvpqPyLFip/1pMQo/6EesdsXAH3qjLVhhgTvUxzS2Pc7aidEOIiFikKnI68cFyX1uIfado6l4K6fbupbH/0KTYP4YgnNy3SLZtCNWRMWcLXeicZW0YirJxPN76jr7pZlIM/qaMaGO9T1xH6p7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=stJ0RRhC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="stJ0RRhC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48896199cbaso48872655e9.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005659; x=1778610459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+otCYoEYq8tITJGMUn5AwoyVWpaSds7MSzdEdQ+mkI=;
        b=stJ0RRhCVn2/0kisqf26nbL4OXyc9AO5BYInq2c1aeQENEwwBz5mkTq3IQ2f3hbO6g
         b1y9CJf3Rb0Vqjn8e/I3xdjZVZxDsSKsEJCNltIqQwUFbfhdVaY+d7sQ7f2gserDnb+k
         yl874Nt2Ckx5Tw32CHe+x1qVpRwjC0HhoY6PMrKhA+ZvVykW1ZKhvvA4zDZOZqGOXiZk
         jivUOZzntqDfQ7VBFGBr4PhDNzt8jsQqhn4y3WlIiV42gCPa4JktIuiyu2sP2EM3idc3
         0y4czF/sHtwCp871edVWzf3PSc9aFVh2PQQ/IcnAoldtw334oDcnat9tpyNjviiAQjIl
         LXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005659; x=1778610459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B+otCYoEYq8tITJGMUn5AwoyVWpaSds7MSzdEdQ+mkI=;
        b=jcIgC2r1ySgUB8/0KOmPifbBKbCf55ikEuld11f+DW1TCcOMzKqEMUJMMBYr4rSBou
         t6wjEG0FGY6tBgwzOmLPxzIxdrky0Kk/3e3Gx+LBR96Lg2SKGvQRZ4Ye2TQgAZJReOBw
         1LfOLn2AsJNkh3Gnp4LiVeYLv4M8yg/1s+awC4Su5G6S9fbD9d45mWAm+sMn1fCxT1mC
         5+kbF7s0ikFNDQAj5E+Libo8jFkspniRovymMedVisqVMZi9pzsjb/mBWgYhm5ozEAgD
         lVDcz9I+/T1zsotPu/XQFaxCL2mztgXn+CSUzQPa8cH5yJetFpG166lv12pmgAZ4dAnS
         1row==
X-Forwarded-Encrypted: i=1; AFNElJ/YrCSNJglUhNmTDouKUMebVBVKe+Mo/A9iWfIkFcpTXjcV9vXjwE3YQFRWlQWom5ZKYJtUsgfDczrF@vger.kernel.org
X-Gm-Message-State: AOJu0YxuFNXs5xTchp1GSpnBIY77RX55xP8B1s4aeE/ER4f49hsiTrsP
	Q6x0kr24/kaW3Izh0YLelPu7/1B478ivfEdMTpQNaZjFU58tnpRP4xwl
X-Gm-Gg: AeBDiesHiTHDG5WpUuE7Mrob7E/K1XlYNR0PVAq8NFm9Boi/9weQ1t9EDmFx+gvZvq0
	dMXSDiyqAWy+AKL8bdqt0BOUcfC2b/S8GYmqFMwfPZ+rP0YAY8yKj8QA9T0OniFLgLG/IK9EbDo
	KIq9XDI9UIlCLqHWArXGJhPnHtnD+z1bfnqrzq2KHbgIB5xjwFVen2UTdsHLW2wqk0XQsx/ts8o
	tspjJRKy+kj1yEn825wQK9uXr08lGTQnYfcTMIl4z1iPutnABaVo90u7F1MxZ2yz119e7mlrpb/
	JKZXEe4IgfN/4GPi86qnYUOdshZQ05Tyh7uHHNRjSwR/eE80ZNCyl/CZreT4V4zmYwL7HhZ8l5w
	Nl2rnWFl5MFvcXHbv1EGJ1CljGgbl5bue4JVUh0nci7aG/OFH22yx8jegclkzgzWMV0Fsadp65O
	XG7DyDmWtIt5RJf227jZJct60ChUQteyMFehkbALhfkoMS1IEerJni7GZhLXmMFB2Aze1DAhRTl
	bgiMUI=
X-Received: by 2002:a05:600c:4f53:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48e51f42798mr6028415e9.14.1778005659102;
        Tue, 05 May 2026 11:27:39 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 07/10] net: phylink: add .pcs_link_down PCS OP
Date: Tue,  5 May 2026 20:27:08 +0200
Message-ID: <20260505182713.27644-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Permit for PCS driver to define specific operation to torn down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called before .mac_link_down to torn down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 8 ++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 4ef31bb4eb05..ef2306840c5b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1036,6 +1036,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1735,6 +1741,8 @@ static void phylink_link_down(struct phylink *pl)
 
 	phylink_deactivate_lpi(pl);
 
+	phylink_pcs_link_down(pl->pcs);
+
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
 	phylink_info(pl, "Link is Down\n");
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index aef4a4fcf6e5..aefdca01b77b 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -523,6 +523,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: torn down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -550,6 +551,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
-- 
2.53.0


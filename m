Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D947A87B
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108413; cv=none; b=soRfZwJv+0IWuhGeLwESN8e/qS086t5Lf8ea4P0ciTa6VArlu3A9XyPOjgTSblvNEAPAp5R77H2PiiPm8WaY7kleUUYChm5CHL04NMLREBn5wpWQT3WlzkE371cKlVerwezILg7vafLaqtstttfDfoahIC9OMIGtVYg3uBQoOwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108413; c=relaxed/simple;
	bh=Jf7dpOSRcnrHlN/3saaMWmUi2b3nRHGRDDnO1ZHl650=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GndvyEoByu7O2p1UpMcsFdkGS17Nt3ky8xyo8BNJzz/z+K/eHMjUlGKgqI01FKHLqQcbRos3V5zC6hSpd4BKJXP/utjX2LokP0H/i7YUf7Tr8QBBi6Stz1fzKXn6ayoGmhTP6lIyL74YLk0zFkkV8wADwlOy8aDEyX8dG0TsHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJ0Af7df; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJ0Af7df"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49954b88fffso17129135e9.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108400; x=1786713200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7SiPVU+Oezx4aeCyIoOFu+UHMO/l1pUlXRsyexY8XZc=;
        b=OJ0Af7dfpL8nAXD81fHhN6PxaGAEUfpelhM1968LTy1NVqxyRn9RNsh2r7mVpwNdsR
         ncFvsaVk4Nh9r7ZUIrHddPZFVq3OHlMHWucaP9fcsAN9a8kuNFFuS784TMBu+8CCFKAq
         D5lStjt1FCy2nKTXc89PuQdFhP7fBC7C/mVdNXw2qa7rrXQf4Ej69b7PVBbhxMfttaMB
         zdQ7Yj3S6vpS00gwcZ7D6fF6b41TmF0vH/qisF8w8Em0KRnzvjOtMFxklFJWmYqw+fR0
         7WIPKEFASTEOBrbKJhzpGL+Wp8tvreDjU6D/UvPL2suga35eSXCCTFstK6NWPqSQKffX
         +Q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108400; x=1786713200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7SiPVU+Oezx4aeCyIoOFu+UHMO/l1pUlXRsyexY8XZc=;
        b=fac/tKkm8DfwbdOskMWKVj0f5TPceOj16rnvUkD1/CWCXJst+4mxGgRApLG65npU8i
         6eCxlqpWc1bgRbY14UBsAABchdN3QKgfiYlXHKbzFRxeOuVErWCu0Lz7cHKAgTVEzSA3
         HqFhoNV7i8usfBUtOj2KyKTz3gYjnQ01T990BD70FhFiYLcTqfKrVhTMjlu42oejW3+a
         XDdQhfPXQcVr7/mDoGcAWrph7hxuxvVkVGbwEKi7ojMy0ipQwLWBGTm+JtxtZNaSDk2O
         qF+Wk+fTJntIf8izDc//dQ4/chtunkbDeKIRyU4jDqi1V6WvwDzGwZrO4mv5DqDX4XA4
         tFyA==
X-Forwarded-Encrypted: i=1; AHgh+RoDKGok7L56ZW4BsRgS0gdR8f5mYLmAHdmm93yt1ZSof8DfxTb5yXPK1cJv3iMGublzAciUqV6JcewY@vger.kernel.org
X-Gm-Message-State: AOJu0YymPqUGgpH4MGDg23pMs832dRdbUN/17caW+7fBU4F/5ohSLjcI
	r7MoancxVaoR3/4XtaE1wC/zCv3qouT5GR2CfO59tJAuHVDbRBwxBa3O
X-Gm-Gg: AR+sD11JB8LeRUH4rRBhd0JXzs5DI0SzsI3gAbQoz7Pa6vva6/7DL7jRhmGu+6hBbuq
	RY1rsOlkitIrsnXMoGHwQo/9RPbQgknGU6icCUjbgqqAaOeJxavWPQVlqrifXcRxtsOG6SJEju5
	0P6smXT81pxtLRNyOpq3cCW4pIvhqh2taXutkEzjWpqb6HMl95AGzXh1YlUwOLAHrASx4wWojIc
	11RsvLmFEr84vJ+PknQ0jdey9QMEw393DPQpF8i4+gLssbbTiXWrBaxADmMIfjBjTzSjWvE/mIL
	Q+yAmy13BRDJChjM0JEvs3IYUsxzVgvsXbf5grY6b1YTikGgmBX61hzJfL5rtn/GPJ6XSw8EeR+
	AlyUEvt85dM7c8T42Ya6BvcOiofv+0SEbsxj0C+qT8Xt6NBghpqqh0+SSGdiTN0gLCd/Y3aiZQN
	FklojQ6tXYuGmO4zVJI7rvzd8dXONOnXZHGBWlhfyNkVOj6GMQybWnWL2pnQXbJKairw3zzrcVY
	2UqR5fvzFCtQ0BnGJChdJsncgBhRdIuEcsjDRMsy2UVoVcPdDehgA==
X-Received: by 2002:a05:600c:4691:b0:495:7426:c392 with SMTP id 5b1f17b1804b1-4994e72823emr265837225e9.1.1786108400466;
        Fri, 07 Aug 2026 06:13:20 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:20 -0700 (PDT)
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
Subject: [PATCH net-next v11 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri,  7 Aug 2026 15:12:46 +0200
Message-ID: <20260807131301.192060-5-ansuelsmth@gmail.com>
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 9decd7333c70..041405ce6bf0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	const struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -1988,6 +1989,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
-- 
2.53.0


Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC547253F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251427; cv=none; b=s1N2DD1zZiGaDtnaff5YNnjtx3Um6Za2nmue4PJFk73CnfBK4mAa7DAt77b/tox42K+ODQVlRhs1n3r8boFCRyES4BbB4kntiygMOOj+3rC9HBXCLtuFgpEhY2HKmOHbj2nrb9SW+wDqlQZDzf+MBCJ1qKK6G33yuw1Q3X6lYxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251427; c=relaxed/simple;
	bh=QkfsO9iIXWwWqn2LLgm3fPfnrSGchfrNPnJ7yZr1hKw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VbhXfck9OmGuyRAiDmu+cTt7+4xFesdb6qUwxRFn62Kdyn26YK/sU/oKrlLvO9B3jnJLPWo0239M70bjHyzv43hJ5ZaC90JsPT1lKtGj0LCM/upW5XvQy7Z25flF336duPvoUYqdrn74s5h+ce0fX5rYJD4MHs3CoTPPV0jsx1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPP5AhIT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPP5AhIT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso29962785e9.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251424; x=1788856224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Go8JUbpoOJsxHq3SuM6SXORIBsWItiVTBm2QkGFiCE=;
        b=BPP5AhITsB5ekQI+qVkeySJghnZ+NyqZ6+QcizNHbYn3ZpQL2jDnsyRoZfPeQfjq84
         /3B+oe+Qh/EcQYSS0ngjZyku61Rwu5lWm0uIYfVsm/idRicRTmZo/2RaRfKrYkI0OW9o
         okPxe+l4uDgjp8K0MxsIcsrhOD6jC0BoInSYsCVFDnuYgfFSUiAGNB2hfw+9GEUNHDxs
         tDEQ0czGOkC6t8SVnCzDHk35/65JPPZE6QA8zU1vk9mxwGGpWLdGPggsIWi5KZ2HwtOI
         U8DKRtUtlqTip7RojD9YqgmVND8df6TmVuKjUtUcRSljYBpduo/eZ/WRsaG12kgejNGn
         2ajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251424; x=1788856224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Go8JUbpoOJsxHq3SuM6SXORIBsWItiVTBm2QkGFiCE=;
        b=mPJ/z+fs2ARP5w+nF6SCh9cPbHVQwuUQP6ndnGGDoMTXNB+p0J7GiCMFglvZ0IguoX
         3BwZ0uxGWG/6VMadAcoHFRWCiYu6rQqmXMqDOi85XowVN49WsENPIxFePHpDTlnQkS2q
         6F2Pw6bdDBr1ptr0L7RAEpaEiI0NuNgPR4CutYW3shY7xyyWvR7xl3NV84BasOuGIPlE
         jiQLxsQsIzZgLH2Omn9KFQPDlPf3jKbNV1h8UvarMaXY+71sjxT+bWI1XUneWg+TVaOE
         z8vG2Z1UNPzlg4UK4i9yhI6xld8xz7J7WFeRR5qH7TrUbdHf4k81DB1+RGc3FBb6lO01
         MwFA==
X-Forwarded-Encrypted: i=1; AHgh+RoTi28LYJNg8C5cGAA81Sxf1nnsBp9chJ0X2NAxDlGve+seLLxgqB7Epz7xWxb6kkSW+iYRmv4BeVEk@vger.kernel.org
X-Gm-Message-State: AFuF++n30O8/hxl9DHltfJQHsda3YiWWE19UFA91vK5Vg8SlrKdrxKhK
	MH+J9X1Q2ujUx6kxaLDzzpztPQZ8a8bzvtkdE/cFLJo0x9XKt26TtNSvwDC2WzHz
X-Gm-Gg: AR+sD12+C5NDM1qNWYnuGFgiZF18J1NJ1FIIObNh5Ie0yC0M38t1/CGJ4KXZWcMWYpD
	JoTAGGnthH3TmIQn8MsJXyU/ir4/NZJ7EgJWnFFxPtBXMpuuv78HlFKsMSxQBAgnWK2HD9eo1cH
	/wX7igxNijiNOP6FUTpR0brOi431UmqD64jHITb/KAAW2BA66XYnu0D+PUX/Yr21aM/ke4MLjFE
	1eT742xj+cE/ENydNMmufIZ2Qo+VlwoeeFAl1vcZCIzCuSmmrBQaZWxvXQmSE6xaoUIAsCxOPJN
	hdqNq23PPzfddLtB98ApFsHDC1sWH8bjgXVEVgpGstyfPC6e80iYV02IhwCSUJU45oCjISL5WyD
	cFQWC9oHaTdqd5bzeACfqWCABUTwcGvMeuh1g3XGnZK3R9zv8d9Pppm83BXkvsz16vXPj2yf3uR
	bvf3wV0n5do6kx9I072CT4AZEpwND1AAArvDwFV2IhPOdccgdQJb3ms/guBRN5fMyDIC07UoqOS
	mcDmuhzTL3jyHCbYpxzlkH92FRZuT+vK0PSUIQZAFPz7pimHEIB
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr438008405e9.12.1788251423887;
        Tue, 01 Sep 2026 01:30:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:23 -0700 (PDT)
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
Subject: [PATCH net-next v15 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue,  1 Sep 2026 10:29:19 +0200
Message-ID: <20260901083001.8044-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
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
index d7391a60f01f..96f72eb5a6fa 100644
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


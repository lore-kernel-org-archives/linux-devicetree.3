Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F5E4FECC3
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570550; cv=none; b=m+HiNBrLmvnEb2mvppvpWcChQImNjHjBj2we7B0TSA7r8HXZLGNTJp0s3/2FD+nZDxKqrPlHqkf6uP0zzzzbEq2LIw0WlnYqeF0l/2X6XyzF8l2y93miNMaYJ0JARoxx6ttsQ+sxd0jyqeUo8TpoVbvGyBB0BzK+Sa40rz9NAGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570550; c=relaxed/simple;
	bh=m5HqqAwvf714jhn9AtFujlH/Cfft9cIXbM/MO6suoWc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mo/LlADxXnXdLzF6wpqDZlBH9aD0YN8C3v4Edv9SRgca5tmX9f1jCr6LoXAutIjtiCfUi59NvlWsbrWdjSKgNe/BBKE/ITmbYAJI5BpPRzvBjSeZNBUXmlp63++hBjCm11eaxAcO+1xAT8be6k+cq088XIWHXsMcPgeSVTKKf2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmTrLDb1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmTrLDb1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so53448f8f.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570543; x=1792175343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=GmTrLDb1MWwldnZ3d2c5G45p4fXiG+jIr8tqArrqf64NbatwXybyHqRyyu+RWOuvf5
         ootpzgbp/S2vMiBIiV4pIgYS/KiReRONIYhtQ+n8vkKO+wqkjcMnCVSmUnP8x/fz6lAx
         23jb9FyUmeGr4XCrIrnm0LHwFH7uluWyl06L/TSsP6wzeQopWCHkTHV9VXI9sHsrhjTy
         WYoDXIpa23jNALo169N3EtG8MkzwfNxxbFGNXDG7GyLCqk6k0sovJwvAYASDYkN1Ncnx
         86MCfWVMkUoyQTjpeszKZLfZ1vZ7qznDJuZrE488FAPK+8QFdDBRkUlvOmdIL9SD6vIR
         RxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570543; x=1792175343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=TixAL1z1A1W9RDQgnyCD7LU9jYtgqFs6CWeEwW9JOgpmjANOVIilp39Ci//rEdXBXf
         qrlgA0v55mEDNDSegtb3qE6MjYYMoHOhrhg9qfU5FYifGNYJT670WipoMe9Kxdm0sG0w
         fOFi/cxDsG7aWdao6+3lG7aNh9/dkYaHq1aGorxyONDZcd/UOgGWzNIsT8N9/C/erN2J
         xOxUAB1IA/+OGfQEKuT8KYHtoLNbcBXLtbYpTqGKGqKhs7mjUYtAjvdx64J3b7NVc4WL
         ujujsSCV4m0j4HJlf6x6W9hKgXQ/HbVWVLgkgcF8vBRi+XThCSyevWY2A+ToP5zUnoJ0
         QrNw==
X-Forwarded-Encrypted: i=1; AKwUvBwvzu9yI0or7BSa829rvJQCJ+zXD0OBqb0DpkVRviHqr8G2hbFpwzruRXdHcet2OVP+sWitWRGQmOC5@vger.kernel.org
X-Gm-Message-State: AFq9FYKmbHl5ce25YcYOwP18KWcxMtLjVpV74iHc42rD8Nbg67/QXCfc
	r2uwNm4CnGyYHZ7MlXm4hQHSevK7BwZdFj5xBniEf189lWFma0l06p7h
X-Gm-Gg: AYBFou0RwWb+LWnUpc7YLtdXv+2kUsaZ/LRsQL1rp1KGLkfPp01JPlsffQksdk57bnn
	tBIcJh0wtYCGAGdUBjzUMPfzFpWjTkrKzxjBhcZp+t9OBHaolO5+q/YJJzan8SlUJ5/Ts1A745/
	K1Oq1j9dSWgdO/4Vd542of+bMUVLXPvU5/5z70uX6Eju/8GNEXcPcXoFcYibDQbs+kIBiWzi4R2
	P96N6bhoPLaSBU+MmRevmQ63dlpWJKLE0s+abSdZ1JKx564+XRWTDtnjUPGdbCRy66R6xpg4PNY
	uXIP3CPln9h8jWWqP1K05E93yi9LH7XkytJ/70ydA2tt9VqBYlzn0Sm+ESKTy4do+a2R8Uj9FMX
	PlmKaE9GcMMgEl5jEFN99u11b7w36zleGwG921JosgrfM5ZIR0X6aLKaR319+ViIDuKt5lWYRvN
	tKxyZiQaQ5NMd1F9ct2WAoCS9b7ZNT/+2ClvQ6W0VQd3QC1fatHi62CQJR8RF0VLhPGalhkipNC
	BhI5ccIrvSwDQF9FpoEDFI8rDd4ktVsFmoLJ4EpMa1dkaQ/vF+tV6ZMmIUzYyfzn/RO4Ht1r36v
	fAqHRB929SpQB677cg==
X-Received: by 2002:a05:6000:25ee:b0:48b:e50:715a with SMTP id ffacd0b85a97d-48dbace01abmr5330100f8f.34.1791570543097;
        Fri, 09 Oct 2026 11:29:03 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:01 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri,  9 Oct 2026 20:28:00 +0200
Message-ID: <20261009182836.50631-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
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
index 1156e6c61a08..9441afe372c3 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2115,6 +2116,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2199,6 +2201,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2229,6 +2232,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0


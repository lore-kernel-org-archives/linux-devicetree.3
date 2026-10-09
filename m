Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7151616E
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570561; cv=none; b=ZR+zxe+dak3Ss2dRLngwrcgJ9drEIln/AW6qu8WZMXpYgNs9ERz1nppGrJieo9vM5A2ce2PIQEsW/NLU5HABeE/4lhxHfTiJpyGn+dy2XmCOtC4WODjPX56MHxWn+lD9vM/8Lqy/HKx9BG6r7d25wmCC05879ch/QDY34mfaQ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570561; c=relaxed/simple;
	bh=neO9PGuZ4G7cB5JON6/8adxHlnPNKK85h9GRwbYWdEE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/nYy9InpMkDOGGrTNJQWZRstRjxrLWUQdY2euie+ckQQYQiew/sX4oCeTMM/22GPBz+E1COZumltTaqEOkUA5YVrrUnKp10cYCT1Hea9LqfUEfY2v7eZ4/ASA1HcnPK65JTRk8p4UTjRlpGV64hYQ8BL9jOIz2vdp612oUBhEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBQDedSl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBQDedSl"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso74855f8f.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570555; x=1792175355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=;
        b=SBQDedSljyyFjBypV+KiiiyFha1SeMeW1ZEKN7qzeEt9/PCb3VCf0ayjzZBuDt2lHE
         oktb4t8v76x2XCLG4rDMPGYPKVBfGiPRSJdFGPC4YF27EXMwk7vU4MXxafDug5gxhj3K
         ivmt6yXaL/eb0YfAzraPkP1P1saO3vbXPJnpNwEAe86ZJX2vjnboIRzUboki+2JW5nIJ
         vWBhaIDfSFcPJSWWkpjBz/CeyNZ8BAX9Tdb+wvWcVwiYYLpTTESPPyWCyxkaESWG7BPa
         j3oLqapHDXqRI5OnWRTUyXPZ9WrllJ0BOpzWwA+kEYCbpUfPWPU8u1x2MERAegPQ7J3N
         PRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570555; x=1792175355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=;
        b=ZgxDePkLZxtEFscNcAFZtM5OFqNRdcLfxdFMjg5PuUeeVLVCsWwiFWIm+KpS8RkdFy
         XNYqQ2lfNPAKZWTqZRJ43yvdGE40yOmN5j6DmuyqVf5Cv0yziSzJsKNTTk/IwAfXC5QU
         RtgRRBKC5A113OaMXHSYLQuB54XfEZugpSB21pMtETi1CQiMISq62JNNo2KM4+ZrkoFF
         Z2US5Xc0RscYN34VJWzFVmr4rZVr2lV/xYGmmDSJvMSxJ02cyh3pkwXMM3vuzeBKipW9
         sGdTxAXnUwDZqDHdjV/cpdOCZ/xvaoiQnnP/lPlWGpKMEIpfN77aIUyKEVn1STRjWM/w
         G2nw==
X-Forwarded-Encrypted: i=1; AKwUvBy+qzlySWgsGOOtsebO8ESGPKPPHnE96h/1zVzzIbBgRrF3kFmnOZVJ/pd50XlHLsTpAVz7azkWFX/F@vger.kernel.org
X-Gm-Message-State: AFq9FYJd4zlizGRB6KtUR2rY8h7wn4grCeBf3WSCZZxNHarem116Fwjt
	p5jtPpZg3Mo3DpHB2yuw+IZdlM2TwHNOR4OJSLQZxgJC3fosZ/3T2uSJ
X-Gm-Gg: AYBFou0BzA/NkKTsw7pt1u1M/LGz6/txKgJYJOLJDFXeT+mu5Smid1MKVIpbPwRthM3
	eCgxWDqOcgAI14HhzBLXeSPxqWtFEG6rhnVlFFolKBQV+J8WnrQ9T8zJQM8IFPSsss1RCWg9z8s
	HbOyh8vnGtUE9zXNLI92RlZPRI84NQPTAQlryoAlLRke50aLgatbLk7izZM1BqI69/aRRg9E4rk
	+caX8sY7y6nuxpy8SiXUgZl6nBo/bBnCIbFB93oOaiv5ap3wRUmaraVpmzIyJ+4i9dmmbaplPD/
	uAXOP1o6EsQ5YFctJlNmoBzenOs8o9T5dG7YRhnXpSgkOqyl1kny5Y+YLfGT09MB5UzJhJxeWBy
	5hr3gvz3GxX2xZny/d8bnCL0GKMg1uI9VmUvmGfvycT2YNkmBQ6NyVvka2fZXiMCv8IajJgSKSI
	0RoKVuZS+OjMhZcXrgm6I+ZJcEdfiliRCgrJYBxzYLrivhfgbMTziD6dY8qPwE6NR/oS5WMUjNw
	IHjWPiHeCrZyKG/QKWzc1ffgWljrAH3m5a+SOASCWYVSBSFoHdQPjGPVdkBU4CDdXu83zcEg+/M
	Ympdal54ffdGx9EN8g==
X-Received: by 2002:a05:6000:46db:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48dbaae21dcmr3669370f8f.28.1791570555000;
        Fri, 09 Oct 2026 11:29:15 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:14 -0700 (PDT)
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
Subject: [PATCH net-next v18 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri,  9 Oct 2026 20:28:04 +0200
Message-ID: <20261009182836.50631-9-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 509b35b5a0e7..d8533e36941c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9759,6 +9759,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0


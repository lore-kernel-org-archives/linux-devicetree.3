Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13F042C4FF
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440565; cv=none; b=aWx8gcT6a2xylO/W4F2aGakQvpI+4jCBoZn/hqtxyQMXCMXkzhHhFIPUjtm3K5MG8mojB5mxgzBkoac5s+rgSKdSTra+6Aeh0M6p0KcSVybUhencDk0PigJYrIS4PyKebg7SZOzikfzV7/XC5INVtz/R5zXRCat84/rKG4fe1Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440565; c=relaxed/simple;
	bh=qr1ayfYw/TaUJNlhsz7JazjlE9h+RLODo9YzpXaYNW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSSZAZWWlpXgEbTbck+M4eMwPfU9Q6DHRAKSrcHw5k4wJDWGFwE6Tuku34ik64FjbzNkv1BYpmrM0V5FYmArKLPtfkYbrBQYQ+anDQXACR+48Y584cb3tcULI9ekOwN3eIB1Thl1Me8Nhbz8TJkSOdUuleHttjzuPWynWHt6QzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RX/q0JH+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RX/q0JH+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495590dde14so8395055e9.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440559; x=1787045359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=RX/q0JH+UbQBDd/25nAaK1+TykO9Ft5ruotgBSd6tGm5YnRcnlfwPhhxku4gMAZokF
         A1cnzUod8E4e3f9pGAD31YI3VloSdfc82zFJCez3RgUm0bIxvu/F5aJwh2pEX9lTm+yx
         I+0l+V8ckj3opmr66mjav9VMGemzA20Vhb89+Uw+oxyBbU7qFlnFwkOuq0p3mjJlnpQk
         6pxD55IjQKQ/Iutx2CK9Sl4N3bMS6TisSiFYhrKkvM3hxnJyF//TI1uHTnFwD2PrGwx4
         XPOAsHFH8wiOKA5Gjq5l2YxVCeJ7bbN9F4jycNkERkw6Sodt9VMDtbfZE+6hT64HEjc1
         KZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440559; x=1787045359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=WWDMmNiBgcX3JBy5Lw+MM89j+5yGzXkbzI57MUAUrEZPuxPKMjlzrp+Npv1lOm1CjB
         o7Vfw1pRGRzvUlJ7G1oUCrG9SS6ZBzIz3Bx8GNcZ8I4mgWMCydA1c16/2b7vfDnRmy2O
         0wYnWNMRdAAYjScasTxmC7DITIPFjwwhvXsiPv9qx34Q6HjKNBxD3+Ai8jnNdqmrcwrJ
         Ia6gAsVlwdU5Z3o3opfNmc+SSCKIpphcefj9mXZhQKHpy58Xt0B85H+eUqMHJJjeosHi
         Ly+0dwA5zSqJJ1/DTIEjCRiVXJGm6cRBDC8CsGcp8ERL0oCAsd4V/hNQBz+LYUWKTkZT
         q61w==
X-Forwarded-Encrypted: i=1; AHgh+RoY4Xctyaw+32roJY0FLS1Gcaw8jBj8bW5KlGUucYrf1ei781xbeGv+tCJQmmgDRlWjWACTYfspKSMv@vger.kernel.org
X-Gm-Message-State: AOJu0YwxO01k476alF7q0U65JdQNQ56xC58dhfIleR0qlz+FCJvKIjJt
	3YSY4BkAqrkl2Dk8j4Tue0q+H0RKcm2csUS9SPB8SJn82wbdCpLjLVcr
X-Gm-Gg: AR+sD13ggsodKnJFDelRCawh6wsti1KsG6xmqBMtV32J+bZB+CyQ8aNVy31SGcyKeq0
	mXbL5pIxyb1cGnEMQtz363xdbWuq0LNhm/Ar/oX8ifoXijfSmE5QKKP6c7jSLB77woo4JUgmw7v
	AXd5zSFx9hIveLiodkk2AoeMZc5T+27HcQTCezyebdYAJ2MeNgpu1Pf4r/lANTwS/mr0IN3saBI
	CvocN5wU8fNzlyxJAJu2p012kr1EY67HCFrsJQCKjyEHXVSuDf/flDZMaBvyx3cV/vso/Q0iOeP
	pVlskV5DrdVnvbySwgZS++p52Hv6+oGjH7e4cbnfsbGshfuysIm03VLGzERelSG9SmOcpmjwG/y
	ib4k9E7dKHX6WKN1+xaz+dpXFbob6uoy0qdgVHzyY/t5cr9+nYL7xpqyV0QnbBjeWZiWOmOnuyB
	3bwouE9N0fvx/WIp61GLlC+IWzjgHCdfTU81ZhuVkwTo6Ucb6B6A4t3iOaDZ0tXD4TdSzOoXbKB
	7pAgJHbu7aobpfXIAYKtbiKIfZRzhkaGFIUYKyJDgqSSOn3
X-Received: by 2002:a05:600c:1385:b0:499:6faf:336e with SMTP id 5b1f17b1804b1-4997846c8f8mr35438295e9.13.1786440558763;
        Tue, 11 Aug 2026 02:29:18 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:18 -0700 (PDT)
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
Subject: [PATCH net-next v13 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 11 Aug 2026 11:28:33 +0200
Message-ID: <20260811092843.673837-9-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08e43bc09735..e3ded0e4a115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9688,6 +9688,15 @@ F:	include/uapi/linux/if_bridge.h
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
2.53.0


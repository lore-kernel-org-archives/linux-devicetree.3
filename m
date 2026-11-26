Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654549;
	b=u/D6seaoYvAKZA7NEv0l8F0bIIgr328NEUpQr2yPFbngicIM9+jy2d/d7AMOYPSKoMpJ
	 iLZbMAuWNbS8sJWDcQ4uXIU+k8Ij57I+ADhIFt9woOtDS8p36XBoUmksB0dQ52CGcEfZC
	 FMNfMiIrCR0Ixs3z5ao4DmRJhly7rnfvz6nlAA5Fk5hl5d+LpH6KQ7TwbIDvE5nBOm1Ez
	 QRqC3k2su30OXtfoDaBr763DZp5sHg5mGAR4rXRUbvHloJe5jxqywMy6xCUdsH7nF2fOr
	 5hpP9B49sEyMOY0PZ2IbYbW7MPYcRAWiLz8Xsz9WBpRvnxfachBCv+rRv9g/icEFH1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
	b=HNLjuj/HExbmvsQLrbSg76hVmW1dZObxS1zHHCckr5dQoRkWFGjroNx3PlWrt8X8eh3C
	 wKNqMBgV3MbULEUz0a42GJ19ozevsEnTUqiXhoxVAtzWKyvDiJPbv+26om4+vl7ChnN6e
	 9s+yVdncuCCiNODyNw2uZcJTe14urbkEruKWL3+B6I1dMNiJszRra3z5FJ87WTghQf7Hn
	 NdfQFs3XYDHRJk6otfgNtmNP4d5FUMMso0+nQo/BEP7fB/HDvvCrw3M7FiBMuWlCGjpDS
	 UUwBtlf8dOWtfJaAp4PSUhSfjsCYvUldvmeP+hgvHyXejfCwQy31o0bE00vX/v2wBgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBilkkii;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D682606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D682606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBilkkii
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso3094042a12.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 16:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654549; x=1796259349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=zBilkkiifgqg94O2Qze40zl5R4V3j5169oIzwYtebeg8d44E+//yUU5NJCCOh0C+Am
         sQ9PS83u+QAqgs1j0VleQp+u+qvuAccr4A9dWEnUK6M1lg1TRDbnowa6LeaJcj8YHaEB
         xZeILAvDmJ17GPLcZ8SKMVov6xHjpm0KFG0ADjEilte++ywQHEV4mQ4LHHkng/Kx55s1
         FXNLEIYymw15eFs3ahQlkVAeA6fpXYWmGzsbC1HOtchj+ZHBftAwnVciXyQrOnJkgtpp
         RLJzy2R/TNw3YTXl67uZI4OBO3txKNZ6RSxjbyszN+mOI9kZEi8Ozf3VWx6ucdWsvnrX
         kplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654549; x=1796259349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=JzZmR1QuwdMUCbupJ/oViV2p9swLcrraQhoQIjUHmcpgpdWYaWndVBo3rhs3lfnYXx
         7oDbC8JSuaxelxKKTh3O4QMX5N2UJ7ifSgs5YDkp9XucFXitBta7PLluMvVRfVFom34E
         OLc1WSNt5rTNInzy5L1BKPZUB++rYZVNWktz1iwZrgdQWKcsL5eMRelcSbSBJ2gmyN6D
         wexYEXv/GsKmr1jvuvbK/tG4VKV+XCUdOiR0YO1uNKev+LPnC4rM/EyAY+4su9NqqyU5
         ri1iQIgHLFZNdMIUpnRxcOgYFIT7hZC9soFjryzeeTtRhR7mbx7HYXslDG2winJ04IUz
         Qbrw==
X-Forwarded-Encrypted: i=1; AL+hErFSXSjLsRxqYW/+PiA4775wNdXc/xt3R3GA8I5P7H1AKOJEhFrIMgpskkCE6X5pFCzKTk5o4KzWG/zu@vger.kernel.org
X-Gm-Message-State: APuU4Z9cx2D4NYiJjFlelZz5gKaDgrknh6AWmoN4558JN/KU8V3+5iI/
	7BHFgOQIPT4BnR1gLDM0LGHwmklhxbB6erhhIgB69XKpv9CS787QQCCt
X-Gm-Gg: AZFdTZf0xGX8OG7h3ImOPSX6OtVgIwoIyD960NkeggGR4j8RnPWWncv3F4ptsgQtnYU
	Xs7BvvQJSytUoWpp1e1fL4eyhFeMRis2NfBOo1dsk8kwgN2k4fDoi1etNr/sKw1z9lLHlp+Aeg9
	kMKS/kksnHKwJt71TLdbtI36epOG8NBaluD1UjK3d9bFFqTkDfZkeGbJzNl6fWAt34AUE8F2MyP
	nPEa3MUTyIREJ+gsFuHDO48f8wu38Ghiy9mFmvYZjF8Tr3jxuRWPL62+Uh1fCVoLceumnaJ1PQO
	+8HJbzOf0TW9fslk/b6NSd41D4ptbkos9ATpdAhi2Xw7SgMrHxfMrcWZa7Z5Y0eA/0yVZdbIw0h
	xIl/AaitsMGvbut5rlrWh0ROCyErCKnEMYTl9lQHY2wpOM3E2VL+2i8X9imcp9CZ2A7mQ70F5D2
	gtoBAiK/EvMImSHl+suif9e5hJ/xpiFp+LwkcVfW7/FuT+pPpFGgDOYL0t8IoBn85XbFrhB6guV
	Pw0vA09B3h1fnhRhA1kDE5F+4t/B8+HYsxfTLrN3GqmjLrqW/9qSur7CdfUnGwdqXV1oA/W8jY6
	cC0QdL3O+ACU8N2XLyqRurMr+YOkkLtGGjwh6333sm4yw6COER5ICHqw
X-Received: by 2002:a17:90b:5907:b0:3b5:29e:11b4 with SMTP id 98e67ed59e1d1-3b5029e1464mr2151811a91.44.1795654548474;
        Wed, 25 Nov 2026 16:55:48 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:55:48 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v4 2/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Add mdio bus child node
Date: Thu, 26 Nov 2026 08:55:14 +0800
Message-ID: <20261126005524.4156940-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126005524.4156940-1-mmyangfl@gmail.com>
References: <20261126005524.4156940-1-mmyangfl@gmail.com>
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

This adds an optional mdio bus child node. If present, the mac will
look for PHYs there instead of directly under the top-level node. This
eliminates any ambiguity about whether child nodes are PHYs, and allows
the MDIO bus to contain non-PHY devices.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
index 89ed6ab1905e..a71529825955 100644
--- a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
+++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
@@ -53,6 +53,13 @@ properties:
       - const: mac_ifc
       - const: phy
 
+  mdio:
+    $ref: mdio.yaml#
+    unevaluatedProperties: false
+    description:
+      Node containing PHY children. If this node is not present, then PHYs will
+      be direct children.
+
   hisilicon,phy-reset-delays-us:
     description: Triplet of PHY reset delays in microseconds.
     items:
-- 
2.53.0


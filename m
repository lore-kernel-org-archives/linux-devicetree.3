Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AFF33A9FF
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 05:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734125; cv=none; b=E8hlwqzC1yGLJH+zkbyri2l2RWyGF+1K+hFBLSuLpLuMcEac/VIp5uiV1If/5wKlX/yrJNjVNmaqk8l5z3G6GIZB17qivOT4bHzfFJDMOLfk3hQpg726873XTuoztYlLoyznGfVbQtV4JNwOn4LwX25bGyEPZr4JgdX0V1DZjoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734125; c=relaxed/simple;
	bh=n3evcqugoeKkN8mct7F9d78wCyor72fP/A5f+80l5jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3iRojXKrhG/i9tC+ESmmKw1g0qTeFFTazIGAiqPN2nt3zTTfmRlZk/AIItiZyKedPT1rUCf3Z4Z5FZPGPDTIS2+Y3dSK1ZGqiKCp4O3UYFr0ABKBLdxlX/W6pQrD6XQTGiNvHPzqMxjIGwQOCzMB2OIbHW0XsHGU7O19RchxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaR+wWi6; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaR+wWi6"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb42a2f5feso1476389a34.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 22:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734122; x=1786338922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDt8py0RwqfKJ99qa00T7ayi3DardBnaCg62Nlf4UJY=;
        b=FaR+wWi6UhUqKEIX53WQXfc/1eP4OYnxbayHoUgSKSjkQjvp8ZxHwQSDe3zsLXHBBG
         62wxSOPS+x0uCk3zz1RUg4OMugJK18WcDarGsdN8hqp6LKs1gQ9bxtYB5kiV+X/W45o4
         QIZsqVkh+lyOVjOcO+FuXkLcwjaek92zjlFAqtDaNP0z0wydU0yt8TUMvxiXzwgr8MYk
         17IALm0/6PvkbDYl4EbVQjOU0PJw+lFCat6uqhZbYv78umvW6g0P0Gc9zIJTiP4W+dW2
         T2/qXCJl1G/bnG1ql1QFKDw0JBJKzgJ5+TMfMWdbM3jVabI0IhqAmxiMRrdC3QuT/Mi1
         Raow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734122; x=1786338922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDt8py0RwqfKJ99qa00T7ayi3DardBnaCg62Nlf4UJY=;
        b=fScAapK5ei2mt8XMdloAi1Vxo58cAS4GFaU4BjDER8hQC2hRRINYhzPwhss7+V2rtP
         /eMy68R1PtJZDuZylPcoNr/T4FuYz/I+U8HjEUi9KRC2lraGCsBv9yxPc8aE+zK4TacL
         /ZWsGAsNK2k5ssi4HY0EseEiARQYyRu7gQ0exqP+LHWi96RrapE5Yv6336RzEPHbL/Ee
         vbOV4VdtUF6Zf+DH4ZqW8mSEb3xwyKaRCYX6GQJtLqe0+BdWr81f9LitBLtWeYxg9T6d
         UYm0vpBhh5+do1A7SYRod7owIfrRGUGvqyUEA4UBaqH4j4yf+KBrtPHmo5iXy5nhkC9s
         c9Zg==
X-Forwarded-Encrypted: i=1; AHgh+RprisB/b3N32tg2BO20kixD4hMI6zMueiZhf/rIJ8usrlkox1Nd5AIcfrghHhv2HBQddAk5KFKEvNdZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzX52f88uayOIBLODW+ZR+83zIbX5pvTp5psqp0rLjWqbMn/VLA
	MgDljCA9O+VvSA6kYmIjnqPx7xVuDJCewBWHaHWyTt+obn6Pz9fdjhDR
X-Gm-Gg: AR+sD13Mw0engU+wzHbDnlZHHUl6i1iEWkj7kKn3sGvotGgT4nKWnBjz5Tt+fW6B748
	NwdHYSo8XqtPtMVwtL/P1I6sEqwtix9H3mR3Or/rHYgwa98AZIwE4R1FYEU57D9NSbutjJ5m9kF
	QyJiU+HftSkNGMNsv6rVIqniS67lCELgbxMr1DbnuLRdUADNxnF79ebLkpY73wNclifhXx8WFOX
	9ZslBm5bpjRxi4w8vPNySGjBy8jT7AahAwpIn8+X2oPinSYYaQQ2QNyYNONBF4aHZgzuDfeKUZl
	Pc5oJOtbygVsw6DnQMaGuu7s/QkdWhv6RJS3UQJ6fWL4fJTv7ALJ8W8TdKkD7cY6uvhj8HYDgpE
	9RqWwzAvRZLX88asQyosb8Hf4cgzcXRu6/LLfyaxu9muL2MAk1cxRazctscyXvHIiE/4tfTT98H
	jvRQ4zN/E4YZrROJPs7XNJmj+201/99l693og+jewhafjcrH11D4Tv1NYZ90WaPXtk1Sj9rb77/
	/cLL2yDOLzLdUVrymbldcFg4ujOHIKnhGTSJ3vdNOq5RUbxpTXybugcMfILM9YifrMRTa4oV+Ye
	C4dvHmVL6hKtaOPBJuE77Rqxff405TtfWL+MHSLXzT8xv24HKQxJWzA2ESZgpJAIGOdaeWAk54/
	Gx+bgtgK6s/EaVIrwv7w3s4yS6BQmErVWxSlp
X-Received: by 2002:a05:6830:83b8:b0:7e9:d277:6e2e with SMTP id 46e09a7af769-7f196cae28amr13872954a34.7.1785734121347;
        Sun, 02 Aug 2026 22:15:21 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:11 -0600
Subject: [PATCH 01/21] dt-bindings: net: allwinner: add H616 EMAC1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-1-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware. The
EMAC1 clock register also retains the three-bit TX and five-bit RX delay
chains, so allow the existing Allwinner delay properties for this
compatible.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml        | 18 ++++++++++++++++--
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..34def84e6c21 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ select:
           - allwinner,sun8i-r40-gmac
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
+          - allwinner,sun50i-h616-emac1
           - allwinner,sun55i-a523-gmac200
   required:
     - compatible
@@ -33,6 +34,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -91,6 +93,17 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        phy-mode:
+          const: rmii
+
   - if:
       properties:
         compatible:
@@ -100,6 +113,7 @@ allOf:
               - allwinner,sun8i-h3-emac
               - allwinner,sun8i-v3s-emac
               - allwinner,sun50i-a64-emac
+              - allwinner,sun50i-h616-emac1
 
     then:
       properties:
@@ -109,7 +123,7 @@ allOf:
           maximum: 700
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            PHY interface TX clock delay chain value in ps.
 
         allwinner,rx-delay-ps:
           default: 0
@@ -117,7 +131,7 @@ allOf:
           maximum: 3100
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            PHY interface RX clock delay chain value in ps.
 
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2449311c6d28..102ec98ac2a0 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -57,6 +57,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -622,6 +623,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0


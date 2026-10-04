Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D709F45040B
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124852; cv=none; b=T+g6Je9LBlY+CBQOOe74uFqccfam+4vACxNybgGP2mILvPfybAsp+RQPeF7CjMysbYrrxUJKJJbP2e5xW2OL40j4zyuBGgshMOhD6TBHNhL/bN75XxnXvq6ObkwRAsd0+JdQen+1fnTC/ieK5V9bXunv0D32nZGy4xVSymuZ99E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124852; c=relaxed/simple;
	bh=r0bZehJ/h9qV6bZwoNpL5+7u+BLPuFzPlDLsb0N2RCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxmMg2ITB+easYFFVt0NrncgCOQZGJbarH3hwJC3oQCL8pIFtCEnE1q5ub89PIa0QFryqkRFK/Z6bfqEDWfCo4wqhhg5/LyWE3rBzv6ATsjodOqw/SZngiJWp+6rAhWjHhcsHReofuCNnWyL9n2Y8E4u4vGEzZqtXGM2T8Gz9Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so419465f8f.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 07:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124849; x=1791729649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPkMV4LDUGNtqaIPInjsEvbPyhBM9s86wkifiwBiN14=;
        b=qlCWdpkaSap1BjDZE8xLGHZOEWYMLnA0va9zG5OqhNwtUtFu+kcShBFoMLnDmQjB7p
         0KZnRb884A5pJSHAIQ6rp296Y0QzVopovJch5XE5SfnCGY3B3WzdHwOo6Ia5NaapUJhs
         JOoMlSd7LKRzw7lsgh1oItkQGWPBg0zCA3hXMgCyztO8YzNklQkXY2C5ECi+kcXnpg1R
         XLkqhJl9YL9YDGWC+8sFF/p4TM9VwsLQNBHGiLhUszKE/sbMAYy+g8N93tk5dDB0VTSX
         GvWZEU1QhbrwWLF0q0xRzEx/eByZ9EC/zKZKXc3HZf8++dRgTh5vKEk2POVBdfyCzAdB
         UXMg==
X-Forwarded-Encrypted: i=1; AKwUvBzVTwKpSHdTDHC/KQ5LF27l8iefUbAD6EBWOw3Qte+dKwm6GQ4u+leMoJRUxx65Ey8V/xkIUi9SBBqd@vger.kernel.org
X-Gm-Message-State: AFuF++k5VU5sl+Mh4++o2XZYM3UYdBR8FcrLgiUitB8iC8lQtnxbw+cR
	wvL+M98F6+iO4xFPPAA8duKLdwz+hDXrFPdPl7BtWpc3rjYuDqEWacKg
X-Gm-Gg: AYBFou2XQBi1eJyPIixNa3Qk0J6h+NQl4rDZjQqqt7ePEf6MYv0S+S8I7YzoOnf6lq6
	7Ov0F8ufI9Q0GtIKOANnpCW/vrAfoHtTynIQWtYapTD9+Py+c7dZZtt0kgC0BB+kHsrw02q6Bq9
	C4XxHB5eRu4pWlOgdrc+u5RFxeWkVZSh+sl3AuoQsCCI/Lbf+qSYw2KI761APj48er6mCAnJYGi
	h9rGOF64V1Lw8rBz+Q/V20ELaaxLnHaHYFgsw2p7VG0CFbAed4JyIwxWNRydFa+Spx+KYwBATde
	ClY+RNEsi4R5hUmmYBGo/zMNJ/VgSFpZH9iotlvCDb+w7OfnE9ZTwP5jZyMziNAzi6zGkXvrE2Z
	q7xA5oTBBMTZUgDW+EE0ny9JYCuAhwnxW6LXV9ieFz0AJCinqC24NSrkk4Zz7uul8tV28cWoXTU
	nXZSt45xf7wxJ/52eK/6ILh0zDvtxV+dtBxAWE9pCCbjeB/xm7sqO+PN+SBg+zdwf5WsDXS7BvF
	93oPQN2kIb0jAboDm1BIJrHz2wGd3UM1w==
X-Received: by 2002:a05:600c:870f:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a0274e9d30mr145830305e9.2.1791124848951;
        Sun, 04 Oct 2026 07:40:48 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:48 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC PATCH 1/6] dt-bindings: net: amlogic,meson-dwmac: spell out the compatible combinations
Date: Sun,  4 Oct 2026 15:40:41 +0100
Message-ID: <20261004144046.391444-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees actually use: Meson6 and
Meson8m2 fall back to "snps,dwmac" alone, the others also name the
3.70a core. The example used a two-entry form no device tree has, so
give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21..90ef79161ab1 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,20 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - enum:
+              - amlogic,meson6-dwmac
+              - amlogic,meson8m2-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -172,7 +172,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.0


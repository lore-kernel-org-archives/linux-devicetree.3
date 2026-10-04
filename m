Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A33F455629
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 14:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124854; cv=none; b=TwKoC7Y8egdrfQ1ffNCFmfXeaU2CmYN6DTKtnEhS6LQlcw46TXBafjyDIaj6M45ct48e1x3RHGVIs0tIfkONaccvLifiRYr96NstIe4ufu5CDbrjbdhnu0pw3huAYG7UOtjhcTxZGZZyWioB05cT/d6hXLQyGNym41XDV1o7Jvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124854; c=relaxed/simple;
	bh=6L0A/1hwlgu3ZBemNtOVZ3kfBVIJlVHUD/x3pYd8d2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8UMva1CnFRkbvGOyqENiKBVX9FPqxnIwZwm4tSYDO4u7jK2/uJqxKnrfkanUnPOgysZZC524NmpDhMePLYfob60thjW7r6suvTbNZDCkZDtCdFyuzNCI3GhTbYAL2it0r3gE4Q6RUqLM/CGHRJxUPNWQ9cmySS4exuBgHtMyDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so10218015e9.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 07:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124850; x=1791729650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cr3LEhlSfFRZpLIfOzA7XjGagn89G0+3vtw0RCWpTl0=;
        b=RxtEhwWGl1gFJWn7rH4bUQj5noB5iYGvKW6h32gnit4ms8u7CTjELhgruMAjbTMq1F
         2r/zJD1HZd1awv6IaHUXYHAHmLnCvaDUxJL/x3kMjwqYaCbO3TPsEOrD1nOrYStHd2lX
         /DJ2wssyH2Z8UHftXkeDPGJS4zC4WIPjY60FDQfx+md6riLzjY9AFdF2dEllGDdHN3F9
         xRv7hPm06tIuAbiyCLYsEnO55Ulrid2gIWHssMS/TmZhwbzmNCaSb7LPVElTBET2y/DS
         rW5KJBudubHosDL8gWEXaB6dKvKkPwRPw9+Tz5IiGvg0fbSfXXpV43WnB+zOLzhycnSl
         0eDw==
X-Forwarded-Encrypted: i=1; AKwUvBy07zcV6ukI2yYAEU6KZxvpioT7vb3pZ5hjGx17ARevxrfcw5SEaKeMt2KxskKvQvT97Jq9/jGHio2U@vger.kernel.org
X-Gm-Message-State: AFuF++mZogFBfdc5HzAVBHH6+cFKnwFRA6Ip4GnqsDuq/VknD8RTiHE+
	b5NkSycBkQlXjtcPWSmgQYKybqEJIo/i5FTKxyZZi5S+hSDt02y3LCEF
X-Gm-Gg: AYBFou2CxffDDPtHamzWSZEjjtvyZxO0WNnMhdrlH+pY9s4DDiqffdsPE9GfAS6R9dc
	ndQftCYrrSgxZ9YqBIe0PJbqFoiM28Re7SZVowyuQ9imbV6Khdke6FgTLjn6hIDml1bVzLZMwOi
	oG8TDZRmukHp2VQfuN12EoqeLjgmhkhYe9RmXINDc+g5zrYtNVANbyyld2Rzi4fnKx+j4heQP8U
	DpG/MALFo1EolJXdakeXqGNbbcRslyp/OVHbVsCci/t5FZbZriP6nG3AP/bXZ7EiW3sEYz+lOLO
	UJd/mHmFOzthmaJMgQrzsHYeyGtUh85n9GBt2Ibs4RvBDKzuM3B818zEdN4cPseo5zpr5OGNpxW
	O9375/6oxzmGSPV+2LlEUnVuIv2ksPPQQsndgMdL86RQR7qxl4jfmHyneL5/aXQNX5vbmUXH4nV
	XqH6RplI8F3WcrOo3POacfqH6zWTXHNbeE9A22OkIzv+Jhw8yCk73OXKGFlG1Zx4qGu9WupAZM3
	ppk4yT2DrhJ1ca+Xp6cuU9YauOBt6VwLQ==
X-Received: by 2002:a05:600c:c091:b0:4a0:1f90:594b with SMTP id 5b1f17b1804b1-4a1680fd78fmr60092225e9.22.1791124850158;
        Sun, 04 Oct 2026 07:40:50 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:49 -0700 (PDT)
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
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 2/6] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Sun,  4 Oct 2026 15:40:42 +0100
Message-ID: <20261004144046.391444-3-tanure@linux.com>
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

The T7 has the same ethernet glue as the G12A, but the controller
reaches DRAM through a pipeline stage that the hardware design inserts
in the bus path. That stage has a gate of its own, which no other member
of the family has. Nothing else in Linux claims the gate, so it is
switched off as unused and the port can then no longer complete a
transfer.

Describing it means a fourth clock, and the fourth clock of the existing
list is the one driving the timing adjustment logic. The T7 applies the
RGMII RX delay through PRG_ETH1 and never enables that logic, so it has
no use for that clock. Give the T7 a list of its own with the pipeline
gate as the fourth entry, under the same name the SD/eMMC controllers of
this SoC already use for the equivalent stage on their own bus path. All
four entries are required, since the port cannot move data without any
of them.

The RX delay range is the one the G12A has, since it is the same
register field.

The compatible pairs the T7 name with the 5.10a Synopsys core the MAC
reports, and with the generic fallback.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 90ef79161ab1..96118b4d1560 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,47 @@ allOf:
             - const: clkin1
             - const: timing-adjustment
 
+  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enables the
+  # timing adjustment logic, so it has no timing-adjustment clock. What it does
+  # need is the gate of the pipeline stage the controller reaches DRAM through.
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-dwmac
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC main clock
+            - description: First parent clock of the internal mux
+            - description: Second parent clock of the internal mux
+            - description:
+                clock of the pipeline stage inserted in the bus path between
+                the controller and the DRAM. Without it, the controller cannot
+                complete DMA transfers.
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+
+  # Delay definitions for Meson8b and newer (including T7)
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
+    then:
+      properties:
         amlogic,tx-delay-ns:
           enum: [0, 2, 4, 6]
           default: 2
@@ -106,6 +148,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -143,6 +186,10 @@ properties:
               - amlogic,meson6-dwmac
               - amlogic,meson8m2-dwmac
           - const: snps,dwmac
+      - items:
+          - const: amlogic,t7-dwmac
+          - const: snps,dwmac-5.10a
+          - const: snps,dwmac
 
   reg:
     items:
-- 
2.56.0


Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7DE2EC0B5
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612027; cv=none; b=Wge7XBvTw9K/CeZLVqSiwsFGLxh5wRIgSdRLgJbecgnx7QPP7qeyGjZuEUhH8ltawZVdEFPx0JUCFXvH/m1ejKUzXldTsxWUAolYqrP0zXqF+kFebj5YgTqkybc9yiwBf8eLofW2zD6UX1wEVdMV+jDtpWKcJ0uZjvoSamfMgwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612027; c=relaxed/simple;
	bh=jMSHy6+WmjUm07cUbr+dM0oHmkA931idTrud0XeInaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bE7go2qWvwxUmiv5ghY6TdwZiSO8F2udtVphwy5F7GzgMojTNrIUetQ/41yAnC6qXsYyUX9CW1lzd29e8IpDVD9/yaMy+gfTA4geFX/Aq+LbBRzSqJ65p8bNek6NEm0kAKxnvrgAD6iJzN89OYJkme3SlzGrbF1MEPQ3cw+VTEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+Vew7Hi; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+Vew7Hi"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82a655cfab5so1925039b3a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 04:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774612026; x=1775216826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W64wTQhEhajKqbF5c5z2t7cvKztIxSj6q5snf6GmhIQ=;
        b=r+Vew7HiwqHbf8xFSCjVt+f5+DAunxbgUjBD+YFQt+WF9xdf0JWoxbUI+95/IvcIrV
         nI/WFdHnjLeUEtAviRPf+GkgYDtddEH1kTiPtMtLG9Nr1GX0FJnJXjdwgxfM3k+Kw3Ed
         IMmqDGpY2ks25ZGZBFuOzDdGL/JCQoBGIxiMBQSVBa4lHbKF2IgOslPLmzT8Ox6cssQe
         Ez4iaGOoso8wwP9a3NhtWX0lmmxFJP2wE7zys97QQZEKRzsAP6w4/HJBulbr2yQcBjI1
         5LF/lal7r8izFniL2RuVOwxiWzhZaPTW1SNBdOyR6DmWgkddNsq+cXqDuiEQW/03irHZ
         8idQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774612026; x=1775216826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W64wTQhEhajKqbF5c5z2t7cvKztIxSj6q5snf6GmhIQ=;
        b=VFLuLjGu0aVnqS7zoAFxrdM8n3ubXPvLjc5h2IJLm56/YPLCEXS6pHL5KkkXf5HCEj
         BuqvECc1aFU2lag5Yi7WSCfg1nF/xW4UmF9ofPE4DRsnl4J0rQiMK1xwnLrRyyZeqtGs
         MUo9XFS6p6Ioidug/1kti8NpAM2Vq9hd6xX2rUlJ96Ggolv58R+imjoD7QLyGZLvzb/5
         vEMOZXdAlNDwvjZWpjtVl3YDwYYi27BRoNTzmWLk21lPfFFOqp0wzA82narUB5e9Czjv
         037X4Ca/OBpSsamvPnSryr7BdECPy7pw8ioBWI7hxaPE+oPDEoVJDP/mkX5b17LjDnip
         ZvwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaT0DPwEpQ4rU2UveO3E+TM3osY2+y2D43LuK5LrSBmsNdcCedg4VkRAJ+90UJ07QK2uD/vDzoY8Op@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Uvt9LTuXN4tU73yC7syAw9y/+QDr48hL9YZtWOdBysnZ6Sgp
	0zsRvkvJ8vtKU+roalXlRyq0fnpLzJkvSzKzYe9ACcsHCdruxEiX4wzG
X-Gm-Gg: ATEYQzyrwNcAzlLeSItE9MYoZuG4JBx1X0nStdUd/hx0JeFHiWsFa+3P2XF9zY6mVfF
	jW2lLQdKH3uq65xD3jLedSG3rwII8LXe/jrPyKOr+NC/qKtifvYNsqt9A7n2MJXzlmIef6n+ZaC
	CUiBpV2/DMzp+0dyl++28j+VDzhIQf/bH7Ul/vv6PM5A4YkCDZJpa3OLM8fNCKqVDSa2LEBzYkg
	UB4wDrgVDZTFX7F3/tUa0Jn6aZ9IVtLLNfTURp/HjbWfnG7cMVS/oFTF1PttsM2TxT7dqyvhNl+
	GMF8RJp8OqE2yfIU8o1oK3SNlmbNe9Ya4r5QsTGyh673IFLVKPa+zKxS28sIZvpHmYwKw0l9KTO
	ROfeC7AKhMKHbvPArp9VqCak7rxKlAt8WA3wFyh16rVBzWtDphLs/sfM0RkTixbyh+UsacbNRJn
	eOPYjqwAeyo1I5hU5NHo8jrdGfQ1GBJm+TJhw7
X-Received: by 2002:aa7:80ca:0:b0:82c:9f73:a2f with SMTP id d2e1a72fcca58-82c9f731b44mr395714b3a.40.1774612025791;
        Fri, 27 Mar 2026 04:47:05 -0700 (PDT)
Received: from padmashree.. ([2401:4900:62fa:f2a3:309a:44f:430e:edf0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d23841fsm6492169b3a.26.2026.03.27.04.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:47:05 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Padmashree S S <padmashreess2006@gmail.com>
Subject: [PATCH v2] dt-bindings: arm: marvell: Convert armada-380-mpcore-soc-ctrl to DT Schema
Date: Fri, 27 Mar 2026 17:16:53 +0530
Message-ID: <20260327114653.593582-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert armada-380-mpcore-soc-ctrl to DT schema

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
 .../marvell/armada-380-mpcore-soc-ctrl.txt    | 14 --------
 .../marvell/armada-380-mpcore-soc-ctrl.yaml   | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt b/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt
deleted file mode 100644
index 8781073029e9..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Marvell Armada 38x CA9 MPcore SoC Controller
-============================================
-
-Required properties:
-
-- compatible: Should be "marvell,armada-380-mpcore-soc-ctrl".
-
-- reg: should be the register base and length as documented in the
-  datasheet for the CA9 MPcore SoC Control registers
-
-mpcore-soc-ctrl@20d20 {
-	compatible = "marvell,armada-380-mpcore-soc-ctrl";
-	reg = <0x20d20 0x6c>;
-};
diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml
new file mode 100644
index 000000000000..a897d4ba4e32
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/marvell/armada-380-mpcore-soc-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 38x CA9 MPcore SoC Controller
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
+
+properties:
+  compatible:
+    const: marvell,armada-380-mpcore-soc-ctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    mpcore-soc-ctrl@20d20 {
+        compatible = "marvell,armada-380-mpcore-soc-ctrl";
+        reg = <0x20d20 0x6c>;
+    };
-- 
2.43.0


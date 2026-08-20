Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F67943F0B7
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228754; cv=none; b=mHRhXXm/HUDaR9TCUhQZLV00+E3SDEosuGLKcAO+HENDVznE+3CRHxc2tTBUiED+NnTtkTmTnzUEuszS+Zw3X82Fs3p2vQop3VwxvP/NTfWvTtHb67LELszlOM0c5kinGwOqTRlRaPvrNtPofGCtzORLAsWom+VbVcNfUGv0p+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228754; c=relaxed/simple;
	bh=tfTNd5tjFz9L3yETKktoI1guJcDo130AJeYFbFp3xqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDux4UbXM5K9UUWtSuQTb9nPsIkl34tX4Xrn/kNj/K934iF03AT+Ak+aSdWJQ6kvOofHXy4jdDNrSnxNeKsnJfMOIpP1VIG7GelQ9F8uJQ4y2fdrcsMYI9A35P7A7AknMmWZzDpX/vvqlQwcNe4RF6XYTbWYTYBmNZYpjofQXcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgVMhno2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgVMhno2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so1455941f8f.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228751; x=1787833551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=;
        b=ZgVMhno2QaNMwLTiXdlwRcP/jtOJCaZCd7Iq0fuJE4H6TWjFuU0hVw59yXw7Qdt4Kt
         S45NpwNWnJDNg3FSH4PLkpXXgDanX+lz4MGe58L4pb+heCVmNhYntVPgZvYGJFNMVWGK
         QTMweDWNVXOoTXzS2wXSN2wc9DJNVdZL0qNb1TRoQOzaoS74MjAPYwxrjYZPStCdpLp7
         0nJB3Djw+3YyGt5gszqeKZ2ucxWX4gsJzP9/Debv0W21kQ6f9fXSHeRdjyKxCBfHjhdL
         NCvBrrhEx4hAQ1QPrYn3xAAEXealQwY2WbcbSy/HUA+d7YRUgHonTls1LkOHxQxpLbL+
         4qHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228751; x=1787833551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=;
        b=bXE2dfXE2+QpGCjxQhrfhYcTzVqKi25eR+666qYcXuAhlZoOQil6YqGy6Z20Ry1rlu
         VLbSIy417va/Rh95WbEoCjZUct4djgyNLu//uJi6i7mtrGtpIEkN09M+UIldeHu8mg5D
         ZohiAmBhM0ffkPEtdWcZCICd3HUzEwzUD4jk2VPLZBj3obV8ZNwwjpQ7PPtPD+uINxWv
         cEWYX1i5BMhwYD25nBfNH/wB95FtaoAUak54Dhsb//yhOEtkxSSgy/KqX58aDWfOa+MV
         bOQ10EpzlRIMLKv4nPtHMHuJsO7IMMXs2JeHXnLb1nXOSKdQ8ZPb1IGfmFHM53GBKU6Z
         WiLw==
X-Forwarded-Encrypted: i=1; AHgh+RohuXFQp8mP4jzu/xQaMTEIhPAt9QpIy3QsM6G/bFCL61Z0Zf1VYtuLrnIylLAAuvqpU5nlxP69EKg4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Ic21vn+/gwAcyM1NE0RUFD6LQDz834wdzzdzrUGjH6WZr760
	A6sMt89ozqmtl/8563yVvF1HApJDtHdrn7e4/ocA0+746oEVHJ+jD6gk
X-Gm-Gg: AR+sD11AoxsLvG+xNM09Sh5dkv47HyEhnM6kUg+aonieDUBcnHwR6aI/CaROJp9/JIN
	ifPlQPBkGFxU23CUa2+rZeOZkBYyDDJ2/dbpMzTr9Amzh94QFkzXuVrZJpudA3a6Vk5Wn2HsRAj
	rXHl17eNm1O5bHHJn/Klny5Y9/MWuoMmzZJEpU+uFOnSvnPmq4+P2LnPsxJ5s+lOSXjIWbgO1na
	zt/bMosGo23JrRmz6Ky+MUICY4hKhCj30i7czBR2vUMow2G9Hhl5eL2GMTguJBNetc7s7EizJbz
	5cbg+4jI42ZPweqcdQh0/sFrBzxpkV8Yz2mXXJDqm6scRgNmKGuIxYBYvyDGCmwJXCORftCnXSN
	4mRKMao8YyapA8h1n/LNNcTFVcWK39Y/KAuhe24jIJUxazaLY+bqoxbb5KvbPsGLIIE7V7GVvUZ
	pyvKwJctkcWS+naPBMU0RR6mMWknhUAQ6510R7y+XAgwsOpIZegy094Q==
X-Received: by 2002:a05:600c:5288:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-499aa1ea46dmr243508505e9.13.1787228750345;
        Thu, 20 Aug 2026 05:25:50 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:25:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Thu, 20 Aug 2026 14:19:59 +0200
Message-ID: <20260820122242.120039-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..fd4b41bd3716 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -72,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +107,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +672,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392", "mediatek,mt6323";
+
+        interrupts-extended = <&pio 28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        keys {
+          compatible = "mediatek,mt6392-keys";
+
+          key-power {
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            linux,keycodes = <KEY_HOME>;
+            wakeup-source;
+          };
+        };
+
+        pinctrl {
+          compatible = "mediatek,mt6392-pinctrl";
+
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        regulators {
+          compatible = "mediatek,mt6392-regulator";
+
+          vproc {
+            regulator-allowed-modes = <0 1>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-always-on;
+            regulator-boot-on;
+          };
+
+          // ...
+
+          vadc18 {
+            regulator-allowed-modes = <0 2>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-boot-on;
+            regulator-always-on;
+          };
+
+          vefuse {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+          };
+        };
+
+        rtc {
+          compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+        };
+    };
-- 
2.43.0


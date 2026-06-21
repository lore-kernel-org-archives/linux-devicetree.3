Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A981E40D564
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782029830; cv=none; b=roOHFLOirJIxbZCMciGPQ9PN6wW/H3ynveEzJefSF6AO2r6rc2jyWMKVAT38D90tZkex7Wrs5ULbyePOxxaJkt0NspCqSWPaoislU5qe2G044Bv4xy5uB2cERaZjIzaxU3iAV4FrMMTgkfP6NLC3drnTex3/QuR9C6iBjNSySEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782029830; c=relaxed/simple;
	bh=sTYWyhrbRxDuU248Vbf8GOxIJr3Ex6NE3P/1VQewdNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRoBp4CFv0MLlD50Mh2WwEAt/o36iQghSQiGTS9cZLx1prVua5Z6KsCz7UinMP/G4rBx7zgHNfaIZ+DGHjBN8VMBxiGlrV7D32kbEw5ADao5JJj9nNkf4CdlTHEs5t4fve9hVKDtpWTCMGEOX/nH+BA1xfa9B+KXLpyRleOve0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSQkeJZG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSQkeJZG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1873499f8f.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 01:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782029827; x=1782634627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FtRNx41kTzSfvca25trEUrc2fj2TZslpJ/VXb0q1qg=;
        b=QSQkeJZGYd2PUVx6OhB0gS7PhoM/ID7JC+FWnjACDIs4qibPsqlpcT0CNI2JK/86u3
         rCTvsw4jvpON3qJUwZ+UGXpQ9or3l79yD23knsx6XVeUuahA0+Y2qBMG/1zo2wqzodju
         U/a2x3fHU7GrkwttrfLWXTsJAf9SWpaD1gaMVp1DjAgpkl6SIW4ZbIF+4XefZDgQCn21
         xAwydbrOmiB04KYVwbnXsEB3bXNVWqj7iiKRyV+jdcPIB6BgQXJ7FYfHGYLK4f0BX5At
         S3VPLOisDlu4knB820Xx7Pi/ecwsCZPUZdPWQ/NZoOWPBSC56nqpqHEuk9INBOImdmpk
         F0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782029827; x=1782634627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6FtRNx41kTzSfvca25trEUrc2fj2TZslpJ/VXb0q1qg=;
        b=G/zOCyZMoczucCNvdfo15scZTaOZoJgPJQGL9WZ1xaZgLkQLJNrc81tFF499kAuzxp
         CteQWLK8TShhrYHgHnaFJ5EjUoNFjqm5xRUeuP2NeFR+YeXh41fjgpbfk/5tlu9Q73Je
         xXti5wTl9ulEfUW/xnqGuu0uj8pt261jN82vjQxHcc+v9JVzLIV45qzSUQ10vTA4pSRK
         RfKL4DbbMy373Fnl3T+7drrpcO9XI9WToM5YigrsZzTMDl004Sckcw9o6rdJss7TWL+7
         UgEzPpFTMEHbjhpo1fCCYG2CohmYZiTDMUe2UE8tRlc5r5qF3SBAy2abB2k0eeCs3vjI
         cniA==
X-Forwarded-Encrypted: i=1; AFNElJ/qGf5IKem+6Swj0YKYn+F8NNv2Lds5j0mdnnURF1rke6TVdeKKHXx/rOHluZxbqh6TRKwypbEG3MmG@vger.kernel.org
X-Gm-Message-State: AOJu0YzvyYnGR/OeZc7xLguY4hyU42P4dddT0Hl+BFL6Wnks4RHKW7PM
	ZBHDd4FnRcD+Z0OoecFcXkVsGbsM+UMTxDQrjQOqqwMwtaoNY+gDremY
X-Gm-Gg: AfdE7cnkDtbzxa5hlcjWtijXaDkf2j077Ysb4JJiSKv9WRICNDsIpOi/cQrImNUPwph
	gg57nMwytYkWPCqEl6JxYoAGR9WVTxmPI2F2MKghSDcWzdfrChXZrKXhmUkiMEP+6UljbtQhzfU
	jv16tky3JqliK5aLs5A+YDfckRhrHD2ERgdyVfLuroXdEozsKAvBtPYbN4fbYj3D/+94z9m78Qy
	cmwuoRTf8YH2lopEjC29sgyazixBsB7yujd/JRQW60ZX9LgaTFzooZ6jqMy1enjGvxftjALvcxs
	sFexpWV4pWAtk0KhjX1e3NxJ7vntlfpuUv47hkwLL+t0ZrOhhwSf+BEQ1808IdT9nXdcEIIdH+V
	7b1n48x1/Ie+MCqKpOUPgTee9FXh9MEspiat0NMSZ5czNT2vrGaa6mhQdndR3Rqf+hFP8yQ1dcs
	F1FELjNw==
X-Received: by 2002:a05:600c:468c:b0:492:3c7e:57aa with SMTP id 5b1f17b1804b1-4923eeb494emr165616195e9.0.1782029826761;
        Sun, 21 Jun 2026 01:17:06 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm194100445e9.10.2026.06.21.01.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 01:17:05 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Sun, 21 Jun 2026 10:13:26 +0200
Message-ID: <20260621081634.467858-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
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


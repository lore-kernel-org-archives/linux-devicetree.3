Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037BC42D76E
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 20:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133391; cv=none; b=BqLMirVWckOKzDzRD3v9arvjIlU1wTT0PmgMPKpq9QAtTlXJZtIX6LYwBftHHvlj1KGGBfYdhoAmXoYV3QChus7CWmIs9xAq0/eCpylx+VR8zimM8TAh1zXHyE3YntHfgNHjzlPEvgA7YblSqUc+I34KRXeMy9w+/4Cnuyh3S1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133391; c=relaxed/simple;
	bh=cOTndiYvXLFAAAM2y9Xe4uyBomgWf+BKu0APrUCfPAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPtUeCvJ40aoOEdShFT0mqWm4XLW2FMpXoqFKhScQ2MqoDkB6C510DnDw8QVJiW3sY4vffb6hNprs9GkwD/9Z9+7GMl4oQFvVcmyBMVuF8qJ1fEX0fec6GsL7P/X+Avxmy7pYF9bpMQaWghBFiaC9PWDMLMf2IcSdGeEwg9or9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GG3GjxlW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GG3GjxlW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b966dd74so22693935e9.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 13:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133388; x=1786738188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=GG3GjxlWVTI2L3XnYlk8UKV9tLWBjKo9E/flvzzsUXgC40PDAaJjV+NtnJSStyejwy
         uXEAjwV2Hvpq4Fur8/Lbts7SwpAoorvrgWEOGzHWdzrMGPHeMIqLmJJwmzhZvzjbJl1t
         zxJuK/ZiUvQrHnvnqhxeI1DkW07kf7lDwe/FByvalo9FVYpf5aBF5g2SClOyN+46f0xi
         iKYi6x7BeC6gpF1ardRZFleOu8WN3Q9xfwt1hPkxjhxnfJZvZMu7w8iu5g9ZfDFNZoRN
         ExnwqfLRtnzUwxJ8ChSarK+R49a2fUz38aXlhfznz3WNYZlcANPfAtOgTV5Xg+LhWtVm
         aRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133388; x=1786738188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=R3AGF9ttbb4pFRb8qIk+QiPZ35+d/+5SHTqdW28zkgVd9o2WYvx7rhtPcp8HtlqfD6
         8bhsreiy/BsNGdpO9nCMVN7YzSZ7RX9+ATvLmvPVvmBKKFm7Fk4oGFoYgsnBBWBTrMNV
         SuU+5NsS1cfX4u76QGXwrS1ziPtu/0lmILvCxB1wUWrVl2VPUVTzlLa3zoSSvgbWhDZp
         ejh/16U/JpIHdyQxK4tHMlbN1hB48VGMFfAmiDWwS5b4drF5Dj9Yf/zH2L5ghJTiMfWZ
         HVBn539CChTxBt5LbcbGYSS27yeitjP99USobbpm0xpK+zbizNh+TAEbQkollTYM1yyP
         tKhw==
X-Forwarded-Encrypted: i=1; AHgh+RpKFAdpnAHjgFwMy+WhKuoOC6+QgvXKn14jgsQMJXnslTlPXiKUJOaYOe91qWFc/EZisvYKBirWVrFi@vger.kernel.org
X-Gm-Message-State: AOJu0YznDfXC0bHdzTKSengcaioEreNbJp/YBWQHTkrjhxybdOGm+1hZ
	5BwtVMV8PdVvxc8WQKJC7vrod2msSD41XkEMSoL0LTYVH8WwDlV+qDCz
X-Gm-Gg: AR+sD128k38Cm9eBs12H8pr7pyNalTE75+JA6IRaDF1ZrNyLOTJ9E1Y18gL9xmFNNh+
	BVy75DUODUS51wyAMq1dsyrjy5vMAtX/nlewH0PThdwxxzh0760jZ2iHbc+rswW95GfqOTXSAi/
	3CYo/WsOdX2vSZ5MH2g7wLEd4ng2vxtgDV9JWksvKLfjJgu3WCZNWcVvI2kDHwS5ARTQ76eeiky
	LY+buKi0Mb7DF9PrgJAiE/wlYMdXvgTGasuilP3wlyZ0Hjvk0GbE0mOGSmm/aH90IfReS7UGvuw
	VFlvTwKPL+6q5qZp3K+MVoDBicNFji0Cba78m0yCeSqsuN0tZlbo7tBg9C0oVvQA1HZCHz8XhLO
	HIcuvPr/fNgrUZRehnVeGo4Kd82jB3jLeA+sNjW1WSt8nIcPTATMXHR1+mZ+1Qul/VziFn3Ad/y
	jH8PyUr/oT4BBwxDzKPNBC1Fc4WSMIsMjkd1njWzDGstiPigJHAKifmyfjY+6z6y/+idmY0GMlr
	8M8gnP2AijUuKQ/TT69qJew1fzatnw39NoW2IEGeGQpaxql4mdnTQ==
X-Received: by 2002:a05:600c:1f8c:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4994e7a820dmr312951345e9.7.1786133388229;
        Fri, 07 Aug 2026 13:09:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Fri,  7 Aug 2026 22:09:32 +0200
Message-ID: <20260807200936.201827-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807200936.201827-1-ansuelsmth@gmail.com>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT schema for Airoha AN7581 Sound Card with the specific WM8960
i2c Codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..8886fbb6b43c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 sound card with WM8960 codec
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: airoha,an7581-wm8960-sound
+
+  platform:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "airoha,an7581-wm8960-sound";
+        model = "an7581-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
-- 
2.53.0


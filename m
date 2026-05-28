Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E27401497
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990540; cv=none; b=jqyF1xy15uXURUa12NQPT6YqF3gyoZXQ8Y0GwZ+lMFLCFkHyQFq1deV4wSqoQ9icXBs4FftxykIGnmPxdlZzx1OALZWEyRj8IWIprHPQF8NQBAIp2Eumjfu8M1ytMHIXtJT4R0QqZpkNPNIGNgOeLslic/RbWH+UPk9y1ewWDTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990540; c=relaxed/simple;
	bh=LAEiKGBFn6SOrB641iglxx49Xyy2dHZnkZlRr42e7gY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIJAAg7Ow7drl3LnNZ2e3SlOPf43Skto2sft3NpJ+CsD5Ni7dRKsNrZrgoF6rIjHM6y8u4Iweic9cJbZ+wD4eXYOOAh8LnvWVI/bzK7W+0w8o5CpRovPMV5tlVwY755cfmyZlvN2U036JO/n2t4zafxhzeQBc4Y74EAOSJ7NTCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tsr6V3C3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tsr6V3C3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso113963965e9.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990534; x=1780595334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qXnXLkY1CCgVaXoTscYWjlLp5qZd4EXN61dC6lHCH8=;
        b=Tsr6V3C3Rpn2GWJtsYDyKzKLxeUZmBhRsMHi4yhA2UoAao4/xAO8knYYh8eQyo6pS/
         7OD2ONLI2KVyrZV9aNZc1jOUOjxaq1eNy2mMLSTKtmXml8XbTdibGWL76VC6UTU7vuop
         ZCOniod7so1h1NvWbIrkwrxQCMuFjCevVzoLO8Xl3j5tz6XdmtCDpE7CoiyYiaWHsZOB
         hhF2OBT57yeLl5n29ERZOFaxwH1gn9zThB6mDU7tmPDkOVid4xYj6KZ+1nheQliknslN
         JZBvidqYSn6McEqrIgK0toYerc9V1aoXcOBKBdMAAoznBSkSxhOvWSroJ+NMEiJSuQ4A
         CqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990534; x=1780595334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qXnXLkY1CCgVaXoTscYWjlLp5qZd4EXN61dC6lHCH8=;
        b=TDfo+kj09fOjmR5h94w19u28ixUD5HGgerelLyAo2ipyDbSggrQp0GNCZ+8rWBaWrS
         EKtsL25xdtBBlfl200jUOZVwhfVqjJd9q641mwE4B/zwiGDYCd9yallhJGbO0kRJ2k1B
         vI/ojNysxZDEwopcjA7Z50ilcHOg6iBj1owBxoD8YYUmT5bQnJbxukuBP2a7LZhnLhVd
         40NLJ9U4C4CBFrMENyBrpO8f8ysDFrqc7OpdAPB83ZSKTPAT+mRhJG0ll9b/yMmYf07Y
         0FFZ3Xkyc/vDyGlcls0ra9Rouf6lKawTmDIqp0pK/Jla6TyXsmLpAvJJCtn3/4pKZ7i/
         Cwcg==
X-Forwarded-Encrypted: i=1; AFNElJ++TBR0U5fHrhnfNr/pofoUtnzTJ/UlMTVZOgNoWjU+1gHTckgD1uLPBJVhnPyTbjLTKVDIayq7TsGO@vger.kernel.org
X-Gm-Message-State: AOJu0YylZTYdF+Dxsi5xJn54stQbY8vQbKNT7ali2UiSrWfo2UqZuM67
	OyN/meIHDj27xcXMAFKN1S2QXUxTs737ZZLyS8lW5iqOSQ6ey9nwVVdE
X-Gm-Gg: Acq92OEcc78rPF5OEDHT9g0xhX1O4t+bahDjR6f5eybDI0IeQ2M9rnQe9H8B8ivju3R
	DcQKU4ZKbZiMoOAL8i38nxAelS4dxxuxI2oy7KqBqRRfKRCETX97GsHbZlBUDZ8RVtYe/HEdIFt
	78o2wCVHjBE7HCf4sP8Tj9ambBCIH1ReMTNKRQgOhLF048gq4BriQZe8xXDIuHzSutbduMuOR76
	1iQ4gP9tgSO+QjOosqmtp0Iy3meuNmHnV9Hg2HpBG2bI/Xpj2yYtVAPUASR6rgIFiFYi6OQBQzR
	6MaNGsjjIu59A30yEXNUQLIxt9mGMKtGwXV5HX4iwnZXUZMzkxfKfk7NbePY7BROlvAMXT0O512
	6KMdSjiMqnxnVsN2IKBzoAXzfjuCkXHW8gqMVo1XlzOl3rBA5/0FI5kliaiE/IAlHMMXtECLzdg
	oJwcSjwNkClpsqdjzmAu1UxXCQEXbQnyr2sC3xClhkMJoDzuOV0ehtraXP2Y3kc1N/0CpZJUf6X
	wFPTDs=
X-Received: by 2002:a05:600c:b99:b0:490:4ebc:b80a with SMTP id 5b1f17b1804b1-4904ebcbac7mr432758575e9.11.1779990533962;
        Thu, 28 May 2026 10:48:53 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:53 -0700 (PDT)
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Thu, 28 May 2026 19:48:30 +0200
Message-ID: <20260528174840.28644-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528174840.28644-1-ansuelsmth@gmail.com>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML schema for Airoha AN7581 AFE with the specific WM8960 i2c Codec.

This gives example on how to define and connect the AFE driver with the
WM9860 for full functionality.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..b637c294657f
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
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+    additionalProperties: false
+
+  codec:
+    type: object
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+    additionalProperties: false
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
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


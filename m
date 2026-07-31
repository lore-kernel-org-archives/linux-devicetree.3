Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB26236B900
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480226; cv=none; b=kjMVsGwDNxCokOkcD/Y0Prbl3EJF9Bu4NJfkUvVD4iI5pOEF4sxS1hgcgk0TrzamIntKOiW24Sn00cR9AfVNxEQNnrDCjxUhT8uptWBU4vN+QwtoGfcjG1hqKIwTsAxSgTNVbXJoTLnYG2HtqdCr7LmQtKNRuheNbli6QP0wQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480226; c=relaxed/simple;
	bh=nlK0PA7MW7EkEIL9JVw3V88axZ5KuKGuZx3UqZD1fBQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktR8tfUfHUSvXNPVLsGfddS6PLDUyGHGEaXCP+mo/eM4OHP8J3j2bc/fJMECE3kJPgMGHh8/ln7YTauHQjrYocUTng7HjRr0ZFyrSo2IHlAmUcNQEgneqhbhNMU9TH863TTmKx3LiqldKkx2M/vsDZRMgBALW+K4ZqTIS30Pod0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYpQAtIn; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYpQAtIn"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso337795f8f.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480223; x=1786085023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IgnUpwnV1t4cwN6jU5Y16Qf71IuC1i/l86Q5fHMRYQY=;
        b=DYpQAtIn1N6AmERS8cZaz7GWd/7KzSB1RHR4XxdhQ56Wso779yP7ni4Bd7DVgqqA7g
         U7nMi7XjFg7jcXanQb4JquVz/NU+8xXAYo4g77TyN9wsFA2QrftjweGcBJhybPrtaN2E
         I+bOVzR3jZs7e8YgBAM7mYx1ydbaoDFSq3mInPZNXrNKSmtwz+e2vo0h1ASINUTF9ZYm
         v4g9jVcH1M5/5a4WsWZN90iYPseGzkzYy/7LnRVN70iN6pZenp/IA1bP6KPXAHSsH+5U
         5LnFAGwrmLmE0fyB2Ly5CvEkyPthsnPS+lj+3cQ0avbEKqAf+G9eG/Av4Q6k72soJMLl
         F1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480223; x=1786085023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IgnUpwnV1t4cwN6jU5Y16Qf71IuC1i/l86Q5fHMRYQY=;
        b=PgX9JJOOJ++lI4/GyodHG3f1GsQbZcGnVXX5INxEoUGvaGXm19DrY1LE7JdyVtxm53
         pj0z/ZdrsI26vjwXOcbphxUjVxC/gpHA9Bu39DxNa4SNty7Cw8FN7vj61J3ULYqGfAV7
         q4843BPom2tc9Okcn8rVu6sOqMSaWiDdiZ4qTPZdfiGG5vVs4UiuQZ31bKyVwgcViUnB
         rN/UEJvlu7q7Y8jsyfmxHoGCHTQvucreBIUoCu4qI0HO67ebK7k1HtYch5NZaAYQ57Ms
         zKnfELfYL+6jiW3wvZM5wT4eTUhIYEyveMyrQvnCLMbBC8ME6ZtvLFoyD6ROVj5SakhC
         A+Tg==
X-Forwarded-Encrypted: i=1; AHgh+RqTsWDZcflmgSZbje86ITBcGCE57cHxAj6Fl8lowLubl3Jr+WFebYjYcVM2y4lRZnOxctiBoR1LHfRM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm8ex+9jdtuiQ8DHVN7SpMTjjmqOJL8rsCxQNorET1+qp8o4HY
	LqPkByrc+rn+AOl0uJPJRq6vtB1Gf8Yc5tgZtObQTAg89gd4QscUukJ+
X-Gm-Gg: AR+sD10chgIvhTBMn7ighHqhuXtSSel35trxXNRvHthDqJ7Wa8H+jKcWEqLxUy2BvrD
	J8RBgz6o1xGWel27l0h0n5VKdvFjPojjhAi0guVYqXGIm5NvUHU06Xx54pDg69DVrkpnqznjtVT
	ovorujc5f+OrOY/Gb7LgbArDAZuXo8lph5tETEAsN0uoD4eIJiaXeMp0x9RBLPt/iMV6/gRAIC3
	bGJcHA0JdnCiURRKBwbXMYldVIMy7ah5saO4IgxIXrhy1p5upVGqEPsUuBbCXq5X3TCHIl0phLU
	XIk9a0J48VVcSS1rLL48uHiqBg8kYN+5uPR9yyIXsWRXTePdOSI6Znsp0FJPFiAsrnE5KvRwdxt
	Yc4+ZFop8mJ3QXK5KILFv2Y083MEPPAkR3F3SxzvzetCcBXWUpfds61RIHAg2vhRSm3sUTdNSb/
	TYI0gRtfKHZkSiotef41xaP2VY+txL7saMpK0JAoJnPVggR+QYFHVDEloSnDHxn7kI7W0EtTa+o
	FvCCb1Pyl2z7ZAHBFvCDK4xDOI7NwxwQbGrp5FV681+8pX8CjKOTQ==
X-Received: by 2002:a5d:5f48:0:b0:47f:93d8:f4c6 with SMTP id ffacd0b85a97d-47fd2b716dbmr1962060f8f.59.1785480223099;
        Thu, 30 Jul 2026 23:43:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:42 -0700 (PDT)
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
Subject: [PATCH v4 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Fri, 31 Jul 2026 08:43:22 +0200
Message-ID: <20260731064326.2284228-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731064326.2284228-1-ansuelsmth@gmail.com>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT schema for Airoha AN7581 Sound Card with the specific WM8960 i2c Codec
and AFE as platform driver.

This gives example on how to define and connect the AFE driver with the
WM8960 for full functionality.

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


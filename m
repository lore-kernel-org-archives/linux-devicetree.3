Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6795F334688
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800543; cv=none; b=Y/J+4vJlc8cqD3zX4WjHQNiSKYNVijIgw1s6PB9NcDMr7OopN+XOm5p+GPPtpCvy0wxFmlnvqLcCz8tSTblmXVaADK2wvV2Zw4tijHFPAO1fKFHk08IFem2xovc35QdSBMNp9IPx2TpTu/x2F23ZVTRy0ibFKTKfkq+9mLeDnSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800543; c=relaxed/simple;
	bh=hWWgAhJK3jluW4debCIMFcuJaz0aQyv9VgWUStBlYcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kQR4ZN9cbcnd0NcXRnVYZFWFDaCPzSWCC7Z2aSzB7rMbyv74vgwl8jvyHVvI5mBORTO0huvbAn+/WOmjZLUVVBBhyZXdOHTBguev7QxhD7a0DEFfUOMqEL0beenNnN6MkbOY46Ina2adOZJIvH/Fu/OJGcXv/xPAb/aWuwAJclY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgUPUsc7; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgUPUsc7"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35c1a131946so1037613a91.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 22:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775800542; x=1776405342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZONTy3jkQF6vvheJ4A4geJ0E0xBe92xQL8/wb4o+I4=;
        b=fgUPUsc7J4Ag+P+fztHajhjMIM2MdY8fOcJNiaRDy9w9d/RZu8EGIM+IGaHClYgYWK
         UCtfdl/2zApBy5L67zo5Ax8eS2Timk32yiT3HsrdLiQa99Sy6f5a6v4wlwfuOB+XDeYj
         fTAGKLvTB6IUCLPBJNLFrENYHlvb8Nit30SRTsXyM7sfvgndoxB3SnPnYAXkQwiCquxl
         uY8PKrXFHp3+vSTrCBq6ja+4jFoK/BIUlWNaimxVZT+kbW67g/nsbQXQV0nqQPzNIs5U
         asWXRjCSwdCidPgXNnY3pmKmLvpWkOsIggKAOusJwBuUWgST0w+430ZSQn86vgsQXLKw
         f2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800542; x=1776405342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZONTy3jkQF6vvheJ4A4geJ0E0xBe92xQL8/wb4o+I4=;
        b=AqzriYLC5IeKDgEdUAkECVGnCM1hW1SiWJkmUh13MB3EScmEt2PWpul5/XJakAi7FN
         j6Pe0SBBVh2bh4cLKY5DAorL2g1oThaaq4KUAOZPpS974v30Ikjw6NM41l/BqBvdciu2
         TMX+wVo66PtwDhftD3vP30Kquvb9GiwHVMkDtvyv0rG6m93W0ayv7dDGMKUoq3bQ51y8
         ZUfPC80y5XHiMuN85xDyFu30PBo/YwsYo85fc+rBUmm+VPOzQdcY7ioYeqjGvJGpyCtn
         xOsUx/Aoz0x32n+5MV1H+PYieMyZJTBsBQl5h2gJy6vM/DUlebnidUtF0FF+aYCyx/u5
         y5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXRBAH7nsbW6gbuXgHMCVCg5eamZ2ZwzEO9qjfFMVrAldC4pcIbb5nhc+L2OamK4YhRes01VZMUWRgL@vger.kernel.org
X-Gm-Message-State: AOJu0YwN6hrz3ff1WJwv0lt9IA4KJZtHFXp9Lpyb0IyItrwJ2Qv0HXGT
	K+ACKgJjZrF1SMevUS/FWEOcg6VX1o3td6TyyWVdiMDnhrru3Zc+8gyZ
X-Gm-Gg: AeBDiesB/d4ftoI54e58Uw3Dd8E8bXrVL1AguP3gWAwRIR1MDDHASzA3r6jMSFtpylL
	HhWt3I8BWiwnz+AsVqL5uWj1AOerAJNrnbcxFZ4V7SnsUy18f7y/iyuP7BINdyTFdwkurlrzYLq
	9q4yUA/5/Pz6MOvYutoZE0jvoJ9nD5f81rbumLMOnwd+/yVKA0wR0GneVbl/+3UTYqjHyNsufE1
	376aWGpe6/pdrypZ0crIDWTAh+zgyl8U08jlm0c+ILHGTa0Bu6IUc3s8ddaPEx46Ey2Y4WM+8CE
	3IohjeaiIcVycpi0uKij92bpfLeKwhEFQYxgcuFcBCYXLqIl3QJ4pvMLNk25ma1+2xx5T126KWn
	biE+nTLp9RXRcX7M8xLtJwhnP2VkY8mdd3ZJsU93qHSu/W6LqdZD+SI10aDzaAkZcZypBy53BUH
	RVYbyShvLE1OzlpEFY19ZijH2K
X-Received: by 2002:a17:90b:52c8:b0:35b:a44f:b80 with SMTP id 98e67ed59e1d1-35e42fe6580mr1407691a91.1.1775800541645;
        Thu, 09 Apr 2026 22:55:41 -0700 (PDT)
Received: from localhost ([223.233.84.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e4131cfacsm1777318a91.10.2026.04.09.22.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 22:55:41 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anushka Badhe <anushkabadhe@gmail.com>
Subject: [PATCH v2] ASoC: dt-bindings: rockchip: convert rk3399-gru-sound to DT Schema
Date: Fri, 10 Apr 2026 11:25:32 +0530
Message-ID: <20260410055532.60868-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the rockchip,rk3399-gru-sound.txt DT binding to DT Schema
format.

Update rockchip,cpu from a single I2S controller phandle to a
phandle-array. Add an optional second entry for the SPDIF controller,
as seen in rk3399-gru.dtsi, required by boards with DisplayPort audio.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Changes in v2:
- Fix subject and body: "YAML Schema" -> "DT Schema"
- Fix title: "ROCKCHIP" -> "Rockchip"
- List items for rockchip,cpu with I2S and SPDIF descriptions
- List items for rockchip,codec
- Update descriptions for rockchip,cpu, rockchip,codec and
  dmic-wakeup-delay-ms

 .../sound/rockchip,rk3399-gru-sound.txt       | 22 -------
 .../sound/rockchip,rk3399-gru-sound.yaml      | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
deleted file mode 100644
index 72d3cf4c2606..000000000000
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-ROCKCHIP with MAX98357A/RT5514/DA7219 codecs on GRU boards
-
-Required properties:
-- compatible: "rockchip,rk3399-gru-sound"
-- rockchip,cpu: The phandle of the Rockchip I2S controller that's
-  connected to the codecs
-- rockchip,codec: The phandle of the audio codecs
-
-Optional properties:
-- dmic-wakeup-delay-ms : specify delay time (ms) for DMIC ready.
-  If this option is specified, which means it's required dmic need
-  delay for DMIC to ready so that rt5514 can avoid recording before
-  DMIC send valid data
-
-Example:
-
-sound {
-	compatible = "rockchip,rk3399-gru-sound";
-	rockchip,cpu = <&i2s0>;
-	rockchip,codec = <&max98357a &rt5514 &da7219>;
-	dmic-wakeup-delay-ms = <20>;
-};
diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml
new file mode 100644
index 000000000000..e9d13695cc77
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rk3399-gru-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip with MAX98357A/RT5514/DA7219 codecs on GRU boards
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3399-gru-sound
+
+  rockchip,cpu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandles to the Rockchip CPU DAI controllers connected to codecs
+    minItems: 1
+    items:
+      - items:
+          - description: Phandle to the Rockchip I2S controllers
+      - items:
+          - description: |
+              Phandle to the Rockchip SPDIF controller. Required when a
+              DisplayPort audio codec is referenced in rockchip,codec
+
+  rockchip,codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The phandles of the audio codecs connected to the Rockchip CPU DAI
+      controllers
+    minItems: 1
+    maxItems: 6
+    items:
+      maxItems: 1
+
+  dmic-wakeup-delay-ms:
+    description: |
+      specify delay time (ms) for DMIC ready.
+      If this option is specified, a delay is required for DMIC to get ready
+      so that rt5514 can avoid recording before DMIC sends valid data
+
+required:
+  - compatible
+  - rockchip,cpu
+  - rockchip,codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "rockchip,rk3399-gru-sound";
+      rockchip,cpu = <&i2s0 &spdif>;
+      rockchip,codec = <&max98357a &rt5514 &da7219 &cdn_dp>;
+      dmic-wakeup-delay-ms = <20>;
+    };
+
-- 
2.43.0


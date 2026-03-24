Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9133F40DFA7
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360526; cv=none; b=eXGYX+xVtOCdP3E7YUrOBXhc9OSRUf6v3fUNP1BIfAkHR9prltcm/XnkXnvPx4Goj/7My9uhml5yZbqCqhLPt/tReIfNvb99DIAhiNDqZdIvlyzuirm8arvwafMDeqrBL6a4uC/kGD4moLHF71TX+6VvXE4HJuSS5J2xbFfSbOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360526; c=relaxed/simple;
	bh=JF+hD7uCs0un0E/9brqmLAixz5oU4oCoZbqipq3PBp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ElQpQH25lPh9dXz+tvvwzkFTbvnsuSIlyabo8yv1oeHWmq8NCb9n/N6OOBxKCOQEFGOizscjrZqsl+v9cf2tMjOmWvq5ImZxJqYPzrNpBm7Mavyj5x1EZVLt8Ifk/1YD4oYBFgKIvThG10c1fxndUvamDQecgweNRxj1wlpF4+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwpmAy4l; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwpmAy4l"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56ce15c6898so1224996e0c.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360525; x=1774965325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5nh37Pt3GbzjBTjgr+edrZlsjGKmow/H+jwHdw9iYPc=;
        b=HwpmAy4lhlxxi5tsNZSHSxMAgG7S6w2bkrci8tErrzeDmyks7UEHdr1Q3ggKMhC565
         JvGwDPYyDjk/gwj3ZpO4eZEZY+vNJngRfCQ1Y8hJy94jXxUVlwGhV1F9y2jQ/aGwgm5s
         LVCnN5umKU+90N8KsQCzl7VWWXmiWUJYwrynd5upN91ArVSYAzUZ8xnrGiLMhWOQqGsm
         sLnK3B4h54iGiDjob/jX49GZcfPnrRPgx2nCPRe2KAmwYZ41xpLBwZdHf/y1dtqEmlpo
         elyb5VPSo3dx3464pmN+u8xBlkZD2xI279UMSOVuR+DREt50iu37kBgSYLpGhvYRU1ab
         vnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360525; x=1774965325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nh37Pt3GbzjBTjgr+edrZlsjGKmow/H+jwHdw9iYPc=;
        b=Z6jH2RBnMJqCKQeI8IzQprKZhYrTnbDP6npecLPe3gIfG1dDw/fOgVjtmtgq/+S/px
         nuzWYP30RXKNtkSG8RFHFo1LMfYUVb0Otwqs38itCVkpfzp8JL9eUOR2j4mQLVCdf/bJ
         kCvRLPmz4RMbPiniUcm3VLhfNoDjQv5ofq1CfLib4ZzfY9EsvZXgLBXxLNT8XTzUDiWa
         8/1hHKRHXrzk0bXkDEPCX3eMEbgPsOpHFhP5BMgidG1OylsocqqfVG7In3B3LXlkJAtw
         DD3NXqSKXyL1baE4NIh2QTWp+2Qn+XPo2YgJOObCe8f0v5f8iCZ3suEPOip923nrM3I9
         hbkw==
X-Forwarded-Encrypted: i=1; AJvYcCWOMQIObZZROcMF211/jT1KzyU3Lml8uf2dYm6GnuATfly0E6dkRtoOPbkmTPULNwa62kqKrYlPrN1v@vger.kernel.org
X-Gm-Message-State: AOJu0YzZVHUOWU9FJzZAh0e/QFGJn3MkyU8stqMPhRlVKZxv7P+aAr7G
	ppggvziP5dcEcttAtv0N7A4E0e2sfY4qNSQNmEcYIO2p8s3O+jpQlKT7pnwjpQ==
X-Gm-Gg: ATEYQzy1aaizxkMZHusdDD/jnI0Ij3xuHQHeWWAk8YzIQU+Nc5KdJUGKMtWxDQfD/3d
	E36mWDzC1l6mw1x9bfxKmSvp+Kfisgj0emxlsnEcVi/O9JSclChRW9DvRDG0bF6SZB7pHO3wOvA
	DvK+yXQpXXPk3k9VpFv5MBj3GQquRbPmLgHAj5FVe4M/NMrGFyAIg95xF8LiXEfyrWL/o0wJSZS
	RLTlrYuoATyqWFwQEyoCfMAcIrvPMesEpcnlW83hFxf9iVMagv2qOYurqrlMtxYPE2DnErDYjOV
	y57922cURi+hcIx5h3LER3Nxrfs5j+VezfhHr8jLl0BvV0+s+nOHjY+6D00kzx9CNIPMFmaAgSb
	SwGTCvQ50NVgHraPEKqInIi2WVMVsDOWI4yQWYmuRVceTidqqKhwQpT+TUcsqa5THKciQDjXREd
	Y1kcB731bbgv0ejsh7+NKPCxTlr1IDFc/EPlErIZxvgobzdwDkO7oJ13akFYmiLQLkC6e41A==
X-Received: by 2002:a05:6122:3a0e:b0:56c:da22:6921 with SMTP id 71dfb90a1353d-56cde35a597mr7936243e0c.5.1774360524552;
        Tue, 24 Mar 2026 06:55:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:91c4:cdb6:8a02:47ca:2dca])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddc7f882sm15529418e0c.9.2026.03.24.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:55:23 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: rockchip: Convert rockchip-max98090.txt to yaml
Date: Tue, 24 Mar 2026 10:55:08 -0300
Message-ID: <20260324135508.839142-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert rockchip-max98090.txt to yaml to allow dt-schema validation.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../rockchip,rockchip-audio-max98090.yaml     | 59 +++++++++++++++++++
 .../bindings/sound/rockchip-max98090.txt      | 42 -------------
 2 files changed, 59 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip-max98090.txt

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml b/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml
new file mode 100644
index 000000000000..5630652aa4c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rockchip-audio-max98090.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip audio complex with MAX98090 codec
+
+maintainers:
+  - Fabio Estevam <festevam@gmail.com>
+
+properties:
+  compatible:
+    const: rockchip,rockchip-audio-max98090
+
+  rockchip,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  rockchip,i2s-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Rockchip I2S controller.
+
+  rockchip,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the MAX98090 audio codec.
+
+  rockchip,headset-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the external chip for jack detection.
+
+  rockchip,hdmi-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the HDMI device for HDMI codec.
+
+required:
+  - compatible
+  - rockchip,model
+  - rockchip,i2s-controller
+
+allOf:
+  - if:
+      required:
+        - rockchip,audio-codec
+    then:
+      required:
+        - rockchip,headset-codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "rockchip,rockchip-audio-max98090";
+        rockchip,model = "ROCKCHIP-I2S";
+        rockchip,i2s-controller = <&i2s>;
+        rockchip,audio-codec = <&max98090>;
+        rockchip,headset-codec = <&headsetcodec>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
deleted file mode 100644
index e9c58b204399..000000000000
--- a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-ROCKCHIP with MAX98090 CODEC
-
-Required properties:
-- compatible: "rockchip,rockchip-audio-max98090"
-- rockchip,model: The user-visible name of this sound complex
-- rockchip,i2s-controller: The phandle of the Rockchip I2S controller that's
-  connected to the CODEC
-
-Optional properties:
-- rockchip,audio-codec: The phandle of the MAX98090 audio codec.
-- rockchip,headset-codec: The phandle of Ext chip for jack detection. This is
-                          required if there is rockchip,audio-codec.
-- rockchip,hdmi-codec: The phandle of HDMI device for HDMI codec.
-
-Example:
-
-/* For max98090-only board. */
-sound {
-	compatible = "rockchip,rockchip-audio-max98090";
-	rockchip,model = "ROCKCHIP-I2S";
-	rockchip,i2s-controller = <&i2s>;
-	rockchip,audio-codec = <&max98090>;
-	rockchip,headset-codec = <&headsetcodec>;
-};
-
-/* For HDMI-only board. */
-sound {
-	compatible = "rockchip,rockchip-audio-max98090";
-	rockchip,model = "ROCKCHIP-I2S";
-	rockchip,i2s-controller = <&i2s>;
-	rockchip,hdmi-codec = <&hdmi>;
-};
-
-/* For max98090 plus HDMI board. */
-sound {
-	compatible = "rockchip,rockchip-audio-max98090";
-	rockchip,model = "ROCKCHIP-I2S";
-	rockchip,i2s-controller = <&i2s>;
-	rockchip,audio-codec = <&max98090>;
-	rockchip,headset-codec = <&headsetcodec>;
-	rockchip,hdmi-codec = <&hdmi>;
-};
-- 
2.43.0


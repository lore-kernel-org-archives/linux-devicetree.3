Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E058B28B4FA
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 21:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777064623; cv=none; b=ghyg47s2MLhtUDsVJpMuyXVt6cPiRl1vpeZwLSeoNhxwDmJ9KXhK5iOIeSBjf91Y3y9+yzpxz1S0fD3RzJ03khSsUYWHd2VbZAgWMTxjHaL0bxrbMz/ESbjFcsSy3WekUj+4sihuc+OEKQ0UJo/I50MmO6ZkbQSznepcCFra5FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777064623; c=relaxed/simple;
	bh=I+fRfGmkPvPGaNpKDlxAfO1n69/Mhn9SKg60oFSvpVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o+9GuuIa/WppEpWuLfBDwvIjgEv8ZC88dLrSheCjWE0XY5559t2YLGNn/ejylZhj4waw9ptbJX0JAJKexHpJWe068pdaEQ+NAmFPMtjRjdER/v0nvHs2YEfv+6WQpbRGKhia4+Brojyylk4rk8gdlaKWvMBiFg08rsz+WFqnF8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oojix8Sb; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oojix8Sb"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c76b994f7a8so3307599a12.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 14:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777064621; x=1777669421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUvVods0MbRhBVxLXtfEtW5oc137WtgLFEVTq/ba2PY=;
        b=oojix8Sb92Cf0KCBHn4uUwenGtOknsq07fxHS7Z6MluR0PiahVudD+n3rn+432MMBg
         uY10qKBtdDadKTHY7w51eRU0s6KJrDgT5r6bovLWlfJpiUuysSFWkjyuNripXDZr0+Mx
         INC4xA/U+rF+MHNNYpEpfa5aM4qf70jEJQCepBtZPxRDIjOZi+BR23v+6Co/rw09DOuE
         rx5biBcSEJbaRqa/KCkkOKf4+8Z9YP42rcvebk+fcSkPQ0SAslQ/VBSzXtsCIHjSrpxa
         rd0G4Zheylb+M/ZWmpAiVEG9/uvVHnKR7RAPqBlGhXvyYg5BVkl1uZHKbdseaE51AmMK
         IrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064621; x=1777669421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUvVods0MbRhBVxLXtfEtW5oc137WtgLFEVTq/ba2PY=;
        b=M2Y8xs9bywR71VbwE3uOe2GD3v4GInWl7wXqMka3TQ++W7eBCYSoK9oXE7Xtxb3ivk
         eXfI1yR9IEJMRPEBl7q5Ogg+RCu6UROFsOC+OiK2t6Ra4vdObfrHkVnrIi/dmnIFz8qm
         b3c9e1Oi6RnZGasw6ug4Bd9SIH19Ls9N4S+RHGrdneNn1fJ/8WdVGPeu/Yp07dF44w56
         Wtf5yv7sB8mWSgieIILdUDlyNejg1NNKJYv/jzxZOa7MDa2+n6I6g/6aoDfBI2nIxzPw
         3k85ca0jd2akd2fthUahwbjRiUghgadql7kkAffK7iZhr8RJOM6NtS8xF1Qobi2tWxMM
         BYfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hlEXEZc+b0wlH+Z29eXhAg4ATXSuZ/pVPC378P2rY8bf2M2CH//Wn5EM61t36fDP13qTQbweSdUH3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5q2VeHEvdUEfPSDl3XHbUIZgmbm39tT617o66jkS3vWlBrsoV
	upkcRE9puDrk3KpeH8HKyIHxpLY0nLenhkrMnLGjdI8omv3hPgBJ3JVO
X-Gm-Gg: AeBDieu9TkwtBo6XrCrZK94qfkU+oL35S5Zt3GEIfZwRSAHpRIzkY/qsStwFhvNJyaI
	WDVhhwnwyqKJ5L6mowoJoOTK/9sFIn//IuZEglrMEGQO0jVtyTJXkel1qeN0T4Qcv9Nx9ZO+U57
	FjVlcNkslYEeWdApSYwFfxbPECN9s99IKfjMU0c26YzrKhpOdPp2y6DXSwyldxIHBLtbl9emPc+
	YK7WN4sveMfvDg6UxS5EAF9gjMtqNAcTpEv2xOH+ZRuuIIULBbPgnhoDw2qsqKP8stVf+L/eEQe
	zj6Gk8OfCKzCv7anOmHqVe2TfPVDVrtFlAOziSYJDQrsD9Y4kR+b7ftt4lz/Xk7I7pMRJSt4oP0
	KbRwP4E4M8mUNGKYKGpQMfDFvBwPa2tS2+ruAdNU+s9IDpO1dMDBc2QmCAzr0B/ZhkxesJ6wiWb
	jgEN2wu8W5Vtg7RrBx4OYZBfq/qJA8M2OMQaaurAgysgR5oPE3sMniSK/QNpZuO/8zQImBCNl0d
	YITkA==
X-Received: by 2002:a17:902:aa06:b0:2b4:6664:97d4 with SMTP id d9443c01a7336-2b5f9f83295mr238594565ad.24.1777064621178;
        Fri, 24 Apr 2026 14:03:41 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0db13sm250554025ad.53.2026.04.24.14.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 14:03:40 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kaichieh.chuang@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	manishbaing2789@gmail.com
Subject: [PATCH] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
Date: Fri, 24 Apr 2026 21:03:02 +0000
Message-ID: <20260424210302.39972-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert MediaTek MT6351 Audio CODEC bindings from text format to
YAML schema to enable dtbs_check validation.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 .../bindings/sound/mediatek,mt6351-sound.yaml | 32 +++++++++++++++++++
 .../devicetree/bindings/sound/mt6351.txt      | 16 ----------
 2 files changed, 32 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6351.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
new file mode 100644
index 000000000000..f9fab8962325
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt6351-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6351 Audio CODEC
+
+maintainers:
+  - KaiChieh Chuang <kaichieh.chuang@mediatek.com>
+
+description:
+  MT6351 Audio CODEC is a part of the MediaTek MT6351 PMIC.
+  It communicates with the SoC through the MediaTek PMIC wrapper(pwrap).
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6351-sound
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+       compatible = "mediatek,mt6351-sound";
+    };
diff --git a/Documentation/devicetree/bindings/sound/mt6351.txt b/Documentation/devicetree/bindings/sound/mt6351.txt
deleted file mode 100644
index 7fb2cb99245e..000000000000
--- a/Documentation/devicetree/bindings/sound/mt6351.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Mediatek MT6351 Audio Codec
-
-The communication between MT6351 and SoC is through Mediatek PMIC wrapper.
-For more detail, please visit Mediatek PMIC wrapper documentation.
-
-Must be a child node of PMIC wrapper.
-
-Required properties:
-
-- compatible : "mediatek,mt6351-sound".
-
-Example:
-
-mt6351_snd {
-	compatible = "mediatek,mt6351-sound";
-};
-- 
2.43.0


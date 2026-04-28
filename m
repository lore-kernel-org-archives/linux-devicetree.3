Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EA43AE709
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 17:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396622; cv=none; b=Z+2lsCiFRO4aaJrIcJ78BnosgdYwvkTbJJvestcn220t7t7NMRUnJnx/ZHOP5Mv6XeFMPgQxJPLJtk7yK62DOMfAzKujsKehUzxli1v4meCBWEvnffH2hHsRASJP+FvpYYOQC5YKUJ4CltVhNyzQFRyONl97OfvBjLZaHOOw0O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396622; c=relaxed/simple;
	bh=p41M+koMx91lPJmBjuCWC+58XSTPcrB9gBbog3CHX6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaSsBt3Te0tZz8Sok+FMEIlAkBqbyblVSbyUCCA+jrC7J3gGYO/2XfhPjgw9mZ8vPg+qvH/k+mNK9VxBrHab12L06syGVppi2NwS51zeqJ/nwUR7kd+gBGH3jB8KeCzyR+ArId0SvhXYDOYk94HQzViWPZxHYNfm3v1pwZB6JZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0TlOuqL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0TlOuqL"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso33480b3a.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 10:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777396619; x=1778001419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QVnrg5T5fwP5chnWeWOK6cyXsKrSBxIvGHnvHH3/V4=;
        b=B0TlOuqLH3gPl5Yf7ejA6MZshJroZrueDVOqBl/yGEv5Rerlc5IdovfUuA94/HcRIQ
         zBJfWsqfkQ7HJgZNVHY7Fw16IF7OfOE1IJUnnimYGsZnM/z/fr+O1Nq3sX6nzetH75aH
         Z0Z9j0CmipBVSwmyhx+OdDIMJwiyqNnXdcPsgOeHFgtszKNhgHdgSidkcSOfqNAdfU5t
         5nnNBLG8fl3Vn2RAMrLcN51ri7ihXm+wxKuJz2jtsncmYhwQBY0gjwELHJ5FURnZc53O
         3uQEX5+KozoygMMtGpLdGngoINLlR5juU7ABt3XHCGM9vwaqEm/ftYoZN4S8H8V5T9Y7
         wLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396619; x=1778001419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QVnrg5T5fwP5chnWeWOK6cyXsKrSBxIvGHnvHH3/V4=;
        b=s7D2B68mo0yZ7PpDJX/yb6xJZlzVkkjmdIh3x8roqr/UBUF60RKDOvKBDgmW1RN66/
         46Zpx5hqq2ZmhSgnBQeHSe/GvuV1HTFMtSJTvgPOuSal8cDAZUD6COTvGGnlk4P3MfmP
         EZNvA1mdAjY4dLlQLIMwYm7FiPwNbZBrLzbEeF87nU1to129FFRqOjSbEAFhS5A8KZ8h
         vMdrZkr3uxI6IqCGYlN8YYS7icsavN8oNxPGPHFZAqJJgKZaVnMoZz1N1yRbArsfWOOC
         lk/9iLonMoX0cBCAT8mXA9+wIrPyYp7Puo3JLQH2soRYwXCuGPjObDNGKTZhKc6Tx7Nn
         MAIw==
X-Forwarded-Encrypted: i=1; AFNElJ82rfjZnZ5fncYwPRJ0Pfx5lHUYm3GI0ICyhkoc1Dohx1aQ9f4Pb1kSlmosnqJLyoCFL4n6qUxCDBOh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9f+50h1JzlMoD+Zk27YadXQ5ZGqDnn8iErbq2eHTPE2Betsh7
	EeTk7WoV143bbLtherzBIigQ1vWpa5mPdR+EsiyCwHjk/NjLtwniDxep
X-Gm-Gg: AeBDiesv1/HNVMGHMIZh8xNp436lORuxdyF49mqg2zn5pyF2IrBkh8VOxXYstB4ED30
	/wCrdtwqo8ybjCB0hzxlYNH5mwupfmrPTZluqTJ7B7kx2X8ltipBwZi2ft4aXdFNec1najwhndy
	CS0lwvs6QLbbLmaEDkEdlptCGLpGqKb4lMWgll2npDUCXIXWladBRarechWV0+lNGCfZYvbJrrC
	p6zBrn9C8u7jawt1xnt8Ok86chQz1+9NG/DYt4LBYJdAcXR0+SvBuNVUwN8QXnswZPUJC41l/62
	QHYRzi6OxHOUJx/E6SjLX4uJB21m13Prvh18CbZpXf6s9oWFjKCbZD5uOk5dL7zDgDAaT4YLleN
	iKLZIOFx0P1lZB0ml7ZH8mqij2pTnNDC2fd95pNrcJb0OOJN+A/75510aiRE9jnwIP6NY238hrz
	MMxkDi7QcCQzyEZtZrnC96tN7e+NYs4qIPyyGNXEOvApGjB3bWhijUTq2I8YHsLWIoGPMyPAnmi
	QZhlg==
X-Received: by 2002:a05:6a00:4fcf:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-834dcb99cafmr3645484b3a.13.1777396618489;
        Tue, 28 Apr 2026 10:16:58 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae2226bsm3370743b3a.18.2026.04.28.10.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:16:57 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kaichieh.chuang@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	manishbaing2789@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
Date: Tue, 28 Apr 2026 17:16:44 +0000
Message-ID: <20260428171644.5703-1-manishbaing2789@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
  - Switch to unevaluatedProperties.
  - Add missing #sound-dai-cells to properties and required list.
  - Update example to include #sound-dai-cells.

 .../bindings/sound/mediatek,mt6351-sound.yaml | 37 +++++++++++++++++++
 .../devicetree/bindings/sound/mt6351.txt      | 16 --------
 2 files changed, 37 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6351.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
new file mode 100644
index 000000000000..b422e238b512
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
@@ -0,0 +1,37 @@
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
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+       compatible = "mediatek,mt6351-sound";
+       #sound-dai-cells = <0>;
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


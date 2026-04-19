Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED843BB4A
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776628786; cv=none; b=J9uilcuBZtLbR980a4JndUKIfK7xz2QHNOBFjLuT7rxLuSGJPpEajuvJK+n4WOyox7Q+gE/TfhWXMlfxONNgTjKVqXJiyR3T04dyTn+nbEhcWxvihk4uISeb7xZ5vagTV8ymegCbpJGL7tNPnGZtQbS1XakAnI+zEj+Evj2eh9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776628786; c=relaxed/simple;
	bh=0IIRG5T27Wem/201GoInqF2HkOGHY2wsZ6iq/ivbe2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YCrtDN3E1/cKW2cLf0HNQvISm0afqPwNTdQIogObyB5BVx90smPL437jafS1QROYEs6Mqt0NbjJ0wYSFKA+jQrB/Fl/q19lVTll9cSi/3l5RQhMbI1akg5YSfUs/uZkVclLx4fbClpMk7+L4Aqrf6GqKEdwkJbGcHMWtjTODmkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecKpsHCI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecKpsHCI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso20277365e9.3
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 12:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776628783; x=1777233583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMdfheKYOJbEdDStgLEN2s9V6kR2BVq7VzWgg5gv0xY=;
        b=ecKpsHCIySZFrMb7XoIq3kQ20SkKb5bCcibI+oQdcYUTyf6ESkKVBVH1wOI4/MOt48
         GFmF3N15KfvHYU2Ijng9us0hPEyVhPqJaoyx/MnfpKMOT9hYXNMsfX0y+HoQeSwfMVoq
         ZeJdD8yZDlLi3edcjeBpQPI2c74IhYLN/79c2PK4Tk5P+ab3Nhj6CurslQeyZzjnC5QF
         zHptemZGrf7WLoQ7CZmEfY3CDgZ1KtonehdhkOuh+tQ17lRCjFcSmFrn9wGyXxMrCCsw
         1qyKDLzVs4t8K8Dvln2xI9lHTtCm1j506Gqc84tBDppk7i5EXrPjm/ncY7p984ux0nlT
         Ndew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776628783; x=1777233583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vMdfheKYOJbEdDStgLEN2s9V6kR2BVq7VzWgg5gv0xY=;
        b=o+YPTuXHuAiKvIxv5TnT1l1PDVcJrHwv86c83pQVkbi981FfCalyXnzn1SNYzm45EI
         M3w4hZvptE+immACpRWWiKyscXmTzGSBL5LcLbua/s//w6W2kDf3EnYgFMTf3WWv7mM4
         HND+Fgvy//t2tL3yYPp89WR7t5VRyCUnOhGIfS9VIAcwXFlpQJxXbP+mbCKF+A/vuRjc
         edYNJ8gnEmOdKab+MeC+sLiHASO9fzIf7yQXEFJfMdSAqhmB5H7kxg7hClO5R655iW3K
         xoCpBASSlFrN8eAYRILZUFPKckhRzhwtTwBiL1BEaR1vGQ2nlUcTLzeFalfgUxBYIPDj
         chEg==
X-Forwarded-Encrypted: i=1; AFNElJ/gTrZMLoTvEgP6596BXfHEPLrx/965cPnr23/qdYqKT2V4RdfO6gbUGTD+3BdZAqAbpsCKPH0ndWb4@vger.kernel.org
X-Gm-Message-State: AOJu0YyuLVdvC37ihD4d6CU5BDJgkSTqDj5TJLXxq2ViRXIlqt8fmiY9
	3h8Zs25r3Ona/9QPw3BRIMJidrlZ5Vh4s9dII6BRcN3oeivMxMbMV1hY
X-Gm-Gg: AeBDiesGgoUDrbp+Vvx1DUb925q50mXxNU5UMEdc476HQ0L3zjeawMiASjVhqA6imDy
	FzdqZpaTVprM5FZivW4FJkZ2iaZuml3IJfZ9FH4NnecLYmrZMZYrb2hP02lqnsfm34a7ij0Zjss
	64mbrHq4rWwMxJx9s+gb7ETPp/dNKGvFUgVTuu30EKn+U4VZfU4T9vTyiHKyA8eoPEmGRYIb0T2
	gksjN4jq6d+9bPi3eMVB81x/3zGmlD8W+u57t4iExhy9Hpc2XTVvIy6C44XKGuPHRa/2xAYYmTA
	Wo0aA5l4Uw4WDiJEC1K7c0F5lng5583gIN7HjvxpyEefFa4aNzGCVrPIUBu6HAjjqHT+1ZWE2wo
	lw3nYNOWxhYgNqNe0PK8JB0gbHH9bFII90JtkzhuE3stinJbpellmo6Zv/yoUeSKeDPFDdLHqtn
	5r9CPGhBPn
X-Received: by 2002:a05:600c:3110:b0:487:243f:dc3e with SMTP id 5b1f17b1804b1-488fb739cf6mr161290185e9.6.1776628783444;
        Sun, 19 Apr 2026 12:59:43 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::d908])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46471sm22482179f8f.28.2026.04.19.12.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 12:59:43 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: wbg@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	linux-kernel@vger.kernel.org,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: counter: add gpio-quadrature-encoder binding
Date: Sun, 19 Apr 2026 21:59:06 +0200
Message-ID: <20260419195908.12202-2-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260419195908.12202-1-wafgo01@gmail.com>
References: <20260419195908.12202-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding documentation for the GPIO-based quadrature
encoder counter driver. The driver reads A/B quadrature signals and
an optional index pulse via edge-triggered GPIO interrupts, supporting
X1, X2, X4 quadrature decoding and pulse-direction mode.

This is useful on SoCs that lack a dedicated hardware quadrature
decoder or where the encoder is wired to generic GPIO pins.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 .../counter/gpio-quadrature-encoder.yaml      | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml

diff --git a/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml b/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
new file mode 100644
index 000000000..741396b29
--- /dev/null
+++ b/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/counter/gpio-quadrature-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO-based Quadrature Encoder
+
+maintainers:
+  - Wadim Mueller <wadim.mueller@cmblu.de>
+
+description: |
+  A generic GPIO-based quadrature encoder counter.  Reads A/B quadrature
+  signals and an optional index pulse via edge-triggered GPIO interrupts.
+  Supports X1, X2, X4 quadrature decoding and pulse-direction mode.
+
+  This is useful on SoCs that lack a dedicated hardware quadrature
+  decoder (eQEP, QEI, etc.) or where the encoder is wired to generic
+  GPIO pins rather than to a dedicated peripheral.
+
+properties:
+  compatible:
+    const: gpio-quadrature-encoder
+
+  encoder-a-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the encoder's A (phase A) output.
+
+  encoder-b-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the encoder's B (phase B) output.
+
+  encoder-index-gpios:
+    maxItems: 1
+    description:
+      Optional GPIO connected to the encoder's index (Z) output.
+      The index signal pulses once per revolution and can be used
+      as a reference point for absolute position tracking.
+
+required:
+  - compatible
+  - encoder-a-gpios
+  - encoder-b-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    quadrature-encoder {
+        compatible = "gpio-quadrature-encoder";
+        encoder-a-gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
+        encoder-b-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+        encoder-index-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+    };
+
+...
-- 
2.52.0


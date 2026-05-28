Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3EF3FB060
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 17:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990535; cv=none; b=E2/KcZxZ6NYNkxSNI9g+25vTy3PNyrMpEvK74fpJcgMftvDzKny0r/F1HacbIs+3L4Pjq24UoKd3uRemt3UtuVU+5kCHRfZpOWgUIMGtkX0Fb9NvSuWcrwvgJ8rN6icqjRhib3zvZsYNUL/zjDsZorSL8bKENkI++psQC9s8vn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990535; c=relaxed/simple;
	bh=YI4vRVfoyG++FhywIajci3sPlgdT2C+SUKhn0kUxzt4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkUfSkoEyeQUvczBSu/Ym5l5QKXhwsvJLVzXDKc1t6WyxaqprBYapv3E6X06fJA0V9Jx+BAmcAc6I+THeQBtEGjDX/qPj1WF42UZnnu+GZLdQer2YoNA80PyAlzce7n8seVvKrMGE1KVsM/VCRCzMNekPQBtAZggl5ntpt0qJXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rU3/UK7J; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rU3/UK7J"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490426d72f7so63501735e9.3
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990532; x=1780595332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NONFqO3/HG3G/0TaORQaOsqfGhIfs93AQaWtPW/Hy0=;
        b=rU3/UK7J8FUQq4JAD1SOhdC5D1AhwlaVMbr7Eczu8KBOsS5KbR4S7PfaVZFZhmmzyg
         xtuL8d6ZnSXymo4AcPJh4DVf6ISGozthhdZ30iT3CA/mwwyptG5Vv8TiHuRyFV+5QULI
         fWmkwdxqQdhRp8VMPlOSFFQ4opXuTOCmH6/l2qJOmKa8Sbzg/zb4S2a1a92k6200Okl2
         lx3xdxlOmHhSvRuk7xprwq8hCRJnZuQcgwZW2zmbIGScDA/LqmvF3AW+WHbi4wUI7bWr
         MG9dISb6Y2nVoASgaS0l8JfLtNqfQe7bqnWXv5Fb+JnsNMrfBZG0bvTxUHELGNPIermm
         hISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990532; x=1780595332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NONFqO3/HG3G/0TaORQaOsqfGhIfs93AQaWtPW/Hy0=;
        b=TtMK2GbG8bcVBWwA3PvLuKKpkQxVFFg2kfH8aFnOpzdaqWu1U7XP3wdUnQkIdatWZP
         /I4UnAbt2XjiOB1E/eszWM7I0NycjV3gXd05Ct9fBoh3+yGm7eteKmooCoALu5pyyJ5o
         kztyGQs68s+d/J/fhep2ALLEDdMGP0ryX3CGQKgsYI2zCZHj4cn+V9wvuCaaIuTQbmrh
         8h8ppAXteD3CFBB7vKadyIxiftjSuBy/yLvVzrDy7H3I/MM8nwJGOLsKk6gyCKFUC0fu
         sMDhrWTV+L4pBjsy9u8CST1hOsPI3xuNADacfRvtKyrlylvlu5IWo2KNg83FLbb0j60N
         iWZg==
X-Forwarded-Encrypted: i=1; AFNElJ8Qc7g34J6P1o0GYP8ylGlD+GradWx2UoKoclbe2/ngFVHoLFiS5dhY9uUE+bfPT9WXMtURxDAi87R2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0/NDMnADSGd98kFb0R520KFSZzsx58BqD3LPiuzcNXffnbmMR
	KgpZhZQRNwn5zoxP1V8iZvuOWDThGwNJk2al1LRhuotAiv2M7Osh22M2
X-Gm-Gg: Acq92OGajHVARK8pPEEO4xWCJgk0qWqxPM6VP27Fme8ec6pD6Zeaeld4xwBNr1NsXtU
	RLi/Y2QDBaIx0PIX9OYDaf9ytXBA+VinEa0zLGWYIjlKUni7nhSxUneLEszarBMljnF6M8hEuXE
	NOzFd7W8+P9AHx8h0Io3ZAIFpa43VCulAROmD161O23566kp6uphuj+4G/jHbwcKbDMDr02r494
	PqT8a1dwWXOSJ9FfbfSYwvxC+FDiLdTtW3jSNI4nDYbvjy4A7cyg7TngZIt0IZVGzcMKzfQJ00S
	wUZWOtHEvlMXjkUycmsOhyn8Kw9fuzrKdO+Jw3fw93FlubZtyNdLzF8kb8p6gThRl0ukAelzCjS
	WVjf1qPo8UqtSJpA+KDpAx71SkJefrykO4RTRBTq+m4tozwLad+WCiXap5QR+5n6fHCPGUn/6II
	CmPNm4lZl4Qe/t+SsU43BIfGA1so41gwFYjgLt4CGa2vQ2OCTJXWrg5O/05zxcxPBHIVwFiS9lU
	bCWnGg=
X-Received: by 2002:a05:600c:4fc1:b0:490:7227:100 with SMTP id 5b1f17b1804b1-49072aa14b3mr221993685e9.18.1779990532172;
        Thu, 28 May 2026 10:48:52 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:51 -0700 (PDT)
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
Subject: [PATCH v3 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card.
Date: Thu, 28 May 2026 19:48:29 +0200
Message-ID: <20260528174840.28644-2-ansuelsmth@gmail.com>
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

Add YAML schema for Airoha AN7581 AFE SoC sound card.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
new file mode 100644
index 000000000000..80d9e87f1470
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AFE PCM controller for AN7581
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe@1fbe2200 {
+        compatible = "airoha,an7581-afe";
+        reg = <0x1fbe2200 0x9000>;
+
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.53.0


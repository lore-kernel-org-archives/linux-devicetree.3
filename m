Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF70839F165
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761814; cv=none; b=PxHMjldZWuArVTPVpgJeTvwvXzrcu/vSUh4nqtmFA0xgRbKt5BPcTxa7exVIRdSsiw65ybdi1JFjxbk0X7GzedTkSkWCCvovR0wzUmBUpFJ2Srg3P20nlTyogb645QDZbyhoHTGCLKXSi3AM+a+jQeFk9BWuWPvubkx74rbJVSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761814; c=relaxed/simple;
	bh=9iZHTlK6xpfJU/WZl8CV+b5YzH/jAbEAS66ZdJyd3Og=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mTIGjSOaN15co+kvBM6y5A0Dia+sozDNtyxlmWP1HKxLqIiXw4+V26cy2UfgBOQk6wszGLFu5bTUNgrW8ggocGEdnfYOlMi+m7c+xYk7F3yK+87/4/AhUG1QMh+c61nUZLGcPDzfKtILMVazPOcNrJ8lkQ3Qx6d4/eSC4BFyoMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUV36HeD; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUV36HeD"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c7961d7bc09so1445812a12.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776761813; x=1777366613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ziz7Mrkr+sJ/qW8jpuomIbosBf3JNZS04tKrJ4e8a4=;
        b=BUV36HeDr4RYgMTAvVaMLVhBy1wL8JU9qH8QWSmBkdPu4LwaD6jb5mG8iUTcZru8k7
         0gYkvZc6+02oDkDlMYKSgpqchqkFoJ4+rIYphgZ116e5KtFAAVylWeS3t0vtC6iKPbuK
         HD/y7mDiTctZdaMz8ERdbdTyW4o+vCNgzG/y7HNoKjlcPg1wdCSYWQhPP1lxLIVF2H4b
         dtiw8rjW102FfIKoR75OFR+1cYkb1RuBqWFwbFH/4NwWucxrKX/zNky3KX7FtNW08bwt
         4iFziJGxGz4/rGpPl7cC7/pIKQOJq4if5Q9dZklPOtbVVMiYnFlDol/wYJVP4mDiBdS/
         GIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761813; x=1777366613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ziz7Mrkr+sJ/qW8jpuomIbosBf3JNZS04tKrJ4e8a4=;
        b=WJlpULZWvAVCsFS8s8byDE5vzxCrHtbbBEq9R/TvxJoUOxYnSgYa9mk2c1UJ+pdlic
         VIFWkym2E0f+ytKi4+3ZbLk0CziCjTr8uUkf6cCb+/15ZB1fS0dqTbCdzwxwy+hpBPXj
         POBZ6l4fIgN3FjkpqvsCh2peGYzLA492wN/wn5fQhFKTHyHlDccy3aghwkYaR6KCZ+LX
         upzoNP7R7LvucVjZInrUQugGDYnD7aIRcvkSgejkdo0a5spPChVjucfETl424fhrdqm6
         Eq0n2OvpC4ZKRisAyTxPOxjdYi9U+NAU7WJwcz9ol4jnuJE7F+dj5665oZsaWc2/nP4U
         u39w==
X-Forwarded-Encrypted: i=1; AFNElJ9OAwSVHXdlGb9dAHCWIHFkphut2+ydEOLJm4ljKJZbM/cPCrZuPzBMN/03rGAasSSclu6cndhsapnT@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ4OjuGlfACIFlpbZLHikBVMFOFAkiU1EXkWplwtf+K/d4bQAE
	uP6irfBxu25paqMSTZaAcTcNocj5Ow5AkXejOZMRMMpgsKxIusq41pGq
X-Gm-Gg: AeBDievrUB/iQEMrOksHl5ZQqZV4F71XM5Nmh8d4XpeEj2B7Nu9Ivh5BALDSHd57nF0
	CqeI0KUdRcoMFxIWxvjJtNbyqeOp/brxndDJbiyNDn5u59roFFmRU5+N/OtmaY7R0JkGUwZajtt
	wJMjY5JOD2fYWNbUaPYTS4Fuwxhje9IBlIhn9DQP8nR+wq8Tllyg5UHR/UjFgyNLynWnNQss7XF
	W8m4+ODZi6LBmrCmDZ6cSUr6/woVVcY0H3NjB00OBDX37CsPMegmvqaDEVbcQTnmi8t0DYNL3bH
	SjACSTHyC2d/hCJ1+KJK8csBSGQXjYvmr+sEfA0hqWX04RCPtmZCZYAWEXPGOOJQFK0V62B3XK1
	NE5n5tCnHo0VEYx74dcy47kQlm0lKYEAtu0J2oRIEZH8TGdQq4Ila2fEFxzEcrpnH4/3AHS8bY5
	vXUwwdIzCa1LSSywh27UeQ53RwTVPQA8PLZa33zQbviJsgemh7i9AlOqByMujIZl/xKQ2kCViyi
	Nr5eCkSZSM=
X-Received: by 2002:a05:6a21:6d9f:b0:398:b95c:51ed with SMTP id adf61e73a8af0-3a08d8a3490mr19258719637.35.1776761813170;
        Tue, 21 Apr 2026 01:56:53 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703ddf8sm9868875a12.28.2026.04.21.01.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:56:52 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH v3] ASoC: dt-bindings: cdns,xtfpga-i2s: Convert to dt-schema
Date: Tue, 21 Apr 2026 14:26:34 +0530
Message-ID: <20260421085635.4490-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the xtfpga I2S controller plain-text binding documentation
to standard dt-schema.

The hardware requires exactly one memory region, one interrupt line,
and one phandle to the master clock. Verified these constraints against
the driver source in sound/soc/xtensa/xtfpga-i2s.c.

Also explicitly define the '#sound-dai-cells' property, as it is
required for audio routing but was omitted from the original
text properties list.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
---
 .../bindings/sound/cdns,xtfpga-i2s.txt        | 18 -------
 .../bindings/sound/cdns,xtfpga-i2s.yaml       | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
deleted file mode 100644
index 860fc0da39c0..000000000000
--- a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Bindings for I2S controller built into xtfpga Xtensa bitstreams.
-
-Required properties:
-- compatible: shall be "cdns,xtfpga-i2s".
-- reg: memory region (address and length) with device registers.
-- interrupts: interrupt for the device.
-- clocks: phandle to the clk used as master clock. I2S bus clock
-  is derived from it.
-
-Examples:
-
-	i2s0: xtfpga-i2s@d080000 {
-		#sound-dai-cells = <0>;
-		compatible = "cdns,xtfpga-i2s";
-		reg = <0x0d080000 0x40>;
-		interrupts = <2 1>;
-		clocks = <&cdce706 4>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
new file mode 100644
index 000000000000..9617acef3f0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2S controller built into xtfpga Xtensa bitstreams
+
+maintainers:
+  - Max Filippov <jcmvbkbc@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cdns,xtfpga-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: phandle to the clk used as master clock. I2S bus clock is derived from it.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2s@d080000 {
+        compatible = "cdns,xtfpga-i2s";
+        reg = <0x0d080000 0x40>;
+        interrupts = <2 1>;
+        clocks = <&cdce706 4>;
+        #sound-dai-cells = <0>;
+    };
-- 
2.43.0


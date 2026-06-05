Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0AE395AE7
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662022; cv=none; b=DDXgTyasiJT8/6BHA0gFpuqAXES+974s5gA1znpnBWVSGiYtDVpfi7uh7SOMepndXok8LNC/u8dTLiNMoz1TB7/iOv09D0dPi0ztwk/+On2lD9gMrAaLlk0D9VAACW1ZgP7F6UKMlEToXYij9kdghgC1ctQIdYXgm+/Z5tfI3Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662022; c=relaxed/simple;
	bh=oMzP/wOfJx1MRfMRoBSuTkFbbK2LuERI2OFuLB/LIio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTplz7jQ1zrBMU590GEcp1UpCfaE1UK/nn0mKj5AYml3Y8nWJ62W3jNg+f+tL9po6OfQ2Yympvrp8EvNlXUZkOIdvBrxoyZQseAd8w7/+h2zieRXHzzFTBwik/CPi/jB0BmK8Nh8egdNgldbVWH/hKyLNzVU90yRu0GqhHQuXtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcjVb9CS; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcjVb9CS"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f1e2f8eso1442167b3a.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662020; x=1781266820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEv6Gx13HTQhXkhds+jiesB3Dn5KZs+v55Em0FBOv6I=;
        b=FcjVb9CShOQ5fFEYe9cmZd+RqTJNjn425nsEIHP9zAxdrWTRPliTVRoVbidO/0kfPi
         ZQ2E8CkI1t7QrhrBgHC/jPjoK1wf1hFOmiw7nS8+EKZ2lyRapOdjYCGaxPqgf/Q2mmWe
         7uVITbzZx4DL2FDiGU3fLYgU+bcTFQLKkxR9B+9/SpPmS4IawxEDElfe5biaGM4IuZ7e
         hSledsgOJGwXYf7lhKe5XJNtDQdKaYejOeChbZFuQa7Y8/5y8rn42BHUWtKyaSNASqYH
         piNqj1C+4wd8Y508oWNZ6nm5tYRS7EwelEo8q6Fzf4tWIxoq3D5wrvA7WWA5mXcrnhWy
         owaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662020; x=1781266820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FEv6Gx13HTQhXkhds+jiesB3Dn5KZs+v55Em0FBOv6I=;
        b=KijcDLxTxziksJk9ALGeSLpXTnX/FtkIBxKbCxMqZKtq3TEZ9ZsXQAAZAP/UrGH5sC
         HA6xOlpQ6TjDYH2jqSqlfs2ODr23sryiZ2ZWl611fPm6eK7JjD0SPMS5lXVvuaaQK1Y6
         HdpaKGJE+vFmL/d2uoLt06k2sbHJHSkcijaNzfMEHUQr6UqSbBxT+1f8ivCpwoET6vdl
         bzhJuhWOpFFny2gu0ikRe+otx1eXjGU+y//n9atXNJ9M7P8lJ+KBE2rkVnZibOsGXcfz
         9iC5fWbbu+2EB6bphOaKxfWDPGj6KVDEPmDiBZFX1+tmd8/gi3fmMiuFsrcff+aL6C2m
         /Ftg==
X-Forwarded-Encrypted: i=1; AFNElJ9BnBTAKcQhTv0ALMDff1YvpKMUrBggDVA8wDon1p+LYOIk16LHDrf+DH/DBpCdVeV4VMjzjLHxEbef@vger.kernel.org
X-Gm-Message-State: AOJu0YxB7xb1LooR6qLpss7CaYnHzjZBDE6W/AwtVBTvnor9jy5iKQyW
	lulo0j8fNhziqiTN5OpsNJgrHquJoDugnSeUrYBXrO4/1WSfBr8aEJrA
X-Gm-Gg: Acq92OFxSHOndBSpP9mpL2A9fH4PdhmINaxrz1DL1A+u9uMwKCl0ihBbSbIzxBYrXsx
	Kh87SuyTT34s+g00R14tf/i3sjYYOCr6BnUTxDvUA6VFTCw4vSSxhhc32Y01sQNfDMWRwreQEbt
	nfH7391wdmCcT2mIpVMSNOYB47VrJZnrJuaa2bppIRtlSUsZpmbGf2N/XaasnNZk+lycmFmR6sK
	ljcxC31gLuwjAhU0gM/oUKHPzKHoXS00eSrc6+VAq7tksEmJ3wsQKefoyYVVQuXL8QF0k+KEAxh
	CQprfhb2raS0H8bH5vuC6fC6gZPKbj/JfB/F+lj7idrzoNSY0CLfNR7HlvuKD32zpaosMybuhqf
	7FD3iMuQXDNclZzfbGrewcYWywcwGSu8/Rjm+Z6aexBJ0MKVT2KO+gXZ4NIVBCRJNXm/BPFnCCl
	q32mLMszb65eOvlnoUcA6IyC/DyC5MovvgSTiuDqXthz4az6dVyaNIXS2QYrg9A1jDvwYb+y8c6
	efFsDI=
X-Received: by 2002:a05:6a00:2ea9:b0:841:d7f6:7297 with SMTP id d2e1a72fcca58-842b0f0994bmr3355005b3a.40.1780662019396;
        Fri, 05 Jun 2026 05:20:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 01/10] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
Date: Fri,  5 Jun 2026 19:19:45 +0700
Message-ID: <20260605121955.105661-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
accessing its registers. Without this clock, any register access leads to
a system hang as the FSI block sits behind the SPU bus.
Update the binding to support multiple clocks to properly describe the
hardware clock tree, including:
  - SPU bus/bridge clock (spu) for register access.
  - CPG DIV6 clocks (icka/b) as functional clock.
  - FSI dividers (diva/b) for audio clock generation.
  - External clock inputs (xcka/b) provided by the board.
Both sh73a0 and r8a7740 define the SPU DIV6 clock control register at
0xe6150084. The binding therefore documents the clocks supported by the
FSI driver for these variants.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v4:
 - Update dt-bindings based on feedback from Krzysztof, Rob, and Geert.
 
 
 .../bindings/sound/renesas,fsi.yaml           | 61 +++++++++++++++++--
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..b966b55ff772 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -9,9 +9,6 @@ title: Renesas FIFO-buffered Serial Interface (FSI)
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   $nodename:
     pattern: "^sound@.*"
@@ -38,7 +35,32 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Main FSI module clock
+      - description: |
+          SPU bus/bridge clock. On R8A7740, this clock must be enabled to allow
+          register access as the FSI block is connected behind the SPU bus.
+      - description: CPG DIV6 functional clocks for FSI port A
+      - description: CPG DIV6 functional clocks for FSI port B
+      - description: FSI dividers for port A used for audio clock generation
+      - description: FSI dividers for port B used for audio clock generation
+      - description: External clock inputs for FSI port A provided by the board
+      - description: External clock inputs for FSI port B provided by the board
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      enum:
+        - fck  # Main FSI module clock
+        - spu  # optional SPU bus/bridge clock
+        - icka # optional CPG DIV6 functional clocks for FSI port A
+        - ickb # optional CPG DIV6 functional clocks for FSI port B
+        - diva # optional FSI dividers for port A used for audio clock generation
+        - divb # optional FSI dividers for port B used for audio clock generation
+        - xcka # optional External clock inputs for FSI port A provided by the board
+        - xckb # optional External clock inputs for FSI port B provided by the board
 
   power-domains:
     maxItems: 1
@@ -69,6 +91,31 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,fsi2-r8a7740
+    then:
+      required:
+        - clock-names
+
+      properties:
+        clock-names:
+          minItems: 2
+          uniqueItems: true
+          items:
+            - const: fck
+            - const: spu
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7740-clock.h>
@@ -77,7 +124,11 @@ examples:
             compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
             reg = <0xfe1f0000 0x400>;
             interrupts = <GIC_SPI 9 0x4>;
-            clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+            clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+                    <&fsia_clk>, <&fsiack_clk>, <&fsidiva_clk>,
+                    <&fsib_clk>, <&fsibck_clk>, <&fsidivb_clk>;
+            clock-names = "fck", "spu", "icka", "xcka", "diva",
+                         "ickb", "xckb", "divb";
             power-domains = <&pd_a4mp>;
 
             #sound-dai-cells = <1>;
-- 
2.43.0


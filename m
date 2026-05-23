Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5711F372B3B
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525869; cv=none; b=W0u8t1qJ2IVCgiprrrFM0RSiSP8FTXJMEExLHeHfrAy1wsHzGNIV90QsozPbPDad+HkE1zkYnhWq1MJmgaFYs0jfrbw5mAVPG7eN0NEkXjuGcTvc70f3b+kA1xyLsML4FzH7JpRbEcEiuu7w48r957jNjQpjYENI3nKuVFdN64w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525869; c=relaxed/simple;
	bh=aCRvYddBbXrODXAsigivXkpsnAI8V+yb5mlCXcskyT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqDbicXZzMiQv3Y8iX8mCmEAiK67z6Rrrt6qcYLVp9vrK/msm6qDIFNcy08lBMp/n5fqf/SEk5hH0HCdyF0YoZKB5gKlSZjJlvUY3OazJ5s0ocsDvtJ6qqLQ4OI7ySBIXHjFDTzHltXG++U7dtIh1RhHotxRtbX0hjEK55a3JXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAwhHM5J; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAwhHM5J"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd5047a2a4cso1226311666b.3
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525866; x=1780130666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Qhj6rHOiahWvbVZuWT+FMPoy+y8UQ9yLqxFehsJ6oo=;
        b=OAwhHM5JqncDKe3JqEBG7ormYizSPXPfTRN/XxD0Wb1zPwzmhsedfWfsUSZ0Dgj7aL
         m3J3NFciv3Hj69N9HGgbmOkF6MA32KdzaEPMSY4mFDY6cyCVvDDuxaelUzM99TA2RmhS
         y3ompCB63rhwCR4EO257saawhyedKo3QZ8NaiPTmyFA9J5A8tzuqqXWLm8O3jg1TySFP
         ZIhSqUsVnFVmq+gYxDrlviTnxpAiWJNemtkKZKPvs1njM7ZB9Zlg+uPoSBk/2ynz45Wc
         SFRNiNgKyUiB6Sf7dDoyI+N/wp5vjHbzjslCONm5q7lgDj1Txd9tfpE+2oyYLWWbTR9B
         yOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525866; x=1780130666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Qhj6rHOiahWvbVZuWT+FMPoy+y8UQ9yLqxFehsJ6oo=;
        b=FfW1nH5VXnKReFl1265BVqV/5vot5Pw2SWNmlV1z7hXmZuKY+0DiduEXmhjfxLgugt
         jTEAIp4xmj8d8hICISk7UNOl09GpKI1v+MFF08L2OEyo5Q/th96se8bDElVSz6vGpVW8
         iM7qb0wOiYuo5DKW8KH3kr/90qo0i1iN/RVjbKrjz7zQQTJ0hHQvwjwT2WaeI6JWaQA9
         hh3lBd24gsjAuvvm7MMTDQ9dPt1RVo30Gy3Qff2NpkSLDxl6YzH7eWmbWRTurutVtq8c
         vrq6a+qnHHY5YyZFoMdVrvom9U4rm+lE4PGzkRrUWfclXkKTSsvKX0Niyk4N87Jg6YKx
         g4EQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bIZGSkRyRNPWh+vi5bs8FLUsryOr+nI6o/kwK4bA3JIsKxA4L0IQDSjHEeidV+VM8OqdGSYFm5Bi6@vger.kernel.org
X-Gm-Message-State: AOJu0YzBCZZblhBBQeOvgqLUm/+Mh7NyoqiUNDDlROIgurKBsAC+W53i
	mvWxD7fJF3mx8urB2suqykGtxg0ItSECPXmBVVmehLtF41HU66X0GHX/
X-Gm-Gg: Acq92OE4ghZNTW2h2aRwL0EkZ05PB+kLSkcy63JWzUhIJP47E1R+RPGOqJDs5T/Cm9K
	fBn+qTC9G1x55YDKILn33k9sl/tk+CYESTwz+2jdz8nnz+chimZ8Cergl3tAIJYxnaI1+lWR7uE
	4GOo4QOJge2uholUW4NX9+J3ZF3nVG2jebIktzkWMCiLCRumRP/TTK2/PlF7qSUq5evWt5nF/4B
	I6qMgTORPO8FC9onKhpqKJglQx+n+ABs2uyyJPGWkH92bPOFSGm7MFWJM4mDHEDFxUu5DY8JWdp
	wXBsmVuaokUHKcfdNUD45kb1UvP0Mdxe94RdGNcsrd0tkNTmoo9hYkbyJ5r3fhXtm052qWwg7ky
	u5YYFmt1Dc/eVirGm4A0oHB1bL94qv+Z6b7Jd1LdUGZ1xGfyRK5bhYlf+dbRoUk4Iefe4jMEgmc
	GTJntmaFHoQaMM
X-Received: by 2002:a17:906:4594:b0:b9d:e301:20db with SMTP id a640c23a62f3a-bdd274c9a91mr321047766b.25.1779525865586;
        Sat, 23 May 2026 01:44:25 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d70a5sm154042966b.48.2026.05.23.01.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:44:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: net: Document Infineon/Intel XMM6260 modem
Date: Sat, 23 May 2026 11:44:06 +0300
Message-ID: <20260523084408.50346-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523084408.50346-1-clamor95@gmail.com>
References: <20260523084408.50346-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Infineon/Intel XMM6260, a 3G-focused, slim modem platform
designed for smartphones, data cards, and Machine-to-Machine (M2M)
applications.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/infineon,xmm6260.yaml        | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/infineon,xmm6260.yaml

diff --git a/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
new file mode 100644
index 000000000000..ffff58e479ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/infineon,xmm6260.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon/Intel XMM6260 embedded USB modem
+
+description:
+  The Infineon/Intel XMM6260 is a 3G-focused, slim modem platform designed
+  for smartphones, data cards, and Machine-to-Machine (M2M) applications.
+  The modem is usually connected via the application processor's USB line
+  in HSIC mode; however, to work properly, the modem must control this line.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: infineon,xmm6260
+
+  interrupts:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to the ON1 pin
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO connected to the RESET_PWRDWN_N pin
+    maxItems: 1
+
+  ap-wake-gpios:
+    description: GPIO connected to the EINT3 pin
+    maxItems: 1
+
+  cp-wake-gpios:
+    description: GPIO connected to the EINT2 pin
+    maxItems: 1
+
+  vbat-supply:
+    description: Supply connected to the VBAT lines.
+
+  infineon,modem-pwrseq:
+    description:
+      Contains phandle pointing to the modem's power sequence.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    modem {
+        compatible = "infineon,xmm6260";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <168 IRQ_TYPE_EDGE_BOTH>;
+
+        enable-gpios = <&gpio 112 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&gpio 169 GPIO_ACTIVE_LOW>;
+
+        cp-wake-gpios = <&gpio 151 GPIO_ACTIVE_HIGH>;
+        ap-wake-gpios = <&gpio 168 GPIO_ACTIVE_HIGH>;
+
+        infineon,modem-pwrseq = <&xmm6260_modem_pwrseq>;
+        vbat-supply = <&vdd_3v3_vbat>;
+    };
-- 
2.51.0


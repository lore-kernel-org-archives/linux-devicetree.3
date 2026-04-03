Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11DA3B777F
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215657; cv=none; b=S1bOY2DHvDrJI+ozxo6yYniCOcaShTnsiy0jm3n2e0Dd45pUehyzQ9T8nUKb9sGke98DBoj0P0gA/slELZglbcbL6vQiA8Ri70Zfu9pgs/Rt1jqWX+Gg2Bu0hg02vPd+9dEWrYE2eaCjaxkK2YyUK5Ld6qDCmiCTBijrCbP6qmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215657; c=relaxed/simple;
	bh=8kcJtqi0VHJvhXuEuRP4SR2nVD2GvzsAbGsi4Dox6/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8QpW2WWcfFE19XjyPrd+ygdrXjwSBQLp3c162XzTvZql5yQFpoZn+pysUX6oTaeMSaaw2pcjPU1eMB/opHuXiO0dg3D2vGYSHUucA7up2ygAGTYAEZsZqqwmr/ABDG2/3Lkvg8K7vYJsMd0/pL+J/8KEAENSk8mUmEaLWcetaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3RjsWIJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3RjsWIJ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso918666b3a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775215649; x=1775820449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOr8dkqvyqFf6OUz7iSfGmZZS207nEioRgpDY/txeeg=;
        b=c3RjsWIJjIKLlkkMQDp+b/VbjgKVNxeaM/uUYoeFVL+auTorzu+sD2RjOPJjuLTuW/
         kSneu1kWshF6tMve4iGVeT5dUNovxowb5H7zQkbktz9fDfMgXQd46Iv8awVz87rQxIeA
         RtZpqb+yoEURwmTJgWm1Rdc0n8Fmd9ihvsGGoabcK/grQPW6fwzNcCJhnWrfUlPkTvKc
         HKoKUoUKbpvCoBwEGLv4ZodFAbfpuBfMv20JQZzn2f2tg196cEIP4o+OI5YYRijaRaaw
         xLvTS+JrLC+ie+cYbTK5eNS/Nouw5fVo7rEuQOJo+fbEfz77pkEh7SgDCJnLuOkBdRjQ
         wkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775215649; x=1775820449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cOr8dkqvyqFf6OUz7iSfGmZZS207nEioRgpDY/txeeg=;
        b=Qx5GAMYHp0rZ923XDPWUQvmggYXV0cM36mKF0HBpNMtUO3RDMesrE3CzSdA6p1lzXO
         0heDlQADFa+qR81fMqBXIQ9JmWHpaK+3ai1BvTGMRhAgRYnpZDpCy4nIndF8PeuhCmC/
         +RjLS1+36NaReAB3I3NpwAWQPD5+fLSt9qBDDNOPrBQeX+tb55KoCkne1kbStSjnWXs7
         CdHZ/BRa1vkudUivqSfmZzKX3j8frPIrosVfIcN+1HpAXtmJrJ5dokJ2WLBD+E9zb4Lk
         PiEuHPTK21ndb5aNv0yhQKo6p/GewtwoYbVTtte5eYFGLp/SxL2acsQuIpJM923nwBs5
         h/xw==
X-Forwarded-Encrypted: i=1; AJvYcCU1+2jGOzN3VRa3RJTpfr/Mx+hG1mWzifs2amWq4X13Xx4ukGeBC2m5cZhRHSmLN1CfnY1WOgUp39/p@vger.kernel.org
X-Gm-Message-State: AOJu0YycDEDS5gjhiWtI+bsBAiyDK1SeA83KQ8M9kuWfxldmGWjZ6acX
	5I4ZYnQdAlUOeJOoWtzQSuVkwYzotWcdiWreVVB0xfCeGddYBokQ5AW+
X-Gm-Gg: AeBDiev7PLyyLDGGqh/tdCL1yCT0HL1Tm9iAzvXHiYv3Zjf1BgSr9BEsOqMKUXPEBTe
	9o13lW82DrqI5+WXln+Yff5683cSEptcOE0EGB1vPwD3DIojJdsp6zpd2Z5Y8rT3peQDUNK3W39
	6JPIfQUUzN1Z70MA0S8Fpfkc6cpfug+26MNpJi98H4oVc1nPq8ULs5AUrXCRTcULgQpGEuMsW4H
	k2FO91GyrO1iABBwc71WXYq94JkSzrohjG+E/duw5lb5GxRCYLfhSHpcAa5/wp474zTldr6gOF2
	ab79b9nk8kzvMf4isKE6y28BCS2h3/Dsvtl56c65ju+pIWL8fK7B58g4jdjQRGQXYGLETgLXGc6
	BeXKHqkfZ0bpUAik7SNC+F49VnXCfBpKy9WEmMfS86vKi0ZqH3zBzVGo5fckD0e4UjAnIIqE3Tv
	VQ52qd7SYN45i0RyubvbDOXe/Ua0TJNGQOl8XY7lmVi/cnHIUgxZm9Jy7R3AUxbAp67ju5
X-Received: by 2002:a05:6a00:189e:b0:82a:76ab:3279 with SMTP id d2e1a72fcca58-82d001e92e3mr5481537b3a.4.1775215649367;
        Fri, 03 Apr 2026 04:27:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5202251b3a.23.2026.04.03.04.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:27:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] dt-bindings: sound: renesas,fsi: Add support for multiple clocks
Date: Fri,  3 Apr 2026 18:26:53 +0700
Message-ID: <20260403112655.167593-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403112655.167593-1-phucduc.bui@gmail.com>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU clock to be enabled
before accessing its registers.
Without this clock, register access may lead to a system
hang.
Add support for the "spu" clock so it can be managed by
the driver.
The binding is also extended to allow additional clocks,
as FSIB may require more clock inputs, while FSIA
typically uses fewer.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../devicetree/bindings/sound/renesas,fsi.yaml       | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..225cd8d369bb 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -38,7 +38,11 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    description: List of necessary clock names.
 
   power-domains:
     maxItems: 1
@@ -77,7 +81,11 @@ examples:
             compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
             reg = <0xfe1f0000 0x400>;
             interrupts = <GIC_SPI 9 0x4>;
-            clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+            clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+                     <&fsia_clk>, <&fsib_clk>, <&fsidiva_clk>,
+                     <&fsidivb_clk>,<&fsiack_clk>,<&fsibck_clk>;
+            clock-names = "fsi", "spu", "icka", "ickb",
+                          "diva", "divb", "xcka", "xckb";
             power-domains = <&pd_a4mp>;
 
             #sound-dai-cells = <1>;
-- 
2.43.0


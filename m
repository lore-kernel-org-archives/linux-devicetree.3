Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BF83A543C
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448497; cv=none; b=fk4zFGOZsZBV+WlODfqhYKA36Iq/zkBzq731K6jeFEVzoerKL8NK5ubzEe4aeibEz+sAkERmcBTdrO2jm/YWQhZMHIZu7YB8L5r9CCjO/SvuhjxH2BY7a2GNEgw/ggj9LaVULDZMUYJ0HRj49jkGyprdlkT9tlxXwhfXiiVvXG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448497; c=relaxed/simple;
	bh=CzBNpMr38LbAa+wg++Y5O/cDYftb63hHF+H0L1e2W6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+A0B1OwzjZUntvL8HxcJgs6IkpYLJC570585d1kKSLJ0Qd3/pBjIwtdfBvEanM/2zwahQB7ixqGCRexNdqNSSDvoYUaQg214u3Hbuqd8HRfathR9IezvCYpmASI2Jwd/IKWGwAb/GjJF0cCLg1CgmT2mt3enaQiT2WC2DZe4XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kMcTYZMt; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kMcTYZMt"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35e576110adso438392a91.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448495; x=1778053295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpI3q+gsgn80m7y2eHYFXClPFPU0Z5FnPFlB+b0Ly5g=;
        b=kMcTYZMtiSL37fFPJ9KCId2BPNPmsTSwyMI0sSnlmVo5QM3IlZzaibcQCsnblx9OPx
         NPDXyf4xbmxTyjgX/cG9yF+8yL67XcU5nDG1wAhCeV6k4mnBubGCWAEtpglyE//cV/CY
         nY7U8wM0gUsL/Lr84SHxuumyMkP2D5tA69BWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448495; x=1778053295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QpI3q+gsgn80m7y2eHYFXClPFPU0Z5FnPFlB+b0Ly5g=;
        b=siAtHSZBe+NRW0xXLRuzyyhWwk8ilVCC+YL1ml31zjwI9G/aonhVUXN2XOIaCY2h05
         226N1FMKYZJZtaQiHCa6AiUYyoaqXGTHknwEdb64LRzm1XhyWJG7xA2uEmvc0bPO7/u5
         giR7DSt8liy8pSG4uJQovG0oIULZ9lJKzmd5rY6nIsrlGCKlXBVXWYo7sR6Y7Vl4i6HO
         gaqdbesSxgJQ5eYMdoUR8A5qDwf46WTfjQ961Mua0soYakVA/LbmaNeokmbC7kgBaEqa
         8LopimdSEWu29SZ4bYq50ncDjqpsZG7UVClarp/Ljzpw362m4UVWRKW830P3qEeJQAM7
         DafQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eOiHYhXuyMqjLSTIYKm/AjuxhQlchVyYYyEoSYiUmlLIqUlZ0aiZi2qAeZ/dlHWQcV/yqzyr112R+@vger.kernel.org
X-Gm-Message-State: AOJu0YygpnACjUkyDlSSVulwcmrpGNOVM2P/UFaCE+o4Qy7dEZIMFjYP
	DiKD0RMb9s6+HlKVOLDiElKh/eZwvLtltnCNZChxRL5dZw2iC/cS38Q85OMpBGBwFg==
X-Gm-Gg: AeBDietu8Chrar2IxhXmqLGeY3qCtzTxGCdaoRdCIDEa6KFVLZm2OAi2TrcgKKT2KOK
	4YEfWMhH/wpZRpx2I9Ek1FpsUJwNa7H7dpZuDPVuajwln59R2cXwMkfBC6u+LbPngrQ+sV3wA/M
	snLZPxrRizFQG55nrwBEqFHth4KxNx5szTadDIOWwOkCMu68IikexPcLKQzjz0m5+kNGuGcWfk7
	Rl8d0Zeait1+gCk7Vs6UHmhEnEPES8lv51C2xE5KWN6nLBMIIMwKsJBZIwLISkqyIVJP7bRyGBZ
	5vPMtx3ferFyW5C880JRyAtVgcZtAmbhNpIKB/U9YNLYTXsik9VTxvopABR1Kx5P5ou+7J5XgAf
	y6uF4xNtNODT/3ymcfpWxr5t/CdI2n7tynrSZ7v/YgcdBnLm/QNDzXhFJv7zPPuFQ7+busJsoug
	6/Jojb/Ve387PIqAuN2zbhQ5idBRqSble4liyQ5p67QSYz7pazHZHEcCgoD6wwq0/LvDDNYMwns
	78DhELA0DaiRUwFYpc=
X-Received: by 2002:a17:90b:3d88:b0:35f:c1cc:fee0 with SMTP id 98e67ed59e1d1-364a26320ddmr1570113a91.8.1777448495047;
        Wed, 29 Apr 2026 00:41:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/6] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
Date: Wed, 29 Apr 2026 15:41:08 +0800
Message-ID: <20260429074113.3720271-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name of the regulator should match what the board design specifies
for the power rail. There should be no limitations on what the name can
be, and they definitely don't always follow the PMIC's own names.

Drop the restrictions on regulator-name.

Fixes: 8771456635d5 ("dt-bindings: regulator: Add document for MT6359 regulator")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6359-regulator.yaml  | 43 -------------------
 1 file changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index fe4ac9350ba0..ac925334ae83 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -18,84 +18,41 @@ patternProperties:
   "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
-
     unevaluatedProperties: false
 
   "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
-
     unevaluatedProperties: false
 
   "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(fe|bif|io)28$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(fe|bif|io)28$"
-
     unevaluatedProperties: false
 
   "^ldo_v(aud|io|aux|rf|m)18$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(aud|io|aux|rf|m)18$"
-
     unevaluatedProperties: false
 
   "^ldo_vsim[12]$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsim[12]$"
-
-    required:
-      - regulator-name
-
     unevaluatedProperties: false
 
 additionalProperties: false
-- 
2.54.0.545.g6539524ca2-goog


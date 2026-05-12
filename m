Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C174C38B136
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576073; cv=none; b=YxJjb80nBjS25PJyM2TrFTgvYAVEsO4smvMjuH3joNKnF8ADFqqsy3PmYYKDVM/BKnh9uUv2uPRetAZsGcu7pMWt1uUljanMjoJrABM0hefWoh7lgcdyAftA5dYnDBF09qwg13s2Fhf1NsjbWgU1qBaaIQ0t7LY1KS0zjMHfy9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576073; c=relaxed/simple;
	bh=PBV7gLpSSiGNi6k5OJEnkIJJK1hmODST82g/5RRr8Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZT633hZnmxhdnVKEsfsOKpyfK2bICNJ2jm3MhhuiTTdUBIXSfJrUHBFMPgIJGlqYoSxcFosbPFEFphUiac7U+qqQ7LAEMSyKpUMeg0yPvJ+Pi8QhnWiJDfKyYnBvMMjXbjgkm50ZrSAYyoPKOqjnbRiQgt2bhhRJwSOdpkcZXUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=odeDh+Fc; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="odeDh+Fc"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c70c112cb61so4027831a12.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576063; x=1779180863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=;
        b=odeDh+FcF5UklCuYYhfBZEVp67519x7KQ0M6FLeICMjfIJYDVNIqOXgiY/UlEripr4
         31Ks2rdhTzeSn1cdpl17dugIuwj68w6ERk/7Mjr0tHdYqcxkowJfmMtuiYjzLm+MHrv/
         btwIJZ8QPmbILL99b1u8m2boSFjqVvc/oJLF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576063; x=1779180863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=;
        b=YgKGNZ4DdNQwSiPBBKBlZWnuGqxEGWbPDeAhv2YT6uKoFNnaS6+SH7PS/2Vnvn0Vki
         XrchUG92G1y2maD/rdznHjIiqMB0DfxZo2hG9CNbRNdcPkXL93czHbNrzkVPVRE+24t4
         CC4BVScR5QmaKZTO6YA1yaEMyV0IycG6UaXqwXsCpgKBynr6zgRkJvD8Zlpsv9oKdIvV
         /NHc4Mj+DjZoh9iVBaGMazr/LEMbAPs5wneYPfX41D9OHYl382OK+YVejLEP1qYhC4Kd
         EpLVSptX/7YrHLGeNmrs52/m2xrAXODhvlka27QeXvrDUbHgY15uAEAQiSr1ck85Ixjy
         1wbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9W5Ta/BmFS0PRW0bbXY9D/GM1IPLtV635qGujcnS9gW9qEQdidQKjUFCt1E0NzfQw5ioZYr/qjsso9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7FbB2I3pvyWatrXzBMg/Xjnf+JjJuhQD/K+EJxJ+9JyNkyRWJ
	5V6VBPHdsFTQa1Ru/sAWj35Te0lxujYVHldlQCVc7ENvirhUPVSyluf9o/sQPrufgQ==
X-Gm-Gg: Acq92OGv5mbz51PxEgm//Q38Ycbo2HYZSz1tw5i9vhOQv61d3fGzSMZV7CwjQOE7f0A
	l1oITxCiYtFb5mCF5GFhw1OW9X0XCkqfWfvcxTlU4S1gwKmUAAATrYMOSRLm1xmMIPfrZs7m93n
	W2JYwsg49OcbRPc/HOOfmJpEjkOg0f5ejfyUYhCHyPP3Dn8nePIU/c30/9M3gjh+0BoYr+zRSae
	aTkvR2CNU6y0iyHZY6orQsTaAzPLgfkkEfchkAMVB7iNjufWZxUgEOUz/Ki9r7HhUiYUikU4vlV
	tppNRNwXYS7Ar7kPIa3BxyCUricshD9VF6tJIhCs+Ykd/vofUW0rt1p7VAck2EtNw3H2bgIBCwk
	h7CEKX8dokPjpB3zHsOFkMWx2iLQsfwfi9qTRPBGsmSYGKz1Wj+99VWsbfjy2VJ/cXtnXh8kfMH
	gkqSYd2ADAmV1lG6OH0dVFlVkvKHafAzj8hrScAmKGN9TQQltwVgdImr5K4bx+WGiWc1IPeD1jy
	Tm3+moL7zi1fGDn5m0=
X-Received: by 2002:a05:6a20:7f9a:b0:3a2:dd8a:5084 with SMTP id adf61e73a8af0-3aa5ab5c3e6mr30559580637.37.1778576062752;
        Tue, 12 May 2026 01:54:22 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
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
Subject: [PATCH v3 2/6] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
Date: Tue, 12 May 2026 16:53:50 +0800
Message-ID: <20260512085358.1693208-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
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
2.54.0.563.g4f69b47b94-goog


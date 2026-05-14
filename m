Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A0D224AF7
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750140; cv=none; b=nyp+wJlYjAqyyGShD7v708ZYoKGJSVtwJuEyiSL48erKXmvHbcTj+Q7bxjZdIXyIoeVZ1T6N7Rxkca9PBUTX3oDW5rF/cjgXoeUlnwxJwk3jyPQpj+4WEGR6bYzDees8x9e8NncJuYn9nUgTc/gyrFJrZQAZNsl8L0v5aM5XfeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750140; c=relaxed/simple;
	bh=TOt1Ri44am2f8hA06FhEISRjF0umCfWzzUUej0rO/Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQqUmKDKfdN9tYyxz1YeKJlUgLOZEX5IT3UNBCCUR0JeoIz2LDUZj3b/1ogzvgu2J6LaULqJaGnx1NjvKc7X5paWARv+tFjThuM+6HEpxFCFNnweKrYyP4vvv65xMMLUpaSf/8CvMiWVrznbaFgPiHzPKoGIANG0VunxSdfjUMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bfw42irG; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bfw42irG"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c796163fac5so5696499a12.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750138; x=1779354938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBS4pHrWZh5zW1dpIqvZt6J/ekuV9I8As0i9cfGXl7s=;
        b=bfw42irGATCUj6FJUJKUinGI6gljq7XBanKiKjwqTQOZEBNDKt35I30Ass/s1HfERT
         mc1BGgNNkka3bHlYtG57wYWMGrMF9G+QLsCEzNkfQMS47Lkvdt6W7YA+IpUXMWlw5XPX
         chqqsGzck2frzlpCtVcqWVj+NWGfNuLFvy/DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750138; x=1779354938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lBS4pHrWZh5zW1dpIqvZt6J/ekuV9I8As0i9cfGXl7s=;
        b=pNXPmRdFvCi8r9y0pzCUeOFFg6LN+CClcImtzikDyOKJJPsrxcb+/tsxCGNaGRFMAx
         sLc7sa7Cyx85uMNQRRCLH02aiqwpIFLR7faOuioNquMHBdJHo/jbUM7LiqiUSj9X4SX0
         jgHpnskp9waWqofvzlPSYjMdFhjng+CGF74W5AbTe1H/24Jp7YtXmnX7Jz5JZ+SxiEU+
         xoABCGaHokNFbZz1Ay69IqCJco0MF6lh5QqSEEVpA7Y6IsUgsDwZI+2MKTuENxjJEzbm
         VnI2DEZUdObHy2Uh2nTftaBnZwdtCVoBrFAbuncXNdxm0xSvYwskSAkYga7ArhPNPli8
         MiyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CsrvpHU3blIN7q/smpBegdcRcjIiVHkSAuukkrFPeXB1k9HvWCc1nnXHc9SA2GPscAscqOCgM93HC@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6ccmi6ThqyCNrPN9HVJXiGyF1Lr1EQFx5ruknx1ZnpRntAWu
	/wOnAjW0zNCdqNXJwnR1k95gLSeIH+iRcRf4ezXYgBSxmFmuCOawhbMLEh7NePsRjA==
X-Gm-Gg: Acq92OHXEPLROmpfVLGPtFRyMLPS3V+kBFQC3DKoTSlMm4TLfYq8czGJLbjuYu62gDA
	nwbXAdABXYs7dKmaGWrkTyOyhJ910G6XcU97VWH+wCObqToWwMCHMx28UAMGvYcIZuWVYZho+c1
	1jNLsYsKRZVvjsCfLDoWKAbuq40DYAE/hnvZ4ge0v1hytiWOkZXyrqqdzt9NDn6fvqgRyA+S2yL
	/mrbzh2MNUqfq9sY35h62eswUmyG66hdNZVy8qhUfnoB48QqMKahFNbgEVe8Ee8wCESuE9zi6N3
	5s6uirC79L+vtpyoa/yh1HjqoV1cslRSR0YA4ojFuAeFmYC6yhR3CmQjPvIhsgg8C5U5XFJ2NJs
	AssIaCfiVvZJAMckbGJ4DKNInF/prvSR8CYs2QOAVuH2sib0fgZmp4ejV3+t/AYNoi3nKlgIAUE
	xQYruMhZtW0rXUf5b/yVTcDd6YOjQTkNqHL1OZrR98q+oNsVvuu3jtgfXuPWacNaotYQ81bgzi3
	dNr7LspHNeeKk5AToU=
X-Received: by 2002:a05:6a20:728a:b0:3a2:ccb5:abc7 with SMTP id adf61e73a8af0-3af809790b7mr7760536637.13.1778750138225;
        Thu, 14 May 2026 02:15:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:37 -0700 (PDT)
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
Subject: [PATCH v4 1/6] mfd: dt-bindings: mt6397: Add regulator supplies
Date: Thu, 14 May 2026 17:15:14 +0800
Message-ID: <20260514091520.2718987-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the MT6397 family each buck regulator has a separate supply. LDOs are
split into various groups with independent supplies. There is also a
supply for the regulator control logic.

Add descriptions for all of the supplies for the MT6359.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Lee, request from Mark:

Lee, this seems like mostly a regulator series - OK for me to apply this
patch and send you a tag for it?

Changes since v3:
- Dropped duplicate 'va09' from 'vsys-ldo2-supply' (Sashiko)

Changes since v2:
- Fix vsys-vsmps-supply property name

Changes since v1:
- Use regular expression to describe vcn33_* names
- Moved regulator supplies to top level PMIC node
- Moved changes to mfd binding
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..ecdc77fafaf4 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -225,12 +225,62 @@ properties:
     description:
       Pin controller
 
+  vsys-smps-supply:
+    description: Supply for regulator control logic
+
+patternProperties:
+  "^vsys-v[a-z]+[0-9]*-supply$":
+    description: Supplies for PMIC buck regulators
+  "^vs(ys|[12])-ldo[1-9]-supply$":
+    description: Supplies for PMIC LDO regulators
+
 required:
   - compatible
   - regulators
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        "compatible":
+          contains:
+            const: mediatek,mt6359
+    then:
+      properties:
+        vsys-ldo1-supply:
+          description: Supply for LDOs vcn33_[12], vio28, vfe28, vibr
+        vsys-ldo2-supply:
+          description: Supply for LDOs vaux18, vbif28, vxo22, vrfck, vrfck_1,
+            vemc, vsim1, vsim2, vusb
+        vsys-vcore-supply:
+          description: Supply for buck regulator vcore
+        vsys-vgpu11-supply:
+          description: Supply for buck regulator vgpu11
+        vsys-vmodem-supply:
+          description: Supply for buck regulator vmodem
+        vsys-vpa-supply:
+          description: Supply for buck regulator vpa
+        vsys-vproc1-supply:
+          description: Supply for buck regulator vproc1
+        vsys-vproc2-supply:
+          description: Supply for buck regulator vproc2
+        vsys-vpu-supply:
+          description: Supply for buck regulator vpu
+        vsys-vs1-supply:
+          description: Supply for buck regulator vs1
+        vsys-vs2-supply:
+          description: Supply for buck regulator vs2
+        vs1-ldo1-supply:
+          description: Supply for LDOs vaud18, vcamio, vm18, vufs
+        vs1-ldo2-supply:
+          description: Supply for LDOs vcn18, vefuse, vio18, vrf18
+        vs2-ldo1-supply:
+          description:
+            Supply for LDOs vsram_proc1, vsram_proc2, vsram_others, vsram_md
+        vs2-ldo2-supply:
+          description: Supply for LDOs va09, va12, vcn13, vrf12
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.54.0.563.g4f69b47b94-goog


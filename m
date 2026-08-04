Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365E74398EB
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842349; cv=none; b=ZMqx1bbe1XzKELQ4IvyvvLFqI987j4f/xrbTvP9hW0UG2Az6gzRPzOBzTX5R2gFS6rQzp45YPa14DDLfYajQuMZ/FX7SNJXXBCBVdQXCRSf9fQmkcSVDGqTDpLg4CuCm2/c1xOQUdhwi5CziulabfVx+F0Q5zy7JxhZsOTwjhyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842349; c=relaxed/simple;
	bh=rvyn6f8vvy6UzLMwfVCqKphO4kyKyLSTh7Q8ToqoGUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZD33DYMrYiGDCTTQlDhyE4vfTdiVARh+OKpUtcAzcQTQNePQvxNvzwtZpxwlAyay2HbsIem+ANXiCh8B6/ngiZhHQ5ZEQoUrzvEvCsPA7D6CIaz3S/SXbQQ5uDQNWprSRXJVjI9eGLs7AgQlM2pQI7qz9J78DXCuvW0naoyv2B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=GVkS+Ylp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="GVkS+Ylp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso15034385e9.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 04:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1785842346; x=1786447146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/Pn7fYrfwB6rmj/rjlsk7/vDnAshiosKPLQwaQozE0=;
        b=GVkS+YlpsDLyEDrrWKeoC+JKOsOEiijK5g/cgUM1q9XJyToKRiTCnzpu58FCAAvTcR
         UwzTjWqvOmB095lieGQlYrYISW7Zr42diFGwnnfESfNhlbxaf9PdIVCSJIwzJjfBzuNa
         Dl1h8/gj47br2UWwQFS1SYwO6VF0QhcuJPXgrW84M/fC7NCNKrZa520K2fUlMyFIRaui
         HlYCXPb3T0cb8K07NjkrswqsWccTnk00ZtME2OdehUokPOCGuW1RTi5V9GSVWIHM+Fow
         w/8sH6b0haIs6qLHZwtby33oN68g1Lf1I7C14nvxaZDb6jRF6HzQIrJtUeHUvl2eR/3X
         4gOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842346; x=1786447146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/Pn7fYrfwB6rmj/rjlsk7/vDnAshiosKPLQwaQozE0=;
        b=OuatqJU5TQDFwpCkH9+gxsXoUxaHlsnogmr3zfq8X/ZkcAlAjq4ghjT43C7l2ufbc1
         zOUqFBU9YduW59tXIbRtt3OJbqwhCIQ1VrI7R8Gg5j+5PoDaFPsN+mZGy9zzPojB3pDA
         3f3rtFsl7m/XE+5sNv08u+1dbcG7kBPDscperzs5eaDd13o0l6yXFVegDzo5VeqUfVmc
         Cn4UTziwlivZBIgryR+xoRVOMuWjgJEk7nBD5ItsSchewRpUNMJivl3xFQPwhhCVsBT8
         fPMQwUjwgbWgGoAL9wcTHCeuQeL0q841H+UtRyPECbB9st5mSNoMvWInxRajdt15OCgo
         UzAA==
X-Forwarded-Encrypted: i=1; AHgh+RofPpactFNEPvWX7bjW1ll1NMrMQk9kf19bLD+gPUxFapVQkwRBka5cyomTEGgFThpwXUj1mNOQg71t@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh+khaAhFFWumja0BWKGqLpjoZDicG56UilVogSAKlQWAg8sNm
	O8B9QH0FPR0yZhZrlJzyTzU6+Z/4OmpvTEH2ZroxTrwma6Ht+VoRIu4QPCL8ioPpIHQ=
X-Gm-Gg: AR+sD1332ha6fpWeQmXCa6IC8eelVaablFa4gT7TW7qipqqoXftfl481qT0dI6/qsGw
	P/MPwtVLUytA3Ds3SzE9fGm7NXLDEy/Wytcdj1+fP7tRcF3Sgjwr/2vxAm9ZyDJW6RYSmXgQVAQ
	yzrjPxSXfKjARlymV+t5YomKH0SIiqSCQbUOSSK8xXRgCvKBzd3dXsy9KsBitgaXhwEi6hH4Hb4
	/hJJ4EsDifByrZjFgLvNYeDCBrwMbJpwwhg67ihH49ZR5rfGM3azZLe2FM/LmhlFayc3RQnl8N/
	ZV8de1UpLgnD+Dim9RPZTsE9z3qFqFm5YJfYBKXlj6gJH+O24F3x9A34Vdtp+oBvoFBMIrZOHPU
	vR5Zjt33wYG4cGuJR48WyvOAXk1GwMnmFpVrXSNVHdjOF9/CmbWK1T+mdZEAL2ThXLXjPnhwXJN
	CedoAi1eFicNjdAUPDrl/O3lfeJugYavod5GXl/y9ASWn/fv4fLCTIPZzwPg7426BhyGAA32+qS
	uHepZHrYE6ll/FarIvkAvy9L7tg
X-Received: by 2002:a05:600c:4685:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-4980eb66053mr241139075e9.14.1785842346425;
        Tue, 04 Aug 2026 04:19:06 -0700 (PDT)
Received: from localtoast.corp.sigma-star.at ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b05fsm44414682f8f.28.2026.08.04.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:19:06 -0700 (PDT)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	johan@kernel.org,
	rogerq@ti.com
Cc: Julian.FRIEDRICH@frequentis.com,
	upstream+omap@sigma-star.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 2/2] dt-bindings: phy: ti,phy-usb3: document aspcie reference clock setting
Date: Tue,  4 Aug 2026 13:18:49 +0200
Message-ID: <20260804111849.92046-3-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
References: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add syscon-acspcie-tx-rx property to the PHY bindings.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml b/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
index 84f538aa587c..4fb017df2898 100644
--- a/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
@@ -52,6 +52,15 @@ properties:
       enum: [wkupclk, sysclk, refclk, dpll_ref,
              dpll_ref_m2, phy-div, div-clk]
 
+  syscon-acspcie-tx-rx:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    items:
+      items:
+        - description: Phandle to the system control module
+        - description: Register offset of CTRL_CORE_SMA_SW_6
+        - description: Setting for PCIE_TX_RX_CONTROL
+
   syscon-phy-power:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
-- 
2.55.0


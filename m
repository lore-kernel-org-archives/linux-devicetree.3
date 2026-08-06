Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E3A429CF8
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007491; cv=none; b=Y+w0fvSy1Ag/GPmu1lEPl1KaWQIsueHasuIP0LCyQnn53EPz5Kq626zFGaXwlpkm4DRl/jzocbzB5zZaybum7d94WAo+3QPZ3HawSYO0PTtObLXMyXNqDtf5mVqmtrvHYMzWPoE8nRnqh0bYThGWkzcuQm7HKsxtxTan+iGzLLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007491; c=relaxed/simple;
	bh=cI+QKB01sJ4DdtWQCPoaol7e8xYCtCQG2DaUHod/dt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VyekWuILmvSFImEGs3tIEtS6kiizn/N19xxPDE3hB7i7Fs8b+am9y5GsqI13F0D2ymR49Y2DRO/7vuqG0ejmJjK98m5Emg8CIPEtYDeb0FdGCrTDPR3lL8kX3/1TMFaQis2UOUcqWGNvGv0ye7jNjtuyjd7OdOYvgM/vpckl9pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=v87kChf3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="v87kChf3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b966dd74so11633005e9.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1786007482; x=1786612282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NZE//qhYVqDwQNeSwWPNbj+8yIctxXpdgXBlE3dRzE=;
        b=v87kChf3qd+I2w51Qq5J+lsp8CYP/VilhE+/WiTuDa3rY4SpUvGmkHzyFG0HTCFOUS
         cl2SqEf337wto9BPe8Egn3Dvi4+/y4ofCkBjptlaxyygor84PN+dU+8731pFPZttnfI8
         qgrxcPGmZF8Dp4hwABuV9WVgKm4nKGb/f32t6pEVGsF9qEV2w3+LW8GaIrEbrLwQruSv
         28BqYzzgzClZa3fPjO9kILLK27VPTTNUfSytfs331K+jiBMagb6R8z90KRwENMUEExPL
         wquehWCVL55tU7X0dLbRgu9+3KWRCELsX890pSOlKe2QLWVu0Hur/51GV72Sk39qD3EZ
         fgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007482; x=1786612282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9NZE//qhYVqDwQNeSwWPNbj+8yIctxXpdgXBlE3dRzE=;
        b=qwGcL58ToogyikgqY7GsUnv51mmLBRWdf5vBp1Y8dHb/Thv8+v5j/gP1/pEIg4oi3g
         kvF3Y4H2HJDtiKhfLbkBPaORAHq8wig5hDJXcWfTyQUmAKwwttlJQWCphNcSld/sb3s+
         /Xq6JetA20zdlERCojgPVT3/FarIfHCq6ONwYGSFmNpA+ikk5AHD2jOZ+Masgoun8L1s
         h1wBTPnevAjPfNlhp+j+JSuK14sGXxGIhs8OTiEkruCMtAxm+JA1bRkhBQ+Ap/94PHFi
         Nkr7y8I7F1fQzdS66AO2EyMEo0ic2tZrFjfGZfRv66UhjSCfWA5PIlnXAT+u4UpCzKoA
         hLEw==
X-Forwarded-Encrypted: i=1; AHgh+RoGrUynu7/LY6AQd1AwqEbansMilb3dQuqfwkOUQ/SddJSxI5UNTF4PoSsvQUZ1E9p3y2mpozdPZ4zd@vger.kernel.org
X-Gm-Message-State: AOJu0YyYdNJpqfPlJfvW1ZXD9W8qHdua+nfClixb6tzgbnpdzRXXMGVH
	enMDMKFoUwiCacQC/yp5LJF97VU5UjlpItcTr3mFR92iJkksvtKbz3h1uAXqjP3WIbA=
X-Gm-Gg: AR+sD10aWBXyFdAP9M3MlTpAH9fDOhQusOJ7pvd0+/3GuYgNTU+TfYRKVZTTCvKolYr
	znc4jWeHZB2fw2GKJ6M4gNzDUXrKocUZu5dq7ICpdZ6cgq+o9lSSSZSeKf2WiKdkpf4w06Be2AT
	bOMKVoz2ED6aAS7II/MB2I8HusyHrfBKf7R/kcaftIRBX/R6wzzP5ZVJYB9GaAe+/2ueDQacz4n
	wSGtGYKRa5bDEbQ2Sq7KlF6bVW7aJp4cp0YZyfxhHzpvrZGspV0JmlHyE13Z8MGXy2nDINcFBBJ
	c6yiogYJuIxSdudJnZcwFqErZpKD3ywDgM3S064MDiNMlj4wOwCJQabZBKW9YoujdllK/zSTIUH
	vYewzCYvzsX9U3vJj0HaheBt8fRte3kXJaHB3umJCHMGXcllDgvI3EICCo5LFon8UcLWYcMI4bU
	wRyBht8PyAryiAC8OCwYMGT1AdEBBjzANT9S3LJP3J3GztczMRNnhBTpnpvbiCtnNpSVu78a85U
	lOw3v3QbOJEJasoPc/kdMn46Dnz
X-Received: by 2002:a05:600c:3226:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4994e7ce0dcmr119162315e9.13.1786007482532;
        Thu, 06 Aug 2026 02:11:22 -0700 (PDT)
Received: from localtoast.corp.sigma-star.at ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b31975sm4035213f8f.33.2026.08.06.02.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:11:22 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: phy: ti,phy-usb3: Add aspcie reference clock setting
Date: Thu,  6 Aug 2026 11:11:11 +0200
Message-ID: <20260806091112.164695-2-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806091112.164695-1-david.oberhollenzer@sigma-star.at>
References: <20260806091112.164695-1-david.oberhollenzer@sigma-star.at>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PHY control logic in the OMAP PCIe PHY subsystem has a
configurable reference clock selection. It can either use
the ljcb_clkp/ljcb_clkn pin as inputs, recovering the clock
from the bus (RX mode), or generate the reference clock
internally, driving the bus pins as outputs (TX mode).

The setting is exposed through a register in a system controller.
A device tree property is added to specify the syscon node,
register offset and mode value.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 .../devicetree/bindings/phy/ti,phy-usb3.yaml  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml b/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
index 84f538aa587c..11787b042345 100644
--- a/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
@@ -52,6 +52,20 @@ properties:
       enum: [wkupclk, sysclk, refclk, dpll_ref,
              dpll_ref_m2, phy-div, div-clk]
 
+  ti,syscon-acspcie-tx-rx:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      Syscon register and setting to configure the clock buffer to run
+      in RX mode (clock pins are inputs, the clock is recovered from
+      the bus), or in TX mode (pins are outputs, internal reference
+      clock drives the bus).
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
@@ -94,6 +107,17 @@ allOf:
     else:
       properties:
         syscon-pllreset: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,phy-pipe3-pcie
+    then:
+      properties:
+        ti,syscon-acspcie-tx-rx: true
+    else:
+      properties:
+        ti,syscon-acspcie-tx-rx: false
 
 required:
   - reg
@@ -135,4 +159,19 @@ examples:
         syscon-pllreset = <&scm_conf 0x3fc>;
         #phy-cells = <0>;
     };
+
+  - |
+    /* TI PIPE3 PCIE PHY */
+    pcie-phy@4a0a4000 {
+        compatible = "ti,phy-pipe3-pcie";
+        reg = <0x4a0a4000 0x80>,  /* phy_rx */
+              <0x4a0a4400 0x64>;  /* phy_tx */
+        reg-names = "phy_rx", "phy_tx";
+        clocks = <&dpll_pcie_ref_ck>, <&dpll_pcie_ref_m2ldo_ck>;
+        clock-names = "dpll_ref", "dpll_ref_m2";
+        #phy-cells = <0>;
+        syscon-phy-power = <&scm_conf_pcie 0x1c>;
+        syscon-pcs = <&scm_conf_pcie 0x10>;
+        ti,syscon-acspcie-tx-rx = <&scm_conf1 0x10 0x2>;
+    };
 ...
-- 
2.55.0


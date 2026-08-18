Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE23238737B
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063398; cv=none; b=VsZ4TTvk7p7jsD0xSyAisp8EujbAAyGRbvHRGdTcE5Ax24dKEN5eYoFs+3nAlzQkBGpPd/N1cbMvWk+nUTz5qqCqIOQ26AAzIS2KQjhAF0ONj+X8tLWpN7pgNj4dnuWE0rZe44Jtt66gWdScigt9YnevzjwxDgQUUgGHeYqGAqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063398; c=relaxed/simple;
	bh=x82f2rFO1TTjFpVekp+USEIM8EAiJutd+tABMnyaNHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPvG7lngRZ8ichSNcY6oO4Tq0MS7J+uQQeyp+WxSk3YSnq7HLzM055NispYxaO3IBBMMI0l+KykpNywjK6e1Ba2PMm0sb92dEGIDaHoxRG3M/znx/tqZc3kM+tbZvCdcNaGVQ5pcLFggOQDp62wmNyvCPLtNDDFlIEIY2gizi7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bI0ZQg1L; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bI0ZQg1L"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceeee8c46bso11292425ad.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063396; x=1787668196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbV7RIHYMEgMD35kCL1q43FBlvr9xDn3Pi9g2Kfmf8I=;
        b=bI0ZQg1LQ5SeEZaOlzPm9AzZ5T75sshhhzLFD6tShHglSZYq+rXdpfTG80JJ4/Pcum
         zmPq3ScbI0AjfMucicRPNrwFUS1P+nCSkr4E1uBAeJSUrdc3/CM7Y1Fe2sgVa8whZo2Q
         WzjqmGcCHDlozg0Xqx7wf/LjMA0yy9wi51y9ws4HMMFwBjzVem1pgawrsY/K7l8NoWoq
         rqjAcBWQODy9w3Z+VuPiHEFTaOBLe+eR3pwTGtyxOGYtY7hNGZiZvh3lRShu/liEbXn/
         i04y21Xxq6T/3Ba12Zj/m2xn7FGztkhl9jkUyXcNlFVZRlRCR8lPExB6JV0aBRG7MuCv
         J6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063396; x=1787668196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbV7RIHYMEgMD35kCL1q43FBlvr9xDn3Pi9g2Kfmf8I=;
        b=aNae1njaQs4ATSnxLiDndOo49yc2EWRxsGM3tGyDTwb6Aq8TSbdr2KKM2Zvxa21LYz
         ZQnImnvuZMMP2erKkJZcpKabyuGBHxZxevObwJ0l6tJixS/yegBwXvmF1YkMzyyNkDmd
         kZdHVUiUM7XUHE4Ad+q3NRmp5AoIWSpOXH5jTi7xclWjNgB7HTRUVrMOSsoPwyyRKCJk
         Un7WkNViFkT5Gb1RE68E7yFGugW2HnvMrk0PpvQp3ZGfiaLfZxJ2DXrmP3YzsvMKnIkM
         ulNXvkrxQG+fphPnueEsKTY15WnX2lKlCqr3Ghg5M3ygxXQxPuKL4swa4HEUMycnkHlZ
         a+qQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIhX9lC8jIoTK6ivoDU+0U/zwwONbDMBHDHK/ej9FifRyHmshxyvAt5o0iYrqgpeM0vTKAfkLXHrmp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2+PEWkm+YDfH/xdzL3ljFLI1TZGaAwdQC+U2lnvOVvodySOGv
	izi1AbAUzKrPHKIR4HVBQ2ocmv/ajlrXjGqwDE+9nP3MzxZgH6w6tICO
X-Gm-Gg: AR+sD105ZG8YgvUVsUTcElxJ9LvG8I95CgS207WEaSN3xfq/0Di2l5e9m6wygo0Lzpp
	SOB1teBE43uNtbsKh86k4FBlgGWqDmIsPzkfuF2OyQouOfMtrtaJonO5U+kCggvZHGH6iL/R27O
	DBppDK7vaHUxxZ3CegCsp+7taeFOj16zBHtQmkschXhMq7euwbHD3I8LfGYa4FIe9b2wWZ+wgq7
	IWKp9FiVHyC9BU/LwQ0tLqoij2MBBcVnIApMaMfpNdCnrNGJM7YTxbjMvsTotVYapz12FcEihSI
	LgpX1e1/7UVqkEGu6nMZjsxo47IsJJX4uif8JyjtvrWhAzd5qlraOUX+8GR4e/R/lzvjMSS5vMo
	158iFaor27W4fuQbpLUiFSB63mkyDckteUVZgKi11HMkyX8l5WwM2zyirc6TjseQpbAlQOhFqbn
	Z2sFEy3u2oUKZnIcp6IknJPtphh5KKTePGyh9jAXsAmUddeL6TMwqQYzwxf1UBTZvZl/MdY0QH
X-Received: by 2002:a17:903:2451:b0:2c9:d298:6c0a with SMTP id d9443c01a7336-2d3b0d7af99mr259247595ad.2.1787063395970;
        Tue, 18 Aug 2026 07:29:55 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:501a:6e15:dc3f:c23f:e55e:d03d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327b43d488dsm9043527eec.29.2026.08.18.07.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 07:29:55 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 19:58:44 +0530
Subject: [PATCH v2 2/7] dt-bindings: phy: ti,am335x-usb-phy: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v2-2-66fd44d66824@gmail.com>
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
In-Reply-To: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Siewior <bigeasy@linutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>, 
 Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787063337; l=2477;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=x82f2rFO1TTjFpVekp+USEIM8EAiJutd+tABMnyaNHw=;
 b=sEuhDNSAfdBHS5mDJZE37ho8OYAT2uqjvOXGzw1LAuvfii4SuSCLU7ba2h4sAFx31yOczsJ2D
 G/PaEK37gq3Aq50W06wrpN9eRGRBiRUA1FB4xK1Gl2W6MS2H+4a/Ekj
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM335x USB PHY text bindings to DT schema.
Add undocumented vcc-supply property to match existing DTS usage.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/phy/ti,am335x-usb-phy.yaml | 49 ++++++++++++++++++++++
 .../devicetree/bindings/usb/am33xx-usb.txt         |  9 ----
 2 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/ti,am335x-usb-phy.yaml b/Documentation/devicetree/bindings/phy/ti,am335x-usb-phy.yaml
new file mode 100644
index 000000000000..b28cd42ece5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ti,am335x-usb-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/ti,am335x-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM335x USB PHY
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    const: ti,am335x-usb-phy
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: phy
+
+  ti,ctrl_mod:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the reset module node.
+
+  "#phy-cells":
+    const: 0
+
+  vcc-supply:
+    description: Phandle to the regulator that provides power to the PHY.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ti,ctrl_mod
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@47401300 {
+        compatible = "ti,am335x-usb-phy";
+        reg = <0x47401300 0x100>;
+        reg-names = "phy";
+        ti,ctrl_mod = <&ctrl_mod>;
+        #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 8431de346129..8832843c7d7c 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -17,15 +17,6 @@ Reset module
 - reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
   the USB wake up control register.
 
-USB PHY
-~~~~~~~
-compatible: ti,am335x-usb-phy
-reg: offset and length of the "USB PHY" register space
-ti,ctrl_mod: reference to the "reset module" node
-reg-names: phy
-The PHY should have a "phy" alias numbered properly in the alias
-node.
-
 USB
 ~~~
 - compatible: ti,musb-am33xx

-- 
2.55.0


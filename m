Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4A425897
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785778351; cv=none; b=mPtYyCHgASF95qIW2gr69xdeV7wRHzay7SQl8GJsjtsY5yIGUf7fa6JfrO/fjX94q14vvEKFJ6gEDMpk2PEnhgdByrogjbZ2wExvfTZuEOVw2cUC3bJjmTx2Nq13PfnIpJrYF7LkMAHIJPt3tJGfi5BGcHXM+3nyfpcXwHm/G3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785778351; c=relaxed/simple;
	bh=wWpBNc6BxWkqVoO6oeJahIhF95WJn6KMiQW3lSHoUjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhNAX2CDZNRVsw8hDBzlikbMTtznwbu0knYaare7DstJ3CtKb86IG47+Lm9R4x1hBiroe7ljQk7X3mnadBuBnEiyA4UK5w5JtpAcNoXLAYnFDLYr6gmUX1VHA8s5eaXyKCOjnVWWZBIBFCM19jMz2jw0u9jgM3dOVf1H09nbn2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P51j8aY1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P51j8aY1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495590dde14so23978215e9.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785778348; x=1786383148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LPQS6tMBZYVLWJlki8rMIsiVgDBwXQovUEzCbj6uYE=;
        b=P51j8aY1TorfnEkdOAnbevGKyCrWzFPQ87STWG7B4crHgmIzVa7kXNpzJGQOQX+tFJ
         f/lINpzV54QTyywkcviDHK3TVkHzf9SEVMppmtYYm8+6CZ39ujHpG5UW1/vhNZReMmv2
         O9f5lIaNJsxa9C54euYDfkVGNg8LSF8/X+SB1RPZRiyhSV6o3u9LOPKi1hUKBWqXsB1a
         H6hDJFWvs/VOFtGwSaYa4pYtNL/nalRnOnHS63/gMwHZRfLm+++otMmtdipgxN+baaM6
         0Us+zRC2AqAtdTUwRSVchUn9cmLUt6nk6bbEqqY5Kgs/PCY5Ycll22Z0hmGgDpqGQCPz
         cmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785778348; x=1786383148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LPQS6tMBZYVLWJlki8rMIsiVgDBwXQovUEzCbj6uYE=;
        b=s/vmemvxUVfAzuSIRtXBUg/XVG+DWs4qvm7UgRjo4mTsOaTpIYD3vLJ4C6m11ivmPQ
         j1IW12su0kLAURzlUtW/KGHHaSEM5X4vPB7N5bzZGhQ3+3FWzXcdI4U6dYSIui8JR0ow
         5OyfWh7ji5516aZ3GyF0PhVcaH7+Hl72UDXhmPqBgfi1+IrjEH7Fwox3x5wmbXAC76F/
         KYp/vXGQp5WGhgrUMnS/zOPHdJETcv33aTarl+Y7BGFN7I39ZBJv7N32FP8Gvi9+XiT8
         uNS8e3yNMZvqcCJC+/7yIrAD+YfQdXY/Ok4M9f32/9KKzNq8Hj5k6nRY6D9Kam7JzsVp
         5RjA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0zCsc9Nx5RwcbB+JXhlGZzOUy07V/YLtxd3ESq5Ib+bdlKoD6rZ8AOli/aNvnMVJf2aclgocCGHLn@vger.kernel.org
X-Gm-Message-State: AOJu0YxotnD5Izk372JFBlLoCGFnJxUSTRuwRjTQBxFkqCr36mtRn/m2
	pqiK8UPn6aPqXfhlqyzSvMO28xTf/YO3tjKDYg6zjAL+nHU5Tt6q9UfEoo6xgwN6E8k=
X-Gm-Gg: AR+sD10RVKjiyNznl/Bo27bboEcwv3t5rVlbsnEvkOTH8O6uIv12NmUaBABhnr+mmBY
	2PSt5Ucx4+6yEGkAAkhNRpGxogreCHHyZR2m9ta/j8av4AMk0RNo3LOgkemkZesC9qNwReq+73Q
	Js5odb44KUz8KRUdeKvRUBPjb1uOnSE+bO9o03VldohrCUn/cvLlr/IqISRJWTqp3LNhXmWAT0S
	mP+cN+1OMgWNDucaqMInNTy/aIpMnXdSuJ9cSaJYxY8IKIdm9W8Z2KEq9Af40hdc+jZYsMbRPTF
	41Ie44Qs+e1SKVkxDEzhnlVdRQN/JFWtI9Ty5okVGsiTXAPgRCCo4k/63oHeIwzDQhBcioNNEso
	P8lh4LLSXuiwcM8BLP5wpQ3JdjWBf5P8pgLaP6nLb76VLjy8VECyq6uYeGkp3GXGVYmEwsZyB8w
	HZzY9K4qDRl0TToN8HYUfK1cJYBTyzCaUSZPVNd5AxQoIXH6t4S4YtwXAoKbDCIZZnbXL3LKD4x
	Z41qFxCEJvjezVZi2wL8HP4e8s/2mCuJfZvXrJu2LeJNIZbIoOTRoARk8jOCE9ui4owbecuoL7Z
	sot+D3sPN1m0Sw75RHaMUQuPHvuTmO3vJHLfYSMlkvS4NVnYWpoFsr83ZtRPjBDyRtGjwSVlWfZ
	LXMgnJbfrHtLgylv307fVOSf3BE+pddzdZUPp
X-Received: by 2002:a05:600c:350c:b0:495:4d00:2fda with SMTP id 5b1f17b1804b1-4980f23180fmr188978875e9.2.1785778347747;
        Mon, 03 Aug 2026 10:32:27 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808199a68sm176259975e9.4.2026.08.03.10.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:32:27 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 03 Aug 2026 19:32:25 +0200
Subject: [PATCH v3 1/2] dt-bindings: iio: dac: add support for mcp47a1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-mcp47a1-add-support-v3-1-540e71b4fd2e@gmail.com>
References: <20260803-mcp47a1-add-support-v3-0-540e71b4fd2e@gmail.com>
In-Reply-To: <20260803-mcp47a1-add-support-v3-0-540e71b4fd2e@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785778346; l=2425;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=wWpBNc6BxWkqVoO6oeJahIhF95WJn6KMiQW3lSHoUjo=;
 b=mVceFDVBaFVLylHV6ll9I0bhPKHpIffShIK6GlePRJfjWkyrR5NouPejfQt6bud3QQgKpJQM9
 x6KkhSvDltZDuRx9UxfAq7yL0GYXKkxdMmEUXvRIl+0fETlFOIz3I7l
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converter
which communicates via I2C.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 .../bindings/iio/dac/microchip,mcp47a1.yaml        | 50 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 +++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
new file mode 100644
index 000000000000..b181fe73dce8
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/iio/dac/microchip,mcp47a1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MCP47A1 DAC
+
+maintainers:
+  - Joshua Crofts <joshua.crofts1@gmail.com>
+
+description: |
+  The Microchip MCP47A1 is a 6-bit single output volatile DAC.
+  This device can have different IDs (0x2e and 0x3e).
+  https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/25154A.pdf
+
+properties:
+  compatible:
+    const: microchip,mcp47a1
+
+  reg:
+    items:
+      - enum: [0x2e, 0x3e]
+
+  vref-supply: true
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - vref-supply
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          dac@2e {
+              compatible = "microchip,mcp47a1";
+              reg = <0x2e>;
+              vref-supply = <&vref_regulator>;
+              vdd-supply = <&vdd_regulator>;
+          };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ce020ded5fd3..8c8118eb4141 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17699,6 +17699,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
 F:	drivers/iio/adc/mcp3911.c
 
+MICROCHIP MCP47A1 DAC DRIVER
+M:	Joshua Crofts <joshua.crofts1@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
+
 MICROCHIP MCP9982 TEMPERATURE DRIVER
 M:	Victor Duicu <victor.duicu@microchip.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.55.0


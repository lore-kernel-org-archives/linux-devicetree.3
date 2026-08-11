Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F4C417BF9
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436866; cv=none; b=d/k+Kx+GrI9JK/pNFEEW1AaS4UH/Y0uPnCemKRkbcZzHBhAD+eVXBReVo1A7t4n3lxCwh0uLZu3eETlEXStSwcyz9PempBBsmblQ4pXMGmp225qbJFgKMFPABrntHW+QXcjLdGPE7FNTwN+AbhtUCTdT6oTHPTTP0hShRSg5Pfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436866; c=relaxed/simple;
	bh=vXJST93REa+QH10dPJYzmKclTq5eGMoIGhB/tPIJFyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMsZa8bDWh+at7M5BMz4PPnhx7VBQf1cFvIZdyRftr1Nur7LQSIx6wS7Sl7N45SchxQ9UvOK+X7FIbCP6cUplK5wPQHEwo8ozWhnCT+KWZis9dkdh+tkko6MPdmVw3WvPCqFPJU0i/iasTfyShQ2h4GrPBmF4FQ1CgZklx5JjoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRQKYwPQ; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRQKYwPQ"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-495b250b01cso1465931b6e.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786436864; x=1787041664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=eRQKYwPQkwuIOgUrdwlGYAttYx/t6TpLuMDF4MmhipnyHkZzCaG+aFt9NeSu6G27gJ
         yWfkkpOPtWog7NJs7IP2BntC9XvSTpxeKUTX3oN6BKsdlCkho0lisOjCNfnKYXy5dvOy
         ln6JwvxOfJLVYoB/w2v4KAwqMQZDqCtq7IlGcXBjknLHdM6VFyy4mIhwMRbuBe8ESebe
         gVtcBm8shiA50KYjfEA+yTogqXfEu/cPPhPOrjDtrYyV/cyXbk8XaM1T4+i7q+FK8hv7
         5J2Zmgu7erOB/IWudDjvv08I2xTQ+8sAYwulob+tGJUfK/oETjWJxLI/gnffPZMnjZr9
         16jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436864; x=1787041664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=FYIEoOkDb5hNEe8Qe0FPHDp5I5OYGOjqShvdRAP+aoSC3x+mcQ2VnwYDJBShOy/8ms
         5gMkZs7riLs3mazWK1XmOU0tLJ449tYt2iqg0cWyLtgDgS73i6pyl2+GTO7e/6z5KlRh
         43QRgp+1JIKMORuH0i2vGLVBDkelobLgFNSDlhi/78eRyG1jJtZLti9tZh0de6cfIett
         xA0H/wbvG8iSfw2+qficvh4niryOobjD2RiJtPTALtytqtVfqjiikrqfYh1gzVcV7Kln
         BV73e5mAp2jSQnRmoUiD5iFr10QZocrm6VdwlfJXEpVAG4Cdie4oYTAm78+qIc76spW6
         jeAw==
X-Forwarded-Encrypted: i=1; AHgh+RpuTlOWsJW4E48ALQzlldTWGYsMPfE/cAP0z3Ea/Lm6aUKgYl4y7vvAukV5xxHiXLvco39lcx29/pv1@vger.kernel.org
X-Gm-Message-State: AOJu0YwZjjvmdBEjeZ1K3kaSSgdknkkxMcj3gi5Ka5X4sZEKKLwhQghz
	NuCGXbhVZtSumvPZ3LyV8I4uZ2LAsMZdVB0t4Mvc2KDGUvQIrZazxwDOKm4gawko
X-Gm-Gg: AR+sD10nqI+VUcDUI5cIPJ1XSunVk8ej8stgHwr1daq/LyEBuHH+dEq+WqO5EK4XYNZ
	mPYTQ5RGfwHjvlPm9KaG6PheyVf9WVNxq0IU0JXFtzMe3F8Jqm+DTbQcrSBOeoEtDsaQVufEcq7
	F2583LigAXBpNklkqYOAhLhAedQwXrA0mTcicBtagslsaPNQxxK6JbQSttSJ6UriLPB8ZdEc49r
	RL6fxSaOEKiDkK6sdplecM1UpGKBSI6VwJO8nVxpQ5l2PDje7u2BDPBejvoLwAjZnwajZkQRMfo
	lcMJgopcdLRtVzwId5cSzo5VNVT3Q1aLyKqfXvuD5pQkvJpV+UW/ZrR+xooWusFIvjsti+3dbpX
	I9vjPs73SuoO0LWo2nL1gGgXyZ/cQnqfnq9KhvrpREfArzIDORG7aT5J70GrDElrUzO7QBt98cL
	AiDsulkIHRm5DNdB9WcpHQIfng0lDKQqTYuAaT1zil3DkNzrRbEMY47NvkUocaRKC17yxdoW+w5
	Yn+oKCmFUuE+l5AcQZGkFftGedpGF9GqnY6tQCDgyeFDB0Je9HFsqRmIG8cI7aBgVUaxLnFTqL/
	h0g05S7shMSSacRvXdz1ddEDH1RLVHqrk6BydS4EQCBAkegsaqcfTntODCnp3myE0TGFWmIesnq
	3WK20KHD8KfW5mdwmPSxPgadniajX
X-Received: by 2002:a05:6808:bc4:b0:4a4:c12:46f6 with SMTP id 5614622812f47-4b1fd5ef03dmr1111568b6e.2.1786436863681;
        Tue, 11 Aug 2026 01:27:43 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1fff55fdcsm318095b6e.6.2026.08.11.01.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:27:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 02:27:23 -0600
Subject: [PATCH v6 1/3] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-ac200-mfd-v6-1-c5b1292c8498@gmail.com>
References: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
In-Reply-To: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device and its shared input clock. The Ethernet PHY
is represented by a PHY package on its MDIO bus, with a phandle back to
this device for access to the package control registers, so it does not
require an MFD child node. Function-specific supplies belong to their
consumer bindings rather than the shared parent.

The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
matching the rates encoded by its documented clock selector.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..609831b15c80
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+        };
+    };
+...

-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571378;
	b=vgjDkj0QkOI4PGtQceW5IGDRiO5eR1WB/6GwxS+inZ5nUsSH/Dj3T6gp6+AfEktZy03d
	 MNFLC2my0w8i+BSRNErLG8m9oPJGGAu/6WzE9F4VbbA0Eg+wTj+CNEEYSASR9O+3tUvC5
	 cbE5JzuRHX5O7yDI42gVWFDgiHPlhILFwxjyOQq84lkOfy86V22Vr3fmJ2w3uVaNOm9oQ
	 DMt9NpEAXP1GyQxCnCW1wmeo6N7BLjJzg8RDKETTiTHjBdDL71usr1nq4ovIdXL7xf4Xd
	 VepyXytAM4AzPKbClCYrV8NUMjs6Hks/P9TlxQNyS9BfgyFzvZ5qyevcmJBwMIlgQpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DFD1bkt16ejdNLLmjMu8b88ZfYjN6Jbfkg0hGxrurxE=;
	b=n/sJszKpiwd4u6yUx6jGUjMCa+ZcG0lM5HoA4txCs4JpbTD4SwEVT8weD7oVwDVVyfS0
	 XBAeYir2lYSKUAswZMJsfHqjcNHOqeLJkZBQriFKHLoPzdfs+Tywabknt4HBTQaKwOcJv
	 1dpDehi+GSPn9HLMohEwDy8RI8MuAxZL+gf898iRJ83aNccXpXx2zsks6qcsTuqClI7Wo
	 i46SZ7vvDpT+4IRJVn51gQessI+lLA8AjsdFdJuWw+oyeeluVrL5oZxGo97ZPrKoWpmNx
	 k2oFW9q/Hls+XyMEc69HW0kvz86Ry5lWp34hWSB5hv7/rtoejtWhT/umqXpd88G9+Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IhTH5n1B;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EFA606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76EFA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IhTH5n1B
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36681e85e87so900845eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571376; x=1793176176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFD1bkt16ejdNLLmjMu8b88ZfYjN6Jbfkg0hGxrurxE=;
        b=IhTH5n1BAEzIcU1+4ct2ARRUmuXvLa5lwoTLDfPTw5a070TYCjva88wL3iNauAgScb
         2BzyCmw2TtVHPscNk70iPI9UjZkqDdG3wzb72Ztfw4WQoqfApfZmWrKNNofbLyFwpkMW
         /Mi4MnYZa5qbsgIVWDenoSVtFYg44GxGJ7AJnVMCcGubl+lpF+DQYS86hLPgDuapXuyc
         TMOvnAHNA6nYg4On6YOGzuKx3hc+59x/PKcMmd3720X4/66rYiyJwRECINg1hzGI6+yK
         6EMwIEm4wEncI3PtNXIDD8oeKhsDins/AOFGVtfx7vk6TioFrFlFPYBH0hl6Amty6JU1
         h89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571376; x=1793176176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFD1bkt16ejdNLLmjMu8b88ZfYjN6Jbfkg0hGxrurxE=;
        b=enr+Tr8EHz+r4TJRlFYNdkwlDomddyC7MvttPRrsuYGmEbhjfMuafB4Yp4hT0dgV4u
         NRDCjFJ7n126TE28DyJDCUnYyGC0gcrZhcZWDRJ+TlVnq3LX7wvwrG1CU35ymC7U+2wT
         t0z7sWA08ylUsAP4e0TYNT/jRGbZ1YR9XP19E5eOjd8SCYv0Fb+uHc34x+ZJ5QzSngs3
         Sr3FWhWjhZJeLFW2cwXj2iD399AgGiiXag7ioAnsNFUNknRWBvE1vDESh1NnbaeZv6dl
         OzROBKQrQx0Lnect8eorAQciG53KKN1wFbd2sdxZdyPJw/QRGPQTLcHF9JswJYMbGOm4
         gvSA==
X-Forwarded-Encrypted: i=1; AKwUvBwjbV9f6sYgBhpH4V8cwpwEgAUNwMzmSju/FeANEq6lA3KaZtIC1ztOEnj7XgebfB8CFhO10c9PV17d@vger.kernel.org
X-Gm-Message-State: AFq9FYJs60yW32oscq7g8pmndneHaHzlCuoZKrd6hY/kWsmL6Q1P47IV
	xEn3h9SEmBc9sUm0KbivjOkG9AKRddRlCStiX9mpdzCpRHNL/BsKSEMO
X-Gm-Gg: AYBFou1fTK3mrnVVa9ThyQVSvz7GIjPt/y2nYH/RtxuKO5gYxx7FNpsOJvf2JT3oqdv
	uR4YgRmdIP6BXrGF+CsguHAlrFujmS1BBh3Pds0BMsBIWrJtkMQPFyPhzbB7xLRsdcXX22x1Ulu
	n0ImZTZJ6MKrL92IQDWrgAesys3FvZz7qmSWH8JmTh2mIEo3nnNVpsXzx+d8RBjgYpgy0wDg7n4
	rUZ293CbGpe8uov3Wty/ivv+cgwvjGFo48LaPSBPJsupB6MhweelnC5t99tWPnYMMli4hrEjGFl
	hcrJIP9jBfhymGLttg7Qn3ayL6posBBJXbg66G2+r2qjKUNcbaGCjigzByt8CLYJat7bljIDMCH
	8lWQBOp9BJ/AqT6j2f+zX81dLP56Y9j9UuVROFSz7JNgRVe5pSzdK05RuHbK3dEHdiU+6JVHx3f
	w1MiCHJSL8Iij3KInDA9ikH5vOmVuG9eQ1fExYtJFqzL1qWcG9twP8IVU+Exh2xBmiJRqlvJrpT
	UdDJsvAtIJqa3Qo6+LtxjISPsL6D0mnKWxUx9aRg+9YdgP0+8RbnNRjcYUcL+czffHju0dckG7c
	MkjIWYmbVFPaW1fRgIBXQR3pmqVFTj3DdoFIH8CXqEmdFw==
X-Received: by 2002:a05:7301:3896:b0:366:2893:7421 with SMTP id 5a478bee46e88-3674d84ddb2mr2458844eec.10.1792571376399;
        Wed, 21 Oct 2026 01:29:36 -0700 (PDT)
Received: from localhost.localdomain ([113.161.48.203])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405edd7bsm5199132eec.6.2026.10.21.01.29.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 01:29:35 -0700 (PDT)
From: Adrian Nguyen <thenguyen1024@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Casey Connolly <casey.connolly@linaro.org>,
	Adrian Nguyen <thenguyen1024@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: power: supply: Add Qualcomm SMB1351 charger
Date: Wed, 21 Oct 2026 15:28:40 +0700
Message-ID: <20261021082841.79147-2-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021082841.79147-1-thenguyen1024@gmail.com>
References: <20261021082841.79147-1-thenguyen1024@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm SMB1351 is a switch-mode battery charger with an I2C
interface. Some phones use it as a parallel charger next to the charger
in their PMIC: both take power from the same USB input and charge the
same battery. On the Vsmart Active 1 (SDM660, PM660) the SMB1351 is
powered from that input alone, so it does not respond on I2C while the
input is absent.

The SMB1350 has the same programming interface, and the two can be told
apart by their version register, so the SMB1350 gets its own compatible
with qcom,smb1351 as the fallback. The version register of the chip on
the Vsmart Active 1 identifies it as an SMB1350.

Document the chip with the battery it charges and its STAT output,
which it can drive as an interrupt line. On a parallel charger,
power-supplies refers to the PMIC charger whose USB input also powers
the SMB1351. The SMB1351 can also be the only charger of a board, with
no PMIC charger to refer to, so that property is optional.

Assisted-by: LLM
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adrian Nguyen <thenguyen1024@gmail.com>
---

Notes:
    Changes in v2:
    - Drop monitored-battery from properties, power-supply.yaml brings it
      (Krzysztof)

 .../bindings/power/supply/qcom,smb1351.yaml   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
new file mode 100644
index 000000000000..468899c15fa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,smb1351.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SMB1351 battery charger
+
+maintainers:
+  - Adrian Nguyen <thenguyen1024@gmail.com>
+
+description:
+  The Qualcomm SMB1351 is a switch-mode single-cell battery charger with an
+  I2C interface. Some boards use it as a parallel charger next to the
+  charger in a PMIC, taking power from the same USB input and charging the
+  same battery. On some of them it is powered from that input only, so it
+  does not respond on I2C and loses its configuration while the input is
+  absent. The SMB1350 has the same programming interface, and the two can be
+  told apart by their version register.
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,smb1351
+      - items:
+          - const: qcom,smb1350
+          - const: qcom,smb1351
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      The STAT output, which the chip can drive as an interrupt line.
+    maxItems: 1
+
+  power-supplies:
+    description:
+      The PMIC charger whose USB input (VBUS) also powers this charger, on
+      boards that use it as a parallel charger.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - monitored-battery
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        charger@1d {
+            compatible = "qcom,smb1350", "qcom,smb1351";
+            reg = <0x1d>;
+            interrupts = <61 IRQ_TYPE_LEVEL_LOW>;
+
+            monitored-battery = <&battery>;
+            power-supplies = <&pm660_charger>;
+        };
+    };
-- 
2.43.0


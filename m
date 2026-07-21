Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC5F4611CE
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627834; cv=none; b=ZHXM0RHvrDmUkDVuYFPTX4GJ/eAl9IPR6T2sRlLHjWe+6g/Tfnu1Jea5TVGe5M1+xqdV2G/993DgfQ1F/tnn/FdZ3kbSdL4EoKhi12rDRZ1LIkflb6cp2LMUeYaKV/bU36HIPK1rdijF/l0bIGc4JCsZEbc2GFTG5pvQ7ptEeQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627834; c=relaxed/simple;
	bh=EC9J2p+NWdZDh6qYGElGwH6uNYtFbFpKeCl/eqIzYmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4Zou0HSlqoPTmZm8k47JnXpEAewzT4sgtFaL6O2seblEftn+APD4/jRw+jNg3cRVH6ISvtKgt334+XAqytK4kYXqppiTbXpTKY3LOR6UpdkEYnYzck51BgKloZGBMHu4Xb+IWEnKThjFguuSirR5rnyTyeA+kIXOnfuvgvgTTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xo/KaNlI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xo/KaNlI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954d29264cso16895315e9.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627829; x=1785232629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYy6S/jtdoMDjLal5OCIm5ySlpSkJxRegyQDC28P/fw=;
        b=Xo/KaNlI8nNPRqU3PJjLcJYq5veMq44xxwsQjdCRR39E52ZxElB7q1k+9mQEvatlCW
         LEgxtKFr4YFxX9C4JvbN2R4OC8/QwnnfMoy70U9MeWC2aSj4q+YzjklEPxDyfyF9DIsN
         gZEszJ4eZqyd2UjRlUehU8n5xlxWtEJfvUT3p+DbF/5Afb426NIz0hyswgnzVmNsfcfA
         95MS2pIiYX0ZS+O8jn3SjFMVtbKdw8etxoJqnkVcJ96XFxYeU5Gr3yXoXot5Lm1oByL1
         oOLMxZOsYJLuJgtbTmkq8ji5Jn7cNAw/1u+3mEXE2aEIe4pzkcqkD/9zrV6mlPj/uicz
         V0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627829; x=1785232629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYy6S/jtdoMDjLal5OCIm5ySlpSkJxRegyQDC28P/fw=;
        b=MPlM0HdrW1txF32+JSWCYB43f76OgUEig1gZEm+lT1v+Lro94xL3GbuCatfao3z7Xi
         B1Mb5SgmQFFowVz+kmwJMEAKoUIbaPiskeqMCegxmBruJbs+YlT5wGQj9smkn53e2tbF
         7n71PzyWTElgWvhPL+ErMv9LeHI9WLFuI7x8PuK3b3mY82X1rdUOK8t2CxLT+5X/Wuh2
         +HMHrTs4qw2qzs0i4Wry0uejMV9034FHm2ZWEIzearcU9Hz+CYGZmFtVMwk3snQCPVbt
         XFkL+2bi6/A2ptBDi77H+njW4RyIF+SAxAhpKBR82devSLthseTLm+huXfMmpcTNYLuY
         ZKVA==
X-Forwarded-Encrypted: i=1; AHgh+RrsrHLiVvgVuPH8hMXXCxlgGWFkgCWC+4qtQvj4xZDEftzY/YSQMU/Cw6akMEXdmpQHIllJWzBIVmnM@vger.kernel.org
X-Gm-Message-State: AOJu0YzEsouDdDA+909s1WdwtA0gcLh5C8QKYg3C41lULBjLxe93ur8F
	30WhUrVIiJRRGOGVXUninhRos6HHtz7+m8t0cEWLoiwy6rP/QmhlaDTt
X-Gm-Gg: AfdE7cmXW8CAY3Ilt1fnNkxKHLKbpVe6Of7cLKXpNa261vkecW7n+f8vYvc/5dcEZj9
	1J1z3q5kH78+2zCij7hOkstJHrB7p0WL8bx143sTT4ThWPkx5HgzZfb27nO8swpaieDcnGWk4vS
	48tJI8Rr0C/4M8VAjYG9s5NAtnQLlIIh8t3zI/e7c179nBLh9kW+mlQo8cm5OF+JQFwK8tX9bpQ
	8TcHToEGTG08ze7FLoCXsJ/JlkZOkrriac/hUvDqD1eulO/5Em3d6ufs5lMFtwuDvhHL3bL6qKE
	DTiwVrQsLZgBqgxS4toa51+0PnxewexJoFi8WZu5hRnhCTXOYvdKkY1lTW7O8sflreGY3bZ0/J1
	u/qIyAK/ZUJqk6Hn3ZzAz7/1ee9CW7k/4XSx5ZF88sDNl+O0Or8sWLIzlB5Jlq6tn1u3DawtVPp
	7UFevG3wBjsXd2b3OV97EEQE2TZTjvIM60YA==
X-Received: by 2002:a05:600c:4e8d:b0:495:54e9:c080 with SMTP id 5b1f17b1804b1-49554e9c2bbmr59276625e9.31.1784627828522;
        Tue, 21 Jul 2026 02:57:08 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm227476185e9.0.2026.07.21.02.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:57:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v7 1/6] dt-bindings: leds: leds-cpcap: convert to DT schema
Date: Tue, 21 Jul 2026 12:56:48 +0300
Message-ID: <20260721095654.429346-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721095654.429346-1-clamor95@gmail.com>
References: <20260721095654.429346-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert LEDs devicetree bindings for the Motorola CPCAP MFD from TXT to
YAML format. This patch does not change any functionality; the bindings
remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-cpcap.txt   | 29 -------------
 .../bindings/leds/motorola,cpcap-leds.yaml    | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-cpcap.txt b/Documentation/devicetree/bindings/leds/leds-cpcap.txt
deleted file mode 100644
index ebf7cdc7f70c2..0000000000000
--- a/Documentation/devicetree/bindings/leds/leds-cpcap.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Motorola CPCAP PMIC LEDs
-------------------------
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-Requires node properties:
-- compatible: should be one of
-   * "motorola,cpcap-led-mdl"		(Main Display Lighting)
-   * "motorola,cpcap-led-kl"		(Keyboard Lighting)
-   * "motorola,cpcap-led-adl"		(Aux Display Lighting)
-   * "motorola,cpcap-led-red"		(Red Triode)
-   * "motorola,cpcap-led-green"		(Green Triode)
-   * "motorola,cpcap-led-blue"		(Blue Triode)
-   * "motorola,cpcap-led-cf"		(Camera Flash)
-   * "motorola,cpcap-led-bt"		(Bluetooth)
-   * "motorola,cpcap-led-cp"		(Camera Privacy LED)
-- label: see Documentation/devicetree/bindings/leds/common.txt
-- vdd-supply: A phandle to the regulator powering the LED
-
-Example:
-
-&cpcap {
-	cpcap_led_red: red-led {
-		compatible = "motorola,cpcap-led-red";
-		label = "cpcap:red";
-		vdd-supply = <&sw5>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
new file mode 100644
index 0000000000000..c8e7b88a05ccf
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/motorola,cpcap-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC LEDs
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. LEDs are
+  represented as sub-nodes of the PMIC node on the device tree.
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - motorola,cpcap-led-adl # Display Lighting
+      - motorola,cpcap-led-blue # Blue Triode
+      - motorola,cpcap-led-bt # Bluetooth
+      - motorola,cpcap-led-cf # Camera Flash
+      - motorola,cpcap-led-cp # Camera Privacy LED
+      - motorola,cpcap-led-green # Green Triode
+      - motorola,cpcap-led-kl # Keyboard Lighting
+      - motorola,cpcap-led-mdl # Main Display Lighting
+      - motorola,cpcap-led-red # Red Triode
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - label
+  - vdd-supply
+
+unevaluatedProperties: false
+
+...
-- 
2.53.0


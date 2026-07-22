Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D67B38B130
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739638; cv=none; b=AA56UknoYEASxsDHwMCEo6y57+5l+2hFQHGeYWlXY9/n7H/+sJ48ztp0F00NsHRwdBuofaBrZxusKuQgUo7FXG/XcTXHTig/X7/gxuzO+ugVYbnolBoNgUNT2v1Z/hWs55saeiLgyai83m3f+addwTZH9OfHCNwXbJSQ78D6fjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739638; c=relaxed/simple;
	bh=DBMoBYoiDqYJ9z07AasAMhfYkt1PvgYd+LjSuKM1ePI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOmUz3Cb9idTMknT1XanUVLtUBHu3Tgk3a2MOmpJSYcu3XGhZc+l8Tn/+p2xMXFPiDXsShSG1UCUnvT1yB1Hu4ycWNQCgY1gqLmm50JLswDJoju6Rt13uuOrFYy7kzfATEbL50Gx9N/cmGBKFnTh0mxFK5Iv8tdCtSZHuxvlduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQtz8HrH; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQtz8HrH"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4960fb63c75so5412112b6e.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784739634; x=1785344434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxlSATJdp1icBuAyE2MHftLf5IzsPs8NNyx38DkjeJg=;
        b=FQtz8HrHCU8+0Ic+6VV568QKlAXjsdlAZIG2G2x0EpB8pH48b21+4Evf4Wn11bTf+i
         K3iqZiQ85grp4+qQSxKSyWeY+bcfP+aIi3E7mStBbEmXquuO7joeQaI/mW3496rwYjAV
         vhMTBPHhbnuQIp3spOi3jvZBd3eo79kGw3aYSyWuons8b+LN+vq97MrMNh4yZg9emmEf
         +AB+U1YvRbeeBg2AoHRlnCowqT4VbXYdSSGNUFDmFh7dZ+jo84APSMHeHoeIjHxnuKDk
         KH/DXQuo/vVFpSy3sKj+zposir22cqaWqheplx/8CDK7tqkxJozG1S/+Cofhw+5oHgl7
         e4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739634; x=1785344434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxlSATJdp1icBuAyE2MHftLf5IzsPs8NNyx38DkjeJg=;
        b=EGHcelP5Jw1Ni0PQ7foKQrh0Otu0+eIZtbllVX/lWhBNFF2wFVpk8VSnXu0znMxVT1
         ckg3JghSqb9JIZRSWrJ3i/HizBY1d4F9qtQbvoJGmLGc+cf8Uvaa6M5cehFE8DX+cF0H
         HJKPV+OyZibHaccfx3w2PE7jp+dt7hpLE2v9S3AmC/lERaBtC70gOc4YMXVN1yl5ehef
         o+5wPeBtDB0F3y5xSxRCqI5IkjRb/MMlzykHWqjjup5qxhMUMGwT1m/2Pn6xWf1UTF/h
         gEqEjxWseRLdHn5RtiD49Gnqbxw14xEXSxQDbXbGzeduwwwXHIxozTeP1MZQ60vn6Kg2
         TzSA==
X-Gm-Message-State: AOJu0Yw9Hk+0ibibWlgu0Sfx+e5xfbD8C4v3fnPsp4ZEFdeQnTtbBq+o
	l6YJLlVEVxywzI1lrYEu2Sl7d5uAgBaLDQ2O0JbOLUYKF6jjRmyjJpKH
X-Gm-Gg: AR+sD12BD2G6y1dTD+i798fD4pmZ0D1qYzXc9tp0Po8SFOfGWn1zlH1w3sIXOqVuae1
	DahZ80v6q9nii4fVm3tJWVD40yn1htCx0DBWr2SgcDy1pWFYGWAOxVk/sndtLPVcsPHikQM4Zax
	2U58/qx+2XMgmonwTzp9JdxsO2ir1eSWOWY8MOZch0roFNwHhyTcs6Sl1emACTuF+rdiiE8D/Jc
	3XJGgataKZSGILqPsrbeBDzexkXQDYNiU85m/SYlIREc59Afg3M0OfduO2kamwgsF1mBtQ7WSid
	O+JLA7OLi9ILtZh1OlPWT8oKabZ8ef44HAgfu6jJ9E55rHXYhTWTwLVO6yrUd+07QT1E6OWnttE
	wEO23NfcYcymPoo0evHiIhsSHsT4tZ7D0VdGbn6XPVteyy+bJMPofj9Y+dGG84EgfbGR/Z1EeMY
	1q
X-Received: by 2002:a05:6808:d46:b0:4a4:adaf:5570 with SMTP id 5614622812f47-4a4d01f0c99mr13263406b6e.4.1784739634199;
        Wed, 22 Jul 2026 10:00:34 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab0e9af0afsm1399619b6e.12.2026.07.22.10.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:00:33 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V9 1/4] dt-bindings: power: supply: sgm41542: document sgm41542
Date: Wed, 22 Jul 2026 11:58:03 -0500
Message-ID: <20260722165806.161020-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722165806.161020-1-macroalpha82@gmail.com>
References: <20260722165806.161020-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Document the SG Micro sgm41542 battery charger/boost converter.
The parameters of input-current-limit-microamp and
input-voltage-limit-microvolt are defined as such since they are in
common use among multiple bindings currently.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../power/supply/sgmicro,sgm41542.yaml        | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
new file mode 100644
index 000000000000..af80fe528505
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/sgmicro,sgm41542.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SGM41542 Battery Charger
+
+description:
+  The SGMicro SGM41542 is a single cell battery charger/boost controller.
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+  - Xu Shengfei <xsf@rock-chips.com>
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    const: sgmicro,sgm41542
+
+  input-current-limit-microamp:
+    default: 2400000
+    minimum: 100000
+    maximum: 3800000
+
+  input-voltage-limit-microvolt:
+    default: 4500000
+    minimum: 3900000
+    maximum: 12000000
+
+  interrupts:
+    maxItems: 1
+
+  monitored-battery:
+    description: |
+        The charger uses the following battery properties
+        constant-charge-current-max-microamp (default 2040000)
+        constant-charge-voltage-max-microvolt (default 4208000)
+        charge-term-current-microamp (default 180000)
+        precharge-current-microamp (default 180000)
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    properties:
+      otg-vbus:
+        type: object
+        description: OTG boost regulator
+        $ref: /schemas/regulator/regulator.yaml
+        unevaluatedProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    battery: battery {
+      compatible = "simple-battery";
+      constant-charge-current-max-microamp = <10000000>;
+      constant-charge-voltage-max-microvolt = <4350000>;
+      precharge-current-microamp = <180000>;
+      charge-term-current-microamp = <300000>;
+    };
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      charger@3b {
+        compatible = "sgmicro,sgm41542";
+        reg = <0x3b>;
+        input-current-limit-microamp = <3000000>;
+        input-voltage-limit-microvolt = <4500000>;
+        interrupt-parent = <&gpio0>;
+        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+        monitored-battery = <&battery>;
+
+        regulators {
+          otg-vbus {
+            regulator-max-microvolt = <5000000>;
+            regulator-min-microvolt = <5000000>;
+          };
+        };
+      };
+    };
-- 
2.43.0


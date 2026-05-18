Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6EE3815C3
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135790; cv=none; b=p6ev+IIImbnaueCjohAhCPtW5wNEEbflW93OyWMZEi5bUaWGbWrWLcCv+YMyHx/PFZwkYiRBxdTxVJ33OdF5Oyj4MH3tF6pUS2zgRvzMnGprmiQiuMR9IFT9Xqhso73UEWbAjjuty5U0Q2y34PKnMR3S3M9WxpbwOczvf85upfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135790; c=relaxed/simple;
	bh=xgChc86S/ky0hTX1WHgw+ITaDh9vre+/OuTho3WUOIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LtXNPgnkxzlIrBejy0QHs0x0Qmr5O8ve46COADpSR69iFoxDe5z8j4Ebd26WQiNLsnEdt7plavTRUPvsTTHfQ/ZrtRc6OL+QBEhp3Ox8H5naOM+Uj6qkphd5/fA82XZPPmJkxIzC1JW5KhTTtg7HJOTQ3eEiXfAKgMtRDbGnICg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzxtwpUZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzxtwpUZ"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a746f9c092so4519788e87.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135785; x=1779740585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+gznpkaSXk+Nx5SKTS+MzsNikKdxnv7goUi1xVYfHc=;
        b=fzxtwpUZDYCDvuwfiHAQeeWnO5BJMe7Pcw0EVEfLvJ7vwbeIHgQezBzhH+aIBJ3abN
         VyK/Jlm7KQIyoBJ3oU/y2IsFMjqrwfEBWHP8K5aU/TPYmklkyRU+4Cd5wHJiIJFAVOU5
         esSrflyKAosviPnVBCVaszt0O14G+KfmWbVapChrKBROSJYJbtEMwhSqdnv/upmHxYaj
         K5uoLgyay9FXk5lSu/HCKHlpH6/+Ut4vzg5BynDnhLvYfrW1MkGLEotikZYusEoRN6/j
         TjvhWo6n+7rUboZ/ptV7dA7ttNQ7wLjMHDA5mGqaku8/svxiKc3ogkcv0MsTKKWcCdXw
         ELdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135785; x=1779740585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K+gznpkaSXk+Nx5SKTS+MzsNikKdxnv7goUi1xVYfHc=;
        b=n1b+CY2LrvBDoF2gGe1p9i6uOiixlUaFCAcWKpUefiiUUlrXTmrCaFbytiUCCJpfC7
         kSpn9YP2aq+dMsiqu7TbsEc2FMMOl+wE+y9T5OXyIKRsl2GRRYXEc9YQjUxpymX0iNId
         CU/TarXmGohxtXGO82hpm1CgPXYUv15nCaJ/sGV6G0bpQ40kae/hVKBqr+aNIO97oIAY
         NmHVfcJciQd43kJ/uzcoqd7fRDWL9E1HRs9bHf7wCaELgtngrf2sQXqoK1K5cAgurzoD
         HwtbfMSKNskfGZbodKoDVLokOu0cvSaobL1fTvDf86H2Nxyy1RCvW3IQLJ0aOpR/wle5
         PqVw==
X-Forwarded-Encrypted: i=1; AFNElJ+9tnJ6f/LtS6StcW7s41+ELt7qZe0XyVESXWU2z7KQQlF+44OKrd7CTLtgbxijc9YyNsf99KN5m9lU@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlmMRt+AB8WjhdAKfvbwuLmkJnjxt9VlsP2bZhwPwiEw064e+
	88SAFFBP4/NwNdonVX6iMAhFO1lOYX4VYEZxDuqNFy8+2g5rN3HkDI5e
X-Gm-Gg: Acq92OHevKXx1t7h/k/J+O1gvumWbhj+78Q3nnEV/Bsuz+xCcvlATgwRPbeD2/G4wDV
	QCY55ATSvHfJJTWM5c5hmReZPoIL+Ey9MGfKPmwTTQy8ID6DMsCq9zUq7cdZnGVs6IbxfFTGpoW
	/2D8m64N7LpFOgl9MBxDWTnULIdUCPJXgkInecaIcCL52NRMf2guKhnXBZxtLqAj7vaOZQ/jBBc
	5Nfo9hvlJWnCPyjPseu6y41wDw29aiZLrcw0KYVjnuSulPku+AyPMjw20BJ7UxrpzzEHT4C8RCC
	DsaglXNrAH5Cmd4zgggH7zLNfvV9R19h1RftBEdE+Zyge9N8ky+WHGk89fbDuO7MpF3u/I3bQVv
	ow26x41sVo7rYsb2I5VJXYxmPuTEd/t13YxdphLCrMhOqrjlN2gu/6iJNS5oIAPQY7XWDG6sakk
	LYkSP8zLN97bdw/jm++xfvmiZgbQLwxSI461ARI84aFuH8g63mrBY=
X-Received: by 2002:a05:6512:1044:b0:5a8:837a:2a98 with SMTP id 2adb3069b0e04-5a8ffc6705bmr6263143e87.14.1779135785334;
        Mon, 18 May 2026 13:23:05 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.23.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:23:03 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 2/6] dt-bindings: usb: add Qualcomm PMI8998 Type-C controller
Date: Tue, 19 May 2026 01:22:47 +0500
Message-ID: <5f4271701066943ead54f82003ab282c4b39f3da.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
References: <cover.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PMI8998 PMIC integrates a USB Type-C detection block in its SMB2
charger USBIN region at offset 0x1300. The block performs CC sensing,
debounce and Rp/Rd resolution in hardware and reports role changes
through a single consolidated "type-c-change" interrupt.

This is architecturally distinct from the qcom,pmic-typec binding
(PM8150B / PMI632 family) which exposes a granular 8-16 IRQ topology
fanned out per Type-C event for a software TCPM state machine. PMI8998
has neither the per-event IRQs nor a register layout compatible with
the TCPM code path, so this binding describes a separate hardware-
managed role-switch controller.

Signed-off-by: taygoth <taygoth@gmail.com>
---
 .../bindings/usb/qcom,pmi8998-typec.yaml      | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
new file mode 100644
index 000000000000..f2814f5ce3de
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,pmi8998-typec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PMI8998 USB Type-C role-switch controller
+
+maintainers:
+  - Maxim Furman <taygoth@gmail.com>
+
+description:
+  The PMI8998 PMIC integrates a USB Type-C detection block inside its SMB2
+  charger USBIN region at offset 0x1300. CC sensing, debounce and Rp/Rd
+  resolution are performed in hardware, and the negotiated role is reported
+  through a single consolidated "type-c-change" interrupt.
+
+  This block is distinct from the TCPM-based qcom,pmic-typec controllers
+  (PM8150B, PMI632, etc.) — PMI8998 lacks the granular per-event interrupt
+  topology those parts expose and the driver therefore translates the
+  hardware-decided role directly into a usb_role_switch_set_role() call
+  rather than running a software TCPM state machine. Power Delivery is not
+  supported by this binding.
+
+properties:
+  compatible:
+    const: qcom,pmi8998-typec
+
+  reg:
+    maxItems: 1
+    description: Type-C SPMI register base offset (typically 0x1300).
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: type-c-change
+
+  vdd-vbus-supply:
+    description:
+      VBUS source regulator enabled when the controller transitions to
+      USB host mode so bus-powered downstream peripherals can be powered.
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - connector
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@1300 {
+            compatible = "qcom,pmi8998-typec";
+            reg = <0x1300>;
+
+            interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
+            interrupt-names = "type-c-change";
+
+            vdd-vbus-supply = <&pmi8998_vbus>;
+
+            connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        pmi8998_hs_in: endpoint {
+                            remote-endpoint = <&usb_1_dwc3_hs>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.47.3


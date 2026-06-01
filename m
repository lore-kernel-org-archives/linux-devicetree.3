Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1692F549C
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780331525; cv=none; b=ufLIAbF4BKikw9MQ7Qy0o2NUVqjBD4/zvGzKkbTp/L+/QbtXVAifdvzZiHmSfb0gs5Pk4mMJcmpDWfLzT5tTkBd9pA+VymnuPM52E+ETYM1JdvTvMNJEBp7yNPFAnIu0hBaOaIY41lW0NkiIFrqEdIKNFOlXd5LDmItRObzQAwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780331525; c=relaxed/simple;
	bh=+tZ+SB3D6Sos228MeHE1O1Pcsbc1MdtFzdHAa0/5Ug4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgClqv+OxsbBD/o3Sa39IaVT12MTn8zeecNa61QZAQ+/vg8j4m5nvg22hruqNQzDHlnGc8qgiFj9sZz7MNNa2F+x5UYkJ+lc6KN482nOydayhu258EbprM+I54LI08mqdkgzsop/j7s7r8RHyHlRtZMKvdahmn5GjIdz3PJg7F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMyq+GMc; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMyq+GMc"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e6b5c374e5so1408324a34.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780331523; x=1780936323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXpOKEKYRzrZLjXmBOmkIohxSYzh/0A5SCufM5dsPR8=;
        b=CMyq+GMckGeetb781MmYw6ceq28ZPBriy0YKRpi5MJrDpivFf+QKZCWDLxB2T3nfwC
         rozL5uEjQY92Kw//0X7TqOPRzUk8C8+oBOz4oahmvEqR1KKCP7K23tXPMugxAbwVTqs3
         nelZzBqte06/A4k30+5orBp30Ud+0xGoVoYv/8Xertjk3REdOKxjqSNrOOJBrP43G2hV
         Lx+/tWcIgUE8Kj6uqJJ/TT4HhBrqXVH84XyDOJqk/I0UkUgqjzw0vKXp8oJyjKVxSNQy
         pBaLOYPc7uVM+my96QqEwtsjOwnnj6GBhueWA4GqrM+FA0hTGpL4GNl+Vbo+ODBamKnp
         ZTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780331523; x=1780936323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZXpOKEKYRzrZLjXmBOmkIohxSYzh/0A5SCufM5dsPR8=;
        b=TYOzotF2D28dqPVioBwDn/WVQiTvLqTXQGih1WrDFgrZOwxLNMV1JkaLniYZBy1rWO
         CzB0Kdi5o8ZcedxQ848ZupaJ7hlAv1dtRmYzHzDCErD0/zezMhWcF29c0gzRjhHHYYHs
         zV2ngCpRKmxHaBPT37Pd/sm/Dm1QL/QlVjAi3JCV7cI1CKcAZl0+KbGCabX8YrKiwJIL
         Hldcgw0BJT0+tJnx46mPJETNsLeLjRw0jtURQkTN1ykGU4pHJgvJD5xh6bi4Uj1XZgDG
         XcSd13iIbFYzrl8ExqCwA4DPwuGUoM2M4sn7aKAtsrQa6qOck/+yqLSdIO0rDyJTH2st
         QsbA==
X-Gm-Message-State: AOJu0YxVkOP6mp9FjDgIxiXWYhP+f1zG1vKXzQHQxxT9TcYOZQsHdMG2
	F7Y3QuIlXleN0VSN/I4mf3+yBVacQWb09wsX58S/mlbMe+vCME4uvZiA
X-Gm-Gg: Acq92OE7Wr9+D4IKTaC1NXYvl5h0ZugAB/BBYcU1Q4/Vu9hmjtOs9BJA/lVDpIFpXlF
	Azn9Bp6/+9D6r0BAXcJUjy4Jx0cudlOFbdkkV90BGq/+ZAo7iyrWvcw5VjVVDFtaZrP4rX4ez2I
	+/SuM8UZxuoBz4nIjYH/Z4rzLcG6jBsR+mJxhkBHfuTULlpgywmvYd/zvpHH+mS4JK4Umi6+cdd
	nF+cfWD5/+7/frlZTd6PwzYAddNuvamA5F2bUjlCWgRKfYwYNtwcTV2HJuBinPdNoP0wKHIYInW
	qk6ZazST8ddkYyf1dEudv8HghX/vCSfMMVolwCmHJV98+FMLHz9tEY3oSKhpsAKRq6Pu5oQXrMf
	lPJ+6Tyab1Jc6ApQYqD4YgjuMSLEZelkTAwbCejwjbEv9IBa/hC1H4E8gSxd0p8jqsDCbLGtoUJ
	FmCh9feBYtKAFfAAXx2DsWqPh3QMrD6no=
X-Received: by 2002:a05:6830:6011:b0:7e6:d003:929b with SMTP id 46e09a7af769-7e6d21c0157mr139808a34.1.1780331523331;
        Mon, 01 Jun 2026 09:32:03 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695d69b20sm8024928a34.22.2026.06.01.09.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:32:03 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 1/6] dt-bindings: power: supply: sgm41542: document sgm41542
Date: Mon,  1 Jun 2026 11:29:46 -0500
Message-ID: <20260601162951.254968-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601162951.254968-1-macroalpha82@gmail.com>
References: <20260601162951.254968-1-macroalpha82@gmail.com>
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
---
 .../power/supply/sgmicro,sgm41542.yaml        | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
new file mode 100644
index 000000000000..8d37f502c1f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
@@ -0,0 +1,99 @@
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
+properties:
+  compatible:
+    const: sgmicro,sgm41542
+
+  input-current-limit-microamp:
+    description:
+      Optional value to clamp the maximum input current limit to for
+      the device. If omitted, the default value for the hardware will
+      be used (2400000).
+    minimum: 100000
+    maximum: 3800000
+
+  input-voltage-limit-microvolt:
+    description:
+      Optional value to clamp the maximum input voltage limit to for
+      the device. If omitted, the default value for the hardware will
+      be used (4500000).
+    minimum: 3900000
+    maximum: 12000000
+
+  interrupts:
+    maxItems: 1
+
+  monitored-battery:
+    description: |
+        A phandle to a monitored battery node. Values for the following
+        are used by the driver and if not present will result in default
+        values being applied:
+        constant-charge-current-max-microamp
+        constant-charge-voltage-max-microvolt
+        charge-term-current-microamp
+        precharge-current-microamp
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
+additionalProperties: false
+
+examples:
+  - |
+    battery: battery {
+      compatible = "simple-battery";
+      constant-charge-current-max-microamp = <10000000>;
+      constant-charge-voltage-max-microvolt = <4350000>;
+      precharge-current-microamp = <180000>;
+      charge-term-current-microamp = <300000>;
+    };
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
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


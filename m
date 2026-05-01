Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59211195811
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777620799; cv=none; b=oiNw99E7157nNsme42nP5Ruu3+NTOCGV0AxnABF1kHGNJJ0VBu5Mi+VbrySLzr6JltbwGHZck/t+0VDXvw0Yf5h42WfqoAHSitJVYnktq/dMd0YG7svhj3EGr6QqxQvQY8TOyGEBvJXnLCq0memYxcK5kbWS3FoocAvyUiPE1/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777620799; c=relaxed/simple;
	bh=f4ytoeoPomm5tYmISrt8VX4ssSEEKL+vgSrubij9sWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqpPk+93QkOZAqC/pOX4npX7Denwq2O4S69Ia3kl7z8zapIvEg0VG9JYswUF1ma79R4S1FZ4hLuRsEF5wdegGjpJqz44Ovlvx2WhZQ5/lHCKO/eIOxppXZDV7G2wvOw0ve2uv6/LOiT7yRxSCxRa6fvbxPPyF66JQ662r+9j5eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jizN4cyk; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jizN4cyk"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-364d72f2986so983570a91.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 00:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777620798; x=1778225598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eEGH/Mz9b26kwzXLbg9yiEa8TTkjExptNbsoCdY3tLk=;
        b=jizN4cykeAH2Wb+JNfi6CKYX/WVQuazQ/63O5VzxsV7Onw3n5y4zCzaJ/Sl0zauIKL
         1H7xk30eOWqDGlQ2yI1sdXiGnSpHVZSpAmF2gJY/rxPLiAX944WEZzG04iCK3qiXSeBz
         Q8kskIBUgDc3nYyASDxsoxiSSH2z+c29/xk+rH0HonQ43fJ0HKuMx0LWyoVuZTRkWRKR
         Y2Sl7Y0ClxsXk6h0FRIosGd0nqsg0twBaoR1HYIv7NuJpVTVYdHPGjSOom+2SajB6YF4
         LyMMJ82gZmBSs/ICca3jMs8+7iAl86rE1TaSTg9/5f2Bb9RSH6oGoDkghaG00Y14cZbK
         CH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777620798; x=1778225598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEGH/Mz9b26kwzXLbg9yiEa8TTkjExptNbsoCdY3tLk=;
        b=M8bk68x4trgvwQ4yAwEv9e04GfcxbsKGuoVpLEjPF1sVy0Ihk2bxJE45IJE9eyrZag
         uccTLd1gxegHIrIdnVDog0WTqQ4uruFAfjEAA10s2A64bgynLrwtxzf6C+jqy/96Q7N6
         KtHPZf/FCifhxh6BvBuHzz33oIlXgtagsFHtq4hJckCmvudRFLTIkHEL+n5Fpmtcdw+A
         cI2/r9U3vY/csGpMy8AvFzTLhff6mybEYZ0uvkBNGhboEn1FvPmRgEB5iB4VCGi2nWVW
         ZGmMD5rH0JEkEjhM+uZNFB/5R3HqjJdly37FO+DRASmlWnxCZDgnbqJ6CTwUOAa55Aa1
         nZbw==
X-Forwarded-Encrypted: i=1; AFNElJ8BMaY6+7giiRMTm5hmRB7iV1+n9X/DgK/8cmrDnP91/fu4JUAKNSpnYymH0TDxhkrCfweYAnEpdeVT@vger.kernel.org
X-Gm-Message-State: AOJu0YylQat21X2/osZal4tsGWCk+9KP3a8l/ZcQkmRzLtpenE0c9u+/
	ttCMkAzbKUUNvm/agM9pVeBJeEHz2NEkPkuIZxHyS/fzJPfJcY62B43G
X-Gm-Gg: AeBDiev9HpsbnH69kjMlL2NPuGtP7UpMdml/voMNX0a3243MNag4laV7yJbN1jroerQ
	1yhSeQZoEjlgV7yD7M6DIk360obEkcJxZbPzhtT5cDXJ8vKWGvfdUJCZKfYtAdG6/8WXEN9zUBb
	nUr1/5CA4VN2SD2oZpzygPXpdAKNfBCm64WJduTmi8WCSke0U4bY8DN/YAU5F6b1fREmpGw0I5P
	8oh3neZnW5rD97O4PdbZwmmTCrjtxurxsMwOylRZ0C9pnPj8i0690TtG+mqZQKwsQKtIdqRV+dw
	wP1vlf2oAc4/ZsgoEganNXKI+IMQd4SlMSLiFS2e/yA6+QaJz1z3FdQmdvuNIuxhcGMl3jqlX4O
	nrWdKQJDf3OVokqpFkha9oK6XoDgOX1NrguMR6uUmJ91T9brhlLYGwFFVCkjNpJiknHww2iByqs
	GroRa7YAbC2ndO+bk9EaeALwGcnZNO4i1L1FoTg9s9q9XXXeUCdb6n1WiraoVbjVv50a4pRrZ2b
	vVJAw==
X-Received: by 2002:a17:90b:55cf:b0:35f:b940:4e81 with SMTP id 98e67ed59e1d1-364ef501f66mr2206239a91.16.1777620797619;
        Fri, 01 May 2026 00:33:17 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.148])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebf12bcesm1481466a91.7.2026.05.01.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:33:17 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: ukleinek@kernel.org,
	thierry.reding@gmail.com,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH] dt-bindings: pwm: stmpe: convert to DT schema
Date: Fri,  1 May 2026 07:33:05 +0000
Message-ID: <20260501073305.5866-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the STMicroelectronics STMPE PWM controller bindings
from text format to YAML schema.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 .../devicetree/bindings/pwm/st,stmpe-pwm.txt  | 18 --------
 .../devicetree/bindings/pwm/st,stmpe-pwm.yaml | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
deleted file mode 100644
index f401316e0248..000000000000
--- a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-== ST STMPE PWM controller ==
-
-This is a PWM block embedded in the ST Microelectronics STMPE
-(ST Multi-Purpose Expander) chips. The PWM is registered as a
-subdevices of the STMPE MFD device.
-
-Required properties:
-- compatible: should be:
-  - "st,stmpe-pwm"
-- #pwm-cells: should be 2. See pwm.yaml in this directory for a description of
-  the cells format.
-
-Example:
-
-pwm0: pwm {
-	compatible = "st,stmpe-pwm";
-	#pwm-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml
new file mode 100644
index 000000000000..4d5b43c9e7fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/st,stmpe-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STMPE PWM controller
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description:
+  This is a PWM block embedded in the STMicroelectronics STMPE
+  (ST Multi-Purpose Expander) chips. The PWM is registered as a
+  subdevice of the STMPE MFD device.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: st,stmpe-pwm
+
+  "#pwm-cells":
+    const: 2
+
+required:
+  - compatible
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    stmpe {
+        pwm {
+            compatible = "st,stmpe-pwm";
+            #pwm-cells = <2>;
+        };
+    };
-- 
2.43.0


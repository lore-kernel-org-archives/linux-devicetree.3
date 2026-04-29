Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C204348860
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477506; cv=none; b=HSS+gKjKqtsi/3RzLdX72jkyg0vA1lew2kyQgskqXggbSvQTb3yhxJpNkpvV6aSrpUjdegU2cTciU6NBnuaNW0lT886dkDT73o3JuBhr7FqZ0/fJoTu5XF1DkCPk5JagtnyVpdu3U7gjTktT13hajNmTp9t2QahKdBORTwnc8K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477506; c=relaxed/simple;
	bh=8FIj2vwHaCPknQp78twOz1Zth9N9Ie6U66NEqjKkem0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pU39aNKiNEld50swGVoxDD9q9UqPgwDONws933nLKVL/1bpFxZpZc9r9OC1hUZwkYZebfLaXN3JQHhIXT/OPzdsHhF1v5dsqIl4bkaQGZ5E9yURrr9XvJNlzG678V6QNbovxYsOX9yWGcwHW1QvgD3pGy4P3qxsJeur2wq4Coag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpJBBv7t; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpJBBv7t"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12dbd0f8063so3018294c88.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777477504; x=1778082304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=EpJBBv7toHW1Z6aPJkgTsDwNCvWuXEc3mFPVdhMAtuin4ce+nePSMFs8hSSklp54j5
         LhlMcs8RMKxcQM3ah+G3Oyvr41spYsCOYx5cHs/hFEwHhXybPjC1cF5u8InVsVPeHIzo
         PIGbWh4ofYRV71FL0C2G99WH7AE3vYe5Kb2VDDuPBPaTidsu6Kp6IYaxiFSJbOfxqp9X
         D4KOq+xeJFwOBz0y0P1+cGJxCLLstv6EHG4jSIwbexxN8EZh98d9lmFS88BcF2qNrPtt
         ZaZLf8dFON6uom17/K2vHB3ZD5Y4WggTV0JbYbt4na4bgCt5w9jBOlQdmshp6DvgCV14
         Bq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477504; x=1778082304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=S6F+HG8siaMd6jCrI+0vq6kh1D+zK+0ZMFgHw7/CKvh8RuDOTZqU2c1rfUrFuc9oe4
         CT/9aSqZPMVJuwnDGucNK1/twd1p/XKWgwEij+CQ6O5kI1XAsu8WmX6R0XXeNP5NHLtx
         7WJc5Z85PQup3yjiApULKm8j26nBKY4j+sA5x/v+wHOLiaTwFjO7EXfjqob6PdW52do+
         6MU2mgFwMa3kuy3Q1nh1QLwBtswxcJxbqMtFPO/33uVTwONxRMo3Col7rK3GUjj49R06
         Wv5mEYIUIq77AW0pAg1qJS5es+SrYT1iPmFun1ppyHp6+BLJ/vaI0wtqe2mOKDfLxAFY
         C6YQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yMAs94i//NVgGcFzJt/JkiPx81OUFa4CqAcHwiCxdzxtmFQ4m3FBKanpDauiUKAYo758K5PIF/M9z@vger.kernel.org
X-Gm-Message-State: AOJu0YzRp0mqiJq/fnQSTWEGf9rr+h6XsOHnzWCPpcXzeoUImah+r3O1
	vrv5Uad8q311b3SJlJhW4rvSwZoeiTf4dNoTKaJ+azP8WBrNPU2l+I1+
X-Gm-Gg: AeBDiesykW6KPgS6wOvHdJo4dI7jy7P9NWz++BhKnb33Ph3i322fo4cRdm6rlzir7UB
	ExNtb00RxgLMSnwCrxOmqCdhpO8GnVA2HSXQbJxqXzMuUPYkm/wYWoYAFduHCQiUgABMCRFsy2t
	lhf95kFbf3rIpXfd9aIDM1eVN514UwVpcOr+Fmf9QHgyWgQ32U6svSI/f0eAb7zYJsOLIjgoOSI
	YBRrT65isvzDDCX53WiXmx8vjc/imVmABqf8Bdgp/LU36NePd1hq/r3Xvop2RlA9BN5iCC3aa3J
	MnOV0TNNHI+CMn7DRMY15VDRygngJHPtsSuA5zj5QrRjqgoWQ9FqQY2SH5jSfDBTocDuNElnQbL
	HRvX1V5m47iLDtp5u8UWG9SIj9wYYwzKptuKqKkjy7svv0uVNq9WO6CENAyQcdywm/GVgTutlba
	xPiZSYqEEG1PitWVCh51rC+qjejFwTHc0=
X-Received: by 2002:a05:701b:2214:b0:12d:de3e:52c6 with SMTP id a92af1059eb24-12dde3e533fmr1978504c88.42.1777477504171;
        Wed, 29 Apr 2026 08:45:04 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de320ecf9sm3610166c88.2.2026.04.29.08.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:45:03 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v3 2/5] dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
Date: Wed, 29 Apr 2026 23:44:46 +0800
Message-ID: <20260429154449.730880-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429154449.730880-1-jerrysteve1101@gmail.com>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/leds/issl,is31fl32xx.yaml        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index cb4741dee12e..25ce67940c88 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -21,6 +21,7 @@ description: |
     https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
 
 properties:
@@ -30,6 +31,7 @@ properties:
       - issi,is31fl3218
       - issi,is31fl3235
       - issi,is31fl3236
+      - issi,is31fl3236a
       - issi,is31fl3293
       - si-en,sn3216
       - si-en,sn3218
@@ -37,6 +39,12 @@ properties:
   reg:
     maxItems: 1
 
+  issi,22khz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
   "#address-cells":
     const: 1
 
@@ -60,6 +68,22 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3216
+              - issi,is31fl3218
+              - issi,is31fl3235
+              - issi,is31fl3236
+              - issi,is31fl3293
+              - si-en,sn3216
+              - si-en,sn3218
+    then:
+      properties:
+        issi,22khz-pwm: false
+
   - if:
       properties:
         compatible:
@@ -116,6 +140,7 @@ allOf:
           contains:
             enum:
               - issi,is31fl3236
+              - issi,is31fl3236a
     then:
       patternProperties:
         "^led@([1-9])+$":
-- 
2.53.0


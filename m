Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF3D3921ED
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343663; cv=none; b=la7EDZ9Q37VlRltKKwCG0B3c8Cs1PKszwHniaXM9kIYlqGuq0pLtDvcHO0MY8qIbJK3HMEBUBahEsQbmOjynb8SVcxm/zdIFrfJ2RWxDyLpdo/Z1d4Kz9hiYYXLPmh+kDBa3hq4zJb7yjQ7TaYj/5xKte6PcZwxB22HknY9tiqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343663; c=relaxed/simple;
	bh=8FIj2vwHaCPknQp78twOz1Zth9N9Ie6U66NEqjKkem0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5fNPDDlU4vG/HFD+jsh7vdGHBVfe1/dye8n3mP9IvmU4MGuA7G5sAWsTgSvz+XG7TFeVX10rV0wbvxZSMfFxbLsl8LILVfHEfr6Ws7Wfp0LmcvlR8089M3RtF6vBWWpbvVTm6ugr0VR9mTz6Frax2VVGsGrVjzfd8ndVa9Qmqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFYTzFqS; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFYTzFqS"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2d891442388so917439eec.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777343661; x=1777948461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=jFYTzFqS3K9x1SA2T5C5pjfh2LLncH6zdN5BsSQlPG2OKaInMICLgKuVaBj31Frwje
         6xmbu77dyoChYK6BZtBqcK8QiAld/SDdEGKE667AKh6B1hOpwV3zjdLr2qBulH4mwpIO
         f7UkXQeLkj32MalPUwf2yoTfIug7xL25enAX/ZYBbOLkcRPZU/ITkKmGpmOpsPY+6aix
         uY9Oyl/5BFjQoYfmqUiE55w6TH7+cZqzzBr5i37X9nBGqqdSmVfKI+zBYO53y78woPiJ
         jpj7DJdY/RUCmB8bZbBylrrMejao4qbd9fPHPgDaUTZP9X5DOHYbObp7RFtiokT5/lXa
         RaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343661; x=1777948461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=AdE6Hhj9zisGPjUvLiJQKd+qZOPKEqY2KeZ0G/J4+WwYQVoOnibb/DSEDtqnM1yxSc
         Bp1FWh+RtlO2vq4EfCeCJu21iWL2SY1vNCIKMGYZ1derS0izqvmr7Vn1CdyBdoQ5/NPX
         i7YhFxC/6LR6hOo0N4OtCMtXxCW15EH2s4WtWpcBn4uU1eT5a5GHm4W0nP6vywuQ8eGJ
         W2i3ZWzqGEVRsMTn8DCednMJn1mt+DBV4mu0kenbIw8w3y0hL9oTlBQvvFOKMU/iuD2K
         dE6g5j/W1DDW9zpB1w3NVk19DkiI+mqrx1vQ8wKqcKON4v+k0RU7Z0X4/lMm/CbIfkHg
         zY/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ARltnZqFAFCc5lhhyBryn1DvA6JN+lXN4yWWCFIag9ORAhCq8iMZbkwJ9IUAIVmsqSM91PvJifX60@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGUOUcy5V7x7pf8WfTc4lDiR/v8vIdtt0EbVKjU1OfSanpBNf
	BXk2iLeKPdieNRnlaZTW1BjaRz37JxHX+fLR9QtI7E52hNCyP8C3dTmsmEBJv77+
X-Gm-Gg: AeBDiese14/0dYLXg+xVJJkmFVcjIJ03qtBy9ZfARkXHBorm+Kzc+UUl3E5y9qrnHKD
	Nu/U+Np941Y3w0dlmflS2uKbFt6L+YdQzxKbNeKDkexk5rcu4y2kHnec67+cpvAQmUTquCa412N
	W0EK1SP6dMAc4fFECS9IuVVdcK7d8bJcNGsUIpdirUwxxPeYFVQ1xlV6YNW/liurX5D2NZnM64c
	98C7RvMWaNa7prs2z1ZV2QR2/7MZUhV0UTYZNo0yfcFwm/90BJdezbcmWIrv3JKDToSssjfrITl
	ihbXU8Y39Qc9MVaXHVM3IaE5229tHVcSmd1Dlqp0B9mntsuuTILou0MtYTz+BCsgJ7tmw7aEPP+
	qtCDf4CYHHgeZrJxcyG+rGTvME0P7p1PBUHPLGFD3xc2g66ZKBOj1XwCpYldpK1+zY1VnL2hCPV
	P2ze+szC4Pc8F89kLxusg+jaOinTgS0wQ=
X-Received: by 2002:a05:7300:a148:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-2ed09fcf030mr657870eec.7.1777343660956;
        Mon, 27 Apr 2026 19:34:20 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebe6sm1088066eec.30.2026.04.27.19.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:34:20 -0700 (PDT)
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
Subject: [PATCH v2 2/5] dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
Date: Tue, 28 Apr 2026 10:33:58 +0800
Message-ID: <20260428023401.330308-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428023401.330308-1-jerrysteve1101@gmail.com>
References: <20260428023401.330308-1-jerrysteve1101@gmail.com>
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


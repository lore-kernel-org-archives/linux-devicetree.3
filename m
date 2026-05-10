Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7712B37E308
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411317; cv=none; b=jyCGv/yNXy0gqDwjYrETc4mwkB0tM8QhgcrWWd3QUPS+r7n0bBtNHCsDbzfGk8ZKsHM+DIUeVk7RhF3N/RJ0S8TQYYh/IjGFHErkzKy4i3mUxuGW4KM7EmTtG/JBudOFjRU/53Jm37KGa6lCwVWXF4+aSiqQzLYGm6gr0D+4HX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411317; c=relaxed/simple;
	bh=sJYSHWc09xFtiXGLxIY3eCmrqPgEujr443cRCV1hpP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTvMHSAmiXU6Kmh/0MTQqQYvgpMO4/rrNbBxGpg58SVTb8exoHCaLPvuiFKR85HSqt9envOsHY75YD2H8BM59ZhaWy1NzIHTdnw/fqrb1hbRAY6hsrwMKMpBKVUBgniu2N3F1lrs8bILy/1sqhVBo89Llgf3WURd9aKTI3lT284=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWBsWxYM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWBsWxYM"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9358dd7f79so537602266b.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 04:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411313; x=1779016113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=DWBsWxYMGAhcf2Jk9YXOqN6RrcAylX4Mkla1Z+g+GcjEkPeL1aVmZxomntrkdNaex/
         dZrzMLD/LH74AnOBlxcg3/DEj77+KhKTBD5mCgQT4pFWjh0karoI7ckTssOr5TnVOpfO
         dxg2/v8MI4vpNdB4bjzViFl1t/elptghzMbGTUjTQpEqzGeP4FmGBxaNCXoQpgLbnrJd
         BsFAf8zPQtA7lbfC0Coc0Nb7yNE4EKZTxDZJkOFW6/L8YkmEy8Ki5WiD2dw4khI8MQa9
         c39l2PbZ6vPSEc6PYHOEkFyBj5UjLDYXHGQZPNlvQgzihzFUA1Vz2svV6OndKe6E+sSL
         TReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411313; x=1779016113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=b/xfmTSJyQTa6R5vPHLlPnGwHE8wOBRbjBMyA1j6BvYdmyZ05TS7FWpdyI/0O+LkLn
         WZD0z2WjkRbd1L5z32O/Eo5nFMKPxVH2iidgPXnYWwg+EvJNMPWAejFPq5KEr6ooSI3r
         74vqZlQ+X6PYlnRiqTxvs3i8w2NgrzhdPX8Rlcx+xi9Tv2rWAFITQbpEJjTobm18s8sK
         vNjUcMnKX07PY6synZM00YzUm+VM/9qXJ4/NuwQWXLnJGYZuK5MkxOgPwOZFyBS1l0n3
         3QLsszDmjySV0Wmw6g8Kvlm9De+C+cyOa/OUvvQsaTsRt8zsxNYISBOWBE5J8mH8+c0+
         Fm2w==
X-Forwarded-Encrypted: i=1; AFNElJ90CsaOFdxiZV4CFL1xVzbSMwpiuSHPvGOvrK7N9b3VKxA3JoxKntr+b9jZfeHl3VBe4Unywksl6W7s@vger.kernel.org
X-Gm-Message-State: AOJu0YzLSamozki5658OHYPQ43oTW5iYiGknEz0+F+EtOWWug2/ltpUR
	xxm689Pt52pTwWDmh21HjFck8vzr5nT9vFuKxZk5Gb6k5afIAZpgk30i
X-Gm-Gg: Acq92OFMALpBa90qejQg3dV3MESDblNUlbKK8toPYalThHyGaEZwc8X9K4oX057sETx
	0JvdIMmOdYo0KzlhAeKCqc9TImtiV2TuCEKu5WmOBQv8XcOOzvhsdMwKlPAl76IPY/G60vzP5Eb
	d7y7nqZMs7hHLymVCmE2B0+vOdRaoKxo9JWmHRDWNaXDdebcoyVv/zN/1CgNob1bbZjrQpJAoSc
	9T438QNdD3Fx+SeE18eyBO/lL/SdxcROHei+NaApVczYxRlH0+7Bhw1gkFrbmu3GRlygrKo2iMc
	1Muys0jdDhfh2+g+zXdUyoBc1KWvxM6Ej40Yj/ylGxxZY7FXBPwIqwr+8nDCzrx9WJdRuygBW85
	N5cjQPR20W1r3+1zeEpmHEjT/YgZh2SoW3/XXSkeAsXrpnAH3cnLwHcfvLqw3G2kq/aoEIudCvT
	7rdQD+5rYLGPF7
X-Received: by 2002:a17:907:9714:b0:bc6:bb79:e50c with SMTP id a640c23a62f3a-bcc3f654801mr253345966b.29.1778411312270;
        Sun, 10 May 2026 04:08:32 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce7a3fcb57sm68146866b.60.2026.05.10.04.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:08:31 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5 2/6] dt-bindings: input: cpcap-pwrbutton: convert to DT schema
Date: Sun, 10 May 2026 14:08:00 +0300
Message-ID: <20260510110804.33045-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260510110804.33045-1-clamor95@gmail.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert power button devicetree bindings for the Motorola CPCAP MFD from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
 .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml

diff --git a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt b/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
deleted file mode 100644
index 0dd0076daf71..000000000000
--- a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Motorola CPCAP on key
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-This module provides a simple power button event via an Interrupt.
-
-Required properties:
-- compatible: should be one of the following
-   - "motorola,cpcap-pwrbutton"
-- interrupts: irq specifier for CPCAP's ON IRQ
-
-Example:
-
-&cpcap {
-	cpcap_pwrbutton: pwrbutton {
-		compatible = "motorola,cpcap-pwrbutton";
-		interrupts = <23 IRQ_TYPE_NONE>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
new file mode 100644
index 000000000000..77a3e5a47d1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/motorola,cpcap-pwrbutton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC power key
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
+  power key is represented as a sub-node of the PMIC node on the device
+  tree.
+
+properties:
+  compatible:
+    const: motorola,cpcap-pwrbutton
+
+  interrupts:
+    items:
+      - description: CPCAP's ON interrupt
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+...
-- 
2.51.0


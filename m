Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ED1347524
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775226541; cv=none; b=T7dl3ZkYX03O4D0SI1SKS40VPqktpxIeUMQGtbJf9HjahlAHE/SBCAkwtdr1LV+S6nO9pRmDRw1w1DghnRCymrxZj9tQv4zcVLELBhDhxEhHiNEKSwtrRN9YrS2m+8TES0IM4Xgkojsc4bGY2I3jUdrQZkXm+FD+Qk95e7mHj2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775226541; c=relaxed/simple;
	bh=Fy3LxmfFwAHBA49eU81J4yKn6v7ciijjsYceXxhe0CM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoZhOFQwIsBo5ogQwThvdAAo6TOhUTRj61v9NFidItCqL+LG04Ik6hS5acngJjt/CTEOQS4w7c288Eot8QL+DfXVVzChDyBTwPZepp6R+CczCUzm5+BoVN+2gWNJWM6E9cWXxDZGuDtoqJpM89S6Co8/XKo26BGlyBJXMhkeKZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CCTNqxQ/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CCTNqxQ/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so17177565e9.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775226538; x=1775831338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItvUs7qnYuRhfo9MnKht/hLCIFj2PmkiwnfJhnbvcpk=;
        b=CCTNqxQ/fr3EYM0bKODDyqTSY8sQFVn08w/3qeF6AGSlkAbuxcqookqTBPPKLxrJ8o
         X0FdqTgEODM9bwzsphVQ824wULv+dDMWZmAILBZoE8MYuCJT/H/fSkK1T7rbDgplhEav
         uWA/anW4RTE8T4n4mWl6ZvLP2RfIIiPREVhuObPERIhNyeSNaqJ+hsEfUzSaZWTlw1PO
         Lc/xUIjmLqB0CW8esNqZKo03f+jqMdmUdHSP/R3Ob//P15eRovp37WV8z0nUucvEXVcr
         q6IHKL5lrbrk/P6QC3z554Uh5ZY1nzKxLha8i91NXr2Xy1eRpXjTNRnvV4werd+udkMV
         1JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226538; x=1775831338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ItvUs7qnYuRhfo9MnKht/hLCIFj2PmkiwnfJhnbvcpk=;
        b=AGcQhgLR76QT0OTY900oI6aHROqD6iVBzi11KyrL/EAhhvWndc4FywKasoQFj6mBlS
         BZep00TLyrfBb0GUGJMs4Ma0qKGhoAuLhrX8LjlU0wRNfktVK+L6WPaprePPdu0ZsKz2
         TRnQElVL9Q97CMgA0Dx6kdjCAedxLfxxLHEtDkCYl6IhEQiDD88d86DEL7dSuniBaDBb
         8bOPqrHm7ep1CpYr+sGIKgJpkqGQYTAchNuwCNYWbguQ1bKv0n28ddOGnKEFpKhXeS5v
         E0EqyR1qtRZk87QhWtWpTh2mfkWzp0sSiR/DYZWAs3OCf/6lcmC6QZBGUfu4rIs0+m/q
         enDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNP1ZuP9N+AYMAA5DWnh5BHCU5x/txnVl3r7tT2ixJKqASHGbcKxFmkekjOBQ+T15Kgd+vxWLk4Ius@vger.kernel.org
X-Gm-Message-State: AOJu0Yyte1HFJ1jJXrkcNDu569bg/RprJzFn8kE5iromND7rh6SdKAQh
	Va2oSOMEmwPpTCROFWR+7if6MvXlub/GRvVbV3v8EangZQYyo9oxDORfPWZNLxNYpmA=
X-Gm-Gg: ATEYQzzXKf3lRqmv8NMKzKPRMWKh+63Nr9Wiqf+LpOHrVH+3ox9vp+8JLnUpIHS1G/p
	9Jc1Up8po57rDUbCiBPg0rNOZJSGhOXsCzphINR4L/ynoIxiWf2pMX0Hiw65Cksh6sOF3UTImBw
	dmJdz76ETIV7ZySv2KIAwyOhILpzrc3OoDYkmFz78VSsFdpDYl0/ZjLsmH+t34m9VZTnPDOBWFL
	zbUWEkM4EiY+nL5fCe52QFXBQe/N00hg6FDMM/KJVdLnEZnKWg3hGEA0/07Z3is528g8mUB6yvx
	JxSexNshWV8YSxqqK3gJevdOAqcPA8gq8kZkHR5SSiZFNKT6Va4z0Q+oj1trM4xS2LRXfV2BCCE
	A3gHySJbpJgcXZ1+SGNOnQBfwhUb0HFMAQrTOcqX5ItQIxRD1+8pBwx/MtOZ/2zvp3cfU54mGqS
	+L1lid1Xl9XeHHXfOLHHGX8mI72yt/56QFT44lt1JDg0l5YnJHtYyanRJPo8THl95jyiq8
X-Received: by 2002:a05:600c:45cb:b0:486:ffa3:584 with SMTP id 5b1f17b1804b1-488997853damr44739285e9.15.1775226538384;
        Fri, 03 Apr 2026 07:28:58 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889cb46adcsm44349515e9.4.2026.04.03.07.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:28:58 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Fri,  3 Apr 2026 16:31:54 +0200
Message-ID: <11b5eee3c22cfd034bb4b425d28a5a3ff2a71828.1775223441.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1775223441.git.andrea.porta@suse.com>
References: <cover.1775223441.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..d6b3f52561636
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
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
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.35.3


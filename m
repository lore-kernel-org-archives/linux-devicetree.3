Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263953CCA16
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830028; cv=none; b=iX2bQ+FQUbUfgJmmU1jS4evJzXVGyHIIMUCaist+Hofo4tRGnZb3ejyR1sAvEfAjHZ9aX8VhMvPf6D+QTy5/bJoEhYiRTGIiCCfwbIs6/yf3pE7Uz/LO/0RB1Acijjor1ITstpcsRqjYhNEpSh9Np7JnUGZsBhEwCVa69wgmz2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830028; c=relaxed/simple;
	bh=s8hb9g9paEXCL92IjeHXdzwCUqKzbSkiTf1BUkd/xRM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXyLVe6CSEraVu+ntR6tbARNB6pzC5/QZD9pjjL7Y4Ip7jt+rxkPbw5JC22jKB7+dfwpki8gVD15hiYwX3zaofau16LJ7I5gnm24D3YfqxsCJJpQasnkrTyexHZayHJFIIJkP9UD5kkzOtHgz1amDpKoW1pIGdK+SYENjcI4sn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b3wQiR2K; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b3wQiR2K"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so25727295e9.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775830023; x=1776434823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4GNYk08qocSjMmlFQv9r58JfdZ961NOnAm9HRPCHcY=;
        b=b3wQiR2KcNM3YgYKGgNs39nI/DXdq5JQKehikBrE6OsKsryBv/H0JJtSfkfTqRdYhv
         +vj3EOGx0wtZEYkQGzQRnwuCIoWqEb8X6HZ+A0XIDoyaMn9C9hGIBhtEGOu160a5ASFP
         Dynex2IjxTxdJ7BSVPb7EHqb663WXwRY8TSu2oM5J+QMSavRV3MZFzv6cd857fwbk4e3
         IIMKotzFN/aXVpFu6ijMVJmbltUCxS6T8aV8Z9pZftLqbJi1gTIdowfC13k0HYt7J6Jl
         IUCoOEwUv5qNC8pm95z9H9C5yQHlRonlMPBRNYHxL1X7cXYQJVyTGyr3yyAKLsl3sub0
         s3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775830023; x=1776434823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b4GNYk08qocSjMmlFQv9r58JfdZ961NOnAm9HRPCHcY=;
        b=A7PEepeC51lsA0+o97NMrrEKV7Kia58/oMr05T6O6FdoDcaBRkrwWbRDhKzhyC8qbJ
         HTG2AhRIMewpriyOJLOJGKPy8PlhmVdHhGdtxE0PI4YRo4Q9VMTMdaqdzi/P08GBCgnM
         /4OWdIfSiBLoe6Ot4XuA+Qo4cXtzuML7zZHMf61Mwk7Jk+umsdp94vr6Cqpoy39fbYn/
         TOJvWpPaplQsj7HFtMm3qS/uKpRrdG62PWocUFLEyIA4TajhFJ3yPkkH1h3p7+drRHQO
         K88HdKna6VtuYxgvRrXp0NCz7yZpiHCunkLnK/Wkfk1rUt2+JS3d0p7JLOxT5D0UlaaB
         5X3w==
X-Forwarded-Encrypted: i=1; AJvYcCXXB/jVFOhXGUX0Ju3iH1rtv/FUsIbow+TD+XZRZub+jFCeA9IP8kVPS1dw6DdEY6AnmAMMZQkmVn4q@vger.kernel.org
X-Gm-Message-State: AOJu0YzcR6jwXHRvEJJ5AtyQ28uS6GWclyJWBp7fDGccwaeHUmHctInp
	HEg+YohpLcNqgWPDam+Q0u40ZV66co+XBM23o1XmW8XykVyU/7dzUAF9G4PKNAHeeB0=
X-Gm-Gg: AeBDies5B6wgep8VDldr/gVViUnWhmPflrvKP1OtyOnyy5l+6BoARhecL4WgrkRikth
	gc2ts810T9XI/D9sME61QRNUS7S3YN5TZHCmZLSdlSkX5rjGYdRNTMkKspeco31bbZcLX9McB2R
	CjEmsOvPkUX/8cjcnwpHkFFpMAa2sgOGWLlLJEU3VJvAVzL5iuL8uN1Re3n7xQEqbhqWE2kOyvq
	E71ddqa185XAfgc+9tn5doPde+O++sdUym57N5682WJeNm4mZG9z7h3s6oOAkIKsYKg+lPg4THX
	zeDmWyjDEFfs3wHaaEZlit2kzkMtK40DSvT4Mf5IMraSDbXw9yrO5XmuZQvXYKmKVsyScal4KZE
	IGxWfjbKnSuIrQwytM9Rd62Ebnd5Tkx5NUjojv40T44zrIMrto/okQZzdsDWVHY0vSRWh7f/9Yy
	pbR2Afqww+TOkNNp9Wt+FdEtU5xc7YNNf30NOzPO5wmDAKOJ1pEw==
X-Received: by 2002:a05:600c:1391:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488d67e6a48mr46582625e9.9.1775830023400;
        Fri, 10 Apr 2026 07:07:03 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b46ffsm27847985e9.6.2026.04.10.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:07:01 -0700 (PDT)
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
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com
Subject: [PATCH v2 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Fri, 10 Apr 2026 16:09:57 +0200
Message-ID: <6f0fa1a817b5af5040b652320daa7268297932a9.1775829499.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1775829499.git.andrea.porta@suse.com>
References: <cover.1775829499.git.andrea.porta@suse.com>
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
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..6f8461d0454f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,54 @@
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
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan using shared registers (syscon).
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
+unevaluatedProperties: false
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


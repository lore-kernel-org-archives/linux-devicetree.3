Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B254C9575
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 18:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525473; cv=none; b=gHySS/h3mXx3YbJBGz4xHll/NCr9JrHxBMKF4hGhrJpU11UkXM3vHzlnE/W7K3tSQ3d0g4weCgEOdB5n9fA7cguxr9hupv/vDBZFwv4+K51vqNowA5OvguQd9Zv/gVJDlPwh02tyqiUWAPEHiOXvnI3rkGUxH1t2En4m1BgL9PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525473; c=relaxed/simple;
	bh=ScuSn2Eo3m8qfkPkxLxCk22qONfBuFmTXHK4TsFSyPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkT+hDMH4H0jC6AWD8G/m9sFiNH2Krn/lDWhh5SIE738YNUH4N6HyehA27JHT0SVgAwnm3EZo4dByZxGBKJ/bI5Klt3u6aCe6qWEYuEoNn4TvNSRYsk/jPLv5NVk/mivoMNiNi4F7xDrN3JAchCBvJXu5EBKIuoXsqff9MLCqVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wnt+S7ZL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wnt+S7ZL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so49830475e9.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525470; x=1779130270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxgQ/0UOwKXQVRrJFbE40xkB8Pb4iPrDGhrh4gosHyY=;
        b=Wnt+S7ZL9X+xAvlHP4H+8MAKgLKz0gbfGWFbhblcaB/V/wPgIjD5dyWDlrt+udAPXl
         5mSiBNhu0IGG/hn1dl3KaPlIkfHgGqIYKNK/C3dq4Ko4vedapcpSc3z0Frj4aUELQaSU
         rwyi2GE9qjvfdzscIvURQCBXB+4xiRVyUNW7CuSyYrVgijg0Bj8rQ106OXL7555R2BSs
         +Q6JXiceye9oZvmmEOGdHEPQnRJN2SjyaOO5AEUOFTpJhciggJdO2E36qxRI8yuY/8AZ
         wMCKqE8XjSS4x7j3oQuSRd1FmpFoVCP7a4Qm4iDdBbzDuc1zg8iffnXTi+E1hsKz5WXW
         HAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525470; x=1779130270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxgQ/0UOwKXQVRrJFbE40xkB8Pb4iPrDGhrh4gosHyY=;
        b=bDhc2Y9RXaXxSq6RCQp0e+XnHa+R8FMfLGSkRZW2vrTaloSeHicwBU99/wzxLXaWDt
         aHMffRjN74Pb6jRwyGK9JvDQD0V9euyLOoxAXzufIyrYOmJpoo9FMQksNM8zJ4SmcqQI
         T0UUvG6m2bsEfgUX7NNnSxx4czLl20bBym5h4sujF1/Bo05ABIqtHOx3+wel9n/txgoT
         h5taRbpL3IFxi/NUSSw+71IxU5UTXZ6o+V4b7Xw7ZcItyPw6IiBIEm5aQZ+PrkKXfg3V
         ionmXI4mD9RjdHpELzZitCjM4l57uVVHhxaSNBthjp8RdoQs/DeKtgdX1gtJqem51a3Y
         tpqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fMTazDMYc2bqnjH6N+wZ2KPHUXa5+mNs0v5VnKSUl0xjMXIN3rfXTZpk0nXIIVqq2kNTFFroS3Zcp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8zhudjRnE2MMG3kTBm2kE4tczPhmIBB4aGeDhSSR4VEoqFzbR
	O0sR7pghZadzPX/YoVhgMhYxfyDq0Uaugyby0V5tcqKeO/r6kSLS5KQ3
X-Gm-Gg: Acq92OEDoNy8cIeF9igLV6VAerrTjH537Gud1eVakArLc81PHQKuw2wHiQsl9sfhdKK
	DlnKd+ZNlzXWB+0cjeL3cMC7OyGMrcc62No1+MOpJ3YQprWhuWjYALQ13lRLZNurKoxdHSDMLDp
	1ZedJmiElle0dzECP3VsMpxsXvv3Cm48qhFHw8mIJ4v+oQd/92F9IqadLP3l8l9gpSvQitV5yIG
	gCDdTUzm36ystsFQT/Sy/KOfH3jgXQn/tPQjv1wpLoY9GdJMXYfIEo9ZY4oyl/Jw0u2yPfFg1vH
	dEZ1sK3KHG0AGB279uFS/F3pAFEj1m40K0f2CgPGcO3a0TH9KrbptCY2ntndv71pJkex5s0NJMW
	jH0tk8KM/vKMQsb9vaxWlu5K3eA92S60J1cMaETEGXTU/NFh9stIaZ/Kcp5Mk1WRr0SOPENQI5D
	8/lsGk/DKMO5olOEPuoNWPUCBCUuz8Fu5KYEOtcEcEXZFq1QNcjI8RAVQ1vc0no1gVbG+L9drIc
	BBi7ECQy3yR8PE+JeRu6/Nuz/g8jRTb2V0eBw==
X-Received: by 2002:a05:600c:4449:b0:48a:89d9:a419 with SMTP id 5b1f17b1804b1-48e51f2e67fmr395335165e9.11.1778525469670;
        Mon, 11 May 2026 11:51:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 5/9] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add SYS syscon support
Date: Mon, 11 May 2026 19:50:54 +0100
Message-ID: <20260511185058.1926869-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
resides within the System Controller (SYS) block rather than the WDT
address space itself.

Previously, this was handled by including a second register range in the
"reg" property. However, this is architecturally incorrect as the SYS
block consists of two distinct regions (0x80290000 and 0x81290000) that
contain registers for multiple peripheral blocks.

Now that the SYS driver provides a unified syscon regmap, introduce the
"renesas,sys" phandle-array property to allow the WDT driver to
access its control register via the system controller.

Mark the use of a second "reg" entry as deprecated in favor of the
new phandle-array approach for SoCs that require WDTDCR access.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../watchdog/renesas,r9a09g057-wdt.yaml       | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
index 099200c4f136..2f32c7401def 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
@@ -48,6 +48,17 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,sys:
+    description:
+      System controller registers control the start/stop of the WDT, and halt debug.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to system controller
+          - description: watchdog IP instance index
+            minimum: 0
+            maximum: 5
+
   timeout-sec: true
 
 required:
@@ -73,15 +84,29 @@ allOf:
           minItems: 2
         clock-names:
           minItems: 2
+        renesas,sys: false
     else:
       properties:
         clocks:
           maxItems: 1
         clock-names:
           maxItems: 1
-        reg:
-          minItems: 2
         resets: false
+      allOf:
+        - if:
+            required:
+              - renesas,sys
+          then:
+            properties:
+              reg:
+                maxItems: 1
+          else:
+            properties:
+              reg:
+                description: Deprecated. Use renesas,sys to pass the offset
+                             of WDTDCR register instead.
+                minItems: 2
+                deprecated: true
 
 additionalProperties: false
 
-- 
2.54.0


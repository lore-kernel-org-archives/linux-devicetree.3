Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D631E857
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320768; cv=none; b=MAawEJ3ya8rGKUVRRYyvVUwjH18KaL3DGTYl9IQ1gwLPUt1MvLvc61H68eYhnKBc1aHGrDMVsXItI65uHDRisES5oYqLXOFikpGFH6cNygB7mFo/JU9wizs0dUzpC84NiBWnLk6Uprpte1bcRIWiEq0oOKuO7sRwv84QDYS/3fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320768; c=relaxed/simple;
	bh=TFlgFJMYMQlDmZikVgnpkrUHYORzj7/QkOS9IQvUAI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sdON8kNeQdNKJj7JBr9b2aRW8g/EkbdqmUtsyavnEEYFpgpgX0MSbxLrlZ+ebDSd2rVV5Lk4kwYJuVvsuLaZ6uAtuByHE+jip9WEruRU0eNDyptdKEvK7ayvmH6ZSKwH6ktji8MVTriVCtk6529XsWo7ACt9FdyeogCrfyEcaSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hfIwASiH; arc=none smtp.client-ip=74.125.82.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hfIwASiH"
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-2de831d2b20so1732569eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320767; x=1777925567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xS47RVDKW8GFZppjjzYsYzUHq1wMuiBPcs650CNp/VE=;
        b=C9DFYQfisVspenF1n17iyNqKvmw3FD06m7eBEQgrC8JTDQNSpzkvtjyGw9fwiISp1e
         ZhPkbYPgVqiEm4/JoZAH6I++roKZhfSAErQ6tDGt5WAY3TrfdVIEv57XFFfU+U9KA/zt
         ApTmhZT/F1HHps3Y6hekzV6iWi6iCDUPNNlQzgMFiPsS+6jWdOaGw1HxvW7wSQz/C+IS
         FUG562At4vk7nDZE2foH9c+TU9QjQ+Db/Bvbcyl+3XB2/ftpLKV+C0pNun/QPwGfvHLc
         Ujcq3pwRsc5xZwNwo8pHxFjRzaWcVqBWLKibRX2+DLapfke+hWJ6MDmxdJVYwJ4Uskcd
         tMqg==
X-Forwarded-Encrypted: i=1; AFNElJ/bjYjqhlZ9ON/NZvynaj/WbnRvNEZBfRYMylswrbmlvJqd0yv0OJboXF0851hegd2Axiz0/FvHcNYy@vger.kernel.org
X-Gm-Message-State: AOJu0YzfgRYSI5iMIxBFAeltQ4RjXmFlEkDLavkP/utg4ynbhJB40FP4
	Si3BH5jwXaeyPqC19mAJEdSPpJXOxJXQsbID1fulAXcAspbERAUeRW5txvKL1ofUuYg12vI/ruY
	4aHK/ws/c5/raI0lfdwg9uTeMw6Nmt3i/xnvU/L1IMpXWCWInFnbe4HtrYFq2uGNiCcyd+RnQ3N
	p8K98yO7OSEnqD5FlOju+2kS1m+QFcE4suJPtLfNav82WvhGK0iyv17n9S+mMkfnO1yPCAas07e
	rjzFogxGhmp2A==
X-Gm-Gg: AeBDietJF+CwwuVPOWnz62TWDhicpXrMf34YP7havEM4GBuCFE2TzGzSBr3chpz2BPt
	zVpxmtvoisXGk3jVibYEvLMc+os95G+RqU6lRDIj7nkfJ3rEQvT3onJ5YGnulGBYkK3aVDBTPhI
	gTjJzd5e0X4T1gubjrkHQ4gk3ohOahYQm0KyfAGEBIFRwJdP75yI9P5y1h5B2m46oToSp619Hpf
	wUz1m6pTzMyAMBEH1VdVI8jY6yju8SAyoJnkhMgefXM+1CiaWfWfvEPf1WB4BFgFuPJBySLh72L
	VlCuUS4bIgy2iec0KgxwFRvUX7GjN766D/9UH24rxRgxN89vIrTCQG7cjlhUzzq8QnRhvi82rBJ
	FYH+zhZmRAxwQpIzgm81UhyPQLWw7VPxw1ojKR/3pYvxow0H7KTIc6acEayj0VzRNRWIWYa1c5c
	2lwZq47MtyQ3WqH5ctzT4QUUoRoWgtnoPAniFCPq11frY9/xQDrevnihYjakkfMIG/
X-Received: by 2002:a05:7300:73c7:b0:2e6:e504:5435 with SMTP id 5a478bee46e88-2ed0a015a63mr199536eec.12.1777320766514;
        Mon, 27 Apr 2026 13:12:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2ed09fcfa67sm18647eec.10.2026.04.27.13.12.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d889997495so28345337eec.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777320765; x=1777925565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS47RVDKW8GFZppjjzYsYzUHq1wMuiBPcs650CNp/VE=;
        b=hfIwASiHtV4NAfRQ5fCzQDl88T7DtlNns2NdD8maisauaLVyOYDHfHHWTB5FDTkZAj
         e1qfphJoQZPJewRxUHNgp/uOrokien3OAT+5ajPvDIzoBY67zbw7WkTTYVsK1Rv41Dmk
         Znjc42rF2mVx31tdvdAiDiw96NwtxwWjUWAdc=
X-Forwarded-Encrypted: i=1; AFNElJ+EO/r6W5QilO+YGAmKAWqOax12DWHXTxjepGkMxNhbSgvkb4nLsMJmEwxft8GMKmIk3iCrB9ZFF44h@vger.kernel.org
X-Received: by 2002:a05:7300:7316:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2ed0a19128emr207100eec.29.1777320764896;
        Mon, 27 Apr 2026 13:12:44 -0700 (PDT)
X-Received: by 2002:a05:7300:7316:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2ed0a19128emr207074eec.29.1777320764314;
        Mon, 27 Apr 2026 13:12:44 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09fb6b7fsm437136eec.10.2026.04.27.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:43 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v7 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
Date: Mon, 27 Apr 2026 16:12:31 -0400
Message-Id: <20260427201233.380314-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427201233.380314-1-kamal.dasu@broadcom.com>
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The Broadcom settop SoCs have hardware semaphores as part of the
"sundry" IP block which has other controls that do not belong anywhere
else e.g. pin/mux controls, SoC identification, drive strength, reset
controls, and other misc bits are part of this block.

Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver
to iomap only the 16 hardware semaphore registers that are part of all
settop SoCs. The semaphore registers are based on the BCM7038 SoC
where they were first introduced in settop chips.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml b/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
new file mode 100644
index 000000000000..552f334256b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Settop Sundry Block Hardware Semaphore
+
+description:
+  Broadcom settop SoCs contain 16 hardware semaphore registers
+  (SEMAPHORE_0 through SEMAPHORE_15) that provide hardware-arbitrated
+  mutual exclusion between drivers running on the SoC.
+
+  The semaphore registers belong to the sundry hardware block. The
+  node describes the semaphore register range carved out of the larger
+  sundry block address space.
+
+maintainers:
+  - Kamal Dasu <kamal.dasu@broadcom.com>
+
+properties:
+  compatible:
+    const: brcm,bcm7038-sun-top-ctrl-semaphore
+
+  "#hwlock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#hwlock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hwlock@404038 {
+        compatible = "brcm,bcm7038-sun-top-ctrl-semaphore";
+        reg = <0x404038 0x40>;
+        #hwlock-cells = <1>;
+    };
-- 
2.34.1


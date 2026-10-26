Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049124;
	b=kDpoMhyZ6RDuFS8T7grFW4QBUS7EfcmAjfqOMzqdrmPwIgSBVG6DZAXJFqSWkci5+nZM
	 FzqkfX4yi7HT1iWDqgkyyogDw6epvvtsCncru7uqtc1x1SRdcGB1VT6jwd0+nLdnWO71E
	 lmck0++9duGEN1KSS90Aw3G36aVOd4/ab/jSwe/SPoH2MxCyw6Knnt4JrwK4chyfZwkVv
	 OgOXhqUSWQ/XU5i35KHUkChdCVtYyJGJgQgu4MBThMevOEGPGb3rz+Ej//rmR5LXPwXSr
	 W+GLTciX45H2w/NKvJpZBZjQ/IoRIFzGKLbLpUIE8IjkEYk+t2zpcrPVFTBEcBp5lkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049124;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
	b=3Tvb/pvXqmM98HuuNSaikt314XCioiqbCHJgUAULbl3RNBohgpyvNDLW4kCenNERFGBr
	 JmwlzNXo8huSfPFm4XS2ylIVKkRazUQyqnn/kT7EqwUr8v3R0OynLvCctxHTu6aASiJ/M
	 eZz8WkvkgpbxfRLKcAgrBeIdjpviPVouPZYukuX04ahm8QYYFZu16OBa9z8hoKU/smMBR
	 AhC2CFiGE7Vcpf1/BU2igCclYzeZXAJpygt3ryO48qti0kfm2yeq28DdgVYHfRuZ+q18K
	 F+kUKHSxd9BcIJtjemBMFrBBXtWsSoZNVh88UMTqLX74oc10GMexBX5Od/z/MyGeEIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NnysnYU7;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D1606A32E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 293D1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NnysnYU7
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so205724a91.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049123; x=1793653923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=p0Cxbi9t/7q176Y05VyHbpnxW5Ya/mxeIkCNSr/HV9OObEmlypq8CnvGyzZpulforL
         n+Av6rgnWfjvRh1Yre8GDK9/PKAIaIBfPfv0JxhzHR4adO78dGXf6Yf5sQq0d7o/tF0D
         vg/AJdNCnits+tZrQp0I1NvncXhzkSD7ID3H0YkG6G4Ke8nj+PdC7lN97pl2X7UIQ319
         agSjNMYBnkDfm+OR5xdtzGhFuuESlIHxgCSAc1rqsbpuVulicdSG+u40P/LZtmEMOx17
         EBWckrvQlm411N1Xb6C9/7FXCghewIhXnP0J30ynFUQQB2iWqfG5xFbDs12urJ5r0RJj
         aPHw==
X-Forwarded-Encrypted: i=1; AKwUvBwlRPbF21rPHn/THlEcxHAd1xCmDPPpSMHZz3FWvbksnUe5m4u6HZo62lYJUwAvb8mGa7SDoE+ec1ix@vger.kernel.org
X-Gm-Message-State: AFq9FYK2eMQrlWBlWSh4OJ/zx524fBx1kfuTO/uemPpBeeQi3S2/90AE
	C13Pone3zwC+gNk7G6NJyBVt8xubg0x4W+nGahn4TgNacAYnRPIFm10CBCVxzRXoc8bRb4OyxRf
	a6q1o3NB4uhwQJRPbQakBFQrvVcXZCm5OxLdlbSRRbz+Wv+Cx1aMYdKXhnvclofJi/RgkfZzosM
	zJ7J+4LVammxva/2LshWCMvzxfMV59RITHzWX6pJZd9p6wn4unKAHBJGdPYyIwBFWqAyeiArqqG
	Lgv4du64BMZMOWrxs2wCg==
X-Gm-Gg: AYBFou3q2x5N4lJd0h5yjj8afNvm3sd/GogxL6PPoUdKsdC5kL3XNFIR1CmZqISWk/r
	PafXwLsdyYFIAmc+A3sctBba6UpIk7S7uBuDTOTUEyW2Nb9/p9WUZKJ/QSXfUG3ZtSu+n6IO+h/
	OHXkdXsBUUg5IC38oVBaDTBwXx4LO4CIcTiFrddUzjBETNN7ecaO9HlB/sxSqEOT21bKyC9u6gi
	OTz9pW39J9DYO+zsmZ3+XppOB+g/IsAp8o0Ta2JY6mByNmGTdToLo3vtvOu+PmHca8KyifCAAIl
	ylh9IvepYyqoaHxIVSlkpXpjK0C71EwC3JNv4Iru3vwXYIhrs79SlkWP8jEuiHT46adcmC7vIs7
	BtqLz3l7ICr5vOK540p/sWgEuqK+la/VV2k2VAg0cb/muTmfd9rKs9WuSru8sNPX0a3sLM6n44P
	JioYoIR334k4KdLv4GVmHRZy50a2Uywy967JvIvrPM
X-Received: by 2002:a17:90b:3142:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3ae40268bbemr385094a91.8.1793049123397;
        Mon, 26 Oct 2026 14:12:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae4085eedasm467999a91.8.2026.10.26.14.12.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so380728c88.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049121; x=1793653921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=NnysnYU79YnMhg6jBSRtE+Fl4SdFXflwUjWH0sCUcG7gUl7ebUhnf3ZwNUCXCAF9VP
         jxtfuO5z99UZUwaeAM7SVNyvAPkFb8Q1uHbiSN4Gxl44r+eZz0fD3E+5EBEjPK5eVgOA
         rT+ZXQTw6PMvAANqPbelwSi4jlqjcLxNRVa+g=
X-Forwarded-Encrypted: i=1; AKwUvBzy/6jbtv95LGNC9MmjMNZH8kTWiVdyA4LSCisX+gw/NP8AtB2fTDSibogHZa2VDARDeULq0j0twcsV@vger.kernel.org
X-Received: by 2002:a05:701b:42d1:20b0:158:b944:b15 with SMTP id a92af1059eb24-1a3c6150260mr1039945c88.22.1793049121332;
        Mon, 26 Oct 2026 14:12:01 -0700 (PDT)
X-Received: by 2002:a05:701b:42d1:20b0:158:b944:b15 with SMTP id a92af1059eb24-1a3c6150260mr1039903c88.22.1793049120586;
        Mon, 26 Oct 2026 14:12:00 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:11:59 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 1/3] dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
Date: Mon, 26 Oct 2026 14:11:49 -0700
Message-ID: <20261026211151.3212237-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
References: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Describe one APB register window per AXI Trace Module. The counters are
have no overflow IRQ.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  | 43 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
new file mode 100644
index 000000000000..686b20d4cd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm5301x-axi-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM5301X AXI Trace Module performance monitor
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description: |
+  The BCM5301X ARM subsystem contains three AXI Trace Modules, monitoring the
+  two PL310 AXI master interfaces and the Accelerator Coherency Port (ACP).
+  Each module has its own APB register window and fixed performance counters
+  for commands, data beats, channel activity and stalls, latency, and cycles
+  with outstanding commands. Counters support local start, stop, and clear
+  commands. No counter overflow interrupt is provided.
+
+  Each node describes one module. The separate ATB trace output and its
+  CoreSight connections are outside the scope of this binding. This block
+  is distinct from the BCM2835 family AXI bus-watcher performance monitor.
+
+properties:
+  compatible:
+    const: brcm,bcm5301x-axi-pmu
+
+  reg:
+    maxItems: 1
+    description: APB register window of one AXI Trace Module.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@19003000 {
+        compatible = "brcm,bcm5301x-axi-pmu";
+        reg = <0x19003000 0x1000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..b97f22107fbf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5220,6 +5220,7 @@ M:	Rafał Miłecki <zajec5@gmail.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 F:	arch/arm/boot/dts/broadcom/bcm-ns.dtsi
 F:	arch/arm/boot/dts/broadcom/bcm470*
 F:	arch/arm/boot/dts/broadcom/bcm5301*
-- 
2.53.0


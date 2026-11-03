Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679263;
	b=2wXuaXLy1yNYi30wFp9x9+kh1f46l3PLqeFOMKUBgCRki1gbtcN2cq7sYqYKfOwu3I9r
	 v7kNc/J1qAVU4Hz0pQ35GbRNsDxb2abVwSD4YGX+WJCl/QAASwii5V6cI5bIMh+y6nr+n
	 mHNlixQMeaCoNlhrl0L8OMm2K4vecyuPYtK2QF9w+ngApNf5pn1aF0kBOHbQ6J0L+6Vqm
	 RvA3hJsMP/A8DsZV4Uk0QJ0drgWfMDJqqwXlMI4htJair6SF0G3fLowXmzMlqWl1XtZUd
	 RE82n5zZhPk3rPpp+DAq7jSrymwDcN83zC0ZpUXuPjzO01mAVOZna1aCyx6szMsEsyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
	b=sccrp33dUJ5daLzxGOX/VMS8pNm5eQz9nOMltU9nuEnFUA6Pl6L4lQp3BsuVm4+y1fFs
	 D+786oXIZzHK5lq7nqMIvQ/iPkhQbiPLRazxTQ2d3Dh83rx46R4ntwxiqW16bNPOW2c1s
	 qQAGrSV50nrNhCNYCINzwY91pFhUiVVoLmuLmA49wRDCnmWpJWZD8LjOhuXBvZgFghKuR
	 tWV5E0SiR7XzPfPcBCyW3cI+jXylbOfgmhgyNSMHgv/Nuy1Eon0mSQ1aMVwHPNEfFHopb
	 aiOFZAOpf2RuT0DnPP3vr8T58mVE3WXZJXm5ZJN9wjNmC6F/CjZULcH3BqTbpOYReRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BdIcOseO;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73717606D809
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73717606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BdIcOseO
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so4788751c88.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679262; x=1794284062; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=BdIcOseOhpuAfK6xAQ+mLDjSfeRR0ar6JK4YgnEjgYAJMDvELqpGJfZJKOfcLCsrwa
         t0HzXn06JzLcc6MZvKvyn4m6SGchWI4kWEm2HajTSG74HLVz3xbQKLpXVTtKK95vTq0x
         TIbJIj+MYTmJBbwxOA3mxL8zheMbZH646Naqs6F+a8SdZMNlC9+hUw3mfUPW5iJkOQUT
         XdNwQHrOK7SJqFV+Fn8MqPGCSZGr/CW4tL8h4BdO2eM6FAhrPYT5vMItA/ahkyeLu1+F
         jrY3cpPoXWmWOwLJ/l5GPPjrOE3NqYEK5etTpwmM2Iy0kfblmoQ5w39SmX7SSNJKiF5D
         T8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679262; x=1794284062;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=RPXRP5aw4UFM+iRmguCFTbI6rQLq7xQ/4jSS9D2Isi92UHsp1aSQJBh04BrslRmiDh
         p6vNoHQeWXmtcu6YPDwOieBVtrq/p6GHSfYUV07wVxJybMGHCPgJHonFfGX8qa6VWCgw
         3nxmcwBbCXABx8GHTkd/ncxs+fd1SKMNuiNRLGPlb1eSU0DSPU+MP0FGysvE5vtumEmT
         ZGyDWk7/ChTrO9D72X0bNZV5jGYvOZyn17uMhziT434hKB3eUY4NZ/1DfsnBr1eXl7nX
         AfZ4GiGjNDINeYHuThsTtvlftmLPEzORhUEjHoFX3i8DubRiGIJS8HK3ahoAonmvw4xD
         ZVrA==
X-Forwarded-Encrypted: i=1; AKwUvByPIbcEaqOdv3UBMK67Hlaf04eg+HyU3rClRTXu6rLpg5QBgCgd6gjfcgeho4EOFk2CltxxvaMIRq9V@vger.kernel.org
X-Gm-Message-State: AFq9FYLNE7x6T/fXiPupo8oJpxQj5AAxGZTpxQ8OtTcCyRehetUT97lX
	QNhMmPLzntexUYjcDc7/qm6LbOf/iUiL/tKXkAhLuVi9hZ3IdI7CkDG7/bc8rWALOfGPM79Ywd2
	8H4RGmV1y1g==
X-Received: from dlea6-n2.prod.google.com ([2002:a05:701b:4206:20b0:18f:4e29:3ddd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:c907:b0:151:6e80:baa9
 with SMTP id a92af1059eb24-1ac5a2a138cmr18327294c88.12.1793679262015; Mon, 02
 Nov 2026 20:14:22 -0800 (PST)
Date: Mon,  2 Nov 2026 20:14:14 -0800
In-Reply-To: <20261103041416.2940213-1-irogers@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103041416.2940213-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103041416.2940213-2-irogers@google.com>
Subject: [PATCH v16 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dom Cobley <popcornmix@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
found on BCM2835, BCM2711, and BCM2712 SoCs.

Depending on the SoC and security configuration, these PMUs support
either direct MMIO access for the System monitor or routing via the
Raspberry Pi firmware mailbox IPC for the VideoCore VPU monitor.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 50 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..08d8c7c7e476
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm2835-axiperf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835/2711/2712 AXI Performance Monitor
+
+maintainers:
+  - Ian Rogers <irogers@google.com>
+
+description: |
+  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
+  performance monitors on the AXI bus for evaluating memory bandwidth and
+  system traffic. Two monitor register blocks are present: the primary monitor
+  evaluates the System fabric, while the secondary monitor evaluates the
+  VideoCore VPU fabric. This block is distinct from the BCM5301X AXI Trace
+  Module.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2711-axiperf
+      - brcm,bcm2712-axiperf
+      - brcm,bcm2835-axiperf
+
+  reg:
+    items:
+      - description: System monitor registers
+      - description: VPU monitor registers
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@7e009800 {
+        compatible = "brcm,bcm2835-axiperf";
+        reg = <0x7e009800 0x100>,
+              <0x7ee08000 0x100>;
+    };
+  - |
+    pmu@7c012800 {
+        compatible = "brcm,bcm2712-axiperf";
+        reg = <0x7c012800 0x100>,
+              <0x7ee00000 0x100>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b8a3cb005c91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5338,6 +5338,13 @@ N:	bcm113*
 N:	bcm216*
 N:	kona
 
+BROADCOM BCM2835 AXI PMU DRIVER
+M:	Ian Rogers <irogers@google.com>
+L:	linux-perf-users@vger.kernel.org
+L:	linux-rpi-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
+
 BROADCOM BCM2835 CAMERA DRIVERS
 M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
-- 
2.56.0.385.gac671c819a-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662998;
	b=VHOrbGT5CM6vpdzXRVLK/Yinjbi7onAPfp3/AX97djVpRlz468hkwZeQ8tU9Krkp3vS0
	 V7bNAK0mznbxkq6K6JtzSXIuERbsgq5umLhnT9mBN53OMLGypYUQKPU6lNIJTftGs6KbZ
	 /Z48kwoCNE28nLYAjXNpdpcDaZgXNYSMZGenmGCmFA9V7aLfhPTekI0Ozrmo5UDgAXOfI
	 yrLXbrazlCICqm00hXM8GwGo0kpdFmz+Pwntmo4meY3fTL/ze2uO/rLbUfQ6H7SvBZhZW
	 sIdcTviFrlDBdGpeCNd3gpk1adHLpTRs7aEzuCI3WHvUAeXn33PELq+Mpz0DkMfBghw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
	b=5JBulJH296uyLviyYzexs1QCt0fSOxeDCcEuCIIWdWtvqQKjpiZfFilsAsFuxGHvEqNA
	 wlIMGfNKjstpyIMpRCcDTM2PtkYoMrAJUBNMiFHWbPPjZKO6ezq2FoDIMW1zqYhwEaWcH
	 SF8emBFdiJ4VETlFFLq3dQyEzbTdqAyyvRgXLT90HnIfgWrGA8USpIBbn2GP98JimOsEB
	 hIwIHzuI5Z0sTNGMvsD1/9eWcQjTK5Yhr2Xa6nNwBfiXrLOMAU6n8n7dv4Klay7vZ7BW1
	 TUQF9k1/8wsfbkuBl8Vf3aYJrecMmj4Avg9NMfpmUD8N4yclbV7uMYXI1DwyhxBHieQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h7slvxTL;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5FF606A33A
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 23:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5FF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h7slvxTL
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5528652c88.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793662997; x=1794267797; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=h7slvxTL/jKjugkS0cBsR0UmBvQK7WLAudDKhJyKMnMwk4+1TF8mYe+pySHdazd7Dt
         GHQY9K8ZnDL0sYm6CitMK7zyWINftRAhp+P8VePX7YpE7Pg/MSBn3bA1H4qpZ3r7P933
         01vEN0oqTzX75hpceIdxbJpgmzIwvkAZn9VX+Y8Qpci86/V2hGxdZfzrqeMv1dKfZcj4
         gMRbtGlb84s2JtTG/Gtgs/iEjZDMwOokFEHytjxlEpYJZ+o6ITbQTnkVptrjxj7IccCc
         oVnvY7/5K1v2iPm9J4Of412YTfEn/K0cmVVCLcnc5BbGHTZL03lQPGC0QS7XCvOF7MlH
         Bj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662997; x=1794267797;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=FVi6IwLaBXgOgu872e1z7qFEfHlyyFy4NnqtsqaI56HNR9y2kUKqokHyIsEYyFVRUj
         Sujjb6FQceW+6FmveGFB9+wedcD1WQmyj0vF9FAD8fgO/dsR8icO72DsFwHgLRDP6zn3
         JUOp8GkR2REdI9PNcsQDW5qoktEtBbSotcM46pcs0Y/xQjxEj0pX8fi4GuC7gJ0FeHvR
         /wqyf5EKXbKwI+Qp5d8ZxWWVIIfCVmzd9w9l0SeyiqPDtfbWysjbh5N/0MA3lEi/VHHx
         oPeSlDDSBWFdUkfiWt12o1V35npwPZYUSDKpITQbU39AwHU5ib66AVt6J1I4odspZkS4
         4FWg==
X-Forwarded-Encrypted: i=1; AKwUvBz8thN4UMjdnfoPxUdSILxchldvYSHmeFlN5P7eDr+lo0daGVz90Gwzvv2Wo1TnzZBXbEWmJrTFeoMy@vger.kernel.org
X-Gm-Message-State: AFq9FYJX2KXceBvb1GqnkA0/ZjnjIgXZhXi2Dco8lcoYICo7QbrpOw6x
	ihrMGgMlF2ssMyekpaNwVkkcvUT0s3Z41Cl4tmdLIKSckhSPkNSBnMoQZvfw0bqQVwi2DLzPys4
	FqAeWBUQwFQ==
X-Received: from dlep8-n1.prod.google.com ([2002:a05:701b:4588:10b0:168:3bc7:9e8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4213:10b0:1a4:fac9:aeee
 with SMTP id a92af1059eb24-1ac56d95c0amr16914327c88.4.1793662996134; Mon, 02
 Nov 2026 15:43:16 -0800 (PST)
Date: Mon,  2 Nov 2026 15:42:59 -0800
In-Reply-To: <20261102234301.2242242-1-irogers@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102234301.2242242-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102234301.2242242-2-irogers@google.com>
Subject: [PATCH v15 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
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


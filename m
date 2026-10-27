Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123495;
	b=0xY8UZMitfybLOix0WuHYKHSljRX7dBpiMlBaZkvjO4ytg301bAJRZEjOwdsGYBxO4yd
	 ym8+PPxtdTNuquoCDsO8+fdXInuawdwJoU3Mz1Vks22v1sMhK6FMsFJ4acvupElsT0EYp
	 L8GW/B2CQTyn/XeMG6hwHlNBoHzCeCAlw3kaULn9agIdP+QWh2SSj9WpBVDkiiVoy56hc
	 gSLq4ZobUMHDSxI2X1dk1AmkNTS+XkRawH0e6NlFbf1mar9zuzfY0rjPh59VEWpi5lZ2X
	 F/lXWnHGL8duEgA6TnQCyx5kBijY5Hl41j5eEbDcGyVKCdCkbVtFeQwTU6QDfctvuqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123495;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
	b=RQ7xqXYDvNxFpeytR7gGvQ4B9rGwXn4emWL4+AF7BPKa10bPZuUGdJw6PmM6VIjS5rez
	 Kh6r5SI+wpT7kfzibpUU6Flf8EaOx4sH/8IZU/1/D0+I0XD7xA9v8Ac1YYy+flInTrKNM
	 c7jXnMP/+qzLC7uDrA6JFdKc6IVTuYw2VyLiIW9PSaC4hGjqgyjOIzDQDhn0rtrXa3tGW
	 wwrRIDNgtNoHP8UUng2xSn0fEOBuNI52XDs70xsT5/ckw/fymWgMH1w2ziLLxXKWgU3TC
	 G+DBHQedGacMqnQBAA54JQPGO3i8fQenK5g2KWx+qzVTgHvNKYntR46rzwTG3HHA3oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fIArgy0H;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69331606A325
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 17:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69331606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fIArgy0H
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so77781a91.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123495; x=1793728295;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=NTfG6dkavDBrc7xUDkxvUbKCT4BERH8STXbsoFkSCCWh5f3CqYvFL+geImX6RB/gBC
         mM/6b5uzfrwBx2urn/wkRJnqsI/8u/ZckaeZbiklJqljD1MA+y1uxNFPzJdOrImMccic
         uNtoNgQ0tWWNd3Oe5YQ7oPAOij4JW29rZe/m+GVoUy7qWSczX0/+FhMoKNEiCUOQEeHv
         PoTelo0ZI/eClHpVHRqJ5kxKzZ92C8qMPTzo1FtAnepHBwN8TMYRo3Jt20yU+1UdGVOG
         zg+pMqoy7CXAJVwbKveGSj9grNIg4WlctxgyZga9fujUYjpxFPM3XvQj+G/U2n64EEDF
         Yzvw==
X-Forwarded-Encrypted: i=1; AKwUvBxVhudZ69xbIKA0+rPR18/HQ/3Ie+1iOYhbZBziR+axeQhty+HbuxEYEdQyw+nQfukpyrzszAiTcx7v@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1x7rNtqxtrXqnBmMza3quFjMu2uc44HQbR/oclpmkzuhYgmQi
	PU7ceAE7TYJ+i+KT5elIUqjfndcHWgH3moC6Dk2Fh/s0drsgr3RvZWlEQpTPx3Gd9Iu88n0FjV1
	IvTHOORFzFoj3a+ZKBqUYl2MDXlyJqjxhmLhwz2CSu6ZCQCCmn2sKqF8hGO7+DfI1qz5kaqFomD
	6vRqSH9FCpJXS90ioNZgAEDWEPCHIYCxbcpdn4nYA0wCZ847pjlx8PMflxPunEONWY6ZW7+bp9D
	SzL+0XAvoC+kOqFjKwLd83I
X-Gm-Gg: AYBFou0nqleG3OCW+r1ODTdNImYmkUW01YAVuPEJmNlnxKa/f5Fa0c99dEzFGfOGSPb
	kxtQMAFczRljU7mlnJh43SlV2fjP9Vq3RrWMnLRfYDmKhCLdhmG9pxhG5+nV6g0fr6kPW5C+Npp
	75HHbGY6a60YkANLLckBNER4046YncTqF8kjCPCMULdpIFLAiSi3EHtx5awjXb+64JI526BtgV9
	sRZj8/5UJjMasx/s3c5/QW18RrFOQx/HL8DXLyYE3li2xmfAHrdtMxQkKS2CNVjjXnDBfuVAKn9
	mu0k4GwV20E67THB2DxsN/EuI9OQu3I/HbW2chCfdWx+3s+oW64XXde9RGFmrYRzD5gqVQGM5xY
	1nYbunVC3AEpAmRDKbF1RfW2pQ576TSY97caACpqnFGQyKNrjlCzduQGML19c/OJE5xuO+4ZANu
	TU1rOtEzQu+ZYzbTUvdoD3uIaQvUAqleOt9483cAhenAM=
X-Received: by 2002:a17:90b:2711:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3adead502d4mr8497334a91.39.1793123494717;
        Tue, 27 Oct 2026 10:51:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae40619b11sm3002780a91.5.2026.10.27.10.51.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536720195ebso4430621cf.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123493; x=1793728293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=fIArgy0H+v0gsmzP3Dh2wg3Vs5PuRfD54J0bLaAVAXK09gO2ulOnu85NK2V+BWpXVX
         U2ZD7AtClFrxDfiAeQMnYtM6ca8QfafDHndMef8fPHVWoVl/e7nt872rs8ziOF6HA0w2
         aMed9tDVBngkJxtDk+2nVV8tF98GM0VsPXRPk=
X-Forwarded-Encrypted: i=1; AKwUvBzcbnZirvmSW1pl+wcXEOoA4Mil4CUK/jYT7H+ZkjkoPnThwC682wRHnsJrotNFgpwHW1xD4MuHuY1p@vger.kernel.org
X-Received: by 2002:ac8:5712:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-53fcc9bfcbdmr22101cf.48.1793123493317;
        Tue, 27 Oct 2026 10:51:33 -0700 (PDT)
X-Received: by 2002:ac8:5712:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-53fcc9bfcbdmr21461cf.48.1793123492818;
        Tue, 27 Oct 2026 10:51:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:31 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
Date: Tue, 27 Oct 2026 10:51:22 -0700
Message-ID: <20261027175124.3518239-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
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


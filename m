Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684044;
	b=zIMuccI+GVbl4YIERV96rtge1nuX0FA51FQDw05YZZepaNC65+d65kdFPiX2ZPdoqzT4
	 pBaNRsu83thb/d5IR2rZWkYp0ye4sdycF6szI3jEVjDDsh5ALAqaD0l/PPLwOR4+J5l8D
	 eMQb9tgndZ/Ls24W+EIh1p48WRdP/lxFAymYtt2DfL58FlISTjLeVSoieIFgWZm6F0GJj
	 wZDCbni1BxP3zksOoR4JKy315DfC26t/d9YdGjzBgSYaWsBSnFU1DrWcvmbI6w0xMnGGs
	 3PBi1+RuhBVN4sgOAoyBq4GRHUWupamgokbAr4KPeyBVA8Bp34zVnZgbBl48IIChrlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jN1kVMysduhM1CTMvsxUGOmjxBfuDSc8t5gMB3kEQI0=;
	b=LkzIJ/WankpK85b7toBVa+dTQG0qWjldqwLsmtBl2uFqcJAisUiDFfsZuP0pMs67JRbx
	 Blx0+fxn91o7dYO1uox/7LFZgX8KWTQO0X9+907rSLSZUHp4da4b4QbhSp+St2MKbz0pf
	 QGa6FhTJLRRf4GcngYSAdbqEIzlhBShqFbHZ5fjFw+N9djY8ZGtpuIqsyZrY7h7vOBNGg
	 HmoBsVMBv6MM28NoLMifgvMHPg4czuYpntUTw7hxc1t0gmGCWFjqAo1AGwVfYAT9KdBTz
	 XUXJO6Dx1zrrK1FzOtlAVYWe29mTraV/7p9EzOwnAnvX5Hv6k1wN3SmnEnsFZk8DVjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Z2CHxPzQ;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEADF606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEADF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Z2CHxPzQ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386bd881d39so6507412eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684043; x=1796288843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jN1kVMysduhM1CTMvsxUGOmjxBfuDSc8t5gMB3kEQI0=;
        b=Z2CHxPzQR7nllzOczs7mQ293OqPNTtoaD6ACfI+137kHwNuG1SOQOE4PAZlffeb0IY
         7+D98n6saKwfxLvV+YEWCQ1ALh/Eit2Cm6TkGEqBHCfQ2Rh9FIWctXgTVo+rsWVscDGn
         inzh4RRk1W3/mi8kbLFmhyhmZMxj9W40x/0z8w6wAA4v3L2C2UN2hklHy0W8uJl+dSNY
         gSgK67Fdc0mmnusf5TZMGPo4jnMJuZR2D3gUPwSprflsyV9KYI/zf76Vzl7Wdv71HMs0
         I81JiayW8ejNOoQ75Pbpg6w4WM9v8gzLRV6ceC2GcTE/g+x4Me9SLKRYML57vbhhDtbo
         jJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684043; x=1796288843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jN1kVMysduhM1CTMvsxUGOmjxBfuDSc8t5gMB3kEQI0=;
        b=ZYrniSuWbiIkEFc6F0hmFMn6rHYxH+Pmx4YGQTRYsIL6YkHrehPSs9oiCItfG4j/jn
         vxWTkGBbjjliXvWYss+ekIWWdyuzjw0t6osDLbVdc+Cy9Auwc3QqYrhagGaMrX7TxsIQ
         P5NzZdvzungwLu4OuL6PGDTWQQ9wXstFkjLRGOAFTXcZFBycwxnMRnjOAnO3kF7oCtSc
         ZcSJQNOOdtnPkV2p9QscPBydSLyYpeeHA8RbpDOCYfaJ0E+b3evK3VHjk7hpo+0AUNWL
         rVHvMTlIwIlDK9VjfaekAhhpXY3VOaaez0sm1Bt1DCXyFs/maHXpYH2nun48RV/w8Q4Y
         YCPg==
X-Forwarded-Encrypted: i=1; AL+hErEgOkPZKnpzNoImpeCw6bTrbuyguj+0fFxSCbuDaBHsqaebA2qci1WkySzP2Xz1QpVyqlWhXIATlCNs@vger.kernel.org
X-Gm-Message-State: APuU4Z8PyC5iGcbauvdsMpkZxu6TL5Q+Smzq7DnKny3/kbZC0sD6nBD9
	2FDgSD42CHRIZMezBdN3ytwGQjQ5GlqQ5DcVDQHw3TFo1PAX+7bRXw4IUojV4tEf+gYw0rKgL5s
	yV2SLs0uKIm0mRpjc3usUCWZ3qMV2eBjR7DtWAIehmivD4wbdy1zZ4XcTAF0rEoi0TNhp/a7cwB
	MzdrRaVl1hiYk9B4x0boNFp5sTMDPSujrNRHl9vLEO7N6PC0n6tQ==
X-Gm-Gg: AZFdTZfoP7j7UhYn6mONaMFWiSmacNI65OPaqBjxw5A8cBOz+VYhws8gq/2JxnoKYUh
	Vs8oz5NGqFXnvD5E+6MgtHYe2SqP5hmbrRXOftj+xxhmiqPI2eJqfTAe6UbGMhlEh7vlfnIcpun
	2V+v0ftr5ADOEt8tYZsA6MOLR8rZHWijhVUwbRRWKogqfddjiUh4AqfL61Si/AIqSHs40pxAUKW
	f3USnfRZYCnr/xqmbsFpDxDE32SmZ61tcaES7sFJmydecQa+TKxCFmfMrVZvEl9e3xN4yxehbP9
	zE201q8/sfIs9imWV/w5pUyxURU6Q9Xtw+U1hi1ghhXHtf1lBIkdFnBYAsXJ/2kis8CoQWsPPpq
	aj/7PTKPthGbPzobGn3zD+RkYpEFt/bYVB1JQeoRxolaHLK6t5WQwdOCIYZ6EIUOhtmZ/THw1A0
	5QQ8U/+DtnEvjduNLEgOgxEiKvnQKVQwXUY2DLN4PtsGxtVAQlzkchctNBDZ3O864lW0OmDLBJi
	cf9SE/dchZbkBNVMI1Uj/qnad9QsgiZUTYxPH5NW0WEKNXhR8jA4os2zaGms02BKKRXElglLdoY
	/85DwaKaNqEcyn9aMZTvizOKYE6AwqoIU3Ihezsu4otU
X-Received: by 2002:a05:7301:416:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-38570f27b33mr21020696eec.29.1795684042660;
        Thu, 26 Nov 2026 01:07:22 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:22 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:07 -0800
Subject: [PATCH 01/10] dt-bindings: riscv: Add SiFive pre-ratified trace
 components
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-send-preratified-trace-v1-1-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0

From: Eric Lin <eric.lin@sifive.com>

Add compatible strings for the SiFive pre-ratified encoder and funnel
trace components. These implement version 0.x of the RISC-V trace
specification and do not support the generic riscv,trace-component
fallback.

A pre-ratified component with an embedded RAM sink can use a reserved
memory region for its trace buffer, as the sink registers restrict the
buffer to a single 4GB window. Add an optional memory-region property
for this.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 .../bindings/riscv/riscv,trace-component.yaml      | 96 ++++++++++++++++++++--
 1 file changed, 89 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
index bb519bc4a163..10660b8ce071 100644
--- a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
@@ -16,16 +16,23 @@ description:
   The RISC-V trace components have implementation specific directed acyclic
   graph style interdependency where output of one component serves as input
   to another component and certain components (such as funnel) can take inputs
-  from multiple components. The type and version of a RISC-V trace component
-  can be discovered from it's IMPL memory mapped register hence component
-  specific compatible strings are not needed.
+  from multiple components. While the type and version of a RISC-V trace component
+  can be discovered from it's IMPL memory mapped register, specific compatible strings
+  are used for pre-ratified trace components.
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qemu,trace-component
-      - const: riscv,trace-component
+    oneOf:
+      - items:
+          - enum:
+              - qemu,trace-component
+          - const: riscv,trace-component
+      - items:
+          - const: sifive,trace-encoder0
+        description: SiFive Pre-ratified Encoder Trace Component
+      - items:
+          - const: sifive,trace-funnel0
+        description: SiFive Pre-ratified Funnel Trace Component
 
   reg:
     maxItems: 1
@@ -35,6 +42,16 @@ properties:
     description:
       phandle to the cpu to which the RISC-V trace component is bound.
 
+  memory-region:
+    maxItems: 1
+    description:
+      phandle to a reserved memory region (shared-dma-pool) used for the
+      trace buffer of a pre-ratified trace component which has an embedded
+      RAM sink. The sink limit and write pointer registers of such a
+      component share their upper 32 bits with the sink base address
+      register, so the trace buffer must not cross a 4GB boundary. The
+      region must be aligned and sized accordingly.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     patternProperties:
@@ -117,4 +134,69 @@ examples:
       };
     };
 
+  - |
+    // Example 2: SiFive trace encoder and funnel connection
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        trace_buf: trace@80000000 {
+            compatible = "shared-dma-pool";
+            reg = <0x80000000 0x1000000>;
+            reusable;
+        };
+    };
+
+    encoder-0@2000000 {
+        compatible = "sifive,trace-encoder0";
+        reg = <0x2000000 0x1000>;
+        cpus = <&CPU0>;
+
+        out-ports {
+            port {
+                encoder0_out: endpoint {
+                  remote-endpoint = <&funnel_in0>;
+                };
+            };
+        };
+    };
+
+    encoder-1@2001000 {
+        compatible = "sifive,trace-encoder0";
+        reg = <0x2001000 0x1000>;
+        cpus = <&CPU1>;
+
+        out-ports {
+            port {
+                encoder1_out: endpoint {
+                  remote-endpoint = <&funnel_in1>;
+                };
+            };
+        };
+    };
+
+    funnel-0@2002000 {
+        compatible = "sifive,trace-funnel0";
+        reg = <0x2002000 0x1000>;
+        memory-region = <&trace_buf>;
+
+        in-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0x0>;
+                funnel_in0: endpoint {
+                    remote-endpoint = <&encoder0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <0x1>;
+                funnel_in1: endpoint {
+                    remote-endpoint = <&encoder1_out>;
+                };
+            };
+        };
+    };
 ...

-- 
2.43.7


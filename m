Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E53435EEA
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832217; cv=none; b=J53RwoebWq74kEj0AQayXDXlst7lx97rRTzFWnzfO8jRrPn8Br9bj4VanyiBwB2g0mNTQ39EZudCjQAuewhBsgIjq+RZfG6e1gIQUfBIlzhg3WDAymwm9NwIeNW2BCf46kQcLKuskg+vHqlLoaH0hkkCRy6QbM/5UBPfAH7gn5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832217; c=relaxed/simple;
	bh=a7AiH9yPvN1A0yGeVDvmwiPG+fZZyNs8urMXRbNjYbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PK5Vb3B0oWNVMtEL/igw2oSoDiSOzWhi279CBGD0kiaddGLytHgUPFjKTgjv0kWpqU6JzaFiJYp1TJ8Xt8qilInRFvd6SzZSrv+vmowjSQhMXsm3642COaX9CMEGYlJgGB7LnbtWROIV7pJfWUH7AL//b6pBuecAQh8J8Qf6rkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7vI8qUQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ue7tNSlu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7vI8qUQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ue7tNSlu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913h2xQ1090587
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 05:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8XxsVc+GOQv
	zjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=; b=j7vI8qUQEtd9b2ruCBCEx42+akU
	jHkO5xfDE+CR1wvDL8mVMiL2TnaXqXry0yzK7GtF62kJfDsXheiM/VJidAel3Iar
	r4vOX1nzNQsSZHhNY4JEKEmIixSzHYsuWrm+EqW8IyDQ9spF8y9IPmS4QIffFX6k
	YMxg3ox4yV7PmZPCYTUs0WfF9UezRqceAlOHz+zGZkvrlgTjKfuTTp5bpXOQX9CH
	DVegnez8WnmLG79PKMctD8+gTdTqSg+i0jcqYgxDyMhr/ABTvUHDInhfj+qWOS51
	mkFzy3ryHKhBSSTsukJHAhAMrhxfvtG4r/I3dfwFlZ+9VMUsuTvlZJUZBXQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188ssw2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:23:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e2e0bc619fso14525495ad.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 22:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832213; x=1791437013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=Ue7tNSlu/onmCMIRX2B6+l+hTeeg+egt8sG56nivbWbs/0+6b3wkpAvxRDoKZwExh+
         +KHHaBKHaDFIWhk/mKi2r5LKspUm54zbhpycECv625iyyRHi16mveW9OGCwlj4r1EvL1
         Nl/Rz0aeNvUP4FLihKY6595Vy4y08fY0MidprNzS1Ik+LBcM7yUmyRKvLvCt2sCCmLuA
         vbSDkt7ehriquiTyCN8OcxomladeSyFwkdSyk3jcOUK1XLv0dsUHOrxFp3Hnia3Y2eb3
         opHZPjqQF4uzWX0gDtSFx67/Hh6yh35lGXirVkkAT9L9EK7sgPpOPZlu+dLC1yfLQ1s/
         DYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832213; x=1791437013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=DuGbZUN5nH/BXtdzHFGAhdoiXGZ3SXfUfRvI0dT8PhL76G2tvH2OXQHf7FfUH4M4cE
         2Kc/jwTYWrMrQz4/MhPxWBGJfCLe6gKHxZl+QHgKOoYMz6UVFON1e1q003sU+J97RSfb
         05eBXMgMaqK5/fQi+XDUHUgnq1pQGX5j5FYJ+uIR/7FBYiQ6ydwopXKan3dRY8TF7mex
         yEN2UviB6hKs7tshDTHsqMuft2Jnoz6qHWmQjOsxw9j6gm1lpQvvTEWPSKrun6wD/Rbh
         bPGjqwlZih7DA8IE2sYU5G5qasq4WN8iRBSgeX9oag324frbNXO/W+6GdhUOcOb6WTaI
         SOHw==
X-Forwarded-Encrypted: i=1; AKwUvBya5ZTcSdkmizpb4V2YqizQZNiViHEXNL7bR9nna6Vm1CZSiDryPHHrwxM7K8AX0aQr048IsxmqajS1@vger.kernel.org
X-Gm-Message-State: AFq9FYI/z5gekRZ8t2P0iJkGkYEdRtbq48Q/BVgXk/Ir+JLHp7wsN59K
	l7sTRgSWfC0TowX68/dWPIMpBs4irvHwo4GFKdpe9vDEDLMkV2POUiB6+Snz+msDyipk8Abc93m
	y/4ISnNxXl0dRnL9sqj1pkirUfnMAhj2ncfW7IEMlYwAuqjPobKOsemQeXfVF0jf8
X-Gm-Gg: AYBFou0khoun4l6zxBxqVZA2zbty572t4Qsc/dRQKCxe9iLA0Nl1qIEUwW6y0U9e30X
	27WsgnAox+rVLQsKmsHIRyrycbVIyKkP22VABSmS1V/mwwBNBH8ye2YLXeKA3Lcp54UrEZL8jNn
	QTf4+Om949E8ZDtjOA5ov/iZ2vF9hgc0S9g0XYqqJif9XVPmwoUValQp7rWfcQA5kylXzXjxkJi
	PhuV6fzz5ZXJOZbhH2dqfdkyOlvJUSbpULSO3ZbcHx3pT4GjCUa1dIvIZLGcMkHLuPi4Sgc5K/e
	znCLwAEzYuUESE0cRfx/TK/ayXkqgDUREVf5YBnzn1YHiCZLWowlwPAX/wywPOnSSLxb7W6MT6T
	MwXPeuOllp+sDeIZ2B3JGTPDR8LA2UU3oUfAShTtVNlzCzxa7LSAOZbGQizRTKjnKnhxiOSLjtu
	qa3j7fqF/TUi14vBL3KRVEIA7U
X-Received: by 2002:a17:902:ccc4:b0:2e2:d39f:182f with SMTP id d9443c01a7336-2e2e4b35351mr25899475ad.28.1790832212377;
        Wed, 30 Sep 2026 22:23:32 -0700 (PDT)
X-Received: by 2002:a17:902:ccc4:b0:2e2:d39f:182f with SMTP id d9443c01a7336-2e2e4b35351mr25899145ad.28.1790832211858;
        Wed, 30 Sep 2026 22:23:31 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:23:31 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 01/14] dt-bindings: Add RISC-V trace component bindings
Date: Thu,  1 Oct 2026 10:52:12 +0530
Message-ID: <20261001052243.3042627-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX10weUt7ZQgOD
 1sUag2sKwwLhdlCVZ5wORK5aABy+uYy3AYl6WJc88xOEBcgMsozQyVHkvuqvVuQOo2J+vRiYGhY
 QRCBmTDznnR2OzXCvNn+ksUl2hg9Ov8=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abdee56 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8 a=f9mqD-BOXdQ1R_-L-AkA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-ORIG-GUID: ajOKnktfJImkYKPkzUWnXyBfyF93I7-V
X-Proofpoint-GUID: ajOKnktfJImkYKPkzUWnXyBfyF93I7-V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXwGGjqBMV1dRw
 1nfgQ6YqZiV/Uedlvm4/GHofXMdA0ZWR+kaTw8k8DonaVrZXQoIKz98y4uiNXzXTCIE6LnMbqWg
 Gp2uBr/lzorD4biS0EZKfLGFIzP9BhWnJmasC+zj9gljcQp6FEgFowTLMpXLY1gu22VkZnpopCR
 G3O2825/64EebbP/751ztgl/WYmmTmSldE2+UA2Zvy6/iZFfGjekVo1soohm3Kscr0MCUac2yIX
 4RoOqf4nvJ114jfwNDx6LcOOTigrRhNNwBXk85PoBa0OZIsp+Ah4lN4/gjJ5QWBr8DA8rAd9i3X
 Qc3ekbYpjsYzlXbYW1db+U7wUyO8gyA2UkGqLhCTbU6/QCBE1TIQNBaMiQMikjjZPSCo+VwXgOO
 ZVaTSnHxDdbjmOxR9VRhvNaTLzyhm70L2elEDk5D4/kCobtahG9/KW3uJVRpffXXWV8etfeJwpC
 nTUuJx9eWvtlFb5HPNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010021

From: Anup Patel <anup.patel@oss.qualcomm.com>

Add device tree bindings for the memory mapped RISC-V trace components
which support both the RISC-V efficient trace (E-trace) protocol and
the RISC-V Nexus-based trace (N-trace) protocol.

The RISC-V trace components are defined by the RISC-V trace control
interface specification.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 .../bindings/riscv/riscv,trace-component.yaml | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml

diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
new file mode 100644
index 000000000000..bb519bc4a163
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/riscv,trace-component.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Trace Component
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description:
+  The RISC-V trace control interface specification standard memory mapped
+  components (or devices) which support both the RISC-V efficient trace
+  (E-trace) protocol and the RISC-V Nexus-based trace (N-trace) protocol.
+  The RISC-V trace components have implementation specific directed acyclic
+  graph style interdependency where output of one component serves as input
+  to another component and certain components (such as funnel) can take inputs
+  from multiple components. The type and version of a RISC-V trace component
+  can be discovered from it's IMPL memory mapped register hence component
+  specific compatible strings are not needed.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qemu,trace-component
+      - const: riscv,trace-component
+
+  reg:
+    maxItems: 1
+
+  cpus:
+    maxItems: 1
+    description:
+      phandle to the cpu to which the RISC-V trace component is bound.
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      '^port(@[0-7])?$':
+        description: Input connections from RISC-V trace component
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      '^port(@[0-7])?$':
+        description: Output connections from RISC-V trace component
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+
+anyOf:
+  - required: [ in-ports ]
+  - required: [ out-ports ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example 1 (Per-hart encoder and ramsink components):
+
+    trace@c000000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc000000 0x1000>;
+      cpus = <&CPU0>;
+
+      out-ports {
+        port {
+          CPU0_ENCODER_OUTPUT: endpoint {
+            remote-endpoint = <&CPU0_RAMSINK_INPUT>;
+          };
+        };
+      };
+    };
+
+    trace@c001000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc001000 0x1000>;
+      cpus = <&CPU0>;
+
+      in-ports {
+        port {
+          CPU0_RAMSINK_INPUT: endpoint {
+          };
+        };
+      };
+    };
+
+    trace@c002000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc002000 0x1000>;
+      cpus = <&CPU1>;
+
+      out-ports {
+        port {
+          CPU1_ENCODER_OUTPUT: endpoint {
+            remote-endpoint = <&CPU1_RAMSINK_INPUT>;
+          };
+        };
+      };
+    };
+
+    trace@c003000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc003000 0x1000>;
+      cpus = <&CPU1>;
+
+      in-ports {
+        port {
+          CPU1_RAMSINK_INPUT: endpoint {
+          };
+        };
+      };
+    };
+
+...
-- 
2.43.0


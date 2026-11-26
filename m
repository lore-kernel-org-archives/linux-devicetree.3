Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686967;
	b=ppPE5sPPmKl32ZIcEKfuB68l6aObfvlwGKDVv6R6v/nGXPKOr8gzMndFWj5i8teE5nfH
	 oaAElimv3g1Kgrrdup+uO6PlVCRx3hObDI7xXtFHPUK2ZOOKFZNFZrxz87voY4Lt+qXux
	 alwiXcZMynAm3sere7e+S/AW61wWvLR+T+GqqtvopMsVEia9VOatRCI7sj8I1bR8kmujQ
	 9WKsBvq/PbawAcUcoAdRLZA5iQfkm4PSIpxRipwvCanwH2Tz8R27Fm+wHeg3sogail0dQ
	 tiAD+vCQ0L2r1VrnH8XTsdn/qaXLyEnZeIvGx4ovHs12FxXf4Ru8tkBy+yaWfIATh0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
	b=5ilj6znk1nZk175TfZSFGxALXknvIWOFztngHBrxx7VTaEOjedJE5oNY4T0XB1Z0Ww6P
	 dzh+XpokOl+wHutCUY40NuYTwsk+KKagNW4U9tbMCWxCD0b4DNP+d7KGE2nP7GORQJ7sK
	 Ch50Habv/4swwFGqsYiSbcAwk09mrBEaHJl6XvUJLGhGJZFXhN3Q0/sS3IbpN5fmdKQNq
	 gXcDb0pQjND2RaDq0eaHO25YC31UwL6qLp7xTa6iuWsKYFwGdIMCyRsqiJRGLl+VxlKIJ
	 20l2U7AUrN51FBAHXaK8qunzYuYt7iopT+Utq4r9eVId19B3bYdNlnNZBpEwN9QaOdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+DarMAr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Qt/nU20l";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCF6606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BCF6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+DarMAr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qt/nU20l
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AuZ12594835
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8XxsVc+GOQv
	zjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=; b=D+DarMArmQcyB+qAMpgH8R3/4OB
	WYlEqY8GxYoKc/cJKkV7jID8ziKTAW5ae7BEMNdV9VG2+BfUa9u5F4uOhVICUKaf
	G59rC76KQGG2foWZvnfoMZZwjXVtkVWkSj5RdEtH+UziIR/aKvcRTGzuX7ISzlWz
	etYGA1yECL5b76bLnoW4B+L2V1mpgKgIpGiqCZ+UWYJG6pKHPH3yK7lsox8pv2bg
	HEwAgBHUEdocsB1G3OMvSmy6e+jXNsZ/DGAsQGKnji+9ENZA3+KhCSmVpMb+bFpb
	lhKx8YeV3Jh1e0NZiWZT0MYzB0Did67QLcsZM40KULTIY1k38H+uBJ8zfsw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sak0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso6084916a91.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686965; x=1796291765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=Qt/nU20lVeb5fmqOL5COdq+TSN5HrpAtwMoKoHUjOV4FAI0yJhlMSJNoNULpAg/rQ9
         RLh0fL82aGE6KDJoRON7V70cVKdrsK69QftF/GiCEoMXrTBpFCnGcdtwYQINH2S5SbKn
         wp0s7Sf5MPfCPKjmlCG16wrSmL4fUPiSSFYztYrJb7kowX8xjwXd/Qqg4iK9mTYDYKp8
         2wvPFxn10H0T91iLmKRqxxuL94yzh7HjvGd2rCVlZRijDNdp16LKnYAZ9n4LoW45YPDo
         yKrmDRkl/7wGcMxrbzfNx6K5H7W+qgQG+A6svNofNZhhMy2F/vcbE3ITWg50Wy718iUD
         sttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686965; x=1796291765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=deGtSDcbQQL0CHuvOzX8du9jVmNUBK3K9sqP0PFX9eQPQgmyLsjg97YzgQq0VcyrOg
         p2QRAUrr9QqPAwHjW7e1XzpH+FGpVIscU7W4eUGObyMq03rZLjtKKXxW1M8T71+Egxs8
         fYGDBUGlWTXeNLK/fvISNGkLJkKSEzCsqxooD1SyjY29vRiV1pKjltrEL8QcHC4Zpm4a
         pzg846261uEQ9NyicvkGNZh8QR1YET/H2VF06eTPyzQxxKa5SaU4FJskD3Ps7D9CsKHK
         s80h4F0pDRixkZcAB8iTSHz659xuRt81MfTHMdRm7PfFOS6ku/guc0vB5i4qnpCn/dPA
         f2zA==
X-Forwarded-Encrypted: i=1; AL+hErF4lW0ZpgFFgF5fDLAWfijTkx2TV2G/y0FFwGkapE+5RHtsNKicxxV6rQZbLf5XXuU4jW3flo8I0fyJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8aWv7PE9zhHZJvY0E6YVPDSutommZMKkVwnMgoJSRlr96Dz/kc
	nXE0NDomr7gVh2hBNngJMlVlhZtEavIWfT8mSON/7cWlP3cF3dz3IaeOkm0kbslSihxES57tDrm
	ZNZndU1hu7ghmLKAJ1noo43kbf50Fvz7VkXRhRbHn0CenzFB8IOwX71kTh4ozK2VS
X-Gm-Gg: AZFdTZf+iBgec55SR9t1r0ykyHre2amrsJcZ5WglZpx4z2iEafCpPXN6rNxQOckIkBL
	ZI+1c/tXbG44ioWx1/qrqKJFNgm83NcsxHiMG2cuCpwf72eKbhKhB/UnBE6aWMJcoLIBZWRCGZL
	HKcFT/nKpHwRnEcPllArJPSLBfN9l5b8/tWZMUDxa9PE6ICw4wrHRHgM+7iZ8Z9mZYv9DnySvZt
	6MdOiHFHA7DlXL4HpOOXWjKSoH2eJIDSUkik8y9H1q+6lK5rgX4mqC9Ou6g/fZQUKPSn/2ptWao
	HpO5ZeriQk93S0T0/ZE31sVPlX6wY2ZQyK3JRsvV/NjMTu1FqUPNdvGyR/MX/TS9ueC44InE8X8
	9p66O5MeJ/Whjw05fMnvQhMDPf/iBjL2qS8uTh/Ob6cLzKC1/t+/n2kdSNxY8M5KGDsN4WEbUz0
	zHCPJMkekGLN7p4qoMHnxuwUm5uj/bO82M3akh+rJXn199158IK7HugGCTyyrrU4yUH29cJdDFT
	g==
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12900380a91.1.1795686965446;
        Thu, 26 Nov 2026 01:56:05 -0800 (PST)
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12900364a91.1.1795686964966;
        Thu, 26 Nov 2026 01:56:04 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:04 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 01/14] dt-bindings: Add RISC-V trace component bindings
Date: Thu, 26 Nov 2026 15:25:22 +0530
Message-ID: <5454076167a828931e198bd167dea1e2a64cdd0b.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080236 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8 a=f9mqD-BOXdQ1R_-L-AkA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: yfCzYyaWNmYffn4j-wgGdgfG0rMoIjrq
X-Proofpoint-ORIG-GUID: yfCzYyaWNmYffn4j-wgGdgfG0rMoIjrq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXxN6A8Nm8ExeV
 fJixi4N7cT6BqzA5Y8NcEKl7cQYzsf5X4pb2CLYS9pd8xnbxGxivdx44n5cke8Cx+ak2EL+xSfh
 Ix5nnH0MnduaBACnLsJaWcCHftIWUmlq5fG7Y72+yE9TCdkYcMT0Mfe3J/upih9XcJO7lhmOmgD
 azBoR0Il29ZudOya1pV9yKWfLeqnANOn0uegKQHovbn8KGSUNH9ZqCxzscFXXKyNVnCsFdA8/dX
 1b71Q4k4IpxMLp23EqOOXTXejCWjeS4XV9dL8Yw9tlFvLOl7ahQjtJTmseJ6Lc3SOHlu/tgyXDW
 wC50SUGf0pzJtUW0mupcrRRJZZP7bf8bjTOQ4PoXrxxB09TAnQlyMkw7mc77yY1Rtpc1bDZqwWJ
 aFn6GxoBR+UuMm5P59jpoRUsWemqzLCB7QoE28on+F+ZXcIuWO74N86mCm83lSu+tz/4c1IPQHT
 ji6VPDsmVHl48kYoyiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX/vcoVdLEXFa4
 /i5XB1wMkpm9GDwVNGexCPSCPRw32CPIvjQ50u70eUD+pC4Ad33rLLp/RLRpr/5CCQKa4XkMNSv
 5hQhQlElds+7PUVNyvrLpeOwv/Kynrk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

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


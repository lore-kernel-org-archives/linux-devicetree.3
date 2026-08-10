Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E741834C
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375400; cv=none; b=mU964EfSAZ+LcpF9ha4IwaEATXH03O4nLJmUsBhBKCPNrBwHLZR/zxlm58zeXxH6nCH8vMCafx3ByXky7G+xLnYvp7M9Oksb4I67D8raLDH/sprHyMkBXd6RQ4VGomEpc/vpbyRkNBThwD764OWgrAu7if8ebeKEHt7lAR4xbCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375400; c=relaxed/simple;
	bh=NcWh+3cRWPBUkWPKYUjopSr0PuS9CdGo8db+mB/eUFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leNbMtld6sOWkFIlWMudOuJz6632l7lK7ouYwE1NCEw8INoI91/3Dv2k2QewGTFE8A+gbg17S/Ba4oFQFFKSXkuzfM1+ha0P8T43VHMSJJHCHcNY2GpbSZ+lh+ji6t5IP6cGMCEIpNgPw6zHoC+D9YQwyDSQfGVXIbqqaXDlc6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5diXRZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OejQx87n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5diXRZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OejQx87n"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACiwNU1671272
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O8v8yIaQJEs
	t5NLok5icCkr9lpo4Go8g22QAHh4O4hI=; b=g5diXRZcCw54/IoE0HVxU7Z5xRG
	bQBy6lEw6IUtpytPqpsTaNIppX96kasiMkEsPY71L11fEyu7Pq+ATnwtz35PvnBV
	+TYz57TdLJ9zRg6WhBW4DyO/dfj5LH52I16hZUDT1DXUhkC4sm9YU7jr8etn7Lx6
	65V+iyPqlZlQFohBc0pt2gSi59uy/mCr/08ix8tXdDWCLG0tCYoTsEWbgqbGjeJ8
	fXr1PVqXbhVf/AQvJZqCeWOfL8VgSa1YxGlLP3s4ATSFog4dHRWzUGSxzp2Ipeus
	dojeD5c3QHUQHPIZjfly7W4lnACKa6djnNA3dq0ntQ60aEsZz7/uQvNaqcw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v2aa2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so2666670a12.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375397; x=1786980197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8v8yIaQJEst5NLok5icCkr9lpo4Go8g22QAHh4O4hI=;
        b=OejQx87nAIZwW2dMFAeRFJnIVdvuFFA9FEBpIoQGoYuVtzj8IF9foXo5PcGEQx1Rxx
         bekuKd+KMf3YExUSKeSODHAMgxVkXtNJJCr1Hf+bRKry2UGN4qgO2Vc60SWIqxuHX4Al
         qbJTKyXrPGrHAz253IlflA5lOV53NE5Q1/msrI3C8/2NYArWYm2tctSyD/IvMGx/7MjR
         ullqJo82i1ZnsuaCbXPUwGrn39RZoqlQPVyFAwOvt0jfzKxe+6TnyfP9OJyziVCvFoEN
         g3Ic/y0hRg0FR1abWNFaQsPQnMehllFIFhqQmtR84wsZQGdgfO0OaMk6qI2wKhSLnWq4
         h8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375397; x=1786980197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8v8yIaQJEst5NLok5icCkr9lpo4Go8g22QAHh4O4hI=;
        b=dzuG2eDiVhcHtV/4Dd2OW0iH8Jkcp4vRx5w+HLFO/6c4+J0rdM154w7mz5sVvGVaa6
         GM2qCQ+F5AnExqxDzjHX9F7e2Hyt+8b5/nytS4mUk9lVrHGK/xUMz2lT7hBO/6S8GIlL
         WInR38eWDDeH3RGU+UdgSC2rHHdD6Il4CSF1IMMpqnIHCYanAcyhc4ku503dOd48HscZ
         4uGrue1JntQIxAjAI7ujt42gKiLb7zu1jd6z2cjN15emraQsVhTVg+AsuAfWNke33Dmq
         eRqVmWRqgXKpO0QzBBvDk/GaesQSRAYsbUjMttP3MDggNrs0NVUCKk0be++v2nlNh+ds
         tjiw==
X-Forwarded-Encrypted: i=1; AHgh+Rrcf/2FkPr/GaKsUp5/18U0ml0vPdXNTUMmoiaeEg7mTt9AVT0Ypo7Km9TtejoCJK4E7IMu4WleDqE8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2+bAXo3AxjM3ppTk41zCqxbzHXV0rENPGpV1iPdHevfTAGNtF
	w7+fa2CJCwxNwWq7OzA0sAsO97XDq1FBIE2HUXKD7GsbaU5TKXy2Xbs6ib/a5Xj2SuC6Cp4uuoR
	rxfkTcDEfdxLh8WKt/fYp5NpdCRMVqprACiKifTFcapmKDfjes8OqPj0+UvVnCva1
X-Gm-Gg: AR+sD12QFmmGpIlL0pxSgZfCY1wVk48CXIrRL+E0sgqElfhf88HOt3odQX1J8OSU7QJ
	8DK5AYgYXEqaHjLlnYnTfP+m6QFczBxOH/nMNMOhc99JvnJLJ1cAkTtc1W5VvYqc14/QKEsP+rb
	uXEIONZJIdaZkjAEF/QuPNuTspNFqeIqwuIEOJ+d/gH1oN7ND1JUxikSMHxmZcvUoA9EMkx6M9B
	w1H67kXwADpdgDVlkzxqYbqyht770FVRTFl4rImDQ4lrF2HTS+PDi4IN3y2UQRPioiCOuJoRYC2
	B72gNykabbG3417wKJ/lCzVuAukQDJrNxvxwpVrZTbGm/8vElfT6N0vpflcwlSrkaguLvlhMf/9
	Q4ek6riWbqBluHshkrrYKBXTnHuvqe7UNHupTXIDw3inUjUZArPoK1vdLlPOONUpQIn8QhuX+LW
	qUznIH9BOP8qXlv3hdfua0vDbMcA==
X-Received: by 2002:a05:6a20:e347:b0:3bd:3800:7538 with SMTP id adf61e73a8af0-3cb85ffdacamr47203016637.33.1786375396810;
        Mon, 10 Aug 2026 08:23:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:e347:b0:3bd:3800:7538 with SMTP id adf61e73a8af0-3cb85ffdacamr47202942637.33.1786375396337;
        Mon, 10 Aug 2026 08:23:16 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:23:15 -0700 (PDT)
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
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [PATCH v5 01/14] dt-bindings: Add RISC-V trace component bindings
Date: Mon, 10 Aug 2026 20:52:03 +0530
Message-ID: <20260810152223.3946743-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79ece5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8 a=f9mqD-BOXdQ1R_-L-AkA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-ORIG-GUID: wdRAwYr_kV6_xPXXTpN7T4sNoSHcWSEu
X-Proofpoint-GUID: wdRAwYr_kV6_xPXXTpN7T4sNoSHcWSEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX6P60mDQ81tJi
 YUR/EETYPPKb+2V5NgLZbBlSLhech8ZmJRHUCloRUjCFmu5bNx7lq34omP0yOVJ3fMQ96tlnFfp
 Nvigj5qOiC7Jgnly9bYx3ART3vXVhhvvTxLP6h2WOtNl61Af7I6HHPm8lxeFFm810j16DVkqqe3
 iM9SEZZVAXCGNWsdOL0OAf4+wukd7rR7hUN/cO7pnYvCzD/G0ah6O1oYOu2tMGNLqA6ciSDpCmL
 AR0iAevEL5PkkqKOfVqS8r+/shDgliiUQBpgmfGbFcXB12erDKlzFHMFGbGSJxU2SiLV6t9AyWP
 IP/hXRvIOpNVzYIvqi8IUwB9Hyzhj+7T0RzrzfqnPluTu3jPRNcMFYvCU5Ytas/XNlSV8MIhmGj
 18vky4LMlGv8W+55+Y+zRwhAMAKtf/6Yyw4wmVhN50F01fncdfaF8pnkdlaENCWDON/pIupi1jD
 +xUej4OgrRYZkbcisOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfXw8A/wZt3ofI9
 m9Pm5jhQLi1oYtl6WTkgWNEkvXZA0WGjaLodUikE5Tp/LffaRdIjHen+46ykueMFjC4Qk6Fe7HN
 S+gneu2zdpGCG5RCr3zk5AqLxtlq4B8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132

From: Anup Patel <anup.patel@oss.qualcomm.com>

Add device tree bindings for the memory mapped RISC-V trace components
which support both the RISC-V efficient trace (E-trace) protocol and
the RISC-V Nexus-based trace (N-trace) protocol.

The RISC-V trace components are defined by the RISC-V trace control
interface specification.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


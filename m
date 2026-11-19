Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078906;
	b=GSN+4Rd5D7hIjDxw6GDZ7KdVH3wf4KdqZAq3h4IdEs0jLIHtHy1ZZDgTyXBZB6jIleb8
	 VVgCok2HccZHxggu5Qt8K7IvwC1SrT/8JWROjMU0uh4jrj56VTF79psl3sP+U04hv2axa
	 OZgR3WEfNri9TGjOgBreeJovNuDqPmQujBErtICwQGFsRxhJO50YfPicSgdUPWs3L65lq
	 buQYDFMHpVBkQuLc1LhwC5wOmXkmcnVtJ2uq0BEED4PYlN6Gvk9aztvsxK+qCCHEWq3rV
	 0TNb+k+H7q8ySNaPSMQlGCosGULYzmhH3ANuFtQGDNa6oMydRSE/Q6gkTBbPW5vm1kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=;
	b=kl0lMy/3azXJBKx3NqjgmGK0NFIiOfXRBGqFJUBU/jxBUlL37SvJFu+XAvfBt00WTT+9
	 y4abROrhm2XJ4SYLemrPuO9Euls2Fm6wN/qdBCHCPcJBW5lQWUii73F3GDU3aIGwaFDb/
	 xHYIqLwAPvdEFrluhAqlXXLPCg1qCerC1H/6LlwMZ4qfx5OI4aDtyJRzIhrv3OoGuveKW
	 u9cNJ2kdl7ki6xphQ6LdiWVZwNiM7zgppUbe6Nih9JaIxBB+EzwbWF690PQPB76g9yNjt
	 R3r1G4DdgvJdk6UAysGRk72syOXAH1XIZupH/po9urIGDG0DHf8y1DJOMxLXobs3yug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hBKzV7eg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifC9Z0gZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED63606A33D
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED63606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hBKzV7eg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifC9Z0gZ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v6cW2030625
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=; b=hBKzV7egc7qpyYFR
	nAvLlpJdkyF3Idi/vrTGC3XgfocQKJdKyupiPJwEiUr9Rr2TVKxrDMVzKxCmhIFc
	UO+SJNXIkg4taRp/bs5iN1GWOMBlxoJz/PPEnC6jrpctMaOnBM5zTM5FqgZVLPGY
	Rx7gwvEmxIUP0yTyrJOZSD09S6Z5Ta1PVwpdN1mlpxZRgWod394uME37eu87xRXv
	7oOTW5KNTCXJ1UqepvNCIqSrYyluRprQWHKb+XsYlptAAUu6bZY6UqbAyq/oD4Tx
	HhXQhd5bowZwaWuJ+yHXageksRDkBEy2tTPT0JAQ13O1Of+QRN9esFD3n51knRcN
	F5SkVA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3kum16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:01:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so2315661a91.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078904; x=1795683704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=;
        b=ifC9Z0gZEOJtPxV+AT2wWhAsvegW5TKMMX9uqwbnsLj7xy4A7oFD6e+DKY2q2GEuhd
         C6aDaG5UQqCo9T9QZom2dXZdm4HbW4SUNzzPUHa2CVFCtPtgBKYZPem6oK7M4ALW1KfI
         fo3MwsCgmJNZzqu25NFoMWi2MyUX5poLUiw5MHgkbwpsGNwyPr/9fIu09WB8yLom4+th
         gxjhdtmowMxMF3SuAQWvFczqWyD7VOCQYpnPOjYyX5oV3nt0zVwmGm4sinnHN5SH2C7W
         N/hLeNQ2utAgENUhEvhYAV8pQjGL1oxSDrVmgXMuaLiAJeFgesEa8JgCyjHhnIg956Tm
         ggbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078904; x=1795683704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=;
        b=QdljTJLacRXmjuhDNpzw68jWhKVmpywK3r/eg7NiCggeES/IjAQMDvQg4sPHP6A0Ah
         f/4PjWMLa2+8U6dx/SWm6EUr0E8zS/OYqPi7pA4GTcQdz7S13CiDlcOMgzSW72WC98Xg
         3z3ECiM/V8rwwIo/YSoLD3lmSnLyHqRzTZ1J6FU4lyUMxl2hukZFVlHaai+4XfpNHHT8
         ii7/+dA/TeRT2P2HwVJwDhDzEcSgSxFU6xGDRpxwL/kScha72HpOss8hdtB13/G3LXxQ
         PkyJWN04Bok2bhooW4cAD4bQK87dfRK79kZ9Sx9V635OsvMu5xpfJskmQSJJhQY2LFX6
         Jyzw==
X-Forwarded-Encrypted: i=1; AL+hErFgEw90gFcibtHccCWV/ynDeaSATLwQHGEF1bDlpai194bIM/QTlbpMuwGuOnqe3s+/VkHrT6h0l/Tt@vger.kernel.org
X-Gm-Message-State: APuU4Z9rs2gSj0I/wnaJyp16Dabu1ucEJX2nN5GV78XK5srinsrm8wk4
	vx436UzI055RcWQ5k0l2XChyGgySj/Ye+AwBwFd1mqiJPobOFoIPti4mv+her/PcYOr+MSIjKl2
	4/voex0i7CSxZ71JoN618GxbrsZ45iT2jewGzyYLi4x2MVcCesly1lvHwOmEnlJ8G
X-Gm-Gg: AZFdTZdbJHRkpjvlQ62FQIObiYufgl8nTazE1cjYN/4n+t6l011aQZ+irfs1Fqw0A3s
	emOEpH4VIgG2263yJwXMZCVF0d2mrigcgJU0si3OnZW+cFdVWLqiYnfAU4KpdzBZMrjjdswkdq1
	aUkLu1yG/lBcOF/H//pob3ToAIZuBP8qfQrkMndwCUJluasom9qoDoG7A06WE+WCzMKtc1lx2uU
	ig7WHH4hfhI296/EtNSIqVJqlcYSb53aJ4PjHkAWayRfW/nfjl9oR/yToiZ/YKJ7a/9976bDCFb
	D9bG4/wcQchK/zuBStb6BXASjqDJdA9o0WB41O+bf+gAAcYo4uKG475wn/zgEmCz4Lb6BZKp4kR
	Y/YQ/17Kgtge9hYL6AeKiOoQ2yWi0SystvVNyi5GG/dimlaR9doA3didSzFEyPIfzF9ARnWn166
	h0hbxH5VFuwa36h7togWt7J8U2TGB7oZtDyUAw
X-Received: by 2002:a17:90b:1fcd:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3d0764684mr5300484a91.35.1795078904030;
        Thu, 19 Nov 2026 01:01:44 -0800 (PST)
X-Received: by 2002:a17:90b:1fcd:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3d0764684mr5300427a91.35.1795078903441;
        Thu, 19 Nov 2026 01:01:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:01:42 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:01:14 +0800
Subject: [PATCH RFC 1/6] dt-bindings: soc: qcom: add QDCP provider
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
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078890; l=3826;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=C45KpIlwNH/YljdNNGWJBV58QJEhk0JLA42ndKrZbLg=;
 b=ev1M+t20iPdOBT1JF+M9fv5cK7IESCNZW+J0Xb25OlcWBUp6HxrkiZUYuwxXSwPT6MG2W6Env
 pau1hGehI26AVrUz+cJSIZHv1oGt+KIKTxSRtZ/hkqz8oZ9sr0m8471
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX7RNKqpLxcZOc
 qkLkmt701OVLvrlivvLVgKY6zpvOR36GRFjNQnCHLlgu3t8alpgDW9Kqk6bhLAILmwJu36m5Tf/
 IYZ9x9C3oYgAXrwbTnQj4hlB7wG5vqqJ3i1uWfV2mgkWnsWFZG82qFmBkLdDICE9mpNeUOsrkVD
 FYsfoUH6Gco7Bmtxd7xj5md/nN3NGD2Wz1bo/TkrgkZKS/AXI90xA2FlyDqPUjYWDjUSmduRMmj
 DLToEO2BSdYo3M+4n/RuXFGuOenqPlcLR3Ux0OY/m8MNA6L58IQZEGwbrTFlpjyoRLxdbctM3tx
 CmXZwecrHWmNPydIBnay7M0hIf9wyS3Wzr2ro3Kg+FqVbjt/bWC/dCGZjqbw0VesGbR9eVIXa6m
 stBeIX8tFyKeMmJDKBYeR5I2wc2pdDJIwrNiC0KZsSG+eIV/vbOKPuCVwDVzCboOJddem+e0vCE
 Vgpc9oajSrc+Wg/xZsA==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afebaf9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=IqNXJOJUzIoeS_XrjnMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX5AS7PgWSqeRx
 VcLZkwZIIIhcsYdud8qZeR7X3XNQtKz3BXdd9PW3BA4+8cvMBFwnAGUPFjp4iPpqzOS8M+yoiCo
 ebvQoyhXkxElPP9q6f7wqcaiLWZa5aM=
X-Proofpoint-ORIG-GUID: uOGkg1KPFyxj7sTWFvB8WDEtqZXv7C_w
X-Proofpoint-GUID: uOGkg1KPFyxj7sTWFvB8WDEtqZXv7C_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190035

Document the Qualcomm Debug Control Protocol (QDCP) firmware provider
node used by CoreSight debug and trace blocks that are owned by the
Qualcomm Embedded Co-Processor (QECP), a separate on-die processor that
runs its own firmware. QDCP is the QMI (Qualcomm MSM Interface) service,
carried over QRTR (Qualcomm IPC Router), that Linux uses to ask QECP
firmware to control those blocks.

The provider is a Qualcomm platform/QMI service node, not a CoreSight
graph device. It exposes the qcom,qdcp compatible along with
per-connection QMI service/instance identifiers; the QMI service
version is the only optional identifier, defaulting to 1.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,qdcp.yaml    | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
new file mode 100644
index 000000000000..ee0a66b12dde
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,qdcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Debug Control Protocol (QDCP) provider
+
+maintainers:
+  - Jie Gan <jie.gan@oss.qualcomm.com>
+
+description: |
+  QDCP is a QMI-based firmware provider used to control CoreSight trace
+  blocks that are owned by the Qualcomm Embedded Co-Processor (QECP) rather
+  than the application processor (AP). CoreSight-facing consumers look up
+  the provider through a "qcom,qdcp" phandle, naming a specific
+  "connection-N" child node rather than the top-level provider node, and
+  issue typed firmware requests instead of programming registers directly.
+
+  This node does not represent a CoreSight graph device. It is a platform
+  driver that establishes the QMI connections used by consumer drivers such
+  as the Qualcomm QDCP STM source and QDCP-backed TMC/ETR sink.
+
+  QECP exposes more than one independent QMI service (for example, a
+  separate service used by remote ETM/diag sources). Each QMI connection is
+  described as a child node of the "qcom,qdcp" node rather than as a
+  property of the node itself, so a single provider device can establish
+  more than one connection. A node without any "connection-N" child is valid
+  but provides nothing for consumers to reference.
+
+properties:
+  compatible:
+    const: qcom,qdcp
+
+patternProperties:
+  "^connection-[0-9]+$":
+    type: object
+    description:
+      A single QMI connection established by the QDCP provider. Consumers
+      reference this child node directly via their "qcom,qdcp" phandle, not
+      the top-level provider node.
+
+    properties:
+      qcom,service-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          QMI service identifier for this connection.
+
+      qcom,version:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        default: 1
+        description:
+          QMI service version for this connection.
+
+      qcom,instance-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          QMI instance identifier for this connection.
+
+    required:
+      - qcom,service-id
+      - qcom,instance-id
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    qdcp: qdcp {
+        compatible = "qcom,qdcp";
+
+        qdcp_coresight: connection-0 {
+            qcom,service-id = <0x453>;
+            qcom,instance-id = <32>;
+        };
+    };
+...

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078919;
	b=FCjS6rFGPgRNMz3we1rcsQyO0AULFgVHLN7vVhf1Ep7WYRxjW2REnOszs2wzXeIXfEBP
	 yuQU+o9lmyUBk1fQ86qZGy/vJU0wwbout8cyVBq/dfDdmmYKCEEtLIJF5KEX+azHthcvt
	 k5UvEXNU6EhtLMP70Wj7L+WnISJbTxLsqkCHCfVeTSBFZwg3VLG5ub+R/yLeYIRxrKUGF
	 bhhKIrXVqLvSxoRAXzk5uRj2zrVU5MPt2MzCOW8dz1BMtzuvhZLj+cEopOFgo9a1fDvFp
	 j4LDRRh3PYiC8Pzb/GaTSfWRtwezXuWXdBp3Qvi1b4y4jwuBlttJAJbkLRjbBsaA3Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=;
	b=VEJUNwTvjeGX1Q6jAratu2NnR8fOEAyuLpQ7roeylZ3HuADgU5F+usG3BK0bKi99eiZj
	 HczqDV9BO7HzHGOmQJcuz6aeVV2FULESx1r5r+ermgI9uqhPJmyya9f6qklEujoVSwsHz
	 hT20TPsfVdFb/0s5RuqvLZMcSjYMi69yWEjWz/clONRb0TcW4PEIcxnd1z/U2AvNyMqvO
	 QJGaEb5Z5eH25lB6bVEQpu5Cu5hm2Mh8djOaE7YgR0c0zc0t4vpJ1qH9w9qEdl5HXhUCU
	 f/LO5su5Mr/3zzoaXJTiFX+2/bL/Bb67nGLef3O6Sd8i3mwms+PaevY07N9jlFhXajA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hR4+yEg5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EcLoU0Wl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719AD606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hR4+yEg5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EcLoU0Wl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ90ZmQ1844689
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=; b=hR4+yEg53SHmzaOf
	EG1SQF8KAERzpL15tJczzt4cwkY1x3N8tnipH78YjIGtUI2u+YtyYyHgUymLlv8Y
	6a+xSlDyMMUmfVxbUxt1t3Ev4Rsb8fU1DAbh2Ky2LKOX4nRuTBqco5Zh7U3M10Ah
	3M7pi3cuGqvnyM1GF4AU/cp8gwsUhkF1QUomJfbgVD7Ixu/VXq8BU3PDZ7CJVV/S
	DAiZOkHk2QilVLEgFTgZpjnUpNTOortJPXrajQY4sJ5mbU9n7OTODa13JvN99nDo
	9/fbmqRu5304GdGnVJYuqjE6l3GAcNFpOzmP7GLtLumt0XIVJcuSCoKMXMT6S1GY
	WNsQhA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux8nkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:01:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso2431474a12.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078916; x=1795683716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=;
        b=EcLoU0Wlmv6WEkxWai7a/Euy+dJ+0CbapHjC/83LxGeNq7YoZUHwjPs805HceDvtjm
         QDkIsKV7PZL5g0muO1WEIHIwdUthjFUey8UiF2QEz1HcUyxs1yc7yKrCh6EKodYce9UY
         fZ4j6CQqmfueUQQ1CadASuRzC1M6zXwkJKtEE8LgH+f1duoGDilGGg36+cgI0M5HvqfT
         EzQ8PvKzpSDXnCAUgGMU8UFt4GI3+B+ZWqvI4CVG7+TUefciBxudSyo+jYygNKNoEFqj
         U8HTkA9UIeM0fbzkxGAYC6wDUU+T39nUnyA5Dsan3zcg0A5//tF+6/vzFKa1uBRKV/qr
         PyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078916; x=1795683716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=;
        b=zqI+5tvCg3eLYVHj40SAwOr3/rXlemSf9K/o1MkgphTGPVd25LQrEVhVFsghdE93WJ
         uQZF9RiSHgh/9ESqcZuUrcE8ehMvj+s31M6PzFsJK4xqNnbj4RX4sFDS+f12yzPY6JB8
         VblzE5lQpf1rOHO2cGm8ygeC8qdGM/dH/h+dzbi4GIzVzVVpohE+btOy415G5DvjgPm4
         wTx1oUWoVWaNXoT0Z+BgtYFO2iLwDJBfjqPxN0do4j2LbNlWRRihvmpxN1GQtdv8lwGp
         VX98zsO74YMql1B3HEaL3wVU2jq/xEb8ZCYlzWreua+1uFym2jHJfKUwBjF4l5k1emFl
         FENg==
X-Forwarded-Encrypted: i=1; AL+hErFmareQ3aCy1ZNbcvutNmzORq3z2xprOoOMhqRUDOELzLjBNyCZmLzqhnhxaIY/5O33Rjtax590culn@vger.kernel.org
X-Gm-Message-State: APuU4Z9USpDR/AQl0WaGTfM0+kNhMjeczlZ5MPOWWYFAl9vx+ryPOXi8
	71sRadF7iZc9lHc165i35WfU8DejI6bvQBoCRYyTZmOzMgx3xv+Q0teB7h127S7NCISrRrZPZzm
	d2whppr90+Idwx+hR2vV5RBfDmANkMEQRGnfhgJIflnPAregailrFl98hu8XOsk3u
X-Gm-Gg: AZFdTZdKx3E4SEqlJ3zzIRCg9Hw1Z2tUR7RIe5h3GJOVjMwmlbxv1VBafcymrTy552E
	h7kYjt9qxbU3e4z7YwLbKQ1akfMj5n1jt428otGFc9m40evSjXgzHB7UIiLWIuliW9QSjwqZBq7
	M9mcbOlXWX91YjRJDOGMJNuwk1RnE4Se9pmW6tJ3PBKyqYgwXPWRqiGKxZke/eKtzGgDd8E5vtF
	y8FqhNzKt09OZbUCyr8hB5hVjgQe02yv+ePC/iaGIzClao+YMnMAAgi0MzNbLYvtcJr0dm/trdw
	K5xtczdPko2Z/nDDA7CU2qSB2WVMV3flLm7gfluCIaOGuJlCzGGm9BvXIuKoRuAnYqm2Z9Qhj25
	DGjjcR3Er5K9gtqvBE/A/hXx84iXyDgvSAWHvTFUFJKXjIpa4lzgEfxwe/ayBzUan0DO5pj9jXA
	Qq6Ar3cmHweFX0MZ2mi2Sj8usyQTgQSRwk9geP
X-Received: by 2002:a17:90b:3c8a:b0:3b4:a90:7f3a with SMTP id 98e67ed59e1d1-3b40a9080a9mr480393a91.55.1795078916025;
        Thu, 19 Nov 2026 01:01:56 -0800 (PST)
X-Received: by 2002:a17:90b:3c8a:b0:3b4:a90:7f3a with SMTP id 98e67ed59e1d1-3b40a9080a9mr480335a91.55.1795078915451;
        Thu, 19 Nov 2026 01:01:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:01:54 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:01:16 +0800
Subject: [PATCH RFC 3/6] dt-bindings: arm: qcom: add QDCP STM source
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
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-3-b1a730d2c57a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078891; l=4430;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=wgUmKqHp8cq+mf7GbzW/6vYU3g1oJuZgz4QaZbxBLrA=;
 b=sx68gFAiWywWLZiB/xQWyOxC2rvsyPB++cT5zzwjsvXP1qsEqTKbU7IitSolDWV3oR88pvRAP
 Dtq4n+vxoy4A8Az/USgfm8hLtohH/f3xEZGjO8LreQy7BMuBByD4rdx
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: TPROd9FoGx2yXc66_LlX1EbV5PnvQiVk
X-Proofpoint-GUID: TPROd9FoGx2yXc66_LlX1EbV5PnvQiVk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX93n4hGDNNFEY
 XQ+pV7NNEQ9ZSs47lQmfHEL48cIom/ef6Ebh5uQglACXKxvCDbHctQ89WI+R+9spfo/X2E6Gbfk
 4HoDIj6h0KWuUIQ1gvW4/PXNER6TGdI=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afebb05 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=P3Jn8C2Hv6jw6lTxns8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX19hUVmdDyAs+
 F0fDCoO/lhRs0rutLRt8xhNwQYr7eK+K/FczlVRWY23yOI41agu+/fxqWj+qxSritR5UZMSjG1N
 tqoeHpH9xE5L678gXIvYRu33MFWlEf9JfNQPhbfwpuXahOI/2MAKKSn2MJUIgqW4vHHl0IaQTe1
 BusshA/dL/HTZ7SPcT8bwR76nGCtnmWZMcbF5XWvcKyyZLGkIon8qV9/HE0phJBNScOZs7EYxnq
 aK+H4YjNx0qfktTq4Ctm9umn6JkCcqotORFIY0iSQUx++vvigvAXGBcx6O3jYoxqRY+7K5fVhqa
 54JHRY56Tlbvuo5t8A+yWq2OhZ+0rNim6b3UuQR/ayGxur6gQmfkXX78v+0rP2eUm7RV3S52kbp
 Vw1jI4WNLkI8DBlwu6PJIdx/EnChFCvTum7zIzYZb3dJm8ztZoyIlwdayi6rdnq3UYvlGmi8skX
 acAuxDylabg1WQLehaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190035

Document the Qualcomm QDCP-backed CoreSight STM (System Trace Macrocell)
source, for platforms where the STM control registers are owned by
Qualcomm Embedded Co-Processor (QECP) firmware instead of the
application processor (AP).

The node describes only the STM stimulus aperture, the MMIO region the
AP writes trace data to. Firmware controls the STM through the Qualcomm
Debug Control Protocol (QDCP) provider referenced by the qcom,qdcp
phandle. Firmware also controls the block's clocks and power, so the
binding has no clocks or power-domains properties.

The output port must have an endpoint so the source can be connected to
a trace sink.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-stm-qdcp.yaml      | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
new file mode 100644
index 000000000000..f365ce2450ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-stm-qdcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QDCP-backed CoreSight STM source
+
+maintainers:
+  - Jie Gan <jie.gan@oss.qualcomm.com>
+
+description: |
+  The System Trace Macrocell (STM) is a CoreSight trace source designed for
+  high-bandwidth trace of software instrumentation, made up of memory-mapped
+  writes to the STM stimulus aperture.
+
+  On Qualcomm platforms where the STM control registers are owned by QECP
+  firmware, this binding describes an STM whose stimulus aperture is mapped by
+  the application processor for data writes, while enabling and disabling the
+  trace path is delegated to firmware over the Qualcomm Debug Control Protocol
+  (QDCP). It references a QDCP provider through the "qcom,qdcp" phandle rather
+  than exposing the STM programming registers directly.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,coresight-stm-qdcp
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^stm(@[0-9a-f]+)$"
+
+  compatible:
+    const: qcom,coresight-stm-qdcp
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: stm-stimulus-base
+
+  qcom,qdcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the specific "connection-N" child node of the QDCP
+      provider (see qcom,qdcp.yaml) that owns this STM's control registers
+      and services the firmware enable/disable transactions. This must
+      reference the connection child node directly, not the top-level
+      QDCP provider node itself.
+
+  qcom,qdcp-source-id:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      QECP firmware source identifier for this STM, used to address it in QDCP
+      transactions.
+
+  qcom,num-stimulus-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of stimulus ports (channels) exposed by this STM. If absent, the
+      number of ports is derived from the size of the stimulus aperture.
+    minimum: 1
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description: Output connection to the CoreSight Trace bus.
+        $ref: /schemas/graph.yaml#/properties/port
+        required:
+          - endpoint
+
+    required:
+      - port
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - qcom,qdcp
+  - qcom,qdcp-source-id
+  - out-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    stm@a06000 {
+        compatible = "qcom,coresight-stm-qdcp";
+        reg = <0x00a06000 0x180000>;
+        reg-names = "stm-stimulus-base";
+
+        qcom,qdcp = <&qdcp_coresight>;
+        qcom,qdcp-source-id = /bits/ 64 <0>;
+        qcom,num-stimulus-ports = <128>;
+
+        out-ports {
+            port {
+                stm_out_funnel_in0: endpoint {
+                    remote-endpoint = <&funnel_in0_in_stm>;
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


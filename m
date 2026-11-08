Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143934;
	b=UZRng2QmW9wTH5vPhv2V5fynCby2IntC3T30Y/0gC4Plx9YBcx6+cDHxLgt6lYFnSWIT
	 9NZsr0JHa+1MAx44we15jc56sAfhDGGPn7ESotKCoHhxwX+hHHCxnDxApSNwOHT/Ee6C+
	 UxVT/0v6kyqOc508glvrfuo/COR3OzxOlz53X9boYKzvklviJ2ObuU9mjuL2ymXAQ/wKB
	 PcWwxfeGRRWPGgrVrVmt3lsVmJfDeUqEbSihvHufqgNQJhBJWgvOtG/2qQVLjUa7cjXrD
	 9I4eLVOO0VpcpBQmGU/mzOqlQWJ+ISTeedhUcddH1fjkw0mDRjMhqgJg1nN1O4kOzPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=;
	b=O3i6rYc5opn3C2uEr4FOa6s5p/PCRxtLmVU6KD3wvsVaT9ZITA7UBEmS+47WntJhcJsg
	 6/Dj3Wb5eft4okW3JdHAUkT/LPGRlo75eisn596BBOGwnzoudUNAoCSZKIb0slTc4Vogo
	 4qw93i82ne13KG6t4xBLjzGte3agzrLXVbqAjJHxoUPjcTSfhZs+TQAqGh/INgDtJ2u5y
	 SiUzh9TonY/aTur4gbxSlxTGGtA0BLVlzbAMbVS6gpSi0ydo6ille7uRel04r3NvPcSWn
	 /DcH/UyvnEGpL3BVNwm4hTRF6gCSrlXr5d5nYHez34RIr+VvCM/tVcdPXG2rAOlW2dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjpIq5Fq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T20O1Q4X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C44606A33F
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 13:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C44606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjpIq5Fq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T20O1Q4X
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AgBYB3822803
	for <devicetree@vger.kernel.org>; Sun, 8 Nov 2026 13:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=; b=QjpIq5Fq09/ZOwsS
	zp4uRdZudwfM1GBDxURkl4ClOx4GfO6VpBH88Lgs8mGpDnD0xJzrFFS/iOrSYu51
	/buocqrqZYo3Ya+tuGswXyiDoFLDGRWzjTn0LCsacqGt6CSSuDKph83HFEa0bLq3
	BHEEkAxrXL0XOKJanxY5AThCHYXxtu9kBiyvOSy0ix3z2ThBSRLgCZj9agY5YEta
	9QHp77zn43W8O47Kq4izQndnNb54WCMVB5h806QoRbimyCgmyPRFluvKWF3hFIxL
	osKUl27//iSt4rzDmleqLu8135Jdvz2NRsDQ3eXxxXaCcj5xjSrOMBXaErj/PYG4
	KGrtJA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k2tay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:18:52 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1aa0fb7f157so157079c88.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 05:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143932; x=1794748732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=;
        b=T20O1Q4Xgv1S/6LUq1uPJSgIAO3a3s0vkM7Ha3yid84FkJWYCsdfRnjWGoyB9vTAac
         cmu96wDRsY6/5F9vK22ee+Oh0uLWxhbfxfbEoHINwvz0WLc3kTSoCeTTmIkCktGlivXa
         kjbCS9II2uEA1230aKS2nv8riVnhnfuHNlJPCOKdmmlDEesjnDoe9RDjiYgZHfo0vJEX
         dFs8TCNm+OGEHczj1esmr+aQ/jyHB/scpyzcpMDL3fo2pTFBGfG45i2UHioddWD7HUIW
         uV2La2yE1mQk2bEa+2YZ5aKx49/eC/zIxTJAVoEx4R3vgzFd2/HPmSf5Y0FJMyhS9pzA
         jXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143932; x=1794748732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=;
        b=1Xnqtr/ES7fo7RHs5On4bZQrWDESl2xAxHczslhU4JV6PewjOMaRt0x4Y6yEeFHv6f
         LnGju49seVoH57iDbBZSnaKENBl541YsA0P4HeuEDCy7wgSKVqxhQ85lhdxp9YJ5FaQw
         pT96XxKEvg05GrGNuTbcIFRJ6kXNK0Sd7ltGw9Gqh+RGwOeWS9nkJxlGJbAFUQbnDZx8
         DufvuntWKWl1zcHGRuA6V7hOOXOmDU4Dobwn8QrzvFSY9xBC1zjZWL9pU9Ex3gPgMv2A
         TZj8d8iKb7jPTW29LENR8tZmyXKHd6WR/Ghpz4KrIDz/iAQQCzLV0Etdu8cWSdReOuGz
         IvnA==
X-Forwarded-Encrypted: i=1; AL+hErGBo71umPyRGQ6UdfNcRzYY0dsUvJXxxef/byCqY+196McTsoOGfeyuuGsNTzN+FTqMPnlK4lsRreMy@vger.kernel.org
X-Gm-Message-State: APuU4Z8yxzXbxmC1Lz44W2bjxEVpbDCJ/yaCNNaqBvE7ZPFRsIQ5uXF8
	mAGIZHizhojKTBCOWYw7ErderZ1/IRwpVYvE9yziUr4FVt/vkriThtbyxm9Ramh56hcr9IFFiSA
	veFX1j5r6X4TrZ3VJRqohuAn7EPp/yeqG1nezceYx/hna6Ds7LWH5FPAsIfaFglPX
X-Gm-Gg: AYBFou3tPf+E2jdZlVx3+ub6qag7lXA8y/39ZLl9satF4QU/yWbtG8A4g4BNjpC+/ef
	9NvJKNu5IpuNxMz56Vbgs+x7MZ1Y6Op/73+s6fHVQlM9J6lc4X/Wvw589/xc8R20ipSLgZKWrRo
	Skq8z7de7NyFZSOXjLr26d0snHYzGXAjqepeQfSXa+JvGa/pUmjBYTZ0kyGcRs1W2q24jxUXlBr
	/aJiG2aSsxTU9i6KpaMSM1mQJ2Y0mnbvwfPXFVyDk3CtWFE9iL5FhaxS+fLsT8CX90XKeQPWYEV
	BXnHzz40npaQycUwOsXLrHvoT9Vi67cEq1Dl+5QvU1W6L37rUfIDeP6pyYUFaKH3BgDpBgulfJl
	gzOoB/CP2pzm6xgCI3oe64FEVUyByqYjSOMvPfjBHxkMFQ1oeRZSZJeX9FZMArbz+oK7mbu23my
	EXiDk=
X-Received: by 2002:a05:701b:2802:b0:1b2:46ca:242e with SMTP id a92af1059eb24-1b39fecac22mr2104863c88.14.1794143932165;
        Sun, 08 Nov 2026 05:18:52 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b2:46ca:242e with SMTP id a92af1059eb24-1b39fecac22mr2104817c88.14.1794143931442;
        Sun, 08 Nov 2026 05:18:51 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:18:51 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:24 +0530
Subject: [PATCH v2 03/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm Nord and Shikra SoCs
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
Message-Id: <20261108-tscss-v2-3-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX2orvfvPj1U/O
 GfQZM/Al2CPtksXJP+GtT5S5OfacqH4F3JPVoXXRqxOIK2z5isUPg97+HvNCRVKUXl4AxyKLH6M
 ablWc38xrbEIPJyjZk44IIMMsm+dfI9OasQwf9qGjZI5RjGAwtCfAlwaUxSYPSl3VJOvYsxEwSz
 rcmWiXOeE5fkhhS0D2eqcIn/u+/6wSx+VsC5ATyDXhWUD+fiSgH19eokHGzwSyUF7oSkuWIWaSB
 UuVvmAj54IscTYjL8kQT00qaNr1Jna5ppTwYm2JgU6+MlXbFuOJQPFkhjrAAYNEEEYRSEfBunHH
 FncpdOGih0ZXz+s4xOAK6yBIOlXysMu5I5nhZmJLwrPbgBV9O9mRnOr2o7aXurqcSb6/trwMFcC
 TeGWOk/df5zSSRDRvpS00pv3IIJioeI1xUyNTjuG7ABJ/2L3xcAO3VB8ol2+HwXI975b1F2VqkW
 hy44+YZhL6jgeR9nz9g==
X-Proofpoint-ORIG-GUID: 9DgNqcpyAkERxHySFFedhpX_OAlTvEP_
X-Proofpoint-GUID: 9DgNqcpyAkERxHySFFedhpX_OAlTvEP_
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af076bc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nKCL-24MKaImGustjYoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX0wTJr/HuDc9d
 2K4nGGfjdNOWvg93WBBeZgT8XubDwn7GUPfUrQvS53f/PsPQR/thIrLZolxIqDEn/GcqTQQUn6l
 1CLzLWbmiSekhB1LLyNAjkvykOdbqfg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
on Qualcomm Nord and Shikra SoCs.

TSCSS is a time synchronization subsystem composed of two main blocks:
Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
provides a continuously running counter used for timekeeping, while the
ETU captures timestamps for external hardware event triggers.

Nord additionally has a timer register region used to generate a
periodic pulse in sync with the TSC counter.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/ptp/qcom,nord-tscss.yaml   | 186 +++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml
new file mode 100644
index 000000000000..9d49e66a35c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml
@@ -0,0 +1,186 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ptp/qcom,nord-tscss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Timestamp Counter Subsystem (TSCSS) on Qualcomm Nord and Shikra
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TSCSS is a time synchronization subsystem composed of two main
+  blocks - the Timestamp Counter (TSC) and the Event Timestamp Unit (ETU).
+
+  The TSC block is a timestamp generator that maintains a running counter used
+  for system timekeeping, and is functional with just the AHB and counter
+  clocks.
+  The ETU block captures TSC timestamps for external hardware events. Each
+  ETU slice binds a slice number to an external event selector, and a
+  single summary interrupt is raised for any ETU slice event.
+
+  Nord additionally has a timer register region used to generate a
+  periodic pulse in sync with the TSC counter.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,nord-tscss
+      - items:
+          - const: qcom,shikra-tscss
+          - const: qcom,nord-tscss
+
+  reg:
+    minItems: 1
+    maxItems: 3
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: tsc
+      - const: etu
+      - const: timer
+
+  clocks:
+    items:
+      - description: TSC AHB configuration clock.
+      - description: TSC global counter clock.
+      - description: TSC ETU clock.
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: cntr
+      - const: etu
+
+  interrupts:
+    items:
+      - description:
+          Summary interrupt raised based on an external event for any
+          of the ETU slices.
+
+  interrupt-names:
+    items:
+      - const: etu_summary
+
+  pinctrl-names:
+    minItems: 1
+    maxItems: 32
+    items:
+      pattern: "^slice[0-9]+$"
+
+  qcom,etu-slice:
+    description:
+      ETU slice number for each entry in pinctrl-<n>, pinctrl-names and
+      qcom,etu-event-sel.
+    minItems: 1
+    maxItems: 32
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  qcom,etu-event-sel:
+    description:
+      External event selection value for each ETU slice listed in
+      qcom,etu-slice.
+    minItems: 1
+    maxItems: 32
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        reg-names:
+          contains:
+            const: etu
+    then:
+      required:
+        - interrupts
+        - interrupt-names
+        - pinctrl-names
+        - qcom,etu-slice
+        - qcom,etu-event-sel
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-tscss
+    then:
+      properties:
+        reg-names:
+          minItems: 1
+          items:
+            - const: tsc
+            - const: etu
+        pinctrl-names:
+          maxItems: 8
+        qcom,etu-slice:
+          maxItems: 8
+        qcom,etu-event-sel:
+          maxItems: 8
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1c80000 {
+        compatible = "qcom,nord-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>;
+        reg-names = "tsc";
+
+        clocks = <&gcc_tscss_ahb_clk>,
+                 <&gcc_tscss_cntr_clk>,
+                 <&gcc_tscss_etu_clk>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc_tscss_cntr_clk>;
+        assigned-clock-rates = <250000000>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1c80000 {
+        compatible = "qcom,nord-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>,
+              <0x0 0x01ca0000 0x0 0x20000>,
+              <0x0 0x01c87000 0x0 0x1000>;
+        reg-names = "tsc", "etu", "timer";
+
+        clocks = <&gcc_tscss_ahb_clk>,
+                 <&gcc_tscss_cntr_clk>,
+                 <&gcc_tscss_etu_clk>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc_tscss_cntr_clk>;
+        assigned-clock-rates = <250000000>;
+
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "etu_summary";
+
+        pinctrl-0 = <&cci_timer0>;
+        pinctrl-1 = <&cci_timer1>;
+        pinctrl-names = "slice1", "slice2";
+
+        qcom,etu-slice = <1 2>;
+        qcom,etu-event-sel = <1 2>;
+      };
+    };
+...

-- 
2.34.1


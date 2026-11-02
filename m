Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634805;
	b=0G40YZPBLhgpX/m/TBCB5n0ZCWQ0ko5tk5E3PMfHYRvUHWMXkhETF2rNQ/4ED7EABMe8
	 y4tXB3uZGYCAUEdFRVafxaeHHUY36iH2krNjhfGFcSjo+p4Ag47kuA2fRti7eQEPmQvOU
	 FZV+j+qh9Rti+DRLS/fxCzceeSkecJJIoiZioKCDS9xx8wtqPlnDadd1JTCdYmqY7sCLr
	 ja2LwV1ddvPwUNn4/wCcZkp+1F8QtPOM3dWFpXNrCClDAeFsVTUBs+uemXt2+Etpe1tEn
	 QdgQEyPokaU7DS2AF/fFTZQsEh0bRpED0GIk6DfSKDmeEYHUQQo1SEEFIBKg86ROQbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=XITj8mDvA+riVOPAV+4+DLWq2FhKUyrALF/19P7g3xuFpP4rlaHmNhas985tvUhswQ/g
	 cEcX2sXxwics/DHfGDSrWLZvB4UbkljL83oTkuMu2iHBmlLmIoxYG/qU90c7M2Jb1gtKE
	 /TpviyTjjMXvCLPJ0azfEI6hKzVtjIYGZAVwIKdeuTJ3bCojMIoLOEH9LPBGC8M9rI3hW
	 +AAr4JOvc3XS6olBjEwIgPGlr2t0qkhm/ff+3KWUV1cpQ1p1EMiDJ9UZoNQUQDkA8MCOC
	 i0V7Miqiojd31JcxMfvDqaEwzE/Z+sj1WK3JhfeLGPB3aluPCxGEtXr8+sLaN32barQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3+yOmvj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffuNNsTe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1B660A8C1A
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1B660A8C1A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3+yOmvj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffuNNsTe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpLS6845676
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=k3+yOmvj6Xrqikrx
	kc5L6IbhXOOlVVPVXq7f5drCBcxeuEE6+1VZ5xPNbADQmYbcMrJ/gtHtswCFf6Qg
	fxF8ErmZzD77wuRDNTbM6vNqKM92NdxxUU7W1Ekt3AdyHufkIcPjcAebuBqVeS8x
	r9ex7S3m/qZtbmiAl0qT3dVbab4hhO7lRzsUwgt6DJDt7ysrGEqem77eK4H7RRRP
	2fUrfp8XUmv9SUZXf8P9pq4LldJHgec4MoqVcemHNU1r+i8Ze89E+7rmD5WR1NZP
	60etYKvupIgrRdtt6cahJaJJSYTpjP8uX3tgV7FJuzvO6wMZ+lAS0yZupO/6AeaV
	FWi8mw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1tg2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:53:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc694cb4adso580019137.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634803; x=1794239603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=ffuNNsTeMyJBYmfXrwtA1pQWLwE8qoiONjW1d34MuI8nJo50nJsu3jDQxJNQkO7Low
         OED0ezD15Fl1z8RtETtwPAiLKKdUp96N9IpRDq9qYyPqoi86NnuEsYfOtKDv/nGBKh99
         TWl7W5AAWvMhyyMLtNEbXV0oB20lwEMh5QM0duI6wvazN5q7pMTGpg9QCZJ2S9QgVE7p
         yCptYi9D5K9JA+QgyUPhRJxlf571Trfnz2upppxjPklQmUMWI5W3PjJnMweXOBsLlfAl
         dSJZFXKPWAk7j1y93D8USVUdhBR8SC8Oti/dvE9tXctmV1AWm0WpKYjVSqvIYiReN+GX
         RsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634803; x=1794239603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=wfcxatYUXrhlfpGgssNkOUSaRihJuiVmuxqdT8If4nklFuLf/cnyXuU0pQWkwQH3w4
         lD29VEszJCfLSQ2fTHIEE7IBS9r7t8tR+gf6vldAxw6PHdh5vAbtIXqN6D25VJ2Ayu7s
         J1dSFe7zMGg9Vs+ILTP/k5lt+Y6QsJMfYn8KHTJ0Ie1NkmsgWuLh57nq9vtc6dJUYWGx
         Ehj8boZNMFWMZ0cZSYtOMQhKAEivbyu2mxHHb/SXfBk+faa2+hkwxZutOlDPMs5iBCE5
         cQgVIC7BUVN9GzGkaPfQZRvoewf11iQFaZWmbH0G5U8ApSfaGBflJuLzIP5UvKWsz7AQ
         4Spg==
X-Forwarded-Encrypted: i=1; AKwUvBxLnSz428rkds5mOTn5rrYu7TFUxaJD7J4K/XQp0E3eBbhY7MgQtmdWzQ34YIVSC4gqdxGViW+Vvgv9@vger.kernel.org
X-Gm-Message-State: APuU4Z9fp/yjkS6MceHYmJYwZTGHr0wpMenvbECXlVkC3izWFwX2wzGs
	AlmjPAGwscaR6DMYvnRtWGDRwonPTe1/CFpqMT2U+fj9sEAKfzLEgPmZEYuzmVYg93rmh6Qjh6G
	vqqCeU2PhiJo09d6piIqWbYikLIWan1d0E7wNG+JKEGUMG4z++rSqr6fgU09bf8rk
X-Gm-Gg: AYBFou0Kaw+/Kmqz2ulx2d8R5SnIxOES+E8Dzx5XSmXf1mwSne4v12llUGEBecHT5+u
	HVlxhi4yLqSPZvyvYwd5VTaf9fz8rEysNKegUBhzUWr1LFIyo6CK9zr3uwSh2hB3crYtOH8l5ub
	U5RELdtkGa6f9AMXuoIVAficAoMQ1uFn6psWhb2zsRnQIJNYWcGbq7loGatq++y2Q35FbcSeQdq
	RXCiWnHWwbNM0lkXEylojZ8jeVXhJ5txo55eWR599rlXbw7dEpQvv0Dv2QvxAT3YmEsuyRPKpWl
	vd+V89PK7l8iRcGjyNSDmlPBJuF+Wu29PfddWCm88ohBT/pi2ftcbEb55anM13Mfbo0kWWne8aD
	UwO9tgmee0bKevptc7Xw/BFa/NnizqOdyq+C87wnIexJODOgmzbxbJb7fdksIxkgpBG1OQUG5Ud
	9sz8g7ywGZUiVvcHtSuajeZF70a2K8wa4qtQtkZzy90z6oGmlreI0soW2rX/JJOEpUpWSqgTT8k
	qWUSLFtbk778dJaZ+Maxm1n4LpE
X-Received: by 2002:a05:6102:14a3:b0:7cc:2daa:90ee with SMTP id ada2fe7eead31-7d0725b54d1mr4239126137.15.1793634802624;
        Mon, 02 Nov 2026 07:53:22 -0800 (PST)
X-Received: by 2002:a05:6102:14a3:b0:7cc:2daa:90ee with SMTP id ada2fe7eead31-7d0725b54d1mr4239105137.15.1793634802075;
        Mon, 02 Nov 2026 07:53:22 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:21 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:33 +0100
Subject: [PATCH v12 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
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
Message-Id: <20261102-camss-isp-ope-v12-2-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: wPDwGVaKEqYihrFHcfvGikv6E18EEoPm
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8b1f3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX/bog3n2EDM9p
 3ReDNdCM6QaQCcYXsk3DFVmso682jusCitizMToLoDq3UGX77wvceVqWOkbKBfNNhSAEDv/4qKR
 xN6bCAkaar9c0xgsF1l+yJGmfgH8m00djSmXXCegd+Ei76VS8hxPvADibYs7i695g4pzkdS0UkL
 Ct60sAB02/H3t15VVpTE29tum4JiM7SbMt1tZae0BYnKLxk1VF8mYXIgEZB+waq5Ntb2Nqs1RAs
 cMPRsAsk9R4H7BOXHeRSTkwfwQXf8T1Kv84//+Do33oInR/fJN2bsSXPA7FLRJxMiWVVEdGQVC1
 oyqe6M+BA0RLgr6VUdPKYmaNobN/km9//gG58r0u/VY9wLPY2NMNW1lNfjt/5lhlWaI2BDi3NrB
 Jl/3gHDxu1YsxP8N21W4sp4Cl63Gr6lBaKBZ9LILj18BQrFx3gBvXFiIswkmcJSk54JQwAFRUha
 1NvHaLrLVeNPcOzB4QA==
X-Proofpoint-GUID: wPDwGVaKEqYihrFHcfvGikv6E18EEoPm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX5wcca86iId46
 dcB3e2QbW2ghPsHNRfvq5Rit11/1oyEfowwO6eHWJ1LfZN5Cvi4tPfVSetPp5Pr2pHBXOmFVgi7
 b7W1EHQlSuJw+TR/0E78ppYapqkBGj0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1


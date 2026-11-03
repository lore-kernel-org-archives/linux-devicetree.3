Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736369;
	b=sIN8Jgd5EkmvHfeiLldf6BYLWsAQwiZP9p6JCl2ywHWAcFAMxza8m9ZjUCp/lUAMfeQK
	 DGZ4XGHhCYcJn9VbZXYFx1TyoouIvxx6KW52JDyLPvZ5F4bMk3bsEVSZucMEIs5GGBlRY
	 Amu/mW+xOOfQHg9V7Kp+zz2mbzSNbqWz9eB+qQ9IlgbQ1dHzIRFxuOqLj3vfPIl8ucHDj
	 +LZMqZaEM7yun/gj7v0ME04Az1jp5MMKfkkhqDm5juXHOyjiA3BnSgtNGycBIM+dDBwfc
	 bdsmjCgAmHhvJ8uZsfHnDlUGyk3hNR3tQb5erlzQezY1a1uRu/1wejhilR4eSndGCEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736369;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=H57Y3M0nSv7OrnqtjDtXTcEF0Gciqj9vn+oh4s0cWXUkvIMRVcTm555e6bEM7YyquVMJ
	 /AAfa9+n5Gg6qoU5n/F7y1Eiq6agQe7aReBNazo7GmGDs0X5Qxbdlbn4rnA0BXDsWrgZ9
	 CBerxOt2CPWXM1qL1aKCO4OqLgcfH0+PxzlLtUqAjuMXxhTI48SRA2GrFLYYNbJd5RFPi
	 yy7GB2ubqTzs7ElNAL+mrUD4d8fi1JikFRt7SRC05zVa/k99xq8gXFpxLFzyUuXHGbMxV
	 8VuJk600Jl9Uxx/I3rOrmFFTdZ0i2XAJCeF19h87hrasPQ816jApjwarJwOICWSbngw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGdEkNDH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGUUTUKR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028A1606A33D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 028A1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGdEkNDH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGUUTUKR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ1Lc499584
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 20:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=JGdEkNDHLQfE3n05
	rV1gXVqqthXZL0g63tjtvD8mQDaOjhtSC4DqhHtws2l1rzoH5Lf2GwZuSEgyNIJd
	EGBofOiK4F5+U+zyVidg/hlyJqFVjN5MJ4xdGZJWQK6zIPg52N+iLaeJ++dXRRw/
	H8JO2yJ6Do/QI9i//nNhb18WjdrPB0F/7wV+1dX9wD6RDFWjAsqf5J3PO1xnlYKr
	KzlC8AjMViZf898NaXkZVl9RD1jMa2Qvig4VHnqRHN7rJBmu+FX52iJeR8dEJhXq
	SqcCbqkE8UtQ5KlBgKXccx+q76B6+chIGutG3uppRiB/iKWoZKi4rbtyyqOuCiQF
	B7j//Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76dc1e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 20:05:56 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-980b637ed69so629236241.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736355; x=1794341155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=NGUUTUKRZNBf3dSdVwi7rT2zYA8bL8+42INiMbI/SZG/dn/CBmajUP9zOcHkP46oiH
         RiqjW8gc33t0mBQ0lhmVAtDDjtVz5Pq6c3AlqI/AmGfLTvch4TnQZzdzaa1Flc5RzvZc
         BVCQjPHtXApz/IrXf/EuD5ojwIsWhaFGr8kmCxvSDmPdCHm4E3V0xB0SAKYK32YdMWsx
         /IF8qM5O/kBOB2lpUCI1iOUJJSyJo4OTZlEV1b2RWAzewNMPh16uUOWEwBAsz1doICSE
         KIbubIehKU2qmZWeKik1iyYf7hhRpppgn7lNCS8Aja4Oe+w0j1FaCq45T9ReycQHKAlw
         s3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736355; x=1794341155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=zEpGdsUruDbpAyyKjgITkVJWCZ+FCFhbKx4B46N0/VCUD7cl0w7fk8f7K6xih8/gBb
         T8jEaFlnfJz5sI5kzLeeMLQR+RujyxLDPwz25EQ6Ff3RDNO2/tPCD9vWz+HhFF0jz9Qj
         oUcd/r2El7L0a90I7NQBMHct5/vROJCh/ka2vF7/klhODi6fptkyj5HNgm5HQC6KPXaH
         cQnpp0JAZCEoOV1cKBQUZ/RRHobkO7YyPKAqYm2sDKBUdvMFynzzbJEXO6LSO+Jn9YAD
         BprTJvN06Bg81uLjlQ58YJKUg9wec0639hEwpWBoWiODiqlw0GtrmMHe/clSUlf3567v
         FL2w==
X-Forwarded-Encrypted: i=1; AKwUvBxikRbJWfnBHPm1QbfZByZAzOBRCKK+Rqrp4U6WRoUWC7SLoah31w5wr1xKbEhtiH5B7dfdkolhCNWu@vger.kernel.org
X-Gm-Message-State: APuU4Z9xX+pHzn46shzAfXx1a3xzpREOwbDAiEZJRzgDaivg+UhKeGsd
	xJe8khsyUzDBwa9GfTjdL4icXjvTIXYmqofNeTPCFi7pq340m/tWWXa/eM+ubRQEbKrF3gK9Squ
	SRacWi+DCw2eszJZadSnWSQXDjeFi74dg62KNKg/KnD2QcPFXwEpNS11ArBqIA+nl
X-Gm-Gg: AYBFou22FU/O3IIx8dKyyCu31Im7W6XTkgRdABWW3BEyTQXUdg99RItlm+n+TYVT24e
	MtmgV9TmflB0rPpSwXdmbrcWzCSuG5TtIVddICzbhxBYuoYHMxaEpI/YywnWVgwBewMgTofsQDd
	VsbBc/sHweISpJinSuPB2Eq8t3i1UPXF8kaSfapqToDOA8TxLg3aDvA8SDJL0LPz35eAQ43ER40
	mV0q/aVnGYAK5kLyyLFFUVE2v60gOTfW8/bTNYzyr9IjsMxSfy0AvMMF1jJtTSrU9IB6FSOU7wf
	uHXGNIxz2uuIsZLMOEgRoWS37OXGngfrFiVVmcVA6TvzuRYF1C01xC6CqDBnKP9ama38stL1nk2
	5Lig8W8olfP97YgFfJwGh837yuovBwqprqTTPqqkWvvG3e+w8IZ3m2iGBgBjlRI1y1ZJ8tMg66w
	S4ebvCTCwL5FEEp2wuqgOi/vULr182EbWWZnaD4XVqAoayhjuXIeglvIJJiT45ZLjhTa9inKRKP
	fXcNLgGDweQR+QhibbSCdHRHzER
X-Received: by 2002:a05:6102:290c:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d072238fc7mr5124527137.1.1793736355017;
        Tue, 03 Nov 2026 12:05:55 -0800 (PST)
X-Received: by 2002:a05:6102:290c:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d072238fc7mr5124518137.1.1793736354436;
        Tue, 03 Nov 2026 12:05:54 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:46 +0100
Subject: [PATCH v13 2/9] dt-bindings: media: qcom: Add CAMSS Offline
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
Message-Id: <20261103-camss-isp-ope-v13-2-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6aea3ea4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX18xaQissc7f2
 mLCMgqg26nHEr/aI7nYihBdd8UnlmwPT6Wqkok0/LrOV5F7tjjwJl7Gy8iTWZj0wolq4VJ+1dM6
 mJY97mqTh03jmGuCH+3rdZEjThN0qsk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX6f4Wyv/JzBfm
 3L9LBVfsJ1hkq+evSZgx9tYQpsxZTcnpFV0F6VXUHcYm5JA4u6uixkY7nPQJ46befl9Cpin6flN
 16PqMD3FhU5TkR+fx9t/9agN+kPFtlMpyQJ3mcwrN1pEgZgZ/zzekiOmvBg6jn2Av8Oo49GkAt7
 T144inOlBMKKKjbs0HOhNbD70M9iO++lqmW7GtAyCXm/3eEP9067BvqKpveYV06HIhQ4Ga11MF0
 sclPfo0IRAGbY5GYV01fPjC1ovAQWzXuNClhMgTIYZU32AN9XckBq5r8eagA0dvBRbJH8blASYa
 LShW6xlzjSCIzOQpquGVdQRP6Dl01er//wncIzUcWxSK9KTSdbiw11KDEj6W0EgRm+XDSVc661S
 +HGELO9E/TQHeHHrIdfrPulk80nCHsGub5vvpalSBBZaEJCCD+3WPSdq2uqJdjBogPj2WRk/sFC
 Jq/NR7FZD6kuWrGbtBw==
X-Proofpoint-GUID: Vtrs53_SBwvDxPGqoIw_OJvRfvNVqONU
X-Proofpoint-ORIG-GUID: Vtrs53_SBwvDxPGqoIw_OJvRfvNVqONU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

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


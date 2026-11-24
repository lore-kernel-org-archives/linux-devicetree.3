Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542551;
	b=kM77o9K8Td6VEQ21MPdOZOJmCNOQSY5lIs2aMGVneAbySN+QVAcOR5gnz+SKK4oFk2Et
	 F2n7Gu8HghtBEfqHFLPyyECYaqwXRJbLNOmKp2IJcRrBI9a677hcDl4PlcPcIRZkKkZBg
	 kF+tSHA0UH7CyOonD5Xx3kKmMEZFaCJ39XI+vg3MeseX9ebXdu0kUFRLifUBueYhJ1ikj
	 Akrz9oh2DUvanVCoGAzXfkXyQk5Ou995HYZy1Vu7IRHa9WvPi0j4b0BCRtNtDZbA13LX+
	 Y+o/amrlcxPuVT3Gyf0eU7n/knJECPAyt/e3uzPMYXs3kt3bZoosuTG8RFz4cnbOZAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=avLPYoWnf737hynZgFHKxpC9sYMKxbQm/yIW/KqWgEg=;
	b=0QubHaF+/Nn/J28XsR8r/tm6Z6m7eeQriapQJcui7GVHf7r0djAzrxw2hthg89ND8ke4
	 eLpyvd7r1bh9EV96cjFdYsUVZfY11xUSjSt+2tjDPK1v2k5+HmkIwXBu/0ketzn+b3aqA
	 sGdNAJ97FEnz6g9o3Y+Yk5ZyZ62MV4p6F+TRgt/raJ2c4vfDSSWd3uUq6Vdwx4coOQ/gq
	 URiL4O/Yx1IWwliCY/uAZ+fXsJXqUW/71svjMSx9zHJZTGGqDeICIX6fgnwILWQalLQ4E
	 IbaQBNhhBGw7pgh5+KnvYHhXOf5eSxa2x56S7OcjhPzSeHOi9nnql8p1iNeWUikFZgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G89w7csz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amy00qfQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C8C606A337
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C8C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G89w7csz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amy00qfQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOHPPPZ981765
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avLPYoWnf737hynZgFHKxpC9sYMKxbQm/yIW/KqWgEg=; b=G89w7cszOfdQieSQ
	c6M051S7fj9q6zLxa0kstE+DAAUIYpu8G1Aq2C15SqZ4lD0XzMvrC70xFbWinHAx
	wC8d6RsMFZGnQFXD/X64QrmlS359qvbkIYT8CdycTQfeDTshVywFJxMfzWFqZqXf
	x4KfzGVHNRKN2Aa1LSugn1bdSPUkPNvCCMv+fhstY0JHQimKF8kceXinrO/ppkrp
	8iT3CM9ze/JFTeOw42wGAw2ilxNHxc7P++TI8iafZv1o8zUwYeMJopjDMGWmwSiC
	5Kvs+PO7NYjXI7EHJNMBUcyvLqSkDzfWmcWABdA7fZ+3Tnw3qfQNvirpgF+6s+Hk
	iqc1SQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd83pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94970ad532bso239754785a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542550; x=1796147350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=avLPYoWnf737hynZgFHKxpC9sYMKxbQm/yIW/KqWgEg=;
        b=amy00qfQwqcKxbTmB5SV5epPOCz2qb9lVgKU8OM6J6F1QUJkdLnTRJXXYHhQuClkpH
         Y9A1XQRjpFN8TRdZUJYKqOB8qsWCjA8BVcsunaD7N/1JUKcPtAlkBzlDR+CGa9VVDs1h
         piZmOdrm1Z1FhzuzdmpiXMhPY1Xq3VfqWHHffvnpRUX8tg/t4AyQRDaKtH7Qr/0jc/z1
         yYYd+9JGfvEQ4ans9rUOofeNMrjN+6de6NmURY03oLMtPS7frnLDJl1e+mLPHQWAXU60
         MbJ1pe8aDRxszyXlWJT+nkzDhEmlhGaPGQI31RILTeZU+4TxwJ1c1ETGzhlF8FJQuzRJ
         TKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542550; x=1796147350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=avLPYoWnf737hynZgFHKxpC9sYMKxbQm/yIW/KqWgEg=;
        b=eqCdl2mE+fcoFa7kz1+Tvz7PDdIZpuaNBF3M+Vixj+74iEEVvUxE/iCqJjXnBCPVws
         0ozynjMbo98uKoZ35oeG68Hhd64CiK1mQNMii5sxMuUpHfv83RVyjkR6jZGoj3poYi3e
         QjbsieDDHXHo8UhZVESukvbTtSVnAVEKZTNbOJqLIaBSPsAcR26sJqZ+Lj0VbnKE/TwI
         D3bTv1EdzO+rL5gLzLUvVw5Vot1cXEsrg3dxhKtr5iBpyYKBmHtrn6z3nBmR8Dkya+g/
         TcUWTLFCbbV17+7nj7uCjA5P+TulIRVo7S6i8jHbhj/+CAwD7DRUAbA0wC/+uufDujVA
         76/A==
X-Forwarded-Encrypted: i=1; AL+hErFmgfMUZY1Bav9CKqtd/HyT2wVTzHlV4pPzZ2EWJGORS3nky3B5AxWxunGDxPzu3zaFdVFCm3rOkPyh@vger.kernel.org
X-Gm-Message-State: APuU4Z8/SF8zN6Y1nY4/ajt6wDjLbgbfUKfji20isVSPVjAFu3N7g7Js
	ETy6PRrb8J+7myzb2v4UCfVTenzbq6/gqJ2RO8yvDqP/oKhiUxFguY9qw8E9eoMktAA3+/KE7qz
	9RLTDyGgsT+ranxzBQT6zlcCNEFaNuQ68G7lZ/Bkcf3c93sH5F2hMHgn1AWTpwUca
X-Gm-Gg: AZFdTZc4yCi3Y+2Mw5eB5YuXuOSYbolFBLTzts3s2c/RRmbT5fs2dFKSTlG5hkha5xM
	OCSWCXlPPqPw1zSZQ8CDG0wRMsfzAvrIqW9PZzOtTAnSXM3VvG43g6/mMuabB7eKk2wGQcTgK0Y
	9g3TCdcjhKhzd0yFNqSoHg/cafHqfBFh6Txmp3Fpy7b47WX3oHnbHpvJIQEi2HQ+hDTRuKgsF3X
	NqFbMKtj6wwXlqgG0yduhzKniBrteia5aAyVmTqnZdKpmQA2RnXSVwZZ7ApQm7KlaWeS8s6fljD
	Eq2owvqD27p9JyPMIbW4WZKtW0XEOZ6GlawYDtxg5pMPheguwTgoETp60VPbY1SdRShNXOyGfcn
	mbfHqNUy45030rd6cgs1eddbK6d1GxxWBn8truE7kR/fIwcHKtje8c5piQ9PXCuBgcus33fWxe+
	RA/mWHPHCQFYBq
X-Received: by 2002:a05:620a:4688:b0:949:7c8c:54d1 with SMTP id af79cd13be357-949bab181d1mr2710243785a.52.1795542549624;
        Tue, 24 Nov 2026 09:49:09 -0800 (PST)
X-Received: by 2002:a05:620a:4688:b0:949:7c8c:54d1 with SMTP id af79cd13be357-949bab181d1mr2710239185a.52.1795542549185;
        Tue, 24 Nov 2026 09:49:09 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm6899678a12.14.2026.11.24.09.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:49:08 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:48:51 +0100
Subject: [PATCH v3 1/3] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
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
Message-Id: <20261124-qcm2290-eud-dts-v3-1-b3e5af3701e7@oss.qualcomm.com>
References: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX4jgri9hoJ5kt
 TKBGjO7Olj93JvFXtYfWvXCRoy5XWhOQiRB2Uix5oywklqoO9MyntthrF6g9s9w/ZdIl10Np8pg
 Bhz6Rux9w8AdWVQwTL2d3JhkIMicL0o=
X-Proofpoint-ORIG-GUID: cBH7BLQfUG2snbPtmDcDWXdE4aXwo_Gk
X-Proofpoint-GUID: cBH7BLQfUG2snbPtmDcDWXdE4aXwo_Gk
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b05ce16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GBRnKKbz5W7R9ATGUUsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX5dg0ROcl9jBn
 JyPFP6qXsbBViSOhtAZY2KtEp8EKB4KF+Wznt74LDwP7x87/6Pj/zaYB5zibWn13uXvTWJ5NWgX
 XdR34kKNesJL4wAtSl14XuEb0VDE6dOWn2PojbmPWnFajNyb1wmw5pV3wetFjbLUocR9fTmu2Ik
 LBVUz8pA9DymVO9N0glMZNz3GXHy5R8Cd602xGgwA/Z801glRG8D2tbQ8gwmDfBeKLBVrXOaN5/
 UXt+0co3EL2NbGWD1mjb9MaTBTauM2VipXFlMsWqz/YCkvW40SDkI8uFGJnQvWUIiSQGY4RvlsC
 YZcC2UZ4dVYHswrYiv4yGy6/l0hXv1I4QnuPZi8P0E3tMyq81kwfchJLcw3X1YZcLMCTJrfwo3y
 6K35RdmLpgWytxP4uk8FiuphPhu3OX7fuOssTprY2ISKr1gQGzfGLWFqDD+M4cv+4be9v8klA8N
 kBc2RT/LraIRA7qYZEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240069

The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
CSRs and the mode manager register that the secure world writes on
behalf of the driver.

On QCM2290 the mode manager additionally ignores the enable unless the
TCSR register TCSR_APSS_SPARE_REG1 is set first. The boot firmware does
the same before it enables the EUD, and the register is written through
the same secure IO service.

Add the compatible and a "qcom,tcsr-reg" property that points to that
register in the TCSR syscon. It is required on QCM2290 and not allowed
on the other EUDs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..bea03468a499 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcm2290-eud
           - qcom,sc7280-eud
       - const: qcom,eud
 
@@ -29,6 +30,17 @@ properties:
     description: EUD interrupt
     maxItems: 1
 
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the TCSR syscon
+          - description: offset of the register that has to be set before
+              the mode manager accepts the enable
+    description:
+      TCSR register that gates the EUD enable. It is written through the
+      secure world, like the mode manager register.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
@@ -50,6 +62,19 @@ required:
   - reg
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-eud
+    then:
+      required:
+        - qcom,tcsr-reg
+    else:
+      properties:
+        qcom,tcsr-reg: false
+
 additionalProperties: false
 
 examples:

-- 
2.53.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A0D371D17
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923486; cv=none; b=f9IFlXBFHAq4Cs8BZZzcSTLsEyEJRBzSmDd+5RCLRqzrbaecEAeTycLvzYOnti/mehnnvISd3u+gIhfmfsA5FPPtu56rXe4XA3sexDQ+pg6TNRZKBfUzZaR8abtMQE8vgP6Wzn0Qo0qBTLWpy4caAUmPr8ovcX1UPIV9iKGVyd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923486; c=relaxed/simple;
	bh=Cmf2tas+7KmcpT6LiXuKW8bG6nRTbz++pqJrdVNObQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qqp4TZpdfyvNjzr7gmVFQ9svvFLNxCOLivI1j0ysaJmqkeowuhr57Ng1y2FGQURr5jk1u78a3JMKq59pe5puPZhDUDTdTjwlkpggFk1Mrh//16GVYiqyX/uz98wDEZzBduiNdYUfb+TlQr2ymU0/cQiLVBD9sq2GuPLHQhTb4Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ov5mht/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X7epOAWz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ov5mht/d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X7epOAWz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoBJB1532432
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/PufBh9rPr8
	oagbh2Gp+KNcLg15esEAYaPIkHJlU/fQ=; b=ov5mht/d6V4S5a+0dpaXKs5Fvlr
	nfs8ajnWiO0ILO7Pre4hvcDPKTZ3QhUqch4w3Tf3exwgGgoK1YoDx2lnE/4MZO9n
	b8aykqPkDYQb7LHcSlRkVNYE2jhhj/Z1n9gevloO33tlNkcFlqk8l8SRkkBzSduy
	XQrp/feT0M7fotKGVX5c77YX41MZmskI4+uqYQ6B9WyR/gr6ddkxe3tnrH129Pho
	XAJXIdQSoux3yZy0MtN+oxz3A0elUrH5KrN43CIoY7ZEKt1pd2alyfPN/30FN3x5
	Gn/b0A4khFUgO+uBCgaRa1gzESUT0GDS3/JIV7FRrqTs4pk6qAXbZNAtGXQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tjhn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:31:23 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bdda66a906so690963e0c.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782923483; x=1783528283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PufBh9rPr8oagbh2Gp+KNcLg15esEAYaPIkHJlU/fQ=;
        b=X7epOAWzsUi0oG8o72+1NNRz/+bv7AigRFKxucVHU0bx1eAGq87aMfqhYc7SOnl5ig
         woX4lggxVSlKkso3BIiznKhhXmY6a/CujHhnZT2KjRxf6dQ+V6UoMeKwEXRbxEhV7tou
         TyKeh1D4mrvj8LYDWDpG8zUGetP2jqzTO2ZB5hThEs8xzecWbbX4tzonKJ0MJckpv6Kr
         xPSVn/0Q33H9K5NySD2bBe0ZLTXvX+/FlI5mL/yxISX84pZIue5017nJNlXFzcuEXFoj
         r8HFmHX7lb8JgOrEp2fFYnujJP6uonzeG3CP49TXNQHAlmM7esZRfoGzbQXgyVzt45KX
         0kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782923483; x=1783528283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PufBh9rPr8oagbh2Gp+KNcLg15esEAYaPIkHJlU/fQ=;
        b=IkhvxgGvywgQXO/v9Dvsyaupb4C9/WeEW7jADpL0QAkNAHZidKtaLsRk80iIAcgznr
         8Nrv2fjDFTEXsuzDDc1qhllSU0xl+9wQ7AE6eZ8PqpcUlFldMfbHKerlxwW/GgtOpT+X
         p0FeKEao6vSjOTFHMsbDVrHnhJGb8MMmnVOJFuS1RC2wvv/BpkkssRBpYNyUkf8VHhrT
         BQlNnptvhm+1mB2TSzWeIrVzhHxeWCxLpv7lYIdPI9Y/+9KTygNbdDHbaUeI8r9iglIi
         s03dong9ZBzfRZbk4V80gwwFEnxKV0X3EZqKZqKDGYoMb1KC3booVThpDBm7I//lvj6R
         J4rQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrF8y0htk3exmz+su2IgNA1Pv08J4S4qiOkF7JJJJBi45yp15IM3n0Uj0zUKlogUJ7GplGdmwuyVn9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wInmIiNDCuPF0pTbteBuhBF0Q9wyhyyqHaaj8MQxSXL4uobh
	4vjstqhlOtKRGmo6H3OUNNhC/mBLHGgUYs/Iydsb8ruVxbJoRAVbnmoknqDP4m/xcbcIK/K2rpW
	ZHtQ99XTGo0mMSlpA1bGy/Uh7lEAyf9Xe4RgKz1fOLh+cCesfZXodfkFkTLv10brh
X-Gm-Gg: AfdE7cn96WWAx2KA67QWIOMYSxPHxn9rAyD8OSPRi2dO1ejSsGxCv5ZqVtuRkrKlU/k
	J0JA0Xgj04rbAO17mDq7iQWgyylrQg2FUnvQhJNV51rW/pfKGx9mdAp+1X3oE9wsxhdI/UC7Jhp
	5fbGNzbxIK3qRfyKR2w2zITXUM9GmnaFr4dDvSpk2jAHnBLgmc72G1i8JPdsOAcxhPlZlXncUz3
	aFO6T3ayTo8lXbPdc3nQnDP7A2i1wX9PYR732J0uQ+UyKBG6Fqurv3zopDf0/9YkTMHrg7KaEl+
	SGbWFHIR3ysuiej7vLrxTGDgvOCdheVmzfRb8mzWg221RmHCtjBlWYsFh4RVo5kJpIvcWJfhlTv
	bNVz+q2y8+natKqJo4PiTWEHK
X-Received: by 2002:a05:6122:e202:b0:5bd:9ce8:304a with SMTP id 71dfb90a1353d-5bde3b71d5bmr805894e0c.13.1782923483395;
        Wed, 01 Jul 2026 09:31:23 -0700 (PDT)
X-Received: by 2002:a05:6122:e202:b0:5bd:9ce8:304a with SMTP id 71dfb90a1353d-5bde3b71d5bmr805852e0c.13.1782923482952;
        Wed, 01 Jul 2026 09:31:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b73sm1077874f8f.15.2026.07.01.09.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:31:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org,
        sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/3] dt-bindings: soundwire: qcom: Increase max data ports to 17
Date: Wed,  1 Jul 2026 17:31:13 +0100
Message-ID: <20260701163115.3701298-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -EZCO_qRvkxlsA_tlWleGJMEwN9T1xH_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX9iwP/Phx/ZIT
 p1BV9/yMtyojlD1IQibXHMSDowkTeddfr3R9IrA8qMiNjr/VzIjv67QWoQiDwDz1D7ASX2aG5g0
 EPTwy9AS7Iamyajv4YiqRr/WvytgHtQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX4/AYtQR+zvkn
 fi3VoH6RvN23UgFgQl/+k57YIEu9YHz0gtyD4GZI0nNCpAXD+j/e1fTq2A3xr0oFdPCg3M8gWI9
 z0EOUYVemtlTSOm5E+l+GxH8X01/wtwurMH2mhIQpYpyYVnTJqAE6skVnvdosY86vQwOp7NtT17
 uCs2GxPzlhjQM+/wSLnRnanfxR8+7mdcuTIr7+RQTy498QOfumlITprJpaVK1WN4RJTCuwEWCyh
 u37llq5ngbPxQVcm1S9RJcHZ4IQtFrvwKxgc8DKgywovpsiG087m1+Fv7zbk7Yz83I8M7zyE+ND
 cPTTZd508fQ3Hu6YsJmavVApPFJ4s+86WB0sHvUT1G1aSDMm8Hvk18US/zkvb2qvA5C8vreX+rv
 CdXlaB8huQPHhD+N1QAXjqFyUcreMD7fAdtSqhITRgRxhboxUFXg+JUbWYZS6PQ+ZrpG8s4Ojet
 3bwr6Npf3hBIboZTTgQ==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a4540dc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BZ2PEOZbcBSxFJMT2ysA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: -EZCO_qRvkxlsA_tlWleGJMEwN9T1xH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010175

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Bump the maxItems from 16 to 17 for all qcom,ports-* properties to
accommodate SoundWire controllers v3.1.0 with 17 data ports.

WSA instances on Glymur has 6 DIN and 11 DOUT ports.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 9447a2f371b5..8e6973fa229c 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -90,7 +90,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-sinterval-low:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -101,7 +101,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-sinterval:
     $ref: /schemas/types.yaml#/definitions/uint16-array
@@ -112,7 +112,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-offset1:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -123,7 +123,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-offset2:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -134,7 +134,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-lane-control:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -145,7 +145,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-block-pack-mode:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -158,7 +158,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -175,7 +175,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -192,7 +192,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -208,7 +208,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
-- 
2.53.0


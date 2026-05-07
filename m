Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B463BE164
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 11:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153102; cv=none; b=L3hztWy+aUuVr9Na0Z/XhbX4euVQpLF5N2xDJWJTzSpcbQrrjjboftmvQEQgcShyrNOnI6fd3jgprGJPZOtbhELVsaLigzAjqWswJLsOBgO0ya1gFgddWEhyk+pKX1jjpk68FixNAScYf92dr71b9JoRIEIMbaHUa9hFrnNXVq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153102; c=relaxed/simple;
	bh=evVlV5QhwdsHRVHassrrlpvsT6O77VZkUS8aHmvhG8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wkx9rzSyfpqaqoajX6tgdfiN3U+JmvcC2gfIwPRdFJoqcCumCFsMNgBOc6Us1Pw0lCiYmlA9sdRjpLQFQTJs0OZh+ThU+JMnoZfMpsQxB77mSK+EBYnHztiK7StFQZmzOHhXBoS1kt/7j2ayuZ4TjI5lRLkzSWxV/t1Bo8ZGSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1I2n4r7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQM2ScXZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1I2n4r7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQM2ScXZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AOm0I879574
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 11:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gE84wqweCwZ
	bNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=; b=g1I2n4r7RI9LVPrcWupj0OZxnEF
	6y2hj+IvhgSeHH1T78PFTXI9zbOJ9QUr/IZ05/kxc8WoBfj+ioPX1FTA1JUkJaWC
	Jv1yC4EfBNDYo4bBMBPYdgou3Cxxjs+9EChc4to9K6Odnp9Q73i1pPQIwaptA5Xt
	+gHnz0fbqH0PcNy0yb5SFl3bZ1xkVjN+j6DkgBsLo7n1ndzdzSggfwM8774HVATp
	mB6GkqbqMdfuzaDF2dSNC89w6z5p7A6gCcV8Kpwz6nZrfrGYJpjCTPX7zBHIZ5mT
	L5q4Jp7eimUG2YkwZ1IvpFoO6mDNUggQB3aPftY4tpCcmyHM4GMYz4iArXw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq1j4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 11:25:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so3337571eec.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778153099; x=1778757899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE84wqweCwZbNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=;
        b=RQM2ScXZ41EDnh8hoOiYX4ISbAeWR4e7zO031rfYDi/Zm7hYo8hSGvdJr+aFNrGs6x
         Mn9iix+J0SutxKfk5Err8SC4b6unof74TJLYV/pSeA0QSQL55AOAJKn1S0TQCwd4Ld7f
         diA3zV6vQvJQYNmlch7J4hIr2D3rAvAVZtyNLedUdIiff25bggbP5mi5Tm+KnFikYuVk
         pSfdelSF7RBBcN3bABY/M5IcCAfuwXmXjewVs668cauw17eWlQKZ11vnT6Z9V6P6N43u
         XDqy+UHEL9/zx2Av8xDwBiuh9v1w4vjR7HKNtN4jqNNDSdT/NpnQQpMaSwc+sChuRVhW
         oFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778153099; x=1778757899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gE84wqweCwZbNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=;
        b=iy52pdj84njrHwjF2QR3PaYsMveLjREohhbLlZhmxhVNU6OQLtRTBj6+o1ZVQmtyu6
         HBv2iHO2lEoCJ9jLcatIOvTYspaugMBYyPwEIwpDBkz3Wk6rtYyncPt3XYPj/73wKcBB
         BGdyxreEg4AcPXrtFJcQSlEhMkfrZDGlIB3R0W2PqMAkpwtQA1CxcnKuF/iiW9QdN8ZT
         J+dPJJYajPZ0vl4tqhNzU8VmwIEx5PXENWHS8dZ7SZ84lX/95HymdUM3+hU+4lk5D3Vz
         glkaw7Z2G2nm6IjhJ9hC7ac2xzrPsRF8KbKX8bR5gkc2ZFUu24/251XkFGv15En0q/kI
         nuPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6knXY1Qjuke5r8d+eJzi0ESX87tw+OZVG+f7TCbkiyf7IAYRzs/LQ/m9+0jLB1ew7BFabjd8qg2LB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywre9JqciMbULtAl1dTR9z4mGaDSONPwuhC6RFrRhVIDLJg5twj
	fN92RtDy8NH6jYSmmpCF9raTWCOUgJIp/dsl5zr2BmgDvBYXeNZ1bksHiJawR7G10sT0J0YYZsP
	43+BzshQYIQLeptbgs1w2qNvE9n2d0edPMxiPFwyvfFLUkRp2DjX6DbiW5CJOUAu1
X-Gm-Gg: AeBDietZ8iEiI4cuRoPMOljJzbRfPG9XHC3ZeTnfiyvh7Sf9HtN6pqBHTNM0Rbad/ek
	jn4Vdz9hMhumgspd/mWdtwX1+mtWzE+zbeKHXcUkca1k489h5h5mGqR/ubCDnf6dpuihIfHa1Mt
	1hn1FGkudaxVDAqVVoOz8ueHPzfGZrXVRhWr34sZr1eo3chXKjDKugrKJRpV+GxDJCKTzN50k0f
	vjkcthokWMUFZrdh8uWC1NpYXCpp+UJ9lpIORgsx9oGOtCSmQWXiBqtB2OUmgiyKXgXbP4HLFMT
	jwW+TA4y0zAuoWRZGYheyZ/fgoOMiIT6MFkFIdDJpJFDy0egyGx2Pg2oFObupgOiUph6TB1eVeD
	52EncTyq5bwI+oyFEgNi+Enx9t9VBzw10cfVq1aYKBf5OYrlC1I/8PgT1IsvGkHDOelKxGpPEEj
	nwwj9cNSyHK58c1nk=
X-Received: by 2002:a05:7301:6784:b0:2f2:1b3c:d832 with SMTP id 5a478bee46e88-2f548a9867emr3949416eec.5.1778153099430;
        Thu, 07 May 2026 04:24:59 -0700 (PDT)
X-Received: by 2002:a05:7301:6784:b0:2f2:1b3c:d832 with SMTP id 5a478bee46e88-2f548a9867emr3949391eec.5.1778153098909;
        Thu, 07 May 2026 04:24:58 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec592asm8151115eec.5.2026.05.07.04.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:24:58 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: crypto: qcom,ice: Add sa8255p support
Date: Thu,  7 May 2026 04:24:53 -0700
Message-Id: <20260507112454.2527088-2-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260507112454.2527088-1-linlin.zhang@oss.qualcomm.com>
References: <20260507112454.2527088-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc768c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=UuHxjPGgWbCNvu6MkpoA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 7tVzEtS6rgfXFH1xJ2yLsGcm3Nj5O_eE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExMyBTYWx0ZWRfX4w5owEnM51hH
 MMmqRlxK9K/FywHHVEibMLEGRUopQnM9zbZzkfxGM32eETvrLuS9vJ/nVmByLjtGLpdj4XaBTXz
 EOWylv/4mF4MivXqN2SG4qhrS6wMHsWrJTQTmSXzGvyuaRw83h+9jUoI9iAXmOmNNJ8VKr+OYQb
 cNG5VZbi0aAu8undgbOGUO6vdCpSq5tFPW+X1Y1+rlRjs1bJnmHITERU8ukPIrPGVKP76i6gmtJ
 Q9hrbGNHHRPqOmrp94pMioV/w4WGzdZuANGWox9oME+RKrS6+DvI9v7SurGMPJheXtp0thFWulP
 veoSDmFOfoVumoX/Xa48W4K0TgjrdkpSPEaDf3KzuYlLQW+X/21yRzIo41Sd3ty7Mut+tibXZBy
 LFN1WlXNggpAvo3ZxmoOvSl5nKeNwKoVuw7Tznn0TQHRnCbwadI/IHDMqg1J1pldEYZD8eCc8U0
 gBgVs0L1q/d9NQbd5sQ==
X-Proofpoint-GUID: 7tVzEtS6rgfXFH1xJ2yLsGcm3Nj5O_eE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1011 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070113

On sa8255p, resources such as PHY, clocks, regulators, and resets are
managed by remote firmware via the SCMI power protocol. As a result, the
ICE driver cannot directly access clocks and must instead use power-domains
to request resource configuration.

Add the qcom,sa8255p-inline-crypto-engine compatible string and make clocks
optional for platforms that use power-domains instead.

Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
---
 .../crypto/qcom,inline-crypto-engine.yaml     | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..4e7d9111d0eb 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
+          - qcom,sa8255p-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
@@ -32,6 +33,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   operating-points-v2: true
 
   opp-table:
@@ -40,7 +44,20 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8255p-inline-crypto-engine
+    then:
+      required:
+        - power-domains
+    else:
+      required:
+        - clocks
 
 additionalProperties: false
 
@@ -75,4 +92,12 @@ examples:
         };
       };
     };
+
+  - |
+    crypto@1d88000 {
+      compatible = "qcom,sa8255p-inline-crypto-engine",
+                   "qcom,inline-crypto-engine";
+      reg = <0x01d88000 0x8000>;
+      power-domains = <&scmi26_pd 0>;
+    };
 ...
-- 
2.34.1


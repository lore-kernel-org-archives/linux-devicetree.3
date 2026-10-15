Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588364908C3
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054741; cv=none; b=kERLBoZSgnNwwCT4BcLRmx0MmapnpgeavhYF0yKTTrSu855SeuNH7/IzK4UzvN9M+e2QEhNyi7JdsOEgioOOcSZEgqfvaMO9hvauTmR7iE3fjJ+wC9WYKJYR6pmIQA7x9rcmsN1Jfj86KRIQ6EIxUhpk/FqO9MlSoK8U1kLx05E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054741; c=relaxed/simple;
	bh=0crPU1F57WiNmZgblPHqxJxKN+WWqULT8xXlWGIFR9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pg87c70GRKZoKTWz2yXVwpRvaodCqWt6Ir5a3Lacpt7mPZrx0S3e95Qo+nVFtXCnr2/qSBVeO4TbRwHX0RFjL8cuz2pbnMg6AInVfo42QacMwEggfg8tetaXtL6oEKqdE7PxetDzRRc7cHwgbHwpD8yeTMxiJdmYjCRhKih1ETA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgroUWBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXaNFYKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgroUWBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXaNFYKN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6KKTO644643
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WtIbWYmm7ff7OUPpUFuKzJSSPLR0ROTbUkKbTEOsXzM=; b=kgroUWBL2VhZHY0v
	sEDYouHcrcnsMdtnLfnNjaQVlDt3gZxh9NXNnI4KpT8OxPlmOaNrdQs5cXsBkA6L
	yQTXu1PAKiqxiZciLM/gaGmxNfqgkaT+JN3nQD8KeupF3kn3QSoN/oGEN+2PzbAQ
	edzuIQoufRxw2p5hsoVZKW6TUjuDM8HxgoBho+XlDgOhATftVoMt6wZMSt1bT1se
	d0yeQSRRV4QXmrc1WdcYIXoqBfbfarqBCZS7TBJqZLxN/QpagEyalDnQIlzdQc+4
	YF78zWoH6XPhyWtWmlRQZ3j8Kt8yCahRSCkdWHb6yoG7hOS1vQ4E6HpdL+kFI++0
	1ApP0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmya4g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:58:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1534062285a.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054738; x=1792659538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtIbWYmm7ff7OUPpUFuKzJSSPLR0ROTbUkKbTEOsXzM=;
        b=hXaNFYKNxzWM5TQSpsXI8vtRi7j93LiLCHcxWmnPwUYUMoRcr8uxAqafeer8cOkQmK
         f0VGmJJ0PU1xyxsFRQZ4WtKNZQgHbpiYdoSuUNQspZCsMviWIPYiX4RZ/LG0j1wQF13v
         2nR1PTe03Iat57bSS0m9sbmY5MTOI/vIdhMpdzbL4cj/ahtJToG/fX0GflokN8tIFrt+
         VDH+rTq/piDjziB7o9v8cgbVWi5hEUsV8JszijKp3fBm/pO7At/jt8IzDaP91p9ZBPEN
         mca7d+vYDxJai01yrdZwGkFUvZNX/5dreyXrKZuRaYPbhuhU4UDNreclGr6FwENjzcYd
         YxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054738; x=1792659538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtIbWYmm7ff7OUPpUFuKzJSSPLR0ROTbUkKbTEOsXzM=;
        b=AZ5glZJh7xHAv/iCC12FF8ubDkGmiwSW9HKVR5G+bPvtRRTX/be9ZC78lrbf+pcAYd
         fHw3yxgwN/j19Le3DqhJbdzRfOfPze4O98/+ysDzWzLsyDxy86CWBKHwWT9XBCU8LPRo
         IlbJFtoSoR1NjsVHX0i9FFeWBqtTvXMM0j4seN4qza7qlN/thttyRhmo5yuBqcescz7K
         z9fMaOzs6u1afodW4ORTyo+F7vDUQ/IAxUCJ4IFDytyHonyQZ+y1oa+ocIAerRb/99tI
         b+SH6F6hgAB3vERrTfS/QUowd0OtgrpOQf2+Q5sXGxNxoLkAr4S0KabaHvCceVTGc6Qi
         DgjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI14r2PGDzhvRxAh/EnBvzz4ZHILIslAPrmpf/v+/CXKtB4P8mdr0/DSoAhwd2l6XmLcvJauwY7Si8@vger.kernel.org
X-Gm-Message-State: AFq9FYIwLWP/QOc4EwusGxLC6N0+0xJmvUG0NpKMgiig4B5kH3MlkqyC
	UP6x3QhU6PaBDi7bBuh1FL9l3TIqun+Au6rvYkmwrcaxFMEf5S+xjaes1FCW5pqVnzxhzOTsPgf
	lpz6nJ5sEn0pZ/hR/cOqNBvxIH9nIIS6y1BgoshNygmCGSkgxHkG148gfo3UUiyMz
X-Gm-Gg: AYBFou3fKGCMwVs3PA7wJk8uY6XTA40rq3FrhUGnLGLp8XxJ0sgAr6mGj0CoQU/rBA2
	0OGxwlrV1mLyWzWMGErnrpDJOF1W2b6GRHTEmwH8gQY5nSSGOjeeBEqPRuydbMTrueM14Q7EsIV
	cAhfZD2sd3Jskb8nFxtPuCdg8fXPOnE6R2xyWH70gbR52+AbqXY9WQIe+HogZyuvriKEYcOsFCa
	CCmwDhAnNyOnKHS4RIPnlNzzPLvUzv0la6QkRNI2cNOFsdBgZ4djiF0MVl15XC+o+VMdTRAG8xi
	h8camiz6plXgtnVv/PQ2iC+vAGXyWeJXE86ZEV9IkioSfPEhgl23g0rAuw7kZ5a/kzu9teSGJbn
	vwGp/5tvougktk/CzzHgRFnt9eNqJMv8D/AvYtwx4ZeBTQvTXZs9mUiEqoSBH3a+nbVmN4etHDn
	9/rm4ERDNVFh4K
X-Received: by 2002:a05:620a:4045:b0:93e:b664:db34 with SMTP id af79cd13be357-93ebd27dd53mr3033930785a.57.1792054737627;
        Thu, 15 Oct 2026 01:58:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4045:b0:93e:b664:db34 with SMTP id af79cd13be357-93ebd27dd53mr3033928585a.57.1792054737158;
        Thu, 15 Oct 2026 01:58:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:58:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:40 +0300
Subject: [PATCH 3/9] dt-bindings: regulator: add Qualcomm LCDB regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-3-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0crPU1F57WiNmZgblPHqxJxKN+WWqULT8xXlWGIFR9Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXE3MMATOMFhtKps8PFYXmSqrI3N+vo7Dgn8
 esmJM/cIu2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVxAAKCRCLPIo+Aiko
 1UZ2B/4rcY0My5fgNc6N/WUfHMYJS05A819Quw4iBwTE9Y5h18zsWhSwEIjpjvc6W2mFT1mrdPG
 El5ZIsYQW/gso2uwlR9hGkoGs0eH1iWT/sJJYf3mtJNrPmwoJqeZayL/yHV57dg00a8G9Qj/mQA
 RIMeTDEg05pXFBNINuXk4sdDkcWUIklN7sI2aL1vX3E/IAGHtWOG79UF6kMtcQO2g5A8sysRHHn
 OvRKyBEZp24bCS9LJ+vAFRdjdYNNsm+Taz4WW5WHyyAJRIdSD5nQymAq5GMtzZLW+/OgfIw2WXS
 P4dppgpPDq9PEm/pCj9968nqP+pS0EUzlTTK85CT6UDD/aSV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: pfiHwJpuTPwE_GUZSdAJ3DjiZpNZz8YN
X-Proofpoint-ORIG-GUID: pfiHwJpuTPwE_GUZSdAJ3DjiZpNZz8YN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfXw4sVJBvjXMTQ
 0WbqvOvlrD4M5X6m/LW7xln472OeloUWVSQzgGyrEmviq+54F6tgG3x7WoqQK2Ngf+vO1SrEdAN
 goECKWGq0Koc5ORt1A9N9vSDKwqWGLI=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad095d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=T9loRX4MMf1nJrAHyI0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX3KZS4ZvH6P7h
 mcOJiC1QRsR6YFEuexdLOiIXmgncuuI++Bai1ebyWqYTpwtidfaYP9pnNXUldIgJ3sCWLxI5rGL
 p4TCSOzih8H71CB9dkHJaF8NiywtK3Yp8zX6hi5YHxjTg7aRdhQL+VqgHHCvSpB0kxG4EhdDVtq
 fMFhEpaoSpbaWKrGTJk9cFULHxZLoscUfFL4YGxcq2sgOweNHvuqI9XL3+t7h5d5/W1G8HYD9Td
 umkcPYqriSECPBcm4ljJeAUxPbn8SEaNfNcfKgHtkJntXg+ypfS1Po5iyMrd7RwuJadz1cEYT0O
 8Oqb/JdugK/ht6+MNTPjMCYxPO6fSZS039prNlUyJ+PWT8BeJ7V0ALe0+veWh7GIBbAtMAuW4ko
 aDKeCIzYoAc8CaDnQ7gC5f6mT4wfUdKW2kplHkdsUeAOHXMoe1TY627lSk8Mhc7YOJYjv10kPo3
 JSxQPH4GaAZMca/mDeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

Several Qualcomm PMICs have an LCDB block providing the positive and
negative bias rails for LCD panels. It is not supported by Linux, so
boards using it either model the rails as dummy fixed regulators and
depend on the state left by the bootloader.

Describe the LCDB regulator present on the PM8150L. Use it as a fallback
compatible for LCDB blocks on PMI632 and PM6150L. PM660L has a different
version of LCDB block, so it's not being covered.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,pm8150l-lcdb.yaml      | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,pm8150l-lcdb.yaml b/Documentation/devicetree/bindings/regulator/qcom,pm8150l-lcdb.yaml
new file mode 100644
index 000000000000..eb5014f86439
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom,pm8150l-lcdb.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/qcom,pm8150l-lcdb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LCDB (LCD Bias) regulator
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  LCDB is the LCD panel bias supply found on Qualcomm PMICs such as PMI632,
+  PM6150L and PM8150L. It consists of a boost converter feeding an LDO, which
+  provides the positive bias rail, and an inverting charge pump (NCP), which
+  provides the negative one. Both rails are switched together by a single
+  module enable.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,pm8150l-lcdb
+      - items:
+          - enum:
+              - qcom,pm6150l-lcdb
+              - qcom,pmi632-lcdb
+          - const: qcom,pm8150l-lcdb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: short circuit on one of the outputs
+
+  ldo:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description: Positive bias rail.
+
+  ncp:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Negative bias rail. The voltage is specified as an absolute value.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        lcdb@ec00 {
+            compatible = "qcom,pm8150l-lcdb";
+            reg = <0xec00>;
+            interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+            ldo {
+                regulator-min-microvolt = <4000000>;
+                regulator-max-microvolt = <6000000>;
+            };
+
+            ncp {
+                regulator-min-microvolt = <4000000>;
+                regulator-max-microvolt = <6000000>;
+            };
+        };
+    };
+
+...

-- 
2.47.3


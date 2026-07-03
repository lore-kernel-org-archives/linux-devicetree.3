Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC40369D4A
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063855; cv=none; b=F1kd+9rnsG8aPLdnZMRlnQOM7id8gkAc5MuH9hvRCLAxkozywTKt8lU+Qggvq1NQ7L79VKC+1KxoMrv8o2GjagmCsYQ/8UBsZkz3/Hdpx1zZJtsTvt2X6ZfkMUJSXufZXj4mx4GKUNIoli+vBFzq8i/weyOvB7cuZrm3NY02Vc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063855; c=relaxed/simple;
	bh=2ztaue1cIpZHV//WnvcJojHy9G1ocKQMr7lZ0moz7+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Frh15YtB93VHpmcY11GQTvkx1pveiPWzfwSDZFAmXAbfN3AyaI5MEMAcFKNK/Yntv4BwECCukqT+pxnOBWR+6FHvHPeZbXpfZRCXTyLn1ISBQX5n9R6gyNNP4G8YGmJT1qp/e/Ffq+peC44B8QLfxCNWa8vwYHDPamwXpv+t2LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nM+47a3P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBPkwv/C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nM+47a3P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBPkwv/C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rqfS3135222
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ty+/2BoJCyU
	FYt9WTO9l4AhrQZc1A2Y5anJVverHIk8=; b=nM+47a3PR3O2wYyI0Q4o8wEiY43
	YUH1hcpzGQmuoVPQAJrhjRgfH2nvE41fpg/1Wy2O/gi33YeYH2BuiNiWet/WpovD
	07BQZwHLK81jWpiBh3Jf+TvDt+6cYqkRE5Yt0A3oS1ml4Dw1PrjcOrW1lIL+9HU/
	qOdhyTF4cScPKl+CJvYbmllzSGwOF+17Zr6g8+WlsBmSYShTKJVS9oIeMIqXUVRf
	u7nOk0irKQ9RY4APYJSPdvpet6yYYgKx64N4AR2u54z9fRZygrYREipB0VoCtRfa
	A9vmp2Rsa9ogBX10NCH/wHRD0AErs6WX4U28g6Z/n+iCZkLeIUED0iEfzgw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcgxsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:30:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847b8d76e3dso557828b3a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063847; x=1783668647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ty+/2BoJCyUFYt9WTO9l4AhrQZc1A2Y5anJVverHIk8=;
        b=kBPkwv/Cq38+7IQiPHZViWDiRLVHZSEcNuIoEcLIkbziHBtw4wyBTNf4FzD4W8EZgW
         5/bp9WWqEOxRwdaSoXnL6tZpuw/zmsk6zNWroAREHVVyRl9m6JTyew8Sfe1ZhMeRU2E3
         Mo2AK2om8+dQDhUkl8i7SilRVXWIVeuwF9dd3sdqZLD4N/pqAicKEhYDHPpVdHYZwHp8
         djqFvbxYEWEYhjCoSiAIEoJadzdj3UleadJezkZ9cMHNMfk/b3LV6h2ieIKg0COt/wMw
         9lBoI5cPi3PoryipHD7DZbmWmiKtl4rp2pReBIzOJvuTq0Qm+3vaj7DNH8AJGzT5fxOo
         hZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063847; x=1783668647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ty+/2BoJCyUFYt9WTO9l4AhrQZc1A2Y5anJVverHIk8=;
        b=ab9nt6p9iJs3qrqRBHJvSj8VF6o9NSJJW8y2lZ0seqJTBbyaZ6RKNmkEG/Z3c/jye6
         pn8nKtsC+kezukyPEZbm1wG9gMNfEnLuOdO2ZY0r5uSeut1vi/SgVDdHc1E5n0scU8Pz
         q6apGFqyVI2k+DyOzyO5vOOdXHch3pl3Z03NcodFzmQgaC3KlEgWDXeau6FnX/ARbEAr
         F9TZT4cmQWKw33UqbjloS1rp1JET+6oK5bX7MhwzyBtLEc0znBFIbI57vZXTfxR6RWSX
         C4R7siA9Wn7kSFFXiksEqGLmXtUXRCo3mF+oGjKwTrB0XENAQeA3Ashc0Idq038xXvg5
         +2qg==
X-Forwarded-Encrypted: i=1; AHgh+Rqq4/Aht7Zu3vccGd9DrxGEa404onxZGuvfNItmHlqlxQsZOKSTmEgxWWDQjH8r5Tjwm7Q0DhvOun2X@vger.kernel.org
X-Gm-Message-State: AOJu0YxtCkLNWHpXGCiVaqrjINio192GwtTL2qvgxo4cGvStm6Oj5qZa
	e1qklbELR6lecAxTTUP/E6LftDwzx11JUYJe4uqs0OzBGivsq387CLkikQsyWU/ZgP43pahKMFN
	oZPizMgCLvE8/321Iy+SzUkoPJLMxrrDsU6z7soFnUZ9rSjNQ2T+TFTTTrpzFLPsu
X-Gm-Gg: AfdE7cmUYTIPA+5TRfOKg2dNLBOaHvy5Ec3MJWjvkAotm3tN2dH8/qy9Z+OrDEEtXfI
	NFvGluIBVzxIFAAg3uD/iSJqVT56DFOtda2tq4JIQrm9Kup4i+mOnh62WmDd5re6g1ngoXmSKsH
	Vzppsn9ayAOEGYZvj6QkhTCdjNHRYxT9YSDjWojr2LKmxgoFo4yt0KlhDZqv5WW1sOqevsiGVA3
	MhVt0kHb4BuUh4ztTUka9YdtNdJ1SMrHcJa18u11aTS8rZGOkcd79V0wFt6MzvI7fkLbHox7q2S
	9cPUYU87eHIarSeYMvb3S8IxYlhWwGQfEAlvKYEq5ismzto1TTw50M/CymF3eHx8ro8Kmq47CzT
	vjLf7MWmVAOVMDPIDtlok/0AZdfRgNAXohtwC24PJ
X-Received: by 2002:a05:6a00:b93:b0:842:57e8:1bdb with SMTP id d2e1a72fcca58-847c07be445mr9957261b3a.20.1783063847006;
        Fri, 03 Jul 2026 00:30:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:b93:b0:842:57e8:1bdb with SMTP id d2e1a72fcca58-847c07be445mr9957234b3a.20.1783063846551;
        Fri, 03 Jul 2026 00:30:46 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9902efsm2456176b3a.45.2026.07.03.00.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:30:46 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
Date: Fri,  3 Jul 2026 13:00:28 +0530
Message-Id: <20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sefyyAcKI1_zrKiD9HKW8WgIj113WC4_
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a476528 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=AILnUmMEF99VWB6qR_8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: sefyyAcKI1_zrKiD9HKW8WgIj113WC4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX8wFTQcCpAPVR
 xipWM9PsSNX81OLyiOqN/X5HoqtVRccgmR1l0yiISzWUMa/+Pqlr/LWhrXemu+NvEasRxXtZfJW
 u7rB1gBamyLR+ExxQArOn9J4Sc+vha2KxGMcsW7I6A+hIvAJbrlyHi5nU0Mo9lcnrY7AvHG4MTM
 ia2B6n4QQO7Kfc5xMtcyl1pgFZDTi47Lxb5Hc3cRzsdPRXFs1Taa1evQMqphKjo6PhNZEQZRxsr
 YJCbjzr986LLCZ4ia8oPBqsZ4Ev9UKO1XB6yYRS1uEGN+ThuIXdcM+Mzq5fgnmwYSk/kXv89448
 lvqt2Mcyx3NMo9dbqnbEHYESJ5Ske7+vZWGy1WCIJ2sxiEOdOoEhtPt9Rr8l7buVS0J9BVEPKcb
 UOGAxmqHAcaUTMf54niKMEt86Bl15kymG1x3yQtsDTg8R960wfFzKPtwqV4w+nSNX5UmTSG3U+L
 V0bCWXvFeXsZmzNH09Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX297kBJHgHqKt
 VhPUlUgsrmmMIhTnXF3RCXx0wpLoF2NZR616uMxAj/sMVukjrf+POeUtmToPGph+oYfVDJMiGti
 b5v9gnTJLmr7Yxz315orqccAwxNLxJE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069

Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
Eliza has the same pin mux functions as Milos but uses a different
slew rate register layout where the slew rate field is in the same
GPIO config register rather than a separate dedicated register. As a
result, Eliza only has a single reg entry instead of two.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
index 73e84f188591..5cb9addb975f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
@@ -15,12 +15,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,milos-lpass-lpi-pinctrl
+    oneOf:
+      - const: qcom,milos-lpass-lpi-pinctrl
+      - const: qcom,eliza-lpass-lpi-pinctrl
 
   reg:
-    items:
-      - description: LPASS LPI TLMM Control and Status registers
-      - description: LPASS LPI MCC registers
+    minItems: 1
+    maxItems: 2
 
   clocks:
     items:
@@ -74,6 +75,19 @@ $defs:
 allOf:
   - $ref: qcom,lpass-lpi-common.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: qcom,eliza-lpass-lpi-pinctrl
+    then:
+      properties:
+        reg:
+          maxItems: 1
+    else:
+      properties:
+        reg:
+          minItems: 2
+
 required:
   - compatible
   - reg
-- 
2.34.1


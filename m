Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBFA40EBAE
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121738; cv=none; b=ctyPOoB4hzA0/FRxgrO7pPnuIkcxtXZh+lCRgKDu8lBKC9UvvcEXpzriHxxot6Om1hQKAQ1mld42EglF4szbkkHQn5vrCeO9B/WwNqU9z54HPn1kLH3GN9EZQzNrua41PsgUXlYDe1IRYw/dqnuXB5CawNDNJYUG7Jdczk/HEQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121738; c=relaxed/simple;
	bh=cAarEfDJTg9x6THkit0WCQiEr9hmWbYzl7aBt94vLGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W3DbzYlzqqc38nMnYqqMatkSmeGjjQnHWQJ9HsgIGo2uVXHUPOpjs9XQH3sinaY060uykjQ92cLVV//Ec1SaQHV8PL4xXYic3yWFIzeh7HRpw2/QTnQBDHjElLXdVz3xuS7rlk39eMwdk2RVnqyqU/LvcOiC76eAnojp/p7JKDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clQbA6ia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGTBc766; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clQbA6ia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGTBc766"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcrt03766952
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ScxMUAEkJz4
	WlBE1VeN2PJnDHIBmwIiW3kEo3Vr5p00=; b=clQbA6iagff0rjCTkkdeyPgcvEU
	GTBEpbJmrh1Lifx7yj/KYlFevvsIJeMrSd1oRWinDTIk1Dl9/mremX3jn6YtsvGq
	ke9ieovhxYiKLpbPwSyxMOTKlmz9PVUHAyvTDqpICox0AO+yiX/kIlWf51k3Tv0C
	HKsSgEwf+ssqvYD4CvJlxPaJjPzJkM7ZITU2SBfCm6B19So09Jo6/25XErC2BHso
	+d5Yzr1ULgb85wu0NRkQ1yoC1tFLmt0Puqy91XY6MlwnXJHKCPXWNltZ3J7ndmvw
	eECspauHEM9odg4CNOSnTYLwrIiX+r9mF9VFEJL7reUrd1Z6zD1lzYOZAog==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558s3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso27090656d6.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121735; x=1784726535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScxMUAEkJz4WlBE1VeN2PJnDHIBmwIiW3kEo3Vr5p00=;
        b=PGTBc766mtBvUuhkfahBWstf7JTnxsoBk+gaJDliTOqhfOQSwScyKKpDfjZ3fjD/Wm
         v0VNDk7kBs1LSjFeVGBovgHAOwKnK3fFLvIis0Pmoh22HdwsoM5iJC4fC9ymJf2sQi+R
         kKLPvuR5elKrDZ94EUwRARtvEJqwTHJs3FTD6iSK628B19lmNdlyXZq0e9LAP7KoOqL8
         aiujKE/eYY3VJYUm0UyRJEqiIr3mFHZPL1PCHTZRJyd3dSh493ot0Mi41eyF/pOcF+Sz
         KMCuDVlYlup8sMArcumkjGEOxvJI+OuKkdHlrop1yLVYSqZ3gvUq92W4OJvoX18OSmdL
         RoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121735; x=1784726535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScxMUAEkJz4WlBE1VeN2PJnDHIBmwIiW3kEo3Vr5p00=;
        b=IuXOJiPlG8Krt1K9hb6u/7aXcPS0M5SKOQGOimvradRNbPMfaXKIAr1q439gZpvfEt
         8wFLPNKEM3NPvDxa3x+pyQUZvhw1WnhKyzpWk70neZs6PTFX4cx7JOP+IGwP/jydsR/A
         YuSrZ+LZ4DMVXWqTn1UPYEZGXHKm0G06IHdJuEWyhLkDLiXgiErNMv/NUE/lwXIJZCxJ
         +Rt0//Ux5vNRYvU6u/hSJXGcENn0BOPmLxpQdRv0/Y6s0DMR3nokk1K05mDjKUSqQxhE
         KyjkubirLAqLPPtEie+sn28iJC5nSLZ5ltjRVueUHF815UY1nzKo8YMJcY8XX9amdPh9
         X62A==
X-Forwarded-Encrypted: i=1; AHgh+RqUP2PNhYuI1PnAntIoUX8nNgrWdB2BsGizVP5FV+EK/t93CxVuXhthN1kF2pY3ORV7jf8BiZHwWowp@vger.kernel.org
X-Gm-Message-State: AOJu0YyPsHfBe61ZKYLtQDwxUHhiz/bM+MUEyD58alUF3oV8pBgg+M6k
	Z1jz7J/J0hM0HvF6aWkZOQdKGUvFqXR1LyX76sfgBypSURQlzuTmlE2Yfl6Woq0KEeoLhtGd9Au
	AiiDL2ZJSRhFDmpJoq5+smNYvxvWu1tk+MJv6497JVQ059xf2sDpECWDD2sBOSQPA
X-Gm-Gg: AfdE7clKn3JKheMzcH79B5jGshx4fjlqDSH3cI21yO9JVdWmYfL/eGmwDeBJ64/s1wh
	baybwcYcprZhgq1Ugj90YmNfLwQm+UX82sgoauqSSwcRRIGe+LHrFVPg4WWecFgmYetdAKlZllA
	wxMfCtB8quxqKBVEbsNojd1g1K88z/D8YMDT3MnB1u41Zl6cNEM0nMsGKARxyArWW4u1xaAWtsT
	pWdrvM132qWyeYt4kOFulTNCBMJp2nOWcrme3pgpX8FKs4H9YbYsuKTujedOoiK7IMLldjOMklt
	lOagubCDpESJ797AaFOHso8qhBJdZhweMpGLI7Dx+Y1QCZosuJPENSZZeigJtQKzJl4FAspU8lW
	Hl8dDjbX+ztDkRSuEWRy0bmXE2n17rszNWyt2nFEM
X-Received: by 2002:a05:6214:27cf:b0:8de:6bb8:46c with SMTP id 6a1803df08f44-903ff8731a8mr197441156d6.24.1784121732658;
        Wed, 15 Jul 2026 06:22:12 -0700 (PDT)
X-Received: by 2002:a05:6214:27cf:b0:8de:6bb8:46c with SMTP id 6a1803df08f44-903ff8731a8mr197439996d6.24.1784121731333;
        Wed, 15 Jul 2026 06:22:11 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4cd1sm192874866d6.16.2026.07.15.06.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:10 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
Date: Wed, 15 Jul 2026 18:51:49 +0530
Message-Id: <20260715132150.1322663-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
References: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HnnTSbFyN9BJGGarcd5Mp2VC2b1oeCJl
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a578987 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=AILnUmMEF99VWB6qR_8A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX1H1U0C2uhuGf
 JTGIRdP0WwDQjuMXLSe/KmJippr3R0tY9NwBlveXYSuN8lDopfzjLg//v5Y7wAwlljO1cN7VHo3
 XHhLofW9Aa6qr1Q8Yr86d22WG7CT722e9UksOSv/nuNEXH0Dr7gcs26ig/D+3Mruqib295TZ30B
 fSeoBdXu/x2jvGNBrZLZVSFgDAOjk5EHHvkecxG+Wu5gvDkEuFOD1X8aDDdxFDPGsK1J2T4JLT9
 mNibg6c1kO5sC1+vqy2epIUsPl+d2Tqh9XfTr1vG0/4wEJ9GymUuECZX008ZDxRf1/sK9/pob8V
 yfldyp1+eX9MVM+xgsFjPIcuzxR6kPWcGtCEoCp6Vm9gz00yis7J8OqLS43wBEdoe7g0TCiCzTI
 b4xstEPw1/Vsf54gwLqy36CkF9HQ82ej8A05heMlggINWFId4Q4J/Nf8wKyrhfE2RqryU3eLZA9
 b8S1+7HU7hEcfz0yslA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfXza+ks1whWHYc
 RUffAJ6s4KiPOUgd0HdJHQ2lzsZOXOnOqnam1XA7Fw2OuMFSExCfsj6NK4EUhUqK8RDSgRGrlxj
 ORzeV05n5DLi5B4PHlnyhiwtY51BxTM=
X-Proofpoint-ORIG-GUID: HnnTSbFyN9BJGGarcd5Mp2VC2b1oeCJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150132

Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
Eliza has the same pin mux functions as Milos but uses a different
slew rate register layout where the slew rate field is in the same
GPIO config register rather than a separate dedicated register. As a
result, Eliza only has a single reg entry instead of two.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
index 73e84f188591..86c1da0f577c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,milos-lpass-lpi-pinctrl
+    enum:
+      - qcom,eliza-lpass-lpi-pinctrl
+      - qcom,milos-lpass-lpi-pinctrl
 
   reg:
+    minItems: 1
     items:
       - description: LPASS LPI TLMM Control and Status registers
       - description: LPASS LPI MCC registers
@@ -74,6 +77,19 @@ $defs:
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


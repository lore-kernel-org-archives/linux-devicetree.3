Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76F3E9F80
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039095; cv=none; b=AqlH5JBFwKhjxzRnpHwrmg1ki8KsVxcGPY5giMjY+gzSgyks2U+keI3jAEkP73kf7UzVFNnGS5flq4wF54lhPxOCg3kpVA3KC1OPI9klmCcxLYAFogaBE+/cxAfWEvXn7Srrc15iBaRGZSg43yr7NrvIEXmoHmIJHXCa2R4jfRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039095; c=relaxed/simple;
	bh=V1xwU9zkDSIyMoQD8LZk++GaYMrCUStmgPDDStsddwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PmPV4Y8isiWjjGEA6owg7V4h9gvWMCemJyrgeoWqMWuQxU4F5nq/z6DFjG+8KY7Nizpv1D/o6SqTNwhAKZ8Y3dbBb2XT6zyuioLYwdLQwntRAV8VWM1S2X3q+LguszkW0iwtM/WyPU3MeFHuXkNx3gHMlkOE5V2CZ+aqAqkj9jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqJATRwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkuYXwqZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqJATRwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkuYXwqZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318C3NX718617
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OehOIAXSAowGbIjsW+N1EpUBsIAHoo/a+gTVikYDFdk=; b=VqJATRwAxdzF3yDe
	odoh0jmmWacOiTiFNenFwX8Kkq3RBSvAZT06e9zXqVrHcV6FlWe5G4G/0qGJtzaM
	4wj+B4i80CBrm6xWEzFr7cpKwGHsDcJmIhohN0CCFkoqlJUj0QKGsBFFAQVtRFKI
	GTU/utYSh+0bRnyw7YPTobzU0ffE0UZcFt5ZgdQ51k1XgPB/+TBPZH/NZZCICra5
	+roz+1RGjLMkc46SvdcbLATK9FkFrdq27GeJ0WKUYdTVpQVI9FrcRb1lYJlp4kxp
	hjtf41RESL0AUldXEdIn72lo99bnygxh6TvIfdP+lDJtrl6rtXeBCMbfj9u1jCPq
	nUQQwg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsugp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:24:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso4189933b3a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039093; x=1775643893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OehOIAXSAowGbIjsW+N1EpUBsIAHoo/a+gTVikYDFdk=;
        b=hkuYXwqZa7s7OnklwsDVXyC1wbYYljsfvAQCX+Rcs+QJhN7z6UM8/gKz02s4fzZaI7
         FD8fn7UXqZMVd0fGw3TnpDzBmF0IpkvlQyv9JVvYRxn6pX0fu+uLff3TSvztUKNZb6Dn
         c6fmCt5rrWjU/EKGyWJGvYLaluLa8fdngWlPDL6432e1hUgvOnXaVv48WQPmwubWDa5n
         n0gJ8N92hvK5BH0w93qTMBRvfcuoG32xQ8aLIaKI+6+vBvZNcaxJgmeyQeGxBjfBTc/B
         1oY+4kjpwJxsmkyXB7gJ3bw1Y8QDoxIWQop66TXKIOc47JzdtKk1ZZU9vY6tkCU6SYz8
         HR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039093; x=1775643893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OehOIAXSAowGbIjsW+N1EpUBsIAHoo/a+gTVikYDFdk=;
        b=pqhvcKAc/i59Eq3kG3rYvKkVk3Pdbx8mWyBR6ky/rNho0XlefgOIu5DTdjruEjp1Ii
         SzViX8dWx5oKYrn2S6GhHUtU8UO0wKgHxYvsoTIbaQ6wzvbPl3z72VT/ErFkxOev1C8D
         DIH1UdRybSkKocvLRhqxnAe8xtQkTwsu8tcXs4HQqj9b+oULTkyVkWCefilvfhfsk4xl
         o70yBs9npQgg7RLG0Dmm99tOIJfzw8qNt0mAVtPm0X1D7DUodiySbY4B6z4fy4DsdzVQ
         zUxQpYCqPD/V4I0eY9vMUuzjRIT0gUvdPJ3K+HUvn8PdebD9FXA2Uz2sOZi8KZrZEIkM
         JGcw==
X-Forwarded-Encrypted: i=1; AJvYcCXn81GAqqW0VH2qzbNS0RjrVw/gMHpFzidvo4RofQgL+Ha1N4lGN9GFwLMMIqm0Amu6le7YT8ehlUh0@vger.kernel.org
X-Gm-Message-State: AOJu0YyUILXsxQXIWu0t2q+QDHqHXZwTZap/ZccZ1INZDHh++18NL1Yh
	dWwAg1uHqzc2tqnl/vxsMp36OjFa/3VXW9gKd7N2MySpLRW0RA/h9Q/BaX+g0mpFTHMX6oUujBB
	4d5h89UGqU72j6m/kcTPZw+e7I1hgtvb13lU0H8+s8znG+/6Eb2KYDNRdtzWmCacT
X-Gm-Gg: ATEYQzzB3Ny1Ba05/TMR0YzNUP9UV2P+SAOB7rnAgyN2ACUfJYSGX3sMkDqqt7+ReuR
	MHxmIO9zv/qtH+ipQk5sywl45TyOHBhYW0mztyxn7z4sWPgyK4sqGrY/EOSf+tYcoIxjdMEUy1z
	pHqiYN9Jfy4rVJEL6V4V3R67ysTjuhN8jakH+Esrkeh1G6bO4gfF0J95KHtno/8/K1RY4bu0nKU
	REmC0MEB51LriQjGSgMDyRVI1nCyBXyoImd/Joa/OI660luydyi+YOuSdIIjt6vzdQ0224M3Sm9
	THe3WFojQTcaIqoZPp19YUtWm6NY6EIMpzCuVtJk57xwqMuwVjARwE2WEn5cFfJbqHKLiWDm4a8
	EnDKQk01o8gv2EE+bXOTZDDcOa5NoDH5Z9yikXSVs+kqFe3Mm/U+ITywcXTOykpmeq7mf8OHGf+
	FoigSLF66o0M5GqIZ+5sxr
X-Received: by 2002:a05:6a00:3e1b:b0:827:2eff:a29e with SMTP id d2e1a72fcca58-82ce8ac8b47mr3121955b3a.34.1775039092498;
        Wed, 01 Apr 2026 03:24:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e1b:b0:827:2eff:a29e with SMTP id d2e1a72fcca58-82ce8ac8b47mr3121937b3a.34.1775039092043;
        Wed, 01 Apr 2026 03:24:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843bd8bsm13348329b3a.10.2026.04.01.03.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:24:51 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 18:24:38 +0800
Subject: [PATCH v4 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-enable_iris_on_purwa-v4-1-ca784552a3e9@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775039081; l=1967;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=V1xwU9zkDSIyMoQD8LZk++GaYMrCUStmgPDDStsddwk=;
 b=weYSLiClw9bp5DOxXhxNoqiLgoUPSSPwqaPJyYFKqFOSJ6O+B2N4DGzBFq0Wu10y7d0SdeqAR
 kM3REzlcMXkBDtR+PzkNOkhVU2tHthHMliflgXmCj4l7XwF7yz3+JZf
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NCBTYWx0ZWRfX3umo/p7bBLNO
 xmUyiYEUgo46sWH0WktZqrxxM8UZkRUK89hnRk4Tfu0d2VXyLMco3UnEII4pVTLXvOTOqCBXH8c
 URx8a8M7Q3SlvFjzpXVHLqsCVurFQbI6NjMyZ9qYAR814wt31cL2iJoxlrvyJqZ8D/Hb9Ycvx9f
 3ArWq+4wa77qsyPaU2abldjkiye79gRvyuUD8CW2JZEqS100sVaL62bobWh1TDF3TQKNfdh6wtb
 ShJjduzZiyYBQAVs/udrEd/sIvYmZTkkxde8jz4tmYVIEkS1CzjmFGMwAmVaD/kIo3PpmQEvPvS
 cVnugQvq+23fCqwd7NShhh2mBq/f/Bfui3PUoj3JkZqP1PqBxkJ6ko/g6jQpzWvULLD+sq/R2z5
 uJN6yZlXXhI2rwR62cpkZsnsH997ndrITNCMqk9hN55QQMkazCghTPGUWjcD90uUV2+q6H5d3kY
 w6HQzNzeUbJerxvc8EQ==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69ccf275 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZIxFtT3Z7BdGPi6TYWEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: hO1hLYvCD34oIkQSgpWjuVxsnIvQ4t_a
X-Proofpoint-GUID: hO1hLYvCD34oIkQSgpWjuVxsnIvQ4t_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010094

Document the new compatible string "qcom,x1p42100-iris".

The x1p42100 SoC integrates the same IRIS video hardware block as SM8550,
but represents a distinct hardware instance and therefore uses its own
compatible string.

The x1p42100 variant includes an additional Bitstream Engine (BSE) clock
that is not present on SM8550. This clock is described explicitly in the
binding.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b50251ac467ad44a366689260bfc0d..0400ca1bff05dcef6b742c3fbf77e38adca9f280 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,x1p42100-iris
 
   reg:
     maxItems: 1
@@ -41,13 +42,16 @@ properties:
       - const: mmcx
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   clock-names:
+    minItems: 3
     items:
       - const: iface
       - const: core
       - const: vcodec0_core
+      - const: vcodec0_bse
 
   firmware-name:
     maxItems: 1
@@ -115,6 +119,23 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1p42100-iris
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 unevaluatedProperties: false
 

-- 
2.43.0


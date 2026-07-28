Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7303EC6B6
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223575; cv=none; b=IF0u0bvqpKMBA2dCGbJZsjLokYNPFAsPAmTrRgAqzmYMhsZ1qLoeMa7TIUClIlY4cyoBV+YUewF1EYBgEFi/Ui0T70s6iuvtFKk4emMAQwb+0dz6tQFh5hIF4Jhylbjlw2+4Jpv5f71KmJP5m5fklM+FXSpLAcYRZtFR92jTWfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223575; c=relaxed/simple;
	bh=8RtHxJCzH4MTysddG+Rogpz9MuRBfyVhPsf2lx1M9ZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZ3ocJh/zM9owEf4VsjvT5i24A3+5Ck22t/9eUkw+IHyv7k+cBBgpxN7yBRGhnP597nrzhrZCppgUzvfeZcn+FbIjKaErCOC0FjYWS/BNomJP8sZjmPHAUKRJomAhHJwTh6MoNXvrwf4ucHbjU15gn+/pmktVuQcC/6w3L1Rivc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okzunnhs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEQrLpOm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okzunnhs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEQrLpOm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3abJV1527460
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfm3D/RNAypA1Lu8c+OYYqMPKqxXH6myoRjwK+lFEXw=; b=okzunnhs0fLK61Vn
	i/63VoqYbSXaw/D4NdD/wIyh/sQfJBhOPN8UsYiUlDQLzyMA7x8EiCgANQblTrxL
	VnRiDpe/H8etjqTSa0Up5xZvK9tSdOFQq4DrPh7C4adCXQrAOlZx4ee9gp8Th0pQ
	GyFCR1/X6cjTMz8JpQIsAAJNPAoRPyC1q8n9c52r4vJ3pxAQp89+Wr44k393sQmU
	H5MSlFN6EgwdbE6pZ5xuR5PK7jnf5ajE0iCY6i7ZmboJ1ydJ2NwNMO0y9zrbnHSc
	jnusYUZnFhzGdkNbRr8m2zUS/hb/7XuLVHh4HygEpiYepozESzDu1NIaNZE4rBhB
	7YsaOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8b009-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so76716781cf.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785223571; x=1785828371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfm3D/RNAypA1Lu8c+OYYqMPKqxXH6myoRjwK+lFEXw=;
        b=iEQrLpOm3YujxeocOJ3dscHeEZu7RssukS0br2na4MP/+CTrO2yijpN5abfKqo97lj
         OczEC57MGTZP/7Z3hs/nKKkQJgd6kgPTvFubvNgucXwECha8tZYBY/A+EoOpYT0moOP1
         FkQBn7BFKthSHXL9yNB86UmWsND8TmVLCkdtC6E5By1/8cYmXuQWqS4c7E/EsY2EB/sG
         9GsdFC/qSrIUF+cwizghOKWJOSXBC/+4CrMWwnwV+nbQMcIYNjHb2FJ37AdX2hxVdZCO
         FcyTnPbNJpoTA+GvT+HlR1S/t4z+FRlbBn8nJRYeL84rfi98CSIMwRixY0INWzcfWuLL
         pv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223571; x=1785828371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfm3D/RNAypA1Lu8c+OYYqMPKqxXH6myoRjwK+lFEXw=;
        b=oKkSxmaV3UZAjLmlIBXY5SelXSkWysmXsKk1A136pmLnHtOkdvorUXhvFVACi7qLRO
         EHPHgN8PYM6iZdIKDO+Cm7JNHeDYXNKnUA630a+1827s1YsY19vQLAwuTohEPjEGpsXy
         GVXJDmibO2886/+5EHm+iqYtLGypShb/jssrzt3Spxa/Gouzzn1W59DixIxhsQzgNpFE
         +WsEiyeQNAsH4N+6YRO45rkULGjGK4N2BGVUqp+ECS7Sm31HP7ZcvL/WSm0LI/WAZeoF
         z8Bcj1LEBGCkUQ1BoBXhaQKOMtF++yD9tJxJx8VYRcobNATTHKzWpAMxKoyjgjNGj3lA
         NGAg==
X-Forwarded-Encrypted: i=1; AHgh+RqAYSc6k7OwN44/0z3keYwXdvRRNSGbmuxQ8HGyAiqScTljBqKgMQ+LQvLHk/PGs4tiyHJa+yfx8kpl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Quo8tPWudWGqm6eWDiAH6vMQpH2iChwmhJGQ5JG5dce9xNId
	3bCqLhNChL0UAk3NbhX8tOrCDD6DPTJx/xyJk6RU0l0kF9lHU4dh9rHsVnzu1wdke+lUoeT/7KI
	AiBHE4g0w3aleSqflODsxvMo3pbwyTzUC1APnDXX3lYCDgQ+lFHCu/aSSKClZSvMZ
X-Gm-Gg: AR+sD12pgMcsDoVgLmhIMARv/2LJyEMBkukt7qTjfBMcyCBa7gY6RTlrR1Tkc5Hbml2
	qj5Olk9PGL/HDWmxUGvG1aMSKJfMDOe3P2Bda7hO1Y99bgN/l1+v10lkUVuK7hM+tpK9f92rr7K
	UAW1WA7sovTqR/Z982Oqw+UH1Q8dHZbzGpkj2f9ak3tuNa84PPcN995V7JwfuUOrDCRuvHIl86c
	y5eVg7q68ghYlz4lQv29Pg11SMK/9DCrva3NMyV2j2RvP2GJxmWyUd8IducD4Ng3USTgFf+xov8
	UgtKh05LlYZdvmSlkbOyoFipCYe6l1IpWieunYLPQw0/d3y/HsVpUA3PBH2eUuLk/4oaMHaooGL
	/0DTmwnjcsyB4Br3Eba+9oC7M
X-Received: by 2002:a05:622a:110a:b0:51c:b98a:244b with SMTP id d75a77b69052e-529d7147447mr8577811cf.62.1785223571168;
        Tue, 28 Jul 2026 00:26:11 -0700 (PDT)
X-Received: by 2002:a05:622a:110a:b0:51c:b98a:244b with SMTP id d75a77b69052e-529d7147447mr8577551cf.62.1785223570562;
        Tue, 28 Jul 2026 00:26:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm61340805e9.0.2026.07.28.00.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:26:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:25:55 +0200
Subject: [PATCH v4 3/4] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dt-bindings-qcom-soc-naming-v4-3-39ff32071641@oss.qualcomm.com>
References: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
In-Reply-To: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7084;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8RtHxJCzH4MTysddG+Rogpz9MuRBfyVhPsf2lx1M9ZY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqaFmILGVKnBcv2ty1y19WoHmxFRFPCIchWTGV1
 Pebcxiy/zOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamhZiAAKCRDBN2bmhouD
 1+zBD/97DVuB+wZw+0uzF1OV2yWNpQNPZPDOI4+tji5cqr7MrJmqKt1Zh16m4u7Edm5vAaIDZwv
 oZYAFnIK9LOC5jLEVxRUHkHL6kwD2u4prrWmj8djfyCxxPmtYegCQ/M1skoMvleUFj3R4rBXz09
 wSEwYeicFME2aoOshBxYwL5M2fBWE06Y4CTPPLgL1v7a8gRb5DVVkXSfGnPNX+mUC01hodsJ/5j
 npzp1H4fOaLiKMopvVit+QMwV5F1N9fLD+NTvmwJunA3739VyOqLVSyxUCZbGuyeE6b+EYKZTZ+
 DDnnk4OSV+1kG9mrYQ7Go/wLexEFc+EcoQ5xiyZgSZPbOMYoKEpQZrPped3bG57CBxSUzs5fqnE
 PVFgmqa6bMTGqqkc4mvisJ4gHTCu5w9VzDugbnrdCUS7UMhCZBtnz16HyzV/6MH4PKI5p4OmEnY
 j4Wi9tyu7C0pbTTUBfpgd+6Pdi1FVsoWW0UxkmTbE51oPjikaZDzjzBMQ8pX4ebxMc0MZRtaKCW
 1wdWvRr6GMNOm80evTfvw/4awtXhd6stBefmJWDSAEMAvCrXcG2YI0fv4lD4/QKnsMCm1ZV6IDH
 ZQONpcXLUoRJ77maVTVc/TQX2yJsAv4RK3qV5NVJmXA6oPY40AJ0vpwfKTnYon0FRUc2DeJ3pg5
 GKvpFTeaw7O+ikA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX7QhXVbvb7aTP
 f1RJ8nskz2KAcH+LHoy6ZHt3+tqeCItBcrntfhSpXNVf4rtF40Gql5CFILLkNNJnpyJecwbzyGT
 JQDwqoC+/lLzD9bXpbA8X4It1VY24xBKuwbkqGUe0u+4ogs0aaWVA6r65kJuTmQtd5zgai1LWAX
 w4OBBmkztSaWKwolZUGORk+rgBoMS2YpYqK4PBMCZ1aewPyA4F8wz0B0KloyHiX+qa148tTvaH3
 kRY8lyjRsH7zyCaqoimM8IdkkzGIFd98AjTy12/bRoGLTBjUcMoo2Tta7ImLZ4YGWasHoaa9oT1
 bXfTqITcF+TtJTUrO0XwwhMFV7jh4znSvNRlfZOTNi4t8yNJ6vFXArvX92JwbX7caIbM2IKD02z
 3eIjIsBZ4Ja+dvN1cbSgibEn0QEqLxIRNRgbiUdtBaf19DWVl1ZOwAcehzWhefgUw+ZI6OwWpec
 muWHYhtViWRAPJ6cANg==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a685993 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kCvHDawpFxJh7yUt0T8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: LbEO93hVuDNd5RTx6JbXqMzFgjOA3IkA
X-Proofpoint-GUID: LbEO93hVuDNd5RTx6JbXqMzFgjOA3IkA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX7yFxtxvZpFFA
 cCJXBVJi/QypTHIcctaDxATjriTeq+n8s/GFQFPjLbLd5/OJ6HciMdKluSDnARoIvp5M6gsEwGx
 2EbknMpHTE/lvXO8HXVF87yp5tosJfQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280063

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.

Fix this by changing "select:" to "contains:" so every
node, except root nodes, having at least one matching compatible will be
evaluated.

This however will evaluate nodes which have some generic fallbacks (e.g.
syscon), thus the schema for expected compatible should also have
"contains:" (with "anyOf:").

These two above are the only functional changes in this commit and the
rest of the diff is indentation change.  None of the patterns are
changed (neither in "Preferred naming style" group nor in "Legacy
namings"), none of the compatibles are affected.  Basically the second
part of the diff is (simplifying):

 properties:
   compatible:
-    oneOf:
-      ......
+    contains:
+      anyOf:
+        ......

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom-soc.yaml          | 98 ++++++++++++----------
 1 file changed, 52 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 0e921633dca5..04f0e628a349 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -22,59 +22,65 @@ description: |
 
 select:
   properties:
+    # Select all nodes which have SoC-based compatibles, but not the root
+    # "/" node, because its front compatibles do not follow any SoC patterns
+    $nodename:
+      pattern: "[^/]"
     compatible:
-      oneOf:
-        - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+      contains:
+        oneOf:
+          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
 properties:
   compatible:
-    oneOf:
-      # Preferred naming style for compatibles of SoC components:
-      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
-      - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
-      - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
+    contains:
+      anyOf:
+        # Preferred naming style for compatibles of SoC components:
+        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
+        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
+        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
+        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
 
-      # Legacy namings - variations of existing patterns/compatibles are OK,
-      # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - pattern: "^qcom,apss-wdt-[a-z]+$" # Codenames variant
-      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
-      - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,rpm(cc)?-[a-z]+$" # Codenames variant
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - pattern: "^qcom,scm-[a-z]+$" # Codenames variant
-      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
-      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - enum:
-          - qcom,dsi-ctrl-6g-qcm2290
-          - qcom,gpucc-sdm630
-          - qcom,gpucc-sdm660
-          - qcom,lcc-apq8064
-          - qcom,lcc-ipq8064
-          - qcom,lcc-mdm9615
-          - qcom,lcc-msm8960
-          - qcom,lpass-cpu-apq8016
-          - qcom,usb-hs-ipq4019-phy
-          - qcom,usb-hsic-phy-mdm9615
-          - qcom,usb-hsic-phy-msm8974
-          - qcom,usb-ss-ipq4019-phy
-          - qcom,vqmmc-ipq4019-regulator
+        # Legacy namings - variations of existing patterns/compatibles are OK,
+        # but do not add completely new entries to these:
+        - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - pattern: "^qcom,apss-wdt-[a-z]+$" # Codenames variant
+        - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
+        - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,rpm(cc)?-[a-z]+$" # Codenames variant
+        - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - pattern: "^qcom,scm-[a-z]+$" # Codenames variant
+        - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+        - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - enum:
+            - qcom,dsi-ctrl-6g-qcm2290
+            - qcom,gpucc-sdm630
+            - qcom,gpucc-sdm660
+            - qcom,lcc-apq8064
+            - qcom,lcc-ipq8064
+            - qcom,lcc-mdm9615
+            - qcom,lcc-msm8960
+            - qcom,lpass-cpu-apq8016
+            - qcom,usb-hs-ipq4019-phy
+            - qcom,usb-hsic-phy-mdm9615
+            - qcom,usb-hsic-phy-msm8974
+            - qcom,usb-ss-ipq4019-phy
+            - qcom,vqmmc-ipq4019-regulator
 
-      # Legacy compatibles with wild-cards - list cannot grow with new bindings:
-      - enum:
-          - qcom,ipq806x-ahci
-          - qcom,ipq806x-gmac
-          - qcom,ipq806x-nand
-          - qcom,ipq806x-sata-phy
-          - qcom,ipq806x-usb-phy-ss
-          - qcom,ipq806x-usb-phy-hs
+        # Legacy compatibles with wild-cards - list cannot grow with new bindings:
+        - enum:
+            - qcom,ipq806x-ahci
+            - qcom,ipq806x-gmac
+            - qcom,ipq806x-nand
+            - qcom,ipq806x-sata-phy
+            - qcom,ipq806x-usb-phy-ss
+            - qcom,ipq806x-usb-phy-hs
 
 additionalProperties: true

-- 
2.53.0


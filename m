Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB0B48124D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390854; cv=none; b=Xe/vZFltgjaT8SR+rL5Y7xgGGBYpiXXIyUl3FgWMLrJw4fzZDEVzL7tLWy6JyBJYTbYb8YbFhSlfhw2pvNpXuEzIh82MB5gK9+uB0vDcClZsdeRGAGxb3wri9+2fpG3xshlNa5DjFIOUsV2Clvn+bPjv35laTGaVNhW2UmOo6Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390854; c=relaxed/simple;
	bh=Fta+Tz15bh+Fp6unIraecN96k8cXVodoMPMtZjdanRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SWxLmWmRFMS7exJPZIaMhO+i3Yfe3QYUDpz9Mt63/l7VD4yU4kiSl/okKj/Zv/atn4onIRTEa0SWGi1sloxuRh4169MFe3ryTpkuQj2L0MVB1e01Fdzs15Qn0tDkymUbHS1hCrZIYmGPZXVMJmmEIeWaLW7Qm/ct+H6GCf/2sko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNojXurg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZmV0JKL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNojXurg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZmV0JKL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0XiI4157628
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=; b=cNojXurgA9MU+bRR
	Y+drk5sC+6uKxo9U3KWD6nWH5P+ximBn88815WdQl4ilNmVCF3NKpzZsGclrZQmf
	mlpNKGGPlm9a5fLwG412NlnobA0fLhIBYJwym/PPF4XU0hAqGUgINC/NBgGtf1x4
	yjzwJPjrICk/+KyJL2BFMl67XTpuldavuF7731wtbF95D3G7IovZKFguuw/6ms47
	16SgkD5bj3PbgTfgN/GN6WPobhOU/kBjG87wTtLiu38QGLYuQJSPjNLWk3iqIILb
	IofDQ5qAHdBzWjkBo48SG8XepjFaXeVnJVQhl01KKFk3ng1wXlnTt/MYIkS3hNqq
	nCZV6A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f12p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:00:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd753a52bbso327715ad.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390850; x=1789995650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=;
        b=UZmV0JKLIvoJX7/9hLjhQkf6a0AskRPWUcfUxoS1m6NkAIPabkz1B31D94/1EOp0mC
         OyB/NzI03yre7qtGXF+Cl4sbyEOJWte4SSnX1hwWygQ+YNWPp50OcnPRjpj1+14zFGsE
         VzsSsP4fDqd04KmyqyxPc6w+YVaLkHHKA4XqDcemGPnBAPiJuPmKjj6yhNRL9n6veY9+
         58dbJu8+ZS52erOlE+BRrSK9xQJOF+EO9fWyFoVcR10yoOpknRLeiuV+Hv0IlmzaGBJa
         8y0Pcz9y7I+damwOMaVLfu9qDT+bHDB8TQWA7dnb84TPcS2WXj7gFqIIR4txLYD4SmLK
         PbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390850; x=1789995650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=;
        b=mnnVZKUvZlAyZzuqzJpeKJtnI5d0vCRjQmW8WGshtoQA2+TzbjqMn4TKI8ytuMdgea
         tYkKfHgXzpcAtxsw3ano5jv8yHcuWWAlbDEl/Uh75nN6i4mHFuzls5SoSBKUTHxZVRKE
         teNbY1WN5g2YJBUlw5qX8A9tMacaOG1djwOt29M/5UHP6hyj9TODPXSWUy8pkxL6Dm7S
         awmMkujHA2ZhhUmMZVRcpTQyDv+Qiih4T4yoYXoP0OadxxJhxj1THWPcsGaOHNJZJRtD
         0BWRZMJg++cnKlGr8VXNN5lNiBgzHUDWkFltBWaiwNTFUPN2+EdqCo1op6R1C9j01fIm
         KhmA==
X-Forwarded-Encrypted: i=1; AKwUvByK69JjnGA532PTixvJHKIyDZQP1TAZSHwe2+wxHbkpq0QEkaOytOk5qm0IGcKKH2hbYMyOZZi3O46u@vger.kernel.org
X-Gm-Message-State: AFuF++lYqq2jdEXi++6qPia41YIZdsq+tPUkQApsqD9fBkmLsVVTHzt1
	ISYRcN0+IZF5fRc9PfMdOuZZlhuUP/K4aFkZ7IRie9cloJOKQKC56SPMPfm2lwvF99pxcpbINL2
	chNoiRUM8gOG30AvUeBagobK7v4m1AAUiD8+c8fL7wdId0RwCRJ7nzQDOuObF+2eMLnbwahXsne
	w=
X-Gm-Gg: AYBFou2+NVRumYAaSNeXVTI3RU6bffKeAE16zn+j/vS9SNg/3mdDzxprWZv5+9Mxp1o
	X+ykGoYbkuRdC4heg8V2xPLeKBG6Yg9kYXeLuZ5tIbvGGQqSVPPCqy8GOc5U/Un15hX8CVF29PM
	ESfYqP9iJpaRDFMvfKaVXbSkOPnK4WEyX6K4ZEr/9ubZpzY5Qg37k30SbktSREWAuHJu+CBvuTX
	vQM5+HYq6GeGLyQ+7iSVTOeQikQxq/W053045Z4fjzt9xZBTribgOAvHXRhr/CWOc+GcRGmrNzQ
	7RC9wOeFYP8o6G7TUMAciocOQoK38KtDJIj6ZDmPXUHVlQlOzCMadfMI1XNW6wLzuvOGx7ud6of
	CGxcLOcwL4zmWde1KY2vp/LqDA8OuhUe44VHLx/s1PKBbrBYJ1WpSqtiZjpFIEHhJs+pKa+ygss
	k=
X-Received: by 2002:a17:902:eb83:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd6c6fd8admr45494665ad.15.1789390846654;
        Mon, 14 Sep 2026 06:00:46 -0700 (PDT)
X-Received: by 2002:a17:902:eb83:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd6c6fd8admr45491345ad.15.1789390844637;
        Mon, 14 Sep 2026 06:00:44 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:00:44 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:24 +0800
Subject: [PATCH 1/5] dt-bindings: media: venus,common: Extend clocks and
 power domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-1-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=1679;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Fta+Tz15bh+Fp6unIraecN96k8cXVodoMPMtZjdanRk=;
 b=iwSNuOPqbJv6D+SAiDEBHreRUNDZk+Ew/pQIyqqMSmmBcRmRvQFx8uGMijxycCtrhJkTwDgqa
 oygkshC8yPgD3YxXiTvlzNniyUi3PJrp78lXAPC/2S7xtz8gG19epPF
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: rupQlEzTW-rt9w-WYMIEU5y5nNHkS_N0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX+j7RBBNBR9DG
 Ppj+rxvY5/YRh/SXdMe/B7BZYbg1YpnVgrNdpLKdq22ujeENO7wB4HjxlAPxswvzHipUjfpOZUr
 /kXmAMMiGERMx7bmzfjB9rEBOY3XAjM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfXxU/FEUaw9O/x
 BoYdRx3fP5pWR3ZYT3ClfJsksTd9PTWJmhrhXec6hxItVv2a5PWbLvf1N0cMF2I4NHFa94lazP6
 t9DJPSyXuD0GbQadgzL/g6iQuSSlNerGFhk51BqtS/mj7k0nnzCteKvjR0dz1lOLtSmv+gGQzPU
 WhH69c7t0kIpq/XZP3Rump1ZlTnlSJvC1oocAnrrLk/3YAUj8HJKnYPd59QcVaRTLlCEmBCCpJB
 tnPMJzka/YYT7t1RqoFJVsLEbVL6UPVp/+jagmvmIdN0yZ2nI0sBOfH5I4iJx/ZQ9zm0/cK1WbD
 SLNnOx0cXPA/Hgl69fHSzlpV9KtH3IlnTbH54lDkl81H8MbKv+CY35jnYC6Y/Uv1qXJ8hlkIhmv
 r3bdsuP6NB9guS1IAE+5b3w5lQ4aEAqdS+a03t/dYsWtgyH184WyiN5ACnFi9gxJp0tpvQ3zE0Y
 jvV1CNgcaeWsJuP6oXw==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7f002 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t3Xd9w1G4aITJWInbQMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: rupQlEzTW-rt9w-WYMIEU5y5nNHkS_N0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140186

Upcoming SoC platforms require more clocks, power domain entries, and
IOMMU mappings than the current limits allow. Relax the common schema
constraints to accommodate these platforms:

- clocks/clock-names: increase maxItems from 7 to 8
- power-domains/power-domain-names: increase maxItems from 4 to 5
- non-pixel context bank: add minItems and increase iommus maxItems to 3

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 68d5e592a028c5eecde04ce72cd5ae6815ba5c82..795ecca21bd6bd05b5e0dd610c749857d22ad1cb 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 8
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 8
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   '#address-cells':
     const: 1
@@ -64,9 +64,10 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
-        maxItems: 1
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges

-- 
2.43.0


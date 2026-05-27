Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA183EEAD7
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875066; cv=none; b=dZu6fa+ZZIUGUaNti5q3qnaTZG4Z7tWN/zo9escCngi3TqN4JGXHo/B5WX/TnxoyS3PlgFlwuycI2AZvPB17nmIgnJ/ZBjy0QDCOrOsWgi52nmJGEkKJkHv+7KRMpLoKlg6iOLc0lV0RpEcWZBNVT911cd73SW8DGKoRovcz0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875066; c=relaxed/simple;
	bh=gUY06gMwC09fUktf/lr0U7avQcoj6ewxy1bGD9BkDKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewl8MlvCtq+ZlB7TWptQMXAVjpu94x/Qw9cjuYhj0HgEKKUItk98H9B4pIiB9e54iiU3jt5cm6NT6gDKrh+9gXA3Sbzg6h3nYyHwD0gK5+xfsnFOhP41m8OIwRhwI+tP1RYwVNnSUYnNPrgMPkw7hI+46OrDsa3j9IHJEVrtOdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrAFtNC7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHg3Yy0/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrAFtNC7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHg3Yy0/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8n7WM1178516
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZMe7OPUlXr/
	W2ZmTGZCiea7X26onuuKy7xU69UBTmKs=; b=hrAFtNC72oA65oejJ7Ava7eWYkU
	ZNMXpJnu5oVqoYM69i9Sl7kPKEQs6cP+DyZQ1yKDjeM5gs1ZZGhbRPdOvDnKz2Fp
	u3Wfa4MjICGEWzQGUqAL/LmC/oxMZKBV1tRSWgQnsNksKJtc9SdbZpo8FFKm2Q4r
	8rYPvehu2P1b7TDD3qZ86749rjyvKbb6b4W+wZDI/shbrhh+/wHU7Rjs5HMUoQqX
	funYShU1sIbnj7haYTEJPCQfZwmeBPs004NNY0zCFbr2qf05wQOvk46NDQg6usMA
	Vl5u96W9hq8PHLvk8G8shl0CPFD40qvGcL9W3jaHxHgshSraRzTfQv8QTQw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edndnhwk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babbeff9e4so126656115ad.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875063; x=1780479863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMe7OPUlXr/W2ZmTGZCiea7X26onuuKy7xU69UBTmKs=;
        b=aHg3Yy0/g2m5QaaZm9DlR1oyDqeutnY2GN9g2znIgtmRu4BQNxoAiUKnusWxdIA1MB
         itndXnDhomor/+SVACjDSQLiE1BQJe2YuADdaL4qQyHz5iqA0gKipgkhGIeBA/ODoLVv
         gTyV+U2kIT3CZZ9aLRrb+hzdwqkXqN60DNL5zJ3e7T7UZyZsejWARfywZg2YI0Jz5jMm
         F4stItzH0tg8LgGZ/5X90nhPP0Rhiot/bVj2Vti+vMrpaRuJavUH3KExu0wc/8FLh8Kr
         p2FzqXp4y7mb4AuFW9VE2XNutrNv7es9GDwrq/L7+MThB3IWN2sEYuwluxZg+hIy8tTu
         ynxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875063; x=1780479863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZMe7OPUlXr/W2ZmTGZCiea7X26onuuKy7xU69UBTmKs=;
        b=AP1yiOZi+0/CzoX9ES/faCnhckDRGA87T6AP8ore8esRlP9oZhCEGA0HD9BFlJZsKN
         BH8k75zes7u21ToxnFaq/wUFnlWJWq4/WpjGcgq/xsR6snOcQ6PBpHayi6xIUrlOEzqS
         hWDfOgBrR2Vjr2jso9F6hbx9bX8jYMxxE03YShVZDx50YZp42icADVyOGPCpuV0X559v
         lqhE1qyKsYmKv/abwgGl3y6lSTWWyDwjahYIlA2TJCCjTn9esMKLvSLhYRKMtA4kSUyn
         Fn1KVElg/Ne06y1xBx938dOtfWDVZ4Xc29mfYadsFeHLRRBeko13Zw7JuRy1drslY1ev
         kC7A==
X-Forwarded-Encrypted: i=1; AFNElJ9pGO0HWxrbza1aFK0o6nbzQozYZVsbOqEZcQ+7JnHodBn0fC5vXIVc34Ux48S0vNlT9di1JJzksaVu@vger.kernel.org
X-Gm-Message-State: AOJu0YwAYBhaTxns3wsjgmnKDlOQO5x1I+4wrBJvlYBwzduwtAWqHjXe
	NRJRz80V2vWGVJu/ddHqDF7PU8jnQcDSJxj38EshL/GBEKrhcfT4oSxX6nra/xBX4v+gYM1kiR8
	pkV365IJ9jUAvQLHBV6edyjAtAlULG7kOM2ta96tzPJi2BIDiOWfsNZhANOXjzARG
X-Gm-Gg: Acq92OGSxqrkNGkfKHlM8A/aj4cId3AYybiLBuwvRrM6z64ESVYOyqbBDRW1GQiZfko
	+2Xeb4OxGX25sNyUcqbC/kxPzSxOWOV3cbJr3jKmGuP1BYrsnRDHqGm0Xu7kJHG2rmZvR+s2cKg
	Zmo3YkUFHVIxGI/fNxP2/x70DFyZR8pTpPc2ZAxK821qZfkDYmkBNnvjCHxH5Sq1JiJw1n03uOA
	HpG1TxRwPBsqbq0QC37ICyWqiXKjJ+jv3QkqqSdwE5/8B8s/ZmU081/aR+XVIaCLauuKdK1nm1S
	UaDEMEynVCXMna8FHnlyTXkW8tAsdF4FpVO9csQbfNWjmdDEr8becOpVYOXddo46ayUL487k0KZ
	e6z0SlsYOFrHfblvyCyT7tsLVxV1gF9haBQQt9iNl3TrDn1L5
X-Received: by 2002:a17:903:1a84:b0:2b2:4fc1:f653 with SMTP id d9443c01a7336-2beb07930c8mr188305855ad.3.1779875062796;
        Wed, 27 May 2026 02:44:22 -0700 (PDT)
X-Received: by 2002:a17:903:1a84:b0:2b2:4fc1:f653 with SMTP id d9443c01a7336-2beb07930c8mr188305555ad.3.1779875062190;
        Wed, 27 May 2026 02:44:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 10/24] arm64: dts: qcom: sm8350: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:15 +0530
Message-ID: <20260527094333.2311731-11-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PpSjqQM3 c=1 sm=1 tr=0 ts=6a16bcf7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=I9_6g77LLF1zyLlhHlMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: NkE5X3edWmhOXJ8W8-tKnsaOQ8pVl_nU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX0Pv1oZ88WQRg
 vIX5fH234VmJPMnx5Zo1NuNM453CiVvbzgPrvJjVVJc03KplFMjZZYeV85PHjV8MKfhbL01I2dc
 KxjGbJwUG9sQQ1uE28tVg0MR7MOxq1jpm8VqgmKE/eazCC3slZ4g8h+L9mpv9dAYZmZT3OnmTxw
 WoeQ51e1mssCsfVsr9eAdwuci6W6+n/sICfwazpbiUHnxIf0lW6NJ0J0OxUL1wM4ZJkRXO6xNQF
 EXu8yBCfYyvS7RI/0GYh7GJdKjPMY8Kia5wQyOgPwyl2AdppDk+uyxPwqrwlw2sd0msXlllvzyu
 kGCoakOY+xeAp1X5IavsI+75qYgDm7g9yqugToYF/29bbArI8GVi5OO/hXy5lHF8Vk4dQfcy0+R
 ER+/yaASP3h4ztlA/HUmX8hD6s6AjMn2If/l4tWGYHLWjfFnh8c2OAok9bP+0f15DKUuwEdN8LK
 lOF0utbjUYZ3Xg8lVIA==
X-Proofpoint-GUID: NkE5X3edWmhOXJ8W8-tKnsaOQ8pVl_nU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sm8350 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..ca235ce899c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3174,7 +3174,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8350-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,   <55 306 4>,
 					  <59 312 3>, <62 374 2>,  <64 434 2>,   <66 438 3>,
 					  <69 86 1>,  <70 520 54>, <124 609 31>, <155 63 1>,
-- 
2.53.0


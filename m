Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6B3D6CB4
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658088; cv=none; b=JT0mlbyodARUNMGznZAXqXSe1e7bbjMkXgBwV1NeOmI7TjxNjj9p9EoTLLHHQmbK8Aqp8LCCwgAg/QnrKwJ1Wjgr02gEKcYTkc6NFeHI8G1fIZ0FpWvUC1K01wdp+eKrxc+pGpgqUQarA/3+ANI5LXRWl5/BFZScff7S4Wk0nIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658088; c=relaxed/simple;
	bh=Pferc+ZEMwLRTtESKCijkeUWu0UTlJbwY7sFQbqf3e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MobGST4fxYNHX7BGA/ZSmINr+UZ+taNMMGA8rhpflLizez6ykRFdmt1SES8heo9Y5Y+Qhgw13e/j59DGs9wFfUJ8N9IK+WWLuomXYd1VGSi7HOhTIDxDm2V6WcF3IqLTg+S4pURdxvIF3/9kcAQkeBQ8lOHvtMvDjKHOyRd4FoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZ2qjVW3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WL3craRl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ2qjVW3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WL3craRl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p8a1978133
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQL6KOptQ1Zbzs6vUVgPkwvTMBUI/KGMh/4OxtWl9t8=; b=KZ2qjVW300F2pugW
	Wym7u8D5A/06U9FCNhq48qAIemRewtXmuXZhnYEriTq5eyY0UBOgfGNVIJhzeLdI
	4+Y0KW8Oz9pq1vNUvNI2KreWKuo8EsIE0PgkTwFQOHJof2RHMsYcenOQs1PFaTck
	PWUZKWJHkm0sGxNjpV7IPpMrrgmjnDTuMTcTTbimfn0vMsHsQvdU7AjrJGhcjmkV
	tTffW7m1m/FHWfb9GaH5t7b1pk3oTgv+arDqYh9eWx/dar+tEx/JV8RwENPwVKmm
	YwPEtoGBFdrwMeuyDg/pa8mFbXeIlegh8XNrMTUvpNCUomMPTD2baMzKTV6R9DV9
	eROmOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9u69u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:41:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e575a50bcso49826291cf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778658085; x=1779262885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQL6KOptQ1Zbzs6vUVgPkwvTMBUI/KGMh/4OxtWl9t8=;
        b=WL3craRl4MabSrmXeeYa3vSM39Cd7pV11Yuxltv4MBwQWnWnuaXgu0KLulUbwHQFFk
         0dD1SioARNUwh2rd7dDzYB/8Yw6nzLtwEL2JJvnNgb7znEp5oM/TYTV5DQ0Sn8GwGEXL
         WV5MMJMlHdLIaCrPyrENovXLfJCGiQQVGXXhIXUahtnySN+rjbsTDeNZ0wOVp7dXM0qR
         2Y/blsclmjyBtLMwpd+/qwuTobXWzzk954N/onVnBFV98OTAp8p00vOL7HHpCWXJ2bSX
         Y/UfcJEE40fP7JIAlR4y2AVi1o6piKya6hdF4Zc5vyANDUpnk8jOwKJBYsgfayNuboNH
         q3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658085; x=1779262885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mQL6KOptQ1Zbzs6vUVgPkwvTMBUI/KGMh/4OxtWl9t8=;
        b=mCMhVmebZww3yT9VEONne5rvgEJArJjEUGOVQr7gqv0xWQLpGKRXj/kjKV75FCVIi9
         IZ/7QK+NySzqDy6Lz6SjDHG0t+j5fL8OJ1fv6JO5cARdtANBbYF8oJQFtR0UvyGcchf4
         Yq/5gyUSPuKQD+/oOlpR/YAoKkRgiqcU4ZZbmjB7Dys8FdeVFIoPDh52bzOfP1x+fwbO
         /hNSdqzKWkSSsV0CWp8/NMaBVhhz2EpEl7FgBJER7LhY6Q/tpw3jvuFVeczX8tq7qRNL
         QClw6TpnywuELi/H9TBHUG8ldDL4/zp6o4LK4qJ2+JrOCzhceF+PAGUhciKKHGWXQvAF
         vdWw==
X-Forwarded-Encrypted: i=1; AFNElJ9EfTPZVevwppPiuDqoT3MN6JbUtofDJeUPYm3pYdrPbhiuNZBPUhYhstvR/Mu0nsAfXx46X9/9ekOH@vger.kernel.org
X-Gm-Message-State: AOJu0YzIh5P4lyTrNiOmq9h8oVuushWcZBLLXxSOHTJx/PIjlsyUwuh3
	GAALyE1mpmHpkZbpiVUx5p1y2ImzTORhF/Zy3mcmJOWQ26j2Fzo4KzfF+Xd+oDn+pv6bFIFWebh
	zhVpBIXbkVkH4fl3/P+54Wh5fOxIZh9xJkzHIlqq1IomenWOVxhdUxbPX0JLLNxAz
X-Gm-Gg: Acq92OFN/BbiXOTt765eL18MdkyYLmJrB7UD2ChSj+xVLTKUY3SSB/Y5K17dC02ReUC
	Ny/XGNTfUZHifDhYuehpCpojeUfpsSIXyXyuIPnfmHDn6gyF79K53/h+CMYIqgEWNr152X7l8y6
	MY26UNciIaV/ruxaDKU+ZjtP7XoixgQbD3W8viQGrp7V+yPoPpvvhSl2KX1yMLLYsIVqQCoVjYP
	IaAPfMPNjJyJLbpbNbEOZs1p1ijmnhZ7YMjFfibZWUr/HTwAcNmNF2Emq3NSf8cJP1yyngY1+Ah
	H3SlWO4JcTOTHvi6x/iLEYdWorOcXM+uAR8f212YzOUr+aCP/5EIBkCP6ajFWnepWbK+qX79JrU
	IbOJg1VxnUmD1jSEoiNQff7beAME0Pw==
X-Received: by 2002:ac8:7f0a:0:b0:50f:ae60:25ab with SMTP id d75a77b69052e-5162fe3d0d4mr26373641cf.12.1778658084921;
        Wed, 13 May 2026 00:41:24 -0700 (PDT)
X-Received: by 2002:ac8:7f0a:0:b0:50f:ae60:25ab with SMTP id d75a77b69052e-5162fe3d0d4mr26373241cf.12.1778658084381;
        Wed, 13 May 2026 00:41:24 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce05f41csm48999335e9.5.2026.05.13.00.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:41:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:41:07 +0300
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom,eliza-tlmm: Merge QUP1_SE4
 lane functions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-1-1babc6118829@oss.qualcomm.com>
References: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1688;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pferc+ZEMwLRTtESKCijkeUWu0UTlJbwY7sFQbqf3e0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBCse5bUxO0y47PsAfFr4oxJD8AUWbbS4cw6Zq
 CxkaeMYbAKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagQrHgAKCRAbX0TJAJUV
 Vkl+EACrAZXdTCyAh2bMijOya42VNK9eg76WtcwU3sP4mOm4rofiJ9XoCb0dIqKaTMYpJJdo5o5
 QoO6HbsNsv2xTYAFL1xtOXcQIU0Pdvq0SU/hpWq0N5C/UPlhmn+0m+Zs6xYMxYsvm17KNLaPqJT
 yqPO6Nd2x5guaXWipdfn3N8qJAME0lbJ9T+6ZEh9MVcA2WRhIfCe4p6ML2HpSUwYh9WNZwcZ6mq
 L9vBy7jjZFGcIVMdQP7exn3iJbikGt+ZEEY8/iJS7py4bj1oW2tADIkcpZRtJexbWGQjEz0v0ED
 hi1gIhRyBmcERvD9DJ40iA7S8pt9T2AEk3JwPPwljkAoPBHf9FL0qfoWHDtTn60j82QwIEEaw6L
 V81YV6gNUm59EoWoQKZr4GuDPq0Wj3t01Ywnq/JOcqCafS2gK4iuHicf43qTv7dBzjArAyGZmDr
 IBOl774Cklz8ju12JtGlskdpyTJtB/s3SZpiJOHX5koOar0ToA6T0CVY/kH+Wa2IbvBsljld1WV
 PoH8UR2kwtbLhCCJaB+3Ox21DGrqE8MUL8sj6A2r7VPPRGNxQjxeoVDrrqIGP3lK5veqe7Bn9lH
 2YgeYXNNj1hz25e7S81sVZd/oM8g9IrOPBmwEZqZxsxFr5Zyw9/eRyI0snEcMJf6zumwd7/Kh6n
 qOpbZ3T1l1B40ew==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NyBTYWx0ZWRfX8kSqDjIeU6ye
 HX8Chp9JGIIEUDmax/2tR5UIFoh052hbwU5x/v97HTX5evuh+b335nTCHcJS6AVpC8NV7ZjHvjZ
 eCho6Tq+09A8XGeSGWi88bznP0W1PLUFz3La0fWWlFGevDDaocKHuegKIKVfIPgc1QYoeeLkM2j
 n3UCvKmokkBXGZeQ5vxH2WW1FsvGliBc8Z9YOrHlVR6UvI0rIQTBu+5zquaoaGcwGt+MborSwCv
 5n9f2d3aZusLsTS13dru8csMvcKg5rme58VyaeL72FqCX4Q3L5plQa5S1wt8nHOato9SP1tW5sq
 xSaTTOnccj4+bCn5gNXqn0rxgYP6RFjHmufsllKlgT2Za84kUiueoq47S0x8jquRNLa2Lz4BjQx
 +v0TBrevX6BAJGGrhxVoxhCFwhvx4NWeFcus4aR6m46SqeOcwNI7rDXm651szdHsLMm0M15j0sA
 O/8JNUysriwrMnk2EKQ==
X-Proofpoint-GUID: mufW6qXx8i8S0jcgZegENJxxu-nfSK9v
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a042b25 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IQVVlPdFdwmH0zWU5b8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: mufW6qXx8i8S0jcgZegENJxxu-nfSK9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130077

QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs. The
previous split added one function name per lane. Since these are usually
configured in pairs in devicetree, it makes more sense to have them
grouped.

So replace the per-lane names with names for the two selectable pairs,
qup1_se4_01 and qup1_se4_23.

Fixes: 1bd5c56253c5 ("dt-bindings: pinctrl: qcom,eliza-tlmm: Split QUP1_SE4 lanes")
Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
index fa0177529277..aaaeca8e7bb7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
@@ -88,8 +88,8 @@ $defs:
                 qlink_little_request, qlink_wmss, qspi0, qspi_clk,
                 qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se2_l2_mira,
                 qup1_se2_l2_mirb, qup1_se2_l3_mira, qup1_se2_l3_mirb,
-                qup1_se3, qup1_se4_l0, qup1_se4_l1, qup1_se4_l2,
-                qup1_se4_l3, qup1_se5, qup1_se6, qup1_se6_l1_mira,
+                qup1_se3, qup1_se4_01, qup1_se4_23,
+                qup1_se5, qup1_se6, qup1_se6_l1_mira,
                 qup1_se6_l1_mirb, qup1_se6_l3_mira, qup1_se6_l3_mirb,
                 qup1_se7, qup1_se7_l0_mira, qup1_se7_l0_mirb,
                 qup1_se7_l1_mira, qup1_se7_l1_mirb, qup2_se0, qup2_se1,

-- 
2.54.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09F2347503
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 13:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775396397; cv=none; b=Nw3knfXUj6eY4fjOCaDjG/RaW+MD3ccxwr+Vz7BMxi10ExlYj7VYPN+l7QjJtnSFmwlfFWa2SiEDWz+yEwBweToZsbChQIyfQJDVFmuuS8BE6xld9ldJZuRqvMZWVeO1Ct9nipP2ROD7WNKbLVuTsXedjPshR9VntfODo0E/3oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775396397; c=relaxed/simple;
	bh=ez7OdBsh50ggjbiMvkHdQEk1EaD65LuNH/nuHHygxYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OVf/tjLUrfh4O4dIDeopJgqokk1X9gtMOrkmuCu8smuYSk0jl5XL0e0iSLmrIDprdVitkzT1AB2wANhkUr+HfFc8eIYcj2r7W/sWNxAp/P226cvtX4rOeLkniUTgl6KB8albTOGi/7jYgfUMbVqxXali7oaXsQqksQ/UyfuQD5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qf6NjCwx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWaMHomL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qf6NjCwx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWaMHomL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6357CX1O3419416
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 13:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K73jc9LR5Yh3EX+AirAoqNyrHDV6acf9Kne4crdINkw=; b=Qf6NjCwxS6jdQWsK
	/C31eLIgDKn8NdOpaX5vj428swpusmEu1JoA02fMphXVwJhuhxqs/xR+e0kPWy0V
	uXjIaStJZbZVsSUUj3QtZXy7UZH/siuh31UjOSvPRd1ykAomkywVG/Xq/iL5csbK
	/wedlYfyNWtxQHCqw8FUfNCj65Ru4da2xFwQv7xWsqAkcSgxmQjcLd4mtI33lS1/
	XR5SfwNRwPsYdNgwY7PV5UQ2Z7kXQe0fvFV7SG54Ueuti9oNIyMv9WvNCONep2OE
	535VehMG/7JsyVV+31lFKhFlbnqxDRlL2VpXDTNv+O82ns4y3HUOqv5dVcRluR2x
	xUk+4g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5tnk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 13:39:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so156303531cf.0
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 06:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775396394; x=1776001194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K73jc9LR5Yh3EX+AirAoqNyrHDV6acf9Kne4crdINkw=;
        b=IWaMHomLIqYy1/rA3FHYAj7vxTrh4IedXTUuNV8mJ4oeM5/BcRgBkzMO3k+9mdPkk4
         /DSagMi3cc0xV1Ycp4IufmzXGoTKp8TyskKgZPOWNzOVO687nzJ/yB7Y6YaUcoCZXDdU
         qiHS3Osa3pqNt6rt+1VaxEEOMJcIW0cMbBtuT80hsj7K8A6Ut/czy6oXhFMWM/cyg5XD
         6ztvpR+TnzU74YV3M9nPsl81ealFu/SE8Jx9oqo8nfNBtV2rYgUTYPGHiuHIRTW8tbkN
         q/90n8a40wPOU8TD7n7AnXqVso6BDQFnnxB//iYgolkZWfhzSOATNUaey8F9800j9tMW
         AvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775396394; x=1776001194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K73jc9LR5Yh3EX+AirAoqNyrHDV6acf9Kne4crdINkw=;
        b=cw1nsA+TSCxXIx+fzgmTcvktcMSynS2HZsNuDDeK8lUGAgVLyTIxp+PYED6ID1/aVP
         xubP4vQE+GJzwptgq1VGoSrrOP6O9MC4GD5qbOonS2zfYVNArAFLvio1QIAN2ieHzl7l
         fSstxJaq4n9as41Qoq411tPzx71jGNAMKr8e9tIXEMaZe3+8ijqDXXWXwZFnpJ/1DYoF
         LSnUuHuprRfyT2e9Wz8miCo4LifIHCOcPHaXw6RlAywEeNDDTt2/Y6yeT8DA6ZnY5EeD
         M29xweBRPe8yN3DvTsTrLRhnLzXWtvACA+/ClQ815O8hmygTXrGFrgjoPc0QZm1AcWy9
         OxDw==
X-Forwarded-Encrypted: i=1; AJvYcCW70cc8XutuuNBzR3ZPzzL993HofhOd++gHuobEwKWBtA2ab+01BZbqA+0If6mtfcqczvDBkewfPune@vger.kernel.org
X-Gm-Message-State: AOJu0YxIDlTyTF81H5TL+pEx1V46eoAxBgQOToc0+3za4lC7o0n8sfe+
	ZBjZt7wKb5SccPTQBNFA4IX8P0A9zZBel0MCfeCSuCkoq9D7ue1KeITdEXESsR0dh5tKAixS52h
	pNIv5Ytra8KEPlx0H4C+771UCrwLdcJR9B8O4LwRseSR5eHxK2gqV2ibQ/9DPkKqP
X-Gm-Gg: AeBDieuyhQqI21ExK6ZAAVnGJ9UtuEWRGR6ER+TO9OiLeuXmgKLzIJjdY37s9TrmUpt
	ZZD9VjYN7xWtw7IrApU5kLkAAY/HMFBpGEMAPSmvfH7lD89j/SKymJyeMUbWdUCdzuwdCHC64KB
	CxGVQmLT034wi50VcLF3hu2enh1PmDQiqyOs6Tf82Z1MwayBnezP0o4Oghz7CVpaz8zJPUZMN6n
	hdpnStUPtWYuH8oE35yuBSt032lw92dAsoWM5CPX2w+TBngsolfh0Y0+h/DVHy6UzXStLVbgcJS
	V0RuwmQc1j4fr1+u2dL1ZEO+DabrtlvgiAszc8SGPWgQq4r5RScwEP4Yh3OQtZdQY1ernTIr9PY
	EUHDZCAzz29H0BHaFEvtHg4NDkNB4QHzy35sp8lB7XDC3
X-Received: by 2002:a05:622a:11c4:b0:50b:1932:c9e with SMTP id d75a77b69052e-50d62a80cc6mr156878401cf.39.1775396394428;
        Sun, 05 Apr 2026 06:39:54 -0700 (PDT)
X-Received: by 2002:a05:622a:11c4:b0:50b:1932:c9e with SMTP id d75a77b69052e-50d62a80cc6mr156877941cf.39.1775396393963;
        Sun, 05 Apr 2026 06:39:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f1esm32188774f8f.2.2026.04.05.06.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:39:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 15:39:28 +0200
Subject: [PATCH v2 1/5] arm64: dts: qcom: glymur: Fix USB simple_bus_reg
 warning
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-w-1-fixes-v2-1-1f2c7b74a93f@oss.qualcomm.com>
References: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=998;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ez7OdBsh50ggjbiMvkHdQEk1EaD65LuNH/nuHHygxYQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0mYfKrA3zFLOk65MeHkYJnUim205RpytQkAtM
 toEUlkXw1WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJmHwAKCRDBN2bmhouD
 18NbD/oC2m8QsTcxYTWlQHKnnTjnImPmK1wF8CiPMklTbXW8f61tDAzf6WEtU6vAjY6T03ks3fF
 blCUDb6KXp9CB6cYmNFc8UjDRwxzmao4EnLK06LhABx6TrrT8DOMYLtXs/sU4F2GjUYVTTN6CyG
 STIaERRARQaEa0TJFoHM3bGxlmZvl9byMFjfGGmmDD7GDuuKL0SjfiHdQlU1xAD12ABhvn/1SXl
 YUQUIV8/HMOC9KDycaDUUGEMqemsUa9l4Nt7bGlqwEdGxcxWKH0hVSnd/k0yE4VNQS4ZqdOg105
 BPYW/RVHtG5M08xrHewttJ1p7tYMeK/LR0IZ7gMnAqRanZRoS6tkpyS9w+OBvMtmDkkSoqs4xEN
 wjAdcjbLABH86B+D83SdbVfJDKVDQO1BoVzW3eqn2/NBg3EEtotQyKBYx1kdaKBwt5msX0FSn75
 F5aON/svP1d/weefngO/4C9UNCTptwKI8uqAxfDeAz/11Q2Rb8Q0wkItREtvGjc3EWhi2O5qted
 HjuSowB3Lval/hi2oQvdxPlPvBf7W9Oc/WC3lF80vaGsuQB/obpKZJNMy+4ErH8qRg4eNLF9tZS
 hAMpmqSN+YeV10w78bKDO34jdkqT0EaqGc59MxcbC8FTNMJRcAUeKu+G//edLYhRjz3NAcLPj0a
 eWuhKMNsM3fzlTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE0MCBTYWx0ZWRfXzefCZXijhMeJ
 OYEggWX4ZQkIoQN0t9ARzDrhIWuPu5imKRVBMBUQQuIocq3Gdcw1FHqJ0lqP1utcpmdDODxloR7
 Dr74uJCB5vvoDCbZGY4QLiUI0zBVGXYCysEpctaHzptGI5ohkryc20ibPAyyJQhM/xN6uDp2LXf
 U7WShctdl+547mzG9z8V3ZIJmMMehdKxp8xfDTnNypZSOPKYOrUPxcKLoiUYzP8GCJHngIsDIw/
 yPvGyuBR+IgqNEzNc94OCFIHIrwEg7DbV1Ya1XEXXyT3FIUYsBLr02WFRQnUyGpIocowe1pTeg4
 1TvR6KwJOyUyd3YKPoFxSdEna55u3wo5v85M7yLGi9uQh7eQQpkuBlyY53PTReZwaOfuiho8Q79
 X9fBZnzd/RRIgqEbRLgIvKcNOzfjIJPX4BTcER7ew0DAxM+RV7I75xftlPB+opKNpq/N+pvPcQU
 IoR2xBdmaaCvdnkJU7A==
X-Proofpoint-ORIG-GUID: GBaQ1iHz1uXzfTmx5tczJQJajasy6nil
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d2662b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9adxwUlGMSoq6VjUhU8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: GBaQ1iHz1uXzfTmx5tczJQJajasy6nil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050140

Correct the unit address of USB node in Qualcomm Glymur SoC DTSI to fix
W=1 DTC warning:

  glymur.dtsi:4027.23-4093.5: Warning (simple_bus_reg): /soc@0/usb@a2f8800: simple-bus unit address format error, expected "a200000"

Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..3389103408b6 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4024,7 +4024,7 @@ usb_2_dwc3_ss: endpoint {
 			};
 		};
 
-		usb_hs: usb@a2f8800 {
+		usb_hs: usb@a200000 {
 			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
 			reg = <0x0 0x0a200000 0x0 0xfc100>;
 

-- 
2.51.0


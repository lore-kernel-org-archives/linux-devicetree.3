Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75BE347FEC
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775396404; cv=none; b=iiHRo22cVwi+l9zC+7hQQtzWbrXvv06CKnsgccRM05OEHKKYKiWxS/Lb3U3VELfBEIFjpjBZmdPg3qxadLZqmnV4cRrcTL5L5pPMTT5i3KWUpMlYR0hOODgRdmasMOrc5s7MFcl3kejf975U3BtBY4o3CnI26VjQre+6LIZp/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775396404; c=relaxed/simple;
	bh=0qHBlz96dMbZijLiRJ25M/gNyYB4jhLkJMDw+0SA5mM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o5kSRzqtcy2wSyRhxNmTV0goPhe6ip6IjHrxDd3kiFm1ktjHxKk1ksGj1R8jCv1s+srHnpWQ7asvQkCOSy6rntm73K6F0sW0LbC84SAUO1iqt5NqUZwNalxl2/EvDrA2N7V7183ZLsOMkkUtbAnRbMiBrNlfh09Pmv4UpkYLlwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bvuWGldL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRy19z3n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvuWGldL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRy19z3n"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634K0shV1604732
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 13:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxAgkDqM2czv4JuAy8kFYi4isBej1z+gshkQv9GVwJA=; b=bvuWGldL9VHDyibm
	HjFAZllLb8yw2liyHiDlycyrJb6SXivWmKO+JaCLyL6ouMWEJ/vMSzTbX+DR0OBv
	vqB6ucf1/Hq8IqjS0zvoW74FBROUhIOvuTnBJEFROwjrP/ECDsbc0rw9TuowQNNo
	foXZ4ca3jH1OdFsKSz4W5TYLgSEwul5g1Ic/1LS0MES1MQsqAVCXY0YNaWQeq+NM
	7Ui5ekujoNrUN2JYPssUAhLMiTaLDYupiT3JoDHkrt7uaBZ5/pBgya5kmxnJk1X9
	P5TFGOLn3b5QY0krlMQeVVdflj8C7ehJ3I6Q0BZogJ0qW1l8W6hBJSEmykNgomdA
	ezGShw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd2fdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 13:40:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b323c43fdso71027341cf.2
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 06:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775396401; x=1776001201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxAgkDqM2czv4JuAy8kFYi4isBej1z+gshkQv9GVwJA=;
        b=SRy19z3nUS+wipOTxVFEG0FG4vaAeHi+CnOgo3N064AtNT3xQcoMs1n5CcbqBRfHo1
         lbyYxtLJ35oUFXRGLyQakq9eH68Pl1VpaGDa3hupp41Meth4tM8WVKJpa46K4cIJGmvp
         R1qMec8Ln7FdjKzWJvHo1xLHpHkMCdZsFvDRCWoqbGb1C4+/tYf4sZ1D3cFCcVD5eSxF
         M9bZ+rmgXkFiUh545s7KEw5RH2AlJq+YClR/x4EUy/tYgbkylekiWaAE0ahaYqIvA1Fr
         2zjT0ZRrswf/+4omtyBbJw71B2m3yHucCZZhy1uqhDOYnorCJPCsI2MgHZ2qttfc1Mjn
         ccHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775396401; x=1776001201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PxAgkDqM2czv4JuAy8kFYi4isBej1z+gshkQv9GVwJA=;
        b=Be5harwb87fm5T2VTbTG5MN0jR2+dWh+OhicjdJx0g3KRLTovLonOQspy00n2YNxDh
         ItJ/49IYtbCNVz5kxIQMUs03mGGKD9GQIgW10s+s3t/t8K9RNz2oeJ/PR0cXdoWx7aCY
         XnUXL7XIaTP2LCsYR5j/LT6DUjz/kSP7/wgCljzX2N2eOpXUJnKY2VibWRfFqiMMGZl4
         XmnqUl0odWTklENI1bHParxOnX6acx8VLfCCbx0Y2VstSlKSdHDhbS16iIjOE7uLetIp
         fv4BnNmVcN57dZhepjLY0TfQMbFnF3C0M5FCXg8+s4opm2KtnbJJw5+ci7X301Srk8F/
         t2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXc+OxhSOsipU1AIHnBOIueZiwWMf65i8A1wsKtOzeO4knsJr+DP2WSzqLueXr7IKPlPx31x3BlO+YQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwpgM/y5pqbkeFOz0FLBLMmz54wFBBrRGGa/a/nuaV0U/Bxvo8O
	+SRPnBYciown63Id/WFDm4RPHc2AlxYx71Rb2qcKlZOnAZxi0bhYVzIbqPWJAln1OTu4KhhzUYR
	91Mc7Wn0XKDFMGJYS6Nj0vg2031I8Jd+7Q9LXF4wZ0A8rlw//utGt0t0nKagp756+
X-Gm-Gg: AeBDietugZoBGx8C74Nmj88SQYtJ2u7ARRn/URyeKFReLfuuPFuA8XrwEz59/85HtF7
	hXUrq/lIHnpT/2zVi/hALifGKl2Gc30kuU0u0v7QGcHDSgDIn68Ulgfw7E4kYhcOO8fqDbrxvwu
	x3JuoL2X32NxoSBMk/K+psauD3uLjtzbLp+vDTjd06FNceBADYcSEEogseNhRgelyP45dsTf/dW
	qoptpjESjLfW0+lDbIYH2XmAEnl+Xgb/EdmNqu94fhEJldZpOLSAm2wTyvPHFpDNCGYz7qIiGFe
	gNCW1IfBHRWNpiu6VSczJOpj9nwr65aH+zdD+4+OHPc25YVx27/nCLAGof/m9oCPDX//GxUCvR5
	zEki2oQc7PkLlK1ETH4NovdY37L4+I3S9Ea1QhXljCa4q
X-Received: by 2002:ac8:7c47:0:b0:50d:7504:b719 with SMTP id d75a77b69052e-50d7504bb24mr91461171cf.52.1775396401143;
        Sun, 05 Apr 2026 06:40:01 -0700 (PDT)
X-Received: by 2002:ac8:7c47:0:b0:50d:7504:b719 with SMTP id d75a77b69052e-50d7504bb24mr91460611cf.52.1775396400721;
        Sun, 05 Apr 2026 06:40:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f1esm32188774f8f.2.2026.04.05.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:39:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 15:39:31 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg
 warning
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-w-1-fixes-v2-4-1f2c7b74a93f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0qHBlz96dMbZijLiRJ25M/gNyYB4jhLkJMDw+0SA5mM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0mYh1wNW9cBuTtKHE3nLrL/TovoT4R1BshSr6
 07or3RR1ImJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJmIQAKCRDBN2bmhouD
 1++mD/4k5s4VLD7yopf6ddNeEvCjYVY9bBj1kowl+xFqTkTQMViT3zoPsRZsya7VMyRXNw+Oeqp
 6nlMA0TGFZo8+4s8DICgdWVpaP1GWaQFOXjJsWtCL3coB5tgsYnDSVMtbngYzSjeFImckMonYcy
 mdkmHcu2hnUBBvhJLebJLD+MznFIfbzelCGXgGU27xp0NNvbMONdG64nmg2emOOSmJgvAME0J2h
 t+3EL7q04KDjuWGLOZAYVdUu3MesX+G7hTRbUtgex5JjXzDZpoVA+mKKyWEzR02fUsZOME4orWW
 tltpJoITAx0Dd+nsREOpqQU5BJOYrR+v6hRFoYm72eA2gdccL2Gge9e2WlqKgO8f8tjYCqaYTls
 UPG7zBaJxUUircWhIPXwkqvmWyi22xFzv2OqYjB6Z2blG9ee7Q2pDLtDFGPmUIfIMO2x0uEVnZe
 QS/QkNjtnnYdeiR8K5GHQPQGsec9xw9Vk5fALdkwaMzfY/EhPSzsFs3O0EiPY2WCqWNCrClzcAx
 95znRKMb+j4fkVq39exh05RPsUo2hIlwmv1WayfHFTJ55n8aOncYw6a7HrJ+3lwUAhoR0O+Hvux
 vsjstdRbTJIeFmc0dQX/KUdG0zv5F8qAMTdBIdSadCsy7IfFh6q1HobNcL0olb9ckHzowPNRHGG
 PfsW22ZpjvM/NaA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: xSjLQjr3iqJ4oo3Cb4t0xG9xFdkQENjU
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d26632 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LUrmTDEt64PL7dvcyrwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE0MCBTYWx0ZWRfX9z7rl2UZP1b8
 kiFPgwqVTYEKkIch8TSl67JgA/1h9fsYC2PWEsM4ezckC4FGiQRKOcuXotpgVX+onfbrWBYbVGx
 wj+Bej2GVRAONFSFo/AM1eCXO2X61PHF95H/RrpDJ9+jF9aiv6tEmxtxhNRiWyOhsoTq855J08V
 ERYAtrCr1EfrqiUZWho6JgNSUK3J7UhoWy5YPYnNfNIwMVvLxMCQcBYm/9IzO26oy95W2XR55mB
 R/tf/Eh0fq4VdMy9IZbNCZ9YgcH8HywO28ZoD3l/AvoOQCmLg//dqsYLZqbQFcm06N9tNvEs1KA
 PzjANsuO9dgTi8Hg+u+KldgaUsZnwOwAQBD9OXTq1A633B2UBA6Jkqptq8UQLLLIDmM5w9rkgr+
 VI07WmQW1dM/MLD6ttSZH+7lVnkx1g/vlxkueq+3Ec9AtWXlDTGE6gplgQ6Sy6vaLOXB5ZL2Pqx
 wJEdh2ZqOuzsAoe36HQ==
X-Proofpoint-GUID: xSjLQjr3iqJ4oo3Cb4t0xG9xFdkQENjU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050140

Correct the unit address of phy node in Qualcomm SC8180x SoC DTSI to fix
W=1 DTC warning:

  sc8180x.dtsi:2650.31-2695.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"

Fixes: 35e3a9c1afce ("arm64: dts: qcom: sc8180x: switch USB+DP QMP PHYs to new bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f45deb188c6c..e87e82fa73e9 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2647,7 +2647,7 @@ usb_mp_qmpphy1: phy@88ec000 {
 			status = "disabled";
 		};
 
-		usb_sec_qmpphy: phy@88ee000 {
+		usb_sec_qmpphy: phy@88ed000 {
 			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
 			reg = <0 0x088ed000 0 0x3000>;
 

-- 
2.51.0


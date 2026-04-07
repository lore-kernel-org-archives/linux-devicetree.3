Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706BB1397
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 20:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775592928; cv=none; b=dkVPrz9CQOpUyVug+865z0amYbqEaviY7j3xIbkqiqxZYeCneXlKavsJEPchJDBRGQek8axrSogDuHeWW81cBZldB2ilAAqe0Fwv51UHOwXSmuh8L59L6m915rhaUl23UFbjoIQjAW2aW9cu1RCfVHNO3BmMoGfDz4LqtjN/3Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775592928; c=relaxed/simple;
	bh=EOjSV+hx5am1hJQ0T1nyIzb3oz989ichfBYCGocZx14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nMSMsinJBdkrRR2rkVgoAWN3LPqSUWljLH7GOmxdJ2hheWG/oPNV8POvxVURrU4rPMcfrQyPlQ0LeN/SHiKGMP5/Y2EXIh7wnIRQcENNWInuACz1WNEsTAaeLhB/WNRE3OhO3bvSWCuhSoU7ziVm9Imxb8+iJBNVaFxUv8NrMiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrnR7a7F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U953loyR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrnR7a7F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U953loyR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J8Ptk1006173
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 20:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0rDbyQz/c6MivIDznV5bMcqLFGjCu1yh2L4
	iF/Y2GZs=; b=NrnR7a7F54Thi7v+Z2IIcE7+5uIMb+TPnp8HH4l/e5cxnmDG+KR
	tzRZGJ5tRO+De+ufrSf52ip5F5Qpvpg6kFYeMwu5rM4ZtKgQwkvwa2l9vTkxmztU
	zCQzVg2PzjEqn7otad/SsgfmR3B5qE5MUPBdcMz4aNxTKRITHXYnJkHHCgCV20iJ
	Ji3Ynerlk7gd9OdO/D4j8MFJWy1Fusy58lXRKJjOzPgJsBkpz7g3DMCAg/X20G1x
	GMdK0SbZH9etkJgmfAFdAP9dcLONTSPlAbktiUUcDQAUHVVJzNHNLO2HeecrqfJf
	RMrM6a0237fnilGkQcWZ5JVhTv2uKeuOK0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tp86rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 20:15:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5aa81907so44966401cf.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 13:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775592926; x=1776197726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0rDbyQz/c6MivIDznV5bMcqLFGjCu1yh2L4iF/Y2GZs=;
        b=U953loyRYSoTzsEUXfIgAybaJ011dzOSPy4UQ2bCmuDnpeS7AbvaKC5rbazLs3+O4a
         4t/JYX+wdcRIM2ko3PjjjwX3LGBI4fc7NCiMkzd7Q436GcSeSMWGKwYXH0qvAF2SGScD
         MuNNOhKbYkZFPDoaYkkYNg3jPeIbOuFQWP7gXaFNXT4fOtGOs02n47x6+j5VXKPrjYt1
         QKVOYV6GFgWqiF2xxBbbfk6ZnaFP+jrKAz9WMYtbmfBIqYxCxqtAfTb9d2cXnSccNCW6
         rkB4tXn8esxX453e+F3W/fdyi0/iTG6Z1+M2KpiC6jtHj2Mm22A3mB3HTJCAzKq7+ZrO
         7NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775592926; x=1776197726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rDbyQz/c6MivIDznV5bMcqLFGjCu1yh2L4iF/Y2GZs=;
        b=GpFPzCL/LCHhCwD+nGtybZalEcLSok16DvOF1MIslXSQxyU2Rx+bmZxXb0AluX3iD+
         PvLbL6AKz6fKsP5uURA0IPRmUrR/ChSGeWFvR4dNbLpR4YfCL/TnF00/VlhsKIPkRowv
         gC7clK7+eEe+UjiS9zwNWXBP1cq+3pyTGZXPhuiDtv0URe74eBMu6BCukVD0ob4QyYqn
         M2OmcLUBOfabLBfEZCDLh2P67Nj0ONI7wC2FQ63gUYaD0RUI7s42YCr2dJet3umSNpAt
         6mQ41S1ZCEPzeoMr1dV4KuDvF5lcDYSzcP9LXPkKkPMLA+qzUwvSWSPHgdAP9pXzHW9a
         6Rrg==
X-Forwarded-Encrypted: i=1; AJvYcCVp0j1o+BVHgwH0/U+y9ypw5HN78T2OjWLryOCpvLpXcEZNV9yZz0FXwAlBkJswU+lYZb0lQhXt9UJA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjn4GO5hedSz4zTwAQkLY0KjOXr4+hxNRQmtiy/MvHYNbGfv+0
	2rm5Qegpq3i/r9+0+31oi5v9tisDQDJLga6Ul7MfQ58nsh14bg50vD91+e+yaK5l8i4y21DUOgl
	Ce99Rkq7pHZrDH88U2mh2udaEk9+4cqJf21DjCkMEZ3c5IuQx1GlB1So6lfnCQAF2
X-Gm-Gg: AeBDievM6fLBGTlVb5gT0Xnd/ZCcqe7Y94IwHZwB7P8RPDRgR7dhZc27GMh1rlcK0OR
	sxlOIpkp5plWq1dkC64sJsikdezRgtM4PFUKu8k0CkFivczbKJEv1bLDMf23wHc0eIU8Ch0a4e0
	MUOoDbNHh0th/hbKW5GiRbiCNhn4RwtPedHM1dQ74CAoWpS5P9fd/aONdFLq6hTNpNTbRBdV9jV
	WTAt/J3lOOQV1q6ZHkuYAgBqj9YtfuXe2o6YQOhvS5NwzNgvjeusfYii9057bofXOlxGCDys6VX
	NaRutSkH81lwoS4zGrg8h+fiqlA0kNjmsrETc2MPwkhJ+0bfMlHSe65MHhbDcwaE4r25vBTdJxp
	vCUsJcEa49yLZ4wU7Tp+wjnbuCdV5RtyMggm7
X-Received: by 2002:a05:622a:315:b0:50b:534f:4292 with SMTP id d75a77b69052e-50d62a970e0mr267678741cf.35.1775592925666;
        Tue, 07 Apr 2026 13:15:25 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:50b:534f:4292 with SMTP id d75a77b69052e-50d62a970e0mr267678051cf.35.1775592925114;
        Tue, 07 Apr 2026 13:15:25 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c1c5291esm80966785e9.15.2026.04.07.13.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 13:15:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco: Add default GIC address cells
Date: Tue,  7 Apr 2026 22:15:19 +0200
Message-ID: <20260407201518.24949-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EOjSV+hx5am1hJQ0T1nyIzb3oz989ichfBYCGocZx14=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp1WXWJRX9OFyzaCV1QUNkuSy34/gJnfCUdh0Tc
 7nQAeDI8YqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadVl1gAKCRDBN2bmhouD
 1wlRD/9XMCsb+f2kXTrGhngHJ8rYhs5zxDqOphhpQij0Pn4x7LglJQ87TmUizU6XTYNKXw7Ik/g
 djXHEzNGuIdDFwsJzwPyazmkgABM3MfyGGa2h62zL8EHAbAhHuh651rB9W1hDPMtz9KD4WXm28Y
 tSa4ZUGNZN9oAEhQWmha+KBStLu397+GYVUeqeN1e5TvEQDJRCMKxAlnTVeA2syg8WwvOtsRbLc
 dy9U3aw3ri+7bZywRTtyfiQZNTTzRiY1OvslYXcXJ74+pfUR0Y4PhYv+4rMcmqczzLQhQTwmWsY
 bUKiOn8/RPs2GFS3o67iInqpWjVca1+BQCLlVIiyyr2/N31M1MHddErshgKBrhcfgCzMdPccjCk
 0qobiCo5cuJLj6v69/j2+wR8R7PU/M2RCBKxdDuIcZQ/7wCxxVJqCipXX/aNi7D2wCq3csgvYaA
 0nPLvQJrj4id3qcD+YQlKeLwoWQJ4ePjBCRFeZkKqk8XtPaQlEzQMAwx+zwHeQx80rCPyaMpAJ9
 wc3sRVuEcpZy5b5AU4wdfsCUcOnxmpa8T4UDj974+z5KJmARmJUKfKRncXtKQDWP1jD6vkUfnK+
 ZfTJRrLmfQN68M+2CV/xsJjGQ+Sl/zA8PeWi/ZeIpWak56uEQDeg/tmP+jXgMZbgwunW/msvM6b OLwm/ExEj9Vd3+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qsUvTRiQfpywazKrrR7qKq43LKgjmrxX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE4MyBTYWx0ZWRfX6IO9QlJ0N3rW
 qna5o6iNDgaJWInJotHSypvyBo0t7AYhVXyuCNLuFLEoKdJuJyd/IYwmjlNAxt3zNNOrtkgdMUC
 ZXwkryDtl9Yj7nybiho7JzmwRYMc77Ytb4GhmXJJeljHjoXSebavnzXpu0uayPl51jfRejeWcgS
 8j85lGF7mGnx7VBGtCaBd1MjvjMUkr3RsiT4Q11n6AH3jMElqQ6vbhZkV1rtm/QuetBzkWhG3NW
 FX0zXevap8DMAUefUVK734ZV1xtTgaVYN8zKldiYOmapmFNXQqbNDPd2vb+JI5jFYoZPeFHmb/D
 vhfKwf1GZqLymt5zpQvUjUSBvmJg6n1X1044lZgb30k4PdlQdvhRsExGqQR+12d6ZtJmjS9B0Bh
 lDQtAir7Ivwv+OZTyRR9HnaqonqQZDP8Y9ZClqFVyZAuk6MakiZrKiP/Q9/koQSu/gKCyoHWL3F
 u+eJejaQ2Y3MNN/t0HQ==
X-Proofpoint-ORIG-GUID: qsUvTRiQfpywazKrrR7qKq43LKgjmrxX
X-Authority-Analysis: v=2.4 cv=DNS/JSNb c=1 sm=1 tr=0 ts=69d565de cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=2mHS39Au44Gi0sajd_UA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070183

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component 'parent unit address', which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0).

Fixes: 46a7c01e7e9d ("arm64: dts: qcom: qcs8300: enable pcie0")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Fix for v7.0-rcX.
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..5f060b24d52e 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7380,6 +7380,7 @@ intc: interrupt-controller@17a00000 {
 			interrupt-controller;
 			#redistributor-regions = <1>;
 			redistributor-stride = <0x0 0x20000>;
+			#address-cells = <0>;
 		};
 
 		watchdog@17c10000 {
-- 
2.51.0


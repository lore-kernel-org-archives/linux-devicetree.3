Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78E437D130
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154037; cv=none; b=L1wCmunziAsPIW15PqaHcvYjZHIujvPZPSv8KqHpcMp8sktxjEZbKEYZmiX42TWVXRJZng21dBHDJRNie0imU0GDinzphJXUFgcqUIpVOWVfwVlesX83Mnom0t1IFXUxnOykBrZulI2gUq2DgOBkP1gtFrkV0XbNSWl53V7ycVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154037; c=relaxed/simple;
	bh=OmfcXNKFfylOhIIh2tgI6MJiW5jAXnRxQ+FG6JCKRE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=apBu6uKI6uUdZ8XtSAVm6abXfgG0oi6bF2OGVZY4SgqhUmncckMMKbgvN8qRMTq8iWD+IbHYkqFaCry4jrJIRBTag0/3YFo+inbHuwRaeO6lL4dO4UrGULPmT0LkBfiDwJ3n6ux3TflzhdQJeyHJhuWg7atH4idLVSrKsYwmlEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LAtLN1tM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brdNJZDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LAtLN1tM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brdNJZDY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0OBvx3160612
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stmgkq1tIs0dKRyAaXldgGB8+OEjqF9BkHAkufapAc4=; b=LAtLN1tMJ/hRGRl6
	yxBp3OaONRLCavGWrA8sTCL/hvzAU3jfWwEHRWxMo3YaVV63aWXKp0cbenXf8QZd
	czbE1M7ckeqZRA3lUU6quqTwHjV5GhiT2j09U8v7V/h10q1dpYHGgb/7+S+zxI89
	PtL5oayM+uXOVkt2I45Lq8sYNeWwP0S4ODlG65JdB+PNgpKhVk2lz7btbCDuneYp
	q9zGvzCwrqE2LDQLPuDYGlo6hCfTi6DKXziksR1jp0LCecOUBrwFjIafk7j7dDuR
	YFV4eL+qnVVxF2RE1aPFOhWzhIE93c63335Z78kw7PUygAU6KouShTaKUDOCthOH
	hvZxMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701p7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso129966105ad.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154023; x=1781758823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stmgkq1tIs0dKRyAaXldgGB8+OEjqF9BkHAkufapAc4=;
        b=brdNJZDYgWWptIx+3485joZXo0ve8G5cgd6RppVswhUbOJFJPm7GbLaDsOje+ESsP0
         8S9QKaP87bpirnB3TbMvFybDW7LfRw3LO+MuEkFADA9P/WIrWRhS5ykiGeB7luBkWsih
         Ylu2FKKpS6syFQiw1KMxaG57197cCFp+E7mde1LtOLgy2w7e9qEwOZljQWv7Wkv4+/Og
         CZEOgtormNmdFwHnO0ppLD2c0ZNlOSrUVvjQPZMqggPJmnMGNZYq9sEJ9G3S5D6TweQi
         JYIIQC8wIe79AIJiZfUGvTFDn8yt6Pd+q0+U5j18TNlAdbO1xgc8ct1MVBzuv1Q23n8x
         XRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154023; x=1781758823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=stmgkq1tIs0dKRyAaXldgGB8+OEjqF9BkHAkufapAc4=;
        b=saein3F9OdV2n6z8iplBuRe2uxSb0jFyKSIUszlqzyrL0SUeXtGsRvjb1J3qRjSzsK
         w1q9BzPY+ChmLyEPBqvt0KkkI+YLWcY7fDGMrY56aRE9lLeEjK9CNq1HmveTUN5sPTCS
         lnoZBXjhjipLUCwli6Uz9l70srh+HD9leSQ958rxOfov1skhKpjFB7rWp1ubun61QJOc
         fxddnwFyLYLX1WtUuA0Dgt7Q25Lt8yEiB28CM4WLVgbynM57b6qrwf880IPgvAG2VPp7
         eao2z3iiUF/ZUv0HRVnjXO9d3NzhiAQxFPhWstbSRu3XX8iAd1B7jHKBNmhFxkGl9Csk
         MFFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lBdr81miTqyUkojHZ9Vk21fX7BlS7Ph9COHQG8pIz8VE4iqZv595Yu7aW1JxCjZFY1xNlM1k6LS/4@vger.kernel.org
X-Gm-Message-State: AOJu0YwvAaiQOsyxahq4kxTpZWl5h75GmSVDWvLoCd4c2p3og90O/YZO
	Y4sFXMdv3yBV5Np58HJa1Bm3dLb5ftSyyJHPfOZs27zcbB0A4X+oV+ODBi0u+gzQG+XK8N3+thC
	DjVcd5pX9Fg1FrkTBtJrcpMl0clPNzRhfhGK37uRGZ/OarWF28ELeAm5WF2RlIU0f
X-Gm-Gg: Acq92OFBfF+q4VCuzIfCTb4VbsWrE2IvWG+jD15xZ42eDTYWQ0VgECX4QUggBKFY9Ug
	hFayZtUedcjMm9NaNPucL13AREaxOFb5dTG4fR/AtcGLL2jJVPV0r7H4LAXNegWDQEHSoKDx2WH
	jTEfNrZprYLHTCKM4WCuPCqeGBCEcRwu/YVAuvXTR6ZNMwb4p3mpSWPdMaKhj0kCpfwSeN9AFOQ
	oq52xyGKwgayZU50OXrqAnaeDpRSIO+0zq/UDF/M0tscEIl1ovudA2BceJT/4VCu/5friPf1aP8
	/jMhTTY1+yKysV5K8vXI5xHQUZeDMJeflIcuB0bGVWhDezSLCJ5HiL/9oWWzkHPMmkS90VFgg68
	cKPlkXmJos56eQ2YHHCjztzJSYcCTPypAYx0phb8Nzl3fPWIReSOeiaQ/XPLcoYVTEUs=
X-Received: by 2002:a17:903:189:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c2f005b33amr12948505ad.1.1781154022923;
        Wed, 10 Jun 2026 22:00:22 -0700 (PDT)
X-Received: by 2002:a17:903:189:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c2f005b33amr12947905ad.1.1781154022333;
        Wed, 10 Jun 2026 22:00:22 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:22 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:58 +0530
Subject: [PATCH v2 22/37] arm64: dts: qcom: qcs8550: Move PCIe GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-22-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1636;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=OmfcXNKFfylOhIIh2tgI6MJiW5jAXnRxQ+FG6JCKRE8=;
 b=acoLxsuOq+BI4mvuy0V8edmZzr9nHlzA5V1bBgN3V8cXAcN4X8smyNBLcEQ7ed6IaQ46/IlIm
 5OCnRblQbnYDEKX4Dz+67CPntCKQ3oiZU8kjNoE6SnMirnQTDAeGsOF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXxM3TyfBeBuUU
 qUnyahQXoeUJ7PzeK62seVIpTMUpSyai8Who4aQd5qI53GStKTb6WwXMFoFRs013l0ZQDJZNh1Y
 DDbSTbWeVdijoPH/A4nmgvTmjwNcL/syR9wLcdjGpzjGH8LucpGT/PaokZK+mZwEAgBaMrXptNu
 X+3OdeZU/oudcXk70Q9eppI7Jj0bHVKu0DoNVd/wu1Mbegi7+GxJk4gs8wCi5VHQolkmwAgpMUL
 RHe37Ab2sP+QOcR4KjtqYsaVjuv6DEtW4kzEDk22wFUEqH8mB9E4V9WtznVyxe5t3huErixe/PJ
 uNqur24cfmPC/7EbUI22Rt1FnTSwIM9vlWgWcYX+pZFUohVK0cpbQGPs4Gb1huqOKGEAIarnc0n
 tt/WQxT8+DWWChAngtAzVGGPny68MUbgx1y4PuGpXYmcr3izYNqBsB5mAPjNLFr+xpTcYmNiqB8
 hzYwtJ3d9t32PHMnkcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXyTJy0hE5WnPQ
 R18t6vOmN6Uq8XOY1Z/4sU28GuNNAdkF/Spua6BSthe4z+1pvaCwx5RJMir+DwYOhQM/bgcEye0
 DfmfpqCeErtEoFB0O+5edSNXobUzcp4=
X-Proofpoint-GUID: NaWqBWRdoHjhKkSV9mF721Iq9gV0imDj
X-Proofpoint-ORIG-GUID: NaWqBWRdoHjhKkSV9mF721Iq9gV0imDj
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a40e7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=w5YLtpWUZy_VJOv5-54A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie0/&pcie1 controller overrides to the
respective &pcieport0/&pcie1_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index 5eb4626c6129..579b0a4f34eb 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -335,26 +335,30 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3c_0p9>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;

-- 
2.34.1


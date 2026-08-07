Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A4C3F8251
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096292; cv=none; b=se2ru40ScTYZ1Uiqt5Wpivob1mJIWHtu5X3jLrRtK1f9ndzDZpHVGAWQoMse5emKX+ebphfnWbquWPROTsC84Bw3KhZjIp85RKYwklxbMv5YiLLadsvKfb3AeYY2rQB49yqiKzyp1te8LUkQ8ANhEyVwR0079yvROD8HFDpNdv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096292; c=relaxed/simple;
	bh=10NhfOC1gIKAziqSNf6kpZv5eQEAw7aenjc1gCGzbl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJEgDt0fcSpRgSxBufM7bkUqyDgovkg7gsnRQq0SbBeBvcRl7oaRe8c3QOMXu0H9qRK7Yrx0VhHuwRqD/Z+wamDI36rpGrYbKfMvWzuwMnmiq8EMn8MlqZu28elGKMHjiyZl4E/8T1za0R8qwi5onvPYfThOU+PjJ/vbYvF8B9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgLMhYmK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8050hod; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgLMhYmK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8050hod"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777xMU03564281
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 09:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTeEo+Dd65vWHQ4gLv3lLWny6GWaVci+AS0ORkAy8Mw=; b=IgLMhYmK+Hs3Y0Ek
	9jL0Ce1o6qqPWRqDXFAIoZmEzYBdI2Js70sVPGFgSNEt/1aT6xUQuZCprVRqBO2R
	L9XYJTLnfPcAznaLx0CVPEMMs0JIMlbVsQx+2cmXhYxmGwERE2h66HC2JnqkaG3+
	Z8KfJX9/4ThTYF9ePX6rbpFkTLf9/BK6eyV0CaMsv3k5wPTgkCpjr2j7QUu3Ujk6
	O/yhgmYDEo1D0x/cKe5SQhfoBmciLzRprbyGZunxfoldENgexmaZIbCq5pyyQd8e
	RV/UpwkzL4aDGbO/Kgpbw+ZEe3tqEwip0yPNybCSAMqsa8pMFZVzkN1zED40fzYT
	+jnjyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6ju7nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:51:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so1772005b3a.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 02:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786096289; x=1786701089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTeEo+Dd65vWHQ4gLv3lLWny6GWaVci+AS0ORkAy8Mw=;
        b=C8050hodUz0kdY1/Z2kDN3ApdjyXP6jyIS80UqiIF07y+ehxEFAJLaJ+f0VNiQUi8K
         MRmrUov19MQ1z7QUDjCnJT2O4OJi1/vFPWwQgKMHQlSH5nRE3qN8K4KN/4HkcPo95A8o
         FvS+sCQ8UR8LFtNWPcgE0+sDVI9n3n9JX8nWaodqqfwm+FoiwwRUwwkybpBGY4wwmlCA
         WCrQl7J3oHx/HV+U8Q5MV+ATgSDZDN7YY97qrg4dtbVaiw3RWjxXTqdJgEFFzZ5RmLvF
         +ypph4itpau0ZCCN3aVTBu4V2Jb6NjsNf/upBvtzymJkR1QCSgPtI2nNXHKRTPkVAfTQ
         OZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096289; x=1786701089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTeEo+Dd65vWHQ4gLv3lLWny6GWaVci+AS0ORkAy8Mw=;
        b=nQN9ONGgmyKiHHB2/nSECuDHMC16ZlaZfZ1FjsRml3oYljjZQVOphwzQEKEcno76eb
         kRT2qqUP029pH2K6eZk3iS6+VAGhFeD6c3hitfY2g2eKeRnzaipCbYQXOM/1678XwDRs
         U/eKtIC+351YC6GM0zq3r1H6KUWRc5hHlWIoCn1w6M7BDK2v3oNx5retbUJeJE0wfhGO
         DMg2YGEAr3cJqlux2Tb6SVt3/1hGoNizHgfHMSu856LbcWxZNTgafhlSuPxvz/6eQATI
         6x2QEClJUQPf6ER5CdAcyU/MO0sg7JnPuWxBj5337GBNwY4XZ+t252znL8hKnbi29bi7
         K2Sg==
X-Forwarded-Encrypted: i=1; AHgh+RrGKCH+/Rff3zi86c4jzYn/yB85CQ1/I17nf8/OJoBk3p2dmkl37bVpMep3h83Yf2mUZD+zLNOGDD6Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxEtZwad79THSKQpwhDqIptA2oE7iszMtHOVVwVQx0y7WWi1aFf
	xF/ITyPZFHxJI1nv7awe6mCUm71QNw+1l1SZfypiZ7P4aJ6q97TLP5k7TfJRaVwX7UuL10ii2cH
	XGZ1mdk4AoPNobXUG3wdEEp+LjO5DI7PtlrIFTc/efy+A+ZTvWdhxWSDNZODrqtsw
X-Gm-Gg: AR+sD10aRvyTrUmXM823BXPvqGAaj7JUO/V/+nZ0eJCD1qy5hgxctvin2uzRrzHJgJF
	T9llmEUGU3xj/H5W71hnEF3hxvfFhor/s+xWKXsG0GBeqdBdhQgLcPsIK4Z4k2muhqfvH6DCsXQ
	MJkpgwB/KaNY86AEKs6SmWZB48RoH0KOZbtG8sRvl4YQLno5WzuU+ueVearUxRcGn2uOXxnZNOF
	lVwWn8zuemxcjolIWqfUouzICK68DBuaK7jaJv3mjmFbyrrnrlBquLAPqVJdpuGmqsPAGk+sYIp
	zHatKLjSDX0JjlMjkACxVkWSvoZzSESXrW5xtAw8AUTgd4sfneowytmLVaCdwlPIljpM2B/YRYA
	PobnECvUwp4V0NjVLhToZStR9IY19M+bKLvl9ybwMNzkqGfg=
X-Received: by 2002:a05:6a00:4b09:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-84f47d5512fmr11250208b3a.7.1786096288721;
        Fri, 07 Aug 2026 02:51:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b09:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-84f47d5512fmr11250159b3a.7.1786096288265;
        Fri, 07 Aug 2026 02:51:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cad9dsm743785b3a.23.2026.08.07.02.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:51:27 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 02:51:15 -0700
Subject: [PATCH v9 6/6] arm64: dts: qcom: mahua-crd: Add PHY supplies for
 pcie3b_phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-glymur_linkmode_0807-v9-6-dd1c7e236e29@oss.qualcomm.com>
References: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
In-Reply-To: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786096278; l=922;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=10NhfOC1gIKAziqSNf6kpZv5eQEAw7aenjc1gCGzbl0=;
 b=x8+krZm+DrW6qkUKMBO+Gnv9Twfj6KHSBbmJvSeUdkrnRdhE4+Rrser1wiFz3Ux4vL5T4MEcf
 M5RqPdMHVC6AYa/m+4WoEWukuNzjP528mrgadLHtsQ9Ua0sgU52Hf61
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a75aaa1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PkXiIDIAJHO3iIiOwRMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX32jELk4nKJbU
 2kqU7n27j5JPDeMt9TMCWBl/DSYR3eafagO1tBiOs/k5wq86FRZoK57daGEFiBXm1qSJIA/XPjj
 M93Q2EbPSAyWqEoj6zljaO0Jp3a/yMKCtNR4o1y4e7yVNhnLoOp+cmIZ8H/X5mA1SqymdqRe9iE
 4XJkqi2f7A6jl5h1h4AX1ozuPPBqGL0Fdt38WKq8gIhD/iwGfME68QICCPU8r7El8nOKykiGmLe
 KuPHUTEx+JnFlOq7R9RbqO7yoB67bDLxiwTe9vgKNzNQmgkS3SSTr2NEeM44dehxClun1nA8Jns
 MnUyKebz3yc1I2w1w/JjvbsBdV+xX0kB9Sp+SX9BV+iiM4Nmz+vcUjyuGwx2XKqHlJk/a6XgCAe
 UaaC5dporiGA6u7UUczX2QpSXkDgfo+N/l86lHeDKmn8FnkQD/cCjCwNpcJIJQSZyqRJI0HspMg
 H/kSOzrJOGwIqBZf5yg==
X-Proofpoint-GUID: PBOfj1uWhVjIIhmt2eFi8VEm7xnzudOY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX4iF04Scz9Jzx
 8MCsbsDkEG6EcdOTPh977GiFNtT1H63o4V9KBEXzTdbXtkbaaa2bZK9FFocuG9WqGxW29Mr3Bcc
 RTQALnZcmwhCTTuj5e4F4aRQdk0Us3E=
X-Proofpoint-ORIG-GUID: PBOfj1uWhVjIIhmt2eFi8VEm7xnzudOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070074

Mahua CRD wires the dedicated PCIe3b PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy and vdda-pll supplies for
&pcie3b_phy.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index fa5229064b10..17e40f2a6259 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -20,6 +20,11 @@ / {
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
 
+&pcie3b_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+};
+
 &tcsr {
 	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
 	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;

-- 
2.34.1


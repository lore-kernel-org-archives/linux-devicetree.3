Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7984B4457DA
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344583; cv=none; b=fGVa/X5NB8kmcz3rR01MQQioUomzgqi5MHAaWqnKg1gYh/VcDsAmP2ncfkYOPhTbP8ypUS7GxHpwNrwqukgc5gaV89DaBRSoaMk6lYdL0FSIlijxmczYjL3l3a2Yshlu7CHSUmY24cYeBAY5uffi6dIGZ7pyOn1aqktaw+fKeb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344583; c=relaxed/simple;
	bh=fS3V3BGXA2tO1x2vx31WL0Npme+1qzuAanXx2mjT4UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZGsmBLeGzj/0jf56nqeFcBc8VS7uvs37FDe/ALExZmXWDZiCWvDuMFSUeqTphA5D2VQMj5QBs+ewOvH1h9MQI5TRV23iHGxf00xtZV54IJJE64cPjx03TtJOnva5pWqlnE+0aJE4jIuWD3WNdWitKUloAijcBSTDjwCLS9p4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n13n6WcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jveUphAA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n13n6WcO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jveUphAA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NAFO2246279
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 10:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfgP/DBP0RIbDcb5reJJer4RlTs0vVSXQT37ojTBPrE=; b=n13n6WcOrqcMH0pV
	VXZ+c71qzL1ninDs884OrMavwDfVkvGEpPnrQlq24YpjMYEz651qjMyACusd3Yjc
	xBMvYNIOdELza5amszUBCIT3K+R0UxSJEcTp2IWMSIolEnmoQlgYQx4MD+Q4FyBH
	oThs0vNvTl4AaxkoGExylHgpThmmSDVekPUzOApMpWPTbvIRLQSfJsb20+TgKsy0
	H14SnqYJ88VUM1ivy2DDococ7pYP+KRnP3cc/IiwAfIW++Fcv9fQgOCbPRaSdqle
	COZLjnz977C8kShkP/BnTVl7gV1yge+l6sWhEP7ZlZva5WCHNWjTOLfc4mxk3mbG
	qvyBow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whj1j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 10:22:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso2348383a91.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344573; x=1788949373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PfgP/DBP0RIbDcb5reJJer4RlTs0vVSXQT37ojTBPrE=;
        b=jveUphAAIHxuJJP4XWEmmPkfkkxNugDUumB6UeeqLU75oKanwNh9y98Dy0nmoNRV/+
         DBL5kMe/qwWD+hIIkJ4urDSdkVKIDcUpUXT2pKOBvBB5hlU1dmBd9oP4So40XFfmgvzH
         p/v3zsf6snzcmAnQCVzald9v01NBJNkz1GOec3Vt9BQ4mM93jXU9hsMnojsPqcXJLHAs
         /5XK0Oz6rq7OsYZQxWvDFfOO+VOFIlXPPzabb7lQWO3vZkjL0imKzGpYytxD+TRV11jW
         IVHpcp7unP3V2a8LiOhapMwxuwqpL34j2SV5bCyelaysR38kpBvvQztG6hDpiaDW0goO
         jheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344573; x=1788949373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfgP/DBP0RIbDcb5reJJer4RlTs0vVSXQT37ojTBPrE=;
        b=Vunb3WHTnBB4kA7NITeALvwodBi8EmRhZ3dATE7XLljhSLi9uEdAAYvDivN/RpEsHr
         Mk2zGO4WfWkRpf//uN/za6sJ4TCy5oeSDub/eFyq8f3sHcFQq6BSZpkgVk1HzEHMVp52
         ogZKCkBkgtvPdSN9JqgT49fBtaykIw1TFuT5YrY0w8TnpsvV0h0SxzBMAdUoLKr00q4w
         MJkg0/1V6foogNjMqGzGEYEeTSJiGEmnRtekYYMXzt6+rpQQs2U6lBgaPKyxwz1M2/Yb
         aN2K+6TsdiSNG/EuVuky4hWnFRRzsgheB0lq+5Q6JxIanfcwKTGe6aepCDcOLWR5HbkG
         iLgA==
X-Forwarded-Encrypted: i=1; AKwUvBzjkljldqjhzAESNDa4PQJAspsXg5RSu758s99y6ywzWZipOFv2IqPArh3Yuq5ztByL0moeIRlWFKud@vger.kernel.org
X-Gm-Message-State: AFuF++kRmNoe/EG+KIfM4NfZgKTVTD+hmQYChKam4rSWKZRlGugGWIf7
	y8XSdWdFdqS8Pmm15+IFrhcqpAys4t2iuZo2QY0lbEdDMI1LLV7XuF4NZ6JZLk+ZFvuWFvdLltc
	wbYjMmmI6m+XPaXfCeSOO0ssCo+vrzT/xmm82VcrIOylL7xrPxDq3GR+ww+Euf1vm
X-Gm-Gg: AYBFou1IhMOwN1DXB5pOsIXgY9v5xlfkCE2+gycW5J9TvFk0XvblveLUJ49+LdR+Msu
	P/NUaV3sihNLaqumLfnQAx7e4sqyPtTyJhULxx5fSnFmgjZUtfpDzNqc/gw/spMtdm6Aby1YCCu
	dKj8meoZUx+RwiY2QYGt6ZOL0yQFwIKWG9bmNjgxLZ6qzJy44WpGEUvNbd96JPvu62841V+j6Ac
	bDlRe9Dw6pbO94KH7aXzYDgp8tuE2bfiKsPqyOk3QJb1JEVBeaHXJI3JiCSQkys0ZyRNFHqCNUA
	eqVwkUqNEFlBYWdop3X7PwL9C9YYzIp3enk3MOp6bxL5cuqNv2GsFPkpngR/ue3QRdR263sH+FQ
	TdWkfqcTazK8mzg/HvDrb09phT7KDWR/01HiFN5j6vE0=
X-Received: by 2002:a17:90b:5890:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39af64db294mr2354074a91.24.1788344573035;
        Wed, 02 Sep 2026 03:22:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5890:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39af64db294mr2354033a91.24.1788344572568;
        Wed, 02 Sep 2026 03:22:52 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c0530sm5054861eec.3.2026.09.02.03.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 03:22:50 -0700
Subject: [PATCH v3 3/3] arm64: dts: qcom: ipq5018: Enable mdio1 and add
 QCA8081 PHY on rdp432-c2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-qcom_ipq5018_mdio_pinctrl-v3-3-629c7bb05c44@oss.qualcomm.com>
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788344568; l=924;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=fS3V3BGXA2tO1x2vx31WL0Npme+1qzuAanXx2mjT4UA=;
 b=lqcytDa/xshZdY5AJhA3IsC+fTgNZqHOQ04ub1LaNUVvfciNS93VZcBcG7/7LXvw6cQ68mof+
 z257LmwnatwArkyzYBZAo4q77uHj3NuMSvz9SGFJY0Lhk9isEp3WF0g
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97f8fd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mKqJttMW3klxcx8NO6gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 90ijfeEc9oQUAxA4wtwItvyHTNRJRRWE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX5edkQV4sMbnW
 txadC9EC/D3o+ouGCVxjomkqfhWFl3Zf+28Q7SXIP7170pf8I0yKHydpPwTaAsFkG8o2Rt0r7hB
 7drDA8yhe/cWKMBk26r2gi9X2FocSqMENCF5w9UTI30nQ0vdpVR3LEzKTxVnkKwfjnYUrKrcGrb
 9GiQfRg81qr4h5OxAt8RO+FIE5tBM9oXA9hqNdLyjz93X2WEKaIHAtgNa4YccSNKL3rKL1+QfpN
 trXQHHvfyMD0Uy0kpyjggpszlfiChsSXfIym1IkNXr1TYE1O/pJma08OHVRk2VRdkk1sfc4frAg
 I3meokvGJd0V7gAo50WGQ3hz11fHgmXxBompOnE1CYSV0fHgzqxUiOG5k5qX41Wxs1DAioxPLln
 HWDx9ZPd5x2AOfMVq82VlJHJKrF5Eci1F5H8RHOUPqZoda84Kj7yKUJyKQ9l97VmRCrBjgczxbI
 o5eIAmW5JUHx563yyrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX1gCqzb1952SC
 oGgd5x94VoV8z8f76oJm//I+9MFmxm48kBAhn/66+d5rtLbFy77DzdnfrTd5q+TaBI4U3P4PPhg
 2+3ldUfqGcIAOUlBSTpSwUkCTbmnGsM=
X-Proofpoint-GUID: 90ijfeEc9oQUAxA4wtwItvyHTNRJRRWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091

The RDP432-c2 board uses an external QCA8081 PHY on mdio1 for one
of its Ethernet connections, but mdio1 is left disabled at the
board level. Enable mdio1 with a 6.25MHz MDIO clock and describe
the QCA8081 PHY at address 0x1c.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 33eef92b19b1..34d4a0886356 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -30,6 +30,16 @@ &blsp1_uart1 {
 	status = "okay";
 };
 
+&mdio1 {
+	clock-frequency = <6250000>;
+
+	status = "okay";
+
+	ethernet-phy@1c {
+		reg = <0x1c>;
+	};
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default>;
 	pinctrl-names = "default";

-- 
2.43.0


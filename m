Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548066;
	b=FyKn8XYCLaLtrYiBjtma0dygwotiIZI5JtRFtt2W9bXDvSDY2AI4Z6OgWG70LEb8C4XG
	 SgMK4WRjrDmL7pfMJlESs5HwAtnY25nie6Fb2mU4VjbYci4Xwb+HMIcze8DFapESUJlY5
	 aH03Eh66IIJMT6seXOgpn1oAv4fLIvEQs8vsfiisIRuYPYkmforWAjdzIST1JQDjvfbdn
	 Pt56SMyBuL/rqmj302GauZh8Mhyzd9sDYNIehcu2gzPkDFd7s2++4hNXPLlV1JEv/21bR
	 iYYpvOJMFDGLOWm6W8fI7O7xwLMb9RW02Ut4Kr/V/bvW4dCJt982CzmIx5NY0BISsag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
	b=c6ljcIhMwFLjO7iopOnlWUwxl1+IJufamHsjbDiyQoKznDSGEwTufR4M00mtekIy10pq
	 NxUFw5F0sUuQ3D/PBV0kg/rFmXMdD2JRMbeSQpLVP9izGT8xzyQTiTGrlBDdLBCVx0ANj
	 ALsYId4pEihOLvBYzxGlh8LYncIMY6Xzs/0OMz8ofziGV7NJZzczq7b4latenN2NVPLVt
	 kduiuvbDBR4hJtK4nvOmGIMaxv/GhA2oukkY18JqORufzMOMhj7iSiE3KBe8CBxz3WyIS
	 McRpPJ9fSimsEmYMg/vAZQfEEXVYqxHrzuQDK37CRpeEevuew69wEU4vnxjtJbMyhyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0DydbRI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcRJ0GTK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5139606A335
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5139606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0DydbRI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcRJ0GTK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5762Y1631347
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=; b=Y0DydbRICd6VfJxi
	wjL5DVVFUYeE4tgWndVMMVkjwvXSdFHl84VMV61V0bsHm3uwhTsCIcwi5Xu2OH+V
	G/xZyjBSLULkBCGGz0anfipn1ETxvO0brGhm+zLLWpm6GxngaGphwX+5fwtBzsPB
	3gZOND19WDlSoaimiAUnV/Ggy9kqsClW0GIBLR9FLVgi0E7PEfoHlQSnPSST129k
	yGdG/qL/PfBD8KIwMRzT4kaGxqFQQrS+V5rKoFb7VmoxO+xbxK9NQY7FC/vHprGS
	CDMpGfKAMXN9hQe1OFFZakaoASQ9PqHz+f8PLnGESOvcGkYMBAFIf1A7+jeNFvyc
	AXFhvg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1c8jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:24 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4ad9bc6aa91so802748fac.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548063; x=1795152863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
        b=UcRJ0GTK0uCIuVe3J9kowV4zd6yA6naU0eqO3ExGqYe4IoZ4kJ3eTXCRdZMoW+YDaC
         H5tz2QfiZW6AAx2g7XoqBkxPUVa5H6KAKJfnWapoQs86tIyKRBxwSZkwFkn+PN1PrLPl
         Kyi2d/UJDqDjhWig1ky266qN7temx/1D76nmXA9/9Vv3Vp0a8v6mPCKl64wNYA9xBTpv
         i+xFuPzq0WsRqGJP1G7lxjifEppPbNm9udcifxkJXndOKNhsGRIG7v3GYM1sqOexx988
         40cRIOmAhFbjOL9BQGdaME8J0jlCMZV4coqxmOyKasAAIeoP2e2o08Zcbl+NZ3Tnh0Ah
         m4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548063; x=1795152863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
        b=XTe/ebS/PNvAmfl4Fh2dZ022Cf/0rvbLNluszEtJba0EdVZl+YwdXZ6MpzrO0FYqEY
         NTn5BC5M6jANODdP6EwbA1vAhHq5fJZsxzuAcO/lorrzVotRSuq0D0vyK/jBKsdENkZo
         J+GVSQVEwqLS2o0c3/2eIZlLQM8FU07/mPwscnrKTLBvCs39WjSRGgseDjpqnDo/tj/t
         058KzZxpnQvWz/PrWZaPBUfz2r+hSM9Et9jDxT3CJC0IoK2N2hG9UvR6vh/07/C4MDfr
         x5b6DPepeX3+LlrvucscbE8M75peLVL2XseEXj8GKA7vwDKB7gcu9j7Fa5UPT3rvT47T
         0icQ==
X-Forwarded-Encrypted: i=1; AL+hErEQLwKHf62MHsQko1dO1azpmnr5b/f3bIOnC3xT8N3U+N2WMZAfXpss1ZR9TUpbmm1NIGNUl0/UVJbr@vger.kernel.org
X-Gm-Message-State: APuU4Z/JtfY2Ub7P9rsfBSKDtUqF5I8IsRZaSjz9PJW/PvIzL+ZBIAjk
	li7z77yc0EeHRKt/hVW3ogMHnNAO0M25/ta+7rSUIcC2YNVtGxt1JHcecb3fixikRB7FnsltXk/
	rAK+hEoZkL8RdcYnXPoudJ31xVXaEhuUQx536mr0jcsH8r9jNy444mQzyJefMGSCD
X-Gm-Gg: AYBFou0NF1FPA5f2H+p9YgRVlUEljgDgyhSdBz0yatDS2vigekcx5ksp4DQ9v9LesAy
	vSvkP6wJPHXc5LwqCs4TSU+AgF+zTh4wstahLxSW5BnSyVuiFgrS8IGHWC84sqqbEfLIy8bYdaC
	oYGQ+aM/3m7JEz26TsVQLnxVPY3cyv4UN+LwKM/FWGjtuDHBpl1IO3EQ+l1OjswyrYPEcBVjsul
	yxEv9UFLrmmZE51BcTdEXettgAXMvh8ItzKyAk6oUh2Q6ganxA8fPdb+ufzrdTTaMAgFN8Jclr2
	2aQ9cVRnRTKIqmclCC7hmAze3x7MjfRFD1QBzrVOVx0mV0YZL4avzjfa+g1SwM7Ig//gBF8jR9k
	wvrLGGzjKFEdhXUsQ9bU/a3dxZ+vj8qZ+jOs5xDT2Yu7Fcmaile8yy7XQUFjXJxGDie/bknS6GJ
	Z6NriojRMOb5nhjmKbtrEKw27chg0+Ywe5sKQDvBHv4THdMeY//lXIs7gMd+VA
X-Received: by 2002:a05:6871:2e96:b0:4a6:d447:c07d with SMTP id 586e51a60fabf-4afdf2a858fmr1846698fac.11.1794548062829;
        Thu, 12 Nov 2026 21:34:22 -0800 (PST)
X-Received: by 2002:a05:6871:2e96:b0:4a6:d447:c07d with SMTP id 586e51a60fabf-4afdf2a858fmr1846679fac.11.1794548062344;
        Thu, 12 Nov 2026 21:34:22 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:21 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:46 -0800
Subject: [PATCH v25 14/15] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-kaanapali-camss-v25-14-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX0gljLPrtlXM6
 T7mCk4tRerJG1KSOgtMiTiqtJwt1TEQsQLJldOeLMtwPFi84ICoW9rM45Hnu0UwvFFkyEf3gB1l
 uk9VVUm49fGqTJBJFJa9iqycEHXaHv/dMm453WnoY5lPLeUibVjns5ZO0bG92A8CMyodgrt/20p
 NgXBfnlZHDUkswEHVJ6Cv42VsPLw5Lcyfu0LsS+I/W0hdvJm9LVnt0jt4ib4fu9FrcR5RrSjWSd
 R8/Qq3qtRztQKB5ROsPCEvZ5aZwgexkKkdO+KFIKrGmgIU6ULbzse8QqwwAnYcvgST8N/NbNsdG
 353qUlTQsAl0TKoI87gXzu98YxcYhKpbVgKCEGkvI5oJA/+Ng0t7/ZwDh2fkhyQw9RxXQDw0aux
 Gk5fHZf6AfpSYP8ff7DmXC38tkJNj214DOXA3g27GykoBcALKVaJHyIKWHvsJmbe8PcQag31UTW
 brzkteC27WPR2m1BbVA==
X-Proofpoint-GUID: pLtYnGmi7IDEezfvAwZi86RUqa9RFAMH
X-Proofpoint-ORIG-GUID: pLtYnGmi7IDEezfvAwZi86RUqa9RFAMH
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af6a160 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX1cA6cyqAdIbC
 pRNLiYwS5dn2ZNwabY1Fq1//iyhhEa9ecUpd1tqdyox8acmpxixOaD3YPUSti0bHHuJjHWFVLIQ
 h++eWXs8UZZwmKqqxjY7OYUtY1AQtBM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 1662ebdfe729..3c9c97a553a2 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4663,6 +4663,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1


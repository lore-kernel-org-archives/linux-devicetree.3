Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383527;
	b=wDjV+mkzTowU941XxkohyFHUPMzW+HhCvtV0c9X2Zp2m+XY7tGqtBDi77yAkMzpcQJmQ
	 0ZPgdjSiFYTq9iu3EDO3g1aMtOqgbnQMVKlbQcEd0VkJqgk4cOd49JS9zFjR+WNVgKXE6
	 sV8jL1AKPCbw4zcmrTTowrzEhq97OHUgdxpNZCq4uNwerq2l5KOv0fgIdO4FC3teSTc0F
	 Ze0riWwUPRQhQYbOW3IoCN6HlXULQd2TNrYgGniBsSS3StxfxGIJhsQlCL/IPqPETl5wj
	 xzLQCNhsrIar6W3fDrgEh8yo8apnf+g87Cg4Eu+VbbIjZA5XkHfI1KjT0viDg2L5WUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
	b=f3ueuB9I6Mm49+WE+mcFjuscKpJq/a1Qkg60Tzy+Ytdjqa8LiB0P3GuF/QqzB2DfKYSy
	 ic8k3hf6Tk3borQfTf262c1Kf1kSG3cqBYvVfMJI3L0jD21azeKt1MqZlWKn2LbP7bBuI
	 QLgPm1zwRnzh2i5yQin51aUppBTbMYx1Apel2HT+rCEDQ6mgTmzuArx0iFkL6OtsOf+XM
	 9p/atD4A8hwLncDkZfQGsnGfdZlv6sAMgagqsGxUZhhXxgV8Ra6qq5PILmoFZHBMkS2RC
	 IOBgjPky3gFzKNCRhwWVHURP4MIHAEB92Gwn+vefKacfK/YSXZVpJq1EPLAta6GvA+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+FRo4A0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QcYZWk9k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7467E606A320
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7467E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+FRo4A0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QcYZWk9k
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KEVb1409027
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o1w2HYl6UPI
	FbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=; b=M+FRo4A0Z6U2HAu1y98V4BL9JKj
	wKbY7OV0xh95urDzjaDLCxdtG76wC2X7SvWLesGlwvECh5Cv8sRTl6tQRSBSPib8
	2Yuv3PaZ2FkRqI8BZrbCMUoquiBdQuyJOAXHcY4w7piEosl23/OdBRzYeVS87UYP
	lvnA/WNcZxGZP0GjaLGqyQak80oO4hUwPtPfh1dRGO122+jWTXd8zdy0xS/dAVkl
	tDpkQ94pwIQPAfK/i8zjdD2GbfRuxDNh/wEoTyoupO+VzFXtB6Dihm4PbraQUN+w
	FIQllO5ckdfhh5/IIAZv9I+t1LsBqUf6xO2S4eKxf2p9amAlkUDuS/TukUg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdguw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so6096431eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383526; x=1794988326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
        b=QcYZWk9kYIquQpTleXGJ2NjTdM89PwBSMrdKGX3pIT5nd5E5ersO9dwGipaNPzKvsx
         SKOowJV5OEj8IGaz0KfkbkEKfTyjBv5V8ZouOa6FTSV5sYOrmhSWmZNRcm/IcC2yCEX2
         WsGk1UFM8GoH5+ZT5ppqW6ef/OkquMCt6rTFhDJQLOeVHWvbKrkl5H/vpNjLVayqbY1S
         PhDuK8PaNS4sjElULo34/9ZR8mBRq+RaVNpAp0+/XSqHj5E3oi0HBpgXoMnN9knNEkZm
         3u81u8UG2NIOvB8/Q/Mx4fV497IRWx+S2Rbf3Xxs2Y44B+LcUH1Xv+zaSDnIjmpS4f0r
         HYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383526; x=1794988326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
        b=AD1laST7Jq+SpGeGx9fivLctlucbbpXTT+mGRMbEPg5KKThPJrB2o3w8UpWz1NWxO6
         IeD9c+70Ck/nzzOw/u4ix+K4ADJ2x18jNjO6fa/qVnqe8inA3uGPZJvnUl+WDgZ0Dc3g
         /IZbXE8RO401bBHsrRBGAG3zlP7quldtTM142StlaymO0csBEzWKTVdqxvNfTFZip1o8
         PkBgKzJAgO71aJkTmXNMnf4M3JQRpmD+358+3P4osgTLiDvXscxntU3ZnIGbA4nT/wnq
         +f47L5aL5aiBZPCyFiBSvG24pVvPKHva7lDzcXJuWQ/mDC+/YBjJKNWbYIEYB2kEW3RY
         5Xsw==
X-Forwarded-Encrypted: i=1; AL+hErGZ6KoShCa+eRUz8BQoPa4ep5a+G54+BebZF5XEC7qabIRx3x7fF2UHw235G2D6TQUUW2GIYmrCyKWv@vger.kernel.org
X-Gm-Message-State: APuU4Z9145Sn3ZG6OlHtQ7NmPZl2if9hYOL1ob2eAqb8eVRfVNsLI31Q
	W5y4KqCxsYfECu2TYty0KrCvfmaSVoZ0AQX1u0kk0INH4COCUCJeMFAJqZFuWQAZMHrjUFcj0mN
	bZkQa1XM/FkKa6klOm2lqfvyzIDuLd1TBUIo4zsjrMCXZaOURd5D6SQGrIuQkvwWpLkiclgZV
X-Gm-Gg: AYBFou2aWpb1ogX2/8OrK3fcDLB4y5FfEv/2emtIkmk/h2eW2dlamYtEB8CBast/sKe
	rKcJCzNwBGkkr7pJpdq9R+YE3Zj3WBOhDTjnA2+LGL5441sKDDFOepKn0lKCoOOI6c7Uv1kTzHT
	7RF8wdEveO5hLPt54rneKQAeg4+ihLQdSfxBoaCRhEdEkmDH6FVeiBFGRr9wdE4uZmRzQxfTpCA
	dJ96ThoWZpKZ6Z5qtiIfYH6mVwHLZmZHvZ8FPZNhtt3IE/80Wp/jAEjTaup44hAbtaRYwzBv1qH
	FoYqZS3uOwX1goXpW4SNVRMzvO/sto21zgujHhg4LnDuPoGICnH8SAZ/uMJ/o9NX35iPxpO0oO/
	hW+Dh+EjN2MKJVjLcCRDKDuNZqLKZ6adG/IOthIrR/BLWwjFHKPQOvVz5l0omc3lavWFvBA3Ra4
	tV9xGXB123GQrvTMZUL6u6T+s8lBEGips9
X-Received: by 2002:a05:693c:60cd:b0:369:f18f:3492 with SMTP id 5a478bee46e88-37686d38d9dmr2892284eec.35.1794383526182;
        Tue, 10 Nov 2026 23:52:06 -0800 (PST)
X-Received: by 2002:a05:693c:60cd:b0:369:f18f:3492 with SMTP id 5a478bee46e88-37686d38d9dmr2892249eec.35.1794383525526;
        Tue, 10 Nov 2026 23:52:05 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:05 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 2/7] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
Date: Wed, 11 Nov 2026 15:51:36 +0800
Message-ID: <20261111075141.3710366-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af41ea6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=f6-OUQb2phOXiqkgZ7QA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: tGW9WsbKnhboqFIsrnG-EkZC4dX9nzIL
X-Proofpoint-GUID: tGW9WsbKnhboqFIsrnG-EkZC4dX9nzIL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX5SEjdLNxtKzP
 k5uW7dFIRyLpyWru+fcaPjWQbyciPh6SYqvIGYG02O2uiVtYauheVCCSYmRzQxefZzbult8RM3d
 krcPUZkSfr/48EFm9X6rbmVxO+hQRd6gFjeo14DQhsnomVuXobwxXl+hv+Ssy9RmoeNje4dkCNo
 g0ExThKu8/4ku4ewFdt2ZnOIhBSkQAjKIC11PqWIMYUg4xVd452dWhI49+KZobH+ACwdnyRVHAg
 75a2wkabmHxun8Vcr5El9j7fZuw/f2gati1kj+KfCN8Am3Jd1fehHa7RXBrUuON9getylYLVneT
 CHLTfKmwIwLI6PphPk1GUfX4dX3ivcaVp9tNoDnArsIK1EPbhRkSI2xWR/4x/aKO+BxTdIAxqWB
 wLl314ezFFarluKZPFvafLSqqMcJXDpljQ82TETWE5BePsbEWPKta7SytJDNXWg7LbicA+LNCC9
 uKAKZWbB/fXYarbyvkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX+epzsrI8Xx4c
 X0Xox+dF6mTs1V9BOIsCjrD8BN7UpJtXTm23CUwSmSf4xgshfh3uqvyVvGIcINLpqDkflVDg9lm
 SRK84V1zNnkiFBW3gz8exCl/J1LihNM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Robotics Reference Design board routes all four PCIe links, so
enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
rails, and describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..98dab85de64d 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -377,6 +377,55 @@ rtc@32 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l2e_0p9>;
+	vdda-pll-c-supply = <&vreg_l2e_0p9>;
+	vdda-pll-d-supply = <&vreg_l2e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0


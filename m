Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456707;
	b=YsNizYW1A8q/fAgyC7JD1XRlEV/ROJvbJQXaUx0d/GAKzA/W3sVPpRzoLRdYjg6oGvO5
	 zp8vHhXnJnJCLjSEsxCBh2pY4vmyCddHO7cjpz7rMcx3BrSafgFu62jdg1wj1v6V20De1
	 djUHAs6hghRbzAsrQWGQ0qZhNzoaBlE5zIqOuiwQCFZP26znLPVW0RfEGZ4/nSt1REbDm
	 L3a9RF8B6A7Vegl9dYJjzdE+GJsNbQH7nC3pWNNzVDHAW4tB77p0StIiBQppwTWh2RXJJ
	 H/rRZBza1pTpPKAX/b3wY3IJCpoMh8n8Ak5euqkKxzphnG/g1bsyNu6i5lbT91gWSLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456707;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
	b=QYIdThYfYSpMXSXEz2yvvEUPzpxPXNg3grBhf1HIQytHMEZ7I9VO1LkapMnCEecDizVa
	 eIxtba901pzXhBdoWyPlCepRVvr7SZKW4p5CCIHQfnR7QbMjWSN6/o+DrsLaLze/wpHVS
	 8EPXIBdOSuIICOME6FtdlRBJi6NwrzwaD6JcWvRXe44zAGz4uWtIdQlQtu6QK5vKTDi/j
	 NjbfD3xrKGmlGrGJzZPPeAeoD4lYgGJyceAauHhvBzcb2QyOit7KO40+CfYSEfCNyklpC
	 /l2lAjTLN/Mg5nmL1lxzK/LkMl+3zO9TQmCOydbIz7nlyuP7PMUwAa59JNiu1ucPkmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ef3ys/2o";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UlvFPOUQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAED606A324
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BAED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ef3ys/2o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UlvFPOUQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD03eW1630792
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o1w2HYl6UPI
	FbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=; b=ef3ys/2o87hOkBkLcAx4GZDDy+6
	vobol+me2DLX3VTP0cYgZoHY2yjMSodMRqsBhCXNDuyY7QSVW4ojLwRg/DbuOTgU
	yO4MdFagWA20OFrBa2FE85hWWhUwt6vFqe5xAMjvIX/cVCFM688KFrmHRu/mocz6
	TDb0b3tqBGgRF3wRbzcQGkNvT9kp5D1NoFTR0rR7hzR2f7iBadyKKCDiCqtNzyi1
	txGXsSdYKwHje1YNTmKPp+3WcP0oJMGAq0j8vLpyjLrNesHsamkxXloSUdo+rI0V
	zjNJcNz4DJpbHuTWkxyDPD7+IUTOQe1iBYokiAXVFOmwgUtB4Lf1QxPBjaA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93eh64u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3092613eec.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456705; x=1794061505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
        b=UlvFPOUQbxfIyysht7op5WcLBgEwQf2qpe74PBKBeds8K7jnmarDqDRFcFz2Z0Ad1q
         QeVi3CsyOBBX60Osmo3gOHjp3iH8fMq/pq9tdpULovLcTXzObiBa84Y7adQYZhxq85Ie
         0l/Yxn3cOZ6q9I0S3V2foYQqlTsA8HH3bzwj+i2FxuCzCUmZFj/0URJLgtFeaQrmSowE
         hkUwIbWN0mbIc0m56czG/YG5HO/dbwEJE5qrgUpEVWxJNuiu9pLR23J7+VVCbpwn3XGd
         3nSWVvqFPNvlr7IfWaqZh+5eyNk80auuZ+EYrZ2RjfJ450KwUb6IXGMx+b5D4rM2Jj+4
         TgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456705; x=1794061505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
        b=BzGaWNSSyNEo5RorouNzcEoSOK1sMaFWInQmi8wADcylRxmmnhNxQQ0WzyS27ERW24
         8TrXTI1TzEZxA4E6DYk42EH36W3qKiuupeXSiUdFsPq0J+awEso4DeV9OuNam/XOrSf6
         Min7ggyGpA1Ucn+mRKqfUHbKt0qO4Mut61sDSUl9EOleMJo68Lk3bSkZeXxlhMq/KsSA
         CCbwXoQFj9xlnJbkx+f48A3qViHasQu9hL6HDJtRGerWT4blvwp7BIlB/XcUH8K27NQf
         x/hT46CoUeiMi4M4HHl1ojfb2yevOSQl8nqEjBxCdrhfJQ856ommnAFq36Y8iixay3eE
         UaRA==
X-Forwarded-Encrypted: i=1; AKwUvBxN5arqLjkm5OOYjsYOitoStlwK6qNtPfGA9uQ9hXUKZ2v6CiADvvUgDSJu+7gRFEviDKn1njdFn31I@vger.kernel.org
X-Gm-Message-State: AFq9FYLijCah9YcD3jP7xyam0675YSOtNWZ52jUnxpmkNHflHaKfjKkz
	jkLwrgJYU9YWdKwfAAlKri9Jt3oEjUm3Fa2IsLSuXMQVJ8SfxF+aRnR1OtAZ2uEm9wbLXjS/iVO
	/aEzBtH+haCehsVLktSBsGvQN33q47NRcvAsilupa1YPfDWMnxLGxjFQoGxY8kdf0
X-Gm-Gg: AYBFou2R6W0OgoYHFC8LSXHXRs95SKSu7D8SpfdorEjLMx6LE7NAgALXkaJ1PrhpoxJ
	NjQgxhWC+LEYDGpH02PovS1+KwH4FJSi1wKNgCHqUC8h21/+qIf4njvFXeUlEKN00H5oMMg+nUz
	FRe3wJS47MeqdeU9v/2+c96NPZMB69nRmd3qSV1W0e5/6DOkxGO+7UdeRX/K1+XdC+bf25ydi9d
	OgBfV3tmKSoMBJWktOtkjK28gVdgrOnxuAT1/go3B/mGIKqonTr9yz6QEW7wAdLPLF2ygQTANq9
	NFMWD/WkQyGkl2LnnGHFNZOlL5QeOXLqYYNkAs60YXGxKRrp75qCgXfiWazqaCTL7VK67Y3rzq0
	3fYNysivYAfiDe0VpZC5FkNVyAHVN6Xz0qWAXDtl+jEpZ5pc1F8hvvN2SX0BiusZMJF0LHrDxrE
	29rMXIyuZJCXZOYjSHqJ0Vpo2MILOe/Mlj
X-Received: by 2002:a05:7301:1927:b0:35f:5591:e40c with SMTP id 5a478bee46e88-36a4240cafbmr7991000eec.22.1793456705068;
        Sat, 31 Oct 2026 07:25:05 -0700 (PDT)
X-Received: by 2002:a05:7301:1927:b0:35f:5591:e40c with SMTP id 5a478bee46e88-36a4240cafbmr7990958eec.22.1793456704233;
        Sat, 31 Oct 2026 07:25:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:03 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: [PATCH RFC v4 2/7] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
Date: Sat, 31 Oct 2026 22:24:28 +0800
Message-ID: <20261031142433.1212809-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX21G2Qz0ectj6
 +NqzGRyyZZXO0iLmKW4Z9Iuz7cB2Cg6Kr+FYLarQtr4J4lM64kXEsCoQ8BR+Av5EIc9l5Gkqx/Z
 0NxCDcZAnYQC1lqPk2jCHvXMNEWK2peOy2fBEvt/1Ydrev1Sv6PKkG9bf9gh+fiuGmbUcdIy8/x
 oAZZuKQ8RBO7JdwFDg9jMATOyjc1Q+9xFjiJeDnqHyKujt1tR9v6Xe36pzpXY+RlliOYF+HEEn/
 5Nvk1YYJornP5QGDTbG8UhOpxNyXK8bxS5pcLhsLDMi5TG5gAY29Zt6+nVCphLyqPPQdj3MSMnE
 bq7w1SKZ2MpUTZy1XNV1R6zOb/lkddN00r74GyRXCt+F1qftaxI3X++ovEI0p+ocUYxBGRv84Ml
 NNliQg/Ppi2FtVzC4+U7cojm4OT0Vom7jPPimP/lTM/4uUebVBfL46YDzUzf9ecxtIHiCFwaZj4
 eaclJAI5P72KwPIPeqA==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae5fa41 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=f6-OUQb2phOXiqkgZ7QA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: rJjdKRJ9w08i9FX0JDn4cZg2po1z7mVx
X-Proofpoint-GUID: rJjdKRJ9w08i9FX0JDn4cZg2po1z7mVx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX21MoNjbAFlne
 F3isAPM7j0G4xyNja719dJL+HxTsHzU/ncPTMjhxtyBiTAWmyW1jy2LTKYJSEA7jhhlJ5amHDUf
 MhUQto6qId+HFuprNnC41rYCcD6KDz4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

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


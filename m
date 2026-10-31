Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456711;
	b=YYRrV6ZVAMHET3qIVPAKX2Kr0Q55JMpmsLu6/1S3RdUdN9MWsGQ1iT26lruD5KirIrkx
	 V9w7fBIt1fXQRDAJS2sAdsg5z4fab6IKUtsvk1o9qZzUMPsXYEoEC+sVLnhJeSRWyUAfU
	 tXEcPN8Aonf+zsFU21f5GVXqHpj5lSma3QlJD9Gs3HK7NyHqziCEKPmXvuVmf7yCQls35
	 cwA+OeFsZZyjv3QSdzNS06oe8uD/9bceeTT3xNCH6cePwz+wCBqnaun+ZslUWfmK3aiNs
	 DAqsmGpU/cIcCgvbYZe8Mk4Ywzz143N/j2fgd/7vq9hpwZZnJGnRTUpI8x+cWqn2MZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
	b=xnvAhcLA4VoZAh3l8jJEfKGTMYYfWTfVDcOOTP54XZE3ov7H+HEJGzR7Mf0IYVLBOPf9
	 YfCh4wFEsuSQfT4g04wMc3ngJrZdH4jxmgI7huhRBSTkNjLwWizRfe5kZWRKklGjgqqSQ
	 0F6UxkU/aqpdAuSPQR3srKmSK68QgmL1bdvdpfzvV3xxd65Epfx5cjnPfUkrHHLl5DZh1
	 jFxDPSvjH1CTCJsrPy7q1V3as9eAd7bxie3yqvqotnhO2x4Jm4aIbTClNCqSlPH3SncAF
	 fvCOZ5nqBlwjOWXAkszyJ0wAi9mUZjbxBMyHe97q2inqVLPkcICue3HveZ7yTbweWLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODwIZ6ph;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnwBjjS5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21449606A329
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21449606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODwIZ6ph;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnwBjjS5
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0bBc1632299
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xvXRY7fo9j2
	LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=; b=ODwIZ6phT6LtfDVX1vhVpeiKO21
	eNHpum0+d4r+xzmEd+9OwwLifAXXWudMWQgUTOv5BwztCvHOwC4HIuZn+x9yYa5c
	NZ5yIdHo9YygzjMLi6tCBk4llPBOsGtHPZh4d0RS34psRR13Gmx+UtVgXsIPKeY6
	doGDNs2/2yUYEbmhifYl3NM1ipjdgOgfzOjIsDgzp63SM/9QtMvnBVUC/QSXFExb
	09ePabfmxNK31FvkjnoUdxPLPKnmrzUNrMNjmo7Oajv/8N+SMax0fGwbvxpmxbxt
	qJAnTZKgzLjxF+7ggSSYj2XKP+ulzMeezhTSyJTnvK62uu0MDf8FYhErJgQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93eh651-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so6960321eec.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456710; x=1794061510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=fnwBjjS5s0vxwo/QeLgAI8K1c3CM0hANI1zsbkC0Khei9h/nVmI3Y3HSmarjuOQScs
         RSFu8zj39D8CpqMQvyHqTz0Q/mumDjVfgEFlAHb+w/lUkJq9KXumr3+UVNrYkasUL50T
         Qm+cXli+qL+N7Ea1aVMWJlfxSqQvIQpOrMFHVyrYOvWx5zHOLj1Az0s336XOLax0p2Rm
         Vg2YoLdb3s9lSBR2ZXjtDdFkGBNWg2ZwgWuZc2kieDyiO81VRr7+DBU/pChSsldhMfV0
         AzqiG50Z+ob6G4Oqzj/ZnxVZ6estLOYiCe8PzJ/l5QVG7oEAezHOfZz9z1ymmsWY0J3v
         Xsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456710; x=1794061510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=qvZQ8s0Q9VjpwWbKtX55wWKiMmXaYng734pNFLqyZsovXVJ4oZSxZiZN+Zz3MNi1m5
         XEdV+5rgk9uJajnIRWTf60uI3kP3iKkedXjsx9H7b7fdYMxGT7auSWSDXpMa1J7+yCjT
         GBKCviZXuLuLsH/dd1c9EC9PrOjKQcjpcjwvbL6UbPwtB0hXwDNlAMmvTU/Q8AnmOTFD
         dXyQ/P5Si7Z2/nwnk9GlI2tUDg0atnPl2e0zaMGfer5I/qpqFTL6OyQ1cduE6LHUgeR9
         4tB2/ChuhsidDmldPEIvHGbXe8nXrgZogbKuQPi45gShJH8+pkQuMA71m29m/pU6cvOd
         mROA==
X-Forwarded-Encrypted: i=1; AKwUvBzawJNFmNIwldkHdLSDcM/4r7ogB2yRxRXtJ2kZbqzbGrVI1j44MLjdCqJsWdrEmqeRGAduiHD3ABQp@vger.kernel.org
X-Gm-Message-State: AFq9FYJcI9PGrZrno0yBLbpVjurIATu9kWZrxP61dXyCpK8tNXtlSAYf
	4QaWY+CkmFqbcE8BHrtD0FmpPMNm6gh/Z/Od/vu4n35OK1asPGfu4x/25CuNLHn7OrUQZ5GgCsU
	i0SH1BBAtjC8YnPoKBCgy3/mCEFBYuCXqMQ9F/Vv1eevCBTxZ6k+szrbiW3OQKQmc
X-Gm-Gg: AYBFou2Xc9S2pv+1ELTqc1YLZVL2C9xZW0XXieJN2V3hYl3u2tvwX7sNqG5/SOkF/RN
	fliuX3RC46j/Oejrj3oafb6bJxGkv8IbLqSnWAbUnD2K9O+3elA4DfRPCnsGmcNS97is4icYCwe
	mz8t7V/GUVKiroA6o8NNslnq59NpAYlF4kR3zKuU3kXNxpZpolWmvekjfWLd++kU6LrFRxdvHGE
	jS8gUbmOCL+88ryMp6VlKjzIN5W3Ki1ruZHERd6ARIGNgxGQcoVF79t/Oe/3TyJgAbB5cEL1Y99
	4ZoZlvAsAHNeikmJ8XRnqGx9Y+yHCQDbPjROEJh/6wNVfH50VMin/yxBSIybK9fei4fiFMyYaZ0
	EPty0SMAGoPDVyWzcfnvJ8I7b/Rqv7a1WC10nV1I+Ky6D3KdQJloKPF/Q0P1tX+bcz/nHlIc6Xj
	XuGNlA4NM+pwff3OtAN2uklgOxTiI+8SWJ
X-Received: by 2002:a05:7301:e0cd:b0:35c:707b:acba with SMTP id 5a478bee46e88-36a4220406emr7675990eec.3.1793456709473;
        Sat, 31 Oct 2026 07:25:09 -0700 (PDT)
X-Received: by 2002:a05:7301:e0cd:b0:35c:707b:acba with SMTP id 5a478bee46e88-36a4220406emr7675939eec.3.1793456708748;
        Sat, 31 Oct 2026 07:25:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:08 -0700 (PDT)
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
Subject: [PATCH RFC v4 3/7] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
Date: Sat, 31 Oct 2026 22:24:29 +0800
Message-ID: <20261031142433.1212809-4-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX91osj1jhqAbf
 iH+yFFG7SuNU1mZspJ8JDvTWdRw/juTdvKfdMa3ocMvJznFFApJfhjOMs0t5UoKVybZT6v8Tk3+
 iLs57RaJ8QhaU6jR7HPtr6pobmx7WNksRUVOIArCMo+akZI+lH2tjol5S29/GtS3N14YoICuxw3
 v3y0ePLAgOKJKRcMVje28u+mzut4814Cw2j2JvvI1GL2V46Vcd+4RFGHwyU3tTh7pqSda2vSEsY
 gHGODucMZjPXw9kwYKkrk4H9vSMziTeyEfIjD7aLK21Rf5l3hakS90oHsl5D10Ppp2gCN4ZcjbE
 MIG4ZhYDklaLNNB+ZU/A1QV4EKAt7WCQwFcupnFWm/g5hCVrUGE6dc8iXUqF5FO8MQ0RjSZSszZ
 +Z6lGvPrGOZ+yzzGchXwhMny4Vf/pYI49EynRdkYEGSHGq5euy1jQ8c/b6vT2XOexlmD2Wq/vD+
 sDnnGUbFVtg6klDxK2g==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae5fa46 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ccc3-NsNM3ZFeKEqOdcA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Csq6K3HHuIdXGD84W6pPxtCFDF-d0zcp
X-Proofpoint-GUID: Csq6K3HHuIdXGD84W6pPxtCFDF-d0zcp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfXwvQYo5qRayLw
 +IHIID1z4XVIEi/GGBXTAceYrrwh1vi4PZ9KHTTPZAQMtkdM1fBzuHuoE2L61eqBb7xJ3fn6HEo
 pKX029wxucZ14d7LPsMOE876EBB9hg0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Ride Embedded board routes all four PCIe links, so enable
pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..cf760ec41727 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103863;
	b=w6GrNz7fVoJA3PHuh0nom9LwDKQquau13RMckj5+xxmuVYJ4e4rR6/HtUidrsm4XQJL2
	 z24hF9uuaUAunjUFJ1NS2B1n8WyM8vaf4FHBoM9SNaeHAkYaeXG0XAtO9olMk1rWYFMrx
	 /an1452NmdeKosU3j4RVx5QCchxUNyINFXll69KNo5C06IX1IFxk0uFPQ1pRmuDgrqvUc
	 NCGmE20UC0FiqLDz7TWEEyECbj7+C2pckqTREIvFa2XGJaq3UFYg77qRUUSZCG4dpxfK6
	 7TVHQzgnBYa2MGmBnH/Yj/xJrfJOpccL+q9JtpZ8ZCZvvX+qt+c+uPGqT8J5xjsq6eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6WgwcQf5t6lQQ=;
	b=MQF3gT/xN9KGOwu1axjs+PI/RVtLIS8D4j1lOfTj1ANB399PBZ/zejIG69l9fUsAgSbV
	 xxY8zvjSLrN77W+PzEYYFHLsllQxGq1NvcPWxM94xdOazzXw6arMKhLNy4YX+nB/WlRh4
	 j1jb8SBcuQfgJ2HZcO8nR9Y31uZe/a8YSFI8cQzl9zA6RTFcrq0wIRRr++15O/DfMqesi
	 R4MjA+oPjNYnJ3rXaRMukArWQbNKsV7gdnkkKZ9rIpQALoDJuqqjRVuAC+7l2z8YqcjmF
	 tbcpymfyUAj0ve78e2xSmf6ei+lxDMqLG4OnRBCtJE10lB2cWLUBLJhdJ6CqGvARkMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=icyvtZJs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K28xqHHF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFFD606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFFD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=icyvtZJs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K28xqHHF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3h02524812
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6Wgwc
	Qf5t6lQQ=; b=icyvtZJsXjhz4DrqgWgbg18tiZ4ZjKbjJehTK127sa7yDnBhw8T
	TT2vUD+9D4R+KUfZ1buGBYySWnFAK6M5XRTXDMDbBc8Ut1Wx/OhJtWnNF1EU+ko3
	EP2az9xPWSHC3jok5bgSMy8wUsGBAXZHQBcpC8N3Z2j0TPfJl/RGEulayOhJHbeT
	+aYHFJ1vKWwQ4gyaWMqTNXOBcHtrBEG2ONpEYe8KJPHgOref4mkxl/mLjkToiuCj
	JGu/cjxDG6yzJXTYF4AGsOO1TrviSW68sZzwzqL8D8G3zcjBhLEV8lPipsKIPIK+
	J+lUQR42D3qZp+7z5OA/I7W/LLhp65eoASA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw211ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:24:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so6520287eec.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103861; x=1793708661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6WgwcQf5t6lQQ=;
        b=K28xqHHFRg7JuUVFsoYOm50N3s8Yo3B0Kau0JTJukErl3LxGirWHqHaPFlLpY+Edlx
         iESYyKO8ZHamHnGiU8p2GyimNy6DdmYRd1H3xTguMtmxrz0xzSC4ex/H27r2nOgukGRE
         RpXx31UXHdcmG2pctXXuMldiekGKKK8omH2nSruNbG5yfcmayQpFwoYOwazEyPco2XvS
         AU6A+Atus3zYoYwq4ZGQ7oZHsaux1v/OGgPsY8K4G4T1qSr0X0NCVVLJT6bgRFVeZino
         1CXcSK5bAW88wUw+P5NVmc8TWGJY+CudMXrwkIlvWFTLEtbwolaJogTryJkifzR0W7HW
         ev9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103861; x=1793708661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6WgwcQf5t6lQQ=;
        b=xfTDcTeswzhx1KajPxRV2Z4yiHHjErMDwYoCYWVc9nhNSAJNYWHmzBaGwDpAgjoY66
         RjgVjdZnGmVq4HJlQzM1kt8jxDtr24ZDtV032iltABR2epHrAp5fu8He6Uc/EWT2UQcL
         xDsCKagSC0BjWUXqhzSl3m/7DXsesD0cew8qz5c4qwslHOHzCj3cQy0IBG07xpp7Lkv8
         iIAE46jSC6p5BScri49zxlVXueW9EfLKjtAa1G9JtarB1lllIg9oLRBJg+ur7L4LVpUi
         0colQtWESdCxPJ4gYOXVSqk+tyGGmuGguHh8L/soW+OzqtA7nqT1WCPBLxs1sfN2ZVUL
         waKw==
X-Forwarded-Encrypted: i=1; AKwUvBzlQ17+N5ZC5xlaVNG/htPHB84gcvaKkL2X3gspq0RFHB2ouxsMDLJVaO2NAMql1CCi36/VyRputEKG@vger.kernel.org
X-Gm-Message-State: AFq9FYLu+/3mSuk2P1E0lrOofyKtoDPcvnd+3RepPlVC9dU3lR66QGmp
	VPTlHgmRm/uwLcZa8oUaaj5ofgrpONfh5nRFKU1cAlh7NQxPr35CbpxbkiDzhyFgmqJF4FE4esG
	49Z0sBTd6nVexBEG8EP7jS2GdIJZKIXWw+F9vZd6gJll5VRhafIlX0WC2ypbIkK2f
X-Gm-Gg: AYBFou2+mIw5Ar3S58KfHhJZL3+MXHkvvsmGnfs4/NZg+7LIvPmJx0l78XMFIY0jXer
	7coO4rDNu73RNspKwy98JrwBRSHzbDNyS0p5t3ssFQVu0n3FGrRka/tGCypoITtuPEZUPEVqyyj
	r8/VNadsrl8fxbuyCM/QkDd4khVnXGkHrwyZroGIE3DCDYzB6MFTzWM3amk8aHpZCSHc4ElTFxK
	+ZNeYXSifhs9BnaMTfmCSoEFAN8aJjMVRoDrrP/ZZn1QRL1pQeK+zyaCwKwQovetf2hjx4XsVJk
	JzbmdQ1U5ucv/zz3Wc4n11vstEs3wcsQD4/bWizVX7PBekJ8smJaq1ZLYMbxkX56B26mynoipQ7
	MhjhC/BQQg9y/zh8BKJ5ame+Gcm2U0O/RuIdmT72afN1swI8V
X-Received: by 2002:a05:7300:fc0f:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-369e845b068mr15222627eec.7.1793103860854;
        Tue, 27 Oct 2026 05:24:20 -0700 (PDT)
X-Received: by 2002:a05:7300:fc0f:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-369e845b068mr15222589eec.7.1793103860223;
        Tue, 27 Oct 2026 05:24:20 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.66.138])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm32822215eec.18.2026.10.27.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:24:19 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: glymur: Move the PCIe graph nodes to the board DTs
Date: Tue, 27 Oct 2026 13:24:09 +0100
Message-ID: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX7Mk0v6D+3lRm
 wvnAOZSYne+K385cf4T6grHEflshJvbm7ywR81IL+CDnKDPtkAsQIwVf15K4M61liUwMi5ZEBl1
 t5v25rQh/kCt9u/CIe+2SQf0X525KAHob2OLAnlL/+j7mowhagjxqY4mM0oguUcMwSwZ1bjpaKR
 Qq4ZgbEm9tex+1cDpkkbPPnwom79zPXf2whu0IZK+bCPxgFEYX/IxpMI3ETdkycgYC2FdQsJ+yc
 Djc92mO7uAlAvBH3a8A+TRhmEmiRsI8sr8KZCG1vAlEgWn0ShloeKA7ss/5/Cp8NFUORnBxObHu
 gGKc62rBcbsbrbjiGSbG1awTQm/hXqS2xaXY7ROB7BTZnvcycQ/9AFsPOGfYaKREtkSnZ74mVLb
 4odsvEy4t5whw89RmGXWnOt6/1GhReCJdJjGpLQ0x6G+Qrnxdj5T00R0/NCLAuduO9AzgMZUCBu
 +UGi17hMlBVS+MiL3uw==
X-Proofpoint-GUID: ieTS8gElx7DZkJh8LDwhWuyRSei8o3qD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX3y8LK1aRT+I7
 F4BJ3q72iCTp//yMjIk/UwI5oZriRbAjc76RsytCq4sFLGUqMfkEoMf+rIe64xoHDmyT+8fcjZg
 ruwOXa7xsScoWGTiK2ITr59gGJxkSGc=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae097f6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=+eK/VBehCgFHFEY5YUZdYA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=u5-EM3aH4ChXULmVINIA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ieTS8gElx7DZkJh8LDwhWuyRSei8o3qD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270049

glymur.dtsi describes an empty port/endpoint pair under each of the four
PCIe Root Ports. Only the Zenbook A16 connects one of them, to the M.2
Key E wifi connector on pcie4. The remaining three are dead nodes that
no board ever wires up.

These dead nodes add more churn compared to the duplicate nodes added in
the board DTs (when other glymur boards gain connector support), especially
when they get added to other transport nodes such as UART, I2C etc...

So drop the nodes from the SoC dtsi and only describe them in Zenbook A16
DT.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts |  8 +++++---
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 20 -------------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 939e1a927a79..aba1821c9375 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -825,10 +825,12 @@ &pcie4_phy {
 &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-};
 
-&pcie4_port0_ep {
-	remote-endpoint = <&m2_e_pcie_ep>;
+	port {
+		pcie4_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcie5 {
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..e25d4cd3885c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3000,11 +3000,6 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie4_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
@@ -3272,11 +3267,6 @@ pcie5_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie5_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
@@ -3488,11 +3478,6 @@ pcie6_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie6_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
@@ -3758,11 +3743,6 @@ pcie3b_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie3b_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
-- 
2.43.0


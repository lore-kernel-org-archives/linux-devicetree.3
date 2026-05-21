Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCE83FB7F1
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368860; cv=none; b=AwvP2cfMc60jYgj3DqGkwZ70Xc9po7Y0rsN3196Ax2nXfexEG2cvhKV6DDfGEGQDdcVgG91X6euG7TFwTJg2BpL9OE+eXV4cg8QLCFAliyrJLGoX2aDWJS+e8s2j2krnHBlkr1vMoLY/zEcJ6pGBjKx53ZkTS/cavSGgKTouwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368860; c=relaxed/simple;
	bh=grym2NR/kAV0aYecoJf+FpWLScxnZ+YDsJl1+8FBBOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y48oJsi+Zug3esU8KhBmnZWZ2yuVxUsMMAgoo/J/gyopacMq4a1EiHzn4u9sfCaUYA3slccrtiMZzApozH24es6IdFtg2ybo0eoeMD+erFppJCz0+cBoi6D/yZgy3xGoGdQDOQA7Pd0OiecteNsscLQm9yEBliNo4Vy1aKvkrrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoacX8I3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZ77hrEU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoacX8I3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZ77hrEU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99kYr3451336
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=; b=KoacX8I3ycpV2vAN
	5B4X7WVSZwntymC4nt93mz7NAoDbKlrMU00uAZUDmIikXnHpc585f/hBDNqnkfn+
	0RAkkM10jDGnRdYJF7bK885Yv0bVbJiov9nugU54seZHBjbJImoETWuljNNNInOs
	vaeqr3elZZUvIkytjwMPIpsdP7ctK4OyxXR3TE39KJYQn7gVv6A55E3ZMgb6gF+L
	1Ryq9unRkUiLyN0K0dLTB3UxKGk0euhbYmzCgom/Cm701grfMW770Z65Aa+gTXgd
	Yij1u1pBOeeOuCS+scePILYacbHRTXsLiODnDaZuDOl1/CuGMNRMz/CIlMU66Bbt
	0mMFzQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h8xgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so5301630a91.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368857; x=1779973657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=;
        b=HZ77hrEUaacZr7GIB632HsDar99lFgjZShicdgn6jorPqeCeG3V0VElI/WlsQh+uCS
         7MG4beQ9KnO2JCapmWDaIXR8GCpq+jnqql7+hGISeDQvfgANNsdtWY0/2+297absHiJN
         Mqz50khXVEVho3QnPUP6mDMc+SxP2Ne66jawHk4NmN4NFF1LZA/6IcNbmog5JG/y/tSv
         2MGVqzJQBfQ4YjL5LYlQ212yd6GtGGiq94gxE85fbZFygcsHSeq3JzNHN1VtKaFcEHkc
         NoSAJ2HToLwvWX9Gf99UJF7ewMwLhqMhkXDQK04EJhCxjaWEI5VSztnc8jJQfGnniNUx
         OueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368857; x=1779973657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=;
        b=E0r9eLSSzIwvf2TcDaHF3VNp6kvvW4dyCEzIT4b9J1jGnlij5OjMqOtdkYIMK/9xxY
         FhVaHYGucBbt6hAbGanBBPIfdqpuoMi3UNNgVEOt3T+sX/PM4CgiSDPB2G9TeUCdGbO9
         61pit1zBjGXcP3kBSlTxCnyofE0NQoDUCsiWZNSHgVFesOyo5WhmXxMPr4+XwPdRnzIh
         ObvhNKGObyG0GDw8oLA6TRvjoDgT7wAHNE500tqFS6Sc809D0IAQnYP1p9UPLa7+Jmfb
         z+laAAWrs92M9DCQUYSHFrYsByw5+p1D2JC3yD91DXi9y27lITiYB+1+V+ffy1GKIirp
         lvPw==
X-Forwarded-Encrypted: i=1; AFNElJ8yKbvV4MIJpI0Nkzr2TwEKREwPUMvtbo/+TJoYVd8v9GBAHGYBWQocXD9MHDxhvZcUaQKjsWkI7Tbp@vger.kernel.org
X-Gm-Message-State: AOJu0YzHukhRCvkvOmCVXn/T73hosgH6cEnw3fUQ0T7MBk4wTmJ0DJxI
	egKEmTDDxcs5WQB/dzcM+paLm9VqEKf34yxalpWOgRHeWujeA1PphBU8rUP+STfwfVc5LzDkZrU
	yYb8NeyYIqNjpse98TCFlDN0sUrUdFQkDxZNAHGAoBcIHpGNfPx1AstHMwVVr7UfH
X-Gm-Gg: Acq92OEayjvnUcfTWNVnPUrWgUH+Hgt9zI45RkCRYOirHwozjtepah8pUiHWw+d8qTc
	5UU0yqxSHrH3SxxGwi36q/6AevlWz4FY5XdaSZdQNx0OMjWYOh+pdyLACyRx21gmT501SYcV3cd
	SC/KusNSxT50HLFqzfXwuoLU1nvxFOQBVLXOWyFLaOKgpp/iMzQnQcCTlfCajC7Mximns3kbLBn
	HOgvZqPbP8GlBzR/FGdumkMgDkkuIkhYLgs0iIZyp3ke8SiNasgK7Q6n/hzOejKFL+8vGhzUw1V
	zq7jx7zWuxQhNFeUzU+eMDdK3C6so7hp/EWjsbFPurdaOSHOxXCtdcAhI+nNgsYSdynK8PbG+H9
	1/WmVZWjGj/vFQAvr9HEZWenVq21kucoKwYlkoyXs/eS6SXkAZ6xeX5mR
X-Received: by 2002:a17:90b:38cd:b0:369:7421:75cf with SMTP id 98e67ed59e1d1-36a455fe2b8mr2555044a91.16.1779368857357;
        Thu, 21 May 2026 06:07:37 -0700 (PDT)
X-Received: by 2002:a17:90b:38cd:b0:369:7421:75cf with SMTP id 98e67ed59e1d1-36a455fe2b8mr2554989a91.16.1779368856828;
        Thu, 21 May 2026 06:07:36 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:36 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:43 +0530
Subject: [PATCH 10/18] arm64: dts: qcom: sm8650: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-10-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=3273;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=grym2NR/kAV0aYecoJf+FpWLScxnZ+YDsJl1+8FBBOI=;
 b=u5XcZVHlZ1xcXCThyXtpxaWgl/fOH5InohJG3qlgQ0yQjLU/6NRHvqkt59DGRcAI4jhVgJEOC
 RcJQ9pQF5HTD1G4aX9F4yQGc0oGAnJk9bI0FapwuwXD5RpfTGFaVFle
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 3Cf0TmoXXkc4OuALCVidEhno-zZXmrcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXyBASHwzBErd2
 /+zCKlWsqQzR9Tlt7b9xUCl/48huf0WNP0aOHadbhYN5XXrgHC4kIMylZE4kBlALf+7wQOrlfky
 SrOtv37EQ5YIETtdghpKPPiGZGpzSBupnNuGv/CRwf1E+5y6mlLs35AZ5sE/Yk9ucuKQpb6jiCV
 /qnnW6z0Yj0v/Sk/Hv6uakOCmXUImatJJ54K35fTt3D4c4/bZ+MRlGL5t1MMW1D/ZDSlq9GZc5m
 FkUJ8fcyupQpW4ZEIICsC/Nf/8YJd8MCa4t2U4VaqN1HXElCiMBrEMdDgpxdRBUBNjH6eRDHjNe
 FbhDw/kB054fYq8ZhdKcMib/9r6qZB9IKDra3ouzWxh2/vrk2dJzkvBMBuPx1Pl7MTTSKT42smx
 sMB0YDDsafPow4wdzGUAWLFvIHcA2R0fK2e2ns8dTjRk0AS4lBKiPSRbj1lOnSJ88wsCF35UG47
 PcMkYCt/+E2zIdTDVjA==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f039a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vzsU3dzRAwCoIzd_qrsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 3Cf0TmoXXkc4OuALCVidEhno-zZXmrcO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..2123312d88f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,7 +1074,7 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1108,7 +1108,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..775ce9f2dba0 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -942,7 +942,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -976,7 +976,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index dd6e33d2dc5d..8cc0d2cb3515 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,7 +642,7 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -659,7 +659,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index a3982ae22929..c302996a7857 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -936,7 +936,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1


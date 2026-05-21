Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA49E3DB301
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368829; cv=none; b=pxX/r8hlgdGr6Kzt76wb9noPD6lJBoHMbwvSp5pE7vewvZtPUPiyrpEgMpwwYw2vk5IE9ygC/TZ5GqzF7aHlExLniz/YMn1x9obYoIc/qftgeHyGKR/+VDAB2YAbmvxdD//6ey1J/ZqJz+JLgLVmkibzXPX4poHTd+F7pU0HmMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368829; c=relaxed/simple;
	bh=+8pvm0uFERW5lUAcvZeBTj7KKJ4hI33filK3T4PAcEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KUSDQmyhguZPLhTQ5+KWYpwH2NK/HRcU2WSSVKU3GULc2ibkvXe/osKJl72ows4tAuRI2fVKkuSEvwvujAqXwICYj2o98N6ooqTa2T0WtjIwyiqyUtoTtI9kcgpDvtrgA2gzpnk/YWpfvwy/UMuF63JGcRBH0ilwooWeI5QE/ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agWj62CJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHgDGT6o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agWj62CJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHgDGT6o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99qqN3451507
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=; b=agWj62CJBhtLkUt8
	cG1gco2GC+3f5EmEuRhDwJMDjYLBSsFmPvUNb5vb9nTAnGgf1sXZeEM5RMvIw7VS
	l5qUX4V8HniolukWvnOHuLSAZbqKUhuAa+tj/C6DOEdHlQRQqNowR5dswkajC7B8
	9DXooHSLR27twsb9njdOLrK/2VAmZ+IMmvTcxxIu6SicZZV7P+hkPlyfvHqqRI8Z
	jgolys73R4fgv4xTNNcRiYEtBSnRn8CbTNghLZH/EWCzacbX+hnJk6tEXW2S1ZMo
	/SCRaxjbOGAjYSOIPnEAlOZXsZHSYHRtPftSLbyADRlWN1htWH69tdAuUdTJG8KQ
	fVmKqQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h8xea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828b1b7fddso3467904a12.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368826; x=1779973626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=;
        b=aHgDGT6oig3SmNUYO8JRwj30UsJK/H7+pN9a6CzggXuCz9r6JR8Z2+xgeuHsXOn2g9
         WIgGrt80HRoIIAnvqw2Sn4YOKjO35dfgh+VIwfqHjIycBjSlegwJ6mHuqDUBduYcbTqZ
         NA4Hje3ubJR5azNsb4WTRFOWeCVCg5DWDs2Ur6Z3avMjiQ1g+1jzFP6ZKgUZyjr1luZH
         Y/EdY8H8GooWUhKiv9SauBn2/0+43d2QqRuLyyi0nfcqrXKVDPuPS8Dy0qa04dGWxZ+e
         nbmGN+H1iLbxDtaDxLWEz9588nWgzlb5vr7TDx+6DHPOZ631VqK3sECtqKrayrYh57Dy
         ic0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368826; x=1779973626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=;
        b=sM5jH6OUcmqtWtma2/DmvZsHdtKoUbiRA1JbjNFTQX5XkmAkLzueE3/YZP2cI72Z/5
         F91sd9epFqOmsRf9ZfsWTIZCeJ4glXH7qF/9OvNT618Iwj3JKh5FEu1h5EfmuZ3Bzlt5
         xgp/PjwAS9f2ornJoF/EBtoMRwUXUXFBfFElaiZR8LJE2nq+Nh7He2NUbwvhhmTFs4AN
         ErGCkGyH8fEdXDpBWx0tMDROsT72HIGsJvr1HE8+n7D0t0Dhc111dTRMOlcrX0qVDPYB
         J4mmzSur8gdybIADLgLWfrs7IUjruR9C96RbHFdpzkUPr9qRi0nE5tNYg34CJFHJLSKP
         nDLw==
X-Forwarded-Encrypted: i=1; AFNElJ+V+F6FE+MhIhuBtAvyKuSDKrr0wbzbfmz9d5lh7HCmZRcANwbEY6ywFHWG9S7sep7Q4GFfpSVSzpeR@vger.kernel.org
X-Gm-Message-State: AOJu0YwiJUtr8N3ZtP0pfsmj8pWi55B/1AXUVfpRCSxHP+TZFs3R85l7
	EYHAuFTimGOpb85A/RNMYDxjzVHOhGvb2er2RP2KCRGT/6xiyboKCkydw8maQBuSXwJcf0xHRRa
	70uud4qmdJ36F6J2AgVggwC2amnJyl9zlhrmOssBEvugnuGoFn2ay0NaZhumOiy8M
X-Gm-Gg: Acq92OFRJoONgEsm8sL5KqrLHL0tguGMukt3Ths975VVf8BeX9Pyl3wGZAtS6sXtbxS
	mF/piuXvuc8cX8xmW/O0Pt3pDcJAgJAMmCM1psOvcSU8S5+eXvcNpvNiS9+qCUSb/z2HB/0OPPV
	3Xh8poRn+9cY+NNRrShOjP35jApdKSKhsBe1jad4H3pgcJV2pUgm4F6WQGR+Ogr+0YdVs8B35w+
	hP2Kd35V4U+Fwqdjoo+8didegzuuiNWAA/JpSQniQJWcMWZIs0wPsX+mdhDpGemjY4WA/id3qST
	KDbqmWj5IHV6YZ2ZXE3FymOYurUfxZ8fEXnDIoaaVmZZ0998+3/gmXiiDF7MXQ5Gld+KZKCTWfb
	mGZB8GZtRX/i+/27mEr0lrimFeATELOBByHZgGW6M6p39VfJ9+KfC4JLo
X-Received: by 2002:a05:6300:7119:b0:3b3:ce0:9f73 with SMTP id adf61e73a8af0-3b30ce112acmr1706125637.19.1779368825657;
        Thu, 21 May 2026 06:07:05 -0700 (PDT)
X-Received: by 2002:a05:6300:7119:b0:3b3:ce0:9f73 with SMTP id adf61e73a8af0-3b30ce112acmr1706087637.19.1779368825164;
        Thu, 21 May 2026 06:07:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:04 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:35 +0530
Subject: [PATCH 02/18] arm64: dts: qcom: msm8996: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-2-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1618;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+8pvm0uFERW5lUAcvZeBTj7KKJ4hI33filK3T4PAcEk=;
 b=pD90Fm15PWEu6vH9L4UCmhcsjpwXr9YAvc7b9uDjO3GE1G2seFaaqMKW+Y2f3jUzKkQD5lmLJ
 kUzQfb8tFH1C0wdu7fQJEyc/XGPVqu1QEf8JUYbmJovOX7SHBXidBFf
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: BO82khD6uJQc7u8f9zfg755nAYPhT121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX8+q/IP0lpuMn
 PELWpAKh42GNUG49SGJrix19NVMVT2/Qr45KBWwrmMi/by7BsOjoxWHywQtSmwbUpoeMHIt6foA
 Gj02Gw+nay6DPaotMnFAWJXp92z1dvKlB6DToSwrGR6zuRPDbNJ+LMdJnOWHKTOSeF/OLt9o/Ji
 Iw4eZe7KrZ4zRQTtoGFinFPT9/7zkN/IOgXR7ZB9k6JCbODERYhLjXRvaK1i7Bz5PkR/C7H+q4+
 fiHbe98oDLcbYYSLgtNhFe3UMo8hmQRJnJgjB9KN92bHUVAmRUICR6j5n1ILVhh+bpZQih3Tvtc
 gYr08mU8Jy8f0g8IiGamUPvTXlJBAH8oj7FU99NIf9UkQ6gm6OrBaZgg60zO0TNxE+i6DEXZTKT
 Y/uP1b6Y2ullWzM8W7lZ3QcZ4NKq4tXx+0gJ+hS+IwE8tQsCVyP7FykZyEMI2+Qr/JJS+S93E7y
 ZY5cj+AgJ0wmp9eltIw==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f037a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: BO82khD6uJQc7u8f9zfg755nAYPhT121
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
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index d55e4075040f..5b42c266557a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -192,7 +192,7 @@ &mmcc {
 
 &pcie0 {
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&pm8994_l28>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 77ad613590a3..2abcc733dad8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -280,7 +280,7 @@ &pcie0 {
 	vdda-supply = <&vreg_l28a_0p925>;
 
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.34.1


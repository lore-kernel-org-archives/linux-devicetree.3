Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83744252C9
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380761; cv=none; b=L73fhlOr+PgR1Ggam5TQ8PESisc8tv/DqL+SrGQsUbHn6i3kxmmQ8du+WrCIU1wlnr4442nYA3BQ57t0t/5jELfG7MEyEVHm6ZYmDaF2XtB+TNM3IpRoKMek6CNRpUFp8crezM3FJmkjvEVInw9t2eTPS/dQOYWzsf+BD0AA/NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380761; c=relaxed/simple;
	bh=c+bDrUjR7XrNZ3W/kXnSRtL90dVSEWiEQOH1Fd0Ys6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+rGFVT3QcLYmLIlZJ/dT3/ATs8DQJ7UoXACkMBBpIoM9wsoZWwv8TRXzJ4V7JN0dsAoZEfvjgP6wDvY+PxQHDvEFsc3Pd35pF5ZM58KaFV2gV2/1ErT9+1DENxfel637mK/bCMgjz8LM6i9eV6x3nNbV6UkuWLWLQzOl8wlWy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLnBEhwS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awrl48FG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLnBEhwS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awrl48FG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nRpd599736
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LHey87IrhGZ
	jBwBUxxFV3scRWIGW6S8Y7iaki1Gs/AQ=; b=WLnBEhwSof77oAM5WpmV5o5ixJR
	zQpYcVwFHQs0P/wGYRXo7cUHmee9vJ73d2t022G4qEL00QT4H77ZLhsM/tiDN8Cb
	jQaUX2f4OR4Ck40Nb5HjE5cHCcCFvA1uaaAqzdH6MVYxt0DpMs3i/XRCp0rnRybY
	nx9pWHV7F7Qu7hWBIeEp4yxaW8/HIr6xZqqOQcTuR9AK/LAFCACIh61khvqFS4GB
	wOY9Yw4pUA418ciopp5zEd+UrgPuvYeHfXca9IO9LSRrngNj7yB+TazRPQ+4XcKN
	qou5zgEPOPQZOZzlrcZXYThf4Nn/dQ7lbS1ow2UbagERbigqkMarN218Eug==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rbv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:12:38 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c1b24c4d0bso2823066eaf.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380758; x=1789985558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHey87IrhGZjBwBUxxFV3scRWIGW6S8Y7iaki1Gs/AQ=;
        b=awrl48FGnckMgBL5FCQ0s7yNJ2r1O7Cz5MDnOQPxMJf4QU0MC5MmwAVydfQ83prw1z
         BkdFn5zIRnPFl6oOF6BCmxLlVzgvULgU31L3hjSwJ09I7tbSwBJ5uKxRuSWYQVXzDTLl
         AZNBnNpxFiZqsuFUrGvFBihtX/b2zB04lB8o2lP4cWEm7crd5wZmaxWsBFIel985C9+g
         s9js1el3fESqVRKACYRVdaYYehm0AtLWx3XVXb+EdbSm3mbRcb0jON1LhjctrWbzh2vi
         nUIGTBNZbJOq0wVwmluumFy9XeGhjeyPJ+ZGQ5ppkiYEMYpaYfDb0LYUrr0fdFRn6oaE
         ht4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380758; x=1789985558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHey87IrhGZjBwBUxxFV3scRWIGW6S8Y7iaki1Gs/AQ=;
        b=f6RIQ1I0rS0aZeUshSgqK7k+UrgleR5gRZvM2lax0j6hbMnXsoKojyRIKkh5RexWJE
         +Kka2/6Ju019uKvvpHcWe4Armvi6DWc2lsTwHfljxyDEwACdc2hoEuUPVo9PWFJOSW8Q
         4Ck8qXKYCdoWriKOvgwQZ9iTSGq924cJ3kmZq3e8Z84rZUMlmdM21cP2PCGJYBCasgto
         LVxjndjGgAcl4ZW8Sx+yZbAtnFG1xWca0r8RSAGwHUB9KasQvSnW+beL1oImbrcYdn4x
         EXVQcABAhU1QxLdylnt/M3T1GkSh+t0tbT+BcTxf83n5onasduy2WMp4vYS1WxcBeJVQ
         c2Eg==
X-Forwarded-Encrypted: i=1; AKwUvBzvxnNrIyjOF9WjUMhe7AQQExsqz//hrzYi/3dB7PCMXbVAYAbbU3H21fJTjbzjGZwse73NrhrnDdiS@vger.kernel.org
X-Gm-Message-State: AFuF++kJ3cNyrEcQZuMEJdHD91yOVFlU7WiPPmSE+yjxFkKbt6sRsnEN
	895bDlwPpiICFWIATQoyWsDPCOqy23PsCcm0g2XqUh5v/LNR3ZIJwhVinQ/Y7lpFSRDS+f6W54g
	pNTcaUFIaE3Sf4zqz07ne1soEIQ9IHT4G0zFIv+v+hhvOmDTBkfNOeQ0OaASEZjViombdx8vm
X-Gm-Gg: AYBFou2qTht+Dz2m6PnDDWUSRCYEHHwZWvQD9qwlBIYfwzhCl9Bkh9H4CHSvCCCaTV7
	H6D5yWzS9eUiqh5Jz92n9Fo1+ISHPf2Y4OLZRrI3ZoFa83DKae4NI2XtvfsDz46GJV9p1/4sqXp
	o20vTwMEi5xPFXEvnDkIqWINgGfr88z2002WrV3EJ6s06jzUk56NhR5NsXNk2AosvIr1Lc5PzIq
	1S4IhTpQ0r2wqqzHzFDMML4cgs2aP7Y/iwJmuiVZ6ITQbAp+0dvWplZ6WbPVmSaEfsoEn2YNJBA
	PMwlJhedTw3mDLw+hlq/z7HzMylnX/dRupYrRedNMVQ3D8wJ66rWIYpX7Xta4M9sCjCIjUly16E
	EURqn8F3bm7qm5NZ95bxAzHGpxpERNvKHmZM65pqta0iv+A==
X-Received: by 2002:a05:6820:198b:b0:6b4:3a06:c251 with SMTP id 006d021491bc7-6c540188d6fmr908380eaf.29.1789380757938;
        Mon, 14 Sep 2026 03:12:37 -0700 (PDT)
X-Received: by 2002:a05:6820:198b:b0:6b4:3a06:c251 with SMTP id 006d021491bc7-6c540188d6fmr908359eaf.29.1789380757533;
        Mon, 14 Sep 2026 03:12:37 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm29020697eec.16.2026.09.14.03.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:12:36 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        xin.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: [PATCH v3 1/3] arm64: dts: qcom: purwa-iot-evk: use on-board crystal for PS8830 retimers
Date: Mon, 14 Sep 2026 03:12:28 -0700
Message-ID: <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXxydq/kvLEArK
 27E9F8b6OajaISU0bYWj6fNVhNlDRIhbAFEgazR1NgDQH9T0O20qEqx83PPlX5O5Z0mFZolXLjo
 C7oMnU1mWN1v9DqxLaD5XF+8hnIr5CU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX0SXfWzdgmQWI
 HeefpIfIh2B+d2bSdj/SRmp7rjlr4zvvGZOhJRLKjnYqqVkfQrN2ymtc7S6+L/e1B/7Bei4Xc7C
 JOKpu9Y/uehPiyHhrauGNjLjlSKLxtnnxkJ6iutbrd0MlxqkavC1umqxa5fmjVdmxJgcWvFNj7k
 UeQ56Upw3s+hoNKPCSbvn8CNoBv20rjMhWSQLp0VG494i/1eSi1FRJO08L9yI6CnzE+EkL70tbA
 ZJ/Y7C7N5nuMwjSCZYUMTJ9QgSfWNW/mR4kcQM/Sj+aDBcuujskcT9tgW+yhoEUiFVMwUrJy/eE
 gmFqPkYG6Go80jezd0AMH1bxKIGYCzlGKw4iiwKJvB499lua5jGBf8gxH5I/awcT1DZc3jTrlOB
 wTHlxs/kxKuQVdeJ3FlqTOYKtYsLd8Jdu5RbW5JDgP5J0cwDEvTuqHHUo+m0g4axI9+9n9W6s6N
 lq0CEETtxJuZzUiCXnw==
X-Proofpoint-GUID: HZU0qyid4K-L1kK8_BM20QEuK_ovx2kM
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7c896 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=dZtJYaTC1RL3iSm7oLcA:9 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: HZU0qyid4K-L1kK8_BM20QEuK_ovx2kM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140145

On the Purwa IoT EVK, each PS8830 retimer has its own 25 MHz crystal
wired to the retimer's XI/XO pins. The reference clock does not come
from the PMIC, so the RPMH_RF_CLK4/5 references in the retimer nodes
are wrong: they keep those RF clocks enabled for nothing and describe a
connection that does not exist on the board.

Remove the stale "Left unused" annotation from the vreg_rtmr0 regulators
as the retimer is actively used.

Fixes: 9ed20e877239 ("arm64: dts: qcom: Add base PURWA-IOT-EVK board")
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
v3: New patch.
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 27 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index 6fc6fe7c0899..4380a46b33b2 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -60,6 +60,26 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	clocks {
+		clk_rtmr0_xo: clock-rtmr0-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+
+		clk_rtmr1_xo: clock-rtmr1-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+
+		clk_rtmr2_xo: clock-rtmr2-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	connector3 {
 		compatible = "usb-a-connector";
 		label = "USB-3-Type-A";
@@ -295,7 +315,6 @@ vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
 		pinctrl-names = "default";
 	};
 
-	/* Left unused as the retimer is not used on this board. */
 	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
 		compatible = "regulator-fixed";
 
@@ -639,7 +658,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x08>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK5>;
+		clocks = <&clk_rtmr2_xo>;
 
 		vdd-supply = <&vreg_rtmr2_1p15>;
 		vdd33-supply = <&vreg_rtmr2_3p3>;
@@ -696,7 +715,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x8>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
+		clocks = <&clk_rtmr0_xo>;
 
 		vdd-supply = <&vreg_rtmr0_1p15>;
 		vdd33-supply = <&vreg_rtmr0_3p3>;
@@ -801,7 +820,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x8>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
+		clocks = <&clk_rtmr1_xo>;
 
 		vdd-supply = <&vreg_rtmr1_1p15>;
 		vdd33-supply = <&vreg_rtmr1_3p3>;
-- 
2.43.0


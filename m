Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEFA3A3826
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977787; cv=none; b=rAJaLfnwaVkFhD2SScBUKm9huzRzBrGe4/k/+3MDQc3ePxohqtPQnnVmIuOD/NM7GhBqYnvWKjH0+AqVs9E+sAugqJmD32oGLDsPXvCU3rG0SUUZooxnHc+K50O0CINkko/KR5AyDA66esBIYd5V4/FL3AUmTFQQ7YdUtjqXhXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977787; c=relaxed/simple;
	bh=omG0nxJB+cR1OXkteOYajtvR4fNE8kStbx0zl5btk40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GUCZR/y9xj2qTt//L6n8DjyEzDiFVEbXYfR0F8c/dI0oe3wlnuacQGe+abhzR2y/g92rUk4mlScxYxneJqjeexjq949/hZ3yjADyblpNoDP7b/pxVQKt+YfbMnElttTDPFggPa5zzmZMWb0MeBjUPKUE+eovaKKYJrdXBMRxWgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYhtZ+xJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmA7VV3P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYhtZ+xJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmA7VV3P"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KPES3067831
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 07:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmsJYIBGEJqXut+hGeT5xfQUlalTAABspgm81N9sf3c=; b=RYhtZ+xJRazGJtRW
	Cgs7nQ8DM6deCNH3MzCoOcX5e6JSPC4vw8jdSmGDjNCUryqY/gdGH9BcA5kBIZZ2
	ydfUPD0O6jETJn1NgD4KJe1Z0r02BQ3GyPvRdGSR96lMAZBJdo0z3RMVq3IxFPsi
	PXt3ghSJbF1L4MX2+0ClJHYGHlV1CAACk40w+5YRsvPS8YY9vujmoYMuepjo7IRo
	uHfFrxbM3V5OwB40CLLWe0h+XokpOnmvF/vFfjzjPEt/RmTlenApYHEBIJHf2mt7
	oATDH68SOLsdsWQgy2SWJmBVh6RtREH4X3u8l+4CX/9gyxTYDOQfTScQy7nMuDUF
	VbsK2g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510amdst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:36:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca53c486f2so21509735ad.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977785; x=1783582585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmsJYIBGEJqXut+hGeT5xfQUlalTAABspgm81N9sf3c=;
        b=QmA7VV3PePcxzZ0v0zLY9dJsa6CMuWq06tYRtcreSbjK/CJjbQqKm9wBywTJpA4siO
         AaHX0NslY2fqJBGrA1uiWtjEwV8Z+fiAL7+vNAP/v+P1np6hG/jgsIfpA5nLkQmfLUZn
         FCueKC3QTcrARDw4gsOXLoTBq3G+nsceBeiIsp865bxAiSbVyaxw0eiCtye1qSE8fq2h
         FT/M+vlDM5A/uVD3a8zmy6fq49wE4pcTteZU+m0LerHDvpjKNZEq9FVBgEt0h9ruXNbK
         u+8HTxrvUqrjKJWx0pAfKoLe27uO7jndLOgsAY1cn/nv5A37bZVYghiyCFaBO7UGpc+F
         SQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977785; x=1783582585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmsJYIBGEJqXut+hGeT5xfQUlalTAABspgm81N9sf3c=;
        b=e+1J0u3SjJijL1gg/duMIycEuyXc/JcLETGgLT9hF9My36PtDWoc5T7dF1k6tgzv1d
         stFCSKNLuv4AUQPT7fghHYQFnmd1pEUv5YctoHnxcD8+HOBUkl/mnr/yWyQIZ/18DNLK
         OgHL1cRq4cLlDtCV71GlxFHHfeEU0myOLV8i04KtU7U0vusUTGARhbwgztwy3OVYvPhA
         exVwSx2sj0K1qQbYyPbrs5aFZTnGfHdxr+H8CmxCk8cSxN6NrpBrTtiLWCf+svVPmDsZ
         634LZ5zox69q9DDHSEvBl6clZZV3QWX4d2XL07DJ+q3NG26If44kw6GTDTaPl7EzI8bg
         z1wg==
X-Forwarded-Encrypted: i=1; AHgh+RpoKcOMNp3rjmyFUitD52Pmk7858ZKeJ4kxs8Ja+xMJfSebN2ZD0qgzM3PQqF5pqGC5+TaruewgCxmv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/QoZ+dA3MEOu1GLKOFw3c+gQ5LSJCfg7Jd6Zm94hsnt4B1afo
	kPR2EC+oniI9ZdPx0F4KmkfK2XmYUAsHxM7ACWTMoPmiiho/BfUN7irPM7ugG1ZsT1TyU65Lfar
	Qof2TOF+iLZm0VjjcNxjgPodjM8s2g1UHwvqyFnkhpNT+TjfWP3fdXmKyk7mkIXHT
X-Gm-Gg: AfdE7cnCLEK3yfdjUoAiTvO+FLhwafeiZXtc8gahqgAuq/9wiOXtpVvF3vv3LtPYlCC
	mvzj5h0eDR6NXrOtkJgCFDgxmpxuApZJaHtTtOc7T2QcHE0nhKfe+XP+XD5zjBNC+bEE8Ufadt+
	AnvY7NSrPOV/P42RCurTmKyryrtUBIeDe7tEmtjuLMor84HZHvzBBoDXxqT2G1sUWsC3zZaRb/R
	HtWTYbU0cgcsAJD1QvHn6PUUswetU/CWr9cUwu5gOwB4M4JNS29FgA0LUyZDmx/TI7uJDt0u77y
	3nHM9sJSr8t48pKI63MI+PKb+sQxiI3zpL8XvFyoEcb6CqPkRMhx6sAK/syZHEGgN96g4oBs3GE
	kf7mN90MnkvgueptXnzlO5fpeiesGDhvDegoUg02D8BZVjGj9ISpYjHztcA==
X-Received: by 2002:a17:903:26cd:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2ca9114d983mr40218105ad.12.1782977784511;
        Thu, 02 Jul 2026 00:36:24 -0700 (PDT)
X-Received: by 2002:a17:903:26cd:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2ca9114d983mr40217615ad.12.1782977783835;
        Thu, 02 Jul 2026 00:36:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:23 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:17 -0700
Subject: [PATCH v7 7/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-7-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977773; l=2459;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=omG0nxJB+cR1OXkteOYajtvR4fNE8kStbx0zl5btk40=;
 b=4ELL36ZYt6RoKO2c99VYKYAJdiGDhRbzoBaWLwQ4xByk8SbAMn7YUDQsucIuc0kmLupoMXXip
 oRawXaSF09+DExc3lZH+PleihU41KroUgHngwkqEVVnySOIt6jVnT/a
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: e3iRxTtYl83YykD5vOOetPAoBGYqXoab
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfXyJAtcecI0fp5
 4+9PLspkyy2lpv/q2o2RpQHBdSt3qm3Cz56C6ColWhFN6gi8WEv167Snl9Cy4dq7k1UfTWfRS5w
 ljgxJf8LX4M4d8fNjNyKtOgUGVkm5BmvPShti94fGXWPSHzPxJHQPC180ThEv4chT7ki41TLgDb
 Y/mSlXstd2u5xVxS27pxwYvvjrIpTgUxELF8VFQkjFkSgo4RC3T7ACdnV3P8N7kD1ZnxqW9Z5Nx
 7zK+36CWCRzlRURY6SBHk9wFRska4LewHPUks/pp9njW41Zcif3uIQZfm2r1SV6l2HnTlKbU58F
 cNuwwXzorw6FYZWxHBx8Mz9KcawhjIfHTba3uRhpO/vK6jOwDi+2K7PZRVWVytybcqvJYV3gTRg
 bxoF90otkqlVP5RnEQwqL4BbDIMQawSl6/IHxyojwS6neqS1eOiJlG/cE2v9JaltMQbkeTDvNem
 r7ovuwupYhLmOCPXQlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX89x2h8qPXYmv
 +ak4OdrBCgtTUrMARFJ1YKSoucOa+MC1vYHjnRtr3mBqvuRFWpg3ckcF6zW3u2D6XyYIdIKTVTI
 UVOuTWGw2w5aRUsZokZ/2ByNOO5+Tb0=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a4614f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HJ1A0pFH0qRQ8DuBKaYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: e3iRxTtYl83YykD5vOOetPAoBGYqXoab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076

Mahua has a different QREF topology from Glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies on the CRD board.

Unlike the other PCIe controllers, PCIe5 PHY on Mahua gets its refclk
from the CXO0 pad directly and requires no QREF clkref_en voting. Hence,
point its ref clock at RPMH_CXO_CLK.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..fa5229064b10 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,19 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };
@@ -286,6 +295,10 @@ gpuss-4-critical {
 	};
 };
 
+&tcsr {
+	compatible = "qcom,mahua-tcsr", "syscon";
+};
+
 &tlmm {
 	compatible = "qcom,mahua-tlmm";
 };

-- 
2.34.1


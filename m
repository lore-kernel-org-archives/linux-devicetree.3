Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643FD391828
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781890; cv=none; b=st9856dW9+acQ0MdPdmYM2UADhLXHYTxY44chODgB0z4aZZ1GVaacnwa3y6jx5In/x+oJoAdnWF2mMG8De+ORUbpBuTtF2+ZI4ylhc7QrvdEa00NWovmDkpDXz+INdahIA47ukc9AZTy3UmRt2v20NeisFt1piJk9kIPo5B0QFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781890; c=relaxed/simple;
	bh=fvp+ta5kyo9P1ISBE724MVFIdf/YdhpsBaN9p/esYwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=asVzOuVAmRkHbNQCOBaE2QaOqfyfMGP0D/zDYz3EejiVFyLq+OmaLd31PHls7GWkqIK4Bw1bpG7pF9iirMp7FScR8Rm3rCTH5tsSAP5kQJ6eKli9Ts8qocbPAlX5y3ezai12c6plZSihdoy89uy0eEHD62ZzSASrEsJfaed5Kk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsniN3EX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAjSGjGM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsniN3EX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAjSGjGM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WsXw2477582
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+zagSHROFEodx+Lk0GjyCrhmWq2ocvbAsIK+kpUx1s=; b=gsniN3EXpXixFTom
	iuTVT4ew1b2CajxKkSUbAuahpegxuzwUMx5hvg2VO7x16+bx/R3feX7AeBcdLyLC
	oheTqkVwiotWCsTc7nrw5357q2PbZ2IoG/X8JBhPiDErXKXOgTcXL1NujV8Wcn/O
	nNyqjPoAAs+073/pkQbtqYvPDlR9ClqOQd/rybN3PIqDRsku3uUlCqWp3e58VNgD
	hlrUDYAuKY78L7QJp0ZPvIh+h+USUuH6NfSQFRex7sQJXjdrVxpbZqdf4Gzr/4i7
	oGFKTzq24xvJ15Q+yEicDgtuL4XTEgX9gCMtNBaS1fEoZg2jSRz1rln4dbFte4Jo
	aCw9YA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7c3rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8487eb67173so539184b3a.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781870; x=1785386670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+zagSHROFEodx+Lk0GjyCrhmWq2ocvbAsIK+kpUx1s=;
        b=AAjSGjGMi0kiMLR+SCrGgjg9yBdtSPS2GvF7lGq3pZDciWJrobW1fIjr1SZmSeZt4b
         uYMbWe/eR/qP18C46G0tUy3vz2VrVcYqWVIo2Aopy0I9oOTTgp+hb09aK0c4ugPEy04i
         MWrjwFbWnHNyDnjeIFrDeKjiy+rootZpuA2hzI+3GvpkK6T3u+8g1D0HeVcQL291NBBF
         NP2ugNj2yEfXdAEJL9RO2m0jIKo4eGU61Ck2+KFZERr/cvhdiydYNtN0nkKy/nPnd6da
         G44LNcwI0jL1VDiYlnqjwGoGG/oJ2NXlYE9u3FFvTvHyRccKvNNQuqNIYqePdx8acRNt
         7ZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781870; x=1785386670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+zagSHROFEodx+Lk0GjyCrhmWq2ocvbAsIK+kpUx1s=;
        b=PmGGP6yybd0HrtHAXtwbQHdl+wYytIf17RMfakFyQUQQYSh9ZR8GFEQtILt7jFNUsx
         bNGZeyKEGYMH648v6sv5oWEwiQ+hceTGM8t0VrdQl8XLMR6wS77Xt03MiRXcZoUraEnn
         h7e9KW9s0s5pUG4JQBb+1l94xF1QxGd2j6JMoHzE6YMxAfR8GDek+RyrLkxNmGOwP5/F
         diR8Fw84aeUmBnbxOy3DR9wN7cHnO6vpIB1IiT3Uxd8ZbkO65vV4IpFpPjhsTJr32pqV
         th0+5zQoy3Kl842/IRWfDR17vhljJjSvWKADZwwozyH4NE4zxGokBGHiSDyoGqYqmor6
         BCpw==
X-Forwarded-Encrypted: i=1; AHgh+Ropp0JyHLNYY7+DNoskWcIky5/PPXj/4vJCxqdSviP0cPO5YODuJrAac6jyUDc0qxK+c7gvrE4aBVTu@vger.kernel.org
X-Gm-Message-State: AOJu0YxvHWlgCdhx5pOn993z9hruRx2QonCUzc6PJyt7CnYtILCp58vV
	Q1afr0E0oh21P+pSe7bGBzwOf+56KOmZNsJsV+ZIZ2QPQ+LEjtjo8v3CXgkpMDZTApR0fe7Ze3j
	jPNe4uj7BhkM7SYrTJV398tzL1csPWssLGCg63BwW5LdSefuY+Y6VTPnarILydTDs
X-Gm-Gg: AR+sD12OAyi+VPp7f5oXIRsd/bkdS6i1B2v5JCdnmp0E6iQuyB9pIbZ3tN0ClXPaKIl
	oXv2Z0jF/CJEMs4Of/P5Wl9KiY9uaP6+7E0dvplnkyk4za+ikhElYe2if1xIy/ILv1rCgKsBodO
	8ny05maqPQ3ULOwctIBuMKfenXQ69kNCPvUWZYErmFLAw0t5K6RJE2By5SugR41A/E1mxJTzGAR
	vv+Ksx5jDdvxgggMg6sPtXE9ftUIVUJQ1Vl7eefrO4e5lpPl+HSAERacJY/QvPI3lcQV5q0jt5P
	X5Tu4G2TMmHb/hSH5B2z23+kdgdbRgc/O1UOHcuOCVGlX69yZrR771mxRWpa4FcIEFlmWMdLxn1
	eq29j9bo170xJNbf2xb24jCZntHUeKqY=
X-Received: by 2002:a05:6a00:4505:b0:848:3f91:da82 with SMTP id d2e1a72fcca58-84e2bc69e37mr1849191b3a.32.1784781870572;
        Wed, 22 Jul 2026 21:44:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:4505:b0:848:3f91:da82 with SMTP id d2e1a72fcca58-84e2bc69e37mr1849167b3a.32.1784781870157;
        Wed, 22 Jul 2026 21:44:30 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:29 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:57 +0530
Subject: [PATCH v6 3/6] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-3-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=2668;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=fvp+ta5kyo9P1ISBE724MVFIdf/YdhpsBaN9p/esYwU=;
 b=aCFsFVSI+19VMBFO+CGAO6movLwyzk2+QHAfc13mdaxkAdQ3arJ42R1jN5tgn6crl6pwlEWUa
 0xPgJ779uO+D+oYwRatYhSbhwkpXFQDjQfx1EzVOZzDF7T1179TJlgh
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: rcCdCgiRoEH5fKnntBsLNrzCGUZm5Ua4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX0fBmVqJ82NwZ
 uwbGXUMetIGOBr2M4AT/uFKvqWBS6paKlg0GbHdD13YmaJUQNQG/H5OVKLJj2cImI62JU/rqyxO
 UjqwJkpeRauBri4HYfwkC9B5JlJjZ+M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXz/9oBxTkYyhV
 /0LgOJ4nAERcyyscYlYQnaWrCfhTzb+pXt6e/lm4rx3ifvRogIC7HylRtSGYSYHqL78RqSceoRT
 cSTvkS8951E4NDPT9U0YUTiCubHW91bL4d08xH4rwqzYwMejN2umO/joMDOviEBewpzLF6/EnU3
 i25Yndyy6YoOTw2Ohjerp9EjyOt6mdVBw8HWw/dOm0Jt8GvvqLDPPKUiIbAjDrB9/E1u2dklNRK
 j+1y3Jrm18cNUBVJ8PT7tfRuxmnlUXpzeTHA4DO2/ttzGVoD6NF5hgcnzT+Tj8XegpPxx/cuXMz
 DJTf2tiBlgRgNeK/6eAYoAiaMa+wlJL/Vh/hwTE3GdBmQtIt2fW5tvj7bVYK8sRpfC+fXzcH0FA
 hxF2rv4oMnhGPqWBomE7jrRkE7D3tnxUemh4NyBiGruQet6UZbAnYk60EvaMMGdNhdblFnQUZB0
 XrzdSvO/1zWjQ1TIVew==
X-Proofpoint-GUID: rcCdCgiRoEH5fKnntBsLNrzCGUZm5Ua4
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a619c2f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f7caee4cffdf72b7e98f5dd33a33419087cb8b57..215ca0743d943dde71045c331f7cef6ee4d9e9d2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -355,6 +355,38 @@ qup_uart0_default: qup-uart0-default-state {
 				bias-disable;
 			};
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -738,6 +770,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		sram@c11e000 {

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6B47255C
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016639; cv=none; b=HrKks7X3Pof0e8czwG9XwBYlKHWyufm2JOTEAL57K1UEsP+nbFI9DYayMSBC+NEq2EB3feoWfDwX/aYIv55WDc1leLP9H8JoH0IQFpMx7wlVA+6rNJPKBDNYKBfMYEAYw5eRs1ReZg8jXLNEOe8bkHwPYIZU9HQaGBDD+5vfgCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016639; c=relaxed/simple;
	bh=t1GOytGlrjx46BpmKSPUCNe+9RXHzC4jFU/9ZCxL4vA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLJFiSONWXQGcF5kaV+gJ/pKJCrejUH+p6OxHMKYA0VdEX5MS9FZjppdseUPIPTGMBaJxNmzQ7ZXeSvE40bYs5N+K8mZb6bwvcjGcQO4Oz6khxnvxgMp0fEykp990E0toKOObiwEHeXK5XZKdwBHkVadgneBhw2zghBJ9zkSBkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EYhwgQa3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5ewfbet; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYhwgQa3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5ewfbet"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nxrh1278191
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 11:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1XBnMsGWKjNGQOFIdwFdqcIu0m+wHOCKXu4Zohj4qGU=; b=EYhwgQa3fefpSj30
	QJkcSd8c8fPjPfHp58opoMiN1ydp+V/Bcu/bZOFcsbv8kLRzXZzVAmJj1uD8mv/4
	e8TeWtAaQP71Xpo0ssqmAmAnW3sAMrrMS0mZrXDK11+tlulPOpb6lSHdMRWHXoLF
	FwEmO8JoY5kq0bMLedoCfkeO+wl4S7dmB2EyctJKicfyqCI78mke+FZyf/4BL2ra
	2HOv6O2XWmm6JoP3zh81TWaCEC1XEkmZxfVfXf0zI5MC12Om4zwS80QSgqPwbUD8
	TtXowvkEUDCKEZe9x927nnBMdZXU05L60fLE3JO0TIruXudMLaDTsVju/vfoKO+5
	FwSIIA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuehx25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 11:43:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a67b16217so3521486b3a.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 04:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016636; x=1786621436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XBnMsGWKjNGQOFIdwFdqcIu0m+wHOCKXu4Zohj4qGU=;
        b=Z5ewfbetYLUNy4VDT+AQkcTQk33S2NTXltHd/LEpbsAQKKoCGncYeZnNF1nzFnrnlP
         Xw5cg5bhppOXp77Fu8h7u+m32zCZps7YfUkVyZ7y1Xhsr56fyL6ou8Vtd3rN3M9vZvpZ
         t4Ra+x/YSAxp0cxhauyCmsZma4DaZJ729uI6Q0GRrDCN+ICtJB2qJ+Uedo6xq8gKO0bB
         zafigPxbSD0uHHciaa99SXhgfGbA0xatVIC5E7hR49Q5uYYp30QPdVCjaKPwXJ9Omyln
         WRYC8lor2VAPDe1KatHC1s2+/cUODXa1YwBwgB0wsusZ4T0e+hQqenCom+7B1DEerViB
         WwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016636; x=1786621436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1XBnMsGWKjNGQOFIdwFdqcIu0m+wHOCKXu4Zohj4qGU=;
        b=qpu+SSjuhfRXtBcr5ruNz4j917P9yYszT3t+pEBxSmmUUuIvEbbhwrYr4HR8tbW8SN
         fKuePRNUkIQ5e2BTzibzWZuksH1b4c/HmAuskzYcncSpjd64UuVHMcapWKA7v9zVWuxl
         lrmtrs7Iy1zQp4D0Vx0FKYv7lj8r0VlBfNINm97sIHRh9ozFUlXM446HvF1Pt356LKZN
         izw6SBmY8O3AZbs5uhB3sTtVefWa8jfLNqz+S53oHAJTBrlLy67NAPi4WqBC3LlTSdtZ
         BWnO5Its/TSaWkugFOipA9GZEa8PHNlHA0OWUiWmXLlIP440myHd6m6Xkq03IvX0rX7w
         9j8A==
X-Forwarded-Encrypted: i=1; AHgh+RrRNeGsQcB1HKM94R1eiN4vcJY+0dY7xOV8GJpOktN5fyYd0VPZ2p0at3tGiye3HeEzRxPKbYaVPLrC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt+AERbSm1k8lfy6hlpfkaSY4qiXg/6evxCKcnzdD6F1JrpMXD
	lukf3MxvlCQSzxmcmByauFVzvmkXCBgFng9PhWomYCdXzavcEAGHFesP2b/98KQTfy86cuNf+dR
	xsh+wIljiU75OcARTPEEiws4DLkHxi1GUWcp5/1pwhr0OUFhp1b2kOC+8zSKRlNTIL9Gb+91a
X-Gm-Gg: AR+sD1072R+JEoKlNwpFS1EbemW+YNKFGsIKgZ2ToS620NRAa0Xs3HYc/zu9qq0syj+
	9S/qDvHhxM6hSi2N82VOYadYBmgVkwmi7dF84cmF2xnbTkTUTWuG4Gu0a+HjhOFoq/bybZ84kiP
	dnDb11K4pinqCaxzUMkaePDEQ2FqGntgyPeol/px+qu+zH5ki9Fej257Ao8VZBDy7G9H/Tismi+
	uzOUuRgpSvGlZKNlVX2YmO2Q/BAzeLhmh3R79VILB5dgAHL9z2ELA7s+ahfKvrCpWg271da9aBR
	Echb1I5SEFnaqCnPdyurxvvo5H2vBiwzSzxQq+bNdplGfEHUecnBV0s35MigH985/0inF7XMH9d
	fp4vhgLYKkGsFpICjvwhPZrVAEKIoMUA=
X-Received: by 2002:a05:6a00:3d54:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84f2e014151mr15403715b3a.3.1786016636251;
        Thu, 06 Aug 2026 04:43:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d54:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84f2e014151mr15403666b3a.3.1786016635829;
        Thu, 06 Aug 2026 04:43:55 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:43:55 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:27 +0530
Subject: [PATCH v7 2/5] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-2-c7360fd6a5ac@oss.qualcomm.com>
References: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
In-Reply-To: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=2744;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=t1GOytGlrjx46BpmKSPUCNe+9RXHzC4jFU/9ZCxL4vA=;
 b=e8CnOHS8QWYKfDGWYu/qcr4Wz+fMXb2gqJFFkrVdOi69ttdNf9MJhz2poqVYwooeMrsnRHH25
 rAI74hXEW4aBEtX+Q7ad0s5uv7WzLklzwRuftad3bNpYSLlF1920qbL
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a74737c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Te5zBO2o9EzxWtHGXx5wnOkUot1jsKwc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfXzPJe8UspXAOu
 yxZugWKoXbj6U/hXfzeK+isv/nVy+mYyHwCBv9MIBB+51B8NQIh0BAN1rnUrsF8mF/aHwgbq8I+
 pcVRjHujNrjaxFIM5zT/1lFzSqKaQSF80QmVuqGbA6CJhKSd+DCD2Pbt1ayvVkD4Pszus5IS69j
 7XOjF5FlZ1IewUr8qmsBdU+3W05PIeFCNn1lS7vCfR2Z+jrsjJnpEJ6kj2UVw0evNr6Kno8KJB0
 meRuIWZIbvYU6DXXYErYkR/lTQgvhVSqGxWdotl9dtfABGmAw/YzDIjsDuTWT3D1kPJ72QdAHmd
 9Iq4tLIcUVXTxS/DZhXhUuHvt5tPpF+iFejyDVtVST+GG8sCqqb8M/ydJMWJZHK4fW5qc6tu6Ir
 VdgrmC4qv/j2nKjptPMLgx7/j6+I5eaNzVdAXkUkqRcP8FyYbZDniE5JDFYdMnJUTUfZlFy22+d
 toel9rbSxKRaIN61NFg==
X-Proofpoint-ORIG-GUID: Te5zBO2o9EzxWtHGXx5wnOkUot1jsKwc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX5tcv4NR61hNP
 xBKDa/jSK6+QngQh/Hg0IkAx/1t/yt2ZXaqE+T7y2/xIyqMV0Qv4urxTRXV2KccldfEHFw314P8
 QtKiTrzOX0yWHRv046J3WuSdlseDJhA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060092

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 44e1a333e97f1c88a672c77579fbe987d4285693..ce5887b9b1d4a186fe967779b9615ab4e4727ff8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -795,6 +795,38 @@ qup_uart9_default: qup-uart9-default-state {
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
@@ -1928,6 +1960,43 @@ port@1 {
 			};
 		};
 
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
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1


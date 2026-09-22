Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E2455D87F
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115125; cv=none; b=nqwBKxCcH/YtY91QPWjEWjDGt8wEdVDLeKEAO9aM7bTLGRWAEsOfiewxAHVVOXMllUXlqQ3zpalQnOOIXyWlLwnKF9Ku5cpPwT/RIhkpOLpKpwltstIm5fjrG9iOtwUeV64NSJrDUadWAYlUXFH3OGhT1X1CjMAQwdsvXyKhTZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115125; c=relaxed/simple;
	bh=eFf0B42YxvV7gwMQRGDQ1zDLlgTzs+N0FysZpFeIGl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=citr0u7dU+//iPplID+MEJYTsxWUxvxvZqx1pBaL5yU27ml4JKl7ygoe6vB0+Maxj0SXQboq0ENsQwnM1iLgKqrOVXxNNx3kiE7IvUuqN7ysdtuI9O7xx+VTkA9gsxbgiq8nxEwCSn2YN5IWH7ry2Ndrj7LgYP3NZnTziJfGw2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mr1sxPtD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z4pzR88m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mr1sxPtD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z4pzR88m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7vTf767702
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IZOnCj5K3G8
	cEVBNMsfUljTX+GYt6YzMcKsUYnLBFe8=; b=mr1sxPtDfmxRXcgU6Pl8h7BPi0W
	tqV4UqRESiUdp/vcEDMJ5SQiYEpBErXL1xDC+bVYBcSN/jMhDYeik2p4fej7P1Ro
	krRYU60aCPOspOVmytBGXW9NsJnf1fhh/GCSeEFIjuq3Q9acaPOza8U1I86ouRkX
	ZpjjU8vb3mjYxUispzGGP0bXZzHxAnw1sje4/UvStCmoslsbOk9XhbMBQKq0k1yf
	GwL6AwMb8ExdhDj7jDQmxcoVdLBBleiHb+t2DadWoQkFUIRs6W9T5qOWYm9F/q8P
	SUSv69rLQRgtilnUw58TCBXeJrptJ3zg+iAn8j2S7Yi6hSSN1Qg1/yTJeXA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqkvfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9a93f5f3aso467377e0c.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115110; x=1790719910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZOnCj5K3G8cEVBNMsfUljTX+GYt6YzMcKsUYnLBFe8=;
        b=Z4pzR88m0ukojy8NDTpPaXMoPL+Rq7t6yKjU8kjxX+vU3T/acAGB1+f4GBr97re1eO
         CEzNF1BBFiM9/ybKzZJTxxC1y9TTxxaSg1bATSAbEwTL8OaMpSu1Ii7v4tAL451avCCl
         8U1n+e4zkI+F5hIPY7UD+pPHXMRTEEL5fhL//kaCm3ywzRhp8iiJTVT38ggfRjJ3VAOP
         oPjbpEQgFw9kWQZRi20O1dZTPagscTJZddAdbwLmI7l/ROM6WjeYLqCGubWMfhKzG56o
         Cr6Du1Xq78TsfvY9dzuRY7HQDcossNFdnVkC0251SV/NDbnMWCUY2DeDXcvUIaMFSv68
         49/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115110; x=1790719910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZOnCj5K3G8cEVBNMsfUljTX+GYt6YzMcKsUYnLBFe8=;
        b=vrFvs/Jj47DO83/d61sTMvxGxbF6xiUu0oCaJYtLJdcsOYjieXCo+f/FYHRmqy7QH2
         NOKKfT6eRoohZhMa5nBtvbA0BXfcd9zwjUJzZnQyjIM0rqXKvL7hnmUw0niSRNm0TpEy
         izAru9g4PqaxR4Yz6GddByZm41SvR9yVsl3MvE34lOpQcr3i/5PghAr7aC5HPsX1AQqp
         bgwGVYNHwy90zod8ZVAKh36LD/3c/D6pSkYWIO0C6efQ3U90CZ0IxUsyYCBTwfy2ySU7
         6C1ABFMPLYKi4ItMQI/r+ctkiP76+zit5YvdYkRH0XbfRtoRrQ64GGwdJyyFdQb4NO9d
         gUKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9HR23IIhrncU4Ose6BaNWdVL72LUqIWsUed/K1JuZgrXAO1FQnt18UpexL09nM6vMpkgAZtiTKqi3@vger.kernel.org
X-Gm-Message-State: AFuF++k+iTrQay3JBzp+e79CtxC0+FasM23I7EgI9Vn43BZsDHuOTX0N
	PsKktu4RHG2qIPtHi3Fw5nX/R4pOVIYq7aGm1T72wwM6Xr83FUq5/wyrHHmO2BAT/qJXgRAh3L7
	wrFcbIcc50o1GIKrZP3rVjU2IbnBaOLx5+lbGKC51+m9JnjLds5YgMJElM6xvARnD
X-Gm-Gg: AYBFou0C2DIoUDTP0x3Nsz11/igryZyK3ZgTAz3j0qlfCA9Ycsgya7rReOZll8vL+PM
	P8T0ocYlHjUJLDQMkIVJez5QfZiJZSec75E9t5zg09Ggy4kyIkyMwsKQWr5h1Sm4OCqQSzwAerr
	JeP2/EfDUKtYpntx9UpqBSWUr3Jzh2WPm+yvFVeJ49NQoP0VusIIGlD7a52L3vqnTGee6NtpEXk
	Pf9u+v8S1oPxSZ0/GqfhYXTH74kNi0bTT+Dowy5RlSn0sUIup4p1T4AaV4j3plsuL9Thx1xXhAq
	aiGOh6hJlxtK//j1H+3gshZJ/OhGg1hhmeGIbRxSU8UVS1gD3FepAy5aGUKuYVKfY26a2vQnrPa
	00aj4Jhrz85RMzVPjzue37MHBoDJItTmls7x+Brr4P3+mP5+6QAaRjS6mfLgpl9Oq
X-Received: by 2002:a05:6102:91c:b0:79d:cfe4:7202 with SMTP id ada2fe7eead31-7ac1ba35a39mr935728137.11.1790115110468;
        Tue, 22 Sep 2026 15:11:50 -0700 (PDT)
X-Received: by 2002:a05:6102:91c:b0:79d:cfe4:7202 with SMTP id ada2fe7eead31-7ac1ba35a39mr935704137.11.1790115109838;
        Tue, 22 Sep 2026 15:11:49 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 3/5] arm64: dts: qcom: agatti: add LPASS devices
Date: Tue, 22 Sep 2026 23:11:25 +0100
Message-ID: <30285f0267cacf2dc2f7c19cfbb10bd42d50310c.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX63jGnxugzntf
 kMbRMztuXVLZyYuHYVjJAmeRP0jQX0frt0FpFH0kcTSbPImv5Vh2lA+q0YpQB9KmQjGtL2NsBGa
 zmdpHrOgAzWlReeYBcSxRaP447xA3sHRYRjLYFSXMs9oWu9sfyHh0jBb1hdn4+nhWoTwGSEtVhk
 XhizHcDkkBzot9iD5qHzOGM26WZtB/LqZ7y6wSb60jmBmPWZsmybfoDUa7xAy0sN4/wNUiHCtY0
 F/wQ4nX3xr+bjwHbHA/bbtSQ0NwhHlA1XMrOuPxKWEukUxtha6ZO1YdbbJlHgp6lgwJpYI/Ofge
 3ydNNKSKCPIFe6vksjg1VpjjXbhrLWDGQshSPf2E1AgalyYfR4dsbBBoYaJUBtMvUvdW+115Zd9
 kU5Ccp4SkbSDhdCLxPIhNr7166uhw8KBjRulO1pkncQcpQ1pmMUWkRb4IQCgY3TXqea9QNlCzvO
 h/siUQ7Oe1GmVwwT4xw==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2fd27 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=OKQivFIISjCID7q7bPgA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WcXwjBaGSDws526MLuFlhj75hEHJ4Dp3
X-Proofpoint-GUID: WcXwjBaGSDws526MLuFlhj75hEHJ4Dp3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX99SVJqQs2O2R
 7dxRdV4akf5LRRv3gtR869exZj68QKXFOd18o62JOxX76Z85Fr1pwR6kPq3MpjR8yLmcq8zVxLC
 Q+s17M1EudpAZcZrFbxb+yyOvzJdPe8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

From: Alexey Klimov <alexey.klimov@linaro.org>

The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
controllers are required to support audio playback and
audio capture on sm6115 and its derivatives.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 157 +++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index e7fed60a59d9..6d99e24e3dc2 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -770,6 +770,42 @@ data-pins {
 					drive-strength = <8>;
 				};
 			};
+
+			lpass_tx_swr_active: lpass-tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2";
+					function = "swr_tx_data";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-bus-hold;
+				};
+			};
+
+			lpass_rx_swr_active: lpass-rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		gcc: clock-controller@1400000 {
@@ -2238,6 +2274,127 @@ glink-edge {
 			};
 		};
 
+		rxmacro: codec@a600000 {
+			compatible = "qcom,sm6115-lpass-rx-macro";
+			reg = <0x0 0xa600000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@a610000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a610000 0x0 0x10000>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+
+			resets = <&lpass_audiocc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "RX";
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		txmacro: codec@a620000 {
+			compatible = "qcom,sm6115-lpass-tx-macro";
+			reg = <0x0 0x0a620000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_audiocc: clock-controller@a6a9000 {
+			compatible = "qcom,sm6115-lpassaudiocc";
+			reg = <0x0 0x0a6a9000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
+		vamacro: codec@a730000 {
+			compatible = "qcom,sm6115-lpass-va-macro";
+			reg = <0x0 0x0a730000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "dcodec",
+				      "npl";
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		swr0: soundwire@a740000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a740000 0x0 0x10000>;
+			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&txmacro>;
+			clock-names = "iface";
+
+			resets = <&lpasscc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "VA_TX";
+			qcom,din-ports = <3>;
+			qcom,dout-ports = <0>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		lpasscc: clock-controller@a7ec000 {
+			compatible = "qcom,sm6115-lpasscc";
+			reg = <0x0 0x0a7e0000 0x0 0x12000>;
+			#reset-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@ab00000 {
 			compatible = "qcom,qcm2290-adsp-pas", "qcom,sm6115-adsp-pas";
 			reg = <0x0 0x0ab00000 0x0 0x100>;
-- 
2.53.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991B6474269
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938002; cv=none; b=sbHbbLrl7CDePkKIwE0Ziu4SfbVyYAH7OGTkG23ySUhiekIzlEcrCQj/F8cDTT69MaHoWqiNIvpjRLGSCjXZ7us9Vss0ZPChQmGsVyTh77QjERgwGGkyTisRRQYqRRTV5mRzSirMarNkkloUTzu3OqRtJxDC8qlDFAFwF2Y4mp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938002; c=relaxed/simple;
	bh=AQmvJX6Nuci3e5n5qvrcudWGnYySqxNcGkS/kJegtyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FB1Uwqzz55mRbUOPaj2anVmo01pyx/7V8A9Ci8ZVz+bDNX8C7yivaKwZVNvdB5Or+hrhOSUIQhfXJkKT/6rqO4M35ukRRoIXLH8k4jEtaKl7n2R1E72Ne7/q1c2YLkZPHs7eyuun6cB40gF7I3Z+soR23shlHC0rktyWpOsAsJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6OQI39G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XwhpekJG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6OQI39G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XwhpekJG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DKrdn2778580
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 13:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WghKy2QgIFqNw57MRraz0/pbpdCWerjS4CjNHDDJT8Q=; b=D6OQI39Gs72VHY3B
	OUprlOdCdsBJPlPvLVqPnNxYfKGs68oaiT3NvSiusDpDVfBlzoC/hpQ7wcdeDbgQ
	sToq0pu/q2b5o+8xUNGYb4kdkw9A/J14b6xZnnfpUJu2XpWpAiVZrCra0wKWBuHl
	E3agT+ZrPgO7vRlUmqqkPaXFNG0SgRUAhlcKXVMgHfxXktrAjss0Pr/od8CVuD37
	gV+6JFRJsSb8zhkAkp12dvgHZJSBAf5sgiWhHp7kuJn9Y0kepoxjs20Sq7SwBXHC
	JRaYwuA+P5YGFJhLfs1+206qkhrnVkpvSMUvQ2wCaWu+sTZYUXPLu7Gn5mwx+lLk
	B0DRYw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x9r5vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:53:18 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7f5b54da461so14970237b3.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937998; x=1786542798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WghKy2QgIFqNw57MRraz0/pbpdCWerjS4CjNHDDJT8Q=;
        b=XwhpekJGNp3dKEySmKL6nZOhlcguE2oxpWwm/KyhVaPuhfuwQ862bkGKlkas6u37j9
         q4mVrEi/cHnnhJ+l4Qy9uk1hcLNUbFTAYsWZ/Z+iD6egUwMZJReBKxj3YxWvCLbQFQ1v
         t+Vle+j6+mVpwDpuHzAFie/e1Y7OnPycq5I/0cBa+rref27wKNBUR/vrZsMyvinaeMUi
         Oan4x9aUM0i38fk439zUCR8gI2nq5JbA8lStL3lzRKC+16CJVkHiXTa2VyZ1ngVgAEys
         kBQXqQJoAd/YZOuqyiVRc4EZo4BFwYtpLMm7j5ntXAPORc5HtgTGz9MrS9VPXUqRxrFE
         V1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937998; x=1786542798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WghKy2QgIFqNw57MRraz0/pbpdCWerjS4CjNHDDJT8Q=;
        b=QWS6Ws9oF4FcVXVmax4DPcltqSUFy22lIzGQgKdn5G5d218F6WTaddARLoDPHxXeDH
         Esasf0pv10FQ5Ap5kqkTxVpF3eSonv04FzUX+q6bGTzlITWcUAyD0dMYRjpyKvqixnNQ
         N7yFzhCkJC2/fkhUJiVlu1ZKHtLTRi23nmlC6FhXK8mLYcsodxO99welAGLM4kGj4zuS
         5EQ2A9FBt4fM6DdKWzEaCVBoXJf/aJuJ3eQLtR0MAFt5M/3LFuca4DDyV6c55xFJ9lnb
         r1w5y0JDvepJ3BohRuxsPKM+VHwkER9ohfejZvQJuoAXZe1JIVMIb2IOZoi0q8BPkubJ
         3NVA==
X-Forwarded-Encrypted: i=1; AHgh+RqSRrv/rWLLvhz2wiBzUhPHbYLXZ6ZkqyzQKZ5/e0KRr/VrgN156tnE6PprWyuzdxAiJ5zLLyfRowQV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz37xrAHsms0FlcYSM+rYPUT1nP4WTPJUabtLJLiv+Eb8nkVFLk
	lSoiECSzPYoEPHAJi75ODPlbg4VkuD2qfseP0LhlrjIlvY3HR2OQli8H5h2TMGuZN4n6aUVSUga
	W3Mi8TiBOw1dDumXv2u6xVqeo8j6ppVzuUFbS05knUz6fB0uWFoly9bGtjFHGJjjOoN/p5A7E
X-Gm-Gg: AR+sD136DlYZXReThELaqEHjNBZKypAm5beuHr2QEoDHPNkAtr2mi/OjAacfpOKlgTE
	Z+2VfsH67aV9gchTIM2bxmSmwb+LMDaYfDeLRdVUsQVR3bXL0mV3IunQwIzE5Iz+O8dHGKCGTVv
	gm8fYvJE8rrukL4EOiQTooH9lClHTgYJU4AFrqXbV41hvDX35+5ZuANZPPGQ4AD8cHOMmWLHBIK
	S07YX3KFzcHKwjlNkvCVDXqfw7ePhfJL+oW2P6o+Dnx4nq33Fldx07ufvAmGm0qMIadk+swtK4s
	2dzX8ELtDQit7cM7KUEC0Qeof42O9X/w76v6NRPG0rF4QDh1/sNwjlDcETyZAKnglFRt6zUzZ+a
	hnmL6cDxxhuXO91SAnD9VOPo0dzr/uqQ=
X-Received: by 2002:a05:690c:23c1:b0:81f:b410:b214 with SMTP id 00721157ae682-820224e0f36mr36672447b3.27.1785937997908;
        Wed, 05 Aug 2026 06:53:17 -0700 (PDT)
X-Received: by 2002:a05:690c:23c1:b0:81f:b410:b214 with SMTP id 00721157ae682-820224e0f36mr36671977b3.27.1785937997363;
        Wed, 05 Aug 2026 06:53:17 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:17 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 19:22:47 +0530
Subject: [PATCH RESEND v6 2/5] arm64: dts: qcom: shikra: Add CCI
 definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-shikra-camss-review-v6-2-a8dbc66f0d87@oss.qualcomm.com>
References: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
In-Reply-To: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=2668;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=AQmvJX6Nuci3e5n5qvrcudWGnYySqxNcGkS/kJegtyo=;
 b=a/wikjRFPxGG3nl4SJTiUqzc0Ku7M1qEAnrloJHSLS5eLVpA+ur2kXi9sKevQB5LgmLo3IcQk
 IEKoapUU/R+Cwo/07PwujCGvGWLTLFulI1t2tV2DnYjF7zRfvsilRUD
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfXzG1qoNfcLw1W
 bj8An+3e+0LPFUGoviGxiR+sg3Du3xbs59MOfmy/hZ0LEReYhvN/61mXPm8FR10Q/zRT1xMuOGK
 J8SemXLElcFk00socGV6OJ4pI+J/K7+kqyFC21VFqJnJVUUtMohdcuZNkatQ6V/6nr+RNG22aRb
 npGMsL+1Iidme7EIU6bwvHAO22e8xsDS5Srva7BzEAKmAZA0/EbjnCdgKL7bSpQoEVsaH2TL/vi
 ZThysk42iiZdTsQaWWGjXqsxHFgxZhpKdp36yMeuhQPj8jyXfw3n7VfKahyWuXfsBm8Og4S493J
 3BO0vcw1HxkW3V6NCqUpYhfUNbNivXz0A9TV9xg1uhf2x0CBXXMV6um0LHMnoryOZ3RT0b8KeK4
 Kj5d9ybqslanvjysqUqFu+NPcA1cYetXJkL1En6WZn9B/2ylmW/NsVKvEBbceFZPTM4Pdd9SsMa
 IK1PO7eV/eGolmd8eng==
X-Proofpoint-ORIG-GUID: fT_vp1qq0MwesY116p3k0o9-ZqSTigkN
X-Authority-Analysis: v=2.4 cv=BMqDalQG c=1 sm=1 tr=0 ts=6a73404e cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fT_vp1qq0MwesY116p3k0o9-ZqSTigkN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfXx0NhlLkQp7bY
 sKzRYtR/4vkXmulW1gq8uTReB1FJJ1mTtm8ySc0WqTox/J5WI+oxt310B0J5C4W+Q7n4lQlIzjf
 IJBo4HkwYS/GKbNFooMmD6PDBFuKmIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050112

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
index 2e5976861253f4402c75509f52301c21e3864d1e..ddfcfb137bb29439ce20ba6ebf3a76693792b56c 100644
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


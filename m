Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286243BB69A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507585; cv=none; b=aPna0PEDLXT+W8Yo0A80XanCzAoG3IJfbn/TsLIowbbJp+uWXwLJMrAQFLgx/859Sui+KHLvme/DT42dW1Yg8WhlN6rzoKdknEBbiYa/4yujbHgb+PDW8FmUNi1uCBj3aD2I4wdH1K8MCuWbmf04kkStqUqWPjoY3UMXm0OwxFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507585; c=relaxed/simple;
	bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jrY3dlvQNRyB83aEL1pcTScdn2/IPOvJ7556JUkKo5B+HWLHnFy6lQ92DZkMm0KHCg7QJ0QLGLLDxe1bP47NbeUxbXZDGd9tLXaoO3k7OtvLU2aKTkwEZ6pM7vPKAuKuQtnGBXqM+wr8ZyADb3G7TI7T2+m4SK72R/VSQbv6mzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gV3FlwnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbGWaDm9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gV3FlwnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbGWaDm9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KZre3709647
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=; b=gV3FlwnS+mMU1ZWv
	NefsMOoZi0YvbHjNcmXp1y00j8ErfHcA+NDQ/FbqApJ0LQpSJjVRzVh8e1HDPquL
	OZHwWJ9/E6J31dvmgifx76e2BDyOtAwm+C9AWjujwPNfpN5+bZqgGId7JDZFfQao
	VYg3bDcoktnId+//Lc6vusY6XTiIkAc/6LB+bzry3tClfHU5Rawmg99XCIDrrAP4
	Rn6Swe0so34bQzfsMMvuIQWGFi5H2ND2gkZAFmpR5aDkSetiw9lBlNf1PpcLc7oV
	a0PT1JAKz+3Rs/2lOBPmzN3XN/Pk+pAnJf7Vse+killgJ54VQpl8ikNMwtqoTVmH
	C2pTfg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9564r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:13:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37c3620a6faso1077901a91.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 00:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507581; x=1782112381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=GbGWaDm9eK7wcCd3hthjSm9fG2k/JKN1Pbgfq//QlGLQTJsHQvXIih8e1cuIzuF9+1
         /683BKgPtMZaPuBAcDhtt6zqtqOUvmAUoNKO7UQVKRK2lU4dbVLZHCOq/ekQUcohaVUR
         CZX+7gRxiLuArfKa3eLMHB5hpvd9eRcjmRgi+6BRcsA88h2c2J0mS0FXIdyxXlfm8uH6
         x/dkUOBHvgTnlZftPYWX6AF8pE8q+QLRacdDQ84Bpep0Nms+1xCWd9f/TAU/1eEqGw/D
         RKlzSYE2BRG6dAy3mvZLgEIWVrmsHeObw/TJTCUNFDmURzojCLfTve8xlu7qSdtvWXR0
         O+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507581; x=1782112381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=Vb7cvfOHqC4rLuyFHYGcjxTXHawmj2wirQNJdZ5AErO+88KaKJ5eCZtmgvVO0Yt7Au
         EViiKZTPio4YNzxEFBSvEls15HkixHY2Tl8eh2gp/2uB8MA7PwAG1/I+1F8b3zLtLRyY
         orT9FFUDaMAZtibWyXtodPObizkcwgAgwm+28aRVGxIKp6GI9nUEqFPEcCGisWrX6kIG
         T5TK9LYXa8L+/Zjv41pJQhc8OHh9f/6KichL5a3nTVcoo2cioobWYsHV7kQKo3ssHn5n
         hwDrWsIKLZq1PB3rDZ7mkLTKOpzJ4aEQEfXcOX//YWaR6K0Ox6QGUXe7LQ4fObMUJsA5
         Ibgw==
X-Forwarded-Encrypted: i=1; AFNElJ+wmArdHGWOYmeRq4XPOaGqef8xcLyLwgsI2GNMiDHRUCPFn/w9EukbPUOHFSY+F/g8viwD1FFsYcL8@vger.kernel.org
X-Gm-Message-State: AOJu0YxWLbGVdjVI3I63jyBHahBEZf2IWhe1OmcNLyxGBRKsij5j9d6A
	lrt0cQwY7u6SXX6eemQ/EtbqVePFUqNeeXfFNC3MiXgFpW+386gjeERtR3GT7drhXo8arRFaJAa
	E6Jqj9hdLg4iXiqjkgPmbXeOvI7gC5DbK7hoeOCsgwOKRNPibKtXztrO17TuqrTYCcrxuhJEU
X-Gm-Gg: Acq92OEeuutoBpg1EfHMWVlvE4ls9Mc+hD6eKH9nN3wmJIK8O0NvR0QEp60EIdCZTNG
	R7IrsozclqU/S9d+SSFU9lkj1e/L29LP0sTD9KYKBwFmPKE1mBVps2WKgynAqeHqY48+urSp151
	pQ5XKvvq6KDnILNi63mq3i/8fd2CfnIWUROpjZaStLpLTFCi6ixryclfnUvEgaoPZzOuiROel9w
	E5DGUgMDtHjI0mMnU/pQCKFqF7OokCZkSx5Mwe1gkFZ3Rm6toDBYaLqTMXVOE7GSk35y0drv6iW
	uicFB6LmYiHtH4TtUp+wEqgBY20h+DWEDiFt+XP5HnStxWCny0xHUA82Os1asI6ur2YcaZ451s6
	ykHCmWRs+WHeWJlCxqiQjq2x5m0gheRUwKlUPylWYf+V1odcJf5gX
X-Received: by 2002:a17:90b:3fcd:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37c2bc6534fmr9768860a91.7.1781507581233;
        Mon, 15 Jun 2026 00:13:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37c2bc6534fmr9768837a91.7.1781507580798;
        Mon, 15 Jun 2026 00:13:00 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:00 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:14 +0530
Subject: [PATCH v3 3/6] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-3-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=2667;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
 b=MiksEv4dAsytiqn9yWeQj/J3Y6aswxj9dbZTN7SqEhZdVeiE76C0aTVUL4+2Glq3iaO6ojOUy
 YlvQyqQKU1MD6aGx2ZSjsRezHKfmluPRHuZvZS53PBxBi78BTr66Oqw
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: vg__VBa_DcqIEldipZlUxgKfiW6O53bM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX97jKuUN8zdvm
 Sgbjknr23uJsJJKh11iUOACuBKp+hd7LiLe+ZtQZJ+qCEFA89sD+p/IFGD7XODoj4wlc7D6YhDs
 lDgV5wLOgwWBR3wyFq6mPuMqf/KY2/Y=
X-Proofpoint-GUID: vg__VBa_DcqIEldipZlUxgKfiW6O53bM
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2fa5fe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=s9wsCz4ZXjtKvCKk99UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX9QbRPreVA7Pw
 seOp+zEm1UUoW/H5Q7HDPYP4twxBOzWA1whgFm/c0KjVeDGXQmvPYOPwNpDM06gIdCAjgIq5MII
 xRwydzHLtBwwbT0gwY1rst0kfAZRkN0pybqe2ltx2oVmbdMCobE4azcN3jRtRk85MIwu4zGg0mA
 cGxBsbBDkHLt5YURrHPHTAsD4675AUUhV3x0yLASXj6q90pfNiGCNZZgmbgTy3VOkvc+ggu22Sw
 yXQvzksUAzrNNFrYn9CeCMOkYS86kEFiYslmBiYwMUY6DwH28pEw74LeYzLyKEJ8KrM7dFJlGL/
 E8t5ieKAtBtZHeaIyf2B/TkZZGLqOb2mY2mfNodC2eVq6Vks5WbLUhR/uqI5Vn6wxMTn4HHfuq1
 YvCE2QWJ1tSTlhSu6eoJ8hryxr+jZnJSREt8td+65SJDFubTyY2COzPtjJkP75Hb5e0x1TdHA8J
 m0DBLE/rm883YYwD3xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150073

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f0e827996609dab2c09834857a1bffd9560155a6..57732804a6c6a114a407a4a541a1cc7af7635ea2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
 			gpio-ranges = <&tlmm 0 0 165>;
 			wakeup-parent = <&mpm>;
 
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
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";
@@ -702,6 +734,44 @@ port@1 {
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
 
 		qupv3_0: geniqup@4ac0000 {

-- 
2.34.1


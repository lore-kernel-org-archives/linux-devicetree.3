Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587DB3CF66A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175084; cv=none; b=bhQ1XaPSyuUMV9eUnquC/6KVnHUPpuc+xj1t9WyN8MQViQCAv+wsVuqygexQKA9WpMruLJ68gUjT1s8AYJpuqbQAWXPO7ZYkHSnszdEHI4hE66HlWCnM88UFs2NImkMFyHJCIovPIHPM4AXIsG9l4yuu+uLgvBdBKkfVGGoDy8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175084; c=relaxed/simple;
	bh=dOXiXkSm8I1IqmT9OjwuiZVQx6fWN+M+gCcskenvYsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0UgnMBk5v68puHGVBS7+BZVne18as21NAX4KcTLa+LOLckaH73l/DD/Drink2GqxTaTQBzL0nj0l1oeCj93RroSyWBkhnxYccDUEc8UGbiPA0TxMdttj34pY0MyPsEZtkBR8brZ1nTdWReErBcRcwSNNSuW+viSvqPPIWObBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpkUwNwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dz8aA9wb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpkUwNwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dz8aA9wb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J6jMIR353007
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsxkBLLfqZetiG4fi0SQZLa3uVnCY/nG58OferiyW9M=; b=FpkUwNwy7a8bgdHW
	SuOlWB8DYURbkeps3NXvUDbVidMZPdhwjmEl/4cZPS5IPC+JpvDOVddQSZuUGtcW
	0ADiTd/noCulD1tYoyCJgvyUwzhGXsZEbzsVwYwtwNR76LR/4JV75l3Vj8n/UxBh
	Uv4C9bS/0ZBQLo9uRmOUQWFWlFSYXBiKPfBPak/h8NIzI26oiYBqKX3PJ3bADkKG
	mlzFQU6KQ7IMiR/F2x1zKkiNB4CP7CttHzw0H9t2M+8cmj4YwclzxYrqO0/4TFYR
	zohMsZ7tYr0/yEr2R4nMBftf5TcO0VeQREWK6jJ4Gzg/a8coizMcG6Ox2zKSbx9Y
	dxHjgA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xjamvq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:02 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1329791f18fso5601422c88.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175081; x=1779779881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsxkBLLfqZetiG4fi0SQZLa3uVnCY/nG58OferiyW9M=;
        b=dz8aA9wbM/0atWxYeY6fCmtEX5SVf0wn+KTa97IPe+DVEiy0xmtCZQsttBfnpwGVuI
         s0dbOBtPZB4ZZMyKr3SQe6/7pxkpvGJYFLNxhCg6YXjG0o68GmAgBzDHk/jdG7jZBFbO
         2l7PkFt0qVEsihELgv8L5YsbuBS+YLm9SU1ilHDBtRp9HGsn/0guw4EBY6/5brDQBvME
         E09iGQG0bECY9gYaDxeyIPZX8TIY99aALy2b8b2/GNqzqSqpZjGav6KrPc8/ioAHLA1q
         b9hyX9slozkAQVV0EN5E15U3y99RIdQeRrPJ99IDeI/p3jYLqdJJaRogZyjLGYJcJiVm
         vwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175081; x=1779779881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BsxkBLLfqZetiG4fi0SQZLa3uVnCY/nG58OferiyW9M=;
        b=lD5J2XaBl0xCKq7l4gGZkY/EkSFitWVM9sSr8h2ObSKJClxbNrO4+af7yc7ZFMXCxl
         Bugvd0y9PTnmzzSg4DMuXBomHqjSbFu7IgQjuv5Tg+AVDN6AiqjUXpbc5n6nNmBGQNM9
         RPWQVFJzKthgZnSav9czdyQ84wXfeREQOjnAgPh/hosnKIeYNN0ybGxUCcef86cHAk82
         /nmh79W+uEFh5GqKjKWr387/0o7b5aMfXtlk/HSqRk6bNuXHNL6mMegf0IRx3YCOibJc
         nPFw/Rro2qJMyOlSGD0Oc2c5A5nc3yJO3cyvghJDA0ZCmRNHnXLqlXmq6fHYAdCpg8UN
         hXBQ==
X-Forwarded-Encrypted: i=1; AFNElJ98tmYSe6kqP1Lux2vPlvceS/8FFcwAO8f7Bt/3kubS0W25/ecapbPge4JWI2ivEHX5DQ/CfACzg5jH@vger.kernel.org
X-Gm-Message-State: AOJu0YwwKKoWF5TBJxm7NtvvZLXDkhYo/oHmNeZkNgdUg28N+vbHWvhx
	ZQqYeTula3goyy6f6wrM8426IU7nxqipn07i242X8FBgt9wtsO58wjTe6K74r3ZniP1+75gqVeb
	vZQ7n6qRVF3Bk8FzU8qiXEFo7bFFx3wqsqPAJuVV/voR96OtUGPe/rrTP0qjqWNrd
X-Gm-Gg: Acq92OFJRJPA6iaKpjfSx7t2BIEHlhSkkMxVQdeRd8kgn8suW9EJ5OU5DU7iQowtElf
	SUky/hd1jImecTVqelJmICHGB+51x4iSkkp/SrufqIHfSaH6L7P9yM27xU4ksKwhdcx7xYwepDQ
	oxbpZ+7zEQHscy6c4cJeGbAvFvJbWV2IX7vF8axj02N0XzmGl4GTYJ9vHONcoe5R0dZ07DGQHBJ
	WjJ1+zMlPbw7OJ1gyDagJRA4imrZMMVvDGOA8jNqSeedavxzvVdwh2aCIOm3osSafCUhys1zvOf
	n+S9f4Kl/T2ifz6YAw0FxvB8weU+wKOKQOJmRxP7tySY1X0MgitaZZY18eObDXuhzW5BxmzmtFg
	QsV9Jg8aU+5G+VdQ4mePpEOimT90Xd1VC16euV2XhWc1GurlqAbn+P8tVpLdKvRtoaWl54IhU7a
	hD
X-Received: by 2002:a05:7022:6181:b0:127:366f:8bb7 with SMTP id a92af1059eb24-1350483cd93mr8518244c88.25.1779175080964;
        Tue, 19 May 2026 00:18:00 -0700 (PDT)
X-Received: by 2002:a05:7022:6181:b0:127:366f:8bb7 with SMTP id a92af1059eb24-1350483cd93mr8518217c88.25.1779175080350;
        Tue, 19 May 2026 00:18:00 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23323747c88.7.2026.05.19.00.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:17:59 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:17:57 -0700
Subject: [PATCH 2/3] arm64: dts: qcom: sm8750: Add CCI definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pakala-camera-v1-2-b6d897864916@oss.qualcomm.com>
References: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
In-Reply-To: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MCBTYWx0ZWRfXzQzXktwpVm5c
 xuDe6TDd3AxS2Ha3IhFJq3ChDGTZaatxPazXNxweMeljOBksZrEwvNsVgWqEyl9PlZCpVtj4ZqD
 vgrxpgouDIZmqJ1NGNxmpYyaELFpxO2Sa9+rkXCpQa7oH4S1wXimLErI/nMzmUY/i8u2kb3qS6P
 3H8BcvOzium1aacqZSnqzqgoqKurQ+LdX4q76fTcrfzNq+fTAlmd83nMDaafyNDZmKSH/rLrEWQ
 zNBJZLDLbTDJXqFDZ3jGmMGKPjdH3ZcmJ2tJRyMh53yyQiVGPxeKHzMdmpThNPX/MivhwzNik/1
 pxbApnAAVBLnaRtjB0mnjao0Z9xvOrX4f7LOA0JwINFXwAv1Wsbfc06klgnasFQLNVbJhz5cYJg
 FGvYiYjusJ9rZ3MBCanBLrNwuAecVXsxsBADhlfmI3lpbKfWuyv+vGCPCEXoH0wuIQQmBgk6qm2
 O5lWhreJlgDEpnvYAsQ==
X-Authority-Analysis: v=2.4 cv=BYHoFLt2 c=1 sm=1 tr=0 ts=6a0c0eaa cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=--cV21oE9J2x1QxDxCAA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: P9JGtn4yGyEn_71y_jDKXIyz7IytgyfE
X-Proofpoint-GUID: P9JGtn4yGyEn_71y_jDKXIyz7IytgyfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190070

Qualcomm SM8750 SoC has three Camera Control Interface (CCI). Each
controller contains two I2C hosts.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 282 +++++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 8ed3d8c791e3..7570189fdb5d 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3032,6 +3032,96 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac7b000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac7c000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7c000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@ac7d000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7d000 0x0 0x1000>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
+			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@ad27000 {
 			compatible = "qcom,sm8750-camss";
 
@@ -3804,6 +3894,198 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_0_default: cci2-0-default-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_1_default: cci2-1-default-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio64", "gpio65";

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200894;
	b=CQMsLOlMsuC1vsomcVml5y0vJo/uF1Kl6BPm/+pm/A6j2SdOnQbaksuSqOoOfX1tyX9i
	 86i60kDbDm6jX0NtZDt+nkeioif5D+xvByNI2lPMOGS86XydlYEhg1C1kHeVKYmJZUKB/
	 Yf4hEZQl13a/ptwOXzPeOT7krXQol+H+OVmw1KzlirpbNwdooSnm0O+0s2biHf8+fTyXF
	 pk5+/Q24vYdP9z+zjGsQPIPuIUgzwibUqYFWJEbQ1OJvlCbk0nEqslFMZW4u2izxuCPYE
	 29cxZKGorSgCQJUjNlBKNAmLTIn0NAio+t5rA7ocifeYEm+BJklbgFu+z74EuMnYX+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QJtv1elE22/fRjimfKOj8JWMX+qMHWo6gdQpzkiKlMs=;
	b=gTceMDnA/2F9HzW1vYEBAvpJ0rTHJ2Za50puT+0FhvBktIea8RmWIDEhYq1Lk+g4mtfj
	 a4eA0Aj37C7D3cZGfhxiW2L82dIuqLPm93qgcvWEdBAIZtYprLQs8XZATyG3GoUFmQKAH
	 msxAQMPnIlegFw+b87vZNxggc1bPN9w34bnzNIq9SW2p8QzWjc32CFQqgATfGtkXRcQCG
	 GFpOBZtWi76mhJejfyoDahpLUN3nrkLL6APKBTDUKSbRx0X3npC4HqbHXrOgU07+oGYTd
	 ACP3caCOADvZBOY+UUK22P44zfGLwH9AIEAu6nX3ru25Y8SzExfCuytQzddAAdlmoFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4W73ywx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FuakXJqs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1610E606AB2B
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1610E606AB2B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4W73ywx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FuakXJqs
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAedw423530
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJtv1elE22/fRjimfKOj8JWMX+qMHWo6gdQpzkiKlMs=; b=h4W73ywxA4Q8m0U5
	Usk6b5h8PQNTEKu35aqmA2uN6VgL2B4w9WmiKNwMRqdCErb692kjYqpCclh6PIaw
	xZmryNihJQZCmqhlwVlzjC1wxDw8NezzHWMGYHGVpL4yk9XVoe98e5Ws/aq+OXsS
	1Ydlysa1C+zZmSvIzt6epqcXdkujkjmL/u7kOwcJ+Xvd5JGqaX9LLTwJaOMr5D0u
	DZ/dUfHtftHP3Thqmi62940ZP7CRdUjaxO/BabvnHxVDjFjpTXPaFpQY05+JJKe5
	5MY+cWbUHndhcrSqu6jA/nib2R/BfqlpUIBU6yiL4h8Ucv47iDn5RVxVWUnZH9zU
	WYrg4g==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1h39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:33 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-677c2db10b1so1847318d50.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200893; x=1793805693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJtv1elE22/fRjimfKOj8JWMX+qMHWo6gdQpzkiKlMs=;
        b=FuakXJqscFrsoY1Ube8ogsGMBtrSk16eGx9vSl0HR5iu3i+nbWSmkABkmSX/RNnrt3
         jHOADid+TWhGxkWgHzyD0GJ+rb1tpIf7LErIkBlk4Rhrq6gMxt9R8ZCAu8OErhllHYt2
         1C3yyk5ua5Y+l8PePDSyHKwxSaesHogfiL/5hSQp/vOSYoixQTfkFayHq/M5sBfITHys
         i4UN5Y6VHzJGqp7NI9VlWGPiDq4sjuhBToLIyF3SCezHlPOf7OMnShc4IGla6n1Pep4Z
         AFcgQBkl2gyopTsdHJ1MTZ5wNHQQdFagxEmxYGh4Ae/4BaEIbHg9N05NdruKc5IyjclL
         tRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200893; x=1793805693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJtv1elE22/fRjimfKOj8JWMX+qMHWo6gdQpzkiKlMs=;
        b=1w8w3MD+5sh/BDgmm7LbH8IjhQhhbl8hzJf3EKAbAWVzoLjyHkZ6igruQBLXWr2lzG
         /NWXKKZ9i280I064X87kqbvpdEdvJFvn9UFXT9oxCWsuxHRhr/Gn21ZlP7Iz5z3OlVsF
         /QwHJRDs/M+wjA1hMKtlPLsICrbGSjRR6POsmH5oikSjF9tUlwl3uAbv64y9Z0vXq/+N
         HLnLagk0Eq4zeOCVwfVQWzgZc3fwi52V/K910NZHTw3Iz+WMWQZM7VBEkL6XRG0olYL3
         MpK+vLiheexu8wnzOPIG8yr5xOCSEA3PrkV8uCIA/AnwC4XOSV2dfW2Hef09MNfdmE8w
         G/Gg==
X-Forwarded-Encrypted: i=1; AKwUvByIBysR5egGgKc2nZKJjsQYgrLmkPKiDj5zPxEFd10heM5JfUR2EJxRxpJjySIivrcs99qfNYFRVEGk@vger.kernel.org
X-Gm-Message-State: AFq9FYI09T8xqdvJh8XmQAZl/D1EdqQP3ED+8YckjG5HwQLRqu/XhuxU
	uo+yULkO4ZzzH1YtJFMGS96PtvSzIQwH8UcMv/mPh4vOY4x6RVtm6giiqC+3jhTTjmRnmHa4Ptq
	bPzN443WXAX2ExRh0azOc3NDrYYmO9KXl9Ev2Sr16YglU/3Wxyz3Mn74+G5Kl5wHs
X-Gm-Gg: AYBFou2a8B4dduyq3jFsH2tDtU4Hg9d/zHL22pxieMv8IuxT3QpztIXcbKe/yWLrUmY
	LbhbGvJ+BvPC+8lS9sHXTGk7AlhDomaLFJjFUdRNyadpQHDoiAgG+pPmZda/bTjJM7wbvb1wuch
	8XGeLhKtTc/ztlkccFWXGB5pXnWkp1KQmjwgYxp0gUSiMVSxAtX6o9/bmusQhyWJZt0koGNeaFp
	3NEtLLBMBR+SJRWfbToMY2CEa7qvB7EBw01AxVD0SRysgQY1G+JZBEKxCIFqvLwwEtDqcEYC5jw
	nkpZL8DOfLX3yXQPP9Jj9At7yoqmcPxXclOPozkBiAIQGibwDQKwjBk9HUImQTztjvVoH0Pt4FX
	lWUs5NvQ9zrARuTpSv1sRvPLpFF/rSSe3gVyTSCaOAecicIZO1/5TQ/RFAyIaz1Vs9t5zlM0Kk2
	Ivs7lYWVpDzgKteQWwgbiNs83KdIdHzO4BxvenRna5eJLQkxdV1SM/xXOsJna2
X-Received: by 2002:a05:690e:43ce:b0:679:cc49:55e6 with SMTP id 956f58d0204a3-67a7bd19598mr1289971d50.80.1793200892578;
        Wed, 28 Oct 2026 08:21:32 -0700 (PDT)
X-Received: by 2002:a05:690e:43ce:b0:679:cc49:55e6 with SMTP id 956f58d0204a3-67a7bd19598mr1289910d50.80.1793200891909;
        Wed, 28 Oct 2026 08:21:31 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:47 -0700
Subject: [PATCH v23 13/15] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-kaanapali-camss-v23-13-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: _a2wLCCzmY7v0k-CGTXuV1TlaV-zIlFq
X-Proofpoint-ORIG-GUID: _a2wLCCzmY7v0k-CGTXuV1TlaV-zIlFq
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae212fd cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=09nyjJ-fxQ_OzqxZyrIA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX3uwJ5ubYZ2A2
 dbkMcF7AgtshoqcrRB7pWoHKEf/n0pDhUhKaRHBgPYk4iSEpoJFKDS/I9Dd1NZRMroADfDmIXYq
 CuJMM2MesTm1r1xnF4FhZMi0ZeeIowx69ZwRVkY6cdR4WlqyocioUpE+3Te1erk/rZ7jAcmaMQ7
 Py6xlkGWwEKE6Lqbj/tqLGswVEteGtW+0Vt3Id+yGdwCv9kySh5BLCC7myhSrSYsBEjMlmpqCbb
 fCFHY4bcCoVnGazqFD+QLIPY6V1cxdQDsBl++uopfTrgB8NJUen7BOhWSxZl+Ncugq6z1SrIo/g
 ctpXmQ1Rb70kqHnMjydyCfMyDwqgwB+WVATQabqRAwREHhwaNuyQs3qHhA/yXutqZ3RiM5pxJiV
 uf7j2riz8hZecN4FC/A92sbaP6Hf5r3TuV6jAIK3hlZmvjVEQra5eTkWOwVkkqiubzzXgmPBgcU
 uynsJmCrcx2tdHQ83IQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX7U3+0kvOBXgz
 dRK1TvvqZLqBreywEh/Ppi4FmcK/xsJGt5snJrDvT4pOZNIYznDzFeJ9RoZ08ZY1ctGs19E9PMX
 gWSQFZ7f0ozJb19lWN61Vc8bytXwnl0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

Add the three Camera Control Interface (CCI) controllers present on the
Kaanapali SoC. Each controller provides two I2C hosts used for camera
sensor control, so define the controller nodes and their pinctrl states.

The first bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio109
cci_i2c_scl0 = gpio110

cci_i2c_sda1 = gpio111
cci_i2c_scl1 = gpio112

The second bus has two CCI bus master pinouts:
cci_i2c_sda3 = gpio113
cci_i2c_scl3 = gpio114

cci_i2c_sda4 = gpio107
cci_i2c_scl4 = gpio160

The third bus has two CCI bus master pinouts:
cci_i2c_sda5 = gpio108
cci_i2c_scl5 = gpio149

cci_i2c_sda6 = gpio115
cci_i2c_scl6 = gpio116

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 0c8fd7da55b7..bf3922f0ffb3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3748,6 +3748,117 @@ camss_csiphy5_in_port: port@5 {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
+			pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
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
+		cci1: cci@941c000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
+			pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
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
+		cci2: cci@941d000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
+			pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
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
 		csiphy0: phy@9523000 {
 			compatible = "qcom,kaanapali-csi2-phy";
 			reg = <0x0 0x09523000 0x0 0x2000>;
@@ -4536,6 +4647,198 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_i2c0_default: cci0-i2c0-default-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c0_sleep: cci0-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_default: cci0-i2c1-default-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_sleep: cci0-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_default: cci1-i2c0-default-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_sleep: cci1-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_default: cci1-i2c1-default-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_sleep: cci1-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_default: cci2-i2c0-default-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_sleep: cci2-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_default: cci2-i2c1-default-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_sleep: cci2-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio66", "gpio67";

-- 
2.34.1


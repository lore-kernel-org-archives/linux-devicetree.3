Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548063;
	b=KosRUgo1m65Cq3+2GBa/cn+/CnwukclmPkDUKGdYI9A4vVFpe+cECR+ppdC4Ena06f1q
	 6i318lkcbRdEjWtvtiILQ5ajOi7kdeBr9eCAeIewtGA1XZnn3tUeOr8E2MEqhatoWluOw
	 saJS9DB6LGH4LTSZSBZNRjvSJIghHIcUf6QdMC1xYG4rUh1EKeNNJHlVwKOkzQEOPn4oC
	 5+TsGnTYAAq9XrlxhivTz5UW2AGGvVwTtOhR1blts5JQre1uMa8GNTKWSWOB4GdjRhEXw
	 q8YCpixLh4M9fM8BgPeqkmYRHgLv0Mr7MHnu39IKS+fgkTqjWVcWMkMIlMK0v2Wrkpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548063;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nJPwAoljw5+lmQOqvX+chl3cD6Qer3JM6uT5px6LGGE=;
	b=cSczqiozbFvjeG4wsfPE35OWUYjrILwkFlVlbvIF1yGkFNsSDLQLLD+KOawzziU3U8xW
	 ycimMSRlssGXej/0l73HD5tM7407GkSTZiz6CkeHgtfT21VlpjmD7ewM1TjcspQEif3PT
	 JlFf1isggI9t9meTkztdjTyydAewmLYcC5vhafP6yY+Mh8mxvKcfA4l/iDdaw7dDjDr8c
	 LuSDNPFr0WsfRfsF+kHak16kk2aSOH8jAEqBHtiMuOG+4nF2zqDxt79srvq3pdntCvbaY
	 0WIczIcFLMh0FiX98lBLHnhoG08eex/fks3Sjt/RIykl0FbaziL+yXk+W5P7SG/136Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AS0/rkbd";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNkzGeit;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C527606AD78
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C527606AD78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AS0/rkbd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNkzGeit
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57hYe980164
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJPwAoljw5+lmQOqvX+chl3cD6Qer3JM6uT5px6LGGE=; b=AS0/rkbdJUBd/7MN
	xFxHCyqspuPEGtMJzl/7gy1OBVwlAQ2aADu73ViAr5TW13EM5vP+8n/wS9I8fnX4
	+Rk8L5YDDrzvoqxhd+BRkqx8iGBaDqk882kj4cO3syd9u7J8E/a/53lPoFjf+Oc/
	1LIYpbPVPz8M1bp/c7JbajRfqN21uecENJumTBdVGOzf6kiUwV6NJCNtGy5r26CQ
	d8JwQ7XtUcgQxQKz3xjRoJEQJyQfmdqY5gT0cebMSzfMF+hmMZawLsLSmjWt+NON
	7zromXGv47YVy3TZcuz2PT9qqP02OMZXh2WxNOksFc+yugNY0DEyMATRlaf9kAtY
	51DGIw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j3h7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:21 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46f178d813bso608292fac.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548061; x=1795152861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJPwAoljw5+lmQOqvX+chl3cD6Qer3JM6uT5px6LGGE=;
        b=WNkzGeitkB/QwEu+eYvVszTC47X+dffb2RQDEfuaj398IOdnjc1RUgczurDczyoPwq
         9OCGpGH7O7l3HAY5oH9oKhCjCaIw9jc8ACsj7XV3twZVA9MuY9DBed/FLXxeVEO29ulx
         0XzHeNAMuGcU/W25jU5k1/a6RGpieNo5okyYFGVPdXAJcdNS2HXfpAeLPQy0KNXM+0SR
         9rO6d/Fs5gij5taFmXiGwgCarTsQOEKuAHjHImyI46HhP/d3Z7BzF71nbDA2EhEaGMuo
         7c0cJJJQFb8Q4A49d4hN/slP9Be8nYkKcpH1ViaiJgZIO8Id5nEPOROyGKU3Z6zG3wmb
         7CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548061; x=1795152861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJPwAoljw5+lmQOqvX+chl3cD6Qer3JM6uT5px6LGGE=;
        b=IAvOeYyQia8hhHBHxNpG0xVpS2wZfkz5XFmibjirb24OZwSJ4YIoaJSyPskUL58Eim
         5L8y2xGR/d/U1G2RsPOCvP8r2O6n+j73p1PPZGc4GvED/SeDnx9buWIGlkpURga1k1MG
         pjzwBuUGm9jo4V9zy8vETTaSMFt9N3EpaeYZ0QKGtsDavMnEYef2gOcvy10d51Ci3qyx
         eVZFZmtxyoTmHVqogYtJs+wC3GBcCZUY9nGYn0kJL/YkeoxrUKkxUE48Jnyna0ZOsA5M
         1j1iJhV105dfGz/B2B0j0/n2pI9yA2iLKi+ovjHunc1xOhgLY3YIEykDCuSah8sl8ECB
         Z3Lg==
X-Forwarded-Encrypted: i=1; AL+hErHTKlFwa6p+CAeUd8c3HP3Miio4+6ouIcxIjBZjlQN6Cn8lDkpvkwFcF/s7Am+EtRg9EDdi78e5zUUq@vger.kernel.org
X-Gm-Message-State: APuU4Z/gvZIke+k5QxCjBcAm3mHcwtxS9iIamo4iEnW/GJRKE3WABBcI
	6bPN1nNPpXsyrnGSRTH2plkezap1hYpb+jAmiBVVeWXRSdhOPKPzoEgbqaumyKzcnah69mfNwbO
	C0EAouL4LlHkHTY0rcxtG+LCUcZQh4OTcELrJhEMK8zcziJ/7Klzj3E1+cfDFYHn+
X-Gm-Gg: AYBFou2KbBf7am+UZTP+h8SZB7jrLFc7O2WvpNQenLhQPbaFsmUwlCOuXveH/IJr12P
	nrF8AU/sMDWBK+Aavv2oNktndubPv5obx8PeE0Tq/pYwVbV9pcijq8oq9ItSPwGWJUmBibBqgt/
	lcOw/W5UCdfMJ/lHWQXnNot+69cZ/jQSb+SOcO99MRI9F6Iw7KRCsGDZ+WU02+1CXBaoyhg1a2L
	j4Oix7Ji4Td+gGktnxIr4gaX+mktt+mpTufClT373u4FB2WdODY1PGxmrvh5qWdAAYeKX6GHOzr
	s7w5dxURhk9C62OvhcRo/r/xsdCT7FZY9So70L4f+9UMx/S4pPqVYU2Urt+zZYnLGDiSV85CA4p
	Vhcbv6Fk47B6UkyvvLsIyO8nFjMSSY1gGI+228iA6rs0idq+7tmJjujm+Jb380ZA9/UaiMoq1/3
	WeI4P07QoSDwMg/hDYUCLpsibMUnTjzeFg50aMmEeKMnehIsMMdrlY7CDV77xh
X-Received: by 2002:a05:6871:522a:b0:493:7742:f0f7 with SMTP id 586e51a60fabf-4afdf49decfmr1711026fac.11.1794548060730;
        Thu, 12 Nov 2026 21:34:20 -0800 (PST)
X-Received: by 2002:a05:6871:522a:b0:493:7742:f0f7 with SMTP id 586e51a60fabf-4afdf49decfmr1711002fac.11.1794548060213;
        Thu, 12 Nov 2026 21:34:20 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:19 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:45 -0800
Subject: [PATCH v25 13/15] arm64: dts: qcom: kaanapali: Add CCI controller
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
Message-Id: <20261112-kaanapali-camss-v25-13-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX4bgpqojR5Zu/
 yQ/0hdWqb4LyTnVR+6Kn0zz5nKO28bjDU7j5zuKrKNKato8Xs85w/QInaVfbJMmXLEdS4r9wegG
 MJf7C0bPySSCbPtLLwd7GiOH882wEsc=
X-Proofpoint-ORIG-GUID: dKLfSLLoRiK45eHX_axiF2wgmZ5W6iE3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXx98qJgHb6RUQ
 VU0DG0vIXg7hJeoKWDdPpIAhTXfINzX9s6MeRkz1AfJ3o6yDpeDRKzzaeeeCali7oZrwXR+q2z3
 bj2M0bUhzBjcv2fqmBXJSMQt3neBtb7MhHVlQp35FinZXUUlfc41AwZ2Umk3RJ50dW3+56ohzpv
 9eJ1tlT84ye0mQGaZKwoB3BgI5oDAQbR+iYn4UGy5CM5zl32qN2w3XeXlkIiqs4gwfosEdQbtXC
 lYqJ58W7lJ3lUYxbSHeS5IHq+nqNHuJFQXfrzfemPtxWSF78Z+cXsO8TncKslO6La1pOscgGncz
 vTCi8+ckHslm7nPwxQ+seBv2rtpOOHErYZ2wh/Ai2NVprqaWX7Lt4F+phmY4BCJx5/DbvhBTwQA
 dCqQfbUGcblUCRgSffzwar5pGEEOZmjdwfiA8cMr2Yp6NEvxNW3YvD2+VDFvpmE0HSZ8bVhrVKs
 C9A1n7rA8dfbllb2Oaw==
X-Proofpoint-GUID: dKLfSLLoRiK45eHX_axiF2wgmZ5W6iE3
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af6a15d cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=09nyjJ-fxQ_OzqxZyrIA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 23406698370f..1662ebdfe729 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3763,6 +3763,117 @@ camss_csiphy5_in_port: port@5 {
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
@@ -4552,6 +4663,198 @@ tlmm: pinctrl@f100000 {
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


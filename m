Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463542;
	b=aM1my8SOLyim3AMjnsA8/GzdefhQ8x+4GrBFv4/tyOXdb5gYQeL/ZpKJ4/SWRHXYYWkT
	 Ue2o2yV1bZJd5vslAVlq+7FTcVreM6+l2gXMcUT8aCVgbIVmbuL72UVcdzQpfxI4yqBXG
	 6fOJxqitkrl7/xG9xguYtfBUolfJoRub/PkRVF8S3Jyiq5CmzPAOH+v/T5CSf7V6LU1EZ
	 kCBvIpj0L43V80vpXVTlFXXr1uwSUzuJdd/TpBgs3XfoHCdH5mpc+h7YHkPLKEO853GnQ
	 pGzyuBLq7mLlr8km/NiZF9CU6DjpGtlk1doA5l0C/lproSg90LoEmxOdlN7cgMuB34g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=;
	b=ghfOiAw0+EG5+IY1tGKkaNH4D07jD1Hj2mTwmC4pNBClRnSyHHOiC+GmuwQlSVT8pDUp
	 jCuADSS7nluuXwlPRannz68Ky8Y2+PmI27xVc0NF540pkS/4AhNMal+HJYG0i8V0ORDyr
	 X6NVfNla6FVlNUiKutcIvEz1nZQwrJccsOIVfySKKdxrafpKi8eTjG9CNJSZfn3sws0Td
	 tU6fqgnVTpfoDWfLd/ZddqFl9kf1TB4MFTq7Gh3dAllYqlSYIh/t9scfY3Y5/6uth69JV
	 YswTQrsx6TWHu/q03rUwWNdGMVtNb6Ls+xUmEDstrOu5bENR4dSCpAOP/wRO21qILhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f7AoG1YI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E0F8Ximt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F28F606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F28F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f7AoG1YI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E0F8Ximt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH4gS1093911
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=; b=f7AoG1YIeupin4O0
	R/5CTQYuKQ8tR1BMuBoq7/tIJlaIR/Tljnz2Ey+Ib9gZcHMBDuUvA+8RF0+4Bn+j
	918ou4ynvY29Vl7SKWmRf2C9kabDXVUi7IB5+YPqRCocHF28v661troUrrKVKcYw
	OM6ak215ha4X57QVVhx/Mrbj5YWMgZd4vknRsp7EvCQ/1/L40SCuhRe3LDX2u9fG
	lcpIyqP+bWyZ5N5TTg01xFRfJ39IhkswoUf1QjiBAC+YwHV+ya1I7XWCfo30+9gK
	vtLBY7AjY++cB4CuL4KnE0z7QbIZmvBl2TT8nAxMfAyyxSzGE9usEh40EvwWijld
	leFTDw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t4be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:52:20 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b56c696405so1734048c88.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463540; x=1796068340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=;
        b=E0F8XimtQzAv9D3Fqolp9gXkSX6L4IR3KSy5PXbNAql+WR+fLoDgzmO7gIM4Accl0f
         NwQ5oI3+n8CSHJfxZAy9n4TkQJUjTSJsFUu5t3++PpJ1IzzVV8TgIvigSsfK756HmO8X
         BmKBlewuO1ryWTeQrYIDq7doAajbvDNvCG6/CNi9beQ8zUHtPxp6RqSFwbmXpYEs825p
         dYfzfMp9Ru1PpgLfXOVH/HkwqcepKz4vBs/BtP730mo517ikb47zjec+LrfEFCOSi9BH
         O66F/6sZlkzQT6fa6yrjuDdsA5DTutpVqt6vIoMa0j2T8liTS/r/vJEDD+6d79VgNEAu
         8T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463540; x=1796068340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=;
        b=cF7mdbJJdjA/6EJklY7OW730HJUS2FYUhsOEzX17zIn1KjmhoTbGELY6VVPx0ZtZFV
         7Tuj7LDEQHN9cKgiUxlSFb/89wJ2md0OxWGqKaJWvA/Ssrq7QbaEVU/zWrtPJ7A1jXVH
         KXVk23R5sCn17w5IwaGQdKkH9o//wqoDCGVUU9mYOZBAkivspdRh/g3cgK/ihDaAHD12
         V16X7GubiqhEB8XEp9Gd1H/iYDHD13uVXpoZyMZuJQCWPUQ8JD+5eNGonqTFjMss1/dz
         wdwS35QdKPZg2/rlMSsmNHGavBLb3SRR/9gYzhlVz/Q5+L0sCdGNX9BdxE+H7C9l6kFl
         yLkw==
X-Forwarded-Encrypted: i=1; AL+hErEgm2vyh3NOiKz7FYILkvDAGlGQszYpuHr5rEO2Dkrie9RwiGASwORnpwWpODUfKU6y5EDE4AIA0uck@vger.kernel.org
X-Gm-Message-State: APuU4Z+tg3zb9Iq6WSWU8qjbzTjZUXb6ifRwzsTDop8zNtl+HbCGPvWl
	/ec13JBZvzoNS/IphLQAkd9BzKIhwlaf9Q0jkuc9fdLsgjqsiYFDCjkliU4qjWjMkfQ1rwXUNfq
	tLk95KOAD3aNsCU27N1h3b5aEEA3M4/cp98jZqA4PCa8Ps3QTFcT5Gg4xt2V+7Rpy
X-Gm-Gg: AZFdTZdss7WrmEZI6Yu8hWtGFHzBC8vfJxE1JK0Xqaup2bc3tJStAB9hCfjJcd6mtJ+
	rYncZ/b/qEEQ3v6QqN87AxJdrlAI3rpP8Jir1gyaZBA9Cw1Cl5hEuZ0hUHsq+zCukHVQSO9UhpU
	QTYW0ZyJ+CyErNjEDpIUdN6eq7w7gAo51x8HyIJR+W1O0m0Gr1GzHu74N1Gx836sypiyhJaE94b
	aonCHIxaaeY0vywooU8f5c/RuPNPkzjPEwHEBGigQsQkbhALrBaiE2Yae3DNwB7QXFhDEyf58wS
	SwXChNCMVLx4tZX7ITu2L8GxGEogqaudEMyWzpfUPZnYmGqj/hECLCXcf5J5gGJrfXQw4pzpIgI
	zA4zvaDFxpD7LwbWDuzFmLfysCE2/Z8s2haptY2eSBLsfH5qCoCtTSQf/wph5KaS5HswltQ1e1w
	==
X-Received: by 2002:a05:7022:3f0d:b0:1b5:3aca:8116 with SMTP id a92af1059eb24-1b55690bcfemr12298657c88.33.1795463540095;
        Mon, 23 Nov 2026 11:52:20 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:1b5:3aca:8116 with SMTP id a92af1059eb24-1b55690bcfemr12298630c88.33.1795463539518;
        Mon, 23 Nov 2026 11:52:19 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:19 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:36 +0530
Subject: [PATCH v3 05/10] arm64: dts: qcom: qcs8300: Add GP M/N clock
 controller
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-5-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: hO1Nc3i5JkebWGTIFFrDYouIzUW6K6E3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXwFJxJYvNYO2M
 d3awyii42PUkY5T5Yc92czq5YdtloOeOw+FQarKh7VJETDFkHYqpBPMGM5W/AtFVaGIA77paHyK
 GRtxfrq07fRX+VrfVzQv6J5baR7tBlc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXyemgMKCuy3xN
 BGnDGKWDwUD9ycs3ss97mgAH1MAEj/U6hdEcxXJ0Ci9wIb4pNNnQiA3B73grbV2RJ8SUAESi8Ct
 /LyoxY/1Y3aAeCQoCt5QfOfHNxcw32yBW+QhZ60ijS63KO26RQqlicRC3mFiZM5Z6TlYIFwf4B2
 qhIPkbw7Nf7x+4gnO78zWyX7p8FQHAY3F9Ng0gEn1+gnkE9SPviZOVXUtRaBJMN97mQYaBmo0g9
 Vj0TCmejANIZVFRiVZClLL++/LOM6oxXOO6Qn5gpgkxvXlHkkxsAk8CbvrPOWPELYdj9r4p5u5l
 jkdUfINh7nRc8GvAApbG1pqsykkUkRcD/usVWj4bvckrG71C9hSt/nc2aGoNbN8GZZeQg9HJszL
 3vP8SWT+3nUjIiTqnZmOCF5e8rnlHLnHI5H+XerHh+l05MfZK5FiuURT0S+bPxQcgFpTb8MgdE4
 OoU6dP2q4PjUCOC3AIQ==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b049974 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sMxVnY04UXhLatCab78A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: hO1Nc3i5JkebWGTIFFrDYouIzUW6K6E3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for QCS8300.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio32.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf47fe27499f6dc370cb778d780a08..3508869ed92b439b35182e94a5b9a24078efbf70 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4892,6 +4892,20 @@ sdhc_ice: crypto@87c8000 {
 			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs8300-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm", "ahb";
+			#clock-cells = <0>;
+			pinctrl-0 = <&gp_mn_active>;
+			pinctrl-names = "default";
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -6458,6 +6472,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio32";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio106", "gpio107", "gpio108", "gpio109";
 				function = "hs0_mi2s";

-- 
2.34.1


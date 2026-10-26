Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014279;
	b=tG1zvMXE5uxaEwe+WVSHZyMCJD7RLr70iAqz4yCyqwKHHfPmHO36tYP7Lzj6fFL5Nv2g
	 v0IBw5ZCIxIuEJ8XgbjmdKb7gdlXzdLJTzmE38EXc5htqfkn348KqjUlx5MF/P68GUsxZ
	 Lyu2NbC+GAo8X3vxd3GnH3vyTIVlBSOXg7cD7GnlxiTLK7xiS+7pLJ+YC8jEW3XQMQJWu
	 O0W6FiNAALFrE7h3TLW05LRz1eQGSj88GRB7HJ+PPDJlBMSVSntQAWIZAM45oTZNP9Btz
	 H6eJ/6CqP8sLn3V9X1qx9Xmrwi6GRavFuWHSW6fIayj7TQhyVw3/A/egKkxXiSZFV4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
	b=W1fcS/u5cnbmWTkXmPvv9FAvFRkzLluERcy4UeVPBlTAcaEl2kKO76whWi4zJue5F4FO
	 A8BjpEDHMXHjmlBrmUIdpurPQE60glG7vUVnxB6GhsR4+f2ybNFSwWX7qoJzKmsWTpVUL
	 fhU8ixy3Lh4GQ6E+chBweOMow/2I9npKG/ljuhJqA8TisFGhmZCX0V3Qe8FNSZe+kkNyH
	 iHRBzsLvJUmJPLaXdW49zsu5gGLk5E/PWn34QSy5jIGtnBoQb5mB4FwAY/p28pKn7mlVC
	 D3sprQ2XTAGpIacDO9Fz2uTGtfwAvRkpRCHjDdZdURvY7unHuoTpSrThfETJq9EQesw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CfQxc4C/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkPpEYnF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A6D6072C81
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25A6D6072C81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CfQxc4C/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkPpEYnF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtE7d3563059
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=; b=CfQxc4C/kewcTgE/
	Qv1d7WZrlMrN1mNjVUYktg8rKXaO+MniuiEVjqBweZpG8m5lmPGysCoEkLmNV+xm
	5/8fWVO2hq3iYArAubOuj2NJ4DP8N6zggHTeJPiz564yB4twCoJpxKE3NVqPcSut
	fovHAokjYqlTt2EAyzcoeGufiXS+O4NPGJuop8gZp+Q71K0Vo0JOMIlYqXMKlWTa
	nMDCnFFXK/28dbdEz/nS04MV8NkUiQipL9GMvo03JmqxCryK6+fw654eLK+Ua14u
	uIVniQcEEs/oyCdPKXCyOvUZbBZRUEUB4TrnPL7u0o/niVqVN8EtK8u1DPwx3I39
	m8PjcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90ba6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:31:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so4238660a91.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014277; x=1793619077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
        b=WkPpEYnFcFNU7ej5dlx89hAl4uz+8lAS7V8S8D2nQmWY0vARSHfkmsuWkEAArwbN4I
         uw0oH5av1brBVAp6o15XZnaJZ6tDC0JqnXTAyBLtfJq0PBSzdJyA5ZR8xxbe869LXJ8Y
         0coZY/5zr/jLA+iIIsrencUxqFdj92fXTZsZeSf+I6t/6C20fzPd7jO71iYmeX4f7ifh
         xsdV3Feilymx8fXwYH7Cr13jvhH4zHBIYQVM2CH7n77G1aFyfxpdAzTRLP1I3RKXMubo
         ssFvf4klEuqmFlMa0nRCj7mVxA/fOOgAVYQeLqEj9PT+kooZY3r/i//K3X7aNVREEXmr
         eG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014277; x=1793619077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
        b=1RdrsBlo3S0rJsrn4rjl4g2yN7yHEqEaEcrq8H4mK15zyj+dxD8Lda0kUnEJXapORC
         e/jnPkyFSd6xkWItjrz/B8vh+uyI6NCihknYjT42WhkxWP/x8kTiLViXgoTASX7Q2INA
         27r7uIPCqgk0iOFtcxF0uJZZOr2vdv9x+wVyHj9dZn3RQfMP6CtwGRt2jh+wQAZMs8Yt
         QRxw5bHQo1iN7IQ9a83WN2+fc/B05EiAqV/Zastbw9/44qPfJHKRbjwas4KCmaWTerGG
         iaedOrbN0IQx3YEsg++TMnRj8eNgq7Vr3y5l6QMXqyArEPyiw4o5W8DfYHwZClNBkAhZ
         xbtQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9BlFXBNmyFbqOFxlLTS/HW5/6OI+/GLvj675JjCTQFayaIp+i+ZW7PuX6Y+xnNweVf/iXKF4ak9mB@vger.kernel.org
X-Gm-Message-State: AFq9FYKtD4RI/D7bGJovRoaQdMASlsW6KJMlcqzMUgrxZXp7K6PZQ5Lu
	+wx2H5t5qApEBu+yRFRKECRjXj06VFlY+zVwiOJWJE8XddZvzyyc6PduQ+yZCY3Kk5ndx3rZMH5
	MTrM2ACeO02PqyNuYITIoUs237Ss4EVVamkj3a1EFgzjCjh7FaHIb8ysGKVop0h5AtQf7nRR3
X-Gm-Gg: AYBFou1/+c0CWCNR3nu2dCHuhQJ7JQIqdzDcHv6rY1G/R+s2eJg/JGWaQLfAVfILMIn
	HzT/Hae3CEoFF7SJx6RpWEn06yvDWqW0NHo3x2VAI4UZolCPIRM/S7QahWlJFdzx9GFvaxOmJ8L
	3rwwFK/zOpT9x3ysfFOB8UP2C4Co6dMGd9YfBdvDyxcnZPFpGrSi5Ka6LVF0mXxFFvciYJg1ez7
	nXvUyq0ia3uCmh9yaz3G5Q/+RTUmw8FOw/TW/ubxCuk2zL9LtGACwxYmNHZjsUOZ3Rt5alurZzB
	C1FWvNuYVNyZ+DvjYUVSFYtC+XJouK8VfNzN//drbLQRcmDgdaQxPcFDLFAz5GAnTxTlJUgbnb+
	t/WGBbHMkPPJhDYfRAOTBV9U=
X-Received: by 2002:a17:90b:4d0b:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adeac04b22mr5611294a91.22.1793014276947;
        Mon, 26 Oct 2026 04:31:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0b:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adeac04b22mr5611246a91.22.1793014276253;
        Mon, 26 Oct 2026 04:31:16 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:15 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:38 +0530
Subject: [PATCH v2 12/12] arm64: dts: qcom: qcs615: Add GP M/N clock
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-12-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX8JTcduCO+zSF
 R64GOBdyPH69g/ypNrjfnmV7KJYybLyOoBQOBsGvWRJxX6tjhN8z+jTfrHQ1V1lJ6505C29/4/J
 xB8ycSt/BHP+lzXfmknlpC1CQeMPveLQKGYnHkOwGWhk7P8QIbnTBewEn3ivSX3w9Jcz/e7Ix14
 NA4CgD1RHu2BAtCBl9dmGOwLVqq8eaPPqg1YvSKoFfQGGnt0MbGPBQzRAdku181/I10q5uiNZpx
 pg6gfeXq0gwn7I2UBam7brSk2WOaAKKoY1prFpbPKgS6XaS97Ag1/oOOAH5mqYqcVvP5vhl45JZ
 aqy6/1JGOMGA5Ed9Nve7FnNHQH5/lhTJ2HxE+noNy9T5iUxuGqasAWGhitOPPIozGYcpgT2ZnjP
 eAHzL/0KjYgzzqGFiUPPWDeMwxIq5wEil5jLWAM/hv+tVhTc/3cJPMn9gjjEZUcFp7tFYkfEcvU
 GWp0FNSnuc7Hfr4o6cQ==
X-Proofpoint-ORIG-GUID: 5FfgSg4VOv5SD9ycATofoRUp05UcAzub
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX+nXsAY/ta7A/
 nQqnnRDzad3zwCpMIRBS/N8pE4eQubMpbbsNXYNlpcQLB10IpcUs1vBdrCqwQFdNA+2KNvF9n4t
 zKnYFkCF9Niw12rnmJS+AP/X9fzP3kI=
X-Proofpoint-GUID: 5FfgSg4VOv5SD9ycATofoRUp05UcAzub
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf3a06 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Sk_Ya6Pm9egUDeeQrokA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for QCS615.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705c38796698747dfe7bba1afd1859e..c415e782804ca8c9d09670cb8c8cd2353d796b23 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1611,6 +1611,13 @@ cam_mclk1_default: cam-mclk1-default-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio29";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cam_mclk2_default: cam-mclk2-default-state {
 				pins = "gpio30";
 				function = "cam_mclk";
@@ -4028,6 +4035,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs615-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <19200000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88df000 {
 			compatible = "qcom,qcs615-qspi",
 				     "qcom,qspi-v1";

-- 
2.34.1


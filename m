Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014257;
	b=hL30nYUYAHXdniMEnJ+RAPc1Bm3S5LCywjbCtPGw9tAGUl3aPkHOZrVBJtOod5xeUWtL
	 leSxidPRYk1vczjfK7jPy9RwvORXqpuyGEkrKzYCrtpwn1W50zJzDey0korYVWmg5QGZV
	 q/VEJN6MIJh7Lewd1PUUxCyUSDKHv6nxLFj51wlfIiP5niecOw1JO3y9YRJKMYPyCzl15
	 rOoXk827hgaR8IpXlq+u5uQn53jEMak77WXxdhEG7nF66C7E54VleiKQ8FeL5gvgNG2x7
	 PWNNaYYzCGGPEp7pLiIcsxY8RcTi3PLpIkkPNwPgdJvDwgrxzEcCsY1p3tjSG1G5oZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
	b=OrnmrBNYY53tcax7dbudmpyOtBxgj3hAp7w0h+tzqUDu2KDXlUJ61HwwZUxBoBTQh7d4
	 h5MJTU3LwmqyecDnGJNmUQaJuj5cnBRun7IkZFOY3Z72mCWCls2RNVoZWNJo4T8V3M+nF
	 9rODRdnc/F6cQlSuXH6M7t7YphokvknkPOxui6Lfqd0UUDj+RlO1VeUq2G0hjs8t3OARU
	 qSTPTX9kFn8X3hQlAb0SD1BrnuLIxr4/rRglEMf+UdNLMJEpOOc03R2bDcsry+u4rfIj9
	 auBkV8EMxkSnkAj0llDNcOts6fro+4+AoNmpiDL+a1HJfWCcicKPe82s9sNaiWFkiiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npaCX9jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5M9QUX0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AB260A6F4B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40AB260A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npaCX9jt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5M9QUX0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsuH13561847
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=; b=npaCX9jtYxzYT5Zt
	t7JV3UfqfK/8A2WwX5npM8A8GheMCA+qj+c3P1NesESmYtTssFoxz6b4+uHeBRYB
	MQdKYlRY5jKKRc92oQ3Y+9CoYXD40WPyHnAURMSfEvePs2h6bFQe5ShF1QkSV9bt
	hGD/AP7gXGbyhWeRuATFmp5KoD2WAF6vgKgHU4u/3pxpu8CrfwLHnJAKvdK1lLmp
	z0P+FZXpHNqfy89HCnX/waWyrlQ5SqForeAAnhpT1gfzezJC33TMkqvbzbshzi+9
	guAIn1wCZKyXU5vb/FPwi/Qh7c1sMuHy/x+7u0eqFAk1Djt/gzTvT+nMnBWV6uEI
	7xLAwg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90b8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:30:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89e6ddd4554so2191358b3a.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014255; x=1793619055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
        b=B5M9QUX0JGMgRE84M896uv2k6Q/lz0+zdEUMc22BZS0RUFWPl2um7bbjjZfAloBC7T
         ID5B0tpzFouSZFFvx7zdVQTSoanL/x1b2MIARjxBOEpvuD9vE0tAQq1NBWLOhmGsieLz
         q1GbbU1w4YnM3yFPYt0ToFQ+wV3V4KV5rrIOf5QMpKksD5Pt+qX7AjNVC15Yqy5p/KmE
         83AKEHiwkAn6v+lZ/KOql/1l05B1pSxify5pDf0nvHrQcgJH7NkjaDsrA2pn/jBcehWW
         5stxqgQJ0WuVKcpM5RT4XxWjEpDIJc/Hp8qur0R4FFcbGoTPoZlwbcvz12dZBTY9w/UJ
         gOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014255; x=1793619055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
        b=Qs8sJBAtXerdjbdGEntG63TyTpX2pwkBVJF25T4k2NnpFzLIU+u9Y0W/gEuJApfLLM
         GVOLg8kUtLHYPSukoKKCp3hwm5SJNBEl3C5lQI8WK/xtOWcFltYVvP4ty4nXBV/s8DgD
         Lsbll79/iYoQsEcHXghQY0PhwVgti+6/qx8mQDwjOGpRlCqNh75pzEGQroqw+FFCIuzn
         FqyNbqBM+HN0WnQ5LC+ui5/GuqJ9Iz+A2SSZWUwESBFY3FzH5eXaIgTLJvQwxkGLzcux
         5Awu1vixhpf+m4ZUmNgB99n3LUfw7V9XdmePt+CQP5XhoYuecBKLL14pOetWYOBjUHhj
         Q3eg==
X-Forwarded-Encrypted: i=1; AKwUvBwLXN+z6q20a5utiDWEKh79AwtQ+0ENQqibEHCIrxDw3EKJZZVnjY27KtpgOD5/zEyA5/fHR/K53eMT@vger.kernel.org
X-Gm-Message-State: AFq9FYIaXerxz6JUlxKdDFYUTgYWRjTsYfybCidvah98DKaGYnFw6BH7
	lY1x7R2dbOqOhXX26NgqXrkbsWWAowM3ZM3g6gMC2qaPbxPuxK7piWdboZ6BqeyAQ6vvcbflSm1
	qzVXQkokS/9bpW3d4dcHaIBYAWLAzNsYHcqxI0CmuAWcblZVvYr3Deyj1pf0yNYNS
X-Gm-Gg: AYBFou0gdNtCCqjPEvHpqs+lc8knXoKCzJSsQDDPkOmYQAMZa+offT9xD1bBAxyCSSZ
	FLA85Xts3bCtFOrXvxxpeNGV5MMxN62GFsLCdAaXO0Aydb2dbZMtRvf6O+TVZ0tq7sJKtkzn0Sv
	gfp+GG6lb03VObT2UPEE4g5QQJlVWjopPflM/M+qQjghU4WA57dfYycijFv1YBZ+5hK9dJ1onb2
	LEzyc2GBUjrIWdQvvXqB8+KnS+tUYn0O2AONuUzh4IuQLg3YSeUJ7TDqSG9F/vQOff6p1jhN2eP
	y1aR+uH6D8+XxQFAS9lujnsBaz0Iptdc03H7Jv4RC0H6RoZCriK1DbQIDsJ1fiK0aBmtKuUO9Fd
	85vW+AXm8/PoqCDO25fks6ac=
X-Received: by 2002:a17:90b:2689:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3ade9a35ef8mr5288334a91.3.1793014254523;
        Mon, 26 Oct 2026 04:30:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3ade9a35ef8mr5288290a91.3.1793014254037;
        Mon, 26 Oct 2026 04:30:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:35 +0530
Subject: [PATCH v2 09/12] arm64: dts: qcom: qcs8300: Add GP M/N clock
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-9-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXxOrd/JjGVH6L
 FZZuk2V81OPUw0um0HAf7+qAvtlzh5XcuAFAH5rsALzGFU80IC9YaMdhTZQ7kekZ0kXQQM7gwuJ
 wsMcI5iSj7E8ct/332cCTtIH9OC644XxpaOOrT+6vglyjMjtkBtwbF7YIT0gdHQaCwp/QDJ6YqB
 k3b1QwQaPUEqjB0QCQu/N0Lmk0pegxnLnQGsTcT+upRDiFaaT3fBbSvhGkMDfFP+EI8Wuo6yrhG
 H/aa4b6IudaHsQN6mNfI6d1oXI8t6TnKYzuIkEWaK6oSMvJI/OLv3+zy9n5tmfe9XJp32TOwFFj
 5QYtjKVdnklQoNMFo1dMenzIVTXA0TBdXgXIw2U4AAsflL8tozCOLeZeJkNvZ73J7yPfngBcGxm
 13NK7cQ3/hJPEyckCoXrtixo4KNTBNHmfCL11HZigAYgRxQxcRgmbVSj8THbtsWEY6cVTuD6gBk
 RHYXpklXq+gjf0qY3RA==
X-Proofpoint-ORIG-GUID: MBNi9A195wQGzjaK3NL6FIp2Lc545-3F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX4J0pbME5Si5Y
 CUQtzLeoCOPWU4pAEq10ZTZPTo0MynB6nKC42u7PXk7ABj+zUGLFdgWbftT3OSiig+vvNpfc/ic
 c445SmY50DXG8vpTHeuIj3S/TxHa3zQ=
X-Proofpoint-GUID: MBNi9A195wQGzjaK3NL6FIp2Lc545-3F
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf39f0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JIsdQxy8wyWm9aXyvGIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for QCS8300.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio32.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c652005dae9b93bbb8f6a28b48be3b..e122f70eaf20c65df5854e644887ad16da94a7ec 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4891,6 +4891,20 @@ sdhc_ice: crypto@87c8000 {
 			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs8300-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -6457,6 +6471,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
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


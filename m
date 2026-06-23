Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D0F37BE7C
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214088; cv=none; b=jW+OZxp99aaBIj8XjsvAoJFvVqkAJhiHDWqkmf8x2qjab3EUhumoqnQlYHOOXnoE0gt6PpvH3C2Itur5/uro9cDovKOJBWm27GB/GjcgSEn9kVTFM/rw9P9/I9uBOLAj1okFoFgpd9l1luixbJnt5n3kosjPn3XQKabvvMU6Owg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214088; c=relaxed/simple;
	bh=0JW0N3Q4UlyE0reK4VigsjGA+015U3nhEVQ43DeE6tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kxWm6EUGU4rUiwScXyQksAqzOG2UGtpaqHJE4HZP7mh5JsNHBpI/Wxys8ZpUbKMN7IaM+lcU9gFFGr9pqcoiarUydCEry/x7LCuwTQv13x/f3OokFY5btmATzuUu1665JghK4hNNhqNkAn16OFb9uhbbFQb8Y4ih9UE0ttLKuJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbMpPu4W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f5cqbli+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbMpPu4W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f5cqbli+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsLJM4134475
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5VWldt/+uc2oUyaeqdyF9lfgKwjuBPX1Pj+
	C0OR0h08=; b=CbMpPu4W0H/XVEcKz9EIVW0RTzWydISDlBHWgYvB8of4e/WBecH
	uRSIblKddWiqdvBymM19raBEJeCp9nbKorcUPcI0bLOF3HOsp4Qw7u+bkIKPLWr4
	4qWDIwWSpxlxy4RltVFVWmEUMRv2Sp2XN61W6y3tsIp6gDFBbu0fQ/C4ilKJepp7
	7VFfLU1D1gmiamfeKmlTJppqxp8oCuAMu6Q19wsGc1hjo3mTlK8/kWk7F/SjhbbX
	v/9mdyg2n19psibdBRkH3OaiXkHo5WmPjL8VLjmRwVGVHTPoNAby+E/bBQ6P39xq
	P6QSQn1MdhUe8xDL1BgGiG95DuCehkJMsEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe68hp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:28:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91598ab3a1aso685891585a.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214085; x=1782818885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5VWldt/+uc2oUyaeqdyF9lfgKwjuBPX1Pj+C0OR0h08=;
        b=f5cqbli+xeLOD+bnwBDvtrhIFplblLQbeJmaP0u6uZtpNruFCRRAdl2ODqXJMu9brO
         6ohnzbDXQJ8Mf26D9NGNKcr7o0Ml/deyFuKnXdDu1j87helMk4MEikI0wZN0+1UKagFt
         VZw0/PtiFlxZhb1mEXO2F4EUpDWP8kD0JQU5X5F6KjoVZPE0IdX/hbTQ/uKn20pL9YRO
         hf33J/8vIFhbUZMhynhCYCywVV6yvPVDJCDFORPSG5HkoCrEPCvmO2tqSF1RTlKee82l
         xpi/LnrBo/Yr59LRo+vORu4mcEAfE33wuXQMNdqcNz6gD6qddJBFggY0vnQ3MCL79wIA
         PxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214085; x=1782818885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VWldt/+uc2oUyaeqdyF9lfgKwjuBPX1Pj+C0OR0h08=;
        b=RfyDrD1/sqNkvcILglXHIlL+ESM+4OHkIrxfkBuB9glPKAR6WGoahbdGqvU/wPcM1l
         p7f4d1sqNNIZijsI4AMG6+UGw0caE2NDTQAJspQBiQOPqZcGoG1xpyKepRWZ6M2SDPNP
         j/apE1INxJ+lnRZC0mnuV0CtBlvu6DAeBjHc3blyl0lMY+Y22Nyt09Cz70+hiPYmVXO3
         9rT0iC7DOwnsQEYIGBaGdtS/L/POyq97K2yGfcdJolRPUdUQJi1cYOeKW/uFmAEGL/2z
         7Dv3y0s5YJ63wop6iSlwgsSbenJxrBn6VDV64N+fohdjbls3OBgnTX92oSogrBYr+Tdy
         NFiA==
X-Forwarded-Encrypted: i=1; AFNElJ+A3Tfct4uHPqm8xuvYTcRhntOHs5bXGJDcnNtsyBbgwgDO9oevDeyp8CCUU3b/rCftltUTG69iEtXD@vger.kernel.org
X-Gm-Message-State: AOJu0YwEhPe9fLA8InKLMhyPy8BEdIC32wxIZR3w1LcrHXg9Y2BYvrHC
	LmTT4n8WclejhAj1T3aoKRq1259fJSKEWgvP9mlXzBM+T5vNN9WBlA9sZBTP8HiGUHln0AuOGxk
	a++kbjgspbYz4klQBCuCM5AJoNMxa0alDJyZ6o9aMMltCyHRbOFjfsXaBrc9P6zhW
X-Gm-Gg: AfdE7cl54rvW8c32qe8BEfozw+u68uTmQ0fHweNJrhZmV4gACVLNvIrlmeXzUcc/GXs
	kkG6Enee8veXlVY/KCpoTY5NNIuyzZc0ZbEVSmxQAr40n7TVcqdYBC+2L6MHuLxcQIkUmJKhnko
	A1r9TF+88AoYMHINcDg1rtQ1dz6wNei0hX3bWinUpWc4dqP+xkAWCo+kHo/lQ1wSkgiDtI5BmfW
	CS8X7XQLkVzXVN6NzqRodfd1pqw2WyWZDaECnfYZym37X+fMDW5qylMzawRrRmJnJ4EHoCqpcE8
	R9Qr2pyHpP2n/xBx3sSCi1ILqH2YP1QzBdy7GlBzAdmNFLzpwFkcbUKC6C4bgTrUA37MkLzsotq
	d5XaGrWaHu5BLqUB5/DEnAVqkZHg=
X-Received: by 2002:a05:620a:6483:b0:915:6437:bc41 with SMTP id af79cd13be357-92645da02ccmr449478285a.15.1782214085054;
        Tue, 23 Jun 2026 04:28:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6483:b0:915:6437:bc41 with SMTP id af79cd13be357-92645da02ccmr449472985a.15.1782214084590;
        Tue, 23 Jun 2026 04:28:04 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fc47720sm631624255e9.0.2026.06.23.04.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:28:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG stall on Eliza EVK
Date: Tue, 23 Jun 2026 13:27:56 +0200
Message-ID: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2259; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=0JW0N3Q4UlyE0reK4VigsjGA+015U3nhEVQ43DeE6tQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOm27YWxVYhku4jfQi1KWy5rqh3uMm/wNgDCK0
 tMZ1BWehsSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajptuwAKCRDBN2bmhouD
 1/hbD/0Ts1iY5FRnzexs+6q38qgX4iwn5lNzupoulP16MTKbuvl1DXyqG240NPgdqW6CHQZIhO1
 hFVbDoTMJrN54s+qXqW/Snjv7WiGs9LoS5Pg54hHF3ygLbDqRhmNff9lJvXGHQLkZKuXIUBgAZb
 tLZ9on0BGCVIKFpWGW2LeLmprva6sXRuXMGURA2OSf5LSHG/T37F90koJBy0FoAy8Gsgk/0yBmw
 ijspbpSdCLkRrdwBAE7z3C6LVJl+nEJLYa9tM8HYcnFZLX4c7sslOdRw5t8vIUEaHk3c9sRkT1R
 EYFELN/m6S48xJzflYqlDbeHYQZAGC7ylLpVGy/UjwyIaPUwN3MlCqlyXu2n+MqA/C/+E07V5FG
 1Os8g/It4F7Si0FKEdIaXcd7XBkrE9cgqPlwmkWrpF6BTOJrhNaiOpZp54jvVRRvKTGHXnuS+h6
 zDWcWseBRueDVn4ZJl3gJs92/y34JwOAbxN7YVVXDAunmukIToOyVmDzw1ocqJ6Qe7jO82ePfrV
 m7CzbuDRL4yUrcnAKwKnj/DMX3LctUcLjDDvSQ8PeM5jyU605tN+u2MrWDxXf2GEambUOP/pJoQ
 IKk12kFIw0s5Umliv13H4w3j7pYVJz3gjWcG1ObNEIFv6b0vVLORuIl8GpitybJ8L6y/PMnTQoK LzDyiZVae4hk8ZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4IHpE_RlAT1esrJ51dVUro7O1AecNxeS
X-Proofpoint-ORIG-GUID: 4IHpE_RlAT1esrJ51dVUro7O1AecNxeS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfX8EZ3yR17iKhr
 BYhREMkZ4X02LKXTO6bD/gqRqnfYHV9J61uH5vETJuwV1buBWJAlzy20WntR2s3DkROgqo0MMbS
 JoiYEuVf6iwEdmegw3l/AiPle2TaLpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfX9zhij4ESSFkx
 8Lgrlt8oYzYKd+ACO25yuJi4/TJB0UE/EWilJ1+QxKw+Ay8lteCu7RsfGl9/3rkn71PW0NTPQIU
 Pk9jrnL5Jpt2ZJ/giqH2x2T2SR+J0vohcMWMh3YsqQjih9VthLofF9k3n/4Lmzk5Z9bPwuynysj
 Xb9oZrnxWwS3YHm6+fpDWLhd7n77X8VL6MBzGfPDvpt3ZQX+vUYHHn4XUrWV6qmp1G9jonW4l5I
 0iQEizkAB7XArBXSV8nhWVitE7wuqhovb1aa+Xb9ZWaDrCluJDlUQxToDyxegHt13uxKFNv5W/C
 VyRpcbI6lXdrSIUP/4fvupftZM/ij1hqRE+RQwP8XwQ1NVB32Onmo+0WS9xNOTJtXNW6E48ZFNT
 i4Aqh1DP+8FT8mpgdzmRPYN6ChIzs2zt6A7t3wPo901Hnh4Njw0DctV60vA5gJmSJ2yTiW3epaf
 2gLTe7PfkV427xIQDKA==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a6dc5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=EhBrT-q2SLtfKhaW8CsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230093

Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
Display Clock Controller is enabled and references parent clocks from
DSI PHYs.  Devices which in base DTSI do not have all required resources
available (e.g. because they are simply disabled), should not be enabled
in the first place.

Having DISPCC enabled without DSI PHYs causes clock reparenting issues
and warning on Eliza EVK:

  disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
  WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
  ...
    update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
    clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
    clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
    __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
    devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
    devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
    qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
    qcom_cc_probe (drivers/clk/qcom/common.c:445)
    disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
    platform_probe (drivers/base/platform.c:1432)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 7b42e37e5bf8..28063e952f69 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -425,6 +425,10 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&dispcc {
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index aa72d5f042a7..5b62272e242f 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3220,6 +3220,7 @@ dispcc: clock-controller@af00000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			status = "disabled";
 		};
 
 		videocc: clock-controller@aaf0000 {
-- 
2.53.0


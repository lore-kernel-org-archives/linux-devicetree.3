Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EDB3CD8D4
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618259; cv=none; b=cNN4cAe/UdiKNAx8ryVHgBP20mgn3Qbeue5KCTu9B6li1Di/o8WOOv9WhIUbULNjSmZ5Jj4JgAf5DLBZ8OtTzdVj6jAdHiQb5QXr2YPsqZW+Vg/kAziVJNihF9pC0vETe9cVKVZ5DCSVzExfxoIAiYKCyJVxZNuo29A+P1eBs1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618259; c=relaxed/simple;
	bh=0059VLCBe8d2U3qj+cwSpQ1V3ZQ9aPDu9S3NOjZNqG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQG609Sqc5Pjkdrw0X2c4TreqhgDjJNwuqUoMOfhaWl0EKMEqy8VLchZKyFbmbj8YFfXJgYFnDpSPIVMmchPkr2WfC93nmykODIbEin5qdSw/z438CngqYmX9/ylDjt+GuA9YX5+cdLimpkF1KLzeadAThhjy7FI1n/suqbLj3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nspM0Q3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cX4Jp3IE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nspM0Q3v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cX4Jp3IE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxfnO3562660
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jIfgx7Q8EeK
	t17b2/yZyZ4fUIWY57X+OxXcI5I3IsDU=; b=nspM0Q3vZCUD8UbkiSdPs+bBDIm
	VoY0KG7dzHNJKIILa3TerUlaGCBre/pkjhjNU1unPiJ6XnEyNCLNpytC7sj18Yqk
	s3pAgb9e2kccJpLFrDs0JP71nxqSsTtnjMcZIRylIIuvFIZ6HcDqVSRr7X6pu007
	JztmcYanUNvDflPtmqn8+8OxuqHN7NCXXBllUxq/1L0MzL6MYu+qm2J2s9OpncIn
	WrCkYbMjmjCmcACeqzOtEWk9b6caEa5WLNvGOvDKLO18RyIMTUXfw5M3L+KEUG+Z
	UlZADJ9DyQPjzYxZyArB7epq45Ne13+1qR4tqGK61yZ2cjzPH7pckcDbrpg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9669mv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:04:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efad04d884so45199006d6.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618256; x=1786223056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIfgx7Q8EeKt17b2/yZyZ4fUIWY57X+OxXcI5I3IsDU=;
        b=cX4Jp3IEie0sJEICyoWJBhGZq5kzn634oEP6KjrvNr1Vgp/HTMvSKMmOSMRaRtWO+F
         XHn4NTs2h2cUci3/90OYwqXAWwaC6uHDEiARDSb74jc8F8E7rvLleq9UlRngAWHXDWuf
         0Y+dOOyNMpuP3gr5/JKEfH0tBw9jdCJ/ZUKF70qyWZe+VO61FKwRUd0MWkDG9/Jjr4xZ
         nhN5Y7/GwPcJNFLdtcfADwubjqNL1cHSyyQOEAgtefav19xlRtj9026oD9sBTbbOi54G
         88qL1n48QDKfalsqdswt9jQA8XimjR53Gxj07Lac2o2j8sk2qoIQTwF+pCQ0Fa+o2AV6
         kndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618256; x=1786223056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIfgx7Q8EeKt17b2/yZyZ4fUIWY57X+OxXcI5I3IsDU=;
        b=Yfqqt1W03Ode/STKDjjPSze/HN9FpNVFXrb+NC/j10e9GtOtZaFInZwYvztFCFzbHw
         oxL1cfTwIJ/x/6ByQjKXX9FSI5eo4KkJ0otYRgCBUO2cQ5rJxNFa78oxBhWmfhq0gLXE
         jkbrczJXguX7Nj/L/SNpjvZR9lsuVmvZ6Tj8R+7xc1ZbRhyOkbN0Uvema3xG/a+Dpn7Y
         BS5C9JDl8C9kJmyUjOunlX0zxgZJaCxQLYBjPu4w67QwHwF5GxmZskFgeZfjVVe8zovu
         T8Jh7Ag8v1AMHCdQGYJcV6fR/3jZ7gZ+7ehioPHwoEWqNsifg5FYID8d01YlKfm4Zung
         JXCA==
X-Forwarded-Encrypted: i=1; AHgh+RoxAWl7y4s0WI6W1r4zLrh5T6xCVbrIFElQkB+Oj1p999SInK3rApzPgyclf4V9JLsjZXhvwsyVTkbF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9EDFzVgAWQP8ZtBM1k0tJ/kDF4GXyms8cOhw1mNBiKkN4ZWZb
	IM/1EVuCsV1l3wFk1JPNaP5M1VgRBbFVatQaRaRNqLZnc+NQprORjej166bpvgIDKtDX6akqvrV
	Hj2QgwaUXScnv7DxoqJ1maEeckFRspEOTmSBMs06uK1umt651W91VwZSVodgPorX1
X-Gm-Gg: AR+sD10Sv5fJd8WdbbmV1SM4I2cHMXNWpXMGtGi64G2MAdbv1YWCRsQhwY74UX67DR4
	LuVyLh4tpiyGffdkjstmiwDkwa/ePwtPAn+EsjS7yrqFFBGM/Vh4IPcint739XIkRU1tbbG4C4V
	fD/YD9Oa3iV+mEa7zEi42SwwtL6oVIH/uOtKV0phXLM5ZPcXhUJNmXoVax8Mi0DBGCiAdltnCa7
	6l/rb/2/3DjYKtKpfNDtEXpCJaQ9B+6+tmGGcPPWLFGy8FAk58aNiVli69VqxM62hAM4kA0rA8b
	yvO049lK4tynciaJKwjHIskAkBaKyDzIdfZrbCW0ia1bwQMSw3Of1GNcqat+8KmWOXeYXkz4twK
	aSQ33BGTKFQsPwWkd
X-Received: by 2002:a05:622a:1b07:b0:521:8ef0:b4e1 with SMTP id d75a77b69052e-52b5678f0e0mr108132541cf.29.1785618256078;
        Sat, 01 Aug 2026 14:04:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1b07:b0:521:8ef0:b4e1 with SMTP id d75a77b69052e-52b5678f0e0mr108132111cf.29.1785618255735;
        Sat, 01 Aug 2026 14:04:15 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm133984275e9.13.2026.08.01.14.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: ti: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:06 +0200
Message-ID: <20260801210404.383925-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210404.383925-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210404.383925-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=0059VLCBe8d2U3qj+cwSpQ1V3ZQ9aPDu9S3NOjZNqG0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9Fa7fUx2WZuvblgSQy2HW6AyO56d3uf53f4
 t5Qh4hP562JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fRQAKCRDBN2bmhouD
 17G/D/9h4CXwe7utzofIKH3rLPVIsIHF8II6KFK0wLpxkzLwM00ko+/bK39jSDwyhXjEiE63MKM
 PTSksYiWEJoAB/bY+P9N/DDGwlsiMDdqgUpY7QU5IzkUHsovj1fhat7gneqmZPa8DQZcVffvF/4
 HJ3iBhXDpGj4MuCWKLL2VEE29+xwRuFjdjczD+gTq4T/FbAHnrkaAzp+o+wUXlTJk5pOT2d0xfD
 D3zsK73d3F1/VeIPjKFZBTulHKMFTrcX+IDJ/bBitgi8qdWN60vHLlwK0eXVNSWrrb/miIvmZ2r
 KdWGUit/4+fKMtrFKDSFZAxw48r0a6XiRE7qBjUdyhMOELpDNsCOo8sWD48ONsJOdkQK0T2oXXV
 mPGm34GUOWoQVBydetE5ZmhDsSpnJP8GWsDcX1q3My0RP+6WPeZ4slHLMuc7ZGgnvZ1/XQS4rGA
 OpwfUaoCwTePFrVOv8KUDzv6FxrvGZAMEEGG84H+nqXan+m2WFYnFk5tcBNNQaoSJAz8krxlrYt
 CA5vIeqezVGC4FsRpFHCtVWVJZkte/9Z8zCSCEvEuBPgoNONX4MtXu9C9+uo5YBP22jCzWnULL1
 G+P9qhtnyv3xPur1vF+qg5cfXkLB0uirEd1oigEQNVvJvIS7RAYdBiLKHL/R+j55Jig1EMiWMfy 8qHasZwss5Otk/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YF8illfaF5yEc3c8Wg7z1kl3Lx2aUPk7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX31zLCYQgfO3e
 Rwwy1qIpZGch9KEwtZdfiTbjO34jFAfS/7ETvHqgxEEOuS4lkdnJdtB3+VV8UO0+2f7BUrt7LH7
 WdlwtjddrC1V4H2ZIOl1nhc9glEHP05p+xnLay7WXLENvqxtelYpZJXsMXgZmVFXQbOzOlJNO1C
 MsVgStkMwS9sMfK2G8Fb1PPG/dyY5oBWZ+qcMqltcR0BYRQVeil96w77d+jSjtphmpOjZx6DbK1
 SF1dIYyDGxq+Ft/Y/HhocXJaj22opP4Y1wIZTXMDBPs7Fs1rP9cvKbMZr66wViv/dURY4lG49gl
 VAFhevyAxCJR68BhBSmdCJGUXTOMxSmefc41R/x4C/C/kGFY7ywF4Mb1fdDfQ5ItcG/lgK9F5UL
 7ll3kSfG140PLC2vNx9pjfNC5qj7tdvdWjmBhkM7bvWzw/DLHxeFJteOqVtUJcuW7SXOk2nAEvx
 xtLoq/V0wgUiJAWaanQ==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6e5f50 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4E_048dy4KWIn0a4eT8A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: YF8illfaF5yEc3c8Wg7z1kl3Lx2aUPk7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX0MCpLa30NqvI
 tPzufY1rUiv8xE8Z0fyBKkFju/kUVDXYBjjFdQaEOzLH/XPAv6/VfT+j86cU6Vn9PByjxLKzmr2
 j6OVR4dlgdIT3rWxB3+ysYi2bZoFxZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts         | 2 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
index adf4da7dfa2d..a1a878d88e96 100644
--- a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
@@ -54,7 +54,7 @@ AM65X_IOPAD(0x01d8, PIN_OUTPUT, 7)  /* (AH12) GPIO1_22 */
 		>;
 	};
 
-	main_spi0_pins: main-spi0-default-pins  {
+	main_spi0_pins: main-spi0-default-pins {
 		pinctrl-single,pins = <
 			AM65X_IOPAD(0x01c4, PIN_INPUT, 0) /* (AH13) SPI0_CLK */
 			AM65X_IOPAD(0x01c8, PIN_INPUT, 0) /* (AE13) SPI0_D0 */
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
index dc0d3cf2f985..3e2377160d82 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
@@ -143,7 +143,7 @@ &main_cpsw0 {
 };
 
 /* Aquila ETH_2 SGMII PHY */
-&main_cpsw0_port8  {
+&main_cpsw0_port8 {
 	phy-handle = <&cpsw0_port8_phy4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 689ba2ff81f7..d66e71db4697 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -1068,7 +1068,7 @@ &dss_ports {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	port@0  {
+	port@0 {
 		reg = <0>;
 
 		dpi0_out: endpoint {
-- 
2.53.0


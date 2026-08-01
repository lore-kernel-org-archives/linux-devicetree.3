Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB6628CF5F
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618165; cv=none; b=OJNEA4xs+CP2ZWsQCclHRn6GPPHJHXf5tk4tw73jxn9IuX1M7citUNQwWSqC8qJlmGrwUVX8sHPUZJc9zYi16V+/dZd/aiSaQuQbfIQbmiHFdmwGzEjkyLW4o5od10GvRFX/q51mJqR8ZAFE+mhlJb+8b0doVjANWaHiqwtKpOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618165; c=relaxed/simple;
	bh=F4uEcE6NbVQbSx4Zm6Iy2Wpm8CuRe1+YsrX9tjTnMU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QbgSuSGsZ/0N17L0/tPbUBih2+Plt04tNyEBnHSJpp/7gBssavcOFfR/2qAdpgS27QBPcuGj8Y/DEjVjha+FzWu9yLd6zEiChrgdvFJ5v8eEorTZ45/HXPpK+pkAGdAb7qiuxSlnEBlMOcpd2MBEhAwOVZ4YraeJTyIfevE5GNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikpN39SI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7VgJs8R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikpN39SI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7VgJs8R"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxhKW3716322
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gMqFle/J1JW
	00o70YDqPHIq1JsxRkdhf14y+NrflfhY=; b=ikpN39SIcsGT/pzQEdXWUyshpmg
	fqQEtRU8iAfoAjF2l8TJ6h3Ho+fV9Tr+tv1gOxuRt6UfUkzkHNtCebSOmTWH//6X
	71xCY9FPsrrzRjKRK4RKwl8rwOSEdaxzqfE5ue2/kilwHl2V9+pEVnxf7BHDtsmL
	1RvJNuwlMDTosg+kiHMJY46O/LOn0Y5r46jrAmEdC5DsZjw5dBpzRVqSpf8ziOVS
	yP4ZzLsJHJ/Qk0lOrjmrwEZ3QWk7JY5Ok5CqPbJNA4PPLgzE/B1NAEpvoCW0cDmJ
	cT6ynnriRGdphSF19GenTHxBTbqqdC66bZVRlS72JD9OO/AKjpP8wKKWjaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6hqrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:02:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so43512071cf.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618163; x=1786222963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMqFle/J1JW00o70YDqPHIq1JsxRkdhf14y+NrflfhY=;
        b=C7VgJs8RzPKOnZFNHbxxbprZX5kD2dgdhd3cAWOyyLPI7Ko9u0sT0A5c3HuwFXhoKN
         NfRZ+dGC28o0hpCCYrBorYQCL7FFymMbVo/O1fLxW/3aL6mGK9gMqzyp7Zp4Tj6l6IVB
         rXLEEArNaOOVazc/Wb4XJz6WbeaMS/VpegRMsWQkSMYqSZMfRoes/FXiafdvFOp+UqwJ
         f/JRTSmK5q8mSJEjKwIk2tl7UQ3IGoEzRLRNd3I84aDGSzgIedhQSnSOdwkspTJC8noG
         P2GmOePhpGBze68yQFCgp0RaElr8MXFoF/F1XVQ1Zafz3ms2Zo098z11RdAoJk5xXcJ7
         JEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618163; x=1786222963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMqFle/J1JW00o70YDqPHIq1JsxRkdhf14y+NrflfhY=;
        b=IzhbYou0HzCrDsH36dR5Pk2aCDcd/wNYi1Ky/xZYu7k9WYOebdULsePA1lEdlwUeuo
         SJ5jT9uY9F6koOwhN83pv/mDWff1k21XbRh2mfpoA03/ll++M57dCd05yQ7md5SATak7
         yCkMrcUBd6bJ2fOqmvILt7eFQsJQVX3b8u2ykQv7jt/Xh4uzxjHUbaY2bYStK7TnP4vP
         86CLogWdhHMKqCe41m3pq5MzRo/o8yT8tcDnwM7OGjmoS3nBAbdU4ZKJX/4JbrULwblu
         JqZwMIeh08mjQ/BwP7wrrD33tla2Rsm+jX+lrDl7xZkBnPttUMRdTHV7vEKxdWLk1ADa
         jy1w==
X-Forwarded-Encrypted: i=1; AHgh+RpgZdwRQTUszjEKcWL55YVziFRgskfD+GgjSCDzNc+zn2Z+OSjwsnpJ/THtPIk9k3cjGN/uOlS0f+4y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzjhx+9IOsma2di6xN/JPfQzlR2i1NcgtxNXQt1GupnLqoyIsE
	R+jN4KhP3+kHwzD23IwSNHizHaHDgV1r3NdHb2hXk5b/jpQa3HQrlo6aPXi2rbKMa0nvq07ehFC
	hKJTJ11yX/k4FGXFh/9pDxezMvELL3Zi+y13Wl96hIz3TuQUFKkw8dza3xluYFlJU
X-Gm-Gg: AR+sD10jVmsYqBHPiJr2xn3JCa6WfwAwsRTwZlt6swtH9qSM3lPo8RQePfuH3JQUcWa
	S6zleYYqemLd7lX7W08CC37b4U5RPlindo7g/TmYnSHqARFZ372WCih4vNIVpKBCek2FiV4jK2K
	SoSinB4RPa4Q4072rsoHZAnbukhZYRAsvdDH/2Bl6hdvev0B6d6dn/VVTHK8bafmPx+5R2yD1xK
	iZZz/9+xo/05+JI+gOAkhwyFKKCC5hjkPJ6oiiB/hFHV+Ur1oU10RghhJibNbxL4emNE97T/5BX
	Bk1nbDCHjIBim0sOn2/kjhSoql3gx+uzHqApbcnDjx5cdskv9fLlxcLVEYwaXfv27y85E+hwnEv
	8hy8xmvXxUxgzKVUz
X-Received: by 2002:a05:622a:5c1a:b0:519:b5ef:7fdd with SMTP id d75a77b69052e-52b5666c4aamr102309211cf.6.1785618162571;
        Sat, 01 Aug 2026 14:02:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5c1a:b0:519:b5ef:7fdd with SMTP id d75a77b69052e-52b5666c4aamr102308651cf.6.1785618162097;
        Sat, 01 Aug 2026 14:02:42 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b84fb2sm49521155e9.1.2026.08.01.14.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:32 +0200
Message-ID: <20260801210230.383532-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210230.383532-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210230.383532-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=F4uEcE6NbVQbSx4Zm6Iy2Wpm8CuRe1+YsrX9tjTnMU4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl7nYKunQpIhbpFCrar3M/W9NPJdLYVdGhGsN
 Ycx0XDqx0aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e5wAKCRDBN2bmhouD
 1xZcD/9L6ERTjnYP1NckHjPu9nLQkIBvMz4xSd5N3pghuhDpvah9+KFa3qrJ5+9pELyYW1TeIoR
 uxYyhCYUTnCd6Y78FRuMW7voys8liKUD7fIuthSGGr4Opihfrlbx3XEI1qEsfU0gSRrWx9EHPvk
 S+0bD8SCoOXyBPTRCmHimbE+FxK9CXws73ljJfw2CalH/+x1OBTOZxog2dQk4Qcy6hdfLL7ajXy
 Y1YnEiR1sghUKC1XX/JRcCcJu6AcvPOMw6rxxpckhnRCb2moZST8P726bm/4QJy+muMvQGdkNnS
 BZtNWN60CwZ/lyPULI4vsFA1eYhfoPLLHw7j2oDU37SnAOWtVXYbyUmsnMb4GC/20n8z0zSpwsT
 o5Q3PFKRsv8v3inwmzOczTwU2OwYeDxJQwsaACAnaQ+3Xet1ipC5zaubQRvB+ISXWObMzBwxF7m
 qN5y3qalnJI04kH8rfaeOFZUlA3Vw69wOC0PXDAQDL5Di8jl3TemNodbAjd/hNrEusma9OraM8z
 8Jt3u3rAUt/PFcvOKc2NP4/QsQDkFFDiLaC/jqJo96nvDHpbs1z/RhElF8XT2cV3zG0qbmy2QNH
 a5AaIp9rGdXOJT4nR8mOOH+iYLAu1mmMTtuBdA4F0L0cDX+shFAwgLxQv4QD4rBRN1WJ3Ydq27g F+1PF29Q6dbAhjw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX1oAeBEcLMwEC
 qAa2fXI7zV4juxruX9OL19nzXqXzgzXMs+WClYp+xhes3B2HVV8tlK4hbldMWBU4v7ZOVXrGcAu
 OzEs92zcldpZrsl36kw6hLU3GRIfVOk=
X-Proofpoint-GUID: AjPD_yNnACOie8qG3YnuJU5HXo6SFLjZ
X-Proofpoint-ORIG-GUID: AjPD_yNnACOie8qG3YnuJU5HXo6SFLjZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXw97k2KKIl0O8
 dEhjDw6c8T6miyygLPa5JtbMhalYuslpVdLeFSWeFnMo4nzIGE8Ybls6sP8bw55MhmZlYtY70NU
 p5BWj5jn8Z+zlUeiTQThfRjau1ydYSuFsyO0219HPv1aU537Z9R56a1azkSc6IIdBdK5e1vbFEn
 Uetut/+8F0QwuCQAmNNr/fstDwdZqlvd1astqShZOS2q+PWzO6TmWiHzfphgqcCS7gyeo7ZpBSS
 EVRNoP+X96WTMcusdFiUS9lIgaaQqjs+TC+iIlkMh/3LLW4aCZRqs6en8roDfhjs78yDDbkCuHf
 l5YJVCqjZcJdKdKqb2NMV229CAfogyGznYs4SdnoNsN+LJiPUIDSxmsIp1fC+2CAI4n6UY7HCjp
 kK0gAooBdMOn3BGnaR+Y89o6qwdhNScS5+6aK1fwwBOxE8mje29NNHF9+SZwIwv3BX+2mlCVQN+
 vRgmYG+B8Hj3vCtOz1A==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6e5ef3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jFBtGHywRsdJY6S0xpEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi                 | 2 +-
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                 | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                 | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 8ac98a378fd6..28fbd4654a80 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -442,7 +442,7 @@ mmsys: syscon@14000000 {
 		#clock-cells = <1>;
 	};
 
-	imgsys: syscon@15000000  {
+	imgsys: syscon@15000000 {
 		compatible = "mediatek,mt6797-imgsys", "syscon";
 		reg = <0 0x15000000 0 0x1000>;
 		#clock-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 9f100b18a676..9cf1443f58a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -564,14 +564,14 @@ mux {
 	uart0_pins: uart0-pins {
 		mux {
 			function = "uart";
-			groups = "uart0_0_tx_rx" ;
+			groups = "uart0_0_tx_rx";
 		};
 	};
 
 	uart2_pins: uart2-pins {
 		mux {
 			function = "uart";
-			groups = "uart2_1_tx_rx" ;
+			groups = "uart2_1_tx_rx";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 8c3e2e2578bc..c3fc8567fc7d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -498,14 +498,14 @@ mux {
 	uart0_pins: uart0-pins {
 		mux {
 			function = "uart";
-			groups = "uart0_0_tx_rx" ;
+			groups = "uart0_0_tx_rx";
 		};
 	};
 
 	uart2_pins: uart2-pins {
 		mux {
 			function = "uart";
-			groups = "uart2_1_tx_rx" ;
+			groups = "uart2_1_tx_rx";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..8346f0207134 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -866,7 +866,7 @@ i2c6: i2c@11013000 {
 			status = "disabled";
 		};
 
-		afe: audio-controller@11220000  {
+		afe: audio-controller@11220000 {
 			compatible = "mediatek,mt8173-afe-pcm";
 			reg = <0 0x11220000 0 0x1000>;
 			interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 8b0992548431..7414c10ee664 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -2129,7 +2129,7 @@ port@1 {
 					#size-cells = <0>;
 					reg = <1>;
 
-					dpi_out: endpoint@1  {
+					dpi_out: endpoint@1 {
 						reg = <1>;
 					};
 				};
-- 
2.53.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1A13CB8FC
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618221; cv=none; b=hs6RbTwpzj1rZVIzHiMhH7XD1XhbeOPHORW2ngrkYQmJSm/FzcUJ3mL66Cy2vL/YO8u7py/D1EBmyUyAScfJb+dnkcmdlQ/gah02P66cpA3oXMcyd1bYgBHaVMwn/MptpcKMnKXZmKUOpP+GGesqsGl8pX3xTUGferDBOE9VdxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618221; c=relaxed/simple;
	bh=fT8mirhGgRHGih5afz+pF+mYwgjHvVGglAZ0Of8t3hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGUl2Af1du7rzdwEXxFzcV95tySLbudtnCxoYUI0Adq2V2u1/D6RRLII9jOUd1y/PaIXoN/Q28dkjGarsaA0pOnLvNyMqKKSpWUIwMXk63RCpbs0Cdm0jQpb60u4r60V1xOMUobGGXHyx2HJH8UGXfMWxg7U2TsIZLa+tvkgPUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtgaNz6s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dsr13RZo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtgaNz6s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dsr13RZo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Ixbn53525405
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HIKbLGVbzZy
	owZPXHI5YsTewaTbcrbLzjZdsQn8/RGI=; b=TtgaNz6sl7urhiZoHNJoz8Sp9TL
	8F0Q1evL813wTFKWGWIQeaxjdZIi2DQfWC4//FK9OfAL7IAKn9xvmoeryZRyNIsp
	dhS5hZxeQ/huyhD+nGNdm/+wm8zjrbMTHflh2Amx94WOrvfgsMu2FbCjw0EeOFqJ
	n+5SjAwuA6hpL88cT+un4zib+P4GQf1beVXXQThIezUEa0BoyAHUKQuFJO5ctcTn
	lqJP03nRF9b5/xWAhQJZKqwVZ1GjGJ7jSAadH2gWCaXFbVzU5oPSkYmOag+94nrD
	XlDl01Li5UrnR9GafwdUjv7B9e3fvQz47sKyGdZCd6oZFR7tw8aZTVBfQ2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa381h53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:03:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-522de3c645dso42089881cf.3
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618219; x=1786223019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIKbLGVbzZyowZPXHI5YsTewaTbcrbLzjZdsQn8/RGI=;
        b=Dsr13RZoUW7X/sAO6EUskpJ0Z1Bg6GBcesZnU72YFop+q07XVgijcQjN8lpdNZ2T00
         aOmqc5yQPNxRMb0IbuPwLPh5SFPCswV0fNe9aqdKSIgdEtE4e4YybVWZKtB8n2N5w7fb
         2hS8QEaiKBdrk6phx+KdReRZz3jYEcp5lGt0KllVfwPr0XgVg/Dhmsjtedp6P54/Exq6
         U8SowcssOjJtKyWCMWrvMN4MohzgFbDaeBcIfA9pysw2yTxD7cYULrcfw8Kv5JfHczpO
         DNyze0+zXd1GsPCVwh3sdBW7MX/rmLbw5hk87aDIfip7B+WVeezzKJvRV7CTDJvxdr9R
         EU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618219; x=1786223019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HIKbLGVbzZyowZPXHI5YsTewaTbcrbLzjZdsQn8/RGI=;
        b=Nn1RpWk6zGSxsS/txyFT1xJOO850vX5RO0BTAZ1OBHYjVLhbqn+AqyUqKBibyNHi5R
         FvHOLG/z88k/cUV9mS1eIZFSBqqSTdFTdgwm0tUFtpi6OoLZN2+q1fWRYlDBDU89xCZZ
         QjobSx97tXrKAFllGIDFXgnRr4f1NgFFEX7dbLj55L2cYac7YW+u8vOHUpBZDVyYJnz+
         0e9BGTmx6v2PWiy2Gn8eGb1jBRoDz6n2TA3+q1tLfqEcUlT47nkeraDtd/QMpJKsWZiR
         vYXWYCZaCruu+zYfXIY7qdz30X7mNCGAZsZdzsJ5w7SteV8Z97tEVzku4vsBvpq0lFsG
         r2OA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6lElsjhqDHnb6rNha/hWeKNWye18vriyON6RIQCazFsnWz+ezFOk1dJTaZ38+htXWUGnDmLjFFwLh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Ff5kVQkyMJPz6xAWOYI06ghiyaJCXvi9fUrNHl//2eIGKUcG
	YOQ7qbQvAQYVpOTnjXub/d+bm4aU8XZsyLVqoxMpX/FMcoYgeLYUS4bBU2xNwuJ7lki6ipCTKDB
	4il9yTcVZB8OroXTpquA4toq7+Ee+tVrBaZKbGMMi0NqTp9YL0CQ3u7VLTw5a6+jr
X-Gm-Gg: AR+sD12z9uvA8WWTgZ9Q6dyvVlJkPGY9gTLuq4WfmCD2N9deWEsdXt7Nm7iDTM2oBKo
	hOyeQaNGhJS21aCm/oslM1HkgrUd/5CBlvLkCJOfLp4rvyfpYaO2/n3Q3Xhghh4M20zHzdpdRgz
	rNMN0/P1W798B/1L150QDM6rnu1h6JUoEOoVEu32HHM/I4DVQBZiwSAtcgkt++79JCiA+GD+Vjp
	HbFtoliWTOnFvFyrlvwk6ym6wBbExCwfHAXVQ9qbtG++30fDilnxW7qNtLFFGEnFSyfLC2ajmG8
	D5mJMJFHqIl8sNNAfyYRHRxixYZiRpC9e2VU8d65WqzQt9wMcZ8dmk1fhHM8lqPNVKdtbj2Ii0y
	PKUdOl0LSSwCQBXAv
X-Received: by 2002:ac8:7fcc:0:b0:51c:de5:bd4b with SMTP id d75a77b69052e-52b566aa85amr87382401cf.16.1785618218606;
        Sat, 01 Aug 2026 14:03:38 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:51c:de5:bd4b with SMTP id d75a77b69052e-52b566aa85amr87381731cf.16.1785618218012;
        Sat, 01 Aug 2026 14:03:38 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456262bsm17552251f8f.17.2026.08.01.14.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:03:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: renesas: Correct white-space style
Date: Sat,  1 Aug 2026 23:03:23 +0200
Message-ID: <20260801210321.383773-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9741; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fT8mirhGgRHGih5afz+pF+mYwgjHvVGglAZ0Of8t3hc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl8aZpjRsmDsAygnBx1vBrgiCXW8W77Gm+24U
 09SjVGHiFWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fGgAKCRDBN2bmhouD
 18gMEACGzaIOfA0ykvP+L/0Js9lW/6tdkj60URJPEqBLxXvgfMIuuLiwQUAGBR57IYGEii/PnFS
 U+L6HC6O5MZ97Z/OhD1Y3nN7Y2HWdOl+sbDj1APOI56UUZbjFMJFknfJpDmG3cF7fV9n6sv4BwB
 USLGGo7slJuWcrt6LNhUURipzPvog/LVZ4eUn1reKNhAt+/KGKnLto+oAYIx+ErSN5/YgTCp4rF
 0grQTAMxYrvfch+2JVmvqk1x97a8Xd2AnhSBiWiEOKjonrXV6lg5KUycdPfZZgo3eSRCmd+38fF
 a8YTpi54yxTJPeQvC2IjVGeb4bO8cywSjyeinCV4AJez3B9OXDjTJTUeg8JdTSCuCqa+osQCONt
 w8gbZpqRC2wuyErPPTY680oCQkxCH81Mc2ofKp1Lkyg0IP311EvJBHis+qRhjUIhnkuyag4/BWb
 CbxICLXoZTtY7ulucZZu/hRwIF/taHWVeLBMUlcvqSPReO40+z6ucot4Jaj4ZfuChGPE5krSZh/
 e4Q6+Du7ipoahaXBjDxmhjQaaKvzWqz2JltACDY0D9dUwrfYj34vXgZS7WmL1x5P7u+iH/kT/nO
 hAoHbLf5kLR5OObaP4FQg6SXdXRtWLfabMIeT5GJsRjtViuALlFXWLUIwYF79pJw7G8zhvVBepg tdZCzDGDtIkhN6Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6e5f2b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7YlEez_digMlJapE0I8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX/pQYm0c499wr
 DtSC+HsYcFtye73rDodJ6cF6GagoKS1q1x/Q1/dgqLP+rSmw2weCSm/q59X6vJu3YrkG8xX9xRL
 P1hIctuSyZMPHqI0PybPUbY3B4nUXm0=
X-Proofpoint-ORIG-GUID: valFPpIFgyBmm2S0gd3ythT5GO8n0aUc
X-Proofpoint-GUID: valFPpIFgyBmm2S0gd3ythT5GO8n0aUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX6P6NMFnO5X6R
 ZaNYe6vm2ACSBJiLhUaMK/8jTTajrZKVz7QIW5V5GbDPEXm82R/jz4geU9cGde4YzF4prPLTcFG
 FZHJroiZUizSjpQkSPvscShPJasZhDwJQjR5f1w2EkRs68YENr8mDwZNFUdvqsbNZAdg6czLIod
 KTVTdbymb3Ug/M5EHPpm4I+DM/2tahaZqJy8wGLpm9G3loBKkUuNSE1JE8hKiQAoFOGBMNL6oZ5
 ycoVs/hZltfjNOtnsQPk3XpDN4DeQlq+uAkFJMhyM4TB5kElYsK7xw80BF5NWvCFcb+yYKzpLrx
 +runaeHNzxBfa1eWiwEjjc7epiBcrXxu/HpJrTJpE/rQZzaljNPVX/SommBowDZqs91PmdgcyZ7
 OBgrhkHZt+4ipHyf5PI0j5+9KiefYDRVi6hqjeAdSxkQj7F8VzcFSRJeK32bVb2brqeQv22YCRv
 mRKr9FGoLDuHfhXxU5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../r8a77970-eagle-function-expansion.dtso     |  2 +-
 arch/arm64/boot/dts/renesas/r8a779md-geist.dts |  2 +-
 .../boot/dts/renesas/r9a07g044l2-remi-pi.dts   |  2 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi     |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi     |  4 ++--
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi     |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi     |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi     |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi     |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi     |  2 +-
 .../boot/dts/renesas/salvator-common.dtsi      |  2 +-
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi   | 18 +++++++++---------
 12 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
index ecb35257b9ae..a9ad009ff7b0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
@@ -112,7 +112,7 @@ video-receiver@70 {
 		reg = <0x70 0x71 0x72 0x73 0x74 0x75
 		       0x60 0x61 0x62 0x63 0x64 0x65>;
 		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
-			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
+			    "infoframe", "cbus", "cec", "sdp", "txa", "txb";
 		interrupts-extended = <&gpio3 3 IRQ_TYPE_LEVEL_LOW>,
 				      <&gpio3 4 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "intrq1", "intrq2";
diff --git a/arch/arm64/boot/dts/renesas/r8a779md-geist.dts b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
index 0e4724336e73..b186807926d2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
@@ -367,7 +367,7 @@ video-receiver@70 {
 		reg = <0x70 0x71 0x72 0x73 0x74 0x75
 		       0x60 0x61 0x62 0x63 0x64 0x65>;
 		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
-			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
+			    "infoframe", "cbus", "cec", "sdp", "txa", "txb";
 
 		interrupts-extended = <&gpio6 30 IRQ_TYPE_LEVEL_LOW>,
 				      <&gpio6 31 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
index 3267e7b75b58..dea386f3c836 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
@@ -156,7 +156,7 @@ &i2c0 {
 
 	hdmi-bridge@48 {
 		compatible = "lontium,lt8912b";
-		reg = <0x48> ;
+		reg = <0x48>;
 		reset-gpios = <&pinctrl RZG2L_GPIO(42, 2) GPIO_ACTIVE_LOW>;
 
 		ports {
diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 3a69bb246bab..713de04e0e5f 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -645,7 +645,7 @@ dmac: dma-controller@11820000 {
 			dma-channels = <16>;
 		};
 
-		sdhi0: mmc@11c00000  {
+		sdhi0: mmc@11c00000 {
 			compatible = "renesas,sdhi-r9a08g045", "renesas,rzg2l-sdhi";
 			reg = <0x0 0x11c00000 0 0x10000>;
 			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index 42462c138dd2..fbe1e1c24f57 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -85,7 +85,7 @@ sdhi0: mmc@85000000 {
 			status = "disabled";
 		};
 
-		sdhi1: mmc@85010000  {
+		sdhi1: mmc@85010000 {
 			compatible = "renesas,sdhi-r9a09g011",
 				     "renesas,rzg2l-sdhi";
 			reg = <0x0 0x85010000 0 0x2000>;
@@ -101,7 +101,7 @@ sdhi1: mmc@85010000  {
 			status = "disabled";
 		};
 
-		emmc: mmc@85020000  {
+		emmc: mmc@85020000 {
 			compatible = "renesas,sdhi-r9a09g011",
 				     "renesas,rzg2l-sdhi";
 			reg = <0x0 0x85020000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 73757e8e2197..bc7cba77b6dc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1773,7 +1773,7 @@ usb3_phy: usb-phy@15870000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@15c00000  {
+		sdhi0: mmc@15c00000 {
 			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
 			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 76fa34ff3d07..dd0e4e5a6be7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -1447,7 +1447,7 @@ usb3_phy: usb-phy@15870000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@15c00000  {
+		sdhi0: mmc@15c00000 {
 			compatible = "renesas,sdhi-r9a09g056", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
 			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 639693d464a7..6242b3c66542 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1577,7 +1577,7 @@ usb3_phy1: usb-phy@15880000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@15c00000  {
+		sdhi0: mmc@15c00000 {
 			compatible = "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
 			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 40494159831d..99855bd78584 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1337,7 +1337,7 @@ hsusb: usb@92041000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@92080000  {
+		sdhi0: mmc@92080000 {
 			compatible = "renesas,sdhi-r9a09g077",
 				     "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x92080000 0 0x10000>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index e8d4f76949cc..f7df10b4fedf 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1340,7 +1340,7 @@ hsusb: usb@92041000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@92080000  {
+		sdhi0: mmc@92080000 {
 			compatible = "renesas,sdhi-r9a09g087",
 				     "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x92080000 0 0x10000>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 1317ede2f719..9f8c545dad34 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -543,7 +543,7 @@ video-receiver@70 {
 		reg = <0x70 0x71 0x72 0x73 0x74 0x75
 		       0x60 0x61 0x62 0x63 0x64 0x65>;
 		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
-			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
+			    "infoframe", "cbus", "cec", "sdp", "txa", "txb";
 
 		interrupts-extended = <&gpio6 30 IRQ_TYPE_LEVEL_LOW>,
 				      <&gpio6 31 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
index 67a0057a3383..2460ad849b93 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
@@ -76,14 +76,14 @@ ports@0 {
 				 * (H) CPU7
 				 * (I) CPU8
 				 */
-			fe_c:	port@2 { reg = <2>; fe_c_ep: endpoint { remote-endpoint = <&rsnd_c_ep>; }; };
-			fe_d:	port@3 { reg = <3>; fe_d_ep: endpoint { remote-endpoint = <&rsnd_d_ep>; }; };
-			fe_e:	port@4 { reg = <4>; fe_e_ep: endpoint { remote-endpoint = <&rsnd_e_ep>; }; };
-			fe_f:	port@5 { reg = <5>; fe_f_ep: endpoint { remote-endpoint = <&rsnd_f_ep>; }; };
+			fe_c: port@2 { reg = <2>; fe_c_ep: endpoint { remote-endpoint = <&rsnd_c_ep>; }; };
+			fe_d: port@3 { reg = <3>; fe_d_ep: endpoint { remote-endpoint = <&rsnd_d_ep>; }; };
+			fe_e: port@4 { reg = <4>; fe_e_ep: endpoint { remote-endpoint = <&rsnd_e_ep>; }; };
+			fe_f: port@5 { reg = <5>; fe_f_ep: endpoint { remote-endpoint = <&rsnd_f_ep>; }; };
 
-			fe_g:	port@6 { reg = <6>; fe_g_ep: endpoint { remote-endpoint = <&rsnd_g_ep>; }; };
-			fe_h:	port@7 { reg = <7>; fe_h_ep: endpoint { remote-endpoint = <&rsnd_h_ep>; }; };
-			fe_i:	port@8 { reg = <8>; fe_i_ep: endpoint { remote-endpoint = <&rsnd_i_ep>; }; };
+			fe_g: port@6 { reg = <6>; fe_g_ep: endpoint { remote-endpoint = <&rsnd_g_ep>; }; };
+			fe_h: port@7 { reg = <7>; fe_h_ep: endpoint { remote-endpoint = <&rsnd_h_ep>; }; };
+			fe_i: port@8 { reg = <8>; fe_i_ep: endpoint { remote-endpoint = <&rsnd_i_ep>; }; };
 			};
 
 			ports@1 {
@@ -96,8 +96,8 @@ ports@1 {
 				 * (Y) PCM3168A-p
 				 * (Z) PCM3168A-c
 				 */
-			be_y:	port@0 { reg = <0>; be_y_ep: endpoint { remote-endpoint = <&pcm3168a_y_ep>; }; };
-			be_z:	port@1 { reg = <1>; be_z_ep: endpoint { remote-endpoint = <&pcm3168a_z_ep>; }; };
+			be_y: port@0 { reg = <0>; be_y_ep: endpoint { remote-endpoint = <&pcm3168a_y_ep>; }; };
+			be_z: port@1 { reg = <1>; be_z_ep: endpoint { remote-endpoint = <&pcm3168a_z_ep>; }; };
 			};
 		};
 	};
-- 
2.53.0


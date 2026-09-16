Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A713B8BDA
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578399; cv=none; b=pwZFoT6q1q5B/L3r7rwtq6jGNS0gz6gKtewC5QVuCajotIg9KawQU2pIKAgt8vIYeMMmJjC38bnavjMNiKzdTqyV/Nj5gwtlJnmrm5WcWaJtGn+/TheyQ2E7Ltdf6LVPlsumDEw/9IfRq4L8rZP7+xNkvbWGUwc2Gd1IWlcS6jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578399; c=relaxed/simple;
	bh=Mb0mdeCwrCx7WfqFx2rqbE8d06K2O6jx/ez8mp0KsHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvBGIaZPaJIcdMJUUNUhheQRQkF5O6+Zd1K8njSpaxCOEDSubTcQc0tI+EgVZh+rpw0QcPa0MAByaR5BZ5JSsOXXlEaWchVXTX21PwY4sz8qqKG3NRUjpbv16llsIcqSpBYDw7jmBQSGvNQYhypNjxLHlZ0WJCH6T1GNBQ3QMlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHrxDMR1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2+7OUHm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHrxDMR1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2+7OUHm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GH3o0G3897809
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NFZ1EfK0FGBQAwVJnJygf04anMhlc164E2iaPiL0Oo0=; b=fHrxDMR18j0kIC7Y
	BYZtPmWNEtnUzyF/47E922k9i0vtA8tg13H34QFZ62KC+Nc59DyjN8oZ1pbaD3fg
	C3GDRZ0Hqflegju2bYgp+C2hGiD4oIm5tqOEIxaqIbP6DuSTHOlwMwarYbCJZM/l
	+FTi5GDSeKD2/netj9zdqd6So0pbAPrbdJA1RAXIhoEidWK5Dw0btpsRBABluMZr
	ON06HV3tDW/a/KSaS6WjKBtSQ87DpSHVsNZjeI5SEI7aLUeZ76J5FmdMWsZn9H8i
	a+NwGPpNzz+8AC/XmVPgNX69rBnZ/LKlfxXPEkatKb08gvLWi9o2iY6/F4FXcTKw
	yCSRzg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6ar0jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:06:26 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7d2076f8aso2005237e0c.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789578386; x=1790183186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFZ1EfK0FGBQAwVJnJygf04anMhlc164E2iaPiL0Oo0=;
        b=d2+7OUHmNBZ8zA3knN0jWouvtc7jommSjzocqvjjD55e7RwPG7S43e+E9KBoEZ1s1N
         rsNZdmPBUO0QPhQe9vdDdilrMxKfQmLyurU7z4FEqLTBTFQ/6lFfNm/XJhMqGb7UYHE+
         LCv1ze5HvuLGipqmt+X9X6HqZ/c/KZEupM0qHZwhwCMTJdPcALxzjeuEtKrx8/WwqtNd
         n7ExD9SJ9Bs4uROIeOTJWH7Q83JY1ASs7acMqDousGuBPpZrCvSANF7BXiRriQy0Fb87
         vP7ZcAQJtqVbzElmcgdATk15wb5ujCfvqVj7Diy5uM06jvvRNF6KR2NkkxFT4h39t/Uj
         9fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578386; x=1790183186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFZ1EfK0FGBQAwVJnJygf04anMhlc164E2iaPiL0Oo0=;
        b=D79MzeJC5krQaVsImtt/En8gruupwnOV0qS/VeKwwkazGisHZC75sK+bfQ50Iww7Eq
         Mk6AcT2tKBGa2/CAnVCjCsezupKTXhQg8vTTjWDM1daoG23hi2VXuj9rdEEsSFH4PbuM
         Mc7D+agDc7r/eijDzYVtGhli7qx7ADB+zVokj5i/lsiaQkuUfiMl/q7myRx/E357+31C
         qobpcUDA+D8kbzKIWcYuD+gdGOcJLKM/5hWvJ5DQHufHH08/ydKNHlRm3fv/qlrAg9Q/
         xE9cObrEWpWQLPy+7f2X5ZAwNN4L090v4nSGz1N/x2uXynM9ZeP3DRVGNAG+0XHXk00Q
         kA5w==
X-Forwarded-Encrypted: i=1; AKwUvBykei2FM3cgwC8jocQxBFzKRIq76YJ5eHdzeTnua+wXE6pa8AqaZ5Vt78GBcpPD0jGum7HyFykEORDN@vger.kernel.org
X-Gm-Message-State: AFuF++nbeTYjQUYCZ6yHCW6f0mZqfBVZgNvETAV6Z96p7vVAANxF1fz7
	ndYuvF7s6FHSAA2+RL8Ohf/lZL3oE1QWQuRuDG6LAXm0etepbOXDBcyU7AwUQUBMOTUdJ+4dRI5
	P3scR7RB6e51treKXlHhicHElB0lCAe6+7LbIRv86621gIC+moGF5eYMSFnM4LAtdksFZuLTG
X-Gm-Gg: AYBFou0vvNiiLNWqZwVNIYmi2cusVnPEF73WBSx+3zbMaUrZdTHyKYo93oWeVBgDSL4
	Qrkp9YqZ5SgXxdMKuurMfUYh7aKVZeIvd85jDsvXV0iK6mIw7WnR8o1MsaSTRl5RsDrhPu1T+wu
	U8H+ffyiJeVSvmiMGIbjMabOTzHCve/ipZ/Y9SkTi34u8kiH8CHDLmIhsD4W/c3dPY11g69kSPX
	5gzHO6hKD8mrh0iSJQuHpQmVvO2xI+IqKGSmsB3u09zQHAsf3RoPkvs+bTBzhV9FYeGjUmoFxTW
	o7hkLMenHkRa+PPWtRJJUaknNj6WcE3rmsS9bszJRFvRpB1dVJCxv/F0tgr/3vtx2yzmuOJXTX5
	t7x4ef0GfW51+wHJup2fImrA=
X-Received: by 2002:a05:6122:2217:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c9a5728439mr241112e0c.7.1789578385949;
        Wed, 16 Sep 2026 10:06:25 -0700 (PDT)
X-Received: by 2002:a05:6122:2217:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c9a5728439mr241069e0c.7.1789578385558;
        Wed, 16 Sep 2026 10:06:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf344bfsm7951293f8f.27.2026.09.16.10.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:06:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 19:06:17 +0200
Subject: [PATCH v2 1/2] arm64: dts: exynos5433: Re-order nodes to match
 coding style
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-1-8e9d534ba5b8@oss.qualcomm.com>
References: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
In-Reply-To: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mb0mdeCwrCx7WfqFx2rqbE8d06K2O6jx/ez8mp0KsHg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqsyLcKHB6+j9cfCHubyy5MmbU0+MO+g05wW8w
 KwhXWJdrcmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqrMiwAKCRDBN2bmhouD
 13OhD/9nFYey08IdmZUVW+F0VbO+X63egt/e/h75gvixeDLQCp3Fk4sZBc7rCiImDgoXYxZ44vp
 s+7XtIuusJP+CsCBpnjn1Hqx0B3qIbwXReE1RSHzlz2OILWmT3Ml3ppq/dkKpoc4F4X8sPTIzON
 C5G4CpeJDCOORTNhlwEA0xnA5aSdtj+1CWF9hcbKCLn6HE4gH0FRFv71Tvt5LzQzuIVb321f0qB
 9v9/ng0awnhoQuCC5zHgB0Fc5X2ew2D6tCmtQWY5DxXtGYBOIGfGILd3xI6A5RGzSCwzGzwJTcC
 I5tu3y/DmmqMnxfkTnmJVaZC6GfBv8f0Am7OjLgwalwH5/TWpbLco5YYflmNnOx6ss+3FMPlPjL
 cdRsOLLg7Qohm7jvxBpYB3sbhvn8SsiPc3W0r25txM9ZP5vZEdpWOCjCojQgSb7VhfVubA+SifW
 xiMTMtkg+tx/y4Z4Ksbog8XPvcD3+YhxkpSCif87lChPun59nFKNg69IXqQ7n9BMXT7A0wQjrH8
 ncgD5ktoYqHlrOfVD3YmUBY6SnZ6GZirJrcQtvQWlKgiMn7S44gS5u4csOc4ljC6XsUKAcbjoke
 GDWtHsRuG+CdofeTD2VISMX2B0qKzq9GS7htKYJaEqoIu061IglA0AIpN5fQOzVPtYkKcQb17sX
 pXzULo61XpIEL4A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: LofB-qEPT5egef-m83EplBBnu31GlRhK
X-Proofpoint-ORIG-GUID: LofB-qEPT5egef-m83EplBBnu31GlRhK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzMyBTYWx0ZWRfX6yQBVpF/lybR
 YLss5zJ66CAQkPzciPMgnccbqR87mBiAnOeW6C/O7YNA5O4QhVRc3hAQGDBo7qal5SC+fszHKxi
 2/DnMNYWkIPBrv35QTjI39lAeJcGZ1RATRuRemMUUSiY4PhLk1VBrwVgalaAino7wub12LwDaWE
 /UwB5OVpHLeRRBM02GQQeQjNjf0i3OQIYt8OZusaO75C6LlGAHNZjGU+Y8D7gPyb0BeDID4Kcn4
 CRhNme1vR9N3w+NVhPlutcVCQjVBsfg22GtqYJbUXa3LuRg6D9Chb4BT6U67NSO4khEmYkvoWSH
 GSgz+WXf3QwplhZV9MquC4xQjC8BItBGx3QCh6nd5s2tGaHHS3mIlwkz4l1d+k+fHKhRbDGjDfz
 GEAgcf59kUBx82c4Y+azEtBaZOLveEs9YXXRugWzxCMoG/Ivd/82fvAHUAH/fhRCN2VALFPtEpn
 QnYA3pfS+SmGb9QnIPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzMyBTYWx0ZWRfX+c0IUk1oFamu
 Vn+22e/omZ1J/LBS0S2PYt++tAJtU53+h+PGlvJx3oREpWBEfUq+7P5PK6IYn9rEUr6V94SGwSN
 Ay/tqtA6/K/TYOhE3SyFXLtjSLCcdUM=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aaacc92 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=4tTdy-R9G4y-is6xSP4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160233

Re-order a few nodes to match coding style - ordering by the name, as
pointed out by dt-check-style, e.g.:

  gs101.dtsi:476: [child-name-order] child node 'ect' out of name order
  gs101.dtsi:479: [child-name-order] child node 'clock-1' out of name order

While moving the lines, move also linux,code to the end to follow convention.

This is not complete re-ordering of all nodes and children of "soc" node
are left as is.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 0ad02a098765..a85afdde9c41 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -56,6 +56,13 @@ memory@20000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
+		homepage-key {
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+			label = "homepage key";
+			debounce-interval = <10>;
+			linux,code = <KEY_MENU>;
+		};
+
 		power-key {
 			gpios = <&gpa2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
@@ -76,13 +83,6 @@ volume-down-key {
 			label = "volume-down key";
 			debounce-interval = <10>;
 		};
-
-		homepage-key {
-			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_MENU>;
-			label = "homepage key";
-			debounce-interval = <10>;
-		};
 	};
 
 	i2c_max98504: i2c-13 {
@@ -103,13 +103,6 @@ max98504: amplifier@31 {
 		};
 	};
 
-	vph_pwr_regulator: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "VPH_PWR";
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
-	};
-
 	irda_regulator: regulator-irda {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -117,6 +110,13 @@ irda_regulator: regulator-irda {
 		regulator-name = "irda_regulator";
 	};
 
+	vph_pwr_regulator: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VPH_PWR";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+	};
+
 	sound {
 		compatible = "samsung,tm2-audio";
 		audio-codec = <&wm5110>, <&hdmi>;

-- 
2.53.0


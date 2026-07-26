Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E364A3D5C2C
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087840; cv=none; b=uUsHmp/9s3JYLMPK2o5LE2+YgaoBq7B5O4hwbCZ94/jqn8AztvK+JKrDkqRb67hD8QStFRNrXqs6fSMolpDj4kFtei8APEky/AX4ooILNJN7/WE1dDHTHju+cBe6VNcJ/xsoua13VQ/derJGSeAMcpmerZl8pQFDCWSUJhpYmvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087840; c=relaxed/simple;
	bh=Ghw91m7o5lac5kyAa00WLFIkcbvR+gCx52YsoII8VDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yz9P1k2FePre+sOsVP6M3vGRow8tPcRP8XomhGxnczqQ5a1gdkaad5gFISBOtJys5PPvJL4NBpGQKLcLzArms/Nl626Hfm+qXFXE5EG6rBd0AAGRHxetFJfWKeyhGEGLHde9jHmPuuX2I4uT+Bnekhc0WU9Siu9S9CJMBE8JCVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2ZSoLAC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5It3qwX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2ZSoLAC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5It3qwX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6sNZ720928
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Wn8q67I1I+LsL5SEV+INoURgvYfG27MLgLrvdaN+UA=; b=E2ZSoLAC6kXdzRJv
	XbUUiw6TJmWeEoU2TVdnAGJqWeMKLYF4jZ6m8d4zkORKoqsPyzi1oZojJSSJrl5V
	v8wkI7tTxyb4JNtzm+x+IHDV2ogiWisbrStmzvB+FvxNNCqooVSTSewwaeClPKak
	CTHkRqpTo+vDjt52Fwb1yE+qHKqpT2TZ4BmMjrAmbLkXmGwnxdCzl75njYpd+HR5
	r736lqE+dJwv1ZV5UrZWwQ624IysaS9UluTer74SXo/DVCXxWZjMk5XoFJ4T1I4I
	suPCsffoxL7MaaCUAnn81Vog294U6sks/dO9AhJ8Yd37wB3m3BQRhpAZNDJVDO6g
	vLfsig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajk7vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:43:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ebdfceddcso27695481cf.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087836; x=1785692636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Wn8q67I1I+LsL5SEV+INoURgvYfG27MLgLrvdaN+UA=;
        b=h5It3qwXl5itq1GDN1NZuzGeWyct1mql0JL2SxZ0HIIUQtW5nEZ/LbFRXlD7iOO/TA
         VGI9+0tpwsIdiJB0fIPlLNJfTYwYLo4XBSv/eyn/z3VL1TV50+ExYtirKDZliZ2Gx9T3
         VeY4LNml06vi2XpZkRRh5mMIPoOSFsNeKwru0Zal/NrHcEkJmJ4MHR5nP6U2AJB40H9M
         7M9V4T71+m94VuPU2z0iUoW++XI50Ilxo/fjaCnhVizIIg8NMYrzUl8TD/OHHTtEiHMn
         pLCQBfZRZX1D24hOHgZArW/chnzNjF5iUpxMMBRWvBSuUIBjKKCqu2D5iOUUbSgNGi10
         Kdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087836; x=1785692636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Wn8q67I1I+LsL5SEV+INoURgvYfG27MLgLrvdaN+UA=;
        b=iIxo0HbjgAgFRCoO2K+44guZAIfA3yt+594qRavKcT0K1ov9uV71v5qjxOmaWKaM2g
         VSuIsAbH/JqYSVX4ACHbq9d5zMB/5abBrernjaCKLXVhcAq0u41ub+b01PGeMls7Ezly
         GUTh14/WiGJzX/2K4gdU55CkABpSRoR4cDqAmtkAEwoWehFXmI9eSkiYX4BiLJfBWa2c
         W7bBwUZmSGfHnosQ0bvvQ+WRgGhqQo3O98bKdfrc30Ff4FAoyMAz8LnyHxSsXrwl58jU
         AEYB5Tvs8uK6O3TlPwuDSu5gWGAEeNffnCgwmkd4JGpDpgS9Khnx5/P09NEzeD3XzDfH
         c5hw==
X-Forwarded-Encrypted: i=1; AHgh+RqT3rTgLf1vsCnAiX4Ry085nZ35n0csf/3eAYK/dMZzxpK1FpIHhU+M6czLyDb6GUM01TSzhZNagZYd@vger.kernel.org
X-Gm-Message-State: AOJu0YzVbiO5usy3FXqDanLi7L/71XU4HIW4yl+HrNkgkVUljaZQR5i+
	RO78R+XQJXXzw59HzT52uGY3FCkI0okv6io7zUjaFdQ5YcAcGMY/tSAiUunkPA6CLlUVnTnZZz8
	/Ulwr+M+HVI19Ax4F6k4Nj5EXWuQOxsRoBX9+RFJU68Ng6f1pgdo6Pk4a13gR/Vpy4q0gHJLp
X-Gm-Gg: AR+sD12JgjSQqAB+bupqDYulHyawtrGlGCtAmMX6Mll1k+5RLC86xg7sFcBS0b9qUj7
	qKoXOyT2a/u4d9T89sG7NdPL9KJisYXdeIAj5ouRmngQxj3ZLb8gn08Kzy4fLDma0Ps3zGkOfj2
	yc32XJ9kDVC13GWIQ1gh+24ioTHzry92oBfyCMWFbFDXh9OpoEPShjETT/aOjWMHu0DMjmbL3hl
	aD1c57esWccY/uZtkazz9pRGF7tj0+Djim7xSsuRy1QWzJJdYFIPEwzj02TSNpAaTU3/8VCwtBE
	qFQGZI5UK2ZUkO4rjBPVYd5cwT0J1maGUxKKvO5CM3F2PUDGgOtf7WpOQLLzpxZFz5OIZELSWSS
	RBMlVGaMQuyotXb6QJlDTWgcm
X-Received: by 2002:ac8:7d0b:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-529a83825ecmr59892531cf.34.1785087836237;
        Sun, 26 Jul 2026 10:43:56 -0700 (PDT)
X-Received: by 2002:ac8:7d0b:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-529a83825ecmr59892281cf.34.1785087835761;
        Sun, 26 Jul 2026 10:43:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:43:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:36 +0200
Subject: [PATCH 3/8] arm64: dts: exynos5433: Override thermal zones by
 phandle
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-3-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ghw91m7o5lac5kyAa00WLFIkcbvR+gCx52YsoII8VDE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdKJCrdw5RgOhae3V+ZlW5LCBfKyf23m97JO
 pCCxCEw8sWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHSgAKCRDBN2bmhouD
 1xkMD/0W2GI0NFCSIEjzr6yCzZmhPQHA3qouhz+h2L2NyfikPRGziQerqdXYV3h0RJN6dPOKokb
 eb4fE4EK4iilh16Pstx2+B6M4YcRLimx/kqU1jvlDj9vi7GPHGM6sk4Ee3idwXJZvRUbWwqB5WU
 nOXhBsjR679vhj+T+kJIXX+tDEGXFf60nQV1fA65s5Obtc6AbL3rWVtGyu+5/uTaSRAyjthuIyu
 uiCJMARRY+BprocLsizmVxKgDCQpDu55L15WKsq3anglWXLb/Q6rQiQPYfqN8xNsFDpJPoA7/gz
 kWzY2vIqE/htQCpJ7Z0tVNpf74MDlgnifn6gUDORUHXSwD3pjt4hxri4TkSJ/u+Gl6MMQQz4iXC
 94m/e4wghDVyLT/pix+XgV4rj/1oDI2jwyHj27yRGYy5p5RBLn0a1ywcBrtH7brvsevqqlDm203
 7lag6n8g90x9wLGDQx4SCAgZ0+JAHwcv3bpLJGV7t/4Yqzemkc3MVimJylQ/OnO6aprp6YoxLvD
 sYQabpFJa55ckYAC+9rwccy9o+niyu81eARkfmwHyKu54hxJikwVRa3szYCrjzZFT9ml9fZzD+i
 rBeeVdcX5NBpYNcUbRLfNC2lr5EYzJb9ka3Q/vVjXmkHkiBWZJVICYU0+GSyMp13GS5jzGYGsFa
 5cYPgsgYxIMhG6Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: a_h7SEaBg614muVe0Tg4A3l_wltkzgBo
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a66475d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=51BPPbBw82Ww1msbaCIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: a_h7SEaBg614muVe0Tg4A3l_wltkzgBo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX/8Dfh4Hxxfs3
 rVV9/IbyUbmKG/uY0R//81+XszndZ05GQEYUrs0iGQl9PoDWHf0TF+GfQuF1j1rdwxVFuPVG80q
 UpKBtQYGLW1sR3dwhUCUDioVYSJjRR1aAQIY5zCwt5Xa2WhPed8zi5LXDnZt+c7GjkaYwFzt9k5
 s9rCWGtL4XEN10KB6FbAAiEwlW26fG9buvOmnla1q43uAnYlblWFBlRKn1VBbSx2DQXGTiXBrRu
 RjiFgOHdOBtPKw/jAUZGL94KoclORE6OG6CRHPFrIFWYP3risbkYdhEZ5x8lZu+1+MXT97UAWf2
 T4ezvt5pwaaHG/bAi9Sya4xPRdX+aty/iu1QjwyEub60N1OSLVlZcJxN4boNNIRhiMP7ge2FUWL
 ZYBYqFAR1bbBR3GMexfCYGLUs71VVbt7pO/IIeoROv/VmjI/q5wwxehpmzw79ZSZALKjhv3g0Qa
 5whH0YXYcVLwtFOy0NA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX46ztR66rz21n
 HIObXNy+P65p8L7QhzyT+UQXYAODAyp25D25kF0XlUdEf3FE7kIQf5syn4zOqtOreUNLDqn5Xmx
 J1XGBGx1srGsCHXxAflw6fK/wUd0J4w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179

Fix indentation of DTSI file with thermal zones (two opening { brackets,
but only one indent) by using a safer choice of phandle/label override.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 4 +---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
index 57b335f579d8..a3ebc49fcd36 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
@@ -7,8 +7,7 @@
 
 #include <dt-bindings/thermal/thermal.h>
 
-/ {
-thermal-zones {
+&thermal_zones {
 	atlas0_thermal: atlas0-thermal {
 		thermal-sensors = <&tmu_atlas0>;
 		polling-delay-passive = <0>;
@@ -347,4 +346,3 @@ isp_alert_6: isp-alert-6 {
 		};
 	};
 };
-};
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index aa7539d92e8e..875e75759f20 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -2074,6 +2074,9 @@ pcie: pcie@15700000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+	};
+
 	timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,

-- 
2.53.0


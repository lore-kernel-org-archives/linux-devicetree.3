Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2246E36EABE
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781898; cv=none; b=qYMiVV6k4DHHplLRNB6ADIMVsBgaglCDzQayv+zuB7tQCm0eiALgFFExvCYAT/O/cvX7+YHAb11SsCvXZaj9pct3p7ji+ViR8VEPNyxAkS1t+lLykiq026NwmFwLiC6XLxmWkRt3snIGDodgZDqsjXIswr8wZb2E69cMSaJfKnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781898; c=relaxed/simple;
	bh=zp1GXufqizR+5VEnn6BfS8arlJZLATjlbuLg+yCNhPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRrQEjR5gfNpMcLza4/H1+NTDEPKXIBuc3hVpF2GTTbP9An3xvjNlBhm3/5+bsyeVwrYHQVi7hvyHKDzPAr8pitwiuMi1mi1GyFOsoN7T4nrLYftDeziev0H/Ii9p8P24pALj26WCOkJM/Ul3z1VOUC5rx33ycJftkY16YZ5i0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBNC1nRO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caspcI2s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBNC1nRO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caspcI2s"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WrFx2477578
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=; b=TBNC1nROiCH80PBP
	dKH1XXCDWeEj5ck3aIfOAEDUXyQW4A3eLzei8UeMNORT36rgJTyig4ioAuOJIasp
	wUlY4byea5Sg/Q0mh8BvnEYua5a+8JGGKHJLqZ0Ne039qluXAElKRUMe+5CCxdsj
	r2TbShV9m5cIKFAH0nGV+w0K3AErPxkGuaSRfOrTmBe88y2aqZc/Do2s+RIn4rec
	shEyg+RSij5KQoafvQPYAxQd3zqRrafEuc4IJe7+N6ZDRWBEHXIKKU3y9LF0VJEg
	d4l6EQuMCpzIXyqlxXcRFgKLgYcDkkiSkl7gY09gBcqiPQsa/6bjdEbsdkmJx5Jm
	y46DpQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7c3sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484b9fb055so622430b3a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781878; x=1785386678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=;
        b=caspcI2spUWbkoHC1dUQkfss039e7NZjVbX6dB2Em9HBP6gqAguuffuJfLELfJ0DaQ
         Pf++/q5cg6iDRiEi5VRJgUFtLEhbJQiJGtbN/RBweNkHiEw4arY+2OMvRpqdZHPcfd56
         Zsju7yOGZgqK2s9y80C9/EOm0PW9Z2mUl2yoZ6+yQr/1k+4lLzxrhoVKDAM5+YRH+EPG
         ZXutlILHPyWdPVrQ5wrVhkBTwzflozXSK8YC2SGeLh5KMCGp4kE+U9n9yO6MtylQQcTk
         forTdzerY7td8D0t+q6K5jBSuS4dALfxhWAEaP9pkjIW0I45NMiAGYzJO9qO8pSDz5YU
         on9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781878; x=1785386678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=;
        b=JD7Bngy6JflMyUHnCXRAmRxD9bdyuc+MiHWfjzGBUWQLqbwsj+xgAqMjoOfeHSErX9
         +qUwA950CuA3HW/ImmbS/8VDrY7NLdAcMtPwneWvB0x+TUmP6W7LJF0QLYkr0ruNnNVB
         A0Jw5YdTB2cJCKfm1gcAN7zlONUF1wa/CFBNGo/02X+XeayLk7UQK9xPnDjbWEe+hLzM
         7ZCDIRKzAYs8o+3MzOjA663DL2SxpCqAFrXjZzEY+tKtIToge9pos8TVhz4jsAUZ7YJb
         qRiUzRfgZNg/pqsY5//olh925mW8h2888gNxD6jzGBqNM9lXzbkmLOLHfdC/gR1x7hOX
         ZQ4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKS6Q2BUk1aC6PVFj08DESpe4m4LvM6/TnmLYS4xRGvivZtdHu0KrvUekNchrVEANtpQXvXCwUUhKr@vger.kernel.org
X-Gm-Message-State: AOJu0YyZyHnR3wLT3ndVrXIP2oA4DVTMhdWfTCzG7M4/gaVAKWxvrKSY
	zrDZOID1YprUZAnuEkSlznQ8502RBd8SgKE6Kxu/rv/AKaGzFqgcVrayRLlGfCUdyMRYHoNhgCR
	VumaW1NG1onciTNup6Ohzz83gWaqrsvz7o8Xu3spGKOL4wKGUBT8HGR9IYPXi1fk9
X-Gm-Gg: AR+sD13d6nrj1i3xC7UylPxXIqOkgORF4WyBxZyEcR8B/mnTHb9OTeKPHaFm+X3i7h2
	PBYIjqh7rMRn8apf0Q4hiy3i6nWRxuNjWd/aowvuL5vmzrTMCDvv+48Bn49mvHO4MtvvbiHUQFB
	eAcJTCrHqczqSggJd60A614hgxWkGprg3vNQgWhuAsL7DgA0p5pwzAXz8u9s/veTIUQdWQM4bI9
	oTcvDOqqZnOPYfk5SPjNxF9Rww/K7a1FMiG3DuUTfBAQqoAwc3QmnuVvz9zBt1vGoyAUP2WXJwk
	fA/4ZOCepTkXUQKpvMhO+lkOyy9SN1aCwtVGKyCtU6W20biY6ialmSn+LKtRSC/sc+xIkxct8WT
	D2Y+F/Zp/KkKACEGQHTNoAhllr3+7+Jk=
X-Received: by 2002:a05:6a00:2918:b0:847:7f38:27ad with SMTP id d2e1a72fcca58-84e2c1e978cmr1885728b3a.53.1784781878426;
        Wed, 22 Jul 2026 21:44:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2918:b0:847:7f38:27ad with SMTP id d2e1a72fcca58-84e2c1e978cmr1885703b3a.53.1784781878031;
        Wed, 22 Jul 2026 21:44:38 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:37 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:58 +0530
Subject: [PATCH v6 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-4-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=zp1GXufqizR+5VEnn6BfS8arlJZLATjlbuLg+yCNhPE=;
 b=xoCCReuM9sWmw9kwbpJND8v84xB2buMxPsVSRf7mjtzpq3bfp9trleSKgaTamcnh56dc3gAFZ
 ogFomEK2UvCAtlL8vCc9kDfL9gV/aOlRgg+U5cxJSTwqio8CseL/pBR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: 28dnvazAMvfWwgUMpbtR-TvcMZ28r4XK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXy724XvICtHFv
 bFXHs8FXZe6bc4bDUeSQxqnTYPoiRqo9xN1uesEyVsESnoaazGeukQEBc+d16uitiMienRbf/lV
 rS0N04bMWSaPMgLDsjK5pIEclXAf2Vw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX2KGb/YFRX9cw
 /LPAjag2MHJ7qQc6hkJ2o1XM+WYyFj1/6bLDEsS6/sjWfO46t60L/+EYi9xX7wxqTWArpRp7AcO
 JsaUgcsbQc/U9IZLj8QRSsX05YwkRkiHyATXB9Ki+4jSHjEApcvyXBf8wBmVbYbPQsHlyUGgdlh
 8pSyshHtBz3F3jHD3GA6Dpvx+GExjPWpZ/x69uL9rTq/+S9R+ejrE+G6ryxJYZ1Jnr73hD5o6v4
 Zj4pfzCaGys3BU16pOmbBvAV88Fm6fmj6GjL4Mtx3CMneVQwgkOfYXrmfobDMP5Pe+FnSsBKZPC
 vSCgQtWP9KaH4PZxh5xyB5b0Cqfb3IQpZgR0j+n7NjJUdlzHiHdr2PIzZXImMmVH7GDHznyiaX9
 lZaW5Ezz2OScWvAUJAJYNHq9Vx/IkLfGPbGgkhNfYEbfDQXVEcyYAhG3/SLVws+nP1979ZhYL7q
 xvWzHrlxR4RWl/UWhPQ==
X-Proofpoint-GUID: 28dnvazAMvfWwgUMpbtR-TvcMZ28r4XK
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a619c37 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 215ca0743d943dde71045c331f7cef6ee4d9e9d2..446141e4f45fbafc750f5b90e4bb67cace5c3031 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -387,6 +387,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1


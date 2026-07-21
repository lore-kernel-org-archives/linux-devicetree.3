Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC0847DF99
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627651; cv=none; b=Q+ej5APnTWqeNgV8nM0mzv7E8JQYwHpdWDVXb+bb6CToLnivrPnnpe8jcz/R6++4YTwlkPYM4XGnpDfOncp3sEzJ+/95e6TpqYF06aZ2iPXhNkhZdSD+LDJrkUCqB2TjPpzVMvU4hKGWW/fd008XqDr+QczqC6+HTAxD545HDJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627651; c=relaxed/simple;
	bh=lYuT3wAuvUJYgWLaG91/0UdafTdXUvsgzgEJo1MAEq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZxG8giy6J3/kINLg+s8xySsfO4TzaHKofytf3veDEj89eB6eEkXd04X9w5gJehuEq8HHZUEV5yaGimL1PRP8PzkbAS8AcZGApTNRscR7Vy3uogNRGdn+F47N6lAsWVbQrag+Ui1GOBQw1AQcaHk2l7M5BC6S2ST+6dxqTAYSRYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K504jULl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUCr4pHW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K504jULl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUCr4pHW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8hoWw534739
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	grsWGejb12FxiDp/fmsnM37rDgDukOSGfOuQlSCzxm4=; b=K504jULlip4uWTEL
	rxcvf1mhlyLRQMMNHwFmUTj8C8rpIWCXMsF6fYu+SCnR7hSm/jH44FLpq15RuF1C
	PBFxGHwsenhvnEC7Gs+log9rYw3dwIp7IS2doDmUhm92klTJ3jdjBQUsDyp5Bozy
	fWB3yqFcXW3zndlxpfX5ZnpNuI6fjEHlxBAYg0h+cF09JfItUAm2/dCeDm1IIAGq
	kfpfEjq6IQdfpBabDa7IhAwgbzvBHHOLS2nvGaRyYy1wTv9lNw7zs11SV6SK83La
	EM7cVJofHzqSjD09VoQ20VFvyHSS3n9KKDc5yQqukVC27chA221YCEVwESV7eqBO
	4s/Y5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duhkbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:54:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca3673560so195382325ad.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627647; x=1785232447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grsWGejb12FxiDp/fmsnM37rDgDukOSGfOuQlSCzxm4=;
        b=OUCr4pHW8YS58N4Tn47TlCZMtV28/2ZQ00Q7vR15XjacKncPMD0hrYrimAumHDMU6e
         /ETjyh3qCYHx8MusOX4gfMKOb7KU1rRWIn1RwGk5015JCq7QGECqxv9MwqQ+qi4Z7WS6
         MWKULW503l3J0xNV7WV/ABsbNrvYaqmOMkqchxqZLJAFuBEeMnGIuXaxxMh8pW9EWKfU
         rhxKR1ELv1JUppQKyABtR06j+KwzzOw+6+Xmnmr3Rp0bv4MKHrtzGl9VnNLGY3MakdTz
         MUSZC81REgxwT567JdUdFiL3Kff8Lp5hkEIehIe1p3SQsSWmx6tQNuywSHsJIwiD9hS4
         L1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627647; x=1785232447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=grsWGejb12FxiDp/fmsnM37rDgDukOSGfOuQlSCzxm4=;
        b=c0k2zd0N7xjYTrKEAYf7VIMKueJ9iRh70EDha4Lj14h4jUNDcpA4wcbnA3BBhZPwXX
         SxkBtvoVOffJfXiV0WJRwRl/FYAjmX/TBTnTuG0Z44E4FfYm9AdPRr9k4fgnS2r51EMa
         OpXhBC/tLwtW4kFp1CY/EDciCyVP3zdKCmFBxQysGLAZPg+fFCtmPcV+oqYWRldLGeJb
         eZjzq42y52EoM1MtZJDsK852Cflv10qQITMTfLVyKU9ySETtiLfdE8PfSEkOU5EhR21m
         tD9AiZO3rQj0+lb7XzPnOClYC7o6o/W5q8bh8qgmXp6Z86qMbO4PGR8Ac26Z/WANTUSq
         4U2w==
X-Forwarded-Encrypted: i=1; AHgh+RrhQt78NZyGexCLO9vNudGZj7eF0H07TrJIDc9SM+jnOGCBcccsuS5zodGTQz3lzPFXs3bv0t92DpKX@vger.kernel.org
X-Gm-Message-State: AOJu0YwUs/tBB+NDhYI/o4Uza+ZPQ5XzNGy5YluLDj+XBL+HkauGyMHW
	fRaIeG86Xsk+jsrA+mtW2ts1mdn//l8Hb96eg7WfpGGstaOi5aqzsGZY05zfMSx92o2JMQaD0PP
	uNsaw8YSMpfI60et/yPVX4szcjAfugRiLOxqqYQppYKMRTS+en3zTvUhwXo0zOqGj
X-Gm-Gg: AR+sD11tJqQEJXyXiGTiDN9Yqm1R+ITrGupEX6+knkgQl79OaT8CojLb5sitTnZqH3G
	Fv8Tg1Sy30VD77dUlJlIAUEYNiEJCZ/ox8ATIYeTLADk+TfkQT6LIyHDZ+f+woCx742Q5P0YfkQ
	Rpu4dk2Y2Wo3skFrW4vRaR/hRla3zNpzZst53XWhI7uk6pOE3PMKMOKgFDaUDHidJXC/ixfUGuZ
	OVKwfE+c52eanlErUh7iuFvqE0/KdaOIPf/D1SBUGOORTZmVNqlsh5UeADGeDQYY/QJMWJiT0Xk
	keLSbQYrDPj2+hJY0lQbBRcunsfRS7Bz/Y0eyXUMl1tzf+sWMK58t8NfxRhEBmlgpQtdTh53hKu
	XPs3XGcO6awB/v9AIOdRUpkkbDD7twlp8vnyXfQF7gQ84F9HP5STyycaeCZ9PYCK+vzB42w==
X-Received: by 2002:a17:903:3807:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2cf349175f9mr185805025ad.21.1784627647136;
        Tue, 21 Jul 2026 02:54:07 -0700 (PDT)
X-Received: by 2002:a17:903:3807:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2cf349175f9mr185804745ad.21.1784627646667;
        Tue, 21 Jul 2026 02:54:06 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da139sm71950055ad.40.2026.07.21.02.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:54:05 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:23:47 +0530
Subject: [PATCH v4 3/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-usb-shikra-dt-v4-v4-3-2e7a092d7f27@oss.qualcomm.com>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627631; l=1150;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=lYuT3wAuvUJYgWLaG91/0UdafTdXUvsgzgEJo1MAEq8=;
 b=sC0RrTZkmPn/iKlcqgVYtmCTy90eNbECCd3dtc7JVXJQTt0neLxsIJ5YJPmLQxRpSBX/EDoaL
 w8JYOIfbaLFDJJ77tdldBJfgqTHs3Qy9iBWYqAy9BazAbbWZnwoXgBK
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: V2OnwSFpVpECvL_AjvxUJdeDUTbbMPFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX2cc+e3Zh9D1a
 K7TtSe81bDMZovd/F8avbPNiHLi75ggCRxOt9nOLLAUNlZEqgNz7oSHnfk3cZa6/Co+DvHBCpg5
 elEIqOy3OmJzlwOJuBdcvCQHDc37/5XtWQ+MdZpE4L3yL6ys5bnKJP4ZKY738yimmHSpU5TYW+H
 hcI9dvktjIqzfuZN3IQIcJws6JVxKAYqlDLm3cgZnUtr7MD2l7gFrFOspuV4HaFcqLJ15dnDPL+
 yVoX4WOjPI7efy6cLLiqrh2zYjLcrLQ9HQQv/19dwFcsu72+vpu4Lw+CNPpPWbj1YF6PP7cCEGp
 kUJRT/3Qk2fPJ7l7PURwp7QwAlabZYuFzEc++fHOEHkyFY5io7DzNvbbNzaAJ1rbsgokXovAmsR
 FMYzDCg/MEZgfjqRSa8h1JcmkhywbQOYiji/Sk/OITgvXaRE4OkklnL0g7nhKb8KMOyoZJururD
 UbveFwGdUiv0gBg3gug==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f41bf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Ncz9f9T2D-eHx8tkw6QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: V2OnwSFpVpECvL_AjvxUJdeDUTbbMPFZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX4hKVUjSR9NPF
 3cJ4DWvKbayyI6L93GC++txsTY7KCffsGD10iU/ayRLfOb5cWToLuWGmDI9shmTHF12CVi/7xDG
 2LrSOSrh/WQo+EI7LYPp6as/hVmy3WY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210104

Enable both USB controllers in device mode on Shikra CQM platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..e58b40389ad3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -38,3 +38,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};

-- 
2.34.1


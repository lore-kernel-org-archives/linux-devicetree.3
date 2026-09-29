Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169A0529405
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687462; cv=none; b=hen8AsX1gdH58neoCTTl8h4Q15VuYvpjiOaXyqjqHMFBsu8kgRTIXdnrbf43SrAPLuydEW8S9ScC0axZ8T2qKmc2HHlWnkJwFigq/uJSA0YeDIazVR1KIcc5MsyJXvBbO6AhoxfMf8uMyHAgPQ91j9yhbCYDlXlbd+FbbabzI9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687462; c=relaxed/simple;
	bh=9ojsiGAObDae06PZ+LjvSvhfUDVVA7+UNRsbvF34TR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UemW8dn9JerY0S3V7PzYnAKc3ZBvemycItY6xXuYju8lU7NgNkt099Wz14B2DiQ8d/Ng3shw2XNkmOQJac3ri4ZuT7X3HuHXNJJwyymxD265f0BK70YPg//8r7YLrSqZHIB0b8+fuCKls/zxK+PqkgPYNTL/NenZ5XIuq2fJtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6hPmdAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4uVXGAD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6hPmdAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4uVXGAD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqmsN1477885
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=; b=E6hPmdAZCN3EXaDH
	K3Qn7JF5m/G5mLsVOSSqbimYgm0SWeinMJPYG8unXlQqPY9XO5WszP+GnWjCNt//
	xqRYxBfjIe4FMGmQfzCSlm+OzPgi0B4QZAybLpir9DjIHNlkszbI4xVjvaXVResB
	UnzSlcQwgnZrnwE3arXMNfw4ul7hOQP+p0m0IJoXR0PRm3pRrLR/Egf3+ZSeWK2L
	XW6DgSQDJIgQ0JXgE8UBDv20oPQnok6Z1rj2GDAmIN8DWGRXVWvnHmu9GDyngeiG
	Q50hohQ9wGibmT+52qArm405Ghi7LFTUekdrAnyhgYRne7bcMS/EpFuNbV6og+aX
	Gd5AaA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03m6ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:11:00 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81eddfe28b4so61970677b3.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687459; x=1791292259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=;
        b=d4uVXGADl/wbMBPwOQh6CJHOFbwEMw/k+wjuccHh8roByDVGe6zBMZNEJyHUbSiEhT
         8Lqi8ycsAfx8ssjfp/i2dw+Scc4x+hi8U+1RhL3Vle5pkN/vY61RL5MknFDRoSSJzVoV
         m03HzyF+n1s8nKZu1zMK7kCak0i1G4fv6SpQZV8mEnYk2TbiQdHW2TrifFvFrbWkjoqA
         2LCoUOWuHv8Zn/cCM04P/tLHN+wrHM4MYQyaSg+QBGYPBvubtbBl+52gA44dnf48Wazs
         ti6hVNTrdi2HtH6+I1m8VOdU4bDIb+sj0e27k0W4iQ2EG1F23sGZBFHSwfh+EN6C3tuD
         IM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687459; x=1791292259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=;
        b=fgt/RB1ievmFz+HzCvBAJi8DG8w+LypgDbXJ4VnDED+/1SwxR6fF2VRS9Lrp2WEZKY
         eSCeE2lAiMXpjqsIROgRskOGAhehAOZat8J1DiduZmu9BIkpx8sTsi+FFtFhm89ZV8dz
         eivsFbTUkfwyiBccyjhhUrMm7lN1LrJ1u8janYmP/iGJywDdgQTZ7qc+w0RO1Vn3tuBF
         u0Re/lXygBAv8Fj/OYeqFLxWFBecf7OPUeIkcjT0PIGdRi6az1m9NubXq352zN/AmdGy
         2AvEr8UWJhuvK6kZfCR/xuT55Jw7TI3Y1xAJuWa027L9jp9nxqu7X1COgZUi6uKkIpn7
         VD2Q==
X-Forwarded-Encrypted: i=1; AKwUvBynyjZ1hYiyQCxq26gqcRC9U9rXyVjmIIwXqolzQfl7+S2SrxN0VsNqtBDCE2tk/zqF27CteYDe1AJi@vger.kernel.org
X-Gm-Message-State: AFq9FYIpGy3HBgcubGxHtaCaJPBTTpHzWmFVYK2xa+qvJkcWSXaCOfMT
	QT6X90QA6zB6flV4dz2yyErsPoHzCb5Kj3kiBTcH8o01sF7PGfwMvtaeaijFVQKUoIY/wln1R0S
	Qvh2vwMkTZUlf2eIA6fVzUAVsOhntayXUBVxLqysgRNvUHE9HTRNptr2hr4MZo/EV
X-Gm-Gg: AYBFou2nJ3zE1VMD23CrCaxpBAyVZVghma5zKX2L7IZ9zY9SlvYi74hSEIV8GueWpb7
	65kYbkA3jfU18ipvHwbeL1hZKuYRornqwjwJXS+h/HVFxP0Hbt9jLwrZiGpjng/MY7Eo05zB27R
	MEiFV3Y2f6ejyZEh28u4fZG+4IzXUo3G5FAFjy5Icbjm2U9JC88YI8tQZ9mCc1+dxrgRpZZR0iM
	boztgQJ9rPvUd7Zbm/Cxy46q5DQGYuC+Wwr4Lj+9hQTtp4jRPaBUQN6Z69IsBwHFac0y8EL6BRh
	lLp/CS92JKcrcdVJdzYYA40fkmWrL80ulXeOXy+0xlFMZXNcZRyKIuImM1NNdbeYZUi1ZFh/H4H
	OIg5D3SEwQjWFDMNfUo08MW4FIxKPJfhctjM=
X-Received: by 2002:a05:690e:408d:b0:675:5d63:7b26 with SMTP id 956f58d0204a3-6755d637bcemr1906985d50.53.1790687459289;
        Tue, 29 Sep 2026 06:10:59 -0700 (PDT)
X-Received: by 2002:a05:690e:408d:b0:675:5d63:7b26 with SMTP id 956f58d0204a3-6755d637bcemr1906941d50.53.1790687458764;
        Tue, 29 Sep 2026 06:10:58 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:58 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:42 +0530
Subject: [PATCH v3 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-10-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1212;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9ojsiGAObDae06PZ+LjvSvhfUDVVA7+UNRsbvF34TR0=;
 b=u4iXrFBZgUFB5iptFcMjRQeUVV5k2ovuNLVXsWXLgTQXraWQ453EYM541qN2VQ5O4pPZBXkcF
 CXW2USgM/CZBNn4CMkNlUCSw2g554xmq0KthIYZfSLLDDIkfPVcYHFp
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX2OMf6A8EEbR7
 Se+BQDBgVF3E9qnVU0LKpkk0wx27ReHE8By9ByUsYHka9qfkNIHHsGieOfwL7m8HyfEjJAsCNGQ
 fXe+V5R+rgL84hjtBmcG2fgOVlEret0=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abbb8e4 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXxa5VbD6j4JGU
 Pu9r/OI6CyUOEDDOnCOxvidqGMilZi7PRp74mtFD6nGq24+XQWglSSAY40CeMgA0xk2Oo9C0ZRr
 hw9aMOGCoypAuMUZvSMflyOpCqIxmXTfc5lA5rZdGPprHbNzphoI/7GA9sVhqJTtBcWbMHu8zC8
 /LMWuo0nu5sWBR3VyUZa+NnATkkVIRvxDDsXIB412G/hJ6i1yIUrBlNhkMJyx1Sgk3zgp4X1AnT
 0gZiYbjExu6SkcHc2gjUBbqoR24Nvnk1oI6fC+XA4JgBKCLRZy0bf53VF+pgmci5dKTcQoG+BIB
 5GrqUYhCtVfe/oBWoOgbOlvnxuwxxcyfHA1WkIOS3XI0kStkvVvtsSxpWOVcAg49tdLwH+75jWF
 fF8pJ3KuhYcK2r0+GsB0mZxcqpM0TZlfDiGhlgkvrx7Ovr+asQOMpjrCFB7OSsl4LfozG4y8WU3
 Fv033tTLyqe8KOy7Dig==
X-Proofpoint-GUID: a3Ou1I4v-2TVA3Q6o48mn1rtPXwXzf09
X-Proofpoint-ORIG-GUID: a3Ou1I4v-2TVA3Q6o48mn1rtPXwXzf09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0


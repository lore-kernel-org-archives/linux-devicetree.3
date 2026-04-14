Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9CD24E4A8
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186541; cv=none; b=MkxbNQ9LqQOkd6RSj24zDT8644/h+sG2OVtYJtfkxzfRD0ejBgmiCoige5fxq9FAICGfs7c9KQLqn6s949nSByqlAvS678ZYghAtlO/0+yjcLcfnRSVr2opxuM4pXtAeYf18fGVscQocog2ZjtDXmOYUH15boC7ko8WOdQ5qDkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186541; c=relaxed/simple;
	bh=yjWF3977KeB9UwLgArSZ0PNz6JLgNJ9i5nBCtXTUO6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nhVKiLgNUeKrHj+H/J6QYp5Znol9ATrkYbmkVQqKMUjaUi/RKydY8zeNK5XCjKHOnv+81corlMoVi1cYos7NrM97Ny9E3nuM7p0HuBIPzs9tD6Sw5V28aaLItNZJ5afZB7LS5gaSz4hhFZj3V1uumqtHdBGtQb6sSSF5nI+xZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqQoaaOP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Plaf8Xo9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqQoaaOP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Plaf8Xo9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG9JiO731034
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ptbWTUhwItH4k1Q9IlbO0pxaLn/vNObDRW/fdQqP5RA=; b=jqQoaaOPTTuNYWI/
	O9EvWVfASPxlfPRd9RvSsUs7cBVwUFeUoihy09cxe0Cgg/TLFDMe+6upwNw2aW1F
	4yfb56lwAT5ojWdPHRY3+1eCVJKrzr98Lk64vzzPJVLHzdqAW8oA3esub8o+nND+
	8i/2Y3QCN2bhws6Vl0Wgzy3kT0idTExXDQ652bF57Joz5BpkT3KAN8IhaFBj0OoX
	PaZb34Wc5X8UEjRZTn7HRntheiiKsUhkoepTUmfaYxAymFfAvoFYDN1aBTDZYElm
	lNJD9aRut5DUCBWnhrFlYJwtbupgKy1AiG0l6PqbqNDnfrixqOrua1Ulw3Y19Z+s
	eQBVYw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruu887j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:08:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d83e7461so75285185ad.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186539; x=1776791339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptbWTUhwItH4k1Q9IlbO0pxaLn/vNObDRW/fdQqP5RA=;
        b=Plaf8Xo95bn7ms1hM2BGCcUoGsa6fwhkOZBT6lmHA916O2pmc8g7K/QmoPT/H1ap+z
         ZEYEuGD2kRDTzROjmiQNqfHofssPs7ZfJLwWwAlgcR6KXNZGLmGkekj3L963Hk5zg8UP
         vymCYxtN54IvfXoSu9VIi9VZq70Tb4xLdo2tzvpShdgSOJAdePKIZBF6s8Lpk9Kxhil+
         24X1b/gqjqcHOGMjf96R8RmCPT+/BEaszeF4yPIQmohK0luBUIRmEjwMDvnqu30JKuyW
         189Rwb6WY157kY/bB3YGpWNAtgSDIpIFWVb6cNIzgR4AkHeYkXaUHU+IdISi58G6KxTp
         jZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186539; x=1776791339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptbWTUhwItH4k1Q9IlbO0pxaLn/vNObDRW/fdQqP5RA=;
        b=K/Mw9p3zB+ParczBEEmzCi8wcA4jZ5JLPYhJrbNdxwf6Z+6wD06WBnt0S5llPoXa8o
         KYDYFxoOrDl4Mw3jXCEjnARpyDiyU8KT6SNze3Hpv+t+ct3rB5eQiHm3pfp+n2STdxTH
         ePucX18g6jGJdysRhB9IKZ/ZFv0XHAjsFklLm2aqlEu+xiGx3pMmm+H8NncsCzNd2FkV
         zyYVcmdBeF1l7gQGUPDubcltBGt9ex3bldK847it9WTnFCK+Iu4P5ZYNktlP2Y9x9hbJ
         dN1FvXmMD5h28MmNb2uKuFKqJMj/TLLjn6ZqVx+KLm8KzSR+KEL2QS/Jt2djI4Y1z1rG
         dJcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8x/uqPeGmkei+zy6eweCcfY4DqyJR2N1Bj6ukTZijM76vA8bo6y6ir9eSj8QjaEiXq5qgOuJhqOI6j@vger.kernel.org
X-Gm-Message-State: AOJu0YxLb06u0f+zkmiPIDC6lQ0e/NqQM5K6I/3XXMn46tu7T3kVCNCM
	XG4eyq4bjYrsT2dsY/LsFyuQKvsirhB3NdvxA6icch8PXBzV53KCWUhyzcQfbTQ8MhTrytPI5aM
	p4GtrN7UeT2blFz/pysJGVi2diSwKmTafSyoJBLAly/eZAU90l4GKaWZ5GJFNIwHt
X-Gm-Gg: AeBDietBMfxiFET4MXiLSARRLUDGaZV7m2aE0bbl8fZVCm0RafILbYz9n4pL4XsxDZ2
	dnJBruBCmc+8kFp/K2Nou4ngaccpU/uNuwBObaOQaWmoa4iYU1HHLHfbgxCfUYk06Ftk6u2azHh
	sqSR++Fn6yaq1N4vp28d0KYWfSSgeyGBZ7uA7Tpp0GilOuWCGDYJc4x0gcvpEkM1/BaT7tPVnP9
	i8R98stC2BvkfG1UoiLX35l7h95mNGOrpvFlH9DULWuDK8lRThGlHvtPNTGLoduQ5zs8JNLvytd
	o9jGHeKss8oS9Ujuvg4KJ7Fk4yfTXABEzq9WXQMp+rH2HbHVyTlGgwhZNWKilKKYXrEf3UZUQ8a
	8FDobu76vD6KHmURhQ7Ac18SFj0+aA9nJYzcwQplw36j9VSCoVGf+dYtgEpbh/ddju/VG
X-Received: by 2002:a17:903:22c3:b0:2b0:4f9a:b794 with SMTP id d9443c01a7336-2b2d5a6e6f2mr176877735ad.37.1776186539012;
        Tue, 14 Apr 2026 10:08:59 -0700 (PDT)
X-Received: by 2002:a17:903:22c3:b0:2b0:4f9a:b794 with SMTP id d9443c01a7336-2b2d5a6e6f2mr176877345ad.37.1776186538419;
        Tue, 14 Apr 2026 10:08:58 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d1ab540sm97535225ad.40.2026.04.14.10.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:08:57 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 22:38:23 +0530
Subject: [PATCH v2 5/7] arm64: dts: qcom: qcs615-ride: enable QSPI and NOR
 flash
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-spi-nor-v2-5-bcca40de4b5f@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776186510; l=986;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=yjWF3977KeB9UwLgArSZ0PNz6JLgNJ9i5nBCtXTUO6s=;
 b=cQjhB80hDdufSNv/al+IZfmvwhJSjmL/Ee+XgRVB/frebQveTWhIohKw9dUX8L+BhUUiInCfv
 zuhsmSqOLaoAtcAeGVHlkV/0IyJWc8C3cvs8jc/CrRtuYco9YI3USG2
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: F_RduI9eabaxl9wBUuPbS9GsgDKnyfOf
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69de74ab cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YmYAkDX_6c-Kr4-_JJQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfX8RdcRMa7/kG3
 6wXJUCluHeci75GwTiWv323lLTMBVXlmcsagzmiXg8JCt60IaxIpCyarLPjlE2GtfQTzRTYW+Tj
 Rv9ZtgGdm8GTJ81FuVk6TyTZ1hzEk7wzt1frxZ4ddVVpU/3+/AcDy5X817ZxUscPSpgkb9cTQIU
 0OhI+XskHrppnq9LBX8Atih+fJCxe9v/KhU7CKE4rPsjpsKaEz0eXaKGjJajw3XPGpkjKqEjDiA
 PngGjCALZl/Z4UDtwZ0ZLuXcbNdukkUd3gFQ7v1U92VeCUyevzaZeJgOjqts3EASisvx8HscoFS
 liIWjzFOGBbbReyPE7aS07xUm3e8K61+Oehh/P+ziBFBh93OqTKsSO0ch8yqkwvjof5jbSbOOkS
 r/xb7JCipb7JIEmM+tdRHAsTpuwIZBGZPTxqqwUcR+nRQFGUNb1Ut6akjgAsd4H0h9ZJQX+xHAb
 NT30ZymVEX38AZ2T6SA==
X-Proofpoint-GUID: F_RduI9eabaxl9wBUuPbS9GsgDKnyfOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140160

The QCS615 Ride board has a SPI-NOR flash connected to the QSPI controller
on CS0. Enable the QSPI controller and add the corresponding SPI-NOR flash
node to allow the system to access it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e..b096d96ab220 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -516,6 +516,18 @@ &pon_resin {
 	status = "okay";
 };
 
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


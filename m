Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2AD374170
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615049; cv=none; b=abX1EIRXVaKOYqs6mjJ3wewGqJx3N6q574i7jvs1WRCCmOAfeGNAvZ2W0kUMxgUtf8TNMyQsPB9waKgUjSCnaiUCmAersynTAE/9d6h+XB9VfMQinNHnD6s4lIOtV7y60+RRy79Uik1Azj3+8nxTTR6bhYQ0V6AZtqjA2a79T08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615049; c=relaxed/simple;
	bh=6bETg1n/CHOqDA+GsbItGUhyIvRxlEz5uw7b9XLF0qg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dAzY2EMpF6yiuT9hefGL1tXU4rU5VvFCrJW5vQRTtGHTwapieHuisiVlss5klLU7c6sno9rPRzUBngHecmFXH1hP8jn/u07eKWpzmGwtRdG/O22tJyko9fv1OkVn7lhqeSXNBmuTuTMfB608KtVmVbP3Y8XVs91+9ILl7S+08uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoEvUMU6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFIwSSR0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoEvUMU6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFIwSSR0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABnXg3384145
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zKrjD/owqDp
	zfTWdDkF6e9BSnZ83rQzQLPmJFbWfLCg=; b=DoEvUMU6S1W9QCS5DMKhRDtyzev
	8MaBG99EQ0HsIcAR54F2jcCpLeBr7gT2JNZmez5iCfjo5qwXGTjRib4Nxo36HQx7
	Qh0m8BAq05NXeBOjROhWsKKuttQ82Dasog53krBdJ50CcQqz0IxX/sx6oVt+3bAj
	Y7N9hRza6X/X2co2axiDaMoDIPx6fTP/BpLKzkPM37oABmFqXR3+npiy5Xg8YnxZ
	myXtt/lVFykHCn6jbom5TTJEwMNwj5hDmY/cV9jExQAcs8PIFzEhNM+A+/E2VLKx
	KhLT1tuDG4oHf0y9BYWXPjbUgThHfY+CjflI82e3SZAgW1Bxv/eNhOYR9JA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep9gv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:04:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf1845bddfso47186315ad.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615045; x=1782219845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKrjD/owqDpzfTWdDkF6e9BSnZ83rQzQLPmJFbWfLCg=;
        b=GFIwSSR0H4eYxXEpqYiszjwAVjhRIx6ixjBQm+AP4OaGL8UIvhOKMNynEGN3OcC4/T
         tzQCJRTstiAOBYbhfdMv23eoVhW38Dsm7BUc0Eenr943M9JlZTwXGe/gYCZAkC3yGGc2
         oXtT27THQkxI+L2BLeftZ6MTmRm+hVEBo7VzKXjb0VxvrPCqLcG9MmMp4UBrnNVnIbXn
         pf2kdRg9AoMiwO2ZOCnj+Xirljl0g3xileESy9Q0W8MpcmuA/RGOin+mMA499lzaX26j
         Xgm2lHP13Nas56laCw0kmAEdw+7i8vXK954c+iFd0r0huFxqsfsZ67TOUWMARsPPP0H2
         r4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615045; x=1782219845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKrjD/owqDpzfTWdDkF6e9BSnZ83rQzQLPmJFbWfLCg=;
        b=LH9ZG565Ac5wwaT1latR2JjPii6lW896XgzZVxDCB7KiAKu5ypJ9rhQttH9DVpr5wY
         5jOjE08LEPtv7zEE5x1Rl1AHd1WAXXYwoKlZd6yYugdMkx3GfU7FqM2w6JkZsdWS1tsL
         P07pzKSPzvTPzqb3OoN2D69b2hTCLeeuoqNtMxxi5gRteKkcFdX2Fp6IVxy8QNWiffna
         4M+P37TLyEWWbJBUHvNc4oTQr5m+pHdp5H3gMpE0avGs/+uGn8jQYHkFZJH4pA2YL0BF
         WJDdl8VjHJL8/knqHHFxzSJ927yZEZW8dOxSCVtu9pSS0V7yWQtIbxSW1SHiENIkSrkZ
         0awQ==
X-Forwarded-Encrypted: i=1; AFNElJ8y9QN8dXYf0LYtTMuJGEh6GsHnGbCFlHB0VAEVJi9zdYOO3M0tNuQbv6nFPBf2Uzql8bNefMYo/s3o@vger.kernel.org
X-Gm-Message-State: AOJu0YyopCx6iMWO1icp5gbvhuuq1J8OTv+y1L/Pf5YvwON9kZ5GrKmH
	+J3NgArwCgfnN2HftHVXPAz6I2vh+0Ye7XXDnHbNu1Q7TDxsBNEPLglzvqgGF1J/vaGShG3nEjK
	a0TDq4yfl8viihjlLFKMSYLI6H46nEcmCabQeuEyc96k5LSy0v0IWCz7o/r8WrLBI
X-Gm-Gg: Acq92OHj9KhcnKEFeHJonmIZhhA4wpNKw0+eqV9GLdwKqruv/ayhv2IbzP9LhAyGIRt
	OlwjzjmTY6E3DfvucXcTioEOGFTCCX4jnxtgk+ORVijNOEPmNmlwkBbJAKPN8XkY5PlJ3RA2kFV
	RXbpg4dyjNwk5/Jp0dpb3klmWLb55Q331BXXluGzIuF+rdXyOD4LzO5XfBv54pXBq6M7vNEBrAq
	0BBswGGzPuJuH/8N8bxjYZsfWXux0yYfA1UMsASL8HHRm0R4MfyjavYDh5LsxHZ1lyk6SlZoaYp
	eICzW9SxnN/oSRnDlF+OMZG6cnE1/J+IVVMSX1wik3dMp760bKrX1GVDcafl7AMCbLIO7g0Te5J
	ksUqi6tal0gj7NiLeqqmkXvzJh3+lok4WEZOPZzkaql5kdnx/FRaDch7c
X-Received: by 2002:a17:902:c941:b0:2c0:cf44:3b3b with SMTP id d9443c01a7336-2c411d7b1abmr212184995ad.24.1781615044857;
        Tue, 16 Jun 2026 06:04:04 -0700 (PDT)
X-Received: by 2002:a17:902:c941:b0:2c0:cf44:3b3b with SMTP id d9443c01a7336-2c411d7b1abmr212184495ad.24.1781615044431;
        Tue, 16 Jun 2026 06:04:04 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm134867235ad.23.2026.06.16.06.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:04:03 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V2 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Tue, 16 Jun 2026 18:33:45 +0530
Message-Id: <20260616130347.3096034-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
References: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a3149c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=c4nFiuB5qTS8t_IgZ2oA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX9+mO2XYgvIPa
 TcQpsTIIwrB6pPrObxXnmdsg3pjApeSuXdQF1Xk3eS6XwM5ytxuM2HT2ej2VH9l+XzR8A4hAi5p
 oDF3kbDuqC+OPZNJr9hpNAUIEC94njE=
X-Proofpoint-ORIG-GUID: GAYaY8dTvCxCgvz-zx4ynkEDqI7BW_IV
X-Proofpoint-GUID: GAYaY8dTvCxCgvz-zx4ynkEDqI7BW_IV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfXyWwsZPLEW4R6
 /ML8zxbVIn+mzf2AgTkBelkj16r4IIDz7RlMXORxn6i2bKJOK2k+jb6o/Nm3gyvSIUucg5aDG4q
 EzEixS0oJxrYyXEljzm73yGYNSTqF92dMlOwIWxOCNURusZ0Vpalcw2i05wMg9sik7/sQdbLHJW
 WIKdc/OxjTNOgVUIER7bfhicLp8JbhCq1t6LTFjvj5nm0VD4jckwP7MEWC3LzEABUntl21X1yIq
 DQfIOiJEotXOwceMw1KbmwG5vXtdZt0TcAuaz0FwMDJgf8e56mJOZChCpaX/OuRtwxMjaeAROXD
 bfXSVUQrK0y2rvEQGzwyYFhvMVsVOT7ZLMn325L2WsnVlcQWrYUJwz3BmCtHFX3wpsAsK+WluC1
 o9HBFw/kJvmuzn4hIAgNDH971is2sCuwM3sG6E4Q0x1WprkvMw3v55ZtGeXKVDHZvtxPrkSLZ7y
 xxusKoUyUUK3wQZFwyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160133

The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
and conflicts with SD card operation.

Remove 'supports-cqe' from the SoC device tree to ensure compatibility
with SD cards. Simultaneously, add the property explicitly to the
qcs8300-ride board device tree, as this board uses the controller in
eMMC mode.

This ensures the SoC definition remains generic while enabling features
correctly at the board level.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..e82cba350842 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4832,7 +4832,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
-			supports-cqe;
 			dma-coherent;
 
 			mmc-ddr-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..3090eba0317a 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -719,6 +719,7 @@ &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s4a>;
 
+	supports-cqe;
 	non-removable;
 	no-sd;
 	no-sdio;
-- 
2.34.1


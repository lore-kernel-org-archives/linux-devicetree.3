Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03A8343D66
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 05:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777612768; cv=none; b=gc0QkUClwXFCLOKtsyBwocHkzOGV4ddDua7u7MVT4BFHE+9r57+ClAVhLMmfQvA6jPr5CY0G2GdyP9wXumkVAqN2ZxdmuTllkjPuB8AC8aPL86e+upFkBqD/E9SA3l16Sh4LJ8xjm7NKq4SLL0yljmZ+PI6gNp5TYI7MI7wG2D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777612768; c=relaxed/simple;
	bh=ucgqozYA14z/8c6S0n3Q2xP56B0jUOkKavb4a9MGLaE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U7gV6dok6/VCgoBnKcZjbB1Bz4Qqklpz+yLjjf/IIbmWeiN50EvWCBWHjaAd13KC7ylM2a47hWzPal2K7WwUwjwBxygcYnmPoBHLCxZZkJOfRVnl89CABETPm5Qhquh5eNtjX2Finl0D1UUeH6iX5zyiwf5wyxyytvMfbcsHq6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMVIn5Io; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILn1RlRv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMVIn5Io";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILn1RlRv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6413Gecr2481069
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 05:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H5RMe1ATvaJRcbdAD3bFr+y824kSK74UIkS
	TNJzuUTY=; b=PMVIn5IoKB0QC85MNgKvvxTrACcjjWDeI4FQVimyC3rv7OyBgJW
	7QqxDdht8OPWDAMzjtlCVwJSNYNt7vJ2pL6rKBpHwe/RfFBqyWiH5TwDSUnH+yxh
	8+BYivv0uxDln0hc8CWITnNPuCmE++Hr0EdU83lSyMWOptQ0lTORTv7vTSM68HOL
	qkT+4JDbedFXVJPq1GLA2uOn2lbA+TlwdP7MekKJ3HZnMD64BEneMggf9sUTFHaH
	QlxuWxsgXm1uz8Bq8kvA+MMgoNCKN3VgEeAYGiGLW9F9CVhBfvYwh3vnyhQWOKKu
	qPqK+NBUFey5IfOVpT22Kn1/dZGdYdNa38w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7x6k6y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 05:19:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso15143325ad.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777612765; x=1778217565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H5RMe1ATvaJRcbdAD3bFr+y824kSK74UIkSTNJzuUTY=;
        b=ILn1RlRvh+iEoV23KnpwM0IIrhoca1rpQ822r6FE9FysdqnxYZrTdN3Ueqs+FyN/jx
         X2rBq7dcti9Ztf+XtTsQaAZmGnX/gOw+mpr0zPYJXNDIkrIWrWQxcuG/E+PKIc9eR3e6
         MiQr2HbD2zzEx2WbU6mKbUaTgCSUZb0slzM+IJfxL/nTW4fQfEkBl93wyEjqv/2R0aI3
         jQiyQ8aTsTfFtkBcU4Cj8J/Acon4u0rtru0VJPFHngwm7kXCkr7wBiYcHl+xHJymTs43
         8Kj3DwTgayu+s31JAQhK02dHflwe9dQd9b7xlPoqBG08CY8tuGvzEWNqmnUNdPQd5eOu
         mr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777612765; x=1778217565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5RMe1ATvaJRcbdAD3bFr+y824kSK74UIkSTNJzuUTY=;
        b=X0+olbcPS161+K3OvtuZRmwVlVIdRUGX1fsFOuuIH+3ItTMCDcQz8aQqh9dQ9Pj2wY
         tSyERlDmApKsTlbqzzk6qSufuDDcU5uJrjsN4YYY5mBgSjrHhoScfKECdA8muWN/M57s
         oanXwSnpU5KTV0os8PlH7bSY0luwms+zUUzUA3mcBJ4SE0MHWIIVHMdecAaGaIAJxnaO
         TwItYOcH2g6HsbC2Pgw4yOIf5mlGvzNBeh7F4wlgRBUyC8fHc8Yq5tbg2P2So9Wnv1E2
         LIElksnND47HFNAOABOyIC+PtwsStVnJjM7URkgTuuyNoxb4xPO9XWP10wH4jsxtQ70B
         bA2g==
X-Forwarded-Encrypted: i=1; AFNElJ9s1OwYdHCYXUQV2x23fi3mRIBVscxqic6oINa6OdTJFgf3Jvz1jvmMlFBEiBqhPAa7vwsrboUJknNE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa1HLpTE5jNBxTVI6h+UbVyj9F93WypEKJcaC4c9BQksB2hWf5
	xR5VO4rqPeFCfRikVZ+aFfsoTpBQC1os1R0u+Qk0Pftvcd/z3fSj4l/0Ly9rDXk5LmCJg9/E62s
	fq7H6VI+mlXOiztPldvVbReWyMjf0JYF/KdlQMGRnaj+0PAnqEQaHcIplropPhMoo
X-Gm-Gg: AeBDievFBIW1tRcg3mBSxP29Jss6ll6ABd6S09qk5gdYGjUxL0VaiqAhf86anF/GpdD
	Nuu3lf1W7BlFQ4CqlrIZ/VYWpX99YcnX8+ECe/AP7Qg96bz4BRvXmqX+YFCdOmO6ja/WA+Eb96n
	E3RH5PxpQZbf86MB+DcRq+VYs27bOHWYlaH9nt7rc0kcAg8Jl15VYS7CLqpvepTFb3ZfKcOn4Cz
	MVOchjAnFLO3SHU8drfnWGlWWJ1nyXIMqohNe8ect86/oK1HhcEsWSacGojxnjIXtM1SZL+1mEu
	w7x8M4TgI19dz8hRJVpPe3a0dppXJjmwaxmFAvC9ilcjTzN+B8k9ZT8i075kmutki/idGdA40Vv
	d/dSGkQYGnAYF3w7zruQZWvMwQJxwcIL/bUcmhN4WRs1JNVQkcgvj
X-Received: by 2002:a17:902:d581:b0:2b0:6d56:8d29 with SMTP id d9443c01a7336-2b9a2513881mr59182915ad.32.1777612765338;
        Thu, 30 Apr 2026 22:19:25 -0700 (PDT)
X-Received: by 2002:a17:902:d581:b0:2b0:6d56:8d29 with SMTP id d9443c01a7336-2b9a2513881mr59182565ad.32.1777612764792;
        Thu, 30 Apr 2026 22:19:24 -0700 (PDT)
Received: from zhangq-gv.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae5cc52sm12353955ad.78.2026.04.30.22.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 22:19:24 -0700 (PDT)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: Add fixed regulators for WLAN supplies
Date: Fri,  1 May 2026 13:19:18 +0800
Message-Id: <20260501051918.1990713-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8TKBEkl4jVE0U0nHPycA7YunYNElsumC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDA0NyBTYWx0ZWRfXxOruOcb+d//u
 +wVc/fxPigQXSt7QtoXSuZBKsIBJCEywnJMwUVIwoRUS/qYLwhbsv0nymSIldYLMMOv5lfCh6qU
 luA2o+iFP2j4oHg8ISWr+njt7a3cEgwG4rK4quqBvDCMZ/EaLYLMW4DA/1WB/XNt0VaL/sJMO4i
 +vkquqrN1X4VstuvCfz4kjPHmK9Fsf+spCcY8J8yPFkWv1bcu4/HiPetlbyx81NfW76ybhKYZ0M
 QfHA1v3FBDJezAaxuECdHuSmDKFKG3VJL+vS1Orro/jUOzLZoEYYUaDwf54fkVX5JfHad1p+Ja9
 lAYYdbvbg4i0yCPXA9DDgNx9x6mspOaRlVGjYGjBlIBngsXlG/irmDBVxNOlgshJo+6od/6UW+T
 TZjmw4WRyhBYi1Ktsz0ZayHzEJmf5c3vHkj4ghbiSYy9YSVzaxBSO6dk2SfGw1eGIHb3tczeVku
 e3/SxQQicJ/KPyKYavw==
X-Authority-Analysis: v=2.4 cv=XoTK/1F9 c=1 sm=1 tr=0 ts=69f437de cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=OYB4W3EJkAgPSM3XL0QA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 8TKBEkl4jVE0U0nHPycA7YunYNElsumC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605010047

Add GPIO-controlled fixed regulators for the WLAN power rails on the
Arduino VENTUNO Q board:

  - wlan_reg_3v3: 3.3V supply controlled by GPIO54 (wlan_rf_kill)
  - wlan_reg_1v8: 1.8V supply controlled by GPIO56 (wlan_en)

Both regulators are enabled at boot to support WLAN initialization.

Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
---
Changes in v1:
  - Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
  - Improved commit message readability with bullet list format

 .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4dae..1a40ac5bb4bb 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -153,6 +153,27 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wlan_reg_3v3: wlan-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	wlan_reg_1v8: wlan-1v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
 };
 
 &ethernet0 {
-- 
2.34.1


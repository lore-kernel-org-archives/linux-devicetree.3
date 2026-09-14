Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D484C3E2AD1
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369311; cv=none; b=nHqxRnS07CT+QFGCclGcIQ2zjJe9Um9kZyeTUBGkhbqpB0dS5CjO2vjYy9JhdDzIhe0fyqyjwhdYZfNiviSGFs4M+Bn2lv0zmKn5iNnAbytnusiOeB/62/fqOYYTvOdaH1D25MILvMoqtQP7JMf3+yCY+PGj8u59eDBi/3ASccc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369311; c=relaxed/simple;
	bh=sPo7S0YBGGUWx/tPJNacZpaKi6ZAXl4m+zTdSQEAPHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTeK+qm5Lse70mro+CzXip3rWkiwue8oLml017Y1oOkQfCY9x+Qm4HtWrPG3vcR1mEDbTvvv1OjlSEw3Kfz0UeICfbKnCRve6Oakc/A9DB6PgTxB+yh3zi5AG9qkpzLJMyX/6SOU3xIKjirgBaQqY+JR6r3G7E3QOzTu4R7AkxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEY9Bf3j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBVGITvw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEY9Bf3j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBVGITvw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j2h72628221
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oe6Q+d4qd5woQ6lNUno9ozVZsOZH23epjbmHlD6/cZ0=; b=LEY9Bf3j+++RrSG6
	M365qIbRkGCQn23yiKYfIZoRnpZ7pTQdEFcC2FPOoH9xMxqK+eUsT/RRVNOdMSjF
	PcbaTUaYhecfudW0d7WJHA1E+jGdD29cHSIO/CjHPOwzHjhnSKF0dYjcUIWZtpL9
	tdcOMlprb4IcKRdGTArm2ihdcnsdeZFfmcny2RK7+hdGMnNQGkUN3qFOshAzjPM7
	+rlPBJHBYiuU91msIZFd+D3btFF8/W1jls/3O8cMh092AmHch6zbEBWbN1R24UMo
	11g+WkaFJPmE2NtdOTglQo6j6sCsdBP2tBKkrKfRHqKhF1exO3PUa2lFG3EjZL89
	Euq49g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh59q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so5280555a91.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369308; x=1789974108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oe6Q+d4qd5woQ6lNUno9ozVZsOZH23epjbmHlD6/cZ0=;
        b=MBVGITvwPn/z02juaF61KwSp49raw2cagBL3c04Ctgq2jph6qI1fqxuR88RCP9cFM0
         brtNyCqwEjxWPp2hDFyIVRrAy9aFwUtbtBjKjwWy+t8l0iOUqTtxBGpYguDRxVRZsSt5
         il0YpFS2fiNtMQ3BeJcgS5iEx4ZE/sdtKT+tU7uivHUpkiOo/m+tOZ2MfY27FIoEOGX7
         GKy2OHN1qyQsbFbjjHj4bhA3dpAqdW626zsm7XyuNGny3ChMQ3Tg3D7oP0PMNvoHXLxg
         2ZghHVLCwWgvd0++Ad7E1eJE8faVupoDItvplsqBE5OgMZ9VupBGN7tqCxoW8KQz5Z8U
         oRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369308; x=1789974108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oe6Q+d4qd5woQ6lNUno9ozVZsOZH23epjbmHlD6/cZ0=;
        b=bAChUIQ0LilcEJ8ZyB0pXLgfiEFIsDyGIFoyGbTMJ688kq+PyUYqgtUBlmW2besUzm
         y61EE46x0Dtktpwd9Wkc6VEMBsk+RHBqxt13Mn0lRtHDlQBcoYwgP+1/H+Z5uKo55LgF
         xztvGk4uCVDz3L7ZxOaD9nGu20OgWxy5FfNNXd4vkBbVIHq/zr2OaacHgQRmIj3Q3OkA
         oMziwrxbreUP5Ulbof10VpBojvuNPSCFtghGLlJiPdo04GJsVWUXSy77hG38Q3xIuJVG
         jPnj6dK1ji1x/4WdkgEChaFp3nN/PdCI99KWMJ4BerzIqGZTun5GUxPRVj+Q/cVxGRKU
         ohXw==
X-Forwarded-Encrypted: i=1; AKwUvBxzpeQKcGyZIn1d9SYpBWjzLb/J7KOfqTXhO3N7lS0dmJI5u+5LT++pZ5yETkIBqRwzyPA/PxNZhJNl@vger.kernel.org
X-Gm-Message-State: AFuF++myYoAnfgMuS8h6ZXJhMb6ZG1pY4yhtyzoQtW5p0LzixylGvFDU
	bU/AzVDyXruGnYEk7ieIsL7KYmg7WW7fwU+CMmqdsLGzqgVgAVfyDmBJQiS18j8+E7yc59CIX62
	YbwyKoiw2PcX8O61DoHswws74PgsMdJ/CoC29feUgVuInNOzKV0vTkh1YmJO+izB0
X-Gm-Gg: AYBFou1hTRKu1IzaloOkUASklraniUl6+ZG5fpwdSiu0f/nhMaXt37HtxjUmJUXTily
	O1SIZScAbcCsP51Rb/rtJMxt7IT50aeSisxJ+KWRT7q8GZZZkVkixf16s3DpHgOmlFX6KHeMxmE
	Hr2xDjtVJJ5JmDPNEqp93UW3VQg38zSyk27aRJ/u2+jlbH96vKgdPwn6b/YL5i1W9IHZ8H2Qrnr
	O95hRc+UqUIZ8dtR6nCh35w76SnoyJkW7bnQtoFGMwmypoggBG1AGsLEXUd4AAIA6N7u5KaPYcZ
	aCje822IV6Y+KzC5xKImHKDMLRw2olgfsxle+UWeFH+fI5P5RRv2jXED8gQ7XK681o5X7JdmJHA
	D+De6GeDrzWw9FMKPyKA5iYG+eDvr
X-Received: by 2002:a17:90b:1b01:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39dd5726af1mr6747465a91.32.1789369308303;
        Mon, 14 Sep 2026 00:01:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1b01:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39dd5726af1mr6747404a91.32.1789369307780;
        Mon, 14 Sep 2026 00:01:47 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:47 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:56 +0530
Subject: [PATCH 24/31] arm64: dts: qcom: msm8917: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1224;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=sPo7S0YBGGUWx/tPJNacZpaKi6ZAXl4m+zTdSQEAPHY=;
 b=yMApHYK6VkoZu07zGWWV0jiePt/XaJDSrAFBBIwxW+uXmE/m0WpSjz7XjrrZrbAEn5yiQ2d24
 47bWCHQ3LTlDUB9tRqEdQXyJYTKlX/FHmrhgEAJ8kXVyCaC0C5jg+dm
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: lNIMJIxGHLOgGz4uVqi8leCoPa_e9LDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX6pOWQbC6AI8O
 e2HrKvqrwEHjBPTNIUzBHky9Wd43w/K47pG/gybADEEibH1xFtciCs9iO3poYE66gPped8gjh07
 18T4sIQqWkPUruQrHe/BRZQak8mgMJTXU+KwmxugMJzBl/SfBPyNdENpNEWOOtNFxxSXwEQFx1H
 dj5OtifPTcpoKVtb/iMREJr+2BvEyDVx8CSf5WXbeSqwDf835d0NA4UYU7y3FuNUrFPHvk0UbNP
 Ex9H7wE4Hio+OTuzvYRRBUDwmhE3Et3er/0HJD/dNrW3KNeI0RMaofBlLlZJ1UoHPsfLx3D7Tke
 mJgIxBlJLKwj1UYkA3WVXyLvZ2jjJzFOp6lw0+1FNq3f3xRYSX0RHjgr+LJYscdApZZiiKAo3mB
 ZFNJl5MAR8qK9BahZImn6XFY2avb7MNsPvmJoSyU3JL6Gha84ueaulhvLqKET0X/oKS68tf/6PR
 cwADJou2dLrqp/PDgyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX5hIAc2p64ZT1
 0I+NMoaoL6XbtUCpnTuuKaj17tlpLIdkcMgVhAn4OgiHBRsuQ9m6vtDZdxMR9fo9xcS/lRszSIw
 iVIop0xXEVYERQyuDNyRPEqLEigia0A=
X-Proofpoint-ORIG-GUID: lNIMJIxGHLOgGz4uVqi8leCoPa_e9LDq
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa79bdd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8YB88QTy4cyOp-Bv1CoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update the CPU idle state name to match the low power mode
it describes.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a6376..0bd60f6bd636 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -112,6 +112,7 @@ core3 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l2-pc";
 				arm,psci-suspend-param = <0x41000053>;
 				entry-latency-us = <700>;
 				exit-latency-us = <1000>;
@@ -124,7 +125,7 @@ idle-states {
 
 			cpu_sleep_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "standalone-power-collapse";
+				idle-state-name = "cpu-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <125>;
 				exit-latency-us = <180>;

-- 
2.43.0


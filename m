Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681955;
	b=BJczHIZ4XyTWs2QE/Bp5VEDcKxHMd+lGngaeHnIahKbZpicdW7QNElPlSdOao6Zqb3Rc
	 p6QT9vTMh2kdOFE1aiYo3n3MJ4Z8pTNYHQBXh/VqVfdzjdytxqzf36iGcoanJ3J6ewYGY
	 1PCLVp+1sb4Z2KBgB4s1L1u9BPb8lies8cLh1qSnCy4FpKNzgy77KcYg0GR1N6my40Ldb
	 HS484Xr9FkvhNA2pkGGAmXx+0Sf48R/ukVqHw3ynMpcFKZkPfTOvgh9HJfNOBk9LayP2I
	 3M0mv8B/obrfJ3IsKwAVrxPXcKb+Y8eDFmpSo4pO/4bHsktceo+M5MKubSYzaPHogKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6HRhdUoyZbzGkLk2F3JpCB31n0oAXufUVBdSRNlFGfU=;
	b=e+YCDcgja0uhMQOQkLTMzmI4t4fGf2BxOVNQS5z9BIxNXUBxhqr1PNv9mFpb9ZqJdSmq
	 VBHq8ZYt0qs2nYULmnV63iwPnooXy63O2EIY+NgalwEU095xuR0D4Xw+gsLOHQDASon1w
	 xgHIr6Ym+76G48k4nI8XKeFivFMIKEo9szBDEaiavHXa/v0vpSXrdvfzMQU0cEXgt/Lax
	 iFArJzf+I5B/b3jMvPaNYmHqOSvrmWWbFeoCj3i7kjJ3+ebTMnXHlEtoNys7Mvp5yDCWC
	 Ndz/CTl8QQSKGflGBznL1fRr5CqZvtuw/0wmuxu7xCy1LAGuBMYkHOUUmLpUjT2fHuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FDroeeFz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38774606A31E;
	Thu, 26 Nov 2026 08:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38774606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FDroeeFz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4e61682489;
	Thu, 26 Nov 2026 08:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6HRhdUoyZbzGkLk2F3JpCB31n0oAXufUVBdSRNlFGfU=; b=FDroeeFzqXmG1Gx5
	J/8+MVs9uPt0dguEGtgFn9MkLR/HYbifYJefs0s1PNaeFU98h1A9OAWuoNNmEq5U
	bXf7uS2tsJJgnpL05Dgyg+0/n7tFEMWB7602r8FqOyoHVxRucXp9pnt9jTVtO8pa
	a+Dn5aqcpQk6eVDn3vqM77f2Uy/eG1uaVpqGrSVU+Y9VDBIsk/1Mh/fM90HrVlr2
	y2l/4ysgm8iMe9jnvB3fHiWfkPwlkO4H9i22dArRrSCEzrqP5+G6TJyik0h8wc/o
	EsTgs+g3fizu7t6Xm/iWkvaMKI4gSM05qQCTvXefY4TPaVFlOrVP5eoXAhggqj5i
	nch6PA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aek78q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:27 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8WOXv3850898;
	Thu, 26 Nov 2026 08:32:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AQ8WO5v3850880
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:24 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id 202D4A76; Thu, 26 Nov 2026 14:02:23 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:02:19 +0530
Subject: [PATCH v3 4/7] arm64: defconfig: Enable PCA9685 PWM controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-draco-evk-display-v3-4-6864d09e916f@oss.qualcomm.com>
References: <20261126-draco-evk-display-v3-0-6864d09e916f@oss.qualcomm.com>
In-Reply-To: <20261126-draco-evk-display-v3-0-6864d09e916f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795681943; l=769;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=SNHHJIV+tMKguYCj7SpMkqYZwY1KQSq8CiQDCXHJY8A=;
 b=UEZ4TS7N22se/y8r5hEw3ijjj1v6rTV0M8n5q9imZINzGzoOdiGIqT21gkIK6CP1Rmjw8Ecex
 VlZWg6PdhYDAiNphht8CAaVHMKx4s/X8Z786Ys708Vn+t8iA+GhJTta
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX1snht8q3T+SM
 3pyWO0tqUlQ5mzvJXroV/mE+BrDJhmTjqL5/XDyqXinOjspfzPZYOrwi2F/2nW1gEbtWwBCYMaK
 2bdUUdujxIsH0FM3re5Jl1ocRbFlW05d+1VVdZ3DpuaKi/wJ0L4kJUsFwOw64PqPHJJuwflw4mV
 0QcKV+AolBkZ84VoTQL0euLGBuWdfHyeWa+8L4dWa6itWWZxKqIwa6783VgIL29eUPaEf/USe9m
 /usObbI9DGzkvzFcIEivqH/v6yd0dPipfyDStA+tFHVHtmoLFiXkt/E9aBFvM3Wt4FrYUtpKrpO
 n11vwlU/Og0MpDme71k6Gd80eNuWV2VPZ8Hs9eATvg2hdWQAMqWnghT0eZsjvpPGt1p3lqN3bZK
 7fpM2c2orafjXU/l/rjNw6hYun9jxc9MLgL4WU0Vby2ud11Lb7fw52CrUKvWeWCarzv6EmUYcHN
 y0swvnok+mwpmLjsn1g==
X-Proofpoint-GUID: M_Pgp5evyAymfUW9LXOlYsY6O11GrREd
X-Proofpoint-ORIG-GUID: M_Pgp5evyAymfUW9LXOlYsY6O11GrREd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX+JdQ7/j8Ocop
 vEP5E9D9bCX8QijwdxFP63RMIsUzl01xIAW6PR22jLbxO0b6QQ6ypdEfyREjuE9ydo/RKbTvaZQ
 WIUp3VZ0SQtQT27yjSdYSzhPSuojT+Q=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07ee9b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=qI7vs_IE5eraBV8M_hMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

Enable CONFIG_PWM_PCA9685 as a module to support the NXP PCA9685
16-channel PWM controller used for PWM backlight control on the
Qualcomm Lemans Draco EVK board, as added in
the lemans-draco-evk-lvds-auo,g133han01.dtso overlay.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfc52e32802e..7e381899f3c6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -614,6 +614,7 @@ CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA954x=y
+CONFIG_PWM_PCA9685=m
 CONFIG_I2C_MUX_PINCTRL=m
 CONFIG_I2C_BCM2835=m
 CONFIG_I2C_CADENCE=m

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874018;
	b=YOO1H+3i3R9l8fWhKC+dQfqPsQR92W9xSiVgsF2zpfArj0KtvfBfI5ByHBwPT48KIUEv
	 WfLRadkymsnqa3nuYJBuVJ+6nGyHId/5FY0SycPPjfe0oUz1acSmp4FVvq3OpK4G/kWej
	 JkwQqhaeaRScvtzYuU+wX5YFY9oYpWb1zOehCY8cr/1MxwdwKqygCVLoonwiB4y/xKTjm
	 sIYtJ9EbBG028MtfHWOpAOWrTneYBDy2b5hv74lWuPLoNZwXljzre7jhUFR3kMrnQRW3M
	 QpAcMRm9Zsw6MiJIf+dfj50tcUwlmwFGop3Rf1rh+qAnw0dNipTB+ayoUuEJgpWzxcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8KVmduvNfoFze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=;
	b=Ke5fwIY/dLGdNaiSIQEBijvoaNWb3m+ycXN/ZRMCkKx1HnTDlT1FwDr/pdzMWRflm9uS
	 5zocbtaumUMyJlwyRIpKEP+EFHodTgOJ0426hTe7ZeKu9RS05Hrm1SPcDHz8R4loULiWz
	 G2vjA5Qo8gaSRyngWP6hmalmaJR9wygew7RwlC9+UR4mWrH9kfNepk6DUJwBzE3d6tOMQ
	 Cv0qmLo1pQCkB3LXaQIrFXS3NqAsD86oL+4THR/bfCKQTc3FkEFkT/RKL2MxGZrQ1I4SK
	 zlChW9F1GmsWH6fbRdtsFPckZOLP6GB8XBMlb2M5VNQc+3vOOgZn37XG4qLPfCWtRtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KsPyVLGE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=feIVj6ia;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B607B606EE87
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B607B606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KsPyVLGE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=feIVj6ia
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5A1Q8U1416463
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 10:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8KVmduvNfoF
	ze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=; b=KsPyVLGE8BsXOiEYbjI+81pY2gK
	0T4ptHO7o+8cJcjCv9DFxUFLTupEhZzLoB3C/VYTYtY5fUZV4H6te7pl13A9mPRM
	QhmBBg+/SxvYcnPLXhqPbTLS8rGFuh0ePGXZqJZP99kgEueQ1Uudhiw4XkH5pJH/
	A8WVKRqvVSdRx+P4NNg43KbCRr6FMzwNnPeQ1hbW1nKOMsL9OHrzpxULwMSrCM6p
	s0V8KQfhg9+EuJ2fSlfT2DjLtFyMbDgwPnxKA1KaNda5uNVPj5DQqs8fVjwD/tE7
	i1J8e2QQwgZagY1gwUZJ59UW8BNthy4knGK8tK4nTeNGa4eHRM8MTcDuoig==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd02gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:20:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36cec75d8caso660863eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874016; x=1794478816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KVmduvNfoFze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=;
        b=feIVj6ianq+jmxxVZFS1CIlPM90TiDndE0xF7/otll3BpOvPPsdq54HnE6dUpdctO5
         wWrHS6Zyfoy/VrJI5U1fwqrRHKSfT+11uUJli9ZyTWhmQCmFjVImyHuaF2Nm30kd084u
         yhCTdAwiO0fCv8/Jq9U0CRAtcNUJNIrgQdZJTrCOXqyA1eeKstDEhW+1rfDV2NTADgDt
         vJ2jSNZDIu+9/qlVeyeQAQwQl5zIJHv1NO+mm30R1BrBeNRzYPD7l0+tktzfXVfxHDvu
         6lhriOb3/EGIHbyoFeriT7EYInB63HQ92+E/lks2RVaE9ZsxVYeOuxw/szkooyH8vpn2
         4xOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874016; x=1794478816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8KVmduvNfoFze9aKRAh+crTKFlI8QYI0H/ZEZjdKA/k=;
        b=mQeg3+pgQVK6d/iTCn6/gyIOwC+huNy46w53qfErKssFZBf2wz5aXCbHT8rrG/Ey+V
         QuFcgYV+3Qk+62WinXX5CO02E/0PNPciucZN6e/2R8PCWXkQvywsmD6eNwqhA0tKIk+W
         LDH+585MGOTPXupt6F6IrAFnxs+HZFzeHxDaK9IQeE/IF2U7snf7IIMakKgzWiGE39IO
         B2X9MIAke8dBVWemBXQzn31zqSj23s98Rke4l7XsNqMU51VT/t2+OKrWQBZrfSeF5KDP
         DyK+nGz//1oh3YX8vtRi9sSmOUgIRtJOIWz48GOJTG4sBzi3uLSzQk4aeVki9tH+D/a8
         iwoA==
X-Forwarded-Encrypted: i=1; AKwUvBxk38QxZ8+3G9J3fiam3z5ia0A8bA8JdlxB2jffzRvfJ79vj8RLMvxafaa4OEVBaQGqBmBTHW6fDpAo@vger.kernel.org
X-Gm-Message-State: APuU4Z/khCiM7Zeywqv3aCxk1jxygJ9FAh66Dwy/k2akZesPCmRizb7Q
	KyBuTy0IUZA7zNp+qjCEKol7uNwPmwx36xMXzr2U262JpPe6/aCFBLmeHz6+PNQJpbZPtHs4v7U
	y61RQQj/qTBVucx1cs5KpPHoLOriKeTgd5O6UgflOkfjJA5UrqQNLBatGY6ZaZCSb
X-Gm-Gg: AYBFou22aLO15PZdfE+xE/XxLHIEvuM1KTZgtY+JXLuSn/iAmsxWDBsAPsUMSWtnqHd
	swbiwdVw9RZXcCkvHWS85VeQpxicDUwyXUSpXOcLKadqiUGAkqZyyTW3Nh+nFfZecYsQCTgGdrw
	kwjYwB+FcBVTLXPWAJZ8a4a/B+nwiCnKLGryXSjByOSRg7+x4jwAAe7BO8yTuYm8fa0iiYZBQl3
	T/WOaq7xs8ZIf9IzqcXoG57fcZ1DM0wIWTQr1RDNF4ikuCYA+JXeoAZ9WdQW9VVnf+baGxzX8QF
	iVBXuy9JicLqFPGYrQ9BxNTvgmtxU+bztYKL5i/mo+KkADV8MWPoTCX7Lpzy+UMVOKdxdGLUTwQ
	Kq8i+eYXIGYPkYpNvg04Dh5Gdfzbnkx3Nx6d9p7b3Ni/XyrWQbKnj2EL9p+5EtkJnu71UdBSTOa
	4mNast2k9L
X-Received: by 2002:a05:7301:9c07:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-36de7932f28mr2963299eec.27.1793874015909;
        Thu, 05 Nov 2026 02:20:15 -0800 (PST)
X-Received: by 2002:a05:7301:9c07:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-36de7932f28mr2963254eec.27.1793874015320;
        Thu, 05 Nov 2026 02:20:15 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm14115330eec.9.2026.11.05.02.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:13 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Thu,  5 Nov 2026 15:49:53 +0530
Message-Id: <20261105101955.3732723-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
References: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfXy8OfiWVZrkOr
 VuD723ceS4Z2RWGt9bGWCjgR75WMC4WkLGDlxq3PBnIk4nQkzYH7SsVDe3RSUQQBG49hDc2XqKr
 Sa7i0xGQl97xH9or8rudeB9J4XT21OE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX6LP2RqS7ZULq
 O6e78oYUZ/HEP+nrRiCpX2/0Or30KRlqIbSHzoT7kZHBvOPz0w/fyJSyjlPulugtXOdAybnkD6/
 FrU15PAyiZP9ZVb1RTPcA2y8UK/O2HDP2GjXmAYSal5XR7al8s6w4g4AKnBHYd9M3ficrtnrluO
 zj8Vl+FsjNAFqd21TEBrLgCM3N73S1/n74LKlB3ZhU0iGKJiPsKzfdXZDW+OoJuaH0m/oC/rgcQ
 EVmhuskJtTW6lcmskdnP1nBCacsnh546TuNb8z7GtYQLFloaRujE+VweazG/KqrA+G9lkeCIk+T
 W3vFxuusUXEobjxMAzNv6KiHs9NmGHG0SxIUW9GI1dMEKmBsig7fYLUHu/jhsWF37Pfj2nWsxiH
 wzTTUBUaMPPOyuVOYcINCOdamfVAQOrit8rECvX0Knb7ZdcS6N71E2z5OpoQoBRgztvbYbgwbpv
 2p2ozoavjc2NdsGmI0A==
X-Proofpoint-ORIG-GUID: V3VVXLMzIn1908Dmh5oDMFsEdDtbxSqA
X-Proofpoint-GUID: V3VVXLMzIn1908Dmh5oDMFsEdDtbxSqA
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec5860 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=aGigY-oVRoDAAVteN7sA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050041

The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
and conflicts with SD card operation.

Remove 'supports-cqe' from the SoC device tree to ensure compatibility
with SD cards. Simultaneously, add the property explicitly to the
qcs8300-ride and monaco-monza-som board device tree, as this board uses
the controller in eMMC mode.

This ensures the SoC definition remains generic while enabling features
correctly at the board level.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts      | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 36af1ad2105d..a489932c7b1d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -275,6 +275,7 @@ &sdhc_1 {
 	mmc-hs400-1_8v;
 	mmc-hs400-enhanced-strobe;
 
+	supports-cqe;
 	no-sd;
 	no-sdio;
 	non-removable;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..591ad233f90e 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4843,7 +4843,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
-			supports-cqe;
 			dma-coherent;
 
 			qcom,ice = <&sdhc_ice>;
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index be850a23472f..54770aa7376d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -721,6 +721,7 @@ &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s4a>;
 
+	supports-cqe;
 	non-removable;
 	no-sd;
 	no-sdio;
-- 
2.34.1


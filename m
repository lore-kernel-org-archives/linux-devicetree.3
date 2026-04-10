Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897913E4C7F
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846558; cv=none; b=vB5g/ssxw5d1AS/zK7V9GLJgt9JyOnAwQGzbvAwd1hKGePXU1aJOwygCnFe1Syl6+Yn68DbUGsfbKtwvT0OSOqIP6MCKie3XCOs1grzMKP3uXe6uw3BTIbKsqqFobkejY46UC/rIkfVplHMPBPSZWUNG45NUIBXN/JflpwOy6HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846558; c=relaxed/simple;
	bh=O1tb22jORb/IcveAVBjJMXWs39kyqXjpLAL/TwOhLgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f2Lj05DxoXp9pMgS15VOvijjnt/LU9kn3bJUplzu0wdLWeBPWN2s0Nb5Aax6QIFlS9D9y9MeU1PXGxCTp5ZfDREc/X+hhl1UVU+9BMgeMIQQhjWFRTLCeoWQ4R7GeCYUCXYxy5SJ8cHTu/JzQVZF4PnwT6U9cm7BeLMxw8qLh9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdAda897; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjA7xjfH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdAda897";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjA7xjfH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB1XWH1322678
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PJ+4GjtwPpR
	6n2zHFjz+BYlNplimUVMzPIgIJDqLkr8=; b=gdAda897XkqFCEyGwIGXIMQnJcG
	kDzCT6UWh56qfIhVR3Rw3YMfPLNNX7xxu9ZTH/JurMq2+sPqeMNbVp+ShMUFFMQQ
	WzQ3IUZcvyZVQdNxdAmLmtJYNlw3IHNoQ+DQZ0A346gV4gS8ZkfqYzK1wyfzd7al
	W+9K44zdUl+SKLTBcDbN9zS3r1vRtvy3U9U9md5aazoh80931eWqL0lpYAW4tQBF
	6zOhq6ALAgdzTRU3z6G+nbrpqA+Gui3lVyMwq0n59bQYPVVNPmPyVMZFh0R891PH
	rCAp6VxPRJKDYEpk8+cBG2YXvkaHYMDWSHZ40OUC1as7BQggEDqzjgNAO/Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyyh9ddg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cdf02bce5so1263535b3a.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846556; x=1776451356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ+4GjtwPpR6n2zHFjz+BYlNplimUVMzPIgIJDqLkr8=;
        b=FjA7xjfHVWI1ec4+WFVjICqVqeO5leaoobWnoMJn9TcTsGvJ0aUVVqqZDPEEVmHAZ3
         OKqivMGBywfh/HpnpnMrt0DbcFbNu9rFca3r+zrSVi1uK44CanxHTERU656ydCzqLNpb
         JBSWxS/VAxNBA6FaW5oQF1aeTCtU/T7BceVYLzjJbpvuu+VI7cAo8vGkZnKcZlN1zwmW
         hiSAqru6PkuKIf8NGr+7K+SR0iX/YHbdvkQtmsBdMV+E1nPP5Flx4fC4oW82w0zqmCB9
         pNuYllUeohCWfZSBrYhY5D3Y2cK5tPqabJNhXqnaYIULiLCOoQxqe4kQ+7O8Xcfom05x
         m2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846556; x=1776451356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJ+4GjtwPpR6n2zHFjz+BYlNplimUVMzPIgIJDqLkr8=;
        b=ZEE3pCrfsphEg9OpGrAUcmZuh/NV6Gn+6HJec0WAhiyHZTbgkO5RsFSqMuEo/0Bq2d
         Pv21gIvY83msInBl2uDqK9g8ZXOAWWfyf9/r5dVR04dpNq5XrAt4Ag+wgs3BfbqzQjxH
         VZ0oW6lk3UyJ/oEvlAvsCICEqbdaenfRggkWOUzO827s19zaVX1vCnxLn5ggqETKspxn
         DTSAyeWVL7uKqwtnkw0Q1UaF4P5TJ/dUo7BoR/slDbSCO2BOHPWAJp6Mzu+ozxRXyMbV
         N2C6CYRJEK6vDGgGpCb60daIPOgEqKQ1JbEVvP7Zqs+uY12Oud7fQIml3qpx3d8jS7Gu
         ubrA==
X-Forwarded-Encrypted: i=1; AJvYcCV3PnfD9VqhQsy6sa8bK7p6kCQApoFTERGw4YuGUw1RRgubWm8dboe6JtSBEax0+hcWVHsLgv4Ul0TB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe++ukyP/xde1LWRpaxCVP71R5PU4rNasNANK5YLN97duUd/0s
	lAfWJaBzgX3/eYvTSxVDbNyE7MXeyRYAa28Wwk7y+WM/jpGibzeNmIUwPH71AO9QMCyqOe2KGwG
	R8+93ZCR/4LHd0uwn6AEfgUVBJnDqh79dNMeFfmlvHO8M2SFCOd9juh1hazqFkyqK
X-Gm-Gg: AeBDieufY3QRkwReVHeFHHj8x1TF80ReKHE3tyMdiHfqkU+OiY14bw4Najz3CvjAJxx
	DUJlXWvgiLzCYds+vvKQVb7pG8X7NRcq90cnR08hDr/dyJid6ioaYBztQM3U2r9f40Hxc/1AHTA
	mDoe67x6nEgvCg68e/UW4z9zHudPiAXzgZ73ZCbzyJkRqI5PS+iciXD/4lVeqloYGPmjpCC/r3E
	Xd7EOmzFr37WC1rZdKkjemqNS5kntxPAM8OWQuR3uvpNPZZE/Yazqb2RrTXWVz/9MntVZxFHrGH
	3uoYGf9P8ay0rECv2+KRr2p1g66jsnBM89o0tAB3qALgBdXhIAIQ5Gpb6c+7Jkj5n+VUx+3aJ18
	p284DP1aVJu1PBeOmHKG1FQPr8W4T8OeHcKEyO2Xa471grnSC
X-Received: by 2002:a05:6a00:1896:b0:81f:4566:ccde with SMTP id d2e1a72fcca58-82f0c16a5a3mr5006261b3a.20.1775846555450;
        Fri, 10 Apr 2026 11:42:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:1896:b0:81f:4566:ccde with SMTP id d2e1a72fcca58-82f0c16a5a3mr5006223b3a.20.1775846554832;
        Fri, 10 Apr 2026 11:42:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 08/35] arm64: dts: qcom: sdm670: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:45 +0530
Message-ID: <20260410184124.1068210-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX7vayaclopa+M
 nFjAsaU57U7YCSRfOIW1fL+ViMtGyM9PxOI8g/xfVfU62pnnSszxY300/+rcpGRp5fUdhKJL7jI
 neJVFoRz7ifQIJj1MIefPEyJEo1mj2jKunpO6EYnmiE0EdChyEe7S0CLdG/AK4frcx6HcCSqIF6
 H1LLXMPLjd4lObO5drn0eGlU30oVVF8V8YTvc27x/tyrTJbrMpSWXmQTovnJuCYFPhC3ik0779k
 61kt9TQ+YGzOqzFr8+u1DUIdZt+cV2q6E8MpCplMEgt/5QCSpV8ckfS/sbvAqkwe26OlokbGRrO
 TQeBWC32iRHhqQgDgoDn0s6AahKQSBY9Jid8M1is1MOCtevCIqBCNcFpXguXqofio/3GNdRDrAJ
 84OBzbABM2ldXu4rTg8WbpxsRywYdvni9lmofPzSE0ujn07slOjaaJo5Uwzw5UOLSM9hu649cEa
 GoGN5Wh688hps5ZlYdQ==
X-Proofpoint-GUID: 4iw8JK0bv71JvLPVtzYfuaqNZlVRq2Ea
X-Proofpoint-ORIG-GUID: 4iw8JK0bv71JvLPVtzYfuaqNZlVRq2Ea
X-Authority-Analysis: v=2.4 cv=Wv8b99fv c=1 sm=1 tr=0 ts=69d9449c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 746e9deba526..e4dd1fff7444 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1607,7 +1607,7 @@ usb_1_dwc3: usb@a600000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sdm670-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>, <41 521 7>, <49 529 4>,
 					  <54 534 24>, <79 559 15>, <94 609 15>,
 					  <115 630 7>;
-- 
2.53.0


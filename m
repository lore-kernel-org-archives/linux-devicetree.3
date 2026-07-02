Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C79399002
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977786; cv=none; b=aLU58j9stjGyl/LzZLBlWpwAAhnxFbFRQ+2E5eXbBtGOBmQLNekUGXjN2fUh0HznsO4i7Lll1UdwD4oY90QhgYGz2wo1K+LwLDMX3GykyQ3ScDYRPwmANnu2IU+ty0MHnYSgwIXc7CchNylVqU3zM7GaGqiECDdYvELtZ85/m6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977786; c=relaxed/simple;
	bh=T2wTeTr1gDX9a9Bl2I0Zsyo5TOUnBGDiB8otypBDFNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AW20+yow7Ohb4sqYzk/xzJ8Ez74rf0h+gKnWUbRIh9L0XTD5KUezY5I33me7JOUVzqhhupVuoPTpOjE2Is4VbmYSJYVkSbVWpOwfZl2Ud2OBVvRHs5mxFcHnjNsrAbyOCJLaWhzCyq7H0VqyWZilO5ZoTFO3VbqOIoM8VluEfSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNpHrpR3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SoyhvJgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNpHrpR3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SoyhvJgX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KEVW3050491
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 07:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+OLdMnSvsqCJMNx+xvl5MR4z5xBpBWEMUAEv+Vb2PE=; b=mNpHrpR3p4n55w+V
	EYgXoE+PhGhy1GEIf9kyHyLYTCrFv9U9Hh9txV7PoL6vAQqIMUsbPLQ9k1iwWPKe
	bEYccqvDR3X9Cc9ZGmIPLUd7pv6vb/ZSugTaVLEV8uuH9st+gGvC5rIHvI8fS8C1
	Xkd2LAcaQQenxkHUykSV2RUvpPoLxUZ0uhQ9u6wfQKAaui3yZCP5JLcrSydouGN1
	QVj3x8MK7qlUz6dipiTTitxfTvSrlvOXQU25KenfrqITSHGbp+LCV3zuCNl20fQV
	AsVU5jYV/lyyhpNXEWECJEroLPm7G5etrQ1F6Mv4VhyIpBFKuVrvOO2f1qXnE7Tu
	0z3tJg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gptwmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:36:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca3b3141a6so24291925ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977783; x=1783582583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+OLdMnSvsqCJMNx+xvl5MR4z5xBpBWEMUAEv+Vb2PE=;
        b=SoyhvJgXUyW1RzsRpxl0reI2qb0A9//Z/r1Rl7ETfFZue67qgHAYq+0s5vzqphOinG
         rW6vEp9D4VysZK/0PMVYBLWAZLDbGfWSEiHcugh2F2I+cDlRb/05ktXxmIE/qNemiYut
         hQeScMq8ONNmDIi9U/Y/wWLdO78FZpOnRSCn0BDXJlwVAGQ5zcfl7dl4+2mZH5eAGlk8
         M/MfXPYXbjVdUanCEaoJdLbsrAw/unMJuaG3umy/nTMne1ghea9urx7BWvR03qYPM9FO
         3fqESTNVwua/c3ryf935EBA3tBWoL3UOarg4Gm/NSo2//7SP+X/pkg7RhHBVd2w/uM5B
         GDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977783; x=1783582583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+OLdMnSvsqCJMNx+xvl5MR4z5xBpBWEMUAEv+Vb2PE=;
        b=EWkuUaPDv4ydbC0SrDwfkKYe2NZh5uHS3d4Ww2BbQBc/Es0+sz7fQXZSPEwe74v8Qt
         KwxMnpq7Te+FcE0RvAZ/5l4OGf35zPd7eg+iUZYDE3CfoSkFVyterOaZg6zWNkOlgOt3
         6SHjI85p/msITpr4AAngJaXpZh8goj79LyzO/i2fgBXZrzmK+SG1yP1dt+ZORzqqJ3YM
         8ps32NEw6EzmkDzEuPvxy4jCJbHhMGqVmy9mwjoQ+icFqmlzCma9VdfENgvY7Q5krXmQ
         Ca3CvG6iF5lxyDD0oKf3hog57kELpE6mpi4n/6e96s1wV88YlfhH6R2jeDb2IWWEW+HG
         3KoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpL/lbjN8PoDoVuXUKMU8ZchHz3UovfNTLrcI1NpOSQNEHqVfuvASmoPDbhmvGKOUUOUCR2+gLBLZOV@vger.kernel.org
X-Gm-Message-State: AOJu0YxJMWhRRp6zMrsoBkGI+B0gY59yXwQjpZduyGnw3cadtD9vv/1j
	HFJyxwrz9vVZe7x53yDS3mGwLYtxK51tnIBviFm3BbDgt4Bj4ehzwXk2bxo5GkpziQN5DOYkz62
	1ZZSIAngUf9K5jTQmo2kfgSflQLllGf1hfWcEUTF+ZyNzR2JAzyi7iZKToQMZx0Pq
X-Gm-Gg: AfdE7cmkfweya+LMTMMVhEN8ZOXHkz5sLR/G6gANuCDO/c+rm8jwBzgl+4s26G9z8m1
	xaZ/HGIBfdkVBbLwvUnEqMQ9c+ajCqnEqcRFgTujcG+MtAK5txLs1Jt8n0gQSGR9cV4t5ERZXLw
	rOlgvqJBTbl8C6ogwWcJRaYnRp/GZxe1cAjXSslKAq14g1oYplJkVbIe/zVVxVbrz/YTQ/xW19w
	v/sokGZ8WOkIiPxlXX/TsXUm+iBVXsoLHFJWPDpSHqIfArOmBX0CwXAeGnsUBPMpqCPcpkx2bpc
	VQT4853fuwfVQype8ZBK8N0dA2uOscPYdiBQWVgizwvOPGtDNsvgisks9/M30Xk57MBnbnCcw7y
	y5KTtC2EEgMKXHSXZPG8CRCNCIWrVLaXhLq1/+57vbyWVp+FafsK9C2MvIA==
X-Received: by 2002:a17:902:f688:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2ca7e877452mr60847155ad.35.1782977782936;
        Thu, 02 Jul 2026 00:36:22 -0700 (PDT)
X-Received: by 2002:a17:902:f688:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2ca7e877452mr60846475ad.35.1782977782187;
        Thu, 02 Jul 2026 00:36:22 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:21 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:16 -0700
Subject: [PATCH v7 6/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-6-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977773; l=1686;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=T2wTeTr1gDX9a9Bl2I0Zsyo5TOUnBGDiB8otypBDFNA=;
 b=4TaZisjcKMsrNPge+rvekin150Szqb7OvEjJZaTtrjNWJ8JYKcHTwH73DXpM9guJHpJHdSK5m
 qV3uWtfcF0PAGZnwGdCdHkwI+5+1KUlwDJ88kpUarrn2uoSEpUjg+ht
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX348ugJLCLIqs
 QiseeZtICHhKqQ/yzPwlTDLF+BIcNMs3j8vkRBeZRAiMooW/y7ngzM4jqUE+BXTjv64+w7PEGNG
 yI4NdngnaH/+xe8B2kLkGkMZ/PPHlXY=
X-Proofpoint-GUID: UhXAV34UhoTT2iC0aQ4K4zh3vJXV319L
X-Proofpoint-ORIG-GUID: UhXAV34UhoTT2iC0aQ4K4zh3vJXV319L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX4ByiQKmX+hjc
 KugJYCubIgG6WLqoMwRJOW12uh73cD//2IvJY6wUfx5XqkrgzOZVrRIr1NNvF5ugo4/D/k+cmaq
 U7wBH5/TQJn4q7v4HbT7+Waa1ERAdWAvvrgKrqWvXUkCWA7rdjSvnT+rnjHRQDA1JBMzofCV51g
 Q3hGkQqhDCAYROFnTsDODdxDkTA/AJEOsXgLva+DwUkpTQkZQ34XT76BMTCXhJmYkOd9mNzye0o
 M4WO6gfOG4OoyJPivQFVGpKgsPX0rB0RtoHGTnviyhVJ7y+JjHIch6DE+jfPtcW7RWmIg8kTN4h
 V7yWSkCMnzruL5Xd2SQ/7plfU21p6OCgNRfKNFWQB0dQgjKK+r5Iw2hNWJf40cykK0M03WHhiSi
 LunSQYJhw+sP2gckgLR6qwKPUJRki9umkOZBFTewabjntrspRFR52VM6sb3hdi0C38a4dngx9Jo
 g1PFj1U42DSEqU83tZA==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a4614f7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Sd8Y8_gha8mzdjVg6RYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020075

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..92b929ee3448 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &tlmm {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954453E63A3
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057050; cv=none; b=o/jJHR1MdOhvTZkC6/yrSMchGlyYEpDmw7mtJmCc7FTdxa1ehCoNF5DaDCF88XvcPwE22YzehaqrALo2SBBJJeOhhheqH4XSClqFuhE5pfRR35usY+LwX4INt14vHVzaBCbKqonQAW1U9d/k65XTg0Z0Ey3Bu/J5bmbouFHJAcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057050; c=relaxed/simple;
	bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNna6NRoMB4exD8flLYr5Mb01YMR1LWiCSsdQoLeQaQFgTwQuJifZkTspsTi4bkXbF0tCmIIB3y6gmMez9JJT0x+W0rAFzzHDjl5trV0I5NEifQlEGt+uEFdUl8sAhN00Ms6bBzaS8Rt4fxomoEP3tci6ArzCr4p0Xr0mRuB/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxWxlS4w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJx35SLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxWxlS4w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJx35SLE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6468Zt8a442974
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 08:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=; b=SxWxlS4wS7VPILG1
	kppM8GNiYdadAL+QIRiHTMIJABg17BLCE4Xn02KBeW0twlMRuN4w7mJnJt39pP5N
	vGsww5BigxlqNERBmsMc2tSt5mI1XsEljKa4gtmAwGSSoTZ01Le72xUv9fYqRO3o
	ZVn647DYibPhacWxjOqCdu6LXaDqSt8Q0UWOj0vx1P/D5/gyJNr/P24UOznNPzVw
	jbqjomVQ1lbTVk9ewiJTs4uk7FSzbwfJFKYn9j+BUl3/YKJRmFt5ZQhY6loPlvaT
	ghFodw+BiMyWAd9yFEbCTRQOfr0FwckrFlX1g7LC9S1Ixdo/T6rvnhod2xWsjE1w
	/KSNbA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299g1av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:44:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12df8bc580cso478469c88.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057047; x=1778661847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=iJx35SLE7RMOrRYeP6mV7Brg8FUKvqS7OL4Cb6f6TC3EJlXkNbyfpS1GR9E+k0A+5e
         419zuU2NC4Y4q6pOHdKewbWVptSSAGP8bORjd1zWRMoFcs0pIYJHbm5398k4KQ4zuaq0
         d1N3giR5TjDVACuEZk23XfsKrsJ0iOuiituDcpTjpYza0FK7/S8Xq3U6TL4tC1xpBR91
         seN33osXgFEUiPktp4zhMfPXbM3BDdckLEJfVveDI72wKnNstUjmxHfFcT+Oie5RTddz
         a7gLrXD3WLk/MKRL4uAOnmPBHmYqBomZyYNaUWsCUJH7+i6TncaWMRgMzh/fEKe6QY56
         2Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057047; x=1778661847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=X3gB4K4N2s3iUTFx8jeu0ncoG9UrtRAoKiU+pfuaSUfxxtqRcr+rKh60oiNuyWVU/U
         5rNIm81bAdjZ8AUiiN5px9hb0HjWiu06P9VBiAfzwzEoOMJcANuG3h1iq9Qj+xcxgJXm
         a0WSEcYlnEv2aG75SqoUUph5nToB5J+3OHPBGDmDvyQBFmZFDEx21AbpchyrO7V50BnK
         8G76bORv7nEPUXXWjMth1+wqSKeTok5wZV0zoVgGLQRQceCPmySGxQ/QQtYWRJgWkPE6
         HnzNcwxy2CBxpDAPxC+OphXv0A9q890vYxmBn7sKfQKkZVuD0E+MovCHw2sGxUVJfmsS
         CIRg==
X-Forwarded-Encrypted: i=1; AFNElJ8egl4cQ8XIPq4sOvTDfpTGLNCZNAa7fZH+sK7sBZAqghzy0FJewtWkIoXeCv5UL1BO21NH4oN/3NUx@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwbLmHi+IyuLyvzmmuyRYolmwC0q6cEoCRmHau3CpA/Lg6jTs
	y/XAYJMjSqM8yEeG9wFXP6uRdKEOAKw07zQYyBqIbCbmLYK0Drp5C6kD5nEjztqyjMn3iz+r2Ps
	49GXt+Q0u0pIsbwwNSLls7pJRJUMDW55TM2QdTnYEx4Qvmwd25l2+HA+vTh5u3sUo
X-Gm-Gg: AeBDievvhbgifQkeSXc7q6mB1ZVTRS9Zea0TfBeDiMzCTdVJef2pkaPqBIySqk1y79L
	P5psAy2ooSpQ99oMeVY9MSU8xqpiN8VGRV6tzcggx0GutaMvzHUxLdqrX4o/jizh/z1oI6n6Zx4
	1IJiVNRXDp0cy1jdizEzGPgS3EvFCigGeqZK6oUQqnisjbptB4rcA5Rt/giXxkvTMNPXolpp/yQ
	ipcq0LMeokMbL9EF6hOV5S1cOabqOqLgByQ6ZEIoJhwr/nlm+DUbUJoXhRF/rj2Y59PJZZ/5Z53
	ETYZGRlUp7+bpOJSs83XYTx0Iuf1sFXRXK2jkPro+DEcSuG3PNgPaWUsPW9fpNx2ZxoWjUKVZOc
	TrW8ix3CxAwjqxHyE6Kko/YcQA+P45S+/JGb1EM3vd4BVXl2F081W+BldNVBN72vCYDtEmS0MM9
	yRcvc=
X-Received: by 2002:a05:7022:6622:b0:123:3301:a718 with SMTP id a92af1059eb24-131a771ca3fmr915162c88.1.1778057046564;
        Wed, 06 May 2026 01:44:06 -0700 (PDT)
X-Received: by 2002:a05:7022:6622:b0:123:3301:a718 with SMTP id a92af1059eb24-131a771ca3fmr915153c88.1.1778057046051;
        Wed, 06 May 2026 01:44:06 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13202fbf0efsm2257796c88.13.2026.05.06.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:44:05 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 06 May 2026 01:43:54 -0700
Subject: [PATCH v3 4/4] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-qref_vote_0506-v3-4-5ab71d2e6f16@oss.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
In-Reply-To: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057040; l=1676;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
 b=Vf8Bn68UCpxcj8ofhd/XbsDqSsXtypYZxhuiMZtGUI4F8gukWtodD6DpH/jBxOssPmgO755Wr
 soHheNW0ES0Dyd7wuUK8xd3dwcft7YsKwPj7I7oKFVeTnudjA7a8o0u
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69faff57 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Gcy0W0cHAWauOcWtTx0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: aAOtDDMnvsBn37BSfBsOJ0fbgYubKXWV
X-Proofpoint-GUID: aAOtDDMnvsBn37BSfBsOJ0fbgYubKXWV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NCBTYWx0ZWRfX1ah4HNc0D6fV
 cLN+ecjVU/oZGNlQBpGoU85LphIoQ9LsZ1LZKtW0Nce4gEjUTylEEs0Sv0ZB4LRYREdqYopjxb6
 JXNsQ+qPK+oj2sQV0ny99O6Ju5OgVgGNEppczIJbx7ZvVdYWRIeI7xSukGqm8irVO3oQeYXoyDB
 i9EPDQ93El/U2QYgzlJlQh6/OcWcJuZr5EjAuYYlUAJuLOcteWQx3S0PM8jwhIPYeEUfaqEx/Uc
 WOy7dk1VG01EEN7zcaERyQnLiJWAk0Nkjeb5jfP/72lSeCtD5FYHHr3vKKmU+OLkn9GvgRw3Pg3
 e8LcgnwWByMwEKnmhTqkjTwbwsRBgpXQ0k9nnHKyaJGDSbMtm95P7K+osPo5lraTA6+CQcYWAvt
 5WgWCWSXxtuar7TBc2OeKfTKGum2XEm9lXIMbZK4UJyk8wPE6lQaVhbIg/179ckO4sB82Pro7hL
 2fj3ofjH05ZlJXRPhWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060084

The TCSR clkref clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board:

- vdda-refgen_0p9/1p2: LDOs for the refgen block that generates the
  reference voltage for QREF
- vdda-qrefrx/tx/rpt: LDOs for the QREF receiver, transmitter
  and repeater circuits

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..382398e44296 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -358,6 +358,25 @@ &usb_1 {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-refgen-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen-1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in1>;
 };

-- 
2.34.1


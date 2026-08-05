Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0DD47AF6B
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948521; cv=none; b=Nl0teA5tKvyoT+4MFq1XDZQ0/kzjN6BSJ00Tz5ehcE7fLkcw05hvgnkdOKww58e8GMHvBY1lQ7q6tsgem4YYicC+FIYLRRw5h2fioH5EYL70QRfPUvsv7K9+Fk6AddD6/EH99l6eSAGevkYnLR/wFTzaTC2qeyDtGC0xjB7V+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948521; c=relaxed/simple;
	bh=5LFJ/WzAU679fvIbWxxG7760pWZiholE8FfQ8FqOhqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ce/OGE1KROv5BK8XEx9hXAGwH8Rpd69+ZHlsNI3Wt8fl4+v/V6nsaTjMGXbHV/5+xq39GLyOJVMfvA13q/fWGWU0ZUaWGJklyKjR2h3to2Mn5OxV2E5JcIF5iFQJpxiYEDyQC4IHR5OY+shMEp/2NtlZRkyNVnroM//ofrAS1lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h41UXSPn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIv3vqbP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h41UXSPn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIv3vqbP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FVbCZ3071225
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 16:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdhP7B1RyO9P+PSnx2BryT28tlmUerchf5OyzQtnMRM=; b=h41UXSPnm2tl4MrN
	khD63jtepzgzGfxcprPxTfpsEhrCh9JkgO7Fy2wW58u4wlAi8duTFABP1oiB6iEZ
	BS0SKcO7M3a9xn2xyqQqcRZOtgiVDIG3pwP8q//hPZHQIRehLEpfoLlVtcyBWKPH
	WWoBAXsxXV4o5lTYpWxCcMdtD+6Jcxd0UC3oxSn7Zo+L80sTRN8d4+/sq1eVJbXx
	wpHlMwzwb+Ug1H60TroqbtVKWbvgK5Q37nO15O8mn8tVOietHPVqeSEhZN77eSS+
	+0lEvrn3FnkMO3Ho8fe0CMZyJVR8YbKkLcb4nazxYDsIDvqkTeCuiAnquFMyaeS2
	NAf5CA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv1qga8ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 16:48:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfca8558d2so16773945ad.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 09:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785948519; x=1786553319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdhP7B1RyO9P+PSnx2BryT28tlmUerchf5OyzQtnMRM=;
        b=AIv3vqbPKPlJFMnzaHTvU+pgQN+xUK1OPWBGIjCsYPRHNs4WFrpS4HTa3NgyEpSCEP
         ZUPUyV8EoK9oyjwMEE0LlIvG+a3SYq5e0mfgm8kvBiHRrblfd7VxCSoAyzMRSFyBjuvh
         fLfTghZv+FE1Bx0t7eFLQzq8MMElwzgHH3Yzo3W1RnlE6BmJnLt896mC84WDgysajTEZ
         xERQ2EJ2N1xoDV8Q/N/d+I7zzCeLBFb2kuX5aCBE4XpaPTjE+4xRkjOXP95Pj7h6mFBQ
         P4m3G4IDIyCJkXLB51AEcZbtP5jKPfKIopTON0Cfkrp2EykZNvulVa4tAZGFXaZsjxWx
         iwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948519; x=1786553319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdhP7B1RyO9P+PSnx2BryT28tlmUerchf5OyzQtnMRM=;
        b=hh4lJg6Ue7Ox9Q0gLNTVlIxqYiNAncPda3G3eMpd6q4y7aqcH4JrtNWwRW1YovhAh8
         Z58fmPcM1lgdLDLTT7AOsEZZ9a3hfrmbAMTPId0CLYkD6cmkY8v1ZihzyUsw5VNbIZVu
         D2a9VlgiMVI8h5+zLNaPKR1+yVEeW8R0k9aXZgX/asbd64ZQ4IgWLc35Uzl28sOJzGmK
         /ygFyJu/FycHmwSVA95x2YNgVX7bbFOcSdgsSUtRpfyiKsjVRuPuh6yCxrlXsx3BN15c
         wBUn+1gXQcz4pum5e9TRQLtVo9hpSXaDiaHZnZTtzz0w2QYsG1SpCgS9uR8rSnbW286N
         DKMw==
X-Forwarded-Encrypted: i=1; AHgh+RrIxtffVWGErgSQHorq8KwMvmgbmJMZ5X3MMxjrF2AwYLgNjihxSSw6FYrHvgZVormRIX10LY/I3nFg@vger.kernel.org
X-Gm-Message-State: AOJu0YyhoeAT7V/plLk066Ibhp0xtd/tqpUPYTDvEKI+hiD/kU+0FlPd
	Jn9CyyRLXCUHFDknwP8vh8fKyQnHI3JMuDXr7v5ObozYtLHw6mNa/Qahd25PybxIjPLNOg/aoxG
	IK2IRkYkpYcD6EAphyVm0M+yodUU2SG3zWv91Ex1jiuB4ohHVRPV5Poa4LWJFelsq
X-Gm-Gg: AR+sD10YwvybJaFZ1M7k2CPNTqnFA4Tm+QQZjbYAhT8mtpMwYLNly469IQo84uJwADx
	5Lj6Nc8fWOHvtI7ZsjVGx0RyA7XivBbQD0apTtEsmS9a9TlSdLgp46bgBp+7bzFaHtbsqFjM2+s
	QPLyeamDsmicPUQmvZAt4Oai9c5KgnPiBiTtddCa2ULyJ21xMy71ikowimxpAQzODADo3fQqbdl
	pEFY9zAyVvP8nwH4YcnW3HuppZHTuDM2tOrCR5XbJfk7E/FeWcRcm/ifWiHlHCSQwWZzsYmp6pQ
	urq/ST3IFmJfgdKdKwA5rppynUDOSG3dO4u6+4HHvSkTQknRlhhdEZQ6gbADgCbPRWe29AlcXtu
	cPeFYj26VmkL/aQFHsFZF6pGHPbtP+Wk=
X-Received: by 2002:a17:902:f78d:b0:2cf:9344:b80c with SMTP id d9443c01a7336-2d0caa031damr96632555ad.18.1785948518483;
        Wed, 05 Aug 2026 09:48:38 -0700 (PDT)
X-Received: by 2002:a17:902:f78d:b0:2cf:9344:b80c with SMTP id d9443c01a7336-2d0caa031damr96631635ad.18.1785948517832;
        Wed, 05 Aug 2026 09:48:37 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d986fsm19159465ad.75.2026.08.05.09.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:48:37 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 22:17:13 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom,qcs8300-gcc: Add TSCSS clocks
 and resets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-qcs8300-tsc-clks-v1-1-e7a5101ed479@oss.qualcomm.com>
References: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
In-Reply-To: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=I+hVgtgg c=1 sm=1 tr=0 ts=6a736967 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=66EydcdwdGgFu5TxQx0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 5Ox1o9sebUyv54gMxxX3qJwqNYNufHoG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfX8CBfm8Y2XBLD
 fsMn+jgAM2B8EHSMzb4O6jMaDjyRmCxj8UEGzD7DRhZJq4bEFT6eE/um93aPnqGFSIfqGF367wx
 YNoPncZdwLECzK2jfE2rabVk10VuFaG9VEdZBDXPECCbRnucusW8wOv1O5WmK9b/n22yc6tUNK4
 u+2kYsOtd0Jo6dhC6vIJwi5fgr4D606gxcF84fnAQB2b/uipWZntApTSOLfdFJfdmIr69p7Zip7
 4ZjiIAt18+zQ1F5FOZqZXBV4eetTBZxHOxZF2J9k/Og/zXoGDQJjvGQrRgsbI7l0ZW2ZKLs+cq9
 6yriJD516B5vJ07HM5ehqC8BhP9e+jrxVM6UmGInV8yvWfDxALhoXmXv/8mC1CX1cBZuS098mWo
 /Qt5o4APFnamElol9l+lDOb6GD2lSM2J6SVQfV5hW8dM+X8uLe54qAZGgJd2oULeGvLqFE+Eaic
 YNerJMLqjdKIz9BcuPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfX6qdGn/cruCIV
 RRtB5Xw4doBuTATiaVaoS4p8lLK0fH/+LP27g+14vPtv7wJ+6lkWfXvGUoxC6oN2YL6SivUdziq
 ZL+BlLhaRnL4b+rNX1o9+jCWhojLRtE=
X-Proofpoint-GUID: 5Ox1o9sebUyv54gMxxX3qJwqNYNufHoG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050137

Add the missing GCC TSCSS clocks and reset IDs that are required for the
Timestamp Counter Subsystem (TSCSS) functionality on Qualcomm QCS8300 SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,qcs8300-gcc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,qcs8300-gcc.h b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
index a0083b1d212692825251d6a49e15b9129c1eb1b0..3c674c7baaba91815b13450e647b41053bd7330d 100644
--- a/include/dt-bindings/clock/qcom,qcs8300-gcc.h
+++ b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
@@ -191,6 +191,11 @@
 #define GCC_VIDEO_AXI0_CLK					181
 #define GCC_VIDEO_AXI1_CLK					182
 #define GCC_VIDEO_XO_CLK					183
+#define GCC_GPLL5						184
+#define GCC_TSCSS_AHB_CLK					185
+#define GCC_TSCSS_CNTR_CLK_SRC					186
+#define GCC_TSCSS_ETU_CLK					187
+#define GCC_TSCSS_GLOBAL_CNTR_CLK				188
 
 /* GCC power domains */
 #define GCC_EMAC0_GDSC						0
@@ -230,5 +235,6 @@
 #define GCC_VIDEO_BCR						26
 #define GCC_VIDEO_AXI0_CLK_ARES					27
 #define GCC_VIDEO_AXI1_CLK_ARES					28
+#define GCC_TSCSS_BCR						29
 
 #endif

-- 
2.34.1


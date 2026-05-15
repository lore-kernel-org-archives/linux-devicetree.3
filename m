Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800E247279E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842001; cv=none; b=l6goE9YpIFASXi8fy/cin3Jq1j85yWto4hdUHy/g0D82Mijd8dWKIjmw+0Z97E6wTQGstZyFxIf9eonVFVkQvgmXlKt0dQHWJxDJ3dCxGJJ/54+fMeKAQQRBe0xTz6NkBIF8hxLItOPhkONJjBH0oQp/Z5corLkJxmUVql4vsNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842001; c=relaxed/simple;
	bh=yUPwZ7nx3sItMNqsXllva4yHZXEPbYL/YigcpkHAKIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/Lo7gejSn9tJw1fM8Sg6WO9O4J6iVTbNStfDjtkDdKs6q7xbsc7t2tiitl67d3XrIJoKrYXJBcAM/brTsrmigOUDTHSofIADIkegV25DZNTp2dIsZnd0aUx1bNI+46GvdKSbCTwLaoe3BZbPEzbzlP91NwrnhiL68APos95Nhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K715b/JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyMalq1A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K715b/JH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyMalq1A"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5YmG53795642
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uyod1xcUrYgx9CzChaNG2Brzec+ACoqmFiT1FPPZGdI=; b=K715b/JHzQf8iLxU
	/FVLy+ixGyjQ/202GPMRJE+FOp1u3dd8z1FodM/gNDLTFXH3GfB3tyjomiMHLmMz
	je8Wrjtt24ZnTMoYxZZe7mzL5KFS0zr4eEStLLBU624XPZcrEB4f0USI7686PRWs
	q8Q2yGKoH/bYlRtIhPhKt68lDFG6x+MpBSUIoXEfbZ4xmzysjSr5wmRMsFxnAr/V
	e2dZVz+n2MnZb6/pFxoQ46uEjGDMjtyy7mySo6xdwoBCIAvASlAPAyiVDJ4Me+cZ
	eg6XhBuuoIY9mpjZpkYJEqy7RenXqWFRijJUJUwcHL3S8AvFWXQMhEEIMxSFfLvu
	1tgo3Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1sturt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:46:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so68170675ad.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841998; x=1779446798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyod1xcUrYgx9CzChaNG2Brzec+ACoqmFiT1FPPZGdI=;
        b=QyMalq1AhRaPFVnRWBd81HkLyeN0sEjarb1PbLwqgyGX2bG8AEebfp7FuXl+BBjFqz
         2LyerQnzlobHEzBQVTZM/ED5JaV1OZBOpEDza3ixhFM9qr8yUnEI0sjQM2sK+8ikBHEN
         90S9I7QFZMqqZspX4p14U27DTpbqD6I/y6xZ5j6frg8PEziqA+P2+V5LItQ5YooHyfSE
         EsIWQle04g0o8SeRyrKPcBvtJKC6CtYPKpfhs9uV/Ctpu0MBxq5F+SYHNsUqwtBvPntr
         CoKv0YR24QfdCLgLuFBLbRpdMCo5bw02GMmXED9IU+jGHpF86jJIogACxjSrL0d8Z687
         g1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841998; x=1779446798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uyod1xcUrYgx9CzChaNG2Brzec+ACoqmFiT1FPPZGdI=;
        b=CPz6eZBb5VHjItBmpw2KI8LNkXRrD0CNf+DAbivlvcgfKHNuXJQdny+X3iNF9Eq47P
         N+DpqQc4OeZT+F+ZSHbGcovDI9Y1eMfWMlpDkr+ex3kJ2haWSh5FsDdtXcPPC9GQig69
         fVCzq4jOKHm+/97rfL5jUqeqM0u04Y/V4ZmFnpDPn2brJHaL5+TPhevazZoziHPtSaDp
         xYE2MkeuFq9URaKM+hvvHFCITEHsNg8Bxks9o7bIEa+7VdqYkgdcqckZVbn8KEvNVtBb
         D0QcVj2tsQvsXu0B3I96jrQQwv8yKmlCG8Q84dK21pmeG+4NxfHF3lJ233UBfGW1TuS6
         OCDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OjaOnvR4sJw5OpP32ym4Ae3qjbDM9t2jedWgJEZCG1/gvjV5jMHm0hgRHXr5jGcoB00Q3aTf1m4RX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmq0ZjNJRS79GbgQCr/yVRioPeruSwsxqLyQzoUjWD9Vd9rmb8
	Fx9B/9vn/4Kg+YN3t57qxhV1GrxJZt/BAatpIU1h8IykcfDx8zPA3gUzLpm87k9BBAlEWOwwp2j
	9Nki3FwQbXtfICRM53ki1x+PLFY34qaaeJyT+PFP1VLoKpKj/rr2g7KlPXjrdJoQD
X-Gm-Gg: Acq92OHJclX8jh0wPrESg5d1T/8Nbcw1Wz+9+r9rE0i51NHbDaszBavOw03gpqcXHdA
	t7pH9//3DNmeGwLJiKsgHIQ/6gH6Prs2PzFbGPYq41/u85eymMvzEL8xKqnTQBHrWNAUoS1t0y1
	sFadOH1gX520zIaK2ekrBw6MfQ5AwSBaG61MP4Z07vMrZ0hMxL0tL560ADo7vhkCT+FhioSJw4u
	qUQp275WO5j1yE/TWIgshtvcZxzq/QIowviiJQ+05ksq7cP7Kh2M0F1PueGLbEEUerD0wV1qSKm
	m91BxQnj/eC5Zs7bqYNRIp8SehAN9j6a0p525zGNKpXfR6wGV7WuWk2AAKI5wo/ufylqYQysmPF
	MF6oeFLtHaOHVvwNlAapRggw4fbsLGHkak+wzWKSgRF/veUUWkI9A7zE=
X-Received: by 2002:a17:902:e352:b0:2b0:bebb:1081 with SMTP id d9443c01a7336-2bd7e8fdd29mr24875775ad.28.1778841998457;
        Fri, 15 May 2026 03:46:38 -0700 (PDT)
X-Received: by 2002:a17:902:e352:b0:2b0:bebb:1081 with SMTP id d9443c01a7336-2bd7e8fdd29mr24875505ad.28.1778841998028;
        Fri, 15 May 2026 03:46:38 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm55839755ad.13.2026.05.15.03.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:46:37 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:16:04 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: shikra: Enable ice support for
 SDHC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-shikra_ice_ufs-v2-2-2724a54339db@oss.qualcomm.com>
References: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX/OMB1cf9VgiY
 TmoZesHN/AJZkNJ+tUj+IO5g26V5ID6eNO66kGXTTj9jYfwEzxuy3+z4QRhnkajMho2+uE0ME0f
 Z4J4m8filU2/nHLnocukfxfOlyeEUnnnsczWXJCl1pI7hQpMOxCh3U2InbOqTTJwT5wtJZpwjkd
 99ma3kWj0B6J68m1IzAUKQkKrJIeQ7bsgskXnpVvJ6q2tfRpKRAjwP7HcLwQy4sbG/gerkaj6Zu
 7NKDLvEcm0yu6IQ8MliZbU46XDhdUgktPVFWUuctuGZpYDSlcO3zMaeiC/giTfMJqQlXcvLE66y
 06n7y12fg8QYsUeJnlUnPjziqadWCZ1tPNcaww106dG4QLZtOXeB4J/tCuu6CiXIONxT+7I0Okx
 FINfHXZbpquPDJIYqRMAY176/crwTr02OQIvEsuqQ4EmDT0ru1ffscKa5cwylQbNmaGRaAFHbTo
 /kdUHJb/gOwGKeN8Dmg==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06f98f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Fg_DINg97nz2W6SJEv8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: crX3yB2dhExDEjUhxL1FjZM1jpy9sMQP
X-Proofpoint-ORIG-GUID: crX3yB2dhExDEjUhxL1FjZM1jpy9sMQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109

Add Inline Crypto Engine (ICE) node for Shikra and connect it to the
SDHC controller via qcom,ice phandle. This allows the SDHC controller to
use hardware inline encryption.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 262c488add1e..0b988dd607df 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -641,6 +641,7 @@ &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 			mmc-hs400-enhanced-strobe;
 
 			resets = <&gcc GCC_SDCC1_BCR>;
+			qcom,ice = <&sdhc_ice>;
 
 			status = "disabled";
 
@@ -663,6 +664,17 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@4748000 {
+			compatible = "qcom,shikra-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x04748000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmpd RPMHPD_CX>;
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1


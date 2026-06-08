Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEA333859A
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 04:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780892229; cv=none; b=bsMrUlo6Ud855Dw/HNBEMjm4ExVEwstYdy7rfDivglgFYw3hdiMmk9K/FtayT7CMdAZ+cK7J11bfCZiVWjtvIVkjP6T8+8BiZMMgwkr7292qO7HVcPBzyzsRx2r6keVd8Bna4ceKfh8wJ1BbG/DfBwjHEL+7QVe1MEGdZLIPFeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780892229; c=relaxed/simple;
	bh=MCcqXNt2n0euHaDJc19sj/EY2WjrYERxojbBmZwrnz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JHxDZGgyj6DN7T25ga+eXrvgLLF60z8ylVbpoDJR8Ed49kZ5e4tK8S4hB9tyfjQHmrycbflULoshb1AXROWckRtQD7tk24L/4JMQvtchJ9CrwggJzGgLTNyStMLWQkWAXeiLoBU3xfRu2FOifYtMXPdpkH/TwQ69YfzYQtsrXOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HuQV3Msk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFJZA6MT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HuQV3Msk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFJZA6MT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580FQN12023487
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 04:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ItE2f5PKRt8
	N96ODMu49l60SVUvyhZLe22byazxGBMQ=; b=HuQV3Msk7oWEXoJWZSFq2Zn+vgF
	4lrQk6Cr08ZyI2ADtt3eS2SuhRM53fFebdWlR5xp7OEeVsbQm2hrQ1q9LlyZZCVT
	RYrHfDiVw6lSo13TuMHVubh8BEVAOwLwhOgLbhyvAYixcI46Dy2k+UxrwvQJjon1
	gYv4vmEedMPVKc8Qxr5xdAoSzM3Vz5vz3HJHR/L1bKWbk8+D9fVgTvPMXExbe41h
	WQiaQK4VbiRzjwSnt3CrT5exD1mfpM4etOC0WBDOk5OVoK8zH+QUtuEzl7Fd+vMk
	0IzPUChiP0qCHgvPRobgUpj5zhw1DMOZBxYUm1PlVbvolEsm0tEUgME6Q2w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrdtkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:17:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0bf6904a6so53739625ad.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780892225; x=1781497025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItE2f5PKRt8N96ODMu49l60SVUvyhZLe22byazxGBMQ=;
        b=HFJZA6MT12akI2XX4Mal0CjqMeKw/St3jsE2PM6fS4pVQr6tCiFQM3PW0sqJNJTIM2
         HXOM6izlpG8/CFwvHW8giPzD7PBaXNkpKDFsq6ESEG1sOnE/K3Et2uxJINmMJTKpqcnr
         pI7BrGPfcvnfDndhTxzDwJvWkLL5LH4ddvHqCpPwmIEqWMSUtI/5JSNxxt+8Le/5tYGN
         LUY1OkMlJzvDU9edJ5fjv+vY3X8VUaQTEbOJcrx6JsaLm/jXBQpLwIf3DaddD/1K6d7i
         caV6S7ivR/nRXN3bYVMZK6rueG3rHLS0BkvWIuY27D/vn9GziIZo/uAwS1OW5ss0SCKm
         hUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780892225; x=1781497025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ItE2f5PKRt8N96ODMu49l60SVUvyhZLe22byazxGBMQ=;
        b=aimIgS4KC3cGxxcWZRNPlFwHT83nY/e84mMHDCGTZsTQc1IA5ToM0t/rqwLpk65+2D
         UTk3bMpBDnbTJsVQwb81gzIzQXuFPIEfMC0JPD+4ogwjtVnE6m2mJReSadMtNFzvAAIa
         NJjmIn2XwLWKjx2PMK+nTc9XCxXkklChxassYmu2SQKZDG6HwrPW/4nVB5Gj4Uj0l8n0
         YiV0T/PwIxcmoUmmE3UyP/i+jxeR4bbqpPHSVSJIuEzFl6nbyLQMIDnciOjYiUr5KDAO
         SjIor2fQDAcfjczWVMoM1EA2Unn6zk4NI9nCk4w7kjqN0i5HNRG/qZg1IMjj+ZxromUO
         Bwrg==
X-Forwarded-Encrypted: i=1; AFNElJ8OIKg6ScaLGrCwU/KUxBF5+0Tw6akCH9VtWA9Jtrv8qzqlLyWugPCiXwHhQv0us8J94cDp7GBlFDkq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2tztrOz5lJuhxDpzfaj/ePt0biBt74sX4dTAlT3ssmTCi65D
	gcNLPvwIdSceCtXzqG/cPzn/hdDfDVlq9B7010lCQL9w8oYfthclkMCXgXh0T9XZ+Vh3ciyCdCA
	Lbb/xiDXugbEKVTvixZXebMO4QxJYoUj6uDrfL3vx3fGQYC7VHVUmeHO5zCL2O8vV8yetAhxZ
X-Gm-Gg: Acq92OGA6T2fwC0SGLK8OT5IPZWjZ7LbMhaGR/QhUTtNWaaGyTXqls4V1vYiF5vNSu+
	Q1qhTvvewxFpW7CMdqPXlncQY0NUlGHtgJ/DURbJLo0PRoLyPZq9gq097SsyXveepLMy6WPPef3
	4wwBYPyWn3QxM7cUHJYV7r0H7QSxI3zd0NKlg0v6T8oTFwwNZFfHU8AY+Au2IEwNzKcLBt6HR3o
	/qBSnt1WfxSFtKjNBvPOStc+DX9j0DK7hZ8EQsMavGmPTWhGnC/8G/E+7W3SQYPqG4g/OMiNKqi
	vaN/68grJJcaXbLAqs5UZ05S5+/xW2iwemgWMo4gHNcEqPonXupn2GjaECHBhJQheIrjAf/trnt
	+ZcHQE6DfHDrI2hie9HRvb4Z942qyLZvqqN/WidHyQd7TEsh/2516eD89BIqS8mQ=
X-Received: by 2002:a17:902:fc46:b0:2bf:2188:a90f with SMTP id d9443c01a7336-2c1e85c5ae8mr150540125ad.32.1780892225335;
        Sun, 07 Jun 2026 21:17:05 -0700 (PDT)
X-Received: by 2002:a17:902:fc46:b0:2bf:2188:a90f with SMTP id d9443c01a7336-2c1e85c5ae8mr150539765ad.32.1780892224909;
        Sun, 07 Jun 2026 21:17:04 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649fcdfsm209392525ad.78.2026.06.07.21.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 21:17:04 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraj.soni@oss.qualcomm.com,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v7 2/3] arm64: dts: qcom: kodiak: enable the inline crypto engine for SDHC
Date: Mon,  8 Jun 2026 09:46:49 +0530
Message-Id: <20260608041650.541502-3-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
References: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzNCBTYWx0ZWRfX+0FNMoAe8UMb
 Z8xjl8SPzQCcQr4iZ4XaycbXfu8yDRvdex29tcLM7j9KzlNyW8j2rEUGOs9gA1a21yxcDIzv0O3
 /iU70rxUKpxuIY3aIK18e4W6dOQ1AX1e8+j6OtmUR+dodfhM5/Kf7+nHrp3dRS+6pJ90X4L33dB
 Vl77wWOHbnWAlbJTJbxnNRX8CoPhqI1t/dU4ly6LMZu5/WWBCVpz2PR7kMOJFiHlwAnlhmFYq/r
 JWK8TSWQK95P2Carn+5LKQXPU3sQmGR6OYg+GzaROARr/Eqo1kS++H+XAkjmxR9wPKT4P9e/YU1
 yQrFnSxDqCdXt3MlXSnvYLl6lhiN7kTNrpfXR9Vg3QKuB+kixa8SY22Lhk+dpyK0ir4Rm0/g/Ch
 0wq/dfQTDoeuIGbvQWi7gyc5VqJ55rmeKdLZ86qg7blLa1e7uEUiEjewipsdnpAyDCIrhaQsnX1
 QgLtPJBCW5NGO4+MefA==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a264242 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CUYPcHLqniwTzHo6yF8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 6gG7TIh3Q9Lm46WaA1pMomm5TvSPSfGj
X-Proofpoint-ORIG-GUID: 6gG7TIh3Q9Lm46WaA1pMomm5TvSPSfGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080034

Add an ICE node to kodiak SoC description and enable it by adding a
phandle to the SDHC node.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260310113557.348502-3-neeraj.soni@oss.qualcomm.com
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..caf4ec9cf9fc 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1050,6 +1050,8 @@ sdhc_1: mmc@7c4000 {
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
 
+			qcom,ice = <&sdhc_ice>;
+
 			mmc-ddr-1_8v;
 			mmc-hs200-1_8v;
 			mmc-hs400-1_8v;
@@ -1076,6 +1078,13 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@7c8000 {
+			compatible = "qcom,sc7280-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x007c8000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+		};
+
 		gpi_dma0: dma-controller@900000 {
 			#dma-cells = <3>;
 			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AB942CAF4
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341118; cv=none; b=lvWHeMzZ6yYTwlGl22e8pYNqhdHKrdyEyBz/yDBR3awXDuEMuG01xqVdKqyzeoipAb4uP761OSNXh44Lj9SnJR73ke7RCHYHQuu1dP24Eq3iBMIsdPcAOtptPmgQRSJvF6Hh4SC4OMP15eSwN0kKLZfqHvTq5caCQxqyEQYhTy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341118; c=relaxed/simple;
	bh=1XYwDRGVJPSrDbmhaPWd3Agn7+i5qwXTVHRjNgb7CHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PtHM4B+1eReQ+1D4upkb3Yw9E1USCe8ouokETNcPCJJ+kwYVp/3eGSScCgfl4170EIepWkXq8a4E3pJARfWxpO3nrCBzJ7Msw/xjb2Cl5/3vSo76upMmVRZbN0vNilFcjcXmQAUjoJgC4HqoxsgFuY9+6L3R0wJOXlCL6EsPtjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQsvuEzR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHELHH2c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQsvuEzR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHELHH2c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOVX238924
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTZ2SH3u+rNbOJjVHcn+c0PRrIb97kDFe5LXVZxXChc=; b=iQsvuEzRtpp2hTG4
	+qACd6HKuA8SDVCnBrJeSaFAyI7tGAdHGIRtx1dlyvY1cmlsm4w1gowlh3x/47XB
	u+TlgPVv/xarJEiNZIjQgoEv5UL45qeGhcIy7qAXKGd96Htfo8n0KBFwhYZAA2NN
	XTW6RV0ykY39ntTQNJiQ88fMNlaQ9gxEZfc5mVAEkFruiZQ11gjRBjJNN6NQrANL
	uNDnvnQl6WrDeNplgF4z6T/Eqf6+1UHow0RMDyioesPcvmWNx1kYoThck9ih9i/g
	0Ak1s5gSaRsN7J7YmAqaAeJFZPIDfj/X+Hj2Kz6kUz3tVcV8SJxvOngJIN6svZ/A
	zZgz0A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88xf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:31:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-739451feb61so3042249137.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341113; x=1783945913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTZ2SH3u+rNbOJjVHcn+c0PRrIb97kDFe5LXVZxXChc=;
        b=FHELHH2cUJT3oChmSMSCwsaoMEOZeXs+CI3tmsWXFNhwdq0OVhj6PCYO+XLkdHYKoG
         gJcpOsXi6hN5Dx+z9/xmDnBMpEXG9ODtTKbxv3rqTmWL3lOYvTvdh0Zp2CZfPt+pIzV+
         4ad/AnvVa4kkJkN/5yCOobrtktIK5MrIoebu8Q1G7lywkGlEZ92iVUJOXWG5q+br0PXH
         +gEE7LmWClto97FgS3hcm17GQ7Vp2uRDhke5gOXh53AvNZTu8ukP2K5KPWI/Lt8bDJk3
         2YC+6mSBVeatd26MdRpmTa61NIQa43v23VeT2ei3nRC2a6udey8rox6ViQY82lo3oM3P
         vhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341113; x=1783945913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTZ2SH3u+rNbOJjVHcn+c0PRrIb97kDFe5LXVZxXChc=;
        b=KIrtbl9pz/LbIo6miuCt2/4Wbvp74x8epwrEdOOMar/+NfhUke1vPUCvIL6J7FOrhT
         ua9Hktih+D3FmEv1u4hLLGwMICrpOx7ae367+VRsE6/iEEKyepm9Y8liCeZNjeRVlGTl
         BLXej1VFig3HPQptMnELqB5ny8hKw/Opc3tXxZmR2eAp6se4hD621RbjZB2ZfrlW9p+r
         zNuwClHsS85B60rln4Qm44tkMaLhlP1d+yZY6BNqsu78cgsXwZhpdHBOr6wZ413xOxew
         bTceixkZNuPP4rrsKvT0oTE4KvqWwdl1mbyS8QIiEOXdOHsbY5QI64nob12xvvfPvFNT
         4laQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJ9tqi43nNb45pVLRcWsi67MgDw1gWpH1d3ViNGgljPpVFLafHRfljeEUi10i+tRxm8VNQevXkwSZ0@vger.kernel.org
X-Gm-Message-State: AOJu0YyhQx/s+kMesnSNAgG6tLAqbvtCeKYUfhYvTsSnK5DaQiM7tXCT
	m62NCrOOc9fPbcpwNvwbiLyb4whEg2Ca1cyAJ03/rohsMC1A+9F7fg6ApFBXCOyTHeyIy21yNkJ
	Lzmx6X0tx6XxZCqRswChaDyTEsLzB6bByrpUIUuLgJ65G0pwMcKKa/wC/W49OyG4=
X-Gm-Gg: AfdE7ckGquMgGj9HCRGUatvLEy5zeE+TxtzzeFFDe+Gvqf74nRcEv/2l19pZjJvahrO
	YB9Sv89183nMag+Mo1P0GX6vbh82robyspoRPgpl1Mspc+gutNXfVEWH/veUUbul0fQrrZrXaPc
	aMOWXvALWls5RKvMHgmCL8OWTuwE0UBPJeQN9DvgYIVYvtfPu7Fw1UfYcYxlitK51UipJEBwSp/
	hY4Bpq+A5rh75ypQXcHdvcPlq1Wdtrp9YsQ7Ef6D3rs2viSxJb6zo9M5mLmA2AtnisT5Oqw537o
	F9U7Ilg0NjpDdm5gmNeFg5ZK9BOu8/hy2W6Ka+S6QHIuUL0M7D0VCiNsdwEy7w1AIO6sDfMFmI7
	jdXv0YSaKBAW0j4Ee+gQQDh/ixY9c3HS/2ivtZt8s
X-Received: by 2002:a05:6102:1614:b0:738:5e0:b40c with SMTP id ada2fe7eead31-744b7d36aeamr133207137.24.1783341113060;
        Mon, 06 Jul 2026 05:31:53 -0700 (PDT)
X-Received: by 2002:a05:6102:1614:b0:738:5e0:b40c with SMTP id ada2fe7eead31-744b7d36aeamr133179137.24.1783341112636;
        Mon, 06 Jul 2026 05:31:52 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838e1980sm5252990241.7.2026.07.06.05.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:31:52 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 18:01:08 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783341082; l=2118;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=1XYwDRGVJPSrDbmhaPWd3Agn7+i5qwXTVHRjNgb7CHQ=;
 b=4F6hy2mC+H0vqdT33yY+VFdV0UOGUiLJADBSouIW86vWGqgY6niPJHnISHFHbaNTPq39roleZ
 SYIzUYXH+VeDTt4Leww9B0Q2v7kqK6shy7s71w7AEkoKtY0K4/AXmTs
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX0n5ZhCREhUs6
 8nsyC0tjMP04e62YpYQlIA8d9ps5QIX9Jn55Q99cZpUK+B0hsiCj6EfnRGm7+MAUZdffugW6rAc
 C4tbT0p9kczCncNxzpl7gEzIDpmRSoA=
X-Proofpoint-GUID: WqMlPrWnrSKsKm8tg7Ut1wWamuQUbNHu
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4ba03a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MBrZzK6-3DAqsS7rxpgA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: WqMlPrWnrSKsKm8tg7Ut1wWamuQUbNHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX8TKprzJABynC
 HI965pQXkVeVDyLImpQSyVgCOh7cHD3t+OFmiOUkt6FgJEBYqzn9gHatjt1dOPyfR1Ha90TVgIO
 Aq7IDYQFKLOVmLJALbuURtKFz20sHJOOaZt98RVemKpDsh9riImsH3YtSPofHSy2K1zLFZJ5dnS
 p4hvxBxZ+Jn6sFWykY/z2HO5F7X+pn4NB/QWPBghqN9KjetCWelzXrydIVVoGDKT63uZNyL9GVn
 Y4FTW6QcGql9unnVQ6a5LUg735dzRKzTZixs8ZwNH/6Or51eHNNSl1jl5HRP1+O74vbcbSpUdSs
 lu/aKrRrVDVxNn1QYQqj0lwxPXSONFLLbTMSyOCAjX17OEp+aiA8NFpst9AJttKLW2kDlzeqEj2
 9aEgOIXn9pYYW/9I4b3tbV5HXSGXllzinTABUARRV/viUHyF3kSnjTPfFhKJxrx1p7oJVif5qkL
 3ak7E5nNeNPtiO2Qbxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060127

Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
constraints in qrb2210 DTS files to use microvolt instead of
microamp.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -37,7 +37,7 @@ pm4125_resin: resin {
 		};
 
 		pm4125_vbus: usb-vbus-regulator@1100 {
-			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
+			compatible = "qcom,pm4125-vbus-reg";
 			reg = <0x1100>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..c472e13fceca4eb882a59af3be9f45022a923ead 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -235,8 +235,8 @@ &mdss_dsi0_phy {
 };
 
 &pm4125_vbus {
-	regulator-min-microamp = <500000>;
-	regulator-max-microamp = <500000>;
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 4ace2d6c06ceee74ced7c8cf9b341089b689f703..bf6fb12ad9906f21408002a2360ef61e8a4684ce 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -433,8 +433,8 @@ pm4125_ss_in: endpoint {
 };
 
 &pm4125_vbus {
-	regulator-min-microamp = <500000>;
-	regulator-max-microamp = <500000>;
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
 	status = "okay";
 };
 

-- 
2.34.1


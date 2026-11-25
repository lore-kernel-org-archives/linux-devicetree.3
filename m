Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594868;
	b=sT3SK4jHfBk2Qpk8Lq6bnVhxWmMmE/6qw4znqpp8g9FBjcEq+uy92jOmRDGl2SZDIcKJ
	 JeDE/sLiDoRzRjtY0bQkJkvkA8QDWMHS5ou623+badigNm88ThaeqiZm9GjroXwEHjCD2
	 EiGKapCQSdtJ4EXBljmCvyF/Z6yfbRikukJRDbUUsML2xPbBVfcSA3riJNamoLiOq6x8A
	 pH9HRFdYilqjBW/hyRpOIvVAf29ZOtfnDpD7Ec9kpXS5nZ5+VQ4zYq73qd+irT2KlCbCm
	 qukR3YweXk5Q3fjEZnkOQbfywx16dULOSKrhshJi+EFqW6eM+PUeX+OtgDP9tjm3lMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9TryKudp4=;
	b=dmnukbipHe6KQobb9+mADNwMt/wurvqkth2PvvZ5HQl8QF60EbnfHfgCas/L6DIZUCm0
	 mBNu8v13zb3SWJG4TppCUi0zajRE7oGSignOr623cJYI/KFLXLdNnMZFwcDz290lntP8s
	 kbCpx+vIAa/1OOYNWfGlp8I00ozTYh76fc2o+Iov6hxkBJPd5mN0Oxokvw4FKJlpEKVsC
	 CtXMSO4/XWsoUIfeVWyIfJJrvW3HQrU0xzLZ0QwhcgRHzDYHwHKsbO6QMbr9ggDBzPail
	 AOcpcXX3YBNhIstsDip0eQQgl1MrsdfcT1Vs5f9655WCijFXQp5J0bvvowjHWk3+FQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V46pMQV6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYV44yOh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C898C606A683
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C898C606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V46pMQV6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYV44yOh
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP694nb3261861
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9
	TryKudp4=; b=V46pMQV6qf3NI5zwwU1byyW6wNAbukobWxMV0vb/Ub/VC1j3VXG
	YoR9ii2diyFewP8Kv29R7LvJbjIZJ1wiyyvsjpZbZTqEXOg77Tu3chq3K/mm0jjD
	XnH9U+EJ+M/SfGONoVjzEa+++BKXj7sBiXWg8s3iiGoFLgYvoZ1FnFeK/S3qg9Lm
	Cc5xXMvji9rhtPONDIqBl+ntR7EDRgzawtdkn8tpqTXLM4JnQZTD7w1lQX5zlsTF
	fUitqcXRaUiTYOfW1FHSDfSpT/IAYQiM+OdL4bhs7yDupr7ka0ERUicU0tlwCgTq
	DdaIQQ3qjslSmo0CdVTmX0hoIl96aFEcTmw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egsb5q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2edd25534afso46532015ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594866; x=1796199666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9TryKudp4=;
        b=IYV44yOhjucimaZmiN0WpchONTZYZj//niCiEnx6tjdzXwxTNRJcztqOmwzwHYBA1B
         Rsl9xcN5VIanY9uTJ5EGlIXv9PT7kW+TXeDva2278WC7W8aXMxr9Wx6zlK2Kt0oSt/Sw
         z6qa7QPu0KW34tOn5sbnD8Sk5pxkV49IJyLKtYo+mr9j/AoEH2Z8Cuo3VWFrVnK9ONfh
         yvTKtYKRNSQtSMiW+N5ymnuZJqeUHfzImLMnNgODNWwhbHtJudEyM2Idt9xtj1ZAxr4I
         pNoOhF8uZR7J6OCOLiDMnz+z8vvvh+9xrK621WNtarSXh7ubHoV5bHJa+XBqNIgZBaGO
         MF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594866; x=1796199666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9TryKudp4=;
        b=k2FO3OI/I3NNWCx9F2fNaTGYeMUWHSnBjyh8Dt/oXNChxWwUexwswg7i6FM/fAoFzA
         NdU8jjv2dxOHG+sM15qTTD096oLjCBT4zNQ8zCus97Awni9Vcfvm5ZrChPEy0f6bCdAd
         fM4u3LAPwcZDUE2+WJvkPV8DS4boVF6t9AO8Q711NpUdXp/rM91xA5s7H4eGv+gtyreY
         X/Jf3xXjPj154BiSpmoLGDaqRsoz1TFQz/Evcs6blZOrMI3gq9KJHfuN7+eHsgir+ziZ
         ISdHThtl3INR4Ek4MKRl3ZHdxD8BAFHorqp2XeTEsMdHI61Vi986aWstFc+zjrJMyff3
         B2wg==
X-Forwarded-Encrypted: i=1; AL+hErE8TLfNj/SG3+389sfJm4YAGzdI9PHHgxuJ3Rw9MB94GR0P+NjutMThGO5PSSOjyoMugpi/pD27Xz8K@vger.kernel.org
X-Gm-Message-State: APuU4Z8IxYkWMoa4DtLkBVLcaypacatkk0f6TF445DdHXZVne/LJnuhj
	/gRDPUkYu6c8YtK8J4y3sRTogJFJrHRzux8VPpyNluv5w4sgBctw4cAdriZKZZW04wMR27DNzyh
	y/UeZwIJ3RjMRPH9DEvr11dEr8oBy//8zchLaqGo+RDq0aZkpdPshvnmrVgFYxHB1
X-Gm-Gg: AZFdTZcHNqQVJSa7bdSgbDfewtkaA7Cup377INGlTO9FN9DebDGxxv/2/cuBvmGsdmH
	68ZxoqZNipHytTAJXwUDvw6/jTolIWcLzKwRdNd3AjpwGwEc25Q7zYlCy9tFLnxMIVUhhJ7ZDNW
	a9dfZbJBP6OnGM6duX8bZA2L1bZ+jMb5Dzd6u3DyQHi669ZGkThgMRmzvgJKEn7M1qWvRxCfZrR
	ePhzjjTmR1Gm/ZlDv/tlbkDCN//tr07GxYIZmY79rqmwR6i92nSZIrssbjGhTOnmW6Eh1yJViBH
	Xm2PM+T2kvzqceB74o7efc00Y5Q/knktoNE0tcyBczmW8MlcNPaKH2IIFAgL6yFujr8P52Bpy7Y
	OJ175jPXUOUVss4K8eZSH2sOm93G2e1DX4GisaqdUDK5rZKkIcS8wfH35VwVYYaf3Aeueb0vGbE
	KqgL30XP2t
X-Received: by 2002:a17:902:f602:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2f03f1bf176mr169546395ad.35.1795594865650;
        Wed, 25 Nov 2026 00:21:05 -0800 (PST)
X-Received: by 2002:a17:902:f602:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2f03f1bf176mr169546235ad.35.1795594865216;
        Wed, 25 Nov 2026 00:21:05 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:04 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V2 0/3] arm64: dts: qcom: lemans-evk: Update SDHC storage support via overlays
Date: Wed, 25 Nov 2026 13:50:52 +0530
Message-Id: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX4FPNMD62mDpr
 eRf1Pt3wZ8eVJNdTvZBSG+8EoqfkARHw5XdNtPjY0p8hIcAwoag5ClSSgDnXmGo0/Dbr+vYlBSt
 t8mzikrrwRiZDPDa1noegd4Fw7f/lq3S0ybJhIsGmXe8uAO6xGLHkzAHQlIoO19dB6XoIq16KsC
 U5xP1+zS/AaFu7mDkiJ8NsWoJczqQOXmFl89GBsMnQdXNgNDiwE/VHJCyrZCf6iQ3wmqes7SHsH
 rfYuYH0s1QMZG4t4nrnKmwadbrkIZwDUCsjfmOMHJNmrw5n5JKD7JFU016wdTbtMSBpkLuVP+C7
 MivxmioFAVztWRxfGye2aOhrsDcol8YhMmkZgw5cdW+OJuVO2KRihzzi9ACC1EmsFdJDMvAa3Mb
 +RlDLnhTptoymb5i5ic5rfqc0/0KlNj13IUOWWiATs4WOboCAHUt4ILiVJyXhRFBh0iWnknZEYB
 j11I7Ery0yb0avMDI+g==
X-Proofpoint-GUID: 3vqZNLiiwBWOxWDA_pJqXrgRBBQn57Nc
X-Proofpoint-ORIG-GUID: 3vqZNLiiwBWOxWDA_pJqXrgRBBQn57Nc
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b069a72 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-vzI1l0uJeKZRBTzIWUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX1ARmsodyJmE3
 2X8NBSX+x4X3BMPiEF0Ow7b8Q5r3EX/XrHX/QD42t9MjJFinpi4HCbToNXvnshPtJXQ2I4WREeP
 87Dg9HYeYKti39G5Yv/GKCR7rArfawI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250033

This is the v2 of the series that updates the device tree configuration
for the LeMans EVK board to support dynamic selection between SD card
and eMMC storage.

The LeMans EVK hardware supports either an SD card or eMMC, but the
interfaces are mutually exclusive as they share the same controller and
resources. Previously, SD card support was hardcoded in the main device
tree, preventing easy switching to eMMC.

This series refactors the SDHC configuration by:

1. Moving the existing SD card configuration into a dedicated overlay.
2. Adding a new overlay to support eMMC.
3. Updating the common SDHC node in the SoC dtsi to include necessary
resources (clocks, register ranges) required by the eMMC configuration.

This allows the bootloader to apply the appropriate overlay based on the
desired storage medium.

Changes in v2:
- Propagate Reviewed-by tags (Konrad)
- Segregate the SoC file changes for eMMC command queue feature as a
  separate patch (Konrad)
- Also update the corresponding resources in LeMans Embedded specific
  DT
- Rectify the register address format (Konrad, sashiko-bot)
- Link to v1: https://lore.kernel.org/all/20260826113206.488991-1-monish.chunara@oss.qualcomm.com/

Monish Chunara (3):
  arm64: dts: qcom: lemans-evk: Move SD card support to overlay
  arm64: dts: qcom: lemans: Add CQE register region for SDHC
  arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  6 ++
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi |  6 +-
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 ++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 -----
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  4 +-
 6 files changed, 102 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso

-- 
2.34.1


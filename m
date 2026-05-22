Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973EF3C98B7
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444787; cv=none; b=uu29geBKF+amoT1nN1E5KR6rh9e9BlNU/OtylvXdM31aEIpthAwhuCU++01M3dMioFjaCUfCcNRsPuYFvEfKF4yk8UpBOooXtyuCR/p07tAMJ0PAYhP9vzSKwsUTLOBcScupyJ2zNUA45P8TtLWUbbVfDGgFdb+Xjj2C3gs87oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444787; c=relaxed/simple;
	bh=9LRaMcv2V4zbaC8556pmvtif80qwwMxTZ4+jktXJcsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MIls0KMnCTxxcI0rtXjjtEvHBGaWWt4f9f+0AGTps0KEu4Q1vbjT+Tphi0sHfduAFbZwxMiSnhl4zD3sBacQSmrJfGdacXVWcERxPC21KkjXEPC5GhDErd/3fi7Tc1NO+CkZfXsBh6RU8ilonS0jAD/xym79yuwGhqywV6Et8GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I62NlWL+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9kdlQ8R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I62NlWL+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9kdlQ8R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4Ael3947414
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOy8/GU3XQkZVyXsjJI4YrGNfteshSum3AiTJPnkXFU=; b=I62NlWL+HLctD+sz
	RbdpGqtnZ8gtEnLvig5e3IfsqmR1E0K/WnzSTvqMmiLj2m6/CmMdCGK5cSh/BCXM
	acKeiFlymox/EyKIIJMzds1mv8hvms9iY2TLGWoEagq3VC2npTRA8CwNoVhHaECJ
	rALL3h6dLHD5QnzbpXdgViGdNfeExl4vUMCVSP13D3+yPcOT6wyXLkEc+x/z3JCS
	iSplzhT2uNRy81QhANJOd9xeMgX5UXSNphM4LUlFJPfvSPOGiWuljPSuFwP/ha5P
	cU8Cey3uBnGW32Cc2H24hN6uvDJCffFrQMPHvG2WSV+b0R/D92k6fBAL5iSxpSBM
	tT74Tg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ng157-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:13:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82c477290bso3851215a12.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444783; x=1780049583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOy8/GU3XQkZVyXsjJI4YrGNfteshSum3AiTJPnkXFU=;
        b=Y9kdlQ8RSlLRRv3feMPRhH9B4+51iqx6kxCH75jQrWmvmdHbiZdBNGjeXLE3eA+hB5
         JeOv1CGW7DgG/Re+WyNW/zBc0S0Q5i1yZwoPxmptfCf5XWk8gJ0J1hBEyfAOrxIQy08t
         d3fhgkPny88LTkFlyRD/rKF7QbLoYPcu9Xuy1Ft9jxu9agufOneJqHtk0U6j8yx7cQCw
         1L1+vgW1tUr11ZuySNN0jQvwPj84EIWJfeRyTuwc9k5DsdYusaFF191L351F5y5qL4n0
         dNldznp4TTK69ERrE/u1m6an9ZsnuwhIfCQKSWg4SCLV6OOxlBb7ZFatqsD/yT+kiIxu
         q7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444783; x=1780049583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rOy8/GU3XQkZVyXsjJI4YrGNfteshSum3AiTJPnkXFU=;
        b=TSeaDOpUNjCuiKkaWWSpQS5Fg/SEgNTzy+2+dSpFeLi+abGw/Qfi/gF4+ztMeUYHPn
         0UfwPr4lKjinbQ92/gY4aTsT9dcwYerEmbTCXB2mG0RKrB5+fe4YIAqfYcRGRpYXdkTH
         vuTTePMwchI5IzoGZW8+S+JD83RbsSo7QF0x6GnVgFMMG4k58E/xIZMVcd94n/IM3y/M
         9ZHFov+l6kAEtfULuEMAELndp2dDOVOlKfNiMJJnwDrqrBK9LDCgtv5wthanG17IVIGS
         Svfwe7VkhyDQs39jOg8gfuep6YAWt/vQOIpqvnxGmbLvdTbhOu46ec37Tw3kmQYgCLfC
         ZFwA==
X-Forwarded-Encrypted: i=1; AFNElJ+3OzACr8Vz2WBEiLpBD+LLfqffeq6G4JMk/8Ffoq2pN2xszPic4LxwSZhigLJ7obi5kDPOGlhmIoG0@vger.kernel.org
X-Gm-Message-State: AOJu0YzBZ7QlCten5wkiSR+GdI2rT6lxQtUKcfHzO8nAg5Emdr163Vus
	QwBG4XpAzynU+j55LwVpOPrfeHoYne61XAF59CMmopDXIl6qv5EPn6WUQXqzzxb3hn9U91tmQPl
	oGmzcPPttPyDfW/qHKut/ewut1Gbse5Q9HQ6MGEV2c7XmLRuOdCAbOhCCplzYvjEH
X-Gm-Gg: Acq92OGk7olydI6BxhJ09KLGLEXkcvbJ2Vhw6pV4G8M7LhxPNXgTkSgiPoVGtISaCUD
	5fdMl1jEz1CywZiTX9Co+39Pc+wiiQNZX3locDa+n62t0M2+3ZkBN7Ga2ceS65Mk83FKdgzZxvw
	WsZXJC4LA9tbjqyCp86fsuq8UZEScwOi78oAP4qSh5aj40WRoSfQpQ/QBOQ1nXxVebzAUPuEBMh
	iRQRIr6ffGUAxzWStVJqXcVeaawBFJ62Wl2P8vJPTPHcJWY4/nI66S9OflmYeOHvBQ2fg2mIhyn
	XRc1z++3PR14T/xRUXRHMVjr2/cY782ByJzbFCybtVKj6yBkIMjzVXjd1frs2ExYEzA+07nih8D
	cekV2kvYW4z2Ct/FUYGeO5bkXPlb2i3xns/BaeYh2K6bF2Q==
X-Received: by 2002:a05:6a21:e545:b0:3a3:1071:89f0 with SMTP id adf61e73a8af0-3b328c3aef7mr2746407637.2.1779444782738;
        Fri, 22 May 2026 03:13:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:e545:b0:3a3:1071:89f0 with SMTP id adf61e73a8af0-3b328c3aef7mr2746356637.2.1779444782221;
        Fri, 22 May 2026 03:13:02 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:13:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:42:00 +0530
Subject: [PATCH v5 4/5] arm64: dts: qcom: Add GPU support for Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-4-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=6197;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9LRaMcv2V4zbaC8556pmvtif80qwwMxTZ4+jktXJcsQ=;
 b=zOl5Y89TsckbbBpFdAJU2lXL8xlzh6ufa28T/1DvnFneuixTugelWjOX7t/1gn4pxgQgmQQF8
 364+zozaWZJD4JlmMOvoAmhkuklertg1pkeCuQafrdtXHBVfOUW7dJD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a102c2f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0FMZnqfP4dmqgQdt9j8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: qvjZ-2cd1WkzJbNkTrpYb6MfLFczOt8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfXyqjzzhhnNHM6
 rsIbr/MvLcXgRu5ASfLyzqglCGM7WbxlPZpGJpHFXdSnmdJ5FaqrcfFntnYKxepNYV4zU5MvAfb
 2XMle1gw8Iy1kKzrp4JAbVTA4K9x52eln/cOxHm6r4h094EC70MmfC4dktk4nZKeIkClkeCBmBw
 LL26fzyV0XJsPivfaK3rvqUlTo5ZkM3SK2Nrn+MajZxpql12ez+mT5X9PQrOKgIa3UAMReZFaFp
 ZOWtm8aaNezyEiRcYBewFvjYiKpjT4js2oouAOm23Te1xO4REmPJt+cL6JIpYZDiXTzXjmmjAjG
 nDvOj/IdNU6rqBAVtY70fyX0cQlmIQPLdfrx4Isqy5CVBQ1gSfLf5qbY402sEH1X4ga0tBg+wax
 IVfNdbY4UXIjgodckEVKDePco1Nt3JIWBfQJS9+9AnQ+kLq2V+7FNBOCyfGZMChcT+Wu/tyxWC2
 zdG6dMA7Rr0djoUZ+jw==
X-Proofpoint-ORIG-GUID: qvjZ-2cd1WkzJbNkTrpYb6MfLFczOt8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220101

The Adreno X2 series GPU present in Glymur SoC belongs to the A8x
family. It is a new HW IP with architectural improvements as well
as different set of hw configs like GMEM, num SPs, Caches sizes etc.

Add the GPU and GMU nodes to describe this hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 183 +++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 5e76a0d53f01..01a2e32e503b 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3701,6 +3701,129 @@ hsc_noc: interconnect@2000000 {
 			#interconnect-cells = <2>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-44070001", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x6c000>,
+			      <0x0 0x03d9e000 0x0 0x2000>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0 0x0>,
+				 <&adreno_smmu 1 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+
+			interconnects = <&hsc_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-310000000 {
+					opp-hz = /bits/ 64 <310000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <2136719>;
+					opp-supported-hw = <0xf>;
+					/* ACD is disabled */
+				};
+
+				opp-410000000 {
+					opp-hz = /bits/ 64 <410000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074219>;
+					opp-supported-hw = <0xf>;
+					/* ACD is disabled */
+				};
+
+				opp-572000000 {
+					opp-hz = /bits/ 64 <572000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <12449219>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xe02d5ffd>;
+				};
+
+				opp-760000000 {
+					opp-hz = /bits/ 64 <760000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12449219>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xc0285ffd>;
+				};
+
+				opp-820000000 {
+					opp-hz = /bits/ 64 <820000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xa82e5ffd>;
+				};
+
+				opp-915000000 {
+					opp-hz = /bits/ 64 <915000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-1070000000 {
+					opp-hz = /bits/ 64 <1070000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882b5ffd>;
+				};
+
+				opp-1185000000 {
+					opp-hz = /bits/ 64 <1185000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1350000000 {
+					opp-hz = /bits/ 64 <1350000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1550000000 {
+					opp-hz = /bits/ 64 <1550000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x7>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+				};
+
+				opp-1700000000 {
+					opp-hz = /bits/ 64 <1700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x7>;
+					qcom,opp-acd-level = <0x88295ffd>;
+				};
+
+				opp-1850000000 {
+					opp-hz = /bits/ 64 <1850000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L5>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x3>;
+					qcom,opp-acd-level = <0x88285ffd>;
+				};
+			};
+		};
+
 		gxclkctl: clock-controller@3d64000 {
 			compatible = "qcom,glymur-gxclkctl";
 			reg = <0x0 0x03d64000 0x0 0x6000>;
@@ -3712,6 +3835,66 @@ gxclkctl: clock-controller@3d64000 {
 			#power-domain-cells = <1>;
 		};
 
+		gmu: gmu@3d6c000 {
+			compatible = "qcom,adreno-gmu-x285.1", "qcom,adreno-gmu";
+
+			reg = <0x0 0x03d6c000 0x0 0x32000>;
+			reg-names = "gmu";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi",
+					  "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_RSCC_HUB_AON_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "memnoc",
+				      "hub",
+				      "rscc";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gxclkctl GX_CLKCTL_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 5 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-575000000 {
+					opp-hz = /bits/ 64 <575000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-700000000 {
+					opp-hz = /bits/ 64 <700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				opp-725000000 {
+					opp-hz = /bits/ 64 <725000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				opp-750000000 {
+					opp-hz = /bits/ 64 <750000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,glymur-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.51.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B45383303
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538258; cv=none; b=pCe66g4dKujlT5WUbZXPLy6a/SoPljEsdJ74UEyooRK6tBzL+o1PInw/Vj+v5Q/4YAcsK/DlNhezPvXYLgzoZAcBLpDWhGHs3DaIUzKOPoHH+SAdCBAKjH/+GiAjzP7og2QJHZcg5br/haNi6Hp6Wj7kwyWhBjXCkMvapvcT01M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538258; c=relaxed/simple;
	bh=04qu+sqiESXvq4vvHI0DHaSeLTlPn1EdVFCIopBEhMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I2AaFHwTEwg8w+hOnBm+Ap17lpIXl9gJ+Jmz2eNHcQXs3BEOvgH+XODlPCcbUwAVI6kQBGf7IBSfd9G3mChHBDbnGDm4GuG8b/7htkzaycpejoXNBU2UGLWtRNmEPlPpeF4TYOLT8Wr90jIzbZDWZ19XdObrahP6pH/CZDjrVNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMevEelD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7/OtbT1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMevEelD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7/OtbT1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6pnZ3385020
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FBlygsgGnxpPMz3OC32mVCAkxjkMriPy5M65BYzsWwU=; b=aMevEelDPgBpPBKd
	820JcWpezKtVXryRm7ieHXKBnYKlXJNsczb9JH9PnQgi+Dt+7T+R3UdAtURDJfxO
	GahvsmKHgD3++i0nq+9Y0dqHVyswpAXlVHpVlBcayTzXi4sbFmm4KXuHklzw27mh
	Dqmd+AmNXhGJ80R283HfR46NhYhrvfd6rIJ7xwwi3H1zocPpmjtWLUegaXO3B+6F
	anIWxBuc/Fwje72Ot8i8wXwaqc0qstB9eAHfBhIE51ZeuvPc7716EW3cvyAcdtR6
	+uixQ3UXczHwQlSt/GIKg6RUqK7B+F5V3fwFZKNGVXDg3PfC2axuQwzQQk/3CadU
	xHEY6Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4gexu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-836cfd84728so2682631b3a.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538255; x=1779143055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBlygsgGnxpPMz3OC32mVCAkxjkMriPy5M65BYzsWwU=;
        b=R7/OtbT1cVILLSssGOdfvaivltibC8SQSCY8R/aCll2r7LDz0X+ZLtVN78oBio3mN2
         wjjJdzFBeotA1iPvqkpfcz0NRANnq17hAzDnT2vVMwx+xZXO2d4DnNvR/1VtB9PA/hlV
         M1uwAHDwChpuIFMV/x4V+/5SvETcMFAFA8ZMg5c0KG6SNesvdkaThXWAfnaMW/a5ZRgo
         ie1q5rmVT6YC6sSZ/quxlwazQ4kOBSDJckBpxPiN/LCT8NjWmVdpWRF92C1pT+txvFkh
         90Q/zLEiqvV88ZY4s4FQkUwfcOBKQC7gzUnaFqOJXY2GzLSJsR6fjRExTySzd4U32oGX
         w/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538255; x=1779143055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FBlygsgGnxpPMz3OC32mVCAkxjkMriPy5M65BYzsWwU=;
        b=GUzJKOeCqTdpNzxPufJMYdCyA/MS/L1bVXX2apWaOSisw0LisuoYEf4h7zClPsHgmt
         6OXqjiGK8QTMgF+ZN8vP+B772jo6Ezynf5tjOwIOl+uphvJG6afWlQCOlnjebjZc4Ce6
         +6UN/Lm81RYoEA1rYjzFo43GPf5wmucT8mXSv2RQs0Jn3Bkkyh3lo+592ntqAITlY7Vo
         GmqM0ZLZlXzV0RLfIbDSIDhBjMMsCnuu3zLV6wkK+vmXdAeHgDSD2U2WvafOGFDehOF4
         ZqRfe3pojdXiBZ43MfxpGmqTx7BiZOQuzRvDzsyPIU7+H1E73QD41zvZFdp7L+1i0MCm
         THhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ubQxNWVlWGx2i943WBova5hB/mqFo7YUM/v6CsjhHhvStqau1X0akrfKfh9Li+jnlp6lTTfRRFUYU@vger.kernel.org
X-Gm-Message-State: AOJu0YxNGF4p73ExxjSUD2aM3Nk8xB9gwEFil9k+YaiWq69VDchBNbNa
	MhlTOk9uiVmisE6JEuM7WOfAtfXz8iCXf33XIyJ0gEcVZfe4bP8rH9u5NyZHORXLXIheB2Ycfj1
	UidhsoEeXwDMqZC6PJWSoZp823EQZM0F/+BYAlv7+6uzoRRDx/ichA5C8abafejXu
X-Gm-Gg: Acq92OHBi1ps5NNleadi132N0JtG1e7jdx8GKgl/2+cpLhe0fCYjB9ih9WmGJOqdfkr
	zlfperWXcA3dX3nmisBxfwsWkWKbO3AEnhehl1YcgOVwdkTofBJQJh2b0GVaJuvY7tFqT/u4Hkh
	2EVpPi7Pb5UjIp/zC0oQD0m0k1CFZtKgid8TmKFxrwCsdnz996gvGlsnO5MY40XQAG1kZ+2Xc03
	uFNY+TC5K3ysd2F7AAkM/MGaPNcsFvovKo0bkafrkn3+fi/ckWxlh7NcK4owtvnYH45STVb94Cq
	JP9saIaKCMI/aBWNjInulF89njr8XI6aabs9GkyBYwKN4WE5gpcVkI35NjCF/4klfYrl1bZJm6k
	9GrrGj3rORtQcfGB7edMWJJMJN/tPc/iMIhcwUuecz7SYeQSNXjtZ7nwA
X-Received: by 2002:a05:6a00:4484:b0:835:537a:6f15 with SMTP id d2e1a72fcca58-83ee836743bmr1216719b3a.15.1778538254812;
        Mon, 11 May 2026 15:24:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:4484:b0:835:537a:6f15 with SMTP id d2e1a72fcca58-83ee836743bmr1216671b3a.15.1778538254242;
        Mon, 11 May 2026 15:24:14 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:13 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:19 +0530
Subject: [PATCH 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=7460;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=04qu+sqiESXvq4vvHI0DHaSeLTlPn1EdVFCIopBEhMg=;
 b=Fp2lHKVXgWkT80McpFjFpk7lZesnPTKO8OmzeleCMQcA7tzko3rc4qUbCoqC+IAtunBNHtuIY
 2fEnr0n4vK1AmKVxQ7tsGndv5skP7bhDuYJMozfgwa3oAPLqgIQIKrZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a025710 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NK6jBuhQyghv6pUElKUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX/UYe7mBZF0hv
 dRO/mPe8gAqcJmcBjLxTcTH5DAi/X3gwwJunO16FSP0uWQRByIEevG/5NyMWRy+wIweIbpfn2Vw
 uwU2GtykBueKs1erjkGKO1gFimJjBijlPmytsv5I7fxk02eFi+Ad+GDc2Jto2Bu9bIzgAdEwNqU
 tYYYOGnP8a+yu1bReSTckwoXIkqbWJWO4JUUECCfsGEgqeC0ZzW+fCKPq1OtUq2pGbWLEHlIduF
 M1fGvIsyQ2gHxyyz2FiRf2dEIkoOva4ODF/6rxE6HGSjQzXvemWNsTJt2XNmXpMtzYDreyKeJaW
 wzMd8Yka7wA1ZntPoN9wnMjDnnzdIe/nh+DjCKeMjs1lmmw5WSe9kXB4afxxeoBTpfWDaFXpSdE
 Q4K2Bf+aH1Aba4Hbx5qYSOeQqf0RO48bv5Nut2XIPyRffjMs+ceiJO3WvDcsyoJ/E7XJHxvRVbF
 2pGvtSd6Gd/ty8eN/Ww==
X-Proofpoint-ORIG-GUID: LlHJA3I_axPIxg-3Sa8tEQOeNQ086QzM
X-Proofpoint-GUID: LlHJA3I_axPIxg-3Sa8tEQOeNQ086QzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110236

Adreno 840 present in Kaanapali SoC is the second generation GPU in
A8x family. It is based on the new slice architecture with 3 slices,
higher GMEM/caches etc.

There is some re-arrangement in the reglist to properly cover maximum
register region. Other than this, the DT description is mostly similar
to the existing chipsets except the OPP tables.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 232 ++++++++++++++++++++++++++++++++
 1 file changed, 232 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 0211fc9f8c88..c57aea44218e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2573,6 +2573,238 @@ videocc: clock-controller@20f0000 {
 			#power-domain-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-44050a01", "qcom,adreno";
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
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_microcode_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-222000000 {
+					opp-hz = /bits/ 64 <222000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					/* ACD is disabled */
+				};
+
+				opp-282000000 {
+					opp-hz = /bits/ 64 <282000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1_1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xca2e5ffd>;
+				};
+
+				opp-342000000 {
+					opp-hz = /bits/ 64 <342000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe22a5ffd>;
+				};
+
+				opp-382000000 {
+					opp-hz = /bits/ 64 <382000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa22c5ffd>;
+				};
+
+				opp-422000000 {
+					opp-hz = /bits/ 64 <422000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa22c5ffd>;
+				};
+
+				opp-461000000 {
+					opp-hz = /bits/ 64 <461000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L0>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82e5ffd>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82c5ffd>;
+				};
+
+				opp-539000000 {
+					opp-hz = /bits/ 64 <539000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L2>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc82b5ffd>;
+				};
+
+				opp-578000000 {
+					opp-hz = /bits/ 64 <578000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02c5ffd>;
+				};
+
+				opp-646000000 {
+					opp-hz = /bits/ 64 <646000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02c5ffd>;
+				};
+
+				opp-726000000 {
+					opp-hz = /bits/ 64 <726000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882f5ffd>;
+				};
+
+				opp-826000000 {
+					opp-hz = /bits/ 64 <826000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82c5ffd>;
+				};
+
+				opp-902000000 {
+					opp-hz = /bits/ 64 <902000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
+				};
+
+				opp-967000000 {
+					opp-hz = /bits/ 64 <967000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1050000000 {
+					opp-hz = /bits/ 64 <1050000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x88295ffd>;
+				};
+
+				opp-1200000000 {
+					opp-hz = /bits/ 64 <1200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x07>;
+					qcom,opp-acd-level = <0xa02e5ffd>;
+				};
+
+				opp-1300000000 {
+					opp-hz = /bits/ 64 <1300000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x03>;
+					qcom,opp-acd-level = <0x802d5ffd>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6c000 {
+			compatible = "qcom,adreno-gmu-840.1", "qcom,adreno-gmu";
+
+			reg = <0x0 0x03d6c000 0x0 0x68000>;
+			reg-names = "gmu";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "memnoc",
+				      "hub";
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
+				opp-475000000 {
+					opp-hz = /bits/ 64 <475000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+				};
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
 		gxclkctl: clock-controller@3d64000 {
 			compatible = "qcom,kaanapali-gxclkctl";
 			reg = <0x0 0x03d64000 0x0 0x6000>;

-- 
2.51.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B49395ADE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371952; cv=none; b=LFzi95LfkqJXx9QYOLNvgAUVBEQ3jO/WPyJ8wPROvWpH2G0EXKN5BUkj5UOx8ddr4axx16l1NzNh3tbQGw9h3irr/jRGc9b1gi6RwIo5W7Uro49NxYZOO1zu9elpWO/VqvCl+IO6k9Kcth+gIbom8bfOQHLu4IVOsvEiq/3Ncdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371952; c=relaxed/simple;
	bh=BghuoPAEZNaeJMJPKdJFsDVu1LM7cTUOvUNAAtZ7DPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMFvL0hqXkwRJe/MOuPGhc1Zl1Y+171tJt1A9o7/JfZlIHmZH1ynjGuuiNfDoHYGLBwmFrkmDxVYWkhbhpKAp7QD1UHznF4c8UmVGmefM1CK4Jl8N7vTYZsRYH4nEDBlBCR2gPd4lpzdmylO/y9UW8dazPGThmfqCc1rbl6tK6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XemG46oy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEqRIY4Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XemG46oy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEqRIY4Z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEGdK1505078
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=XemG46oyty96A3vH
	JA1v1oCMxOQ3cCOvgMFdMKkWjuBqWU2a9oT2A2EVwVQZ9wJxfXR0K2XjmIpasOip
	aRUY8tMCzmEKH4WtgI2CK9hM3JGSrbiQg4TtbA49/fjZ41NLRUtyF+BMdjxIQm0p
	eI8xYNc+LjBep57d3DBufKXmyiOSn4qRGP45N28rk8jRoF49vFkIk//tW5092ztm
	z2mJ2xXjBfNpQoHICIKkPg7VVw0azqteM17fEKQNRHtICQgMzp1cBRg6vNanNgE6
	O7NE2cxwuZEXBYycSnnQ5zw7E2nWFojH79aF2Xybym/1W8NMsBxOe0/2xDkTW+M1
	1sYbzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98jstx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:05:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so32488455ad.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371950; x=1783976750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=VEqRIY4ZKBKwrpqpj0K4MznPblUQCp9B3/wb4hIFx8Afx23mmeRyXHfaJp7QTyMijh
         2kP567Q7MVNfWEjRGxLZHEX68wa+vfz1rih/UwLAwxpFhafc7ztySSkH8nIGcP9XuLHi
         t8BHYpiXl111d05EcxGbkUTXSEVtvkfidrH3PoWkmH+QHTy1snGf8FFpZXk+vlKKtQQH
         W2k8mET5uCoPKhCcqi3YK1PGkTYhL0tCGtd2JyZ7PVJxtqFFFsA4y6horK7cL3BEO25a
         jvA7fKKYfuZ84VPIaHM9AZu7kRkHkOlkj0VISyOBoiu21KAKHVg5v8XEB8BOLuko/GCw
         f/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371950; x=1783976750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=OcjPtyFFmGiebFR3E+W1aa+hIdqsxAymUHJtZIBD/kwD06NDQ5HzLrIFeYDWKIsIpn
         P5mW4d2uimnNL6djcOjgOWYoTweUJSb5krS+AN7O0vaB+bxzJjsAse0fvHgorXXv3Hel
         2ewvV8AVKDwexFDVWwWmXrAU4cMFmIb9iL86Z+Z5Lh2XGi+n8Wve3z70CJxEoWyjCm+0
         TZPaCnyru8wWIf8IvRRLGngbw/Yw+CvmJo0nuV7+es0aDfbuNh8ugV81YQROuNmOPd0W
         J9eSmRr/HGRcoebxN1vpPc4a9UzowKwdC30ZkdbHWbRS3shH8WeWuFlhnUoHaln1LQ0K
         Z12g==
X-Forwarded-Encrypted: i=1; AHgh+RqxgLB7kTSczyCu/edaq5ePCC6MEGHKFM5fuh7yUZtlMJZa2SqgJ1i7hr9aj9uZQ52Y/IfjRstwp7xI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0P4IPHRjkoNK4TkyUunf4Jq5mnU/9RUb+jlvOaRtYHmR+JCSx
	ult1wbkbL3NGtVONTEcotvnMQH82tyooDceR/JgA8B+uwvbzRWmYr8HbVaUPWv7h/MOXJnUtAvX
	RgLj0b340Fa6mLPlITdsdZOgI3is0fmtp44Tq7b9E5r4DsanzyoOLBH1EJjxD37f4
X-Gm-Gg: AfdE7ckNnLKyyI//AkZ92SkiAo2RxeGyi8XTiaXYgp1NqYirI/nOgY1Ht6b/0Tze4TX
	Xl5OpMlZZUAVnuRSLwtkOBiyxyXHpWBJ/6RlSeKQOvt/mfkltdV42TcmlBrkIokrqolH5nzOg5s
	QDWXtphJY0y3DtDb4BApLmPCzvvLXgL3Hfu+mFN9AbL/r7yXaM232j7GGrJ+YFuODUbErUXHILN
	C2q6wRj6aoxgQGzyPa7Kap7VJkUvcRxx0hIT4ylZCJNT7Lm/BfYfw74kcT4w9pE5SCXiiu9Ht+q
	Tb4oUMCbld/y5XUxFzhVvsR59K04jIGYadZGrH5I9vMiDF73ZattNvlDi8LQl55foXtNPtxz+AK
	PlCRBbtDyNNrCMViJoBhyPAR8rUvv3ygBPE0=
X-Received: by 2002:a17:903:19ec:b0:2cc:8ad3:423d with SMTP id d9443c01a7336-2ccbf041c8cmr26648325ad.29.1783371947870;
        Mon, 06 Jul 2026 14:05:47 -0700 (PDT)
X-Received: by 2002:a17:903:19ec:b0:2cc:8ad3:423d with SMTP id d9443c01a7336-2ccbf041c8cmr26645595ad.29.1783371944672;
        Mon, 06 Jul 2026 14:05:44 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:44 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:37 +0530
Subject: [PATCH v5 5/7] arm64: dts: qcom: shikra: Add A704 GPU support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-5-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=3495;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AFPL1mLXpKffrlVn7dhyAuVw3rCpzngGAE8+zg6xtsE=;
 b=Hg2Kf+dWXJ+whlWJjf8ja7E8O66IAXgviTZ41pNM+vxeAaoMmTklSyb87ZwbbzCvOrJtjZe4o
 VVlCMvVeNWWAZQO4FGDVlUVdpIrYZG85JDUmqOliICPcLii0AxUVNsV
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c18ae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX8mQ0GR7Y69Lh
 fPq0xjlnjd+sAGmqeHhtjxezQmwjOO9anDiSD+2nB3M49Os6qKw69eTWQjDPJkE2da7ftTyo7bL
 6v9oy2ypTTL0czxfTSNFF8rUA1vJlUoEEq4PepU55akTj/ppBz3QfhWVg9p3etLTsBfk48ZMrH2
 cKl+n7FYiIAWoJ7NihbTPXMiyBq6TNqkyRV1zl50dVSrmIWACDIJFYdt01VPMMarVwZL6xInL0r
 c1qiFCRxLUAM6PX8SyvbFjzGGoUYFsxORLHHiC1Jm+yTD8OupH7mZOCCLCF1ylW7EpgbKeNaDZw
 Xcapmv/IDJdUsFvCCKe4ZHuV1vljVIabHld5jnp/Ov1RE2scpUKnoWaJ5Luvoot/AKsEdqWJNXG
 p4Bzgnjpd/9MiPZhclBp9/fnmJbgNbSJIyxVz+Tv1oo0f/pl6lqIGJon6eaBjA9drRD1uQ2ujeA
 Q9pa7bvl5jhWTaJ81KA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX4FzxdRlv4Jwo
 /ggmRAgqEO8/qKhqrATYtrCB/nGdh4ushugItknh18J/J4V+JoRwdNFPf/PLbp0tMKeATXlbt3F
 8AlWRSh6e1HtZFAWd3PHD2bNMmTvIvw=
X-Proofpoint-GUID: rd5P4GWaAEHVpsT7YrZvqaGKVzzV7L3w
X-Proofpoint-ORIG-GUID: rd5P4GWaAEHVpsT7YrZvqaGKVzzV7L3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
interconnects, IOMMU, OPP table and the zap-shader region.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 98 ++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index bb11e832d9a6..34261221664b 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1992,6 +1992,104 @@ glink-edge {
 			};
 		};
 
+		gpu: gpu@5900000 {
+			compatible = "qcom,adreno-07000400", "qcom,adreno";
+			reg = <0x0 0x05900000 0x0 0x40000>,
+			      <0x0 0x0599e000 0x0 0x1000>,
+			      <0x0 0x05961000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "mem_iface",
+				      "alt_mem_iface",
+				      "gmu",
+				      "xo";
+
+			interconnects = <&mem_noc MASTER_GRAPHICS_3D RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0 1>;
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			qcom,gmu = <&gmu_wrapper>;
+
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-1142400000 {
+					opp-hz = /bits/ 64 <1142400000>;
+					required-opps = <&rpmpd_opp_turbo_plus>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-1017600000 {
+					opp-hz = /bits/ 64 <1017600000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-921600000 {
+					opp-hz = /bits/ 64 <921600000>;
+					required-opps = <&rpmpd_opp_nom_plus>;
+					opp-peak-kBps = <7046875>;
+				};
+
+				opp-844800000 {
+					opp-hz = /bits/ 64 <844800000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <6074218>;
+				};
+
+				opp-672000000 {
+					opp-hz = /bits/ 64 <672000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+					opp-peak-kBps = <5285156>;
+				};
+
+				opp-537600000 {
+					opp-hz = /bits/ 64 <537600000>;
+					required-opps = <&rpmpd_opp_svs>;
+					opp-peak-kBps = <3972656>;
+				};
+
+				opp-355200000 {
+					opp-hz = /bits/ 64 <355200000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <2136718>;
+				};
+			};
+		};
+
+		gmu_wrapper: gmu@596a000 {
+			compatible = "qcom,adreno-gmu-wrapper";
+			reg = <0x0 0x0596a000 0x0 0x30000>;
+			reg-names = "gmu";
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+		};
+
 		gpucc: clock-controller@5990000 {
 			compatible = "qcom,shikra-gpucc";
 			reg = <0x0 0x05990000 0x0 0x9000>;

-- 
2.54.0


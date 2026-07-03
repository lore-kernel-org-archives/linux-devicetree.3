Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22D321457
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 20:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110964; cv=none; b=uLpp8dK22/dNH/V9hCA36qGkPHYi7uC2AWEzwym8UUgurDND/MI0CFO1JAMH92ZmoDkG2CMEdNG3ml+JIPidSJgzwk1iREVr0D2zCMeyD0lPHCoxVWdLCuyxqrXnH0J8qAOBDMdn7zj9jIzDz4TGldi+VLuzKNIh/a9/MqMRA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110964; c=relaxed/simple;
	bh=BghuoPAEZNaeJMJPKdJFsDVu1LM7cTUOvUNAAtZ7DPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3AaSIyOjkeRTzuRh6W416ENgt8WH4Of6foq3bLacfMAKTVQuPDZH22+Hr8ZstbXUC4JtzJemBzg/wwHUDikvNSFzliYRZ664kmkfnaygpVyfJFO4YpC+jEPilmWiSGvMK4RIIk1SZW1VoDxY8v+a5z1NEwiYfceRvddAsTQ2L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwWcc/aQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Efw5geaU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwWcc/aQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Efw5geaU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPSGd1039983
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 20:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=kwWcc/aQsvDhuNvU
	sR7hpyO1eDnpBJVtmAbr9xTdsoTDV/umabqbahre0b6e4XNHuWEDLADYcmDPoIP5
	RVRpYv46JJcuv42nh/uIRPKVavgKEomucpLkYOCSstuaFiDolNL3MwQkgUCjNV1M
	Qe90JQBTQwnxVYPLP8yzo4Bw1UGjwwsWfb8jFqFKnLLGzoVAVbyTHxlAuBsbD7aA
	u/6rEvqbMjy+myKEK2uvwWQQ3FJC46T3e86XyArv/GU96C5rwAGjgJP2wF+sgEgE
	zc/24HIlzL3Oj92i18QWYdBgSptNqMIFYbW+1NEYBR0ZksdatmJ15lBv7JiFgbrB
	ol6OSQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84a9cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 20:36:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so287616a91.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110962; x=1783715762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=Efw5geaUUI86pYogHsorR4OqM2ZndImnX4ZjdLO1XrmT0mt8SMNZcApUhfJ+xEpecK
         z8jXhZSKlW0AUZgHVbcV3VLKYpqYkd7hI6AIfPkxcN9oNLxfs1Tn+8DVrDNbBzKQAuy6
         nJl+f7lSq9HOgnnRjNXbvdQvgVtFx0zCMamga5kBbUnZIir7QIdGPiuTyV6FtlyUL3hi
         mM4rQOjF1qfg1cnzxzGo5GXgWWOC2VdodIlJYd6v+yCXD8/CUOqDAAPT8d+DQvrP8IzA
         o+hYobGbd/NHBITGaurWsaV3QCAY1nf61AQhgWFf3WCm9HSNUvmMMKCfe2iIsRfvxOFB
         gaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110962; x=1783715762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=qvTEaDZmBXRvaXd44XxQOUTUI3ntmW/KNQvYVi3dHzLuTeok2o+40NT9O2P5v0SkKS
         s6vPMCZSeLolKpULDw1DmnXTkmqxHd/yLD1/iQuFQfDZ0DggzpYTD49k0Em9qO87guSB
         RJv45fRXbrbOIFeuuX9kcg0tVQBSoWD3iqWmC0Z/sxClU9AApKqMVxes4N+SmicGSU9b
         gpaXPn9C5M/t4zh5PZ8qBaUhqNm3sQTUGn9ff0xiRxoiVygQ4/FCV21ryUoZvRgpt5MN
         gXdSpFrEDC3Nsb0RHHc9PLf9p9gO7sU5dqJ8gr63eHWeZO1Zv1JwrHL1NhH5p0iuMPPs
         bJIw==
X-Forwarded-Encrypted: i=1; AHgh+RrsdhDGcoIC87vwLYYdELP8MAsdXm2aXpyNNNFd0LyaCblILJLiX5wySXrQYdz1PTLyHC1cToYCiQGZ@vger.kernel.org
X-Gm-Message-State: AOJu0YykT4QgQHUQcb10JfU0b5hAw+QD4uCvp+VYKPjKbr234VrI/KlB
	J6TznCz6ZLif6fePVc1W+t14/o3lsgywqcXbBbeJ3yKQO7FDdE5A07KVgDi6zNPjqQ4By744iUu
	gD3W+HJyNMnZvjJT1URcxKPCXbbcehJWBBMUe9ejSnmpI/SNqAlsvEnPf+3lcvgL4KP7oDi6g
X-Gm-Gg: AfdE7cm+GlmU6NUaAqVo1g9LbDIzzl2LhthkA0oZVdfZ2UZsj09HMDIboKWFRxn0AVC
	bWfcNZl7TL7YHyqFikJ361h2nmTSwqbHzogQaLr50t9FhyUzgyBcdizWTMf3+sanXGG5IAWjB/L
	p2fIspgvMah2pTa5ZfeZZ2jq6K6LnL5UQGFcmD6/H2fiJdrFW/jmabF0zncB4gwZuQklyWUOdxQ
	QpXHd6Zr8NHS4RTAmp0NdE4XldwIuXmo6g+Q9atlbuTKuzUUmVkzMUwBA7iqWbB2Bi/O6BnPAfF
	4XMSua3VTRTMPjnrTxj4sM7hefTJeGOY9B22ALicesgwtyAMZzwT+NSSW5RWNmmUR9VoPaDjNK6
	ZO3Vwz8HZQnVlI4EYOAZM9s02FJs+VEnaYic=
X-Received: by 2002:a17:90b:57c8:b0:382:1cf1:a0a6 with SMTP id 98e67ed59e1d1-3829f5eadf7mr875870a91.24.1783110962220;
        Fri, 03 Jul 2026 13:36:02 -0700 (PDT)
X-Received: by 2002:a17:90b:57c8:b0:382:1cf1:a0a6 with SMTP id 98e67ed59e1d1-3829f5eadf7mr875826a91.24.1783110961759;
        Fri, 03 Jul 2026 13:36:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:31 +0530
Subject: [PATCH v4 5/9] arm64: dts: qcom: shikra: Add A704 GPU support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-5-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=3495;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AFPL1mLXpKffrlVn7dhyAuVw3rCpzngGAE8+zg6xtsE=;
 b=ZlRr5sWqKb8250Ap/ksWBqpMq0V4lok4Fs/7+kMo7z64J193DYFwpD+3fTzxPU/vnV3Pvpcyi
 v/N3wBxCT//DPMPx7VhN1Xd25wRLqcduWT3dZQeV4ed2hEg3ZXl8MJg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: UG1WIjt7w3ky8PLXL9ui8stHgInAoCdx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX5S6XK6jm3oyS
 PSgI6ouFY8mHivKRIz/o9hbBvDXViyRf9gnG3b+GALNpO81fbeTUJGUyp7vRGxBWRgZalqNxPP4
 PGuVMy/ZUgBSDqUxtq/orcIVCIwuRkA=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a481d32 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXwhCnIHL0FB00
 EPX+Pzj2876+lvBLCZBGZfSSlii6RW1eyArNHr/NPYOtZI7PAq6QR7IWDT33bbjGX5iBlPszFeP
 mCw3K+c2BI7oijwR/fWKnb0fyo+sAew8F0EDAynJKpMa5cjDrAKhhtcKNHD3Sy6vB2rCnu84IAr
 /mNUeh55WRFLf1dknIV3Tq0eLyREdUDiolSkG7qTOJGCvOZJ5h0j/gF9CEwosS6VgJjvpd+q74x
 U0uwNnZ/C6sH+k4JCTYwaADY1REyt8oeZnKeT2lwi4rWIfEXx1Iyxsq2nmS4exiryfqj5kf+cU2
 1VYaWygx68AZCZI5ia2Fo+sPQIU+j32fMrnvmeLf68YKaxKrPBQY0D5UKmX54hipMJswkug+xIc
 6D6bqPrIZHvqbKjs9RAzAE5e9LhKLMXF4O0rMt5seGffoHYoIEdzpJAtUIe21FH5/uIwfBLDDAD
 pv5eZhkkur+RDDdUxrQ==
X-Proofpoint-ORIG-GUID: UG1WIjt7w3ky8PLXL9ui8stHgInAoCdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208

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


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C60143B3C7
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622594; cv=none; b=Z3qoaVfIweCg2undylM+Zuo4yWdCqCiYaWmme5VG4lmVMEXMWK+8nuj0VJY+gQAsL3Z5Gs8fCxUr4fYuNdd0ypW59stssfUYM8Y0VjEnbiJjkinaDO1empLqKo0ZOxrzCtCWHUX5q7c4p6aB/Zz9MBBCqYcp7YyZ1MnejPfsb6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622594; c=relaxed/simple;
	bh=BghuoPAEZNaeJMJPKdJFsDVu1LM7cTUOvUNAAtZ7DPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DDbRGlrpW37BmNyz/A0+RFv3z7r94fRJQOZ1JAa3zv+VkcFKKP4WISe7Nk1gDxYXq2JzE2LsI3K12Q6BQMj7BSNyfDQEUfA2+FJzqeD6UhvyfpEdCJ7QcokT3bEzihCc2GIm+Xyfn1dMqVT01Qu/TL28Wq1PRf0LVdxXwS9PfcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yr64cHKx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFqEE4Qj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yr64cHKx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFqEE4Qj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXBip2327902
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 18:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=Yr64cHKx2hYIcvXe
	23qMLVYQYQjimgeW56vjD2MNs3ZzA8c2CBI8GfDJhERElGzyCBvkOMB1h7wK1Ydx
	AMjl5K4t1loPPLIWggmRW6d+ZMsz1M/pH87YN4nX6YjIoQETLejy3YLdK3eN9bhH
	QA6ZIBnYhld8ocJ+bTjhZpS2KhQ26xVmhRk+yw2weltV8Z/++RofZkaVNAwzB2eQ
	BquSxmo67+ChX5W8gQvc0SWRzGhn1GnjncLx2DlY37Fvwm7R4uJz1XszME1yvMOW
	ZI00+PqI+jIGcuEo/oVw6vZexs0PM66Snyv6aGdWHdoefkyQ6rHbXtcMtAF45dUS
	z0xWdg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24rq39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 18:43:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3881937456bso226572a91.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622591; x=1784227391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=SFqEE4QjVkzKEMWJuHxzDeBPxg18Lh+i4vbINM9rO7wGXrEo+CTiPsm0m9xGdfrUZb
         L2c8LrEVkXZ+IRVg6ihKQvO4eyexduLmfHtspq+3jttnds14Rdfr+4F2/TyNXYAugwWZ
         4HRDwSJDoO2N3M03xYPXJJDefAlltxfjIjBcKXqG8P6zlpUZTrbXI93QYJGg9nD6ZQb8
         JYW0vvgrZR419DuJq1b42KGNXsMnuK2SvRiYZx+X8ozgvzmt0iYIH4u5U8uiwsunRiYl
         PJy8zElRZKtbGZHj24V4Xk+0+zlcfqTZ4AqSBWsfs64mlKNp8QZSAuDpiKVkj2sczGwF
         sQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622591; x=1784227391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=rAJ2B2rKcxFA8gQbwkz2zM5PpYKVuJ9d6zUJ+aVHNdBNXEPF+ZjRMBga6uT7mbUyYN
         IDhl+GNeO4DKOhPVN2Ae7j1JuE+VZtdxKgB1aZktgwVhw80TikDjo+QMu36Ed4/5tA5F
         7JLbe2eg83Hycs1XU9diJV0i2YW/7ZKPjbYGlH5/eKZomRbbKpy1G/oGcfxoKEdwWHku
         eM0ugQ5OoxAtKolzCZ/GqHFLwsTi3deC5SZSiTGGjNR+yhml5HEdi6692dvNZ3V8mZAn
         at96IPdfkQMJ30iiioLQeiIeWaTkaxWDb391AayfxcJY5zyryJRcXZ1IeXki/NQJwsPV
         GD0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpBNSxaZn2khJ/u32gXQRtbx5O/KXLduD0BXlnIegXBVVlAuixtCEubixpZ3SFAjvSHIa3nEXPPB5Ty@vger.kernel.org
X-Gm-Message-State: AOJu0YyZlEH0+jS7ctII5nI1pf7XQMbMYnQ9vUGgr5UVysKRo8mvBWcC
	hvESaM5UrAq/Km4UtfX77Ycm68qMivnE21VQmwPfdcTb+vYL1f7fAhsTmPXGuM4XnH+lk1IPDV7
	P//Cpvkl4C9uJycBny2fiX89lN3bLiby2c5FIGEIPGPbJDj+4JtubwDLPKX1kUd0H
X-Gm-Gg: AfdE7cmLtWqDMJhzHE3UeLqubZZd+Et6zFsiTGTRi0ms3tdMYsy7APbatchn6gchYN6
	+kxrjtLHoHiiqUt2v2ly8WBahRny/EYw6QE8pIMUxfy2vb++ydUEMydPB3PIg3QUnHZhQ17FLwT
	S/KsdeBUj4rNDxGII8iWBfwPawxsC7VD5Is1YQ1PpmAWoqUqYToJ8ZrGXYxnyGXpREGH5+iZyQe
	OCK4gbpulLxs1nYWk96HC5cthTTZFBQOyPSOAmvpKd9FedLHrZMGxeQ+LEdKoespb3Xcyy4vFPi
	B3Wqq/eleK/RBn3pXdubcRYBDiQ8ig4l2IoKfDQb/pc/1BwHvBs8pKny5yfIb65l6CevQCUL14t
	fF/ZJ0CjzqaSchM/FDJefyX4YOeG9c7F7ezY=
X-Received: by 2002:a17:90b:562b:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38d1596cd89mr399539a91.16.1783622590619;
        Thu, 09 Jul 2026 11:43:10 -0700 (PDT)
X-Received: by 2002:a17:90b:562b:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38d1596cd89mr399511a91.16.1783622590143;
        Thu, 09 Jul 2026 11:43:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:04 +0530
Subject: [PATCH v6 5/7] arm64: dts: qcom: shikra: Add A704 GPU support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-5-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=3495;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AFPL1mLXpKffrlVn7dhyAuVw3rCpzngGAE8+zg6xtsE=;
 b=tacrVztp9Jm3lWTvjjWw+Fn25POssjiE+J5DI8nPBE5GAX4Ro4DXa/HhntJJc+zyCEmRfs1LQ
 PKX6hvgevKVAd+LXbcTmBLwciCfuu6XNqjkJwaY5W0UAJFZrhFyYmNK
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 62YBAcDxy0kWzW51xB1KNA_CVTUTif2l
X-Proofpoint-ORIG-GUID: 62YBAcDxy0kWzW51xB1KNA_CVTUTif2l
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfXwE7MhV3j7LVx
 BFRZ7ZvQbccbYA5R8LdmtZSHrYUoYoKJv+KkJ5lSljns1TUqLoSMcfbcoSWyEa8kQ40UnfWq7HG
 AKdqcilS2ugLlqSVNUVq0Q3AAcdfqkw=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a4febbf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX88FOOBKVH1fm
 j7zJiTxXFp4+Ml1/iv+Sg4OZkr1Dbowo+4AjAZ7e6omp6PZmqrh+I0gAEJghxHQh0H/Oyz1d9tD
 AFU7BNusKIIiw+C/nAMpN9tXRwseixErqSRAYK19eQC0HhAYGHhD+lVbt10P/fovgEA+MB4iCuj
 h2U+i+vdZMnzRQ8D0ZN3BM38IaTlG95MK028NlL6+v3P9lecW7uqsxEnF5GuSFcJa0WTszLe0KU
 y9V3wx7Majw5E+4FIl7e1u7YhPJB/rfSaafTAtNdhDBBhD8G6z86dFyAFHgtIbIawKOsG7rWCqy
 psnDrr5oPINXSA4MeLAGhUp3cKn0Z2pRN8znReR6GVgNhWhX3BMslplooqagyXMp+tTiQTGDJKb
 qJwPdTEXrHmAIHDkqGwLSnGkgFgf9sCDIU4/JZpiejHwLF2vXFaolmpb6doPHd6Cvfzli/ws5bP
 Zm1oqEuRYqyj2YD6UEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185

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


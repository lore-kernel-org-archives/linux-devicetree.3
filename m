Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099B03033E8
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671109; cv=none; b=Z4ZCY5WQgJ3ZnS42uoil/S13zj4aGC+RIelGi/C1UH4BNacybJwFInhDtP4XvUoJuxpBwSrpp3TP2CQyLzUPLeeH+qQ/0zN1reBwziPeEc4rLmfjtk8VNdNmcYIZOJ7TbiliuZUiIVso6RAb4pprpfs+xD7ya0NfszzdpFlvm0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671109; c=relaxed/simple;
	bh=KiQ1l1ncgJCQ6Ugven9VjtURkvNuqAo8RkZ5Qz1K/48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VcO8iVN6Z1XbfjdlMUODfGugkYPD8JG92BlkGKDOkEdS+/xRVDLNJ8RyNhMiVc90EuoLbNs6mWXrIEOF3/5ICsbhd1ShJbMzh/KO23LcdUtI+adaO+iMbEgEexzjvLyliV5EZAFCu7AoKS7PqBMDHPyDn/ylHl35fdZsmQ7prd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZgboEVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVLYAdG+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZgboEVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVLYAdG+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHj27v425714
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZWd8W5XX7/HLNdwSpAX6KBOEbdxtoiIAFwHFv69UFQ=; b=OZgboEVuxMcDN85i
	Y5Ji1oWho8PfMGeIZdEbxjJ5YhcbiRGlx1BYYIadY0gw1ON+y14UyGDxP9tbV0PK
	HQi5qL1YHZkIr7FkYaTYWSeNBj3qEUFlot/67+zbO8oIxIVTMh9LdMwOu9rEElbq
	ikEo/IyDHF8/heK0jFMc6LViM6UUyaTbh8LxyQ/4NTmczhRH5Ry/8SRzS9TH+uVS
	NML3evCLmknzYfoGaM3xtTyHWe9PRWKTydf7LxMGmXTnO6pBar/pudLP74K3sO06
	d1eiWBjT06OBmioiovGWr0jppBEvimC0TBPwiNqkR1O9ObmskJ2f2ljbZFoInebQ
	FD0Keg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27333e8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:25:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30e85f5bc9eso4247469eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671106; x=1783275906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZWd8W5XX7/HLNdwSpAX6KBOEbdxtoiIAFwHFv69UFQ=;
        b=AVLYAdG+l+hnfyDfPguuNxI4VDW2rxQPFzPFCl7TQdYZvJ+2XYDyCCTCpFEoWh0Iua
         8tkIf7qGl4ntzBz7vULepY+xWE4Q6shfAvc/MmnUvewzxXZ79JnOx4bRsBDk0oeF8nGM
         8+G832F84X8kVU/XBnaoTWSPWL0ay282X7491SsATSfK0ntqvhv4fAUYccq2YxhSb2Cm
         0Vgb12y+6rI+EFETEf1TYcgq9aHb/ZM+9Zcu/K6c5kkmsi81bgqfgoM4fhFVBiI0Dzm2
         Yeql++ys5zSyqFOBax27P9mm61K94yr7AlrEfAbsG2tU4Yo7di08e6CaZv8Wmn0aj0w+
         Zj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671106; x=1783275906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZWd8W5XX7/HLNdwSpAX6KBOEbdxtoiIAFwHFv69UFQ=;
        b=kkhk/K3qUcdG963XAs7DQFJpgzxuq9x90m5LANOkDPc0bhOgrSYHdcFCcks/3RN2hK
         QqcN97DAOqRSyR69oZumVPHJEwz6wO2iedlGhTrSr/bFUrG+1D0eu5hci8wwJNHk1JYT
         q1N6tKig7XtFyARaDf989SYWq7c49JL1UwtYSZiL+hSls6QEvgrF3rlwsEINwoO3ou95
         d1sj1NCbBpHq/ezkHzyqmBvta10u4Faxhfw/lZbMhyF3OGYw8vxf52sBeJJW4nahpqfV
         qSp7grzWydnOhOqVsr1oMSLzeDXS05QdZkQu26RmsCxA+BLcuNFeTNrENIWOVd4H/41R
         m+zg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4pv+nt11gDq6nH2p3hL3PWgIABvnNDZFzHDAkIoHX0EZ6jI7r59MiH+vxDoV3FmQpOVUXCIz2Pobn@vger.kernel.org
X-Gm-Message-State: AOJu0YwsVVr1kPmqsNU7/M0ZU61n0e3VY7zsfK+R/7V7Gq5+ftw7+t51
	IC9VNFQOdEbkImg61a4qD0QDdxMfK5yb073PCBjjk6WlHEGw9cpSnshR3s69XYEgZbrAyu33FDI
	Llv2oJO2/Wk1EQlpbJd1hsEE4Nqp001zdQ8QCdChJE3qP55whJev6cEbWeWug0tLU
X-Gm-Gg: AfdE7clE+2tEHR75QMBLRAcopaaDuCS/vOpsVZS7tnldomB1MArmDV0N7mkvX+TC5HT
	afY2dhmzyo00GEXebyLFXkYL7X/2DOUKHP7KmeqeUwtvB9eatuN3noXNNJ1kaNm1v8zHD1RRrdG
	tLGTne0n1hFceaOfb/L4nYWz0PoonQRWTE+37bgKvSKD6woHhHsV8xJjOBOpoHuJw0EbaoCdzPB
	rmC5SVV8fs+cVAcrH+MghJ12wOOlwZDspWrE8uC+lVJpKtqHohBthZHQ69NIUe14xmPBfVi8LZz
	3jX2m7tMrETyIN5IXHeVGsX5by+iDN01mnNByP5znpps/fTmE2h1Bfg72m1PtXE6RTJG0D25VF8
	75cBAqO3xedCoDTtHcv2ZfXInw/gdZ2nWJoc=
X-Received: by 2002:a05:693c:6383:10b0:30e:c2c0:a7ea with SMTP id 5a478bee46e88-30ec2c0b39fmr1605937eec.41.1782671106002;
        Sun, 28 Jun 2026 11:25:06 -0700 (PDT)
X-Received: by 2002:a05:693c:6383:10b0:30e:c2c0:a7ea with SMTP id 5a478bee46e88-30ec2c0b39fmr1605909eec.41.1782671105369;
        Sun, 28 Jun 2026 11:25:05 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:25:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:58 +0530
Subject: [PATCH v3 5/8] arm64: dts: qcom: shikra: Add A704 GPU support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
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
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=3396;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=esFO/JAL5nI43vIKxxFbdEl/5ME/PRB6OGuZfuTuB+I=;
 b=cVh4g1YdCpiwy7z9vQ1tG/9H+36qvoH8yaJMvnRIf/86r21odJv0LC0eJ6esfGD/OIpgsy8dl
 bSGuHuQPLv5CJuKWNam17yWd+3YB9Sd4PLC20Ocorpubqx9Ndcb9TJy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a416702 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: P09mrtQmScYO9WBT4FXtqN5pYNwsSrUi
X-Proofpoint-ORIG-GUID: P09mrtQmScYO9WBT4FXtqN5pYNwsSrUi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX/2HRmwM1YlG9
 7Ndk6zz3h55y9idnGSI7F5VPVkOh/2LusFJPF7fBV+9jF8TfnaSlhIijFB88DDh2bsHLb39CP+h
 y8ZT83GmFweRL/9Nos+112m2gQ0rBqp3SRnaTxqEdwUgI5gIoP+oXpw3wuv7kYP/09Kli3MEI9e
 Xsa1o9uzJ7nXoMwT/QEH/D57Cy5dljmBL+BFZh/S3Aasz6ERuLg1/kWrIQyNUeyP/9lUAuyYpMQ
 NuVQKfqtrk2QRVOsnSKbXe8K1K8hGhQ1Dqowu4aTjnu9tRkmmrvZX42krHz0MHLjI+6NxAsv2iU
 gRtalZcxmWMktyNg5P54omDH45xuzoETYLDPrWp+mmQKRkMZP6j/SKwBihrGn18uQ3+6WV5I5u5
 ayRnSEBt7cLHLJDz6le21lp716SCsJitbP8+Ho99doWPizdoCK/l9jx9wOxprRHN3eEZBXw4oug
 /F4UuHioAi5CJg9AFAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXyYXa7UgTfwv8
 fXLhaVL6utWuSo2MugxRXmaYcphMfRrcQ9ND8DRnyQ9eztLA0ijfvNpmg7vXTekTt8FG37mcbdQ
 g5YipbHtjwXiKZaZyYnMfOoDFMbJiQE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
interconnects, IOMMU, OPP table and the zap-shader region.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 98 ++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 398cb1a4dc86..89cc5dc767e2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -642,6 +642,104 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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
2.51.0


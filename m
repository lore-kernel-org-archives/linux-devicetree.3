Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C085389452
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131328; cv=none; b=jCcNblu/YA+XER5hZDvpSw1mxvxeAO6qRvCZquD1KJZh/q3Vfq627RvhafN0OaL3CsjJRSZ5V53HhX1mQFJpxakKXcIOTwvBDFTjZngxXJ/MbrJCh28J7p1M23X78NRaYOoAMNhadn2G8mxQM195+uHnEXorAqS+0eQFCGktykE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131328; c=relaxed/simple;
	bh=QPQurn8wyM8yfsOn+6HKwoOwGyjVC1Ms9RUafI+wxO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KY1YbFthHToL9ITbS/ujHtreizmEsYBFp5J4tq6VDqa4mnW0x3gUNS61XFlbrn7dxUg9n7qbAejjGq2HaLNoQwkVdxWXv5wYX8hpao+sO7B2Jnso4SOGnGCZ/sLbtHhZYrAV5R7eKZrrmubxIlLcsEaTF9k0U+0Dyk4xlChQ5fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAnsLlmp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIobdwRe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAnsLlmp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIobdwRe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MN7LQL1529809
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IpaPFIt7znDPfPmnvTWgNacj8ocBLqca5+NXSpghQnI=; b=kAnsLlmph31clxbe
	s71AEul1HNzOZdjCHUA8nHGZV7AuTno/T5iTulqKLXNvp6OsfRwVguxxNJDjR9IE
	1esuy2Alxj3A+HoiEMWwZKuMIkBBIn0DDtheqR5iqmXVSP7cL/iA+sJt96+Lx4xH
	jQX8dZBrtjpPZ32Jf+vMWh75KS1klNBujgZqJ8NlM7EkoVVjpkab/6T+mXo0lGBS
	LiTjbDvGjXGHjU5xdhlpOeUPVrOOb2MEJM13GS5KEk707pUjpDC2XjIn8YkehrBE
	kOeUEIabO7f3wT2BGoAF+XeMlg2ZRNaPsFAI7Z4DQDpIptZ7qHhvICgZDXv+m9Ao
	btBQrw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qrkx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:42:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so503142a91.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 19:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790131324; x=1790736124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IpaPFIt7znDPfPmnvTWgNacj8ocBLqca5+NXSpghQnI=;
        b=NIobdwResq6l5mQuoAohHYjVh72SxeDWANKwjIArvhTUaB0cEzZnRQyddLwN6Waes0
         Wy9chD9aPTNs+1xXkJYfqb3nT6Sz9DWKrR19440yZjVRxJuCtceQX9YNCoVdZ3q3l+gC
         oz3wH3/t31MuSBDkmv0+6WM7ufwvp8+a45nF79fZ7Yh77GmW0Zaa0lhvPDyhSB8av5fK
         /xlQHHmTDObUUNZsm1gB89LwA7W9NxLrbsqRoBDKmyVhwS7mpt+v52pDuBPJ2shAxYkB
         TpkSy+kOVLEugKvKXXia1FSc7NBmlgq8rMKez7VCipAEdZiihQpr2gdsK3Kc32yJMwPP
         tAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131324; x=1790736124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpaPFIt7znDPfPmnvTWgNacj8ocBLqca5+NXSpghQnI=;
        b=kHgW5ZBhI3rNTXbTzAFGtdupIOG5QUNXU+NLAeZ+NWxc5oNEkb7fV0lYjiEHmwjrTl
         c6R9SDdYh4//uJZNohFK1MQ4CRFvjd7A2zDn/EoASgtSaNT9YFEWYsTVBhw91E/UF/Z4
         cOYMdWQBTIMPk0ERJBe00MFTEkzfN1atp7cjEoo1Y2t/zGgIFopytT1EuLWpus6YGdpU
         z+jEdVaTgd0rBzbYCXuujRWA7hsk51coNiv174FONiMIwYY3ZO3pwAWFVwOI1F26/fJC
         StOzhbOIDtuqn6vT3rMCPYDY2OE2yMGVa/H2511oiC4xI3r5iaGVi9AtR3iAbr5poP7/
         KAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzq9vlZXI+VvIGywsxVqKXPTYB4pxVqLYwNvxbbOhkA5LVyDru+WnpYaCxBPkQcspizBlXVHg9u02oo@vger.kernel.org
X-Gm-Message-State: AFuF++macHcWrrxWW7gVJAJfQWGPAKesFU5VE2YdJpSqEeNvsnD54dnr
	CryG2ghIn3YAA0U7+lx+4xvEd13RRACHY4dKIOa4O6psLVSU/pZOZ2xoldNW5i1uWoqzwM5TKd/
	ukCztV7hYDPfMYUcnlDRpdehaivf7zwga4OAaIgIuxqpITy11e1/+IOHDO8G+50gG
X-Gm-Gg: AYBFou2FF6XSPkc98XXDKAal2sNbjGXA9xq3xRwTSMv5S86uYYPFo7MoCQECNFG5tW0
	Stdu+Zn7pJ7JAo3ILWeIsfDlOjipUOBHEOK/Qq92wlWbZlFescei/MNtcWc8nYz8GPcU2FE+tzr
	4UbIA2UxP85/sU/zQL4785tZoUPqygRvkRT8IZ4cm9AURXtzUuJJlskXH0Whps9NXycwrYRYG/A
	KvhbBoNZuWkzoforyunekK7X6nIcdez15grf1dLD9LgJQ+d2p8u9ErpOruoFQViwvXN0AwZlToe
	MBT9PDDekKPZrNv1vh5tLYF/gr8oOAzqwNjMl8A368dgPfG97DgSPMtmZlUOLYvXER3htK4yBNC
	jTELoGeLQQaBGwhTIdx0A4bJBdsM8VeTZXiZz8hNPFbGZMDBv/Ej3T5xyxM/UYHTuLFUGZkhlBA
	==
X-Received: by 2002:a17:90b:1c8f:b0:39e:4c80:f67d with SMTP id 98e67ed59e1d1-3a07e5f0054mr1111807a91.28.1790131324085;
        Tue, 22 Sep 2026 19:42:04 -0700 (PDT)
X-Received: by 2002:a17:90b:1c8f:b0:39e:4c80:f67d with SMTP id 98e67ed59e1d1-3a07e5f0054mr1111790a91.28.1790131323594;
        Tue, 22 Sep 2026 19:42:03 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2102026a91.4.2026.09.22.19.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:42:03 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:41:15 +0800
Subject: [PATCH v2 5/6] arm64: dts: qcom: maili: add iris video codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_maili-v2-5-7223738e330d@oss.qualcomm.com>
References: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790131292; l=4558;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=QPQurn8wyM8yfsOn+6HKwoOwGyjVC1Ms9RUafI+wxO0=;
 b=PSMadDqZFJLc+5rBsQE4d872sy3zJ058vT8gW6DW78+RD+lWBcKiptBIoIMxp0mMTdaMLaWps
 4/AXZSsweRZCNd2UJzNkbhMgsS7GqfMLvTiMjCpALxy0xRx5BYv48o+
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab33c7d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4Uxp26bCVegRMv0i2ZEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: vaKkrQrcp-nvAEdUAmJC8gYU_0RxVTMz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX37RhVP34Lc92
 00vOwPqj/hVEBv2LzTqpGnVEMaoKceMWyoEIN+6GDq7/nOc0Lu2cVyzFVb2H01RNHAcdFRfyFR+
 M9SiBf3LweZaORDa0qWOLODdI0f1BN0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX1ukrRVSoHIos
 Q5QcoOVaRE3j9vxf+N1JLfIAVquk/fkEuI6TmzAIqAtokjdldSf5bvygtuvKUOUy7X2Iy/xfqo2
 mOM+Rjm/qTntnSsyxPx6ManSb9cQwP9Pp6fPK7fWpqP/qdaAOV1lQIxkp9SVKCvellM3FxRdq+n
 pvU0KeQXI79rGxDTWEQV5zKjld19Hdwcr4xas1brkMpdChFvyGc2lvvn2STg67RvWeX6sawEVWW
 wL4kQqr/fdLgOP0wIZA32L1rC8/bWr8yukx5RtTBPE3QqXZYQpzqt9o68I3wCfQrsBZ0gAq4z4t
 B9SzuhodPz+rdev74HcADB0GSprDu/4lo9eYi1vPy//XYpel38f20ZEUfOKKTM0FvupbPbCAgC3
 BaiiSIMqMljuxSt7Ih1MvAYQJodXFhhAb9k+G/avAsa4D3ft6MmZUC9+2fv9sy+RMHQ9FsSZQ27
 VFaLs8dHoxEMyJiR5Vg==
X-Proofpoint-ORIG-GUID: vaKkrQrcp-nvAEdUAmJC8gYU_0RxVTMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230010

Add the iris video codec device node for the maili SoC, describing the
register space, interrupt, five power domains, eight clocks, two
interconnect paths for CPU config and video memory bandwidth, IOMMU
Mappings, and the operating point table covering 240 MHz to 1000 MHz.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 126 ++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 886d307e536be6152906e344289d5b3fb290f0a4..3d9792915112554842256534ba4b85adf3a1441a 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -3591,6 +3591,132 @@ ice: crypto@1d88000 {
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
+		iris: video-codec@2000000 {
+			compatible = "qcom,maili-iris";
+			reg = <0x0 0x02000000 0x0 0xf0000>;
+
+			interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS0_VPP0_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vpp0";
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0B_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core",
+				      "iface1",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec_bse",
+				      "vcodec_vpp0";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "bus1",
+				      "core",
+				      "vcodec0_core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffc00000>;
+
+			status = "disabled";
+
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1540 0x0000>,
+					 <&apps_smmu 0x1620 0x0000>,
+					 <&apps_smmu 0x1544 0x0000>;
+				iommu-ranges = <0x25800000 0xda400000>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1543 0x0000>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d2>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000 420000000 630000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000 533000000 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-630000000 {
+					opp-hz = /bits/ 64 <630000000 630000000 1104000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000 630000000 1260000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000 800000000 1260000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l3>;
+				};
+			};
+		};
+
 		videocc: clock-controller@20f0000 {
 			compatible = "qcom,maili-videocc";
 			reg = <0x0 0x020f0000 0x0 0x10000>;

-- 
2.43.0


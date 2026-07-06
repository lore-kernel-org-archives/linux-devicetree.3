Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7DA3803D1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374080; cv=none; b=krcNlFGd3Aadkc8VuRzUVjapwo+nDf31vkWfs8IcLINoWuedqqogr4w3oBxuN5gFYuiHzQFB6yh6STXWSNXkpQrzS/H9xpWynjtpY/ukKzin2fkeMvQHn48cqVRc9vYdp/kvPg6iIIbuRqpCUwZsxv5e00UZ6fQaM7Bi2+vS1Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374080; c=relaxed/simple;
	bh=CPu2xqs9e3R64JRB1PC2AvRPbedbXmd+QnAY1ScuJSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqWEx1u/+v3AA+YRQTDOm3eZeujp6U7jikaoiVuhf2G/KgVseGGEYyO7dOkBCqKMKRfKpNGm/w7ZEH6wQhwh0DnqhJH0qaVjMdz0QjUe3CBzizUE89GWtxnzX2PNxGladgTZSnQyEOP37gsEyRsQONHk/DNclRL+If6i3mBSuLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nA90DhtS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivOc7zpN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nA90DhtS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivOc7zpN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEMhu1639963
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4bb1MYCJKp847vDLld6R4w1OeEzf9CmRGUvqkPknJ1A=; b=nA90DhtSxK29sVIR
	l1pDzdTyKyw0AUfd/wA393LEfCUYoWshsxCpLvbMO+q4EdRBSEEWhqXFgn6FsADK
	yXykI9kwXTuqVgVnp7fGvrkHV3xjYSUb8pw7Xr9385uWHae+yF04j7UmWydr+sem
	+HxBYv4yMJ/82j2RGF4TDhL5Orx8H9HRY973jbY5SoIa2FwQW0ik4vIPF5xmBe7/
	qLyMrj3cFSSb0qmlNLT541KfdCfqw5Re1sJbFpA251u/MhC5KAh0JHhFTUsvhRO+
	DX2uFpgOWJYuQ1o3x9ZgVrR18XxSFVuCnlTmFEJjPZ1//StgNAJqt2GnUhrw8Iqu
	9YlSHQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2yeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:41:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cac01e89e3so460315ad.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374077; x=1783978877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bb1MYCJKp847vDLld6R4w1OeEzf9CmRGUvqkPknJ1A=;
        b=ivOc7zpNWpt0GUZP3x+C0oc8J8ZAqHb2LrUQaML/GiGe88POeoaUjdpd81dqxBY1vb
         XoawNasHmn0IdbAoiqEdatTW5nQVjwaBU3YdfEafdKpESDOLkdiban6D0uu4jPowMQNd
         o7jlBlKM/+2bDuDWaGRBRJBusqz1HyVCpqPsuovrnEkK9o3uia3R82Zd6k09CiFLJ9ow
         y+gQ5DzAbyHWOCRZ+KxNHKK+TcAIARg0gtWRFHVPa2WJI0MBA4cO6ep7NNoRVCdb154L
         /ZsUeiOFBLuODdr4HOpZy3T0L4S+6AkvDXEfqdn+jqiS70LfX9dyLgFplohOTStdeBYw
         RcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374077; x=1783978877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4bb1MYCJKp847vDLld6R4w1OeEzf9CmRGUvqkPknJ1A=;
        b=ae8qGyYl8nXnJra8jNtyq/b3caMYutCc9/ckvfJ/uDc2dqEv/OO88gSbIE51N8lyki
         dhBAmr8kHT1gnfs5NcCWOM7go/s0pmStfkZLwFSFiRHeTaGYfNSZRxAS552EULQWzK9j
         /IvhA/qvwa8gK9l7Hbt80IczAk0sFe0h+642TQEW+9QjBH2CIple7Rf2Pd7ZtcT87L2R
         hT8W+9Sd5JchAnRiFloblhvznnsuQJRmf/h501JYt5Ndo99BBsrnmQLFkAyM5ksNlcug
         JQZC8KVuedliVke2F4APwSJGaX1NvrIHlzDTX63X1VvtO8t38VMw4gEGMioeUBa0kt+r
         W84g==
X-Forwarded-Encrypted: i=1; AHgh+RoZu461qiBhbC6euEt7U2QLF/uLrXZCO+yioWJFDlxOsGO3+3XLk23iL9KBTBI9bDFeOr70rpCztEBY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm4AVixOsfTGhbn64b6EJ8pGIT8TCeuB3INt85AxDGCOr3IrFK
	t9gIJgjqH4DpSq/Fr5FTux6IMuW2vV2sBQ2FxS6dUTOw/+m7O/ptSs2jXXrE8OwJytAHpVMeOma
	008vbfZpxE80Iz/8IK/7I8b0SdPSrjNexu72c2LcVRayH8uAY6EJl21fNGHOj+zR8
X-Gm-Gg: AfdE7cncaZmutPSdEmvdZ/uLbAwsVQ1rkqoAAJ6ljVq6YX3MgEKmYsJLU3GZVVWhrTO
	DOM/hRaX4j4t2eZuG1l5jgfuh36xW0G0aPMTDX//aoXev7ee5s7TmzdC+/yicMiQrJor9q4EPRa
	jekVT4S5KyGaf0PjCB4fIUd5yoxYbBD0HUu5uVc/pwBlz32P3s6ipFUbMjWe7+CCvarxxa+DRZ9
	Ol0qk8EwUd41DZ4W/EsRacah/rrGmv69qQELgjeYx5c3Dqh2KFfGG8Rd/ChzeJe2tmpYopFqf+e
	Hs6azADg5VpFm8bOHtZOBaDhui8rqFyWEV6hLQ2o63LusC8+s9zN+wn1BM3wgsZx9EjnMGwQQ/A
	WyjL36OPWgXXuwpons+izK2at2SKfSWOl0+I=
X-Received: by 2002:a17:902:f788:b0:2ca:f417:396b with SMTP id d9443c01a7336-2ccca8c80b8mr941785ad.3.1783374076497;
        Mon, 06 Jul 2026 14:41:16 -0700 (PDT)
X-Received: by 2002:a17:902:f788:b0:2ca:f417:396b with SMTP id d9443c01a7336-2ccca8c80b8mr941375ad.3.1783374075943;
        Mon, 06 Jul 2026 14:41:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:15 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:22 +0530
Subject: [PATCH v3 4/7] arm64: dts: qcom: Add GPU support for Kaanapali
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-4-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=7741;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=CPu2xqs9e3R64JRB1PC2AvRPbedbXmd+QnAY1ScuJSk=;
 b=b8hcpLOUBPyzdO94qCDXmlCoK/YoeV7hzMm87PlsJ8AuSJIhCOjx0yrVrdq/rr5jTl+Cxnnyk
 qW9BSBn25kmAGG/fzRxCw5UNzN1htC2PDlexXl3Vs35XWIS7885jyyn
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfXzUNM+gHRfHGO
 6NWtecbLk6nt+5AdY77LuthVGlrlzq9o0kMjpVGz8uKWLjcim5ng7c2PNXIkCU/mIf2QceAM79D
 CaohlhQSGjuRLupJEGA64KhAUFHcSXQjH4Dqq3ZVVquBzF1QyTrAnqtMGkEqcPsMJjs2yz5Qvbe
 ZcQIZZDjXA9mg4KJyAAzzt+A7PbPeUFry82lgjoZb28h0TI52tzN4v2N63CF9jMW8tUkuMlkK9V
 AsLi0+hPJhYxLhiplo/PxO5BrviG6CNm/k/BD9BA9zW9D7O/WZJzAGVFiBnCJnvHHPxn+Fx/1uX
 1Yfcg0yAg4e5tDMuXSdIf7hJutC7MJa9GiCHWGDoj50OTt8ZRIe8+eM05shF/2l/acMpX8BYPUn
 4xW28ZmQWkTnm0mkb7vQ/W7plE/CV9Gx+FZ1070Aq5cDvOXlq5WR2DLECmCZWKbdoo0o4yfufOR
 LZQX6jWSku2tpz5j80Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX3/jVVQ4k/opq
 YsiJCu2XNgHVFGE2ncWL9TU0xjGVV3vEJwJvAjzjgX8j5aRsWFnxcMQmkaoadAPEO/WpV749FGm
 JTBul5lcwcG7VlRLivVmV2bCdsOIsQc=
X-Proofpoint-GUID: tCJTlaOFDWJXLGMDt7MiaRPLyZhl8xp4
X-Proofpoint-ORIG-GUID: tCJTlaOFDWJXLGMDt7MiaRPLyZhl8xp4
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c20fd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=N89IwGAUvIjX8PsTpEAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218

Adreno 840 present in Kaanapali SoC is the second generation GPU in
A8x family. It is based on the new slice architecture with 3 slices,
higher GMEM/caches etc.

There is some re-arrangement in the reglist to properly cover maximum
register region. Other than this, the DT description is mostly similar
to the existing chipsets except the OPP tables.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 240 ++++++++++++++++++++++++++++++++
 1 file changed, 240 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 2d0db71cabf1..cce2e0a3f971 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2577,6 +2577,246 @@ videocc: clock-controller@20f0000 {
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
+				opp-160000000 {
+					opp-hz = /bits/ 64 <160000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D3>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					/* ACD is disabled */
+				};
+
+				opp-191000000 {
+					opp-hz = /bits/ 64 <191000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2_1>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					/* ACD is disabled */
+				};
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
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
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
2.54.0


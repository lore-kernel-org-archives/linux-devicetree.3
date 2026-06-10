Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F463812DE
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073084; cv=none; b=YjWaa5IMaLI0NUfKxN2O7GpXUIdwnf8N7eqUJlSSFHbhi1q3HLGvt6ohStL42T+GI+9BHgpYQJaUBaSuBSIwOlh9+TTWTvHj6I/UMUdakdEHH/C4e+Hy9e8NNjz2nYBwQgRDc71HHIbCDFB786PX/Fuye8vyajFUHlGJaQBi6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073084; c=relaxed/simple;
	bh=rcTcJpE3yUY0hhm6BFw1uxVSjJS5mYu2YiKIJn49g0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VYWy7tOER+nDXCd5rjFyO+gT252Sg1pK1daja/ovXPYXJBHtehntd3qkQwwAXzuOHLNFykxAC9Rlnk4Vb258HwJw/CdEUe0BHIjTefA5FLqKBeKaNqHDAB2qjltkXRreIR22eC0FiWzAdBNz2H+9jBIxrXm5Vl8kg5/X9g18sAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g35Zk0vg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YnZKO2xe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g35Zk0vg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YnZKO2xe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2f7nm323941
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+ow6PHZ38D9xAFsmHnbWI7u94qafZAXWP1UyjrDZ+Q=; b=g35Zk0vg7iU/BpzS
	O5fKtCwwjUn3F8hCEF6VYLiqgzBcnu7oWGR2asiGBQcnYKEjVipGP/7yzrQZ3eM2
	8B95PiK2sL7F9LGm7e7TgDFoCeWOi3zwgpxEsFaMFeSvNRO8VqEB4XssLnguYbMS
	tAkgYvjhVXiutHWRtlA3avOe8jmjJU8DkYOhxNdYVyR4ZledzZtxXdYk8Nxj6YoS
	0TV7Pzp8TBROhEHRez70cpA++EbSnut76wNcBGsMIqG546VM5nXrbua0Lpwym4h7
	au3K0cZ/ycj+0PlanW0TVXx83i+TCBdPNhKpx6DWRVtHPe8IioKelXqxe5kCtoyX
	GhdPxA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeawrb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:31:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso11159591a91.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 23:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073080; x=1781677880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+ow6PHZ38D9xAFsmHnbWI7u94qafZAXWP1UyjrDZ+Q=;
        b=YnZKO2xepJ94EdpCeuPKJw0i6lgzH/vy6Q+Km8SU58mOt8X4n8+SDBNMZD8RZum+ak
         ptCLlGAhJ0aJkYa9TR/2NRQwVqhpdKwQ1oReHpVpl9QrAOnJZTtiu6zZCBmF+bEv9crx
         QOALraDJbiDTQ3dt+YPvN6IDD0ooANnv/35m3UWPAQG6t1cQf3K31fsnshiDblvaMmzM
         m6jjnyNU8gXwxY7lC9GCtskm82X2v8kfqKAH0V2CXeP9y7nVGvjxSjTOHXtootnzvjm9
         sX7u1kvZIo3RqbiovLDztK43hoOKgV0g7QRv45BRD9FevF5AdoARnHAdI00R6uc0JPD3
         la6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073080; x=1781677880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+ow6PHZ38D9xAFsmHnbWI7u94qafZAXWP1UyjrDZ+Q=;
        b=Ew2nRYb9Zxr81UW1iZcH1kmsIPq5DWNcFexS3718pMSS07bsX3uwNY2o1xgJh4kZNC
         tFAGwdQEPukEJOd+iJ24rvkTTnVmA4NXHjoVmAW1mPKrG/1kUA3kMtB0KHSgwm4jhMQi
         MP3X1ejRRiBNOt1i4IY9XQk/9aV0hCpD5PV7DC6kp24e2+w/ZpvE5hNKY/4ygRzXpAcE
         ufDWxn91zZgIgdKLG8955MtnUlBnqH3bZ7fPtvwwE2qPf1rS0Qyr8SZV5ioeT2HmbQkr
         oKrq5Ck1fpN/XHXuNgDcyo59mKpucJPlftaI5nF6kW9F2AZ+hxH3LW2Ue4wOQVdRXZwM
         dyGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xKXfcxUQA6k0uOmPVgB7tAYMtUMz59lWyER73RLMu6o4j+YUOMsuHCh7sCyfKfG/m2vCSXeWpyLkC@vger.kernel.org
X-Gm-Message-State: AOJu0YxeY/r2zhrWyS4INc67fOaEcHn8FH5Ut94ZqNe0BXo+siFtUqwI
	OQFZ3Ar6Bsuuz8pZKnH1qF6X3DQaiuP8lVuS9L4QLunYjSKHKGEwAtl/Gx0eShDwQBRwJOo23ZG
	XvvFscZbjdmmic7J8u1vovhlJlKB4OVL1M9Y+KmkqZwqCmBalZEoAxcKrEeIr307t
X-Gm-Gg: Acq92OFB44glRvHH1fwWIT6A49FaZgiinxdHg3Y1ATwsyLHTIlhv2x2iLLai984Jche
	vsCiFUMTD34ACTG2NIj/U2WfRE58k2YXkA/6xbS3Nok8Vld/t9MW5ruF0zMDXJizGmDTYWQar25
	SN8FeEFfqt6jG2rL900jTN0qTx5WjuG2zlzfnsOWUZ3cbU3D0U3WbFjXQJ7wAueEExrNogy03zQ
	YyBVA791V09HuuEJUtwWkOpX4vP0F+Zc6v0VLMkf2xa/AGpUnK/PEyfD8jRTBPf7Hbvpozeo5kg
	IRUzX7mfnnahSykk6UaQdA/C2Nx0anTiDIx0y1eLhqCxRRYvullfx1oUu+AQ+3+SNqxdpVMo0If
	eftFAqQTzVOpPNOo1qKDptJ+odE3p/iaXPFO6elgClysgN7nkE2qsi9oRRGTfBQ9dPQ==
X-Received: by 2002:a17:90b:554c:b0:36b:9512:871b with SMTP id 98e67ed59e1d1-370eed0b682mr26380339a91.11.1781073079605;
        Tue, 09 Jun 2026 23:31:19 -0700 (PDT)
X-Received: by 2002:a17:90b:554c:b0:36b:9512:871b with SMTP id 98e67ed59e1d1-370eed0b682mr26380303a91.11.1781073079201;
        Tue, 09 Jun 2026 23:31:19 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:31:18 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:47 +0530
Subject: [PATCH v8 11/12] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-11-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=4698;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=rcTcJpE3yUY0hhm6BFw1uxVSjJS5mYu2YiKIJn49g0c=;
 b=WLhP8dSPtgIXOpJAAOfN4Xjiqv7drSdsGLGTvi/pe6540Dq+YvtPdOTo94ABMC+6O06SodSdE
 TyO/p/kkdw3CR/q7PKW41DuU4ilUyX2ad2si7+64vdkTC0ttH9MZi3V
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: wZE3sNT7fkidw0C3ntwgHD2N2E_nRJpq
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a2904b8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=scTG0D64rx7uByHHbCoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX4L0dVb72iWz0
 tUn5OPCttmO0cS8NNO/FbzUlBbjmk/dLGzc7jShJSiV846dLCDRfgx8N67wwuHFEY5FrwsaLwEH
 BTbXnq3R1XBZpsc+x9eLiY9SeLuRooXhamfzsaVL2i1EWdr4P0l9fs5PyCrUSWXVuQUj0cFFYai
 tCBBoLt6e4X/atCBnzcU/Ng1twZxdwAlpnCltJptFsRCcPsAkOJiWQIWi70+3Kq8j+Br6efcShI
 n3+h8XxTajwblogRYwhkHslDTMzceaI7G2HKFubuD7zLoQ7dldOCntoWTmlbP2RxjCUL5gzyzz7
 lcBuqMxgMwYv75RLE8uLgrE3b98+0qFQinbcF6whcT9rXrJBftQAI3j/1oo93SuRtM6ztTdcmY6
 sbG2im/xbdDk1Fn4ODbicpaaMGSC/N44eklhNjYAk7Dc4str0p9K1eDJ9iV27bwek9tEGoEVU8h
 MD04fhyid9ldVSD9KmA==
X-Proofpoint-GUID: wZE3sNT7fkidw0C3ntwgHD2N2E_nRJpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..42bcd03c4d3e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/media/qcom,glymur-iris.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -4788,6 +4789,123 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0xaa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&apps_smmu 0x1940 0x0>,
+				 <&apps_smmu 0x1943 0x0>,
+				 <&apps_smmu 0x1944 0x0>,
+				 <&apps_smmu 0x19e0 0x0>;
+
+			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable on boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1


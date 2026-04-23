Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3045729D266
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951120; cv=none; b=AkXEtslQlOcXnISDWvA3n9/DnZb/6Kt2Mbi4xjG50AwuqhBVMlBGwdVQntnCNI2oZLz7UAnDjB/FEWAmDCgbSrj31yBnG7UclNOPHpVPan8VbkC0PmHahDu4zubH7EqqwB0mRUXG1lvzj8OwSXgjvZLkQoHRqYTvIjDnTxwh97g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951120; c=relaxed/simple;
	bh=AXNNMUqpUBkT37jqrWXRRraxt0+yVQz0nuc5i48FDy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/SBLHzi1qpXKp4LIRaNa7rgctRTMQSkEF6EboF9jHi4lJgz0YiiPPdxEnscrWG7rdjIj1iQaFYzKMfAqRqHepHTLnFsuWLUvUl6R+v4POH62qiKmj9cDXzEVByx29XwYKVv867DALEXMtD38QAt6itZ7A1OpU9z9ePkyrSTs6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRV084kD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j419/WKG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hRV084kD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j419/WKG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NCk9GX3803940
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZLUyV0TSMl/0FUp0kbCXsS7r5z0r4oRuVSRhSVL+wo=; b=hRV084kDb/l3CPAO
	ioO4Uid2AHYJ/jGspacZ3gbf9sXPjEVs2vOZb5mcY+bCIYBVX3xonqPm6Q6NxlJ7
	7sGw4FYqSEYafmsaznQ5CsBvSJ7QenxXQwKy4hWW27+Duf5gUjXY7A2lJfb+rHvM
	zrIgSFlW6BOpe6H7S/rV4LKLG2nKmUcUPmdPujGslIJeHmsP074furtEDriEqwRJ
	Gy4AcbTyhEF6LX75yiHkiY8wRLN7fov5HnL/BLkm20GgdA34giRdV1QXarkhlfNv
	oJse3hcfkZiSU2qgu146VUqnsfBrczOz1Ndke30cillPK1+VhLeZxsgnUR2sKCZa
	fbVorg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqkqfr4wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:31:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b250d3699aso136985765ad.2
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951118; x=1777555918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZLUyV0TSMl/0FUp0kbCXsS7r5z0r4oRuVSRhSVL+wo=;
        b=j419/WKGOlKpf8dLSjT1IBVDmtXNC5tO7soGmVFOg7o5cSAQH2AaIR3ee7fqws7jIY
         HUcnFu9JF/ryLgo9WTnjvBOQest1cjNV5TVJ78Q4nH41RXXfd1td72WNdWekvPyK3yfd
         8nonxYfCEeeIwRx9lATZNMSDd2zY9ulmfvBN3wpKg835mkjgXub0EoiUtneY79pzHezk
         LJ8/dxumjUCGDW0noMZpPz1jjTB6j1zORv/WuADxT73IldbsKh0RT2OUYEuO+pwu3mH7
         qCdD4QkDrFHLAqgUaZ1wxWULQNLStMMAM9CKAQPRO03KpGNJr1nJ081rdATRw/2QkyDm
         xD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951118; x=1777555918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MZLUyV0TSMl/0FUp0kbCXsS7r5z0r4oRuVSRhSVL+wo=;
        b=QKyXNRIsY26vCklxHb/jx4TjyVccBWE/y8MPs0VEKpPKHLjwjG82WKuELb4Bp8TLDv
         5Cw3tYEDOChFKoF02E5SNphoLPZHTNKQJqI9tdvYwWNUJVtxegJ/uS6tnux8/sXbWu2N
         CCyPFqN1or4aCYmx+yGPYm5wKAEtAJmm/PQjCsJbzmdbr8ySyGWumW/Z+bbuzwslcS56
         8uI8M3F/CejPQBnh4Wt8t593tnqu48qMbV/PTe986KynX1SL1fN47c50Ng42wpoHXOvd
         WD5Q67Tq/MiuHYSaM4F+8fgHt0G/cbk7YK4bYYJ6awLTrQkST6zoTjv0YlQeF5h/MKUD
         hsjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UxjCLFj7SdRGWJqnJLCpKpNXVinZyUdNikGRqcgeq/nbapsBRH72z9UfHjiQtiyp0b7/6pYqMUlyE@vger.kernel.org
X-Gm-Message-State: AOJu0YygJw1rbQ4mxmuiJSVW3eoTdr+R03h3MILuEBRi7uvGrQNSMajL
	dMpOKmZtTTLDMyLcceV7EJ9z+m3kRGZ6mt0RADfsZh7PSjEVsp5o8i4rw3emBflXSaa6Fg2iSoo
	p9MZprAlJGcBGIhj2K7V4oc5Wa4atSrW1jijjeHHFwE+gk/Pr4gK7AcGyXd7Xsula
X-Gm-Gg: AeBDievE4tIhAGCzeF/bnVy+g/UIck3ezqmOw3Mo8Ri3yctpUKA6WsETqtZUVK+KsL/
	sc6Pd49WH6v8cRpPuM2EgibGULFfRDTAfTFK2cteYHX4UGdc83W53qB4RqiTUWou/c2xO+3JVHK
	A3LfdQHrIoPqmNax4JwODknWL3MAgueXspojBKMDnavUHVBcYC3cqn4GvUSlamcU1l/VIlV7VOF
	xE+aBMRKCYkxgMsb98bA1VybvaHHfdelsQI/iDyrJE3X7Af7E8LCmcsnVmGB3JgHl33Y61lkYUp
	6SILOKrvYhRQnLaZqMDWD218Bn1lK5k4smwBozfkcg2skou+joOYmFwC7KXJcU7kpCvOf2OJbOK
	enm4+6Q13zEQsO/N28QBkRE1TBYC+ualbM1+gpBAMgGOL59XwFXjXGW2yxVS0XbTRkA==
X-Received: by 2002:a17:902:d58e:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b5f9f1b8d7mr278407735ad.19.1776951117792;
        Thu, 23 Apr 2026 06:31:57 -0700 (PDT)
X-Received: by 2002:a17:902:d58e:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b5f9f1b8d7mr278407055ad.19.1776951117167;
        Thu, 23 Apr 2026 06:31:57 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:31:56 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:42 +0530
Subject: [PATCH v2 13/13] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-13-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=5015;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=AXNNMUqpUBkT37jqrWXRRraxt0+yVQz0nuc5i48FDy0=;
 b=58IIjTBkuro7ooQIqHd8rr+cIx2L6Qfg+MBWKSjyofmOnqBfOWoWDP6sWuTHFW4fv3rgaFy25
 7AjrheiHUn0AtDglqLzBB1eaCIXV8cS+5nxXGa6iHZFn8/zeMMRA7d1
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 6n-a8_1M-gmyEFR4bA3wLJdlZhhx9xyU
X-Proofpoint-ORIG-GUID: 6n-a8_1M-gmyEFR4bA3wLJdlZhhx9xyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX6ZqlW7z8wMjB
 kcfrOMUJhjMse+9kIVM204ib/SvosRmJsgA1Qo9B9b7VL7QdW+KzuZka0dv1gdXUvhEfCokumAw
 oyTeRJ/bS5P7GLEcraSHviuYffn0XpSiR8ZniDp+zu9kRe5uJaDwZ5hFr7KW36vWRei6XOUbGOn
 lupXqDrPV+DhPFQKPyiyhy8sWMxYmfGzU80d92L6Z+ugC0cdMZknGWNIPChaXYtnoRTGAqpZIgi
 tAB83ETZS7fsaNF8u9enww4FrCaMRAramPUtV/ZikJXucIejSdkr8ok/WXLoSJd0wyfCCiQd02Z
 8dzg4mveQTYBQrhKcYDJtU9l8qEhI8d5aOvPflAsfFEeHdRw0EfdUjOlQ8Yon+rUSb6f59UGlq7
 xnsIG6s0hy/kD9vKTgAbq4o1buOPP0caCs4EnH9Rdk0RSMc80Zp1XbBOP7WUv/9w8DQKng/2xaQ
 to07E/mY7ViNtah/ZuA==
X-Authority-Analysis: v=2.4 cv=ablRWxot c=1 sm=1 tr=0 ts=69ea1f4e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VYrRtalYO0MCCBblpesA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts |   4 ++
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 118 ++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..cbc9856956ff 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -255,6 +255,10 @@ &mdss_dp3_phy {
 	status = "okay";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pmh0110_f_e0_gpios {
 	misc_3p3_reg_en: misc-3p3-reg-en-state {
 		pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..c47443174f97 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/media/qcom,glymur-iris.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0xaa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core",
+				      "iface1",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "iface2",
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
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "bus1",
+				      "core",
+				      "vcodec0_core",
+				      "bus2",
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
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1


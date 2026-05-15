Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FDF47F2C9
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844293; cv=none; b=XLq2XNb2AOte4wKQIC9CbGJG5VXTBJLJo8ckAChzJaV2IoiECulgjh6KdcJWQYJBbH+i3Zc0M+9lF2tbKHrahdaByPwNHuodCXkRrf1KX9jgzn6niSB5KefN3aHBtDQbjCecVPK0cSHJiwjWvlPMfXfsAnKKdohYvAGqmLEL//4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844293; c=relaxed/simple;
	bh=PD1gpoX4LAukVY7c9h2PcdOHpE6W9WE7RaExHqCiq04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XlzM4lhTtyzouuoulVohnvNaVcul+LGF2+Tg6EPaaTnJUVPLzszYdAJ/UG+6ZWa9j7JQieTIcYkHZdKZeDfsAidXPoabjdZNuLUcqTMhf0uonSubgYTYFFCwzqo6iYoxr1ruHGKypUey80dMYJCwhO5IxcFnX9uqLbqN86IqvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hERO8Hl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVqIhdUS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hERO8Hl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVqIhdUS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5F2JB2676215
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geJxq8Fym74xZf3sPrd/0n2hwRmsRBx/QMPFY1ao6wk=; b=hERO8Hl3xPxqS3SN
	t2kMhuGHwde75G4FYB8m6Sr/8ihrh6zqw4NrEOWnA08R5sKtl6tvNhahDO1P1G05
	KRYymDA5SXXN9ViRrWtJnkH0LALa/BRdKdnGgq2dJJs8XI+4SOwDukUCYbZJ1i1f
	xOyLGKBB0V/FDsKQrCNnsDktcJtak7CSBE46jqiRN/Bb+ekEaZXoNiNeBwd+qbcF
	SpySJ06RnoX/0oED/ndj7KzcwlrBnytkxJpIANi2TVDWp9KxiZDzA6eKMfXQA2ni
	g+3pIkKX1AW2UikLDHLcPCfCMjTBqlfE+syXR433DLmTzarkVtYqblrTVNK90Hfd
	a1EI3w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vu1ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:24:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365faf6006dso10541211a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844290; x=1779449090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geJxq8Fym74xZf3sPrd/0n2hwRmsRBx/QMPFY1ao6wk=;
        b=IVqIhdUSvD1ZinDENCosrlQobip2OpSCQ7sDBFjrohzMEcmr2c7RyFds7XzWgwk0lA
         Wl9iVRrYwl/opEhH9kbL/n1Q25iyhahkUHvtg7NYc4vEbkP21KGAA4/j06mI/ooXRBCZ
         nnuPnZpz6BpY1ygf5b3XGo04pyTLcELUCx/DteXDI8a4LotNBCw7ltROdv82T0OB/Hl1
         pwxH6qTCtMHokPT1vyWS1d+6APSsapIzajjp21cQk83831DUYH8rbBJV/BP8st42KEsM
         z2ynOgC2Ep8f/q/rcSau/yJu4zLHTTYNRVaYn/moJ/radcRs9slqKQ81cTK2wTf4BQvo
         SWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844290; x=1779449090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=geJxq8Fym74xZf3sPrd/0n2hwRmsRBx/QMPFY1ao6wk=;
        b=Dl/y2/XzZXX3bi3zHHSc/8dNs16kvzQuHCvZgy0lmQ/QBUvHlhQgQaPFEbOzo/f4g0
         vc9WBpzgUz8YqCFqKtOLvoRypqlsiHyv1I95lxUTiVtD0Z1el/l5+vHGPVzGzMzZ5PaR
         7N4b578eu2FnAD2KVgmBFDi56/FnDcr6c4ggijU9HVN9lxe/oJOOtxlX49zCrE2BAA4O
         gKmNGCvE9Ps1FX/SwQFqoo1Nh/VBpThDnSbsp8cND53Yc/OlVHhHif8sehAGWU33A5/l
         EcaerVVhQc13NKRD3vjrFg+g4Ah3TwQTcnVGfYt/Lj0EexfOrQ43l4a2guzR6PLlVZ9q
         hQSA==
X-Forwarded-Encrypted: i=1; AFNElJ+lsQQaWkumDsAzoHtb1HmSrqlSg9msTQkDvwlGuvK3YkEJhxJBdmfmqamS13WiuLfAR/GHzSc0GzEC@vger.kernel.org
X-Gm-Message-State: AOJu0YxuS8vDeePInYXXKFIB4/a3kD9czhnra3QI4xn5FG4Cg5DuEbvS
	KQnQeSQk/+YOFY4hxDbhf08IdOYs9nbL4byqSLByiM9QQr5neodCYQh1+0jUHlONX7U3qrgyK4a
	ex60AXISQ9+hGdtk6ybRpc/MqvTUUHUSw3gfEM2twuQ2uc2Zvu9BhVFWcE+S4OQPi
X-Gm-Gg: Acq92OH/xn/A5xlZMuzMbdble5l1ofgip5pLgRPNo3CwFWIxo5JYdwRYFeWnM9KfRD5
	djjawE6SEpmuKOcjF9MPtaJOOkvEWXLpfdh2jEB2KGDhzXdtSLyWQnXaoNf4TjZoudlBGHhajNt
	pCpQWqDh2qIsc0rpL8XKJUQwaU5wJQSbbw/cfqkkqmlWa8EiEPv7vw4qDGoNPp4240fvOJnFzD6
	LVqxTL6IpSjfJFV8b1/vOq/v/+N97dqoWSJwndcUPwh7tgkbthFZxfeOvvzr62J9S3rKy3tugdJ
	i2azruu0MbdQ4p7zGr46II/VjO9xwjN711zm58viAA4tSgiggqETlEkgNC+d/k7TX8WGw5+ULeH
	L+KSpNDB2FMx3A2dOIUN/no/BDR/1JzQ6AXn+a7M2/1tXUl7XFiOUC1DVyxBdS7R8AA==
X-Received: by 2002:a17:90b:5808:b0:368:b881:b2da with SMTP id 98e67ed59e1d1-369519e2d13mr3830606a91.9.1778844290389;
        Fri, 15 May 2026 04:24:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5808:b0:368:b881:b2da with SMTP id 98e67ed59e1d1-369519e2d13mr3830549a91.9.1778844289795;
        Fri, 15 May 2026 04:24:49 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:24:49 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:28 +0530
Subject: [PATCH v6 13/14] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-13-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=4603;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=PD1gpoX4LAukVY7c9h2PcdOHpE6W9WE7RaExHqCiq04=;
 b=RafsrPim/rP3V0hWeEn1IFZtpupVqQAaWH4UDuUEcPA1FE3rDk252otVElqHF1B667wj06Lai
 xA6l+LxgTOSAz47lfmEmHmMoLAbV+wm19GnyKSFgLI8CdZ5wqWGBcvH
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a070283 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VYrRtalYO0MCCBblpesA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX+HTTVuYXxlHW
 6eJNxjgWxjsSP5PbthceAvahq7DlE22au8fu7jjQjXJiPKmAeow5b6TmrOc+UTWQC+Iag58FDPk
 HBVtx/KK3rqfRkzlQvbmxQXy+UfCRz0scAR7GhNN1amaY5QRcY9BGkarivtApH1y8/41MlnYldn
 gsnR+vnJa6FnRIZ7q1vjZjUCdlxJTk7iKPp1d0aWF65b1zmlhHoD4q9vebumVekFNYv5hCLQtRX
 QlGIf9zl5TqdgHI4ll1mE6i7ArgA7qudGZMsYLIE1lMUBzyYi8os7RbkN2WTvEkXqJjME0sbOzL
 q0ODzS861Qpk2q8MeWWI9WFhgMfNc2W+bN9YSi6kng8BJ/4ckm9iTrPAmYR5UrGQ++zN6KZL761
 zIsa4IG5kJhjyqdPK0/OGzWVD7ELL2/lLUfIRkhw8s0/7AncK8LbRweyvTQF9Ls96Hyvtntbp8R
 1XOLrwqfPrtJGQ6P7DQ==
X-Proofpoint-ORIG-GUID: sMQ_s_o-KgfXq_PZQtNO3OoJCwTJqNl3
X-Proofpoint-GUID: sMQ_s_o-KgfXq_PZQtNO3OoJCwTJqNl3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

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


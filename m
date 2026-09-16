Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52463BB69A
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549917; cv=none; b=MZBoPZVH9hluJo6R0RChJtGQtXfIwXR23MwA2ioUWhRb6EyoNIqz5K4gkMsEprNHaLg3QyE90zrOgQiG0hFHWH70WWHLIvGLtKAimIpOpyv2GAiSKkhQXo9/5Cs7Q43ZFNv2UmkGLzEnGPaqgcI8b34UIgY3SAK2AB2PAYkGv20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549917; c=relaxed/simple;
	bh=Uzwi8xSvwV+st3vrdPsDXqrOcV6mG0RIQvYAVhIyWFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRhdycCRrScA/GtWSRWbVft+noZbzce5MWtedJulHSV0DCE8oohvnJsTGlvFI4SQhvVSFyW+VBnYJR9jAsG1oVacXK/Z+qy+fPYc6g7QS4/wauIriQ1HaOlXU6r8PVbQ71IiVx4S56mzPaiQbFyvFSyVDjvanKLUHx9wTgOgVeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZDhXaTY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOCyS9Z3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZDhXaTY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOCyS9Z3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92sEU1552955
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OERyCDnzsffYggoKraDEa+SD+q9V0o2YI4UapHIR2AM=; b=NZDhXaTY+2WmVpOv
	kNS4YziDBedEz1uqhF5qTPCORoT3sjAKUzNdaRKSYWVuvgECZ9vyjnwbqv16bBPw
	mcgjY7/c8wvxwpkxmKkOwiVZ4S9LAkTxPybnvvq9EIOWxYQeKp7PfFt8CXsXue60
	s/wNg6XInmloQXBcHOE6Gnzewlub6mACt6ckQtNCGShPE0wOAUppcJjyGUh7YiYG
	Ntj9sHE1eVIJ6HiMhUj8Pqj8NrdPtm/0lTDP29r3TQ97jIGSGxQbLK1erRB0Ggkv
	fyVzjsHHxDNN6doIoVJtOe6yPS43OOewk5PiXO1ZsCy3st6ms1Qj8lpu1NV8X66W
	u7DnXA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n63t99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:33 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1ac969b92so6955005eaf.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549892; x=1790154692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OERyCDnzsffYggoKraDEa+SD+q9V0o2YI4UapHIR2AM=;
        b=OOCyS9Z33sdLHNruAylfncs03RCjufB665A3Yrj08iL5wBaaiNkxB5GCDtabRzISKk
         ZDA+Rot4yHIXW/+JUoG+45caNvrf9qjL5UF/FbjIJUFb2yx0wU/uvOq/Ilt8sl0ECuU/
         qh8QGAXrQlRPyYHQ4QR49azF5IPh/tZ25k3cZm7wnYHrwi1HtKshiZfgJicXnbpdLGlP
         7/l6PJkOJK0pWUiUV+cM4WbG+8qZMe/hVv0OehaR5s6YbazAKFHrG0kBFpvcX08aNDCT
         qiLBhxdJDzGo1ljMnpd3YSefMfo2hyAjW9+EqYyu1gU3S+Wh/AX8Jm53dUIfnvvIdOe2
         EhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549892; x=1790154692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OERyCDnzsffYggoKraDEa+SD+q9V0o2YI4UapHIR2AM=;
        b=tHby8ASzgB8ztagv6UaDYwsHgEh4+sQG//HeYvsajkqjHhPgekN3rTrC87TwjCcUir
         vDBII7dODoKSNgXDRyFMBiglftgAaosHAE+lqMb8D++ZHOMzncs7Hkzd5D66CCcOWwd4
         94rJ0gyoE+oVldHAaQfaxfw8Gc0HbMuXbGCweXYZLOkYbv34NNPKP1OGMmEOhwM3b4f6
         fHWADj+NsEJ+5Z41xY/jXCzKe6dpJE759zmX+o9LcU/KDXerk/9dVwmAULxsbwUNxAB2
         GfwfK9CO3wOHpllqzkH15Np3FBjDy17uITv/goGmlGehYOFUoLOb+1yfBjLg/YnSVNDV
         l4bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzXcW0N9AoJJ2qhGABVRsNa52pAeUhvPTArrdhDCvVpX/sEZ73LT9k/NkuNZHIyMSM+OEn1mW+dnGD@vger.kernel.org
X-Gm-Message-State: AFuF++m75PV9g+ga8+G35MkPdHjUI7ohFY8lvqBSvywrADo5QHL9Pq9V
	Ee/3J3GsPnzPk/6mCQuBYrFccbHI9hri4WraBIOjo768qAvSdJ18A21CZyfbIpMwTURaH5Wq5im
	V6bQJpT3FlQSi1fWRFaj0LgrL9qHJE4zUMHNIAQ+scTzaj0zVRn5SiYD2qpNuBRLE
X-Gm-Gg: AYBFou3kWhmxq0QpaRVz4jesCBUBu1ISl8K67bvxIZBwIZ6wfdpI4rn1FVH1Y1yB3Ax
	ZlIY3v2xxhgEJzFazDCvZkjkbNVSikBPDxKLPJ2lxYaIwc7cuumjARdcjng+qyoT3FKRgF+Zj4+
	MFAHYp00KpD5R34PFqguga+hQb1ouBdEZWDQHQNIQPXkiIZM7yGLBpbFLnLMP5HAahbo1YKAay+
	h/uns1nfwz19d1UJNBpTxHYePDj8vgMpn1nmPrZvU3Dvid5kLCkTAy4MHCoIslvIrAyUBJAThPH
	jfwHoCnntxnPfWSA/ifCl/N+dSBqnXPUyOlJKjz+fipsjljc7c5/sHwOi+V//ZsH5PHKDvdEYyU
	lgTGazAK8lkrNyQ+8mQy/kdZYpqc=
X-Received: by 2002:a05:6820:f08:b0:6c1:ff2e:7f03 with SMTP id 006d021491bc7-6c7d04f2b1bmr1902546eaf.9.1789549890649;
        Wed, 16 Sep 2026 02:11:30 -0700 (PDT)
X-Received: by 2002:a05:6820:f08:b0:6c1:ff2e:7f03 with SMTP id 006d021491bc7-6c7d04f2b1bmr1902517eaf.9.1789549890234;
        Wed, 16 Sep 2026 02:11:30 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm4779492c88.9.2026.09.16.02.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:11:29 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:41:18 +0530
Subject: [PATCH v4 1/4] arm64: dts: qcom: shikra: Add MDSS display
 subsystem
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-shikra-dt-changes-v4-1-d5d5c3ffe070@oss.qualcomm.com>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
In-Reply-To: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549881; l=6897;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Uzwi8xSvwV+st3vrdPsDXqrOcV6mG0RIQvYAVhIyWFQ=;
 b=TKf5xn9NJDnRh80/g3PrwhLU/YJl+tC0Elk4X35HagrM8R+/x7o7lgovTrLmcu1sDh/iOnayn
 bMxrqwICdNqBfKhJIEpFihPQFnU/J2pNy+iWzSWat7dSng6jOhGXi/G
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa5d45 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ETLJq0YgDw9Z7rpyrqwA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX62PmvuvKN2DD
 tqxorcOAma0Sply7CpzD1uDdrdjGJgcIvyGF1sHaFn0sEiDScMMH9ZfbBdeAL/UJiCOCTNJHfIZ
 IP+KMvzDhjXkl6gLM3LCM1BlsrVwmEL7JzzGZ8EEejw7DBpo5ameMTJW7kXLejkvW+Z6hPV5zUE
 R3m2xTx6DY5U55UPFirN6NDMKA4cZzNxXBI8ja4TjGyLdhAOZz3u8uj600z7xjfPTMSHiMtFG+n
 Acam4P3Us9+gRIGhJjOQsrGtoejwxkMAbNITLwA6ta+2GusN2xLbwts9TfqBDbW0u+Un6P2fpgn
 dfLB6xXxxBo2iKOnbMikGgiVgvcksowm8087yYuIBKp5Wr6HGw+fLy5xt21e+GNXCznZkmsOVqW
 p6znwCLTQuwBr0Uy5ug6WOMxbkC6xaJyfkObpWWa4K5o6YQpmBPFGB4ghida+OhpLKD+y4dB+yq
 xoomV+OUAq1YuOo2LeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX9pmXBddBgGuH
 aRnxSsrMgBB8ifDJeMJavztPXzCiccMkrMgHstYaJKTl8I11qiDghHJdXpPRdneBzz8TPPebpgz
 Z9KQvP61kKsRBp0kvcgrCmToURF+YHY=
X-Proofpoint-GUID: 6HdAp9UWfn8DMc8QmbIUU67mWLxLh492
X-Proofpoint-ORIG-GUID: 6HdAp9UWfn8DMc8QmbIUU67mWLxLh492
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

Add the SoC-level display subsystem nodes for Qualcomm Shikra:
MDSS wrapper,DPU display controller, DSI host controller, and
14nm DSI PHY.

Qualcomm Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
compatible strings are used as the primary match with QCM2290 fallbacks
to reuse the existing driver support.

The dispcc clock inputs for the DSI byte and pixel PLLs are wired
from mdss_dsi0_phy.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 206 ++++++++++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..9375a8be46aa 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
@@ -2281,6 +2282,207 @@ adreno_smmu: iommu@59a0000 {
 			power-domains = <&gpucc GPU_CX_GDSC>;
 		};
 
+		mdss: display-subsystem@5e00000 {
+			compatible = "qcom,shikra-mdss", "qcom,qcm2290-mdss";
+			reg = <0x0 0x05e00000 0x0 0x1000>;
+			reg-names = "mdss";
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "core";
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			iommus = <&apps_smmu 0x420 0x2>;
+			interconnects = <&mmrt_virt MASTER_MDP_PORT0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &config_noc SLAVE_DISPLAY_CFG RPM_ALWAYS_TAG>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdp: display-controller@5e01000 {
+				compatible = "qcom,shikra-dpu", "qcom,qcm2290-dpu";
+				reg = <0x0 0x05e01000 0x0 0x8f000>,
+				      <0x0 0x05eb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "iface",
+					      "core",
+					      "lut",
+					      "vsync";
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-256000000 {
+						opp-hz = /bits/ 64 <256000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-307200000 {
+						opp-hz = /bits/ 64 <307200000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-384000000 {
+						opp-hz = /bits/ 64 <384000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@5e94000 {
+				compatible = "qcom,shikra-dsi-ctrl",
+					     "qcom,qcm2290-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x05e94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
+				phys = <&mdss_dsi0_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-164000000 {
+						opp-hz = /bits/ 64 <164000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@5e94400 {
+				compatible = "qcom,dsi-phy-14nm-2290";
+				reg = <0x0 0x05e94400 0x0 0x100>,
+				      <0x0 0x05e94500 0x0 0x300>,
+				      <0x0 0x05e94800 0x0 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface",
+					      "ref";
+
+				power-domains = <&rpmpd RPMPD_VDDMX>;
+				required-opps = <&rpmpd_opp_nom>;
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;
@@ -2288,8 +2490,8 @@ dispcc: clock-controller@5f00000 {
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <0>,
-				 <0>;
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "gcc_disp_gpll0_clk_src",

-- 
2.34.1


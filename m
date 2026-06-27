Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD7539F190
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554528; cv=none; b=b+qPdWSwdgQ+P2tBBuXrYAQk94mcKSTbM025PmZMkD0JvUdcpmh4f8Z+IqKdo0Ur5AFyjOBQk35pkFtnPlIOt+k6GHOrEh7/W6uYJ3Yh85COzUzAuqKe8rnoOYvFrRTRH/ClUvTjPX62zQyHvwo/3NRX89yKnF8IrjthdUeVrGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554528; c=relaxed/simple;
	bh=8/1IuqBe4X7zrf2GRbXPv19z3hY0arsbmbe0f0rQT1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6FRKpPiXA2Zg6eofYkfEZDSSu/Bgjjh9elOpfXaYfDPXbw32M9biIK8TCQNYEPnRZB4sHPfT1UWy25fui0QAv5RCupV56KTimlnTShsxNYiIG+AfElYoTU9x0eu5fTbtvVMiMSBtrDpkENj3lVoVsRAh2swEBHyMF/e+GhWRCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsBLfEFy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/RQ1WAl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsBLfEFy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/RQ1WAl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9ZkTu696158
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a+jsm1R9qsLDeP+vmyatEqU6qZ9XNXrO12lpSjitEDU=; b=KsBLfEFyy5e6wFSF
	Vh0tAtgRdWJRaGtSu6OMOv82xwd9EbFPbaKQasUXygzJffatLtJ7YAXiCwHtWj7M
	YymLGQsuaSeszMH5OcRkQaWyIErN+6YfDSymWjCQ7Owks6+JRNPvnUvpcYWIy+Bm
	X0oxdDiA02ABN6xGTUyPWhcaOmCGHHgy8O5stwfKGWBstpxwJQFQQqrlRJRI5CE0
	igcEf4T86g4N4W4e5QO6MrrlyzQdO0XnAKThpcx3NVb8LoK9kjU5cZZsWJbQhZiy
	eUd0fivAY7xvSzKGjfMEMaLhyrLbJBRqdQ5BvF5NHH618QX+CKX+Ufe17MYYk3xN
	Jgo51Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27348j4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-138acbc0e69so6898172c88.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554525; x=1783159325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+jsm1R9qsLDeP+vmyatEqU6qZ9XNXrO12lpSjitEDU=;
        b=O/RQ1WAlXzHWLW0Pgp/n2jK9ztfLp1NaUuH6Hi0QKa10ZX/S1DArglo8LTLeSeaR3L
         4vP1i40Rvtq6SUtDltaiqw7N3Zac7xRPmlcBKfLo1IakVVq2S8j+c7o/ImprUOLkZzPE
         7ffSRR1Pl3enuk2rxcNJ/RZx7vgf2dMZ1s6jZexDwz7F/cu6AuSPLrfASPg8D9BnSIX1
         jib1R+YVOyBMC0qlpKSY5CIZtoZKUAJLsJjNsOELbbT+b4aGWI5mJuPn8WDlw/aQBguf
         MEockAY+mvFk+M+7pD23Et7IhIYF0p+EwcWTZTKBT3srML6lLXnn5UAx/nzqkiL/eiQd
         O+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554525; x=1783159325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+jsm1R9qsLDeP+vmyatEqU6qZ9XNXrO12lpSjitEDU=;
        b=h8l9zJYPSfXoAU4KVis5i6ElZQM+OCb1ZC6gSXqexeFmp+PoSt6C0O2xUK03f4Ujvq
         WvvrWm+a4PLZTv+7e2RrN93vqsnqw2G9/7gEhLs5heulGnfVIs38qfxRwcVcd0YdIzJk
         BlISeskLXc7M+x/WIUQtt1aj5GUuJgvIEiwjBrIw/tr2+pJZUbIfMLh/R2W8gqisFxE5
         i2JAbAYOggu0FBb+zVraem5tNT5tIZGL2G/SZvDXqiAc3LdCLrRqnss8w5jdHM0vMd1P
         flDG6c6Nh3FvvCadjp2+kA1A8dCWK48K0rmHLCjbeX9bTpXuOzBa9UfEqmy6vg+/chae
         WzyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cDrUTf1IZXf53BgptBbXz3U8g+F3leJ+EEZ0FrJtRnLGJAberRo5mELUTZIC02v6Z8PSRu5SOb3yk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2wnQW3zcSsZdzOA57dcL5VSKKQWsmLIiPj/3tpJRhZ1ejb1qY
	4zaZHPy4MxqfK3s5jkE0+o+5G+lyoeGOBVQ+042kxoS41mlScAsfi1v9JFOT6eKt5XgfnpzbxhE
	65IzOGzeLMbYypNDVoI8WWjJK9eoQj2dHXJKYJyF82deibtChj/1l37loMGzTXxfD
X-Gm-Gg: AfdE7cme1FxR9DFrduXl87ZFnLoT7Zwo33U+ne1etA3GlfFAF6Sk9TjoXPnL5PMjFAQ
	lLlP09WtBqBLDJp5Qd82e42l/pi5HZTUu4YNOQyH/3LA3pOx0RusM3rhWv4eXfRWeEcnbadggl6
	EbtlAaGEesgH91onXXk9aT8MvWfpsw8gayJ/m2tQVq7ynXMSt6o9q4zDn/h8R5m+VQEdxkyb4FL
	YN7rHkVQ5HpdSpbOKOKd6rWuEpcJQu9RQSSMDtkGQxi9z5Cnrbc5t6d34rJ6nLlxP6AOjLJgceh
	ZM2CvXHYf51ZPzK15D5BOclfpcmMcOgvtznOUcch199ztJ4IVpid7QlrFbu3MA8TNEVESPx2Wel
	+r2LUuyPhMRILRFphtAFa+m3wNfHRIcor/BnZRw==
X-Received: by 2002:a05:7022:6b9d:b0:12d:de3e:86a8 with SMTP id a92af1059eb24-139eb5253acmr2938524c88.38.1782554524591;
        Sat, 27 Jun 2026 03:02:04 -0700 (PDT)
X-Received: by 2002:a05:7022:6b9d:b0:12d:de3e:86a8 with SMTP id a92af1059eb24-139eb5253acmr2938500c88.38.1782554524022;
        Sat, 27 Jun 2026 03:02:04 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:02:03 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 15:31:35 +0530
Subject: [PATCH 1/5] arm64: dts: qcom: shikra: Add MDSS display subsystem
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-shikra-dt-changes-v1-1-449a402673d0@oss.qualcomm.com>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
In-Reply-To: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=6760;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=8/1IuqBe4X7zrf2GRbXPv19z3hY0arsbmbe0f0rQT1o=;
 b=oy8zDPdC8RkOvf3C94UuXn1Otgt8zcmzA08VL2Aw6Wbkb02bm9FEkyi4GdR+CCcxhfOHTJBxe
 c5M/zrFl/H/CGth1z+JFtVJZXUfMguhqygZNqQ554c0HYVsH4WdD8Wa
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: KEz4mQzbPPri0wX-M0oE3q1oP4nboW_8
X-Proofpoint-ORIG-GUID: KEz4mQzbPPri0wX-M0oE3q1oP4nboW_8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX1rlbW081vVEy
 /+93bUs8o9sj/uL22awE1a/XQR7hVqQuJ8lus/VW5v9s7yVddTFPs8qodMgXIg9oOZqE4GaUsmK
 whlWzdCgyVAw3CY4C2/3JgdR4hcR6Rg=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a3f9f9d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t9ZUqVEILTzBR0fHAzoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfXx38mWD+igwpB
 CrVVJASqFbp0TAy4NtCZQR6IrmGAP9La1cI1uArQOaBnM3CwWmDGbVIg5oB65wawGLV8yp49NT3
 meMfc0RMbwhf9wrLheORwjyw8ddlD3IroPL/ZfV1Hlsfc53go0tM7WqjtLGDnj4OrFg/WGrsOTy
 0JLel7qLk421chQbWngK3q3/kK2eukOrpoa5bX5U3ckTk/mr1U1OZs97cRQv8L5MQ+pvqKWiq5u
 8ITxRDq+hgeXwQfB6U5UAHEHqhV4Fwib1hXkTH2U3MyxBRkJYA8Vx0nfG8DsBPcimp0hDQemtiJ
 DY6ryhXgooEFdKhzGdbssVLP+KLkMqaHDo1wAV2CY+i+4hjBO84vHppVrBoV2KBFYr0a5VYrTt5
 /ASTOXjgCUkQXCJQGN1jn/zf4oYI8l2tkrfvLxcppz8pMF5aLrGg3iCJGQZ1FPrODZpeOciuvMX
 GxXtd0Mcd41GeiTjN7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606270086

Add the SoC-level display subsystem nodes for Shikra: MDSS wrapper,
DPU display controller, DSI host controller, and 14nm DSI PHY.

Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
compatible strings are used as the primary match with QCM2290 fallbacks
to reuse the existing driver support.

The dispcc clock inputs for the DSI byte and pixel PLLs are wired
from mdss_dsi0_phy.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 203 ++++++++++++++++++++++++++++++++++-
 1 file changed, 201 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683..3c8eda0a518b 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
@@ -1990,6 +1991,204 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
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
+				power-domains = <&rpmpd QCM2290_VDDCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
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
+				power-domains = <&rpmpd QCM2290_VDDCX>;
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
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
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
+				power-domains = <&rpmpd QCM2290_VDDMX>;
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
@@ -1997,8 +2196,8 @@ dispcc: clock-controller@5f00000 {
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <0>,
-				 <0>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <0>,
 				 <0>,
 				 <&sleep_clk>;

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678714;
	b=TMFwmAKU0FMfJDzTkTOzsR5f/yz7TffTu04z3Q6M2SNvVkUOpuDrR36SfGX/US2GQyz6
	 sbS0YjgMIR7Ty786IRn7HOpL3nAVQtxqGGS2Yr9e6heiX6iu8oOYPbz2jBEjhASZzXcUI
	 JqXDwOeCgsSPOc+LevbBSBca3c+9V31249imzbaPVGDIam5nXcuTjvXoum6XcA/iiRC0v
	 QOb60AZU5PlxttFbkCJGBjHqXNOs71cOBUlKB+m5LMZV2qMtGen9Kg3i07OwVqXMxxl+z
	 0qU+JP8O/qZ59kvxEDQuanPz8FgKSizk+oW6kZk+qQEbDuNRLiiQKm4Bnz2hYNmWa5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mVqQxQXEXomZHCo7mm5e2Ybezj1JFqDpCQoDTyjnpIo=;
	b=dLIQu2BvZRYJNXgmzLFwbeLbeIs8P9MUHoWbNzLJgcTmyeLd4hCVtz0KzRli3GYrX8js
	 XMEfYtFpXd3jaQXQHyPrVEt8aCzbdKaivq1Q7UYzj4vRW0nB/oFKsfiVl0cDS/LcO2laG
	 xB0gRZQcXmkXwppmpZB/eGSN9BUBsM9wp08PMAhVbJPGV/gaSUyeArW0gmxgBF5c4n1Tf
	 zvtGTHKMEBjbjutq8wmoSnS/hOPxCjMQsHeVC97T/1RJFPtmMwixtOinFxdu4g/gdVty1
	 Wn5BsiYS8XLEkR7ePd3VTm9OHECjMiADKrceM4mXr+HlJ+L5rqDcWp56L0RsCyfFUYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LjHQkcEG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h7Z6+KKi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC735606A32C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC735606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LjHQkcEG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h7Z6+KKi
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7CvaB061948
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mVqQxQXEXomZHCo7mm5e2Ybezj1JFqDpCQoDTyjnpIo=; b=LjHQkcEG01IcPZ3C
	UUJKtR3+stuZtRSrMvw8Kuo09aZtwZVsKW9Zwg3oVvcPy7OeJsTt1RBOZRb8Zuf0
	vJ2m+KVf3C9cajM5ESbCMhU1T2vcQGcpA0MH1dhb92GJLkOlEAKCyGEKo6v9/Mkt
	9CPPQZ3dOEmR9tNJyzO6FO3m+7AYDssLe4G/IKkE2IVbrKO7sE2cRiaNmLI11jRA
	Oyy1IlvaibjQWiPihmnGTWxopmpF1NhXzY6MSawVzL/vYfEvSAaI4BDrUBLybiYz
	pE1QZIPnc3K8yHhEGVsMQfu8u/+bDOv7J1t5AOfbk/4CWk0BgknjKQAFtpQB/vGD
	h544qQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ark8hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:38:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb91e288d7so5155766a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795678711; x=1796283511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVqQxQXEXomZHCo7mm5e2Ybezj1JFqDpCQoDTyjnpIo=;
        b=h7Z6+KKiUACataOMooyQTxQK2lGKzP3k2BrLOYYu71kfASj6+fCF49rWe3IEnDB61v
         AFy7MKUlYvJIQaWCECmLEok6ilFkbee++H3dafvOMgzWWTch1jP+UAVhO0ts/mjh6oKq
         zewwfVoWymjhg60Y5AK8i6m45DJg+ovGtk0kwDo74/aiPgh+vmsNCPiwog+uXsJbAYAt
         KCh+Jdypfeuyw8esCwwPaw8BqH0o38bKOEoTJsC21MG5rW2jeNGt+CL5PLdQdDWzq/GF
         IVsol7//4iXlUWVmstRS6Kn4p3R428Lp2sUn1AQBXJ2yLHCedbmIHtoaqzLzFQk7VMSz
         8giA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678711; x=1796283511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVqQxQXEXomZHCo7mm5e2Ybezj1JFqDpCQoDTyjnpIo=;
        b=GV+leli/YD06bb4VopwAwCLhGcOcJe8XLlKfLKQjAqPIGD3SEnr9qtIUOxDOn9OLki
         oN4cNXZiv0/4D/Iv9HIG7mpocpepsJcj8ExSoqXdJfJchL5MZSDbARJ2BSw/9WrJmhS7
         xmMVLhLwfZ37+4e+fo7ffGE838nuH7fiqO4PGeyXl4rVIFRNSnvBQwIgcNWwPcXkTMMa
         313Y/9RC5brbgAkLMySJolgW+ucm3SYc+LELMjbF1PlzhS+QVU7HuCuL1+yMWB7g1wRu
         oipRoXXNCxkz1NGjDn/uzr/6XVwdnNUh4A/C2M3KDO9qHKz+KU4A65gD198jpAFljbeU
         Y+Jg==
X-Forwarded-Encrypted: i=1; AL+hErHoGaY/y/LDCEK6ufy5bWk5LZInsxWVKrLnCjhmCC+wTE6bpXW+alAVFME5ChuXBoptnYQA5Oo0nIhR@vger.kernel.org
X-Gm-Message-State: APuU4Z+43vqZddouQ0KDcItFcJblHnh0NffooxpIE6ApmkZf60F2w6Mh
	G0U4jLDn4zcSBP7C2db7onH0SvnK0yr5NcTofST/b/4MatsdUXtTRho6x045wg+ELIyQ0bXt9Zr
	Bs1/CMY4HELLYJq7mNkSXRZK6if8ZH/9PX6Jr4OPyT6Sf90ZXtCPxE2gZXMFitxRv
X-Gm-Gg: AZFdTZcDY3ksKhA3HBfs7/XfLq/MMDb7zP0vsGw7CaURM88yESXVRiyt7vYBgr0imzo
	BnbZm5H3J3hAfp/YwljO6vt01uEzGO5PYr92M5x8RLs1PPFzQK8vu6qmEEZI0yFd2OB2dAq8mDD
	l6SW4Peiv3eMEZ/4pIWzMU6xBR58/9QyXj17xwQAQnn02gEhAcen3S24KjAd8aQnrl7qjSCJDJh
	wU92AvGrlRAYKq0C1q7nohJQUopd5IQykJnqkjZQU/o5W8r0X5GjcokrjvyufbCqdo/tjHrZqMX
	YVRfvKKs3guEFcwQvammyj17Kfftly2DFIgKBwlZkJFLVCYCELdJf0VCXpM/qrJ7GH2NHPAl3Y7
	9qjsV5B37qkxS8ddxzd8pPXz3V48mG2Z5p8xNMWlPRToe+9IqL4dT2sIs1QKgQcsYvLPXZWmAz+
	clYDMMUvAI
X-Received: by 2002:a05:6300:218b:b0:3fb:2d3e:e60c with SMTP id adf61e73a8af0-4014cc4808cmr22074400637.58.1795678711302;
        Wed, 25 Nov 2026 23:38:31 -0800 (PST)
X-Received: by 2002:a05:6300:218b:b0:3fb:2d3e:e60c with SMTP id adf61e73a8af0-4014cc4808cmr22074368637.58.1795678710800;
        Wed, 25 Nov 2026 23:38:30 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm5042987a12.26.2026.11.25.23.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:38:30 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:08:18 +0530
Subject: [PATCH RESEND 2/2] arm64: dts: qcom: maili: Add DCP support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-b4-jshekhar-maili-dcp-enable-v1-2-3d65c89bfe7c@oss.qualcomm.com>
References: <20261126-b4-jshekhar-maili-dcp-enable-v1-0-3d65c89bfe7c@oss.qualcomm.com>
In-Reply-To: <20261126-b4-jshekhar-maili-dcp-enable-v1-0-3d65c89bfe7c@oss.qualcomm.com>
To: conor+dt@kernel.org, robh@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795678699; l=5732;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=EZNCWd+IPa2VewynBqtiq9wefiypaznTLL75zOozo+w=;
 b=BtepCKZQ/JqcxkhGlWTjUVV34M59ZI5B654vhYz7p55hChK2OzY8q9gZvMYAsiLXhf62mw0Sf
 rg66Amii9c9D/DBYsGayUvouoJOotVl+1lXuu5cEEePHsbREV+6fyMs
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: t6Ss0nizoLDBU4CtzgJ090dvsu-AfIoH
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b07e1f8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cp69EZODLtjo7xmYzNYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: t6Ss0nizoLDBU4CtzgJ090dvsu-AfIoH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX8+bd0/a1lv6Y
 rDJ3zNCOQyBNF+E7KW7SVu/Rc3WcPxXWRKe512zD/kleKxJkWVEpBaUC9rr5BFYoFIqZCYQTYL3
 WQjhjStMsO5GwotTwAPn7H5Aw04rpiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfXwpF3y85IefUx
 hIQ0Ez3MZiSH1rJhOsjq3izO9rWUOxGdGO3/Fl5lnLSDTSZpwAJcA4cT2iz72tGDdd7+PurMyQI
 cIl2eK0dyMIjsqJn6pi35g9/GrMhDHfS/lTbCGbSrt3dkSqkRRVyxYo4p0yISGPHmOuRVaYVurk
 6OOQwkUKMbgnQhQqRhpmGf2QjAC5WnCdEUxDxgmm9Q6273vedaTeVvlrCHTb5xTi29lIqDuheSb
 MvzxOrb2WEnard2C0OLLlVN/8u+F6EdGJZ2cLHZ8jKNKD+kY8IZhdadEdlAM7BxDGItgsXA7oZO
 AYUOZJVX5ANsoMkHnk3+zAVTqvF4OQeCLvpDI61CmZGXJVIrkBcc9pCWmeE0Z4ypFe1rQaxYoNs
 adzzPjSoqAK3K5THbuLPfalT29S1KDuIiWqyP5dx116APrrn6AkqKnUs0kCBvc1Iwhc/yJzwa70
 Tbk/1Ncyui83umykeXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

Maili display hardware is owned by DCP firmware, so the platform device
tree must describe the Qualcomm transport wrapper, firmware display
subsystem, power-notify channel, IOMMU contexts, and display graph used by
the MSM DRM driver.

Describe the Qualcomm DCP transport and its VirtIO-MMIO child, the IPCC
power-notify channel, IOMMU assignments, firmware-visible IOVA range, and
DSI display endpoints on Maili. Add the Novatek NT37802 panel, panel
regulator, and display pinctrl states on the Maili MTP platform.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 130 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/maili.dtsi    |  45 ++++++++++++
 2 files changed, 175 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 5409d0a7ec2e..3bae0a124514 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -34,6 +34,19 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	display_panel_vdd: regulator-display-panel-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "display-panel-vdd";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		startup-delay-us = <233>;
+		gpio = <&pmd8028_e1_gpios 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		pinctrl-0 = <&sde_disp0_vdd_active>;
+		pinctrl-names = "default";
+	};
+
 	clocks {
 		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			compatible = "fixed-factor-clock";
@@ -958,3 +971,120 @@ &usb_hsphy {
 
 	status = "okay";
 };
+
+&dcp_dsi0 {
+	panel@0 {
+		compatible = "novatek,nt37802";
+		reg = <0>;
+
+		pinctrl-0 = <&sde_dsi_active &sde_te_active &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vdd-supply = <&vreg_l11b_1p2>;
+		vci-supply = <&vreg_l13b_3p0>;
+		exvdd-supply = <&display_panel_vdd>;
+
+		reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_dcp_in: endpoint {
+				remote-endpoint = <&dcp_intf1_out>;
+			};
+		};
+	};
+};
+
+&dcp_intf1_out {
+	remote-endpoint = <&panel_dcp_in>;
+};
+
+&pmd8028_e1_gpios {
+	sde_disp0_vdd_active: sde-disp0-vdd-active-state {
+		pins = "gpio2";
+		function = "normal";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <2>;
+		qcom,drive-strength = <2>;
+	};
+};
+
+&pmh0110_d_e0_gpios {
+	sde_mdp_vsync_p_1p2_active: sde-mdp-vsync-p-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_mdp_vsync_p_1p8_active: sde-mdp-vsync-p-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
+&pmh0110_f_e0_gpios {
+	sde_disp0_rst_1p2_active: sde-disp0-rst-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_disp0_rst_1p8_active: sde-disp0-rst-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
+&tlmm {
+	sde_te_active: sde-te-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_suspend: sde-te-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_esync0_suspend: sde-esync0-suspend-state {
+		pins = "gpio88";
+		function = "mdp_esync0";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio210", "gpio209";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_suspend: sde-dsi-suspend-state {
+		pins = "gpio210", "gpio209";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 0aa5bd4ea21c..16bc0ba2e13c 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -6927,4 +6927,49 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	dcp: virtio@9be8000 {
+		compatible = "qcom,dcp-virtio";
+		reg = <0x0 0x09be8000 0x0 0x1000>;
+		interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+				      <&ipcc IPCC_MPROC_DCP 5 IRQ_TYPE_EDGE_RISING>;
+		iommus = <&apps_smmu 0x15a3 0x0>;
+		iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
+		dma-coherent;
+		mboxes = <&ipcc IPCC_MPROC_DCP 5>;
+		mbox-names = "dcp-power-tx";
+
+		display-subsystem {
+			compatible = "virtio,device34";
+
+			iommus = <&apps_smmu 0x400 0x2>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					dcp_intf1_out: endpoint {
+					};
+				};
+			};
+
+			interface@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dcp_dsi0: dsi@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+	};
 };

-- 
2.43.0


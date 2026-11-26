Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674748;
	b=5J6V48rTEik7Jt3EbQxA5145GVvDl6Lbx6Uz9+JtHYN5ioG4t+JCVzU9MJNIAoWqlslr
	 uG3iACaZRuXFAb2uHMWgTArFj4I9hNOPDJj/mHy4sC10CP/qJ9E+BsRvMQkMIxpJehfkX
	 6NGhlA8WOFJL+xI8MFAU6REL06EHFlwkDdNx3EYOlUbpBGbASKJAL2wfmqI7Mvsr6O52w
	 iNlWXRfVduYmJKLog+sqhEhmX9i8Jy2bzPnfbW0BXpBQDFGNrrv0to7XNZCF4NnN7VJP8
	 YtVR1f5M1kN4RFlgcMLcK0dFBSU5RFd6chU/0HgNRvLqkxr25FibueFrblNAYxSsumA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674748;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wXveSJFcQwL36raoOk+JqlDXdJhqjUXocXOXXRact5g=;
	b=urqpwXkzMMpweWFEgF3Ozzs1LuZd84eqjFq2Mprs30i6QHhKT5qkfXYbwEXbEqFG+tAh
	 X6fTSE9Oml6Ia6UqCcJrr1Wd3RgM/LdlCVNDZw0NEUSRhnWfPLhbi54GdF7fSYR181NBO
	 VRUm9/Th6WaW1rmcWh+X1cemh0Fdwe7KH3kr5ZxJ1J2/3hghCxROb3k5OmSC57xHuRu29
	 EQw2VrHHYQYH+eaxWgBJ+j6d6gBTBijjpZWHypv/ecwBF3m7f6H44aoWXmqoEJe6C/JSF
	 My7n6S2dTlYjZyG0z9nwEL0c6f6vdqWELKe8OoH6gXU8CVe+ZhwLBBBWQ3vcpo67x7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9+p5TqP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vb60Tsl7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F82D606A329
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F82D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9+p5TqP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vb60Tsl7
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36NpB394080
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXveSJFcQwL36raoOk+JqlDXdJhqjUXocXOXXRact5g=; b=m9+p5TqPL/EDovvt
	RUOnHsWOlRVCHu0PagWbZ33E8yfTiLX8MafDmfqCfJW6m3GkMIG06umt4qg/Jr1u
	A/FaixFcV+U23UrLN84L4HZJw4hjx/NYQti3CqbGmyEOhhzQu7/GjkneTHrI3iCg
	dmgvjsikNoh2P0ZDHcXvzao/wC5B5mbNzmxaL/ojWQY3w5lEuSy4W2ccVxqjE99d
	fp6QFjCBQqBATZtsUFkWelTgZ1aLLaQNsSsStrFXBUytvNy3OMjpGoIk9ah3WqXP
	khYfI7tQqJgWLPnxFb3YhUt8k/3OhtOEUPrROrKl95/RKFL48ulJDf3vKU+eD2EV
	gomY6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y1qvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:32:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0a5868265so38156175ad.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674747; x=1796279547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXveSJFcQwL36raoOk+JqlDXdJhqjUXocXOXXRact5g=;
        b=Vb60Tsl7WMsb8YMdeqshzetl0JcUEYDmyHUrX+d04vkFGsfJ58VYcwtwOn8NwO66XK
         1+RES99xfdRcXm2ynLq5OR1BbBo4lnkV7TAXwzE+L0mTZ1XJzcPUmJwwXibPDoTyheNR
         3/NiwWuiuyv8qEUAr+eN+7GAL3kfuSR2/wFC/5Xqoa36uWj82HkO8cigfauv6hjDIl6q
         3r/hGDaJILHhW6X4yPkCnqPiz0yXeVuyG3l451KD3bax/GJo5D2U3VuGd+tcpe2TjRtu
         RkL1nzRImTu/drP/X4jFTPb7y2ySE60KnS/bFOBD2tya5OgkQS8r/3fOvjEvmX1BngZb
         eydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674747; x=1796279547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXveSJFcQwL36raoOk+JqlDXdJhqjUXocXOXXRact5g=;
        b=FFANiz/U8aTDi3Tj1Qfp+M5OYjQUYNtWtuvP8cfkfpkNddFZQ9w4aiPN2W+P8m18b3
         iCbVgnr3XtPqnTIXQaUO8ZHoPVskJaQ/JU5aQh2sYdtY+3iHgRqdQHyHHiDMXmDR5gek
         XWKml5WRD7KDIJCfRxiueRFdfDnytDrYr0QyG8sLTdslJjIrmkxArnHrzFjY9rm/2G3I
         0VPA5Yx14LJXWr5c8aMeYQdEDtVtbo72eJhFW5FlPoQ9VlhUbYlTGxQF4Lvic+QWjmJd
         VQEqcjUNLPdcTmudelRingxSfu9ExgLaxfNpiM6+MH9yzsKp9S1K+3Tt97GCcV5C5CI9
         IveQ==
X-Forwarded-Encrypted: i=1; AL+hErEbSgpdZDqHHTtSeXv2V69MrqhQDqM8gsSQmLHq4MVnU/vowdXaKaytJ1upvf6j0s6sTOCmLt2ADdJu@vger.kernel.org
X-Gm-Message-State: APuU4Z9nT/ovVZ5DiThbX3L/cTUpX6O/dPP02hVTEVMK+E1a6bECPaYk
	VJTE5uwB7VtkPvqaq1rPl7hup8qQpUJ3AO90tVXKv4XJyHALWjaX9Dma6Z2/iTYla9/Iw1BQFYx
	wLmneOuE53wxwy2DZQX4ECjvyPrCijayDkQHERyeMLLfMwv7zCCRl9zFSz6jWUIDh
X-Gm-Gg: AZFdTZe9RcjV5X1YVslgKvsa89+tjTQ30ElU4dsSQbUDmi7Aj31Ml3s9caYjAImwS8M
	iLpbl5WC9GjdxhCRy5bwPjQGBBxwR8kBf6JVDGlKRpLdma+H9l9tF97CpMJWPTSQ3QaKPsczW6d
	V/YuUydIAua7uvStwtMi0C/r7tM+vp19c/h6Qxiwv4oX9aS72UZEqnKo2hXsiuC8jhBLNuNbZhg
	RAknmM2bU+x06Xu9Fk0ClnCR7tHGleNuUMu80oug3EA8TpgwUWGaZphwyYfyNTyNZus/tvshcmQ
	JDZXUnDSh6KWrPE86HnJNMjfcdEf1X5tl/eMITLClKr8pSxXltAgabGMUrvd6DQTcTNwdnTWr+W
	ezaIOsMyuDrt3HxX9Bb6dearRwSq5uPA5p7W3Wnfrf1HhF9RQ6B8CIs26Ia0YV/Ev21dBdLJWBo
	Z0VFT3l24L
X-Received: by 2002:a17:903:2407:b0:2f0:43fa:566e with SMTP id d9443c01a7336-2f043fa7827mr179016795ad.10.1795674746544;
        Wed, 25 Nov 2026 22:32:26 -0800 (PST)
X-Received: by 2002:a17:903:2407:b0:2f0:43fa:566e with SMTP id d9443c01a7336-2f043fa7827mr179016435ad.10.1795674745945;
        Wed, 25 Nov 2026 22:32:25 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:32:25 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:29 +0530
Subject: [PATCH v3 21/21] arm64: dts: qcom: hawi: Add DCP support
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-21-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=5143;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=giewpTQrZZVV20ml7CV6gG7RnmPP9xMRQcPv0COC1lE=;
 b=qU8Ttt4Szokv3b86bytlduDWEANO9b5MhZ9lnOQKHZv+ALr+8UtSQz2OrOvnBc2J7pyUmqzsp
 8RDEoYrk1LzAbuQWX0hAw+055JaZrWR50okBbCOCGEtYwmJ9IDdkLRB
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX4T9gxpZvUkWu
 Diq9IhsqaznQnwyX/dv+/DWP1dsSKraxvvQFHLCOX7tOIoUsLZwvNvjU3RuzTIoK9cEpHu4JCUE
 K4WkelxTDXG+UBTYinX9u+nRRz1qgUqaCONSGQOhrD1aXO8Zkf8Gubfm0n08brGRw7AeqPNCqEg
 ZuS0UT3fYpo4AcvFFFXLhIIGgsN2FlcwnXFCl9f3417xeShQ/oSDVYBCYhuAfhLyFd+7/cKL2bQ
 tI36Qn2IN62Usc/pu1oB8hP5a7hUwxtZbeWHuG1apx1uUT4zNzerS0koUQmn+IxR3RVNDyLzchH
 /zD16uXEApBL8ejwd92rRtbMooZTsPyap5NV7TD0ewWlOsAky/kYT8yy1kcP3kKXhRDiV98GiBM
 6jGeTAV+ffDlV1c9/018QqdTB9eusQl1wmnbhxWsRUVqoTTz5/3haPiR29/+0WCKdBBlXoEY7fM
 0xc8WeiShRHlWEZD4aQ==
X-Proofpoint-GUID: iU9WEhZAo-MCFgXUzAVNZcraCJg84lnA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXzVqm/EuhMsL4
 u1aUrbItPjPGM3qgOIV9d/5O4Ft1Tg4FZPazfWPsrbBW6DXVerWUZsCZ5Hk3bA6BSYUt3SYtk6d
 HDD2PflZPLtaURuAOUWm7Ywunx+kJYE=
X-Proofpoint-ORIG-GUID: iU9WEhZAo-MCFgXUzAVNZcraCJg84lnA
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07d27b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rMwJWs0V9SWzAl7URZYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Hawi display hardware is owned by DCP firmware, so the platform device tree
must describe the Qualcomm transport wrapper, firmware display subsystem,
power-notify channel, IOMMU contexts, and display graph used by the MSM DRM
driver.

Describe the Qualcomm DCP transport and its VirtIO-MMIO child,
the IPCC power-notify channel, IOMMU assignments, firmware-visible IOVA
range, and DSI display endpoints on Hawi. Enable the DCP display device on
the Hawi MTP platform.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 108 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hawi.dtsi    |  45 ++++++++++++++
 2 files changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index c38e5fab7a2c..50484d006db6 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -34,6 +34,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	display_panel_vdd: regulator-display-panel-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "display-panel-vdd";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
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
@@ -995,3 +1007,99 @@ &usb_dp_qmpphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&dcp_dsi0 {
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		pinctrl-0 = <&sde_te_active &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-1 = <&sde_te_active &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&display_panel_vdd>;
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
+	sde_disp0_vdd_active: sde_disp0_vdd_active {
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
+	sde_esync0_suspend: sde-esync0-suspend-state {
+		pins = "gpio88";
+		function = "mdp_esync0";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+};
diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf7..9d22243b97d7 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -6854,4 +6854,49 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	dcp: virtio@9be8000 {
+		compatible = "qcom,dcp-virtio";
+		reg = <0x0 0x09be8000 0x0 0x1000>;
+		interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+				      <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
+		iommus = <&apps_smmu 0x15a3 0x0>;
+		iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
+		dma-coherent;
+		mboxes = <&ipcc 13 5>;
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
+					dcp_intf1_out: endpoint {
+					};
+				};
+
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


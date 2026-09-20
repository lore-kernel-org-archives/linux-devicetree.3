Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9C43E022B
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895475; cv=none; b=glL7P8pbfs9zGIWlBvzw8M0doU8GDB7NipxL41IJWXyvtUJ96I+ag0UepAb8j9ll6DGjapXgWZgPQKRtftz+CSC/2Ct1jAsYOUqENEEIyr9eCAwSosddbzRFmdPVjYHvDCyCAh8Y3ji4N1Q56GyEZro7qaCYoHGt186dGjaeadg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895475; c=relaxed/simple;
	bh=ifJg6vweMIaItFGyrzt28kVYZ36rEVOLSUsG3WHvRPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKpcaVF7wrch82mtB7u7HMWBHjJK8FOT+t4o14E1KmkYPmoCfgSIyLYFMF1jnXPDFUxVO1hJ4405QESRIUuMq8Tz0gRdb9S+f0PLIRr9UwQSkBDfVwc7VZfmdL/szD2iMcQoZsPTBQWqZUkuDDsnszf0p3b1uu/E7xhbdUfFKD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSFVyuVU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWK+tqcT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSFVyuVU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWK+tqcT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8XhWH2367010
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mUv4TrqNQuf
	U6TYrki7rfdLQCmrfsKJNpjIXFaSgnTw=; b=eSFVyuVUGYOyIBpNpNXxLdbzmzH
	JZHkV8/dDwCLQAMczDn+8SCW5baZSfqVra7IdJIK4kWHTSb/zcC2t9z5bxB8wFlJ
	V0SSLhnp+hHJmkjBpV5qS/833/jmmmemm9PHmDBLEpUsII8Wt6Q259nhycH+E57E
	XCqRyVehcyc1HTw33F4732E6xlC+4wqx4rXGQ6qjVExjEoHUW2LJcFyEN6yyovu3
	VtnSeDO0lKsymR2aIrWh51BH7hBxxfAiAV9/8AdjEvwns/vk/oZaVuHeI8V6K/jt
	6zg4hqsBc/OSanGn+HNGq4amV8yTqpMp/gzYz/880M3vD1H5yc6KQ1xIA6w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd62s3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:11:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7348bd56fso898638a12.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 02:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789895472; x=1790500272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUv4TrqNQufU6TYrki7rfdLQCmrfsKJNpjIXFaSgnTw=;
        b=CWK+tqcTiXYs6bKxhEIxk8bJbLcCm5pIdHj/wWcwm17Q47dPQ14dFtexL0XM08/P2x
         gffdIekqd/bRqtoh99oNUMfEVmhx7/CXBaxK/dmq7cuZkktHslG8PsmBqvMtLKtrM3V0
         wNYN3ZKunhczyS3CsZefFvHPZkouisUJtuEz3G1erEoA/y/LUziwWYYmaVRYBJOGHIa5
         73b5TIfHYcawj4wSrULUnGwN00V2y2NkXwRkbCx4vSHoAnS1DQ9IIfcEv3C6bRzI0dvz
         89yardVoU7oxeWba2S+57brkaWlC8VIOBvoZQv7I6xUB1QI4x42cQB1OGd7DxyVLuTDE
         oarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895472; x=1790500272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUv4TrqNQufU6TYrki7rfdLQCmrfsKJNpjIXFaSgnTw=;
        b=Bn2OPz+tKDbTRUMacCj16LT81/OXi8ImZbTRYwLFXUxyOTY0bIU4EcOtUS0JxdKy9g
         75L8AxkO5i+ObNzxJCciF7+Sz0XkFW5+Nl/A/yke7aT9nYVR9drk55NLWoeEciSXebGZ
         2QP6DgGCwiLanQDWvlD92SumgZXs/ZmTXFHDxPslVWDwFXGN8W1G/GHI+q5mCSPTmNhg
         z/yKqW059epyIQ+MUZpnmX9KcpSCRtaxWm8AyH3+iTmbL/E6DVdZmysMl1W3jwpWsBUE
         +0Lj6IUi/fj58KseYC2YtTCOE0WEPT1P6ORMSyfi0tgS63JtQxc5t/Z8C86/qdNyRWZv
         2QEQ==
X-Forwarded-Encrypted: i=1; AKwUvByEMaSx5UgwTlJLdfqHvbmD8D/q+fmg4KvpoBi1xg7PBAmhStyRkEOVN6NGzLUqxTuMIpPZKVsuknbf@vger.kernel.org
X-Gm-Message-State: AFuF++nQKyFnuHnY/Mw/mKWslp48sHBumZ6bMFFz3DJm0e4esjP3eSG3
	elMF+DpgIy/gxeFndy39XRo32DTg61Ltd7wGmpbPfKMJ4iVY48uEHGBA6rzuV2402s1xRHO+LaC
	2zQiPaSPVzwVDIv+PFVuhk3Z5Txba6INsC3SLB4C41BQ96IatZemONEHRVyC+Rn6a
X-Gm-Gg: AYBFou0US3yslCKSJC3tSHP4Q7m+dlZGWwVoE7WA1IKMH9hZ50VarowOuquc9A8iarO
	60oBm7qCrMfEEYpIz8GJw5mi36jKQKTT1HW3Ygu/kdg3arVXkIZc9akJU5qVPNjC8V62DPSgQrY
	0Tp9o15wzerysdxTcmTmj5kFxK46lYUJk//gbEcg2YnCmgFek7LT9Y8kJyNEVjfhVS0DJwWpHp7
	p5Ma1gPcU1BBTx/TwUwJ90a8qYYWUhsUsQu3uhWZshJeytfpZKqKt6lQ58qzSz1HbI8T4O+Ra6N
	ijlvuu6dGcByR6J7iju/O+eHRCbhXVFFLheCRVrCLsysy1PPkXj5oWD6LkZhr9wjS8RfBbytQc8
	ZP7Y9jYR+BuhaOKvH53RmCLfftgRyj+xCKfLEXXqxVR+P7I9yoAJxlcCT4d4=
X-Received: by 2002:a17:90b:4a41:b0:39e:6a81:5a94 with SMTP id 98e67ed59e1d1-39e6a815e44mr6440478a91.40.1789895471739;
        Sun, 20 Sep 2026 02:11:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:39e:6a81:5a94 with SMTP id 98e67ed59e1d1-39e6a815e44mr6440457a91.40.1789895471334;
        Sun, 20 Sep 2026 02:11:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm10730242eec.12.2026.09.20.02.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:11:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] arm64: dts: qcom: nord: Add camss node
Date: Sun, 20 Sep 2026 17:10:51 +0800
Message-ID: <20260920091053.2214965-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
References: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX+8m4MOC3QZeu
 ZpngEdi+PMxC9YSqRUhQv4nVugxKjTEsDggIUI3w6RhQLrA+zVvtEBjIhXlIwq9389uQcGUOPid
 Fgza+51KfdeusgLOhvWExsOhqSJnPiYNMkP4iiVv3/mQ/WVGiOsYk4kt4C+ijix5Ecx3s1HC1WZ
 nrAdZ7IgXO+c9gO1Db5kDuGkMTLQ143NdSehzErLOroa2x4BD7rFSzhS9sQ0zQlxh2ZW3GMO6Kj
 lBR6U/AvZ+24KHoxVLoRtev9R3KBR257zlJRVQnUUyPhfZigIKVMdVhszt5ueR+vPzevyWQ+Q3T
 QlqHPTKoRTZUc7X6GEbMiS+9vF23wofzZ6mvagmBdfEW8sKxSVYysmBkQVZsFfumZOKrc5maANT
 ZYi7t+atA98tjQV5FZeExVJbQjnacmlV0llSrBupPtEfzSosTJUYVFs14VMd+a9oiDqlURF6bAW
 2iGJIOJqix5qco9EHqg==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aafa330 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=IJyGPJo1NslqkQ_NxU8A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ABgDJ0BOM7EEktW-bA1pOxHArTu4ulli
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX19sN75/zSsDO
 SgP+M6QD2QiuP32FoIqPPJFRniSrG55botauzCFTJTQkDN4mY2ZdNfZ1yMxtKTQw5/tWCXkSBGF
 MOOv+AaAAcXe1JiWg1ZCUPoFE/iK5QQ=
X-Proofpoint-GUID: ABgDJ0BOM7EEktW-bA1pOxHArTu4ulli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200131

From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Add the camera subsystem node for the Nord SoC with its 5 CSIPHY, 3 CSID
plus 10 CSID lite and 3 IFE plus 10 IFE lite blocks, along with their
clocks, interrupts, interconnects, SMMU stream IDs and power domains.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  64 +++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 121 ++++++++++++++++++++
 2 files changed, 185 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..3b9fcebf7baa 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -42,6 +42,70 @@ &crypto {
 	status = "okay";
 };
 
+&camss {
+	clocks = <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+		 <&camcc CAM_CC_CSID_CLK>,
+		 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+		 <&nwgcc NW_GCC_CAMERA_HF_AXI_CLK>,
+		 <&camcc CAM_CC_TOP_AHB_CLK>,
+		 <&camcc CAM_CC_TOP_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_TOP_IFE_0_CLK>,
+		 <&camcc CAM_CC_TOP_IFE_1_CLK>,
+		 <&camcc CAM_CC_TOP_IFE_2_CLK>,
+		 <&camcc CAM_CC_TOP_IFE_LITE_CLK>,
+		 <&camcc CAM_CC_IFE_0_MAIN_CLK>,
+		 <&camcc CAM_CC_IFE_0_MAIN_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_1_MAIN_CLK>,
+		 <&camcc CAM_CC_IFE_1_MAIN_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_2_MAIN_CLK>,
+		 <&camcc CAM_CC_IFE_2_MAIN_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+		 <&camcc CAM_CC_TPG_CSIPHY_RX_CLK>,
+		 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+	clock-names = "camnoc_rt_axi",
+		      "csid",
+		      "csid_csiphy_rx",
+		      "gcc_axi_hf",
+		      "top_ahb",
+		      "top_fast_ahb",
+		      "top_ife0",
+		      "top_ife1",
+		      "top_ife2",
+		      "top_ife_lite",
+		      "vfe0",
+		      "vfe0_fast_ahb",
+		      "vfe1",
+		      "vfe1_fast_ahb",
+		      "vfe2",
+		      "vfe2_fast_ahb",
+		      "vfe_lite",
+		      "vfe_lite_ahb",
+		      "vfe_lite_cphy_rx",
+		      "vfe_lite_csid",
+		      "tpg_csiphy_rx",
+		      "qdss_debug_xo";
+
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "ahb",
+			     "hf_mnoc";
+
+	power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+			<&camcc CAM_CC_IFE_1_GDSC>,
+			<&camcc CAM_CC_IFE_2_GDSC>,
+			<&camcc CAM_CC_TITAN_TOP_GDSC>;
+	power-domain-names = "ife0",
+			     "ife1",
+			     "ife2",
+			     "top";
+
+};
+
 &i2c0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 926ccf3bbe4e..9993091effdc 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1737,6 +1737,127 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		camss: isp@9b32000 {
+			compatible = "qcom,nord-camss";
+
+			reg = <0 0x09b32000 0 0x2000>,
+			      <0 0x09b38800 0 0x2000>,
+			      <0 0x09b3f000 0 0x2000>,
+			      <0 0x09c32000 0 0x1000>,
+			      <0 0x09c37000 0 0x1000>,
+			      <0 0x09c3c000 0 0x1000>,
+			      <0 0x09c41000 0 0x1000>,
+			      <0 0x09c46000 0 0x1000>,
+			      <0 0x09c4b000 0 0x1000>,
+			      <0 0x09c50000 0 0x1000>,
+			      <0 0x09c55000 0 0x1000>,
+			      <0 0x09c5a000 0 0x1000>,
+			      <0 0x09c5f000 0 0x1000>,
+			      <0 0x09a92000 0 0x400>,
+			      <0 0x09a93000 0 0x400>,
+			      <0 0x09a94000 0 0x400>,
+			      <0 0x09ab1000 0 0x4000>,
+			      <0 0x09ad1000 0 0x4000>,
+			      <0 0x09af1000 0 0x4000>,
+			      <0 0x09c34000 0 0x2000>,
+			      <0 0x09c39000 0 0x2000>,
+			      <0 0x09c3e000 0 0x2000>,
+			      <0 0x09c43000 0 0x2000>,
+			      <0 0x09c48000 0 0x2000>,
+			      <0 0x09c4d000 0 0x2000>,
+			      <0 0x09c52000 0 0x2000>,
+			      <0 0x09c57000 0 0x2000>,
+			      <0 0x09c5c000 0 0x2000>,
+			      <0 0x09c61000 0 0x2000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_lite2",
+				    "csid_lite3",
+				    "csid_lite4",
+				    "csid_lite5",
+				    "csid_lite6",
+				    "csid_lite7",
+				    "csid_lite8",
+				    "csid_lite9",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1",
+				    "vfe_lite2",
+				    "vfe_lite3",
+				    "vfe_lite4",
+				    "vfe_lite5",
+				    "vfe_lite6",
+				    "vfe_lite7",
+				    "vfe_lite8",
+				    "vfe_lite9";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 19 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 17 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 15 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 13 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 11 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 9 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 7 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 5 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 22 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 21 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 20 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 18 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 16 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 14 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 12 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 10 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 8 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 6 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csid_lite2",
+					  "csid_lite3",
+					  "csid_lite4",
+					  "csid_lite5",
+					  "csid_lite6",
+					  "csid_lite7",
+					  "csid_lite8",
+					  "csid_lite9",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1",
+					  "vfe_lite2",
+					  "vfe_lite3",
+					  "vfe_lite4",
+					  "vfe_lite5",
+					  "vfe_lite6",
+					  "vfe_lite7",
+					  "vfe_lite8",
+					  "vfe_lite9";
+
+			iommus = <&apps_smmu_2 0x1401 0x20>,
+				 <&apps_smmu_2 0x1460 0x00>;
+
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0


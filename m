Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA0493626
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519415; cv=none; b=CBjMgKtC2aatbrkugC2bobPC+ZSCHDpvZdMwIRTJ9zsUNHiOCz1NOkFcnm7phVprdUix5Ie+mRWS2x2CXmR4kGQilNvW/+QNV38GGlf4InqCPdTJX999CnGtEKH/VeuTaoHuoSbUU+wniljy9jyIgTIVpStpO//B4ckLNQ77k/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519415; c=relaxed/simple;
	bh=VivrnJyzw1k63XI99dhr+NAEdj70ZVGL24MrcYusUqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jf4fm7jjGIZdW77RwwlO2pxE/xapbwAH+iQ2Dh+lxs/BAckqewbugEbtRuZx41rW2nWKOHkPaKV+pjWX/DsquFzxZO/wB8YHhmXKLSq8wtOm4iesv/kXqOgsJTcguV+R+hAo/R5hwWx6HuBt/G6X5UGONX6p7PuVCK5IyNwEdRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A9E3gCOA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A9E3gCOA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8687630fso8013985e9.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519410; x=1789124210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWrOYU4JuQ6nJFq/9JxURKyDFma0yVnSENsR6aucZhQ=;
        b=A9E3gCOAEuZydNgr8Iot3BzyY1CFzMMlEbWO4ylQwf9v2vjdPvapfAbriUoLx6ABfy
         b9xWPK8rVejhp/4F9br8EXvv/yowhqFtlUeI8ido87XPHfoyZYwTznONSAx6zXlizkwQ
         oo8H1Zzds6LgUyfhthO39hDXJBl7iOglWS2Mki0tjVFN4itNVx+fjyYRg4Ly5GR8oUl3
         iwsKDixGqDL9PPqJpRAC7zzxdDe0qvsS/chb4QGeHx4lrKMvzTux7Ex76SwLK02sypqZ
         aefN3OeaW/rj920x/yuSAyUkh2WRWcamPgYVCbVeiRaPoNnXI8dn4kANFROXqn/RnQ9Q
         zhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519410; x=1789124210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWrOYU4JuQ6nJFq/9JxURKyDFma0yVnSENsR6aucZhQ=;
        b=JUALY4VNNYrknHjuQ2DaAFWOuvtuOgbRHeG5oVeJ2MuEsFkbZw7TIavPKmbJvgQUzl
         kgsXwKDJEi2CbJqOy6oWSjmAAnnt3065EUC0WDJcbwfZvmL55QRZJ2GudUfSl7WqfA/i
         leLBiPMTxiXW5l0yiHFNRKybr5vxrcCivVMtL01Afnd5Q+C1bIcLu7fs6EsjPVrSxcWj
         pTSYdwd0V2xC+la81geF5aPEuhB1QROlxl2DPZwymoPUT+x7m2cREgpd/nX0pEkybiaQ
         S6y1UBLu57iTqUZC/+XFwFOUWqcTuzSo82Hm1cnqPZBg7T3HLPZzNQOQKb/FDfbD8luN
         G/aA==
X-Forwarded-Encrypted: i=1; AKwUvBxpUXYUdnU1PsJUE0UvnwkBwS4ITVJw/3PFRNRm1Kss3zUuuXe8syQKyhHxm8+mK8F3dQ1o9km7nX46@vger.kernel.org
X-Gm-Message-State: AFuF++kB69ZGlFJNlbFz/nj0Q41FVDfg0WcYNbHt8MNnqUuvGcJUhgmp
	vfZ/1Jk927QbIWAx3sCSyyEEjwRfW+ZVQtuXvsz9YdAWD/xM0+BAyrEU+1FNrCGR6WA=
X-Gm-Gg: AYBFou0i7c+Mpd/Ei0SgbtE3HoS0BOxiS2EJDics0lmYm1akkY9lVNd6Cp91RHhyzTp
	1I2OOUGJzqY9eXVXcPA6F39eHqSGjfx59d242AVOHzak2EbU1ZYkga2LT+weVJ1bBXy9yyIrw0y
	QHHkYRj0u17CskN4GUtFtmSDpqPSGDXO+KHi/bxTkC9F70PHjZrvxZWTTKUtf+olm9tKvUP5bp1
	WbUDRjXLbhIDnLJpJip5/jnbpX7iji6Br8aM2o4+D5XuZpKWtNgHhyEiYrEJ9ao1IYNL1dfuiKh
	D4U6H4Brz2TdLyTtgqbNqofmy92PmcOn6kxgyJfCylHpR01KkK2hYSeeA89anEr+a4nVDUprLbU
	qljGnUDGr8Ks8fciX+5qMfBS2IomHRNcyqaEahBYvlIZhaGsnLgzAdyGyfEbzXP+v7Tu26QsKhL
	bYOrwxSfJ3XJ0d2/4s3rlg9uZMzoBPceRqMM8pL7UySAPDKhO119/OGwKydEINLSUqppRWhydy
X-Received: by 2002:a05:600c:620f:b0:49c:fa21:e73c with SMTP id 5b1f17b1804b1-49cfa21e88dmr27056715e9.18.1788519410184;
        Fri, 04 Sep 2026 03:56:50 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:49 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:37 +0100
Subject: [PATCH v5 05/13] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-5-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9905;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=VivrnJyzw1k63XI99dhr+NAEdj70ZVGL24MrcYusUqQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPmOjYSL2wkiC/CoKHsmql8C8CwvuE9Sgy0M
 PNm4KKDj/SJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5gAKCRAicTuzoY3I
 OuzkD/9c5NtODRdlnQ1qlRXpC2fNSHmbG177bTV+uWYjgZXwH0BJOlUSsINHjBDltRvqHh+3C4E
 n6u8DXI/mlmNdq++6YiCqrQJMCtbBsLg7Y7F93jtNByfVQE79a0g48dtOtAIY4QYnN9kBSyDliT
 vDen/RyKMBKimoMji8ITN3DwaJtDrAGhevXh+DP5RLgyQdi66R7gq7xnFU1em68dLmk7JB/9Hxd
 hhT0gg3vItBodDwLyg6H/OdlhyLTkIOIvZayadJyczec5lSdR/lsnHG7N0JwrxmYNoz6ngFKvXH
 lyMPib3ZXmGuQNPfb6xxgyprieLH4oJDhNVYHJbCaD+Aq+xhsl0VmHBX3CKgG//KoEhXU9SRI2u
 /XwaUMQHoiY/ePLux3lrETU9Y9tZMXZ0PKgATi1BN8NORHGPg9eXS/9zpaWs2vFkq2OmRKiNSBx
 YTzCr9v1/zXkxBzXJvP6WTqI3n5GYw3Y0SlZAjznrvVWznk/cTVD+KdE+WfbHDjrT/ypUXdMLiN
 5YELbcun8KhNiwn/A/eJP7eYkjUr2iUApIoj2chcBS6iSzntk2aAuqk7IJkoF9vG+FJWcy8tC8V
 pt6P/7oRwY8xKiDGtc/t85+OlSLgOiK2rxaM4BDm0uF3Qc7wassVI8r+sMQ7Z5ZeDwAj+8LA4te
 gKKktZanJgZykBg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add dtsi to describe the xe180100 CAMSS block

4 x CSIPHY
3 x TPG
2 x CSID
2 x CSID Lite
2 x IFE
2 x IFE Lite

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 322 ++++++++++++++++++++++++++++++++++++
 1 file changed, 322 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 9a854da9550c3..75366afd1b5b2 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -719,6 +720,50 @@ smem_mem: smem@ffe00000 {
 		};
 	};
 
+	csiphy_mxc_opp_table: opp-table-mxc {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+	};
+
+	csiphy_mxa_opp_table: opp-table-mxa {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+	};
+
 	qup_opp_table_100mhz: opp-table-qup100mhz {
 		compatible = "operating-points-v2";
 
@@ -5629,6 +5674,283 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb7000 {
+			compatible = "qcom,x1e80100-camss";
+
+			reg = <0 0x0acb7000 0 0x2000>,
+			      <0 0x0acb9000 0 0x2000>,
+			      <0 0x0acbb000 0 0x2000>,
+			      <0 0x0acc6000 0 0x1000>,
+			      <0 0x0acca000 0 0x1000>,
+			      <0 0x0acb6000 0 0x1000>,
+			      <0 0x0ace4000 0 0x1000>,
+			      <0 0x0ace6000 0 0x1000>,
+			      <0 0x0ace8000 0 0x1000>,
+			      <0 0x0acec000 0 0x4000>,
+			      <0 0x0acf6000 0 0x1000>,
+			      <0 0x0acf7000 0 0x1000>,
+			      <0 0x0acf8000 0 0x1000>,
+			      <0 0x0ac62000 0 0xf000>,
+			      <0 0x0ac71000 0 0xf000>,
+			      <0 0x0acc7000 0 0x2000>,
+			      <0 0x0accb000 0 0x2000>;
+
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_wrapper",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy4",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "cphy_rx_clk_src",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy4",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x60>,
+				 <&apps_smmu 0x820 0x60>,
+				 <&apps_smmu 0x840 0x60>,
+				 <&apps_smmu 0x860 0x60>,
+				 <&apps_smmu 0x18a0 0x0>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+			};
+		};
+
+		csiphy0: phy@ace4000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace4000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+		};
+
+		csiphy1: phy@ace6000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace6000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+		};
+
+		csiphy2: phy@ace8000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace8000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+		};
+
+		csiphy4: phy@acec000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0acec000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			operating-points-v2 = <&csiphy_mxa_opp_table>;
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;

-- 
2.55.0


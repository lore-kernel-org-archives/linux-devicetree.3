Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470DE3FF1D5
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735488; cv=none; b=rtujpY8/4gjJAw5JOpkniNl6oRPT05eyGqWtcWvqK+Cwc5bFIO81CqM39QbXP7cc80dhgmhhGdzR+S9sFjx9n45xnZBc6fE/6Jo1ZDgFFKdt0TGZx1VtgfcTK/Ab9ul/uWr1Z0NfzaqSq4LOfVXAc3D2CAUMPlcfH3rhz69ifjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735488; c=relaxed/simple;
	bh=EpfwTK8DMrHR7AmYBFu6yIOOpnWyI3tL1DbnN9T/mBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rvdr/DV5LoTorPm6IOct84Rj2RGYV0inetsvC6mPtn284jtTn14+CK5Dg+Fxo1EVKNugDcYI2qm1KHw5tmwmLqG7pNNcdtreRjzZ82Rjf3+0N9aGSfBI5e31HyyIizTqGz4RNhHDE6/1HhfOSRFWW0DJ36HCwQpjxuncUCwx+/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3XvLFHh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aadn2Krm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3XvLFHh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aadn2Krm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT0Jo2641507
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9XItsyKTjUi
	3dqEzWSdHOqYYfzfbJ9SxVGCmC0Jru0w=; b=Z3XvLFHhynfEXmoKptuebiv0wSB
	/1DT+gC1tmO9kYJLCGpu7uWvHI8j3yE8Ior5tHXU0jGpS0PW3T+E907VAjhJ9jVf
	C6M8WAoBR0p2LwIC/WzlSVcKNHuuLushMysp9bL5c908xag6u12wququdre27K8+
	SakaonsOXTpdxn4QDuigBR8prAv6eFqkQbh3wPKYQ5oVomrtD1E6hQdgDDadY7t6
	7Os8iNGoY2HtWkgWTy9Ycs1ky3UKZt+9BIOWzk4KS2xdPbwvvE8ZbOc2LtfE+sle
	o0PiUbw/5swfbOaVDwMoinrM+O9H9D06JiWIyOuS02YWlH6SrZBq9IiW/Cg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nperqv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:18:06 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bc17c67a7dso1824697e0c.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735485; x=1783340285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XItsyKTjUi3dqEzWSdHOqYYfzfbJ9SxVGCmC0Jru0w=;
        b=aadn2Krm103l4NgYrRSqDLpklbhnEIw0XOpIwVgBOX0m5p9Pc5rxsGPXCpTG3QXMgq
         50KoopEiuQyacz7wayJRd2TdxmimbLPzMTjaNu6i2MokNXBxUFqRqBCygsqMlb61FMER
         sh7eKFy87n1azUevIGEQ19W+CePyPBffx7VFD2F2EysevhHToQ1gENcy6TdBO3cpe74F
         u9Sbkxq3gt0SNjCu2RPgAgGEu1RG95orB7AeHATra7/JmocEwqNhXRWAoSpy2FfEqm3B
         uMCzO7+QhIdOF+CGfu/nU4X7yRNzbP3L+Irmr2YedAjnVLXY95lkqpFpxt1Evh++esNw
         kaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735485; x=1783340285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9XItsyKTjUi3dqEzWSdHOqYYfzfbJ9SxVGCmC0Jru0w=;
        b=EkRoKeGw2AsnahTBYcOw2Sstt8uppXsuJQeJ76FhjuPXR3nHyuuLu4jhraEwSYPWkl
         8T7eBJLJmS25htTn601euiJ3sm41uCMz4b+fLhqp8H1unB3sNEEIhFUk1j3+Rv0tvW+P
         j4AYrK6WQJiZ5H855cnzJB6qq2PYhf7py9YvWCkduFX8Cf0IqJJJYnSCBzbmx4V+QlUv
         t7kMKO9p8Zc5jTPRMHbC28UQC3LKSJO+pdqDxneljeaZ9Ws+PvSlgeJAiaio6XloDcQC
         dvU4Y2jcUHO3ZENBXBi1vOb11CltxwsYZkDSDhdyZuYtMYRdYc1maRy3dwGZNNQJ8X6I
         ifDg==
X-Forwarded-Encrypted: i=1; AHgh+RrTMon4cfl4LFEMXBLt5gXp/Ptcd0aHx0eT/zWIvrA9TlNiWcWMJ4w70TTCszfnE/uHnXCMC6jKlWZ+@vger.kernel.org
X-Gm-Message-State: AOJu0YyrcykJ+mPU7pmUlGBG57cf5oCbyV3XBHYjjkjNTyQPNMh3Z2DY
	Fl6ZcTrvye0r5dJoAN9/CFiAr+TH/c3jzISMdWWkuaic1butNlQ9KWxnlTMNV6fzzBd8aRlnhqB
	kKEb7kJvLKmQ3b11JCPq8aZQHd2IaCikVudR4uUPBWSLaTtGWUaL7WDga6krTSKo4
X-Gm-Gg: AfdE7ckYH7wxFmfT6ZLLWkJUVAGRnlqNqW4sV4Es54WHyGJubPma+t4YJLpvzIXBCZa
	RDGv9Id0hGFEUiKJAnjQPOoUlCuUIC+V6M5MQE3hCRPYezPlU53RaZdcnxAi3ffkCUBST/NIVT2
	qOkJ8mUBobNAWfjaXDPrEDnCMJnTAT9Fi0XFLBSkmB/bxzqzADol8ds/eEvxatVG9QdNnJ21lJi
	4tY0YpNg+00Yi/QIsrfBm/Gs+P6sgNclLOw4Xyo3aKyHfgKWTQN3TpggT49BL7glk6agJVxsmVj
	jS7Jd7BRaHPoGrbZgsBGA5RjOJcOf79bDv7hK49ocXsJU5GcTsClYeq/MBdaIP43OIUohKHIT7y
	1xSzy/ZWPBg2BF6LgR4jm2D5DlBn0GzwMWhs=
X-Received: by 2002:a05:6122:c83:b0:5bd:742e:3bbf with SMTP id 71dfb90a1353d-5bd834b56bdmr1949562e0c.5.1782735485481;
        Mon, 29 Jun 2026 05:18:05 -0700 (PDT)
X-Received: by 2002:a05:6122:c83:b0:5bd:742e:3bbf with SMTP id 71dfb90a1353d-5bd834b56bdmr1949548e0c.5.1782735484726;
        Mon, 29 Jun 2026 05:18:04 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f46e0d15sm6837519a12.14.2026.06.29.05.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:18:04 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Mon, 29 Jun 2026 15:17:49 +0300
Message-Id: <20260629121750.3469292-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX7NJvi4QESZRM
 KivOqWmQ3Zf81x+qB6rDL28vD6oJsJDEvQN4YaS32E6aLGUGjB5fwy/HtDBRvRICxqexK0OgE1F
 hXRZWxko4t1Yye1sKGtFAoVHyOSzfDWwyJANYcWqJZTe29FUIGl0hO52zLIgFhm3HPiTZaHnOmp
 gME6aQS8XD+w9NlL2rK+P0/Fac6I+OlHu2QRt2kCeamxuIq0bDNKu1tgyvtlBk4qI3J00A3tRID
 lxGijFfkhpFCh8/F0QiRC/hilgEa9rZd1otFuVYeb1jrYZVdUA6zSSFE//xiuVCVsQsxPOSrYDE
 9fbk2ukNDdh06k024rbq4a9OC8cnM3EGGrG3/0ybzgOSM53V8zbOPkXYi+QoAdUrWiJNqcqghrn
 TD55ZUPWyBq53YBzbP4tLEq8bMAI70to2BTbhYb6M/ojkMvjK/d8r2Et0/TvHlzn/n4qJ6Wtb8H
 wExwDaxqVQBKIlb+efA==
X-Proofpoint-ORIG-GUID: zPWq5XdUD13om-cLGBShhBvZ5AdrccuZ
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42627e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-kxhiCN9v7RFXMsq0RoA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX2lWlIO7imZra
 gOmhKVH/3gOFL4+vTh/FjFAySEJppH0iVBvwTN2iUXepqU1iAjGqc7Vdu3uYGdmMWUW1owsq/TW
 W6AUAMRaGH3ubtqZkhyAL58veqqMs3U=
X-Proofpoint-GUID: zPWq5XdUD13om-cLGBShhBvZ5AdrccuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290101

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 78 ++++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..d0cacb4ec35b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4472,6 +4472,9 @@ cci1_i2c1: i2c-bus@1 {
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
 
 			reg = <0 0x0ac6a000 0 0x2000>,
 			      <0 0x0ac6c000 0 0x2000>,
@@ -4616,10 +4619,10 @@ camss: camss@ac6a000 {
 					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
 					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
 					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "cam_ahb",
-					     "cam_hf_0_mnoc",
-					     "cam_sf_0_mnoc",
-					     "cam_sf_icp_mnoc";
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "icp_mnoc";
 
 			ports {
 				#address-cells = <1>;
@@ -4649,6 +4652,73 @@ port@5 {
 					reg = <5>;
 				};
 			};
+
+			qcom_jpeg_enc: jpeg-encoder@ac53000 {
+				compatible = "qcom,sm8250-jenc";
+
+				reg = <0 0xac53000 0 0x1000>;
+
+				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+				power-domains = <&camcc TITAN_TOP_GDSC>;
+
+				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>,
+					 <&camcc CAM_CC_CPAS_AHB_CLK>,
+					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+					 <&camcc CAM_CC_JPEG_CLK>;
+
+				clock-names = "hf_axi",
+					      "sf_axi",
+					      "core_ahb",
+					      "cpas_ahb",
+					      "cnoc_axi",
+					      "jpeg";
+
+				iommus = <&apps_smmu 0x2040 0x400>,
+					 <&apps_smmu 0x2440 0x400>;
+
+				interconnects =
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+
+				interconnect-names = "cpu-cfg",
+						     "hf-mnoc",
+						     "sf-mnoc",
+						     "icp-mnoc";
+
+				operating-points-v2 = <&jpeg_opp_table>;
+
+				jpeg_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						opp-level = <0>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-400000000 {
+						opp-hz = /bits/ 64 <400000000>;
+						opp-level = <1>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-480000000 {
+						opp-hz = /bits/ 64 <480000000>;
+						opp-level = <2>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						opp-level = <3>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		camcc: clock-controller@ad00000 {
-- 
2.34.1


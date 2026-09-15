Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A67D33ADB0
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437423; cv=none; b=iq5JuHRsrJ3rPZo32KO9AVj4xDLPVQRHeD+0x5qqkrtKvICgyTTNoxq7+4zdzb+4IymLpgZ+zHpJQbQw8caP2JP1L0PBBZ2BiUa5qC2xa6dsefZirEvON3g/zOOyXGiJBoQ6wOGscXrSaIK7jB1AWD2mj/NZ7tBJ746HzWo+F8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437423; c=relaxed/simple;
	bh=TwQQqAXNv+eNsbdBXMTiG3gTUmgPscjt5iWS5oI3URI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9TWtHdwLnNflkKhb3jdJzSZYaQYR2lMbMP8MvLow33PUunCHlqw8u76OZvdjlqul5+6kPf9oQK0HqmkzKYLw22NLzVdAIKA2j9oa+5h/PuyP52+QMe5P1JNFh5rag+W3TriFlFUrjWvIyG5xeONpykze1lqgGw+vGZnkFVemh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCiIzvBv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/B18ED+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCiIzvBv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/B18ED+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxs3Y2336073
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r47jXqaPQ08
	r88X+IzTvt9ViZfvPI8SUmbauCeDYO4I=; b=pCiIzvBvctXLD5+XVzgaXwjGuFd
	9h6B1XYIUNZs6PYxt5D+ax69wY06tfshF4hXFtmNezHof9uH+ZebqgDzeJg6gs3O
	Loo5uimoawLU+/cqXU15/sCLr+F4okwGrom6pE6I+tUL9XeF1t2iem6Haja/i7tL
	ObJnh4Fdm9GiJT1+gYEvSom8AUDOGM3EGBSRh48LZmyoXpQkfppPskVlbuo6xVtw
	huwCo9f/+IOKhHk3kbVmjTqAFyni5YFADsMQBDfSfjNyYZvkgC+iaj3yg0Ka5I4J
	yX2t9Ko4Y5tL2MXBMfSGxpawbQUgl7860e6xZbZc1ha5g7sPBZZxt6KHmeA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5uut4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:56:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso6242363a12.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 18:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437418; x=1790042218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r47jXqaPQ08r88X+IzTvt9ViZfvPI8SUmbauCeDYO4I=;
        b=h/B18ED+ErW0Ki41OD4kB+1ZAS3AYqxRAiqFKmyXo6lGkhiGq8qW/MeYG8ZrsLQzBJ
         dGVY4H5Z4PAGigFhN3u7jrH4CXw6ZebJy1XRdfwC+UT/nsxoJhuJZ1yyrl36QWbdEFzi
         dLuqaTQwyzjH63Z1JQGt0fL180YFR6HCjMnR0iwcFQ3Nw1jMRLViElVtiBPEayCxoljA
         yslTpchXS6RECW1/ZKYkrtfyaeb8A0XaOZxNOuGSFNgiebOGzn+Xzu+jK0HmbdMRJF4H
         9McY1BvSXatd6vNnyyKghjYahJTPIuDrYmDT1op9tJ/eaJ7PC4RjXc0Wn7qDl/Yitlo2
         zv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437418; x=1790042218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r47jXqaPQ08r88X+IzTvt9ViZfvPI8SUmbauCeDYO4I=;
        b=LBSBJqst2SpYhFJNvyzud6CB0G/PFsOEWhlJbpanVeMnWfBEiyHcGVolTlsPNSfZ0z
         NwKYYmafjkK2gcxqCrQ/G51Hf+PhXHTdSE0c+9t/o81V7gUIpzNtRoQ+naWNW+9CHNSA
         /GPV7YbCYQKtSTsek8LeybVgBIEwTE2G5TxXLO+u9RTYW20MNoDJIg5sxzCe1yk7zNjY
         2KBJLnS7wmzHbgNjPK4UbUvC85NN2lt0OcaZ8jWWos1XFvZam7CkfDlyTO1fTIe0Onj8
         KK83LFHd3vIej6bNBiTmXsceakt8z/4J8ni9On5nyk2sNuwnTHz6SqMRnr/PKKOG7pTB
         oP/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxilo7UHgBjMcfO45OMy9zpY2b96yn6gvLgUcDrI3dRtpNUtvDvb+u9N9D+ioNs7lCPaAOTn6zivW5B@vger.kernel.org
X-Gm-Message-State: AFuF++nebf3VQKsGs76qcuvVjmIymPe85AOlJieAXOardu4dQ/SXbbEq
	jXgiZawXLWbgnprOLjpreeOmXobLwAS3wwdVJs45JVxi8k4rD8yszRYj3A/zlA15a1/A4OKHdpt
	2OsETFO7BD5n4FdPWxpgkh+oX+6u6JeDinnkxbqBOdVxfy0/UR5toMN1Be9CsXuz2
X-Gm-Gg: AYBFou2Oy3NnWh2R7Slhhsns0Wlk2/91Suu6W5qvaZvQMJY7YqRsUx96ksbe//herjC
	g9/8JK4qZJ0sHjFE/f3UAUfx47PZsNiD/r3vytAWRmDZ621n9NJpbFIBTMv99mEwjrAW/IYRd5s
	7b0UcwjVwKcFPBOkB7QhnLtt+40alNgZqhdbnegVo8afVs4EBZb788aqQYBbaWEfN+192AJZe0a
	kz0yb+3ppfUOe2lExg1xURPPp4cOmhF7IfU8V4CQQVozsfs2kLdwuVmdTPwgVDt77Nx3VN1qKVG
	ZC1DhDSn3ohZMJY4KvXhshUXgP5KOfbUz+y8KQ5IMWlVm+lEg49qcMDBhHCLrwyh8kC142Reupm
	1gEYaC96VIB2636JYXX3X/mQB/KqCF9Q0mkLdMJ36YCHViJhROxel02hFB/Kk
X-Received: by 2002:a05:6a21:113:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3db4064b52amr11969740637.18.1789437417444;
        Mon, 14 Sep 2026 18:56:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:113:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3db4064b52amr11969667637.18.1789437416860;
        Mon, 14 Sep 2026 18:56:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm31115791eec.29.2026.09.14.18.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:56:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/5] arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
Date: Tue, 15 Sep 2026 09:56:28 +0800
Message-ID: <20260915015632.283642-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX/uZfkl6vN5uX
 9P6umZsDimv9FR3qLVRUaq+FTn5tVpAoFcq5sWiTQ7Uo5C4fY4LM+HNYe3dYQV5xVhV53LOl+bs
 DdjO+ZhFcAUTimYubbjAC90ugluTO3Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX66hR9Jqlwbzg
 qV+24zaLzIgtXnGsZv/mgWo0Zvg9kVUdL16f5E2yjhvNWHKDLpKKof2NE64aLWfRVBHDYevUp8Y
 CLBGyI48uoeq13t5+Ba67O3gC3Q79mNdWW9c+0r73Wdsa3ONJ4zrIHwVWk0amNw6H/9WhM2r61g
 LSZV7Xp0YFrMpCCDZVaTu0uqQ/4z18HvxITz9SXKBsSA0Eg7HLK7jDr5F1mdXr+IvFaLmgq2tjn
 W4IWml3MPJ/XjiiJ69XiTpDBnmwqJSSp26rLrOlB5r2ez/FQJLqCp/+4wzGQfAV91S3ayswe02O
 CRMXibiMfm3NwQPFsybJBJl8qs32M5lKWaQqFwcVp7gu7Iy5Gy9tWS2ezDIEQIFI3FxWRTbntw4
 MBB2Qk75MXjw36ERiio09S0b47HxxFnMrtXN51gQZqKWwQrmZkMwt/A2edr/UfGVu0wuDXGWrjN
 OtS3j4IBPDJuRkaYonQ==
X-Proofpoint-GUID: Kpo4gsOrd16mE5kzQ9p7H_QvKStz8Vee
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa8a5ea cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=7rqOJILHKxEwWM2FdFwA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Kpo4gsOrd16mE5kzQ9p7H_QvKStz8Vee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150024

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Nord has four PCIe controllers backed by a single quadfurcated Gen5
QMP PHY with four ports (A/B/C/D) and a common PCIe SMMU.  The ports
can be ganged into x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2 topologies; the
topology in effect is selected by firmware through the TCSR link-config
mode register, which the PHY driver reads at probe time.  Describe the
x8+x4+x2+x2 topology, i.e. all four controllers usable, as that is the
configuration the boards ship with.

Add the controller and SMMU nodes to nord.dtsi, and the PHY node along
with the per-controller clocks, resets, GDSCs, interconnects, OPP tables
and TLMM pin states to nord-embedded.dtsi.  The four PCIe pipe clocks
also become available now, so hook them up as GCC parents in place of
the <0> placeholders.

The controllers and the PHY are left disabled here and enabled per
board.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 926 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/nord.dtsi          | 297 +++++++
 2 files changed, 1219 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index c7ac2e66632e..6e79f3cb20e9 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -342,6 +342,738 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 	pinctrl-names = "default";
 };
 
+&pcie0 {
+	clocks = <&gcc GCC_PCIE_A_AUX_CLK>,
+		 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_A_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_A_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_A_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_A_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_A_GDSC>;
+
+	resets = <&gcc GCC_PCIE_A_BCR>,
+		 <&gcc GCC_PCIE_A_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie0_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie0_opp_table>;
+
+	pcie0_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x4 */
+		opp-10000000-1 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x8 */
+		opp-20000000-1 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x16 */
+		opp-40000000-1 {
+			opp-hz = /bits/ 64 <40000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <4000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x4 */
+		opp-20000000-2 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x8 */
+		opp-40000000-2 {
+			opp-hz = /bits/ 64 <40000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <4000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x16 */
+		opp-80000000-2 {
+			opp-hz = /bits/ 64 <80000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <8000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x4 */
+		opp-32000000-3 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x8 */
+		opp-64000000-3 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x16 */
+		opp-128000000-3 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x4 */
+		opp-64000000-4 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x8 */
+		opp-128000000-4 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x16 */
+		opp-256000000-4 {
+			opp-hz = /bits/ 64 <256000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <31506000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x4 */
+		opp-128000000-5 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x8 */
+		opp-256000000-5 {
+			opp-hz = /bits/ 64 <256000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <31506000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x16 */
+		opp-512000000-5 {
+			opp-hz = /bits/ 64 <512000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <63012000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie0_port0 {
+	phys = <&pcie_phy 0>;
+};
+
+&pcie1 {
+	clocks = <&gcc GCC_PCIE_B_AUX_CLK>,
+		 <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_B_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_B_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_B_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_B_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_B_GDSC>;
+
+	resets = <&gcc GCC_PCIE_B_BCR>,
+		 <&gcc GCC_PCIE_B_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie1_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie1_opp_table>;
+
+	pcie1_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x4 */
+		opp-10000000-1 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x8 */
+		opp-20000000-1 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x4 */
+		opp-20000000-2 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x8 */
+		opp-40000000-2 {
+			opp-hz = /bits/ 64 <40000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <4000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x4 */
+		opp-32000000-3 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x8 */
+		opp-64000000-3 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x4 */
+		opp-64000000-4 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x8 */
+		opp-128000000-4 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x4 */
+		opp-128000000-5 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x8 */
+		opp-256000000-5 {
+			opp-hz = /bits/ 64 <256000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <31506000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie1_port0 {
+	phys = <&pcie_phy 1>;
+};
+
+&pcie2 {
+	clocks = <&gcc GCC_PCIE_C_AUX_CLK>,
+		 <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_C_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_C_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_C_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_C_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_C_GDSC>;
+
+	resets = <&gcc GCC_PCIE_C_BCR>,
+		 <&gcc GCC_PCIE_C_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie2_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie2_opp_table>;
+
+	pcie2_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x4 */
+		opp-10000000-1 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x4 */
+		opp-20000000-2 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x4 */
+		opp-32000000-3 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x4 */
+		opp-64000000-4 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x4 */
+		opp-128000000-5 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie2_port0 {
+	phys = <&pcie_phy 2>;
+};
+
+&pcie3 {
+	clocks = <&gcc GCC_PCIE_D_AUX_CLK>,
+		 <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_D_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_D_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_D_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_D_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_3 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_3 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_D_GDSC>;
+
+	resets = <&gcc GCC_PCIE_D_BCR>,
+		 <&gcc GCC_PCIE_D_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie3_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie3_opp_table>;
+
+	pcie3_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie3_port0 {
+	phys = <&pcie_phy 3>;
+};
+
 &qupv3_0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
 		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
@@ -704,10 +1436,10 @@ gcc: clock-controller@100000 {
 		reg = <0x0 0x00100000 0x0 0x1f4200>;
 		clocks = <&bi_tcxo_div2>,
 			 <&sleep_clk>,
-			 <0>,
-			 <0>,
-			 <0>,
-			 <0>;
+			 <&pcie_phy 0>,
+			 <&pcie_phy 1>,
+			 <&pcie_phy 2>,
+			 <&pcie_phy 3>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
@@ -774,6 +1506,100 @@ mmss_noc: interconnect@1780000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	pcie_phy: phy@1b00000 {
+		compatible = "qcom,nord-qmp-gen5x16-pcie-phy";
+
+		reg = <0x0 0x01b00000 0x0 0x10000>,
+		      <0x0 0x01b10000 0x0 0x10000>,
+		      <0x0 0x01b20000 0x0 0x10000>,
+		      <0x0 0x01b30000 0x0 0x10000>;
+		reg-names = "port_a",
+			    "port_b",
+			    "port_c",
+			    "port_d";
+
+		clocks = <&gcc GCC_PCIE_A_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
+			 <&tcsrcc TCSR_PCIE_CLKREF_EN>,
+			 <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_A_PIPE_CLK>,
+			 <&gcc GCC_PCIE_B_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_B_PIPE_CLK>,
+			 <&gcc GCC_PCIE_C_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_C_PIPE_CLK>,
+			 <&gcc GCC_PCIE_D_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_D_PIPE_CLK>;
+		clock-names = "aux_a",
+			      "cfg_ahb_a",
+			      "ref",
+			      "rchng_a",
+			      "pipe_a",
+			      "aux_b",
+			      "cfg_ahb_b",
+			      "rchng_b",
+			      "pipe_b",
+			      "aux_c",
+			      "cfg_ahb_c",
+			      "rchng_c",
+			      "pipe_c",
+			      "aux_d",
+			      "cfg_ahb_d",
+			      "rchng_d",
+			      "pipe_d";
+
+		assigned-clocks = <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+				  <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+				  <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+				  <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>;
+		assigned-clock-rates = <100000000>,
+				       <100000000>,
+				       <100000000>,
+				       <100000000>;
+
+		power-domains = <&gcc GCC_PCIE_A_PHY_GDSC>,
+				<&gcc GCC_PCIE_B_PHY_GDSC>,
+				<&gcc GCC_PCIE_C_PHY_GDSC>,
+				<&gcc GCC_PCIE_D_PHY_GDSC>;
+		power-domain-names = "port_a",
+				     "port_b",
+				     "port_c",
+				     "port_d";
+
+		resets = <&gcc GCC_PCIE_A_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_A_NOCSR_COM_PHY_BCR>,
+			 <&gcc GCC_PCIE_B_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_B_NOCSR_COM_PHY_BCR>,
+			 <&gcc GCC_PCIE_C_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_C_NOCSR_COM_PHY_BCR>,
+			 <&gcc GCC_PCIE_D_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_D_NOCSR_COM_PHY_BCR>;
+		reset-names = "port_a",
+			      "port_a_nocsr",
+			      "port_b",
+			      "port_b_nocsr",
+			      "port_c",
+			      "port_c_nocsr",
+			      "port_d",
+			      "port_d_nocsr";
+
+		qcom,link-mode = <&tcsr 0x71050>;
+
+		#clock-cells = <1>;
+		clock-output-names = "pcie_a_pipe_clk",
+				     "pcie_b_pipe_clk",
+				     "pcie_c_pipe_clk",
+				     "pcie_d_pipe_clk";
+		#phy-cells = <1>;
+
+		status = "disabled";
+	};
+
 	pcie_cfg: interconnect@1ba0000 {
 		compatible = "qcom,nord-pcie-cfg";
 		reg = <0x0 0x01ba0000 0x0 0x7200>;
@@ -998,6 +1824,98 @@ nsp_data_noc_3: interconnect@1fe00000 {
 };
 
 &tlmm {
+	pcie0_default: pcie0-default-state {
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie1_default: pcie1-default-state {
+		wake-pins {
+			pins = "gpio3";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio4";
+			function = "pcie1_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio5";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie2_default: pcie2-default-state {
+		wake-pins {
+			pins = "gpio6";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio7";
+			function = "pcie2_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio8";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie3_default: pcie3-default-state {
+		wake-pins {
+			pins = "gpio9";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio10";
+			function = "pcie3_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio11";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 83760341456b..0fb292074b99 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1587,6 +1587,290 @@ rng: rng@10c3000 {
 			reg = <0x0 0x010c3000 0x0 0x1000>;
 		};
 
+		pcie0: pci@1b80000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b80000 0x00 0x00004000>,
+			      <0x00 0x40000000 0x00 0x00000f20>,
+			      <0x00 0x40000f20 0x00 0x000000a8>,
+			      <0x00 0x40010000 0x00 0x00020000>,
+			      <0x00 0x40100000 0x00 0x00100000>,
+			      <0x00 0x01b84000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			num-lanes = <8>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommu-map = <0x0 &pcie_smmu 0x0000 0x10000>;
+
+			msi-map = <0x0 &gic_its 0x80000 0x10000>;
+
+			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				device_type = "pci";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie1: pci@1b88000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b88000 0x00 0x00004000>,
+			      <0x00 0x50000000 0x00 0x00000f20>,
+			      <0x00 0x50000f20 0x00 0x000000a8>,
+			      <0x00 0x50010000 0x00 0x00010000>,
+			      <0x00 0x50100000 0x00 0x00100000>,
+			      <0x00 0x01b8c000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x50200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x50300000 0x0 0x50300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			num-lanes = <4>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 835 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 351 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 830 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 348 IRQ_TYPE_LEVEL_HIGH>;
+
+			msi-map = <0x0 &gic_its 0x90000 0x10000>;
+
+			iommu-map = <0x0 &pcie_smmu 0x10000 0x10000>;
+
+			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie2: pci@1b90000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b90000 0x00 0x00004000>,
+			      <0x00 0x60000000 0x00 0x00000f20>,
+			      <0x00 0x60000f20 0x00 0x000000a8>,
+			      <0x00 0x60010000 0x00 0x00010000>,
+			      <0x00 0x60100000 0x00 0x00100000>,
+			      <0x00 0x01b94000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			num-lanes = <2>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 263 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 154 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 110 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 258 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommu-map = <0x0 &pcie_smmu 0x20000 0x10000>;
+
+			msi-map = <0x0 &gic_its 0xa0000 0x10000>;
+
+			status = "disabled";
+
+			pcie2_port0: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie3: pci@1b98000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b98000 0x00 0x00004000>,
+			      <0x00 0x70000000 0x00 0x00000f20>,
+			      <0x00 0x70000f20 0x00 0x000000a8>,
+			      <0x00 0x70010000 0x00 0x00010000>,
+			      <0x00 0x70100000 0x00 0x00100000>,
+			      <0x00 0x01b9c000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <3>;
+			num-lanes = <2>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 111 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 246 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 239 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 234 IRQ_TYPE_LEVEL_HIGH>;
+
+			msi-map = <0x0 &gic_its 0xb0000 0x10000>;
+
+			iommu-map = <0x0 &pcie_smmu 0x30000 0x10000>;
+
+			status = "disabled";
+
+			pcie3_port0: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
 		ufs_mem_hc: ufshc@1d44000 {
 			compatible = "qcom,nord-ufshc",
 				     "qcom,ufshc",
@@ -1736,6 +2020,19 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		pcie_smmu: iommu@9980000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x0 0x09980000 0x0 0x20000>;
+			interrupts = <GIC_SPI 898 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 900 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 902 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq",
+					  "cmdq-sync",
+					  "gerror";
+			dma-coherent;
+			#iommu-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0


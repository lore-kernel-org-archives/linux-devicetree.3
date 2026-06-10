Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82FD403B1F
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090143; cv=none; b=szMPQDR7MDra83H+EmiFWUILpT7F7D/Pa7xYLRHNHUT8sH45tQ6ZELJzI2ylB6DSLYvj36KOqQTCVURA4Mduy07rlk9iu95sx83VsiCBtQIAmowcAoJRWdeKS9cY+lSYB7GdG0EXxqv3XMh7VLH4kD5bMX4SzQXzOep7hsx5gm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090143; c=relaxed/simple;
	bh=cvu4d2kJvKk8A926+S6pK3TKEENlyI4DCn/3JM86Gxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZDDz5O29njjnEL5WQoRnEV8WVD/IKQiLSdZCn/N5Sqfc6VBOrQ/RySacXD3639wNNCnzxGIOJRBWYAS1L3nDjgXvaMYqXME69rS1TjRhDu619yHzHx2JeoAyA/JtS92iKS/EioQ0Z1cCtMAZqIZM3X4d79J5pMrHVbKYg1RTVyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfwzKtDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyZY1Ciy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfwzKtDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyZY1Ciy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hmwD530323
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GOJL9pHM9VE
	8gBcDzy3zyIxAj4pWwyeRwtuxoVKFdhg=; b=XfwzKtDl0d3rlszhGG3SsVe0viW
	cR3fCz6dAzWf3U4uY/p7u2NhLPufoDfqDDEP/fV8SRYwu1BkNFPiqgMTpwvVE3AG
	cyGpJFpTlT1Oc0hVSP3CrT8GMKTpiF4om1m3n7+rJ9Vb0r3i0JVi7urTfYr5CVaG
	iKqQBwHNx5kQUYogQGLE9rZ6djnb1dRZn3f9nnb+RjakJ71H8Io3pV4r+u9fGHTD
	2FU+uEIdx4rjlw9e8giBGAbCMYfCsf/LXH/0zbzR9tYXjvWj5umzgWz04D7rqRAd
	UKSos5115zamXnwgrMDnwR3jG9yXAOpnp32ofSM+A2TreU5sbWw/fromurg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2j5em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2b64850easo20284625ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090134; x=1781694934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOJL9pHM9VE8gBcDzy3zyIxAj4pWwyeRwtuxoVKFdhg=;
        b=IyZY1CiywFAOdQ3l7iBmu9bqxP4wPccsBAYqype0GD6wVKSt/dHdyJoxrt88tP4yNi
         Zvn2q/udu9xy2Q3KWvMVdpg3Oc/kHmIJXVsiThsbY72DtesxULDQmrHajUXIYgEmLf3T
         z1mfpqa/A3JK67iGtyrNsrCQaWUtnRt71oy1tSvTv14/O3vHebtS0w2ZazMB1atlvNB6
         bubNjOdIcEuOTsyZLFyhVvw7vKtMjzVChDxHpe8OLMd2jtJ26BZVTM/gwieRyCqibebj
         e0z4/dzXsBRfJ07li+aJ4sR7llOXLO6T8F4/+TqupCiBmLsRNs4Znh/TNqrF9n88/ZHw
         qvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090134; x=1781694934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOJL9pHM9VE8gBcDzy3zyIxAj4pWwyeRwtuxoVKFdhg=;
        b=WOUNFH9IAYwSdPMtuBTg/1QNsNvA/BjKOcvzbgKSvNG6Um49L9CO5THLZJzZkzKwMK
         lTRnJdTVttM+3MqAAsso/qXYh0kWlYh9n16BPk3wsFraND4dRvwx8JpSvIKyMOLjrR1l
         3OhHpQlDZnW0uCHecSh3rk9U0Y/pnPQ9RLlKrr6R0oE5uFEAdtRA14RaGnB4U+LnIs5V
         QAZplnvJ3OKCWXOphfXIxb+efXekkZZMO5nL9jzKraLsL2+M3D0gtXLfPOzldmUSzB2X
         UmLDMfPO7f63Adz1saHTRrv17Tro5nkSM3g9VkXYGoiNQEuXIk6wDFZf+3CEBg5B84il
         PWgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7vuXA8OocXAqu8/WMFqtpd4egq6kTi7DzqCUJqCatLflrdp8wAz4gvpSyZHbORxEyghlYvB03lgEi@vger.kernel.org
X-Gm-Message-State: AOJu0YwUxwe8uPR6Z7il4AEIxwTI4PSgHt1Fdl3EnEOqovWJZKHt5Z8P
	n1HO4eBKqv4nuV0xhPgBOnNqfdrmxnTA96MkavV78XFALTEmPDAJv+3eQbvsiHAyRJwo1Pmsx5o
	utuGkZ3oWrqTO7VArFqe1QsCD3xHf2JIudwkAWqbXMAF6H8SNElR5kpjIi5W0CIZz
X-Gm-Gg: Acq92OHlXYWdUX77aV6yDYL78MwXoC8d2CTKGJDJtJZKJHBrKyXeEAoWISwFx8J6+B7
	7T4bJHXKMTRrZwjFSgE7L+52fLbm8ug55wOz6IfnCersFrOeC1rPBBNRRT8U+SXWzTygGssLR22
	Eobm/xEM1vs4xVqP982vg0YOq9u7PL2OaDdQ3jC9nyzyeDqbcIPlyjXStnRfgrGwtsyBK16lbYc
	AmMVGH5npd6l/lQ+jrsJBhJcneCjQUAUgO9BX/mgEi7vy6dMNC3dVMso4QlEWRu2MBlBRmhWQVX
	RvTNd98IFOv8bkXvwg3gwdL2HLi/kxofpZWmbsMN+laYSPgmsULk3sa43e5ZPMM9mAibOolyHVd
	9MwX9l+eWvuoMw2szsesBueww2NtAbMTCkbvXwulWbPcs0fpMhHbH8sPCkVw=
X-Received: by 2002:a17:903:19e6:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c1e82324camr251962135ad.28.1781090134256;
        Wed, 10 Jun 2026 04:15:34 -0700 (PDT)
X-Received: by 2002:a17:903:19e6:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c1e82324camr251961615ad.28.1781090133733;
        Wed, 10 Jun 2026 04:15:33 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa213asm256052545ad.35.2026.06.10.04.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:15:33 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
Date: Wed, 10 Jun 2026 16:45:07 +0530
Message-Id: <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a294756 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8Kt1xAjLd1AUGuYYDaYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX9kweR7PntvdU
 EXaNlIbWYeFcFwIa+XBsJLqp8DxZGfzQqfPreHUyionC+f4lqPKiLfBaXgSTJLOpKodwivU6dbb
 cD4p0XZxaOvJDQk/WMBK7Kwb5cejTEIOtOH6pHZnhyFMIQ/dkDDhP5LX20M67zf4MBXahHQ+UfQ
 lahORRxoJfN39GY8p4jwCJGywTVvb6LHerlEVWeCo//21n85K6dFMDgc0Q4si0RyKvEAMvXxQQC
 McD/ZiPkGHrvopgFqCr2yjExv9hnZHYbDYw/cfSEV22jk3z+9hyB1/vSepXOkcsVZyN7yzRO8O+
 XHWdsOpACXq3hfVxSxsZrmTxrs4nrfkttTXP+X8gYhD8hFy8NdpSCa4g44URXimHeQngDY143KL
 lY4GJgK4f3yNRkET/GEnonUUdCcHE5SV9TtmmfGZbEnB+9WfKvCj4stQFU31KeXdGcJjsyniAN2
 KtcDXFgZc1Othr4XkDQ==
X-Proofpoint-ORIG-GUID: _-CCsBK6EoKi1LcJr_7bJp9WKM6DuNmQ
X-Proofpoint-GUID: _-CCsBK6EoKi1LcJr_7bJp9WKM6DuNmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100107

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Add support for SD card on Glymur SoC and enable the required pinctrl
configurations.

Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
Signed-off-by: Sachin <ssachin@qti.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 91 ++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..0989fe39e7ef 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3927,6 +3927,57 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
+
+			reg = <0x0 0x08804000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			iommus = <&apps_smmu 0xd00 0>;
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			interconnects = <&aggre3_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			bus-width = <4>;
+			dma-coherent;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		usb_2_hsphy: phy@88e0000  {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
@@ -5714,6 +5765,46 @@ rx-pins {
 					bias-disable;
 				};
 			};
+
+			sdc2_default_state: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep_state: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		stm: stm@10002000 {
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618832;
	b=V2e6t/toToUp4Hu4lLAEZFcn7gEoEkXUeuMkrDapZL2J+2SonlOg5IGlo2/kuEQbEV1w
	 USCZyQpunZLV12GVcfa6pcmGqmbUwOpkD6dUfFixeKgi87boD+pfQ7YWI2g9KHORwPp/w
	 Xd+tzdqdPvpr+gOeI3x3u3pd2GbkzBR/8vjgVjojKaoHHwJPd2u+iTm10xUzqYJ0HHj00
	 UL81IvcnK26n1ztpjKpL1348GDbIl+9HP7MRkZq3vZKnT0Kdm36VLejJgITW+oF6rxSwh
	 FFaeOlU7JCj8LWtDwFmrdvcyGaZ78EKrrgA3mf6R39Z+OS+mLjZsUzTl8aiXduF0jZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xa2yBRKrVwpDPP1DRDU0RWXac09ILbJ4aA8qjd/NqFA=;
	b=LPAO6MXBb8Yrq/79cNGWLG55XC534u2/LSJ9501nI2g2Q/X/CO45jhvKYO+BQ+HQrnS7
	 FtSP1feJl0a4HDkapxkCuSVf0SsTfI1vb+IWQDX/wpx9s9yf5ttlVCGFP2DRHQxFUrOL+
	 qw02Qc0UU3JEQqYpFnm9+Dc43wTMZbnJ+x5crQf0vQ3I4ssvYYAN6S2QCLzSZpNFSxqwu
	 7MFOLo4x+BDeg3WQzAZTViwDOuW1iz8HDjBtG6rAnjGrmSIu7bugsnIKCrKzwro8PFi5m
	 51lRlxNlmUqWX+eu8UzUq+qbuHlLQeWdy9qWjWpwUQnNGH2OuvwNT3UzFbhLnbO3iGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TvXxghXl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ph6aBd/t";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395ED606A33B
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 395ED606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TvXxghXl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ph6aBd/t
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMbckv1853328
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xa2yBRKrVwpDPP1DRDU0RWXac09ILbJ4aA8qjd/NqFA=; b=TvXxghXli/NERShK
	lRziK11vQKFCUAa+qIOXMaTzIkMb4BTPYIV8G33dXQ+OJH7zkjmQNVV6M5paWk3P
	+nS1ozi3i2XQKnZ+aCUhJQmM8bUzkBQUT6WM7DmlGncUXHo9pw4VwDA06kQSeTAT
	hCC4Jn4OFLzUrKLDMWY3IiWcavGGZpP4m2YaTNx781hsV3yhSeRAHT4Y86muQrt6
	2wcakM3THVAMa7Td9kGNl5WMGjl5js0t81qUiy2jQuUBytT7+WbBygVQX2QXRg4m
	DOeLC3SaoZtJsPBE1cPOtcAJMrl7bZX3C4Rysx0czgeAcNtJrS86/8gmM2G10u+5
	T8AJ9w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxahj0nbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so2338469eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618830; x=1795223630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xa2yBRKrVwpDPP1DRDU0RWXac09ILbJ4aA8qjd/NqFA=;
        b=Ph6aBd/tZf5LC3ho61DxZb/8/1LfdlCmNBaiMnAnqOTDF7cDJbV6J0H2JW+S2Q6uWk
         FkGhVlC30vPz7kj1Gmmcn3jja9jqF+Sp/Nc074ZRVBJ7foK48Xv+FWiUX5RfznSE7hEC
         bp7q4+Ar7TMfVCjhYnOUNTPVAomFHEn+oj0/tmEWUAcRnzC1vs74ebkvENCr6OLbwa8U
         fC4s9SZoa2XEFTqvuRuECtiY/ANBw9wjiDmbaSpuSFQcdtDRP6RjwZ04geIO2YSSLY0b
         WboWNFBFCxVUt6qQujVp7J62bZGsVQygyDFZcwYB78obTKQatCXggriVULbCaM2jEYqh
         PjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618830; x=1795223630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xa2yBRKrVwpDPP1DRDU0RWXac09ILbJ4aA8qjd/NqFA=;
        b=Z771UAWRaKeJFX9aOj4U8eTO29fkBf1Kc8UM27fvhgE3BRf3nFTaJeDBMGjBAae/RV
         SS/fSLVJItEmoXT9e2HjzsMnvM1qWqR7a7M4jfo5kDE2ZfDAbyfdfcKuPqtagGeNhH9E
         3izMi4UmbaTEMHb4WL+i67MT+GH5vO0bZVXxk7ssfUAGsmWfa0m6pXDGqRVMDwVNFVCa
         rSjipXH73BIIaC5qItWUCt/IrXyufBQngBs2XaW5ShltR6ETNsr4uOCk0gIMR7/q5nGn
         6pLC4K4h2gHCQsUO15XpqHcqIIWPtMoiSEuvk/dO6RLnJ8rw6DSYqtSR/kOFb5ZQMhRy
         YVew==
X-Forwarded-Encrypted: i=1; AL+hErFlOaQipEVnD7sukw/MVfCYMEP0r0gp3Z3WwVih5kwqhQ+sFgZncSGCD+AvgU0Id16KuYEyD//DTWuS@vger.kernel.org
X-Gm-Message-State: APuU4Z/mJqv9yy6gpIkj+KiHILYkvVihgqlCW0OrNCaF69OBn6W+4x3p
	GXbgTTLMqBV7hMtnsJHm57t3SLcL3y7OruNHQd1xQO3+b//9MCvegaAqoZs0tz2dnJ3XWj2jDiO
	M/JS1kA2hffgzwVfPtgc1EsqQCN2E4iCrrRDI3MY97H5daILvpVHapTn6FBlTtWRo
X-Gm-Gg: AYBFou2txL43iQ8l27YNV/hLSfVyowWyggsU7pZqIpJsRvZec/wQtZ3q1kljYX5iEbP
	bjehTFPUAkYjw1C+D16vShla7pKpn5GS/MJS0xwFUk7oghRe7BnMQUlccu5pep2DN8tDHvpvXQ9
	a9D+LrX4P6wfABMfpt2lZUzOXhmCl7Lk2KJ4ro6D3O1L5v6MtlUsLyYZNVsjtUiL+9GFu1YTILM
	nY/iRiVCSQcuoyVLpK0EWRtsdJsL7AOgh0VmV/KhRG39p5D44FoPqdsvaN6eca9YHl8uaWf8E1z
	5bSNbxqgIZg5AwvAjZIaAYn1aJZGZvnGbGEtTawfojJs3JFDFHWKPUJi+QM6bhl/PEdJAvg87Tb
	jctUi2gCOa+2UJAPE0a7Y2+hiT3Js3LGRXx5umWWTgkLIiyMOTabza+CEqp5UEM/UWqd89ZDSXM
	ZPO2zmb1xh
X-Received: by 2002:a05:7300:d406:b0:35f:2bc:82d3 with SMTP id 5a478bee46e88-379662913ddmr3152198eec.15.1794618829735;
        Fri, 13 Nov 2026 17:13:49 -0800 (PST)
X-Received: by 2002:a05:7300:d406:b0:35f:2bc:82d3 with SMTP id 5a478bee46e88-379662913ddmr3152165eec.15.1794618829039;
        Fri, 13 Nov 2026 17:13:49 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:48 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:08 +0530
Subject: [PATCH v3 6/6] arm64: qcom: monaco: Add PCIe Endpoint nodes
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
Message-Id: <20261114-monaco_ep-v3-6-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=6008;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=7vC19cFzK+ATwY4+JnGLnuv6fmnvDEYRfdiPC1jqRUs=;
 b=G/pfbCt2jLgsf31xuUH3byqHYChDhpZsp+OkgduHkcPs1DmC8KjFn2AQeR3/kTkn3Dxjfow/j
 n2mNYlPmIX0CaCNx8W6aPCXZQp1DW8LyXpGBauxMIiqtqCCYmNA1xk2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX6x64wBM+xVW0
 sfKeJ6u5x05WxcgSyVTQrjBk4qtymhIYFmtZod5310CKSYGF89ckJDa7tVLYxFx536CphNGoEZl
 xIQWmBOoSF1fvu/HjfN7SwBYmInrOc3fgnf++j8PBQQeTZKBKClZliNIblr8LmrTqbORL0RF+mO
 HzK28hZV+pwCTfTMwn1IOKKsK6wDC+yPGzCkA+nlANom7ZKBL/QkujMbY3YTct2TpS7ssFYUPLA
 bKrJdyxLA02w+j6NTlo2tIcQEYoAXIJPGKzdTGcPu1PCaGd0of+Dv/SQodJezUdOG7IRz//5fwx
 SDdZOyCmpRiYr/e5jwQrs+RqgyiLk22RDXXYe/yzCUIc2WBfVrY0KFX8Tlz/s8jWRRMrKQU6PyZ
 2lbJmhFNM1cdjad2SDNHw1lzwCgKX4d0sVKJyaoImfF1oYOgys1zbXPcvNJBzc/XRGGnZ1J6LqE
 iUS1DGSGbXUP1NuwrIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX0WWwbBLDutyK
 1P8/Um2iwCuY+Lg0PtfsgQE+pAgyanQhVnPZrxmJtDg1gqm6znfgV4F3dU98dAlvCO/mPmDmSjS
 9zF3PDxViGnlYrwIiqV2K8UEf+ZCQEg=
X-Proofpoint-ORIG-GUID: mf1pnlzB0LdjXW72D91eWmvy4gAAqObE
X-Authority-Analysis: v=2.4 cv=Kv/YSmWN c=1 sm=1 tr=0 ts=6af7b5cf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hNZP5i6h11z2s_4BSHIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: mf1pnlzB0LdjXW72D91eWmvy4gAAqObE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140004

Monaco has two PCIe controllers that can operate in Endpoint mode.
Describe the Endpoint nodes for both controllers, including their
register regions, clocks, interrupts, interconnects, IOMMU mappings,
resets, power domains, and PHY connections etc.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 147 +++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index f27f0953ab9e..4a1325aaf072 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,sa8775p-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
@@ -2406,6 +2407,57 @@ pcieport0: pcie@0 {
 			};
 		};
 
+		pcie0_ep: pcie-ep@1c00000 {
+			compatible = "qcom,qcs8300-pcie-ep", "qcom,sa8775p-pcie-ep";
+			reg = <0x0 0x01c00000 0x0 0x3000>,
+			      <0x0 0x40000000 0x0 0xf20>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x4000>,
+			      <0x0 0x40200000 0x0 0x1fe00000>,
+			      <0x0 0x01c03000 0x0 0x1000>,
+			      <0x0 0x40005000 0x0 0x2000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
+				    "mmio", "dma";
+
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x0000 0x7f>;
+			resets = <&gcc GCC_PCIE_0_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc GCC_PCIE_0_GDSC>;
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+			reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+			wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+			pinctrl-0 = <&pcie0_ep_default_state>;
+			pinctrl-names = "default";
+			num-lanes = <2>;
+			linux,pci-domain = <0>;
+
+			status = "disabled";
+		};
+
 		pcie0_phy: phy@1c04000 {
 			compatible = "qcom,qcs8300-qmp-gen4x2-pcie-phy";
 			reg = <0x0 0x01c04000 0x0 0x2000>;
@@ -2597,6 +2649,57 @@ pcieport1: pcie@0 {
 			};
 		};
 
+		pcie1_ep: pcie-ep@1c10000 {
+			compatible = "qcom,qcs8300-pcie-ep", "qcom,sa8775p-pcie-ep";
+			reg = <0x0 0x01c10000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf20>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x4000>,
+			      <0x0 0x60200000 0x0 0x1fe00000>,
+			      <0x0 0x01c13000 0x0 0x1000>,
+			      <0x0 0x60005000 0x0 0x2000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
+				    "mmio", "dma";
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x0080 0x7f>;
+			resets = <&gcc GCC_PCIE_1_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc GCC_PCIE_1_GDSC>;
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+			reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
+			wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
+			pinctrl-0 = <&pcie1_ep_default_state>;
+			pinctrl-names = "default";
+			num-lanes = <4>;
+			linux,pci-domain = <1>;
+
+			status = "disabled";
+		};
+
 		pcie1_phy: phy@1c14000 {
 			compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
 				     "qcom,sa8775p-qmp-gen4x4-pcie-phy";
@@ -6239,6 +6342,50 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			pcie0_ep_default_state: pcie0-ep-default-state {
+				wake-pins {
+					pins = "gpio0";
+					function = "gpio";
+					drive-strength = <2>;
+				};
+
+				clkreq-pins {
+					pins = "gpio1";
+					function = "pcie0_clkreq";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				perst-pins {
+					pins = "gpio2";
+					function = "gpio";
+					input-enable;
+					bias-pull-up;
+				};
+			};
+
+			pcie1_ep_default_state: pcie1-ep-default-state {
+				wake-pins {
+					pins = "gpio21";
+					function = "gpio";
+					drive-strength = <2>;
+				};
+
+				clkreq-pins {
+					pins = "gpio22";
+					function = "pcie1_clkreq";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				perst-pins {
+					pins = "gpio23";
+					function = "gpio";
+					input-enable;
+					bias-pull-up;
+				};
+			};
+
 			cam0_default: cam0-default-state {
 				pins = "gpio67";
 				function = "cam_mclk";

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2BD3C5848
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161208; cv=none; b=n4z2NS8FLyS+JXZxUjpJqcpOMPHCuAlZeCD3Y7IB4Kk8iU3Jn4YWrbpY+mhwg1mIIf/lJbgA3JoFkSBcECcFXk/LA0pnI39eC8W4GGqshQ3gqiFlfPZ+Ad07Oa5237Bsvk5n6M9ZQKbh7xOWQlsbV/jh9JqJmJK0Iashyp6Ky6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161208; c=relaxed/simple;
	bh=TRINqUe4xwKAkE9bKbm01PDqmvL1+mAGSLwvgN/J4z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ioffhFy+zfiHgw01Yc9im0Kttot45zy989CAdJaM51LuBcYRAPIMnSzFetmSuKYHRjmxW31qIpTGf5HurQD1XJUZq05Fe9SF3tivu+xqnycQ+mJ1IDH1XutF0cB0Z7VtcmMDq9/9bol873VBJ/q+z6fcW7cLBacSKVroZd6F+w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXVqLKQG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwwzjjGX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXVqLKQG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwwzjjGX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52ast2680047
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdS8lJpcTMR3OOvAAebIM8DAFL+FJu0ANnnhwSRkLYc=; b=QXVqLKQGGVlhIski
	JVocdMpmZsuTQf/FgYoNBMX4PAog8dhr+1aswuhwvkLfH6IuhzPJm/vP1gE1I5Sy
	MRKOFjYNqv53eKh/uCyhxrcKvAgKQrppHIt6H93tJFA5r1CMbOu4+B1gCzG2EDRu
	od98gidx/o3YAiHOtVvXL8zQn02L/mRu0tqB6w+J6PIUOd1JVs2b9FsfRC+GhCKk
	zqIBCQpzC0lIriGLq/R5DIZdz548XT/AUoY4T6CnAMmUgEZSmcH336qyMS6uEndw
	v8gMLMHAxck5F/WcRaIzlWph7UsHI2pE0KyuxMFSwKjQfVKfCoIrjBkhzCRDX053
	tgtusw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwd7aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0aso1385782a91.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161203; x=1788766003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdS8lJpcTMR3OOvAAebIM8DAFL+FJu0ANnnhwSRkLYc=;
        b=NwwzjjGX656ss1ks4xO5kZr1ptUAWSDuiL3lJCqF+fDT16Pc1gjGCR4e5D4kPHatkM
         BejEAPfObj0ctJTJiQcIrzKbl/c4w7R/gWcAKa5+2D23m9wb4djD4lqXVddosduHKujo
         c9Mr64VKMgT8EI1fF+QSwL+Ffx+h2YxBW63upkmoMdbja1rY8r28LAPDw5PfrXPpIbZW
         B+w0d2fa6yYK8v5egvlcH4N9TWxfywIUm4Je2JySZoxcl5scgqGg2JtVETpaLaqePwIJ
         Mb7aY2m34N4J4tb6QDiRt65pOwcpFVpsVwLttW0HUdXk/jiB+N2ZFIKm4GlIGIpoFERC
         2uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161203; x=1788766003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdS8lJpcTMR3OOvAAebIM8DAFL+FJu0ANnnhwSRkLYc=;
        b=YN0OdO3Y7vtTdPExozu89N39LV920DvZrvAZoGmLaEuNFRA8W0RyX1ZtrF18nnZl4t
         CDLQgSFDYRXne957vNjznL35YxtkYiRdei8uykZH0D7XS/EDZY32GnVJQGq/RIFp7rrl
         Rj9Vft30ZiuVaAyAq5oDwkv278cGtOUy1164+MnwoKoxgvwZIpnPGFOxBq/jKhYWjKmQ
         YBLeKuoKL649iF916jX+7M4l/d+rswL2FbeTcbDtmuxZttPtVuwD2he2fbfQWGHXHqZx
         ab9/s8LIPLdOievjHmoCmETtKiJxakZ5MeJf2UjM1AJfqSGOrFN+9e7qQPI5w9SAZ7Wd
         l1Bw==
X-Forwarded-Encrypted: i=1; AKwUvBz6FmtlIsmLLvL/kWkGV4EvLHYkjHOg20vD64yjAkUJJcb5o31lImY9V6j9iR4hNtMogRyswHEVDGwN@vger.kernel.org
X-Gm-Message-State: AFuF++kDGbqTPUbQs6OGRA4gSLGXLQAqhQ2QpGtLapBCrDveqe8Mod8p
	hHYHBF4chGguo39/MFe7EvO03chYFsrpanOUtODU1lyAggD1/n6WeqPNEb1u4sjDQDpkYL+RPqM
	Yo18wJcyjY6ZqQnF3VzlJVunxHLZYn7Sa7tRpm6wcJwF4XjSgOQ2ITPAE7cZDRDiJ
X-Gm-Gg: AYBFou2oSr2+ApE0WvTTQBsFqzW7kW5seNWBFlmM4PubKl0gMwQaySRiTJlBp+NhcIw
	aoC0Pk4K+J0QEhJsbYQimLg5/h4fKEG8HY0z1DWzUJ5dmD2sZ3hzcM/sVX4yWuYIKpTbc6vGkC1
	p7WT3oJMBKuZdfzvUR3Z+DeTW6A/8jo3uBhRhg4F2T4JamTNnQO3VcFl7z4L9NWJaKSiUogAKNl
	e0tRrU2Y0cweW2PUhWnon9IYV7+pR6NNGtINQju0cekcvShHbHB3t62GiiuYSMk+tyt5dNToymC
	gy+8CwcjTobAhEyrh8iuqH+ZlzKgtYm5dkwN0Q9RQyKLcbTszbpE7tRrCwGs7kIxY/GtCDDT+SV
	eGxyIKuHNumAh7BlX6rIBnt3qKOUm/0MfpbFF
X-Received: by 2002:a17:90b:4b92:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-398da5e900dmr6017271a91.4.1788161203411;
        Mon, 31 Aug 2026 00:26:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4b92:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-398da5e900dmr6017225a91.4.1788161202906;
        Mon, 31 Aug 2026 00:26:42 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm31327059eec.14.2026.08.31.00.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:26:42 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:56:05 +0530
Subject: [PATCH v2 5/5] arm64: dts: qcom: shikra: Add PCIe PHY and
 controller nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-shikra-upstream-v2-5-406661d75afa@oss.qualcomm.com>
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
In-Reply-To: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788161164; l=5578;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=TRINqUe4xwKAkE9bKbm01PDqmvL1+mAGSLwvgN/J4z0=;
 b=QWYT2K6ppw2yIOxWeQ8o7aXJg8DoyCXyyuMypmQbNe6rS1dmX7jHB5cHLGKWUBNIqid57mQaq
 mp4X5gfndE7AJs9QQz7OOTwoOkuglxtA/UK95jodr2020qvAhPqdBGr
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-GUID: i6VDtfU9A3-LTShdmQ-AWGyvaT3i5uID
X-Proofpoint-ORIG-GUID: i6VDtfU9A3-LTShdmQ-AWGyvaT3i5uID
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX9xzHu0pmJM91
 KurvEcz5Z+5A7OkQcmnX6ZkmTN9L/2B1XjHqmCS2nPKZUrn1B90seM62txG11UnZ85SZlI+CQiR
 FzjrbUxUVvOovfawFMq/TJG8w1PxDgI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfXztWclL0qMKIW
 GypGuy6+ppZjtTvmcOpyelRNqfWEMFNmFE2gIPfIl4kfI2k06lMphSA2BqlawgvoWetxBAZA11e
 alCYLCDoaoRPOHaf2B7gmleJTnZJ1c0PcTMPgGyWsC35ZKf4L519Tv4ei9fEu+tZlVsCdaNllBE
 XX2Iy9j84baM30e5FoV8y2HuRrBJDB9oSyQky6c6TrLlQWjOY0a2y6wfWCyPD5vNqqxCQV85/ry
 DJNC4iPjbIShoLw6mE0pjMUYTdqaQvSeyW3W634/m409zoNw4C4euzP9FI7E3iLP66gzKAp7St8
 l12qLp9cJGu2Oir8pQgbpOzwHD5NnkAUP5cosbC3kVVx+F/O4QQjgHRaOZ05f/tfZ7WeWTDZfkd
 kncc59cZtDHGCqvocTRu3Lw2CKsVgML1yCDP2YP9bhKp373YBWkFabRgCy4dV8Oo+iDURxB7Vrl
 e3nrKEuALrd4A1+xt+A==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a952cb4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Cqz-_Xt_bCzV1Ft-kyEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310063

Shikra supports single PCIe instance with 5GT/s x1 link.
Add PCIe controller and PHY node for this single instance.

Shikra controller supports upto PCIe Gen3 but the PHY is
only capable of Gen2, hence limit the max link speed to 2
to avoid link-up failures.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 159 ++++++++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683..9c190e6e92ce 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -899,7 +899,7 @@ gcc: clock-controller@1400000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <0>,
+				 <&pcie_phy>,
 				 <0>;
 			power-domains = <&rpmpd RPMPD_VDDCX>;
 			#clock-cells = <1>;
@@ -998,6 +998,163 @@ tsens0: thermal-sensor@4411000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		pcie: pcie@45e8000 {
+			device_type = "pci";
+			compatible = "qcom,shikra-pcie";
+			reg = <0x0 0x045e8000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf1d>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x1000>,
+			      <0x0 0x60100000 0x0 0x100000>,
+			      <0x0 0x045eb000 0x0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>,
+				 <0x03000000 0x4 0x00000000 0x4 0x00000000 0x3 0x0000000>;
+			bus-range = <0x00 0xff>;
+
+			linux,pci-domain = <0>;
+			num-lanes = <1>;
+
+			interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			interrupt-map = <0 0 0 1 &intc 0 0 0 499 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 500 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 501 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 502 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_PCIE_AUX_CLK>,
+				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_DDRSS_MEMNOC_PCIE_SF_CLK>,
+				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_QMIP_PCIE_CFG_AHB_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ddrss_sf_tbu",
+				      "noc_aggr",
+				      "qmip_pcie_ahb";
+
+			assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&system_noc MASTER_PCIE2_0 RPM_ALWAYS_TAG
+					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					&config_noc SLAVE_PCIE2_0 RPM_ACTIVE_TAG>;
+
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			iommu-map = <0x0 &apps_smmu 0x800 0x0 0x1>,
+				    <0x100 &apps_smmu 0x801 0x0 0x1>;
+
+			resets = <&gcc GCC_PCIE_BCR>;
+			reset-names = "pci";
+
+			power-domains = <&gcc GCC_PCIE_GDSC>;
+
+			/* Controller supports Gen3, but PHY is limited to Gen2 */
+			max-link-speed = <2>;
+
+			operating-points-v2 = <&pcie_opp_table>;
+
+			status = "disabled";
+
+			pcie_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* GEN 1 x1 */
+				opp-2500000 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 2 x1 */
+				opp-5000000 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+			};
+
+			pcie_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0x8>;
+
+				phys = <&pcie_phy>;
+			};
+		};
+
+		pcie_phy: phy@45ee000 {
+			compatible = "qcom,shikra-qmp-gen2x1-pcie-phy";
+			reg = <0x0 0x045ee000 0x0 0x1000>;
+
+			clocks = <&gcc GCC_PCIE_AUX_CLK>,
+				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_RCHNG_PHY_CLK>,
+				 <&gcc GCC_PCIE_PIPE_CLK>,
+				 <&gcc GCC_PCIE_SLEEP_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen",
+				      "pipe",
+				      "phy_aux";
+
+			resets = <&gcc GCC_PCIE_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE_RCHNG_PHY_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;

-- 
2.43.0


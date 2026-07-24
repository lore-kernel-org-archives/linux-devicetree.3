Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B053C1969
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887309; cv=none; b=CDmwtGfEMojSJVPOMnq43gfSVA1LV6Dd1kBze8La80mEixjVy6vpBTSAN/kfJDrmnsLkbssSp96tceKry9e9aFO9oHFP6znuru4hJeOo4NdRN12INhTBbYOcDO08T+Vdf1JgK5fiN2MUtPzVgmZaIHVzU8bV3dZU2g2gOZE3Z2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887309; c=relaxed/simple;
	bh=hyTOKcpwPWKyfMsDcINd0R5RdTrU7dcb60IgUh0eZ2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mA09ZiVp1SIuSF1veJdvD97mAtAhw3DGayl5cKqq5pLOnp4a1g/BXNmXWayf7+Ckrf4BOmmjld+7Bj3UkR2AzkVgoIzgE7qVx+qxecvCV5VnSK+HfAEKymHmdleL2iNFdLF/0KEjrO5v+CZy65EsUHpsd1PJxAThxu5NcCvDHHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2ZIKFvX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3og5P1y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2ZIKFvX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3og5P1y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4m08s2139238
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WduPkfsO98MzTe1cDnjCOpmXsTo9dOupAcanfLCPKI=; b=L2ZIKFvXrh7JaPTN
	ABvaC1MLyk/B/iVfWgsof7FgVCaP+RNUX/esxb34wb1XaSzYimU/Ttrh3EfCVPW0
	ek2KNYXwDaXRqJbEBfNeq5Q7payLywor9vMg4ErapxJXfDCsyT90H6e+kzDT9T0R
	nUocxhcUUE2Y6YGUc1GhGjsnsK0WMhjeZ2Xv/jhfc/6m2K5unepGI2vx2YNCS8xW
	s34runUvkkeH+BMDCnIbHq/8KboCAHhsr3y/jwCCKWy983Z3eAuIe9Rk7zJ5fFYq
	hylG3bGTEIe7an9vdzUAHW6Q5bz/yPF/TtWSXfxEKbhd4UbCgtuAkKS1fSKTNBqt
	FwnyCg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1b8x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca860baea9fso568653a12.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887306; x=1785492106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WduPkfsO98MzTe1cDnjCOpmXsTo9dOupAcanfLCPKI=;
        b=G3og5P1y0ZV5mjX6I1Yytm/h2uSS/x/5ZN1zj/GLam2iiXs0BZz5fJXGWqjPiJgbDv
         EYbYBBvz6ht8pw/C3dTzUwZkjCX0mp6yxFsmigg0cPRI1wAN72WZGIFHb/RKTjbPRv9K
         CjB/Ab0gBIvt2gXkhjj6vVNxn4JTLwDQF9w0b2RT9KzyJcR2ndWPPeBaMSjIY8HoSWO+
         pVZ9hZuPpxJWtcrpXQmasasDa67lEUzR04Bvhjg1PGsxlCJIOslI/gjzaqCzX/DcIzdN
         ldimu5nrwP22tZTLchZSUwUzOiBUL7lQU/JSzm2RsHnkwT/JVXwKkvEUOmiAkx1fyBQt
         RS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887306; x=1785492106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WduPkfsO98MzTe1cDnjCOpmXsTo9dOupAcanfLCPKI=;
        b=dWEZcTZ+dfbT46BqZorVsb17xz8vwc93QzQF+68XbWXko3JBrGWqSccTyY9nG4RMmZ
         6qhD5U1VOiBRVFpDji2pBRx1hlfozzTZeBVb4DcLmEfj3NUiNpWWobd6XAtB6bHvzbHZ
         JxNayZ+p3/ihyz+9WDRRaY8/aV2SUrR3A/0aDe0fRCuEc8JVwL6jnFHaDK6JFMscXD3b
         2K6alfddY5BIe1mX86paqUI1IRzI/QEyXPvWCTBgsLYzcWQTIwD5s6HAbdbEVefMruWp
         C1mpG3jk+uwzr9Sn1+gIs62coUV4VPhBxcKsXktOKbL3U1r+gAVYauAuFO7FHyZfJ5YD
         7SMA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/bycnTLTDJosRMDi8YvN8AJ2V53gk5QQMA46RUf95TGHaJRGe/2he+GHYHsLKIO83r1hICSXtaBpE@vger.kernel.org
X-Gm-Message-State: AOJu0YwRjcnDax61yQhgH+Gdc07qoirZViS26kY6GwwLpCAceiDOe4hl
	Gqrdl0O5KPBhJ4MmWixYLdx+rST3aBaqmE/CbY/vxdZoCe8+CfQ97qcx5dv3mMcejdzIhZD/Fpj
	hrIjV9QgxlY2QEP+dRnz7yzx338lt7ccHr4TYMEZbYJRgBaLxC9ey1GSQtUyiByR5
X-Gm-Gg: AR+sD10bfyYGxqYe6RBX3zMycCOR0mNGBnJM1Wt8DZCVdJIzMNbQsvgfyq/kU12qdCU
	QYbhA//+e5kNu+WJonfaPB9ggDDAEbQry2wYz83K1j4TKBp4Gx/+iJut2GCGsftjCSxNQouKUGE
	7jP9Fd55KxIhu2SCru1+8w6JgW9Zk/DOVykRJmVHgwrBWryfr5KT8R1X1fWoOGW3siOFQo1Jacq
	/FVzv8GQnJMLYXOSbjl+QSb4ngqfNjyBkUwMnhgudlaqkSKvLhuYp84VnbrRzHQZ1NOx4ayDjWc
	AU7PlJXMdK/llkUuZ5ZNY0cH/IIKlXVvpISgUuihBpIUqYwmHp/B/YcYloUeOiDiYXOjti7ji41
	cHFzDkoID1Cu/xt5JhSv3HLKhm4D+qntaZp5GMbri6+pY7Hs=
X-Received: by 2002:a05:6a21:4d02:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3c44afb90b4mr7249978637.5.1784887305548;
        Fri, 24 Jul 2026 03:01:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d02:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3c44afb90b4mr7249934637.5.1784887305016;
        Fri, 24 Jul 2026 03:01:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm29515427eec.29.2026.07.24.03.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:01:44 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 03:01:21 -0700
Subject: [PATCH v7 3/6] arm64: dts: qcom: glymur: Add PCIe3 PHY and PCIe3a
 controller nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-glymur_linkmode_0724-v7-3-65c8469c6b65@oss.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784887301; l=11078;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=hyTOKcpwPWKyfMsDcINd0R5RdTrU7dcb60IgUh0eZ2o=;
 b=0LQ1tr7ix8s+5Ja3AToq+4XPGSeDONqnPRhCZPYipZg+ErDz2gb3IyiEBXtKRDqkr7BPIuPj8
 YPZjfnKoQ6WC+7Dh3C/E9uMwVIzixPXhgTd73D20wXOBjeH31gHrmaB
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: SWFv9zi7MmGm7rO_VeGV6Z_dls4H3p1U
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a63380a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zsmDXcllmZpmxbIW-i4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX8bM0QqK62f4o
 zD9kCYzC3ovxanAFMArthVkogcQlR+RKntJm4DUn5yn8VnuQsdowflqnUPZugwYutyGsjbKh18z
 X9xW8A5TlRnZZ9gxZHbH87AUxeydcAd1UE63gYY8rtPOIo0ntIf+3+jOMc+kkme451HuCeP1EaG
 SPHKC/Usu+auiX8L9BrjZHrCt05rFi5Vvl9diJTh4/fdP/g0Ej3B2EDRSIgSSOHf/XMjYqIGT5g
 OXKuxUMEzLc5yb9D1zOm5ifeVTmUc/Z07Q1zyimZszR2YacGblCP97802SVD+lFuDn3vmhfeP4B
 v3qWazzNSywtqjVO2WnBzw2+BqX4W+j/wH6SFeupitu6K4RtQaGCrgak3J74cEXoVirCvm6nWRp
 iYuGPMXQbcUKTrp9wPpKquYA3og5wI+pK9H29jPdeLNaF2nFQBKCUHG49vBTu9WhtBocch9XNHq
 Y/gzHdFuLtQC9GsgStA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX5XgZCwmfdgSx
 HaAOBAJviY61h1+zvYRDndaVeIa3n4Ta6Ur65WACoWSpZR3HmREFhKR60oaPj5lEeq3URz5/5ys
 Bzkv15MwTlRjss0loEZzgUE+XE3XqJM=
X-Proofpoint-GUID: SWFv9zi7MmGm7rO_VeGV6Z_dls4H3p1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240091

Add the PCIe3 PHY and the PCIe3a controller nodes. PCIe3a and PCIe3b share
a single Gen5x8 QMP PHY that can be configured either as one x8 link or as
two independent x4 links (bifurcated).

The shared PHY is modelled as a single pcie3_phy provider; each controller
selects its sub-PHY through &pcie3_phy (index 0 for PCIe3a, index 1 for
PCIe3b). Update the GCC pipe clock parent array to reference the new PHY's
clock outputs instead of the placeholders.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 336 ++++++++++++++++++++++++++++++++++-
 1 file changed, 334 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..6e17f3ddbf15 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -801,8 +801,8 @@ gcc: clock-controller@100000 {
 				 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
 				 <0>,				/* USB 2 Phy PIPEGMUX */
 				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
-				 <0>,				/* PCIe 3a */
-				 <0>,				/* PCIe 3b */
+				 <&pcie3_phy 0>,		/* PCIe 3a pipe */
+				 <&pcie3_phy 1>,		/* PCIe 3b pipe */
 				 <&pcie4_phy>,			/* PCIe 4 */
 				 <&pcie5_phy>,			/* PCIe 5 */
 				 <&pcie6_phy>,			/* PCIe 6 */
@@ -2330,6 +2330,62 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		pcie3_phy: phy@f00000 {
+			compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
+			reg = <0x0 0x00f00000 0x0 0x10000>,
+			      <0x0 0x00f10000 0x0 0x10000>;
+			reg-names = "port_a",
+				    "port_b";
+
+			clocks = <&gcc GCC_PCIE_PHY_3A_AUX_CLK>,
+				 <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
+				 <&tcsr TCSR_PCIE_3_CLKREF_EN>,
+				 <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_3A_PIPE_CLK>,
+				 <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
+				 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_3B_PIPE_CLK>,
+				 <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe",
+				      "phy_b_aux",
+				      "cfg_ahb_b",
+				      "rchng_b",
+				      "pipe_b",
+				      "pipediv2_b";
+
+			resets = <&gcc GCC_PCIE_3A_PHY_BCR>,
+				 <&gcc GCC_PCIE_3A_NOCSR_COM_PHY_BCR>,
+				 <&gcc GCC_PCIE_3B_PHY_BCR>,
+				 <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
+			reset-names = "port_a",
+				      "port_a_nocsr",
+				      "port_b",
+				      "port_b_nocsr";
+
+			assigned-clocks = <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
+					  <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>, <100000000>;
+
+			power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
+					<&gcc GCC_PCIE_3B_PHY_GDSC>;
+			power-domain-names = "port_a", "port_b";
+
+			qcom,link-mode = <&tcsr 0x5000>;
+
+			#clock-cells = <1>;
+			clock-output-names = "pcie3a_pipe_clk",
+					     "pcie3b_pipe_clk";
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
 		usb_hs_phy: phy@fa0000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
@@ -3711,6 +3767,8 @@ pcie3b_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie3_phy 1>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -3722,6 +3780,280 @@ pcie3b_port0_ep: endpoint {
 			};
 		};
 
+		pcie3a: pcie@1c10000 {
+			device_type = "pci";
+			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
+			reg = <0x0 0x01c10000 0x0 0x3000>,
+			      <0x0 0x70000000 0x0 0xf20>,
+			      <0x0 0x70000f40 0x0 0xa8>,
+			      <0x0 0x70001000 0x0 0x4000>,
+			      <0x0 0x70100000 0x0 0x100000>,
+			      <0x0 0x01c13000 0x0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0x3d00000>,
+				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
+				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
+
+			bus-range = <0x00 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <3>;
+
+			operating-points-v2 = <&pcie3a_opp_table>;
+
+			msi-map = <0x0 &gic_its 0xb0000 0x10000>;
+			iommu-map = <0x0 &pcie_smmu 0x30000 0x10000>;
+
+			interrupts = <GIC_SPI 948 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 942 IRQ_TYPE_LEVEL_HIGH>;
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
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 848 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 849 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 850 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 851 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE_3A_AUX_CLK>,
+				 <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_3A_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_3A_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_3A_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_3A_WEST_SF_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "noc_aggr";
+
+			assigned-clocks = <&gcc GCC_PCIE_3A_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_west_anoc MASTER_PCIE_3A QCOM_ICC_TAG_ALWAYS
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					&pcie_west_slv_noc SLAVE_PCIE_3A QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			resets = <&gcc GCC_PCIE_3A_BCR>,
+				 <&gcc GCC_PCIE_3A_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc GCC_PCIE_3A_GDSC>;
+
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555
+						     0x5555 0x5555 0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55>;
+			eq-presets-32gts = /bits/ 8 <0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55>;
+
+			status = "disabled";
+
+			pcie3a_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* GEN 1 x1 */
+				opp-2500000-1 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 1 x2 */
+				opp-5000000-1 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 1 x4 */
+				opp-10000000-1 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 1 x8 */
+				opp-20000000-1 {
+					opp-hz = /bits/ 64 <20000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <2000000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 2 x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+
+				/* GEN 2 x2 */
+				opp-10000000-2 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
+				};
+
+				/* GEN 2 x4 */
+				opp-20000000-2 {
+					opp-hz = /bits/ 64 <20000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <2000000 1>;
+					opp-level = <2>;
+				};
+
+				/* GEN 2 x8 */
+				opp-40000000-2 {
+					opp-hz = /bits/ 64 <40000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <4000000 1>;
+					opp-level = <2>;
+				};
+
+				/* GEN 3 x1 */
+				opp-8000000-3 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+				/* GEN 3 x2 */
+				opp-16000000-3 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
+				};
+
+				/* GEN 3 x4 */
+				opp-32000000-3 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <3938000 1>;
+					opp-level = <3>;
+				};
+
+				/* GEN 3 x8 */
+				opp-64000000-3 {
+					opp-hz = /bits/ 64 <64000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <7876000 1>;
+					opp-level = <3>;
+				};
+
+				/* GEN 4 x1 */
+				opp-16000000-4 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <4>;
+				};
+
+				/* GEN 4 x2 */
+				opp-32000000-4 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <3938000 1>;
+					opp-level = <4>;
+				};
+
+				/* GEN 4 x4 */
+				opp-64000000-4 {
+					opp-hz = /bits/ 64 <64000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <7876000 1>;
+					opp-level = <4>;
+				};
+
+				/* GEN 4 x8 */
+				opp-128000000-4 {
+					opp-hz = /bits/ 64 <128000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <15753000 1>;
+					opp-level = <4>;
+				};
+
+				/* GEN 5 x1 */
+				opp-32000000-5 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <3938000 1>;
+					opp-level = <5>;
+				};
+
+				/* GEN 5 x2 */
+				opp-64000000-5 {
+					opp-hz = /bits/ 64 <64000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <7876000 1>;
+					opp-level = <5>;
+				};
+
+				/* GEN 5 x4 */
+				opp-128000000-5 {
+					opp-hz = /bits/ 64 <128000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <15753000 1>;
+					opp-level = <5>;
+				};
+
+				/* GEN 5 x8 */
+				opp-256000000-5 {
+					opp-hz = /bits/ 64 <256000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <31506000 1>;
+					opp-level = <5>;
+				};
+			};
+
+			pcie3a_port0: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie3_phy 0>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
 		rng: rng@10c3000 {
 			compatible = "qcom,glymur-trng", "qcom,trng";
 			reg = <0x0 0x010c3000 0x0 0x1000>;

-- 
2.34.1


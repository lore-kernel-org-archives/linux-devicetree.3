Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3F035B650
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474842; cv=none; b=MKZdOlQPozzojSoZ1aMPASDoM1u2Vi5rUETJq1kIfJjj05ulfV0xgu/mnADmTReD6cVDBuuWQxqDGdnWdtbHduXcJjZIoJo+U9pvUAl2PBOI3Qz3ycIqzOMbUYpiFomoFUNpq4pkHetE3m6+LgxZjnaUW7vHhYTPQB8gTFQEEi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474842; c=relaxed/simple;
	bh=MsC3j2tem4FZcoQZTIFpAAXfCmNseQgByW8DJZvce2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3bHysEXwNE8O68/bCEcuK7PKtUSO8FX5bgyUkL5RZiOxX6s4p1G4iaGDMGnzVLg9ei5VAk9byeGS1GjoOCmEGNf+KYB2DLdw/5HZfwi9aP0lP8blUZJiWEmmUl12QOqMYDonMQgDbu2X8DTP1ZQDBMdoiluekkJqMkZ4zoInOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQpo6Q0z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H38eZpe3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQpo6Q0z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H38eZpe3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5ANsD3509218
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wuVZHmfYv92aZUJ3qm7BsMpBhwigJN89pTIY/+akmmc=; b=AQpo6Q0zdB50h/Wa
	pcD7ok0Jt1wn1iz9MzbeHvNq8k6b/E2dEEXusGbJbheyXt2oLYG4mNI5UaxgO5uz
	7wo/vy/PPrpVPxii9PBV2IeP/5WX1Y+xL6m1sXObw6z/9gxHLnUqNoWH2nd/IzJd
	l0xfliMO9OOEmac9MhakusEQ/wagIrI6+XNFSc93/l+3moCPF6Ise8g0RAgbzoKW
	zGfm//3XES9xMYVz76Ri57pUoqBVvLfOEUxmcr7LW3FSusMJthZrDbpiioJflYe7
	/ef0TwgCpTfc996zKfwaUysqS7A9tbSNNg0hYjVOZw2imLwcGtbNTjSQGs5fgDtS
	STTMLg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnavr0bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:13:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84842381150so1258185b3a.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785474839; x=1786079639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wuVZHmfYv92aZUJ3qm7BsMpBhwigJN89pTIY/+akmmc=;
        b=H38eZpe3nELbHctDT6Y07DiksbuRLYCRm0GTxCqMIOhV/fTjl3QgnHO9RE/FU1/IxC
         +F6BSTJ6VB4Ct/toV4cojlN3MZ+vauBO98HVLx4cFo9FqbHE9+ufRaOmwGRUZFKTYy7q
         W4CTFh5Q2RQzLeLF84mkIg61LT5hfmPd5arnjqInfc9ILo6U2byyXINydbIBQDrJmFRC
         o9PqoCD32pD3L144AKD7QrwqoOoNQ3nIpVTCKt274uP4izaFpmB/R6pMQ4yxNlShSVLo
         2p8RV8ZD8F1Hes5UKPXPMn5+mAG1hrZqvzTJ7VjWQIj5M29zTWkpg4qvUXnEc3AwEcAy
         e1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785474839; x=1786079639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wuVZHmfYv92aZUJ3qm7BsMpBhwigJN89pTIY/+akmmc=;
        b=s4Z+P9LpadXTH+Z0KyS58uGCvmLFDeBQ4HRzb4EYiXp7M0AgwllLqP7YTbugXzppOi
         4AmHkN/pYNq6ZExiCtoXDe/UDCW7fYGaf+iSqGlArj1fwm9Gr80skq+6YhXwHcTv+za2
         DyIvryjXzucWhq7Uv0E+mkFt8eJJ5SdlSKoQJWzPAiiwCfT97rKTOzMBVin3AUO04qcU
         DCmG/+vx85DfCgFN5SylhUQaKz1sV6zueF5bIJNz59nMSyNNcwMtxLHPB+031SmCzocg
         QZoyOdpZQElsW4bCo8SRiWTmO69DtauhB2KMo5LlliZX+U/Va1kns6RgbOST0kWJQ/U4
         /xaA==
X-Forwarded-Encrypted: i=1; AHgh+Rob6OOg2xVG10VObi7yHOdheVDYgiEq9KPDGP/gyRtWMcBFbMQiDEul8B71ponipHdG9n/kdHHyyoz6@vger.kernel.org
X-Gm-Message-State: AOJu0YxJnZJ9o5K6l4GyZaSmtbD0cLZaTIs7c1fv3JqOU4XA4bJat2RJ
	6NUUlr59GQ/vk85PrLMGobPEF1CkMOOr82Q3Lmh3ERj8nK/GMo7Jn4OrsHw5hHe6pAc5Q9W/mwX
	6W46PP8Zg7RWzNdBFHvlx9cqE9P2uMPJVT15D8Guk7itkjVWELI2VXl49jf6DrNyu
X-Gm-Gg: AR+sD11rjsJoohcTcfHyZw0tJEe8wAWRPRtDMZblKmzcU9TUjgBZg8Utk/4vn/kFCam
	h/FpCcCHT1+IfDLO9L8WMeagsN4DVDzlh/OlX37mBXzgWab1Axb4mFP0plHP7EArzfgZp4mXxz3
	pZcIbLcEq2csGE/YdpzNrILzPSznfWEmCbNNOd+SN0r7OVibW3/67MxqHUKvmc4MftMXeLbsaZa
	bUwfkTGUAvOvKD1JADJlYmpKxxr9r5pPrFmPBWhTCK6/zXGDE3tSfbv7e+o9TpMLQIl0PJKDC75
	SCksj5cV5wuz+0Q/1RWXEMQiXMAReO4kD2rk7fgxHHu/YzsVPRxKjX0viYIBJJwmpY69ZLjJL1G
	ANk6nAnv9t9kQpQHk2+EK+AlCJmY108mqgwe9NwWqV5TmBMA=
X-Received: by 2002:a05:6a20:cf8f:b0:3c3:9dc1:f4f8 with SMTP id adf61e73a8af0-3c91b535c8cmr489217637.76.1785474838828;
        Thu, 30 Jul 2026 22:13:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf8f:b0:3c3:9dc1:f4f8 with SMTP id adf61e73a8af0-3c91b535c8cmr489188637.76.1785474838325;
        Thu, 30 Jul 2026 22:13:58 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm976435eec.20.2026.07.30.22.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:13:57 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 22:13:54 -0700
Subject: [PATCH v8 5/6] arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy
 with dedicated pcie3b_phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-glymur_linkmode_0731-v8-5-a455265ad8bf@oss.qualcomm.com>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
In-Reply-To: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785474832; l=4363;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=MsC3j2tem4FZcoQZTIFpAAXfCmNseQgByW8DJZvce2A=;
 b=elcQLXDJpx/4Wqz0EbGv19rOxwV4hvmNq+Damu84rmhbxoX4pKEItXjYgmJ27pBs3Quid1vdL
 PDpWy8oSrSMA5XJjRHEiX05arz5exA7cfQCut/Ol9KwrDe/PfQkntnn
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzMSBTYWx0ZWRfX+p4qti8uZSM4
 f1pYdle6mPYfCYKCMFn9L9W5BFVoO54oAgvt4qQyVGvyCVwFMFzkwsW4m2XSAe5akd+MkQQBIyE
 +EdngAWwFIY3BrUm0d9SPdbXWFiLEvoOCXrPuNKE7JIInr0yjMCp95iaBbRvPyHc/iQVO02En/a
 3g8rPOKqpjY6iXu3PuQH7CaHIOAGK6EWYIINnmI0a1nElJRu5zr4haC858Jw56gOvmvIcFu1N83
 +1H4RwGwfCf6GcuK5IUgIHm1n69lgQy4LJMGJUvCNUB7vafAamercA/WKmJ/2SoikVvI+idkYy1
 FXvyixNR1I7U5DyjpjWZgcyBMwwLqPN1K9Ew4Lv9pieNKWsVkwBb9orsq0LU/F/l4RQuCUVmYvC
 ER7UWDFPEsOb4cBKjk0oCJdklVttJyuFlR7bE7rzowvVoZZB7hrouDKxtdLSIVntKf++qVLnjCI
 WFxD4DvIbORF5z+7ddg==
X-Proofpoint-ORIG-GUID: Sctepvy7tZmrj1k8_txbHK5NYQTJZ8QS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzMSBTYWx0ZWRfXyazP2QTFtoy1
 uiq5yDsg+MuoY+/P06s+jGCfur2JoTKrRIZlpbWrGe9mpYmz8AZZ33mioqi02Ury7tYvtT9KyET
 Iu/xAWY9fR0XXI2LSd6/1YUN81ddTFY=
X-Authority-Analysis: v=2.4 cv=ZYMt8MVA c=1 sm=1 tr=0 ts=6a6c2f17 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZTTPuMnDdfme7OPWMlMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Sctepvy7tZmrj1k8_txbHK5NYQTJZ8QS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310031

Unlike Glymur, Mahua only has PCIe3b wired up; there is no PCIe3a
controller and no shared Gen5x8 PHY block. Delete the inherited pcie3a
and pcie3_phy nodes, and add a dedicated pcie3b_phy using the existing
qcom,glymur-qmp-gen5x4-pcie-phy compatible.

Point pcie3b_port0's phys and the GCC pipe clock parent array at
&pcie3b_phy instead of the deleted &pcie3_phy.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 89 +++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index e6c059708912..a59c5ed7b48e 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -22,6 +22,8 @@
 /delete-node/ &cpu_pd16;
 /delete-node/ &cpu_pd17;
 /delete-node/ &cti_wpss;
+/delete-node/ &pcie3_phy;
+/delete-node/ &pcie3a;
 /delete-node/ &thermal_aoss_6;
 /delete-node/ &thermal_aoss_7;
 /delete-node/ &thermal_cpu_2_0_0;
@@ -79,6 +81,52 @@ &config_noc {
 	compatible = "qcom,mahua-cnoc-cfg";
 };
 
+&gcc {
+	clocks = <&rpmhcc RPMH_CXO_CLK>,	/* Board XO source */
+		 <&rpmhcc RPMH_CXO_CLK_A>,	/* Board XO_A source */
+		 <&sleep_clk>,			/* Sleep */
+		 <0>,				/* USB 0 Phy DP0 GMUX */
+		 <0>,				/* USB 0 Phy DP1 GMUX */
+		 <0>,				/* USB 0 Phy PCIE PIPEGMUX */
+		 <0>,				/* USB 0 Phy PIPEGMUX */
+		 <0>,				/* USB 0 Phy SYS PCIE PIPEGMUX */
+		 <0>,				/* USB 1 Phy DP0 GMUX 2 */
+		 <0>,				/* USB 1 Phy DP1 GMUX 2 */
+		 <0>,				/* USB 1 Phy PCIE PIPEGMUX */
+		 <0>,				/* USB 1 Phy PIPEGMUX */
+		 <0>,				/* USB 1 Phy SYS PCIE PIPEGMUX */
+		 <0>,				/* USB 2 Phy DP0 GMUX 2 */
+		 <0>,				/* USB 2 Phy DP1 GMUX 2 */
+		 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
+		 <0>,				/* USB 2 Phy PIPEGMUX */
+		 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
+		 <0>,				/* PCIe 3a pipe */
+		 <&pcie3b_phy>,			/* PCIe 3b pipe */
+		 <&pcie4_phy>,			/* PCIe 4 */
+		 <&pcie5_phy>,			/* PCIe 5 */
+		 <&pcie6_phy>,			/* PCIe 6 */
+		 <0>,				/* QUSB4 0 PHY RX 0 */
+		 <0>,				/* QUSB4 0 PHY RX 1 */
+		 <0>,				/* QUSB4 1 PHY RX 0 */
+		 <0>,				/* QUSB4 1 PHY RX 1 */
+		 <0>,				/* QUSB4 2 PHY RX 0 */
+		 <0>,				/* QUSB4 2 PHY RX 1 */
+		 <0>,				/* UFS PHY RX Symbol 0 */
+		 <0>,				/* UFS PHY RX Symbol 1 */
+		 <0>,				/* UFS PHY TX Symbol 0 */
+		 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+		 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+		 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+		 <&usb_mp_qmpphy0>,		/* USB3 UNI PHY pipe 0 */
+		 <&usb_mp_qmpphy1>,		/* USB3 UNI PHY pipe 1 */
+		 <0>,				/* USB4 PHY 0 pcie pipe */
+		 <0>,				/* USB4 PHY 0 Max pipe */
+		 <0>,				/* USB4 PHY 1 pcie pipe */
+		 <0>,				/* USB4 PHY 1 Max pipe */
+		 <0>,				/* USB4 PHY 2 pcie */
+		 <0>;				/* USB4 PHY 2 Max */
+};
+
 &hsc_noc {
 	compatible = "qcom,mahua-hscnoc";
 };
@@ -115,6 +163,10 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie3b_port0 {
+	phys = <&pcie3b_phy>;
+};
+
 &pcie5_phy {
 	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
 		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
@@ -143,6 +195,43 @@ &pcie_west_slv_noc {
 	compatible = "qcom,mahua-pcie-west-slv-noc";
 };
 
+&soc {
+	pcie3b_phy: phy@1b90000 {
+		compatible = "qcom,glymur-qmp-gen5x4-pcie-phy";
+		reg = <0x0 0x01b90000 0x0 0x10000>;
+
+		clocks = <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
+			 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
+			 <&tcsr TCSR_PCIE_3_CLKREF_EN>,
+			 <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_3B_PIPE_CLK>,
+			 <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref",
+			      "rchng",
+			      "pipe",
+			      "pipediv2";
+
+		resets = <&gcc GCC_PCIE_3B_PHY_BCR>,
+			 <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
+		reset-names = "phy",
+			      "phy_nocsr";
+
+		assigned-clocks = <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
+		assigned-clock-rates = <100000000>;
+
+		power-domains = <&gcc GCC_PCIE_3B_PHY_GDSC>;
+
+		#clock-cells = <0>;
+		clock-output-names = "pcie3b_pipe_clk";
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+};
+
 &system_noc {
 	compatible = "qcom,mahua-system-noc", "qcom,glymur-system-noc";
 };

-- 
2.34.1


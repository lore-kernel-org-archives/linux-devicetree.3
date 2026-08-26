Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9A2E736F
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713196; cv=none; b=NTvqIgTiDGNUuGGyTMjP1zbExpNjXqifvoRrlbvCFhY1p0bHaeqANgvdQtZWCHB0/wLqkL2s29Njefhp9Ee1KEoLv3eWlyrtb4msbuEfNux4nlfq9DXswpO0gbMktCb8FmhDZyxRTWkh7QVv7aEg1NxX8y+vBuz4lQbNYa4Mq2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713196; c=relaxed/simple;
	bh=BzG4fTcyJr8UBrtoXB6v0pycrJzI0FeIzVDPWFs3cuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ackW82OcmZhwKb4XvxaRu8acQF5NWp4MUmE2NiO67zOrUYSodZ1T/kSRRwRXSzF7Bmjbm3O1vDGpxQxvoKELoVX7m+VqBTJMdJ5ZbnL9IbasARdovVDr3PuC8K3nWLaNggD6CBpAY9zAseqm3JBai3Y17BiOkbhOnpdwx8ioGDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iE5lTAjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcmVYjuU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iE5lTAjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kcmVYjuU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q07mGg3816366
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdbZFnQaIRj1xaqvK5YB8/yX5MMFyPVeFeiIXz++Amw=; b=iE5lTAjS+HCnUopA
	d5YP+Tp8uiBV47qJNqVfYwHhTV3hLtPtjlkgJDxzcv65qecxWc3iKM6hO6d34iA4
	Ta5a6b73Sh/SxqZw1PfWg2JxgjnTUjEpyGf7488uV+vaoJ9Tue8waXCfkDGnR9XB
	siSSGYTyLawTdXcHAnexKzpseBWCgtn8iO/Sgb/Z7OgPLFdsvA7WBO5Dp+nS6plT
	9MGixAwXiZh+2wXfePsJTCI2nKWl2M5iyMx4sjWKj7eCFtDDXsOamd8Rfh4MDKYW
	GDSwpJhWinsl1lwUvpNqWYN3FHzWh3WWO/vU9Ms3AqMuyKaQ7Pcv66K1r1fS2pg0
	iyNQdQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgr1ps0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso851135a91.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787713193; x=1788317993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdbZFnQaIRj1xaqvK5YB8/yX5MMFyPVeFeiIXz++Amw=;
        b=kcmVYjuUhYp3hRCaxORR2Ds9NIvNwiL+JrlPH+8iOvW7GtWoiwsV6L5FfuBeL5WdnQ
         R9QdAmCeM3u+XenhUVnXhqlXFx7wijjnr6z7OUnhQqbDM7+bFiZwVcI9fEqoLgTGVvwb
         GfbduU/OkQbb+ZSXoyZB7xtkpFE1XhnavblFrri+4XTNco5HwBFOnskD52vnBPpewB42
         npYT4YAmdCgDxKZqllwEO/F92aE3lW7Tbo6N8ZHUMQ1LbPAva2C+wd43uurPp3VNZP5u
         24yEVl+/VrYOlimMbbz4tk1B3jZ43AL9kYei84OvsrfS0p1zYXeCmxBdKht8ifC/s6H+
         naAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787713193; x=1788317993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdbZFnQaIRj1xaqvK5YB8/yX5MMFyPVeFeiIXz++Amw=;
        b=OMg9xCfy6Tmme9QhY96uqNQ+eu06D6hmIspHNusjDurHBqP2vgFOmTmEiRSFxmnmtD
         QUztkY+9arjnTXR+4o+/1bLnKKC7ZQtZvcqyaFuBEK/eLRMxU9A6/YTEAo4OQHty1wFG
         NqOw8XIpyga76FGHgK0AviFP2xHO1dKgfXS0P8eeBvcgYD3sUxlyDGWcb15aRKuCd6Zs
         0pNuFK8ttCKMV9y6G2Zj3x5PIW4GC1rAuVCansbHjYAGB25Ui54tFeiM7gSXJJxd72MC
         ukKeS/q/PHWNuYRUEZRtuH2wzuNLA2RF9AmxxZRrR2MX+4WYOOybMODTwAuJ8f+ixRVM
         gL8w==
X-Forwarded-Encrypted: i=1; AHgh+RqwOypgsSUZkKxPXwJ62wlq1prvRoNWFobhBXz9/G4wn2/zHVhhjyhV2NPj7F/68pPz4xk/+uwoXI5J@vger.kernel.org
X-Gm-Message-State: AFuF++nq+NxLFQrXtsv+JKewoNESuCLE9Lp9kAcKQcIm0yGMleajJoUm
	nbzPBFukD+Ee/C3+rGIYsFzkdPARsg0D5kG2C2YimrwSP1PecWvOGPdOIgX0htphOdW5lDLrkJI
	uIGuePPBJExQ9NfHSyipUgpfq8MtC/gvLzv5wNdJbuUCTRD7+PcExwHGU1g6hGf+LHszOs009
X-Gm-Gg: AR+sD11XpEycdTDZy01VQao5Q+uvvG65Fh6L8f5bBQgOgQUoUbg+zK5PknBgUD/stkG
	PYlNVQuwgLS1tqOY83fM8WrHK+vLeQciW6L3jZlvrB3H6YTesSSWWG4NM8T1gyl8YLzc1iLbf1r
	WTE+cUi8Jxp4lOwE1zTgwqAqO9d1iyWuxpvR2EOtzZvWKVxxkvt0Whk8hwclD24BG2GGmYvCNJg
	eJEs14AdkGJhh17X3yiTn5mwdimcAaHCrlBgwrtCT9HQG9ch6CB/Kdu9lt817z9YscRPemuqBS9
	nuhLsR90uTTCQt5MvozgMVCJbUQ4hDwnDHjucNcAO1UF+xbxteEIC85by9XNFOIm7LCHo1OgmPX
	DDjjN7kjeK+tIUMEvpG3dlvvvGkZA8z5Alj6ep0neJ2+3kwg=
X-Received: by 2002:a17:90b:3a05:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-3966d44312fmr7956713a91.12.1787713192557;
        Tue, 25 Aug 2026 19:59:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3a05:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-3966d44312fmr7956634a91.12.1787713192059;
        Tue, 25 Aug 2026 19:59:52 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm5222405c88.5.2026.08.25.19.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:59:51 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 19:59:20 -0700
Subject: [PATCH v10 1/5] arm64: dts: qcom: glymur: Add PCIe3 PHY and PCIe3a
 controller nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-glymur_linkmode_0826-v10-1-56ab597d77e4@oss.qualcomm.com>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
In-Reply-To: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787713189; l=11222;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=BzG4fTcyJr8UBrtoXB6v0pycrJzI0FeIzVDPWFs3cuo=;
 b=3nzjCdagEUqWCk3/tK0cenyRyAvBEw+RzFFJSCjgGANNxvZq/Pzp/PC2bI9xUTtG9rGhjIV+Y
 tE1YJOFgFppAvBXbeY5EXJ/YuGa1gy9WIB8DMCRQCIDJritBlp2dtBz
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: cTIjncQVRroxwZh2cklIRhClYto0wiym
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX/bxIq12GEEdJ
 K/rG1fJ8ijFYxki+f+WJPxQGbrPn+NoWLANvPl6RoiSgJFGCGLiSI/x3e0C3gjNxx3+hQZbI5mf
 AysMQKs1MKtt8OtD5YrsUrx1mp7r6Q0=
X-Proofpoint-ORIG-GUID: cTIjncQVRroxwZh2cklIRhClYto0wiym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX9W1SG7m8Jkl2
 LbSUPZwxC6IR2ht6tAG3ucLwzXfIzurBFTm9fU1IIOO0xB5fZky2QdK431om4SDxxY/G+rov7We
 QMm0MGMpY9GSqNVf0fTfpWtwMsZAMTw5Mp1eXrq+wyFBSItUiGwmtBW7+7mi7EAMY0eFAtUXvjl
 yyuj40V5v+s5CSLyggSHae8YF0O4TwQwL3oKCxbBp4TJF9OlEVyEOHk6xkMjYKnHOReIXuTbwkJ
 Lk1E1e+8RoX6SkAv49e4oem634bKuY8+duUfg6djs0Y0054UdRoMpKcRQf+UHFKpcbWAqXQ5KzM
 kzyZsQAR9m37EfUF+C9fNZpHP1Lge6AkYpJyADEIz3HtQjyXovpzGHLSSHbVktg8ugIxxS8QxhM
 wTA1dNqIMn7kYhwzhN5dR8OsPAW+xDutojSiga4WdM0tzYye2daXpNEfkdFcQfTPKn34IOaxdH0
 w7TPFFWpGSudVW8Zk1A==
X-Authority-Analysis: v=2.4 cv=TvfWQjXh c=1 sm=1 tr=0 ts=6a8e56a9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zsmDXcllmZpmxbIW-i4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260022

Add the PCIe3 PHY and the PCIe3a controller nodes. PCIe3a and PCIe3b share
a single Gen5x8 QMP PHY that can be configured either as one x8 link or as
two independent x4 links (bifurcated).

The shared PHY is modelled as a single pcie3_phy provider; each controller
selects its sub-PHY through &pcie3_phy (index 0 for PCIe3a, index 1 for
PCIe3b). Update the GCC pipe clock parent array to reference the new PHY's
clock outputs instead of the placeholders.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 336 ++++++++++++++++++++++++++++++++++-
 1 file changed, 334 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..10b63ab37a82 100644
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
@@ -2374,6 +2374,62 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
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
@@ -3755,6 +3811,8 @@ pcie3b_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie3_phy 1>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -3766,6 +3824,280 @@ pcie3b_port0_ep: endpoint {
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
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 850 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>;
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


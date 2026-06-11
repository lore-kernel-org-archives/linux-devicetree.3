Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60E34968F5
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203076; cv=none; b=rMHXeD5rURmOL2Xbx/1fkkGoyeYB0CYc2BDtzmALQ4Dhxlz/zvGt9GlnaJgMhp+5Z5SY1Wm1VOxgqMT8MT/vAIJ2jLnBOa6AA5MfTnkTZryux+RKDjvvnWSQtZiyzKWBQC924qcjAukh+EEy8N3PgRdQKi4TxDFnYH4s8KuOrms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203076; c=relaxed/simple;
	bh=oMO8EvsYcPF9+TMaWUdj9tkVVxeogwjZP8T4RkGhCRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ik6AtwS8Si7vkg2Khv6DDgofwVM2rIPc+wOZMuDiFK0LWriKDM1ratemDqwRBHNTPuXkf9GEOk1TAEMCVG4ZIep3hEZEkb0dhYBL0yIVUV6IcIl7E8YdHGF2Jkn6OyDsJIJpSHijmoVS7DoZGrUNwzXJ2cedVIkykURzzxZdcgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBISvqjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQ9XhPck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBISvqjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQ9XhPck"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIRPvf1349032
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iIX6YyczVTNZnfKhOGek1sSjpYCGtZFfO3vE1d1fHE=; b=LBISvqjrAxNErqiw
	sm9BUhuYLMngvTPRfyRU3n2KbBXwgMlTFAqKvBku17LdMduU/zaqD0iPkDqAIblq
	+IgyYa9PqOyEvUt0A1ByezDcHv9WCIqY2VGjLkFVm7df9ZdA/IXuY1+fiWGSb/sP
	YfJXZBRP2bBeL1qAFFE9Z4/ewiNsKdt/hvPWCumJGsasvJbs+m9PjH+yEp4k9VC7
	RFuoOlWsQZ6JOuVR41KyATDGuB87t5Jy/6FR6NAn3wGFvuUt3q/kdeKdvwGNwsgF
	lQiUE/Tq0pvVkHYq/qV9ryyJgMxWZBJCyqTE/mi0h6+hMPMF39a5pEOCTn1Lb0hm
	4ac+Bg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcg5yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422a0eee68so247242b3a.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203073; x=1781807873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6iIX6YyczVTNZnfKhOGek1sSjpYCGtZFfO3vE1d1fHE=;
        b=RQ9XhPckiCLXr+HIr1iFTkhknPRZMYcM2a2sAl7V98dcPkVQFHsDxpcYYaVAEiNe6A
         LCk0XJxL2kzDtcSkbQngv5YNvlibKoLvrwIGoTY4N1FJVJ6BTk2B5Xp/yXEjq7jHDcKu
         4ip7498at7YSwsKMB1NJUc/gjxzlePR6WIH7JAGMhrYjlh1CcVpaQdyd++9KtlQbuJa2
         3TeXdxS+rXSkFje8BbJas6ndtWMfHFtPhpqApyT6ZztNNv46qkpBITRuCZPLp+Zc0MNP
         D5WUaX0+Kt37HdFM7F2QDPZ5OSoZndp/BYCxC0Kz/kz/8kjZdEu6VgdmaSTAeYS7EUB0
         jsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203073; x=1781807873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6iIX6YyczVTNZnfKhOGek1sSjpYCGtZFfO3vE1d1fHE=;
        b=Wv9j4k16LNg5yBoGYiFPKXBU3/DQx75npwX6agkz0csrKrEAOiWob+rPajUq80G1mk
         B9qhof4y/YRCpk2MkUzWNrC4yp+u4yGUd74CsxvqFRpg7p09Z0zoppMMCs/6us33bPZ2
         LS61sSudoTKmRG2shghGrfXcOjNCarCaHHM1xw9UCBDGkI9GLUMFusSKcrJLgmk68JoP
         b1CuADmItuDUUNmEawaAWKi2FzZ+2Q5maw2UBvhgAMub5NAHWSU/r8ICbnQk3KtL1FG4
         PcgES/f6SVIqg6vIur8s+f9lbUTn9VJ5fhS7t+vptXuEyUV4T8EYbZuc7wpqVKI0f7w0
         sZoA==
X-Forwarded-Encrypted: i=1; AFNElJ+xEg77+M/KQZ/HDI3sNrJnMxnvuUjNDfXrNjV473WbgaSscQbGBTurPd1+qV3D8vIHNgcvfkGsb2dN@vger.kernel.org
X-Gm-Message-State: AOJu0YwopWc7C2/Vaa9u9w15Jt0gp2D1IJenEYu/ePJfmTqScu9WiGkN
	r5bG0XuI72G2QtvOURy/1vOLYXPvu35uKgVcoM0uQ58fwxAOvhlfbUz4LYsywhqbgJMBxLYukAj
	QBUdqStvoaiXGEYEC9DA6PmS+RFcxHkKztAdpX17rkzwec3CxnqOCzYa21El6afCh
X-Gm-Gg: Acq92OHyPA1nNdxcaEYSfna7wuMbBc5XmhJ0h6RZEjNlY7c52cTUcsV9MS4ELWyszvi
	tjJB5wD8CtG4YvmVg9h+g9t/Ag/ZfXBuCQ2qy6GAuOJH1hKUUZMo2JlwOYs3JauaJk+u0SGDEgh
	cJAetBNH7Koplemxm7Nr4t4jlW/CCaoPM2RM5mbvIwYUtn2bBhECKxBAh4yKUVXIiGZ6h/ivW7W
	zqX8RZXUsTcjnTE1BjZBZ4hmlZKPO+VN1AGi16ysCBzQwg7QR2/5MEzuCnmNzKawMOeCYRVskFH
	kTub+IO7QcRYoomTHEfDjX3CLoSbew10/g54P3hdjgwhpK515AMPJZdU8jL+0WV4dWPT5cnQJa1
	MywF7VayDnVjKA3BTLL5YrqOedsV8TleEHKp4TbB4u6eE8Q9ynWI=
X-Received: by 2002:aa7:888f:0:b0:82a:17b6:53ca with SMTP id d2e1a72fcca58-84336bb0236mr4556621b3a.38.1781203072957;
        Thu, 11 Jun 2026 11:37:52 -0700 (PDT)
X-Received: by 2002:aa7:888f:0:b0:82a:17b6:53ca with SMTP id d2e1a72fcca58-84336bb0236mr4556584b3a.38.1781203072506;
        Thu, 11 Jun 2026 11:37:52 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:52 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:02 +0530
Subject: [PATCH RFC 6/9] arm64: dts: qcom: shikra: Add ethernet nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-6-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3434;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=oMO8EvsYcPF9+TMaWUdj9tkVVxeogwjZP8T4RkGhCRQ=;
 b=KroYwCn/3i+MFwy5h43g8syHSEKzKdoXtCPwEvaDoiOtf4wd25RpWtOWNNMR919JjBGGbXbma
 HmGbKLG9YAdASCvawXcOKjCh37wDC4o4t2BxpzwI7B08uNFv+rgwL5A
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX5FFzjKtNLO8F
 gAeK9tUnp8M1C6DlICvj0KrOPVt8bgO01dGl57sfNDGYoZV1zxniihkH3BiGI1mQ9SpjUNqnVVJ
 70jVsxxMif+ciKRSWI7YOvH+GUnwJgCoihKf7+Zfel8lnPllpfq3sEb+3Nu0MZJPUjSkOh5iRqY
 sFRoaJX964MxB34Ke5uwSKNjcxuhaj4GZoxPFXOvC2EuSsLDvem177S+BPfRHdUrG45J3Pem8zO
 tdosAxN9ajEr5Y/1EblsLR1VswmazWwAauDo4mogjNf6X3Rk2VqgCsfpaidBgBrx8ohBQ6yO3kc
 HGy9pvfBYs5Ce4Xq/wBaM+V7QZ5Qcj9EpAw6WttvoVwsGBC8+YlOvVN+f4VfuwFFiDyMlOsVgQx
 UwNdcrMKaN2lKD8qsB+z7NI2iM4U/FKyoU5FpX4dfdqZaZvFkgnsBaxyvxqkiJ0DiKOZtHUle2D
 Zx8VLdhLHCq9umgtnGw==
X-Proofpoint-GUID: _Yj4vUNUekPSnOEjlapRtYgTX1X9EE98
X-Proofpoint-ORIG-GUID: _Yj4vUNUekPSnOEjlapRtYgTX1X9EE98
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2b0082 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=z42-wsbaeSSsZQV_GzIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX54PjsAriTJ+N
 U70HYXkHsIfiv6WL39lFsJ9RcxOyBjlPk1akewzmOGf8IkGY49QAXe2eNg2BgIQOnhNMDtfJtcO
 VY+F3o3cEBKmT5blkp9PNjnatLA0hJQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185

Add the two Gigabit Ethernet controllers present on Shikra (ethernet0
at 0x5d00000, ethernet1 at 0x5d20000).  Both nodes are left disabled;
board files supply the PHY, pin-control, and queue configuration.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683aa566b444a847b57b4b47a25aa8a..cac1573e3eec9e52b62f4b4cd7c564c70d0d8f78 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1990,6 +1990,84 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		ethernet0: ethernet@5d00000 {
+			compatible = "qcom,shikra-ethqos";
+			reg = <0x0 0x05d00000 0x0 0x10000>,
+			      <0x0 0x05d16000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+
+			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
+				 <&gcc GCC_EMAC0_AHB_CLK>,
+				 <&gcc GCC_EMAC0_PTP_CLK>,
+				 <&gcc GCC_EMAC0_RGMII_CLK>,
+				 <&gcc GCC_EMAC0_AXI_CLK>,
+				 <&gcc GCC_EMAC0_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii",
+				      "axi", "axi-noc", "pcie-tile-axi-noc";
+
+			power-domains = <&gcc GCC_EMAC0_GDSC>;
+			resets = <&gcc GCC_EMAC0_BCR>;
+			iommus = <&apps_smmu 0x0380 0x0007>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC0_CFG QCOM_ICC_TAG_ALWAYS>,
+					<&system_noc MASTER_EMAC_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-mac", "mac-mem";
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		ethernet1: ethernet@5d20000 {
+			compatible = "qcom,shikra-ethqos";
+			reg = <0x0 0x05d20000 0x0 0x10000>,
+			      <0x0 0x05d36000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+
+			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
+				 <&gcc GCC_EMAC1_AHB_CLK>,
+				 <&gcc GCC_EMAC1_PTP_CLK>,
+				 <&gcc GCC_EMAC1_RGMII_CLK>,
+				 <&gcc GCC_EMAC1_AXI_CLK>,
+				 <&gcc GCC_EMAC1_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii",
+				      "axi", "axi-noc", "pcie-tile-axi-noc";
+
+			power-domains = <&gcc GCC_EMAC1_GDSC>;
+			resets = <&gcc GCC_EMAC1_BCR>;
+			iommus = <&apps_smmu 0x03a0 0x0007>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
+					<&system_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-mac", "mac-mem";
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1


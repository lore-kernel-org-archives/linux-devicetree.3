Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7564B8DCF
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203069; cv=none; b=Vg30d6GKFCh1QpQYlRTnLDGrDJVJWSdUOeamUxSBFT4iHFi+T0iMNSWmOolOLtnyRUUdqqPnLc0KwFNvxCy6iGV9h5a3PmloRrLVwq73b9oOTz/Bc//XGSp1IBmwTIgJKe1TLWULAueI9do3mCJg36biMN3PshocRwO2UH45joM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203069; c=relaxed/simple;
	bh=JQf6FOaG/Vq86vxkcpq4Ux+LVaeDywLUVuBCL3uEng0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/bgjpoYcj+sugjVrZj0StU1TcjaZODtGBkD+4jWImcvoZAXf43wZaiMpWN3D9kF7pZs7v6xDJzKWtY0q1h4Lw8KCGDPuNPGujjodeEs1Sub6VYd8Oev2UXWzc6yWhSWVfPVOTI+FtGjz2ezeAN9feHphkLcANUUejCKngHim9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THsbrssE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7RFR1KJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THsbrssE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7RFR1KJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIQMCC1375794
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=; b=THsbrssEx2QAUQoV
	rinXUVYsccewmN0Meth3D9ZoWwB11GGiBk4xo/5lz5Ue5kQ04de7MXEzWg5GeOl3
	lUMUpSAgYfBOm68beKb3jDQk/6LTgfXjacVAgJXZTJ+EqPeRvT1FMGv+579rSQI8
	YcxN4D63MSH3G84+PS0nqPlr74+2NZfTW5nfGcRkgS1eWlGwogZ6jqYJ8eYD6/3t
	AmYm9Kek13ZwAgTTj9pvh6pC1RLnCYmRTyhSRfT8ORiF+PbchoJ7JGQyniNihlwt
	CUb7aEwIPY2MtXvBxlry2UXzVeP43TY/wdal9tYzax05+bcido54KHzmftic0Z0E
	JhbpzA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7054kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84240b58211so124329b3a.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203067; x=1781807867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=;
        b=G7RFR1KJpFfPpt+LZvdhLM1CE8KyWXhvw+bwbVD6nXOdQAYj/xhwkMOV/4GqVaJ1pr
         2pBljY17syUn+FiD6C3BwoDld3p64czLbA+ok9sBKl8TRVaZtjCZwXQ0f9Kcwq6DcCPK
         t+lEfx3/rFIunTlsnrpej9JN5E3twIeab3TymJZ5x8c3DryTK9VFdclKK3gbmMVtO7/i
         CAGKTQEPuacxcawKz0by5rMGjD3F3ml5xVEZnXoof6WBv8QpDTNBt1Xq1vDJaouEIOsH
         NnZlFqPM7gmRcZd54gm0a2/mx9+54VnltdOFHHL4vn6biKDNbBwOiJecT9NI5djT+3z0
         MSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203067; x=1781807867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=;
        b=NCsSp6eliLrFhuMAgwvRoCgifab1rhTlvKY422zHQ9Z6BEwytxEDJeQIkRvAfU+OLT
         PEzrTXf73dp1Qs0L2x3ibA9GDMacumc/wmXa1gcZPXIiXAdv2nAtVVHhpDFh6kvBx9kp
         Ek4CGWjXNmoif4bGmZstBpGSqabfOSTlJ9zUi6bpbkYB7DZ8bzhEX86cZG3nZJq52+dC
         nRb0Jc1Ye8qIhOxEF+UASOMLmdP2+OTbA3BkOMRUBzlJqW09VjiwnbJdwtU5iY/Sts1/
         nZs3mbpAFWSnGqM47NZwNPUE7I4GdqEFJM1nX+QjfyWsuyBsW8W5atgnLQpkBPWga6ve
         TAog==
X-Forwarded-Encrypted: i=1; AFNElJ/uxF7Cx33llOQI7FAS1I5EbqbEpztkAwFLgoQT3sr7yepXzjtoRbakP/7tH1GYxLQij/Cgpobxp9wf@vger.kernel.org
X-Gm-Message-State: AOJu0YwpKMrEv79TvIVfK/AIxJnKB9NRY/72nv2MwmlozuatRhzrJbuz
	pdUeJ2350t//A/B8SsDrt7ONrqIqJ0NhIkjihi8cbchS9QdR1WBENXOLcrZML9Ucm5Ympa2ybFT
	aU69JnXTjgR94xYVpt2kk5JyH3pNSVGfw+1jzXT2aChhcLfhkhXjBwl+S5XtAI6gA
X-Gm-Gg: Acq92OFduH+ENqtsH2LRPOCkUAzIT+ilw1i/Nwr/sK88fCpfntat2idPozVwqmEZoCn
	IAT0F7SXbL8Bsoxzi98QN9bLYneh6xeHZdUnqn3jn3a65ih84EoFVmZsbhxrhewdE4hfPGl9TaS
	fpj0Sc0on+ftYKdiRNZ+IhdWbI0r3/f7Tox/vSSx0opMxu6iSbv1Bp6VjGP7uoTJcQQ15fQIwyM
	JhYP7uZxisjYfH/d8xEuBRevH4shwVdsL/QcUuvnnvT0icREFu8qI8Lt2uuIYa1kbRDyYFXbhwP
	cOAqPQcnKj4CEgFKNJFLnEDZBsNdKE0389OPIvjc62EX+NcE1uCtv2dJwez3mnB01HsHRxlqoOb
	G9p+nH+C/NCb6iimaA9S/tw1xV9o85+xHbbNFkhE6ZS1SjEKtJec=
X-Received: by 2002:a05:6a00:ad0a:b0:842:57e8:1bdc with SMTP id d2e1a72fcca58-8433690d21dmr4523494b3a.18.1781203066683;
        Thu, 11 Jun 2026 11:37:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad0a:b0:842:57e8:1bdc with SMTP id d2e1a72fcca58-8433690d21dmr4523453b3a.18.1781203066140;
        Thu, 11 Jun 2026 11:37:46 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:45 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:01 +0530
Subject: [PATCH RFC 5/9] net: stmmac: qcom-ethqos: add Shikra EMAC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-5-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=2407;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=JQf6FOaG/Vq86vxkcpq4Ux+LVaeDywLUVuBCL3uEng0=;
 b=cRNGFK07xiHzKlfJ26rgcNf8d9si3vcKtY1yMqoX9jY4Tn5HpHhsmYACoJajUnoL17r7m0Iuj
 aj7mu7h5iuPDFJLzcuqZgYVRtp2sNTuFVrYtAGZyIEl1l5ab36lm3PZ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfXwC5fpSFjtK/u
 EFaqGPUDvj3nlkivzIb5ckWJPdTYzWGhONdLMl1o5o9abHRA8ehN/+BKCJX5FogDph5gKe73KDw
 i/nLbzC/R9++aRmYshiGE7awxybgY/N6F8eY6WwBZC69o2YfwF+AkKShDfiHqEI8JB2I4+Z7v8t
 5o2khI0IkljCu8ngkoQu4ZSSZBJ/Ip1sPb1rTD/SW2jv6xmuepkOuWgQQjlemyciFAUHrQ8VJne
 xE/9CLYLht9qvi2YG4tJXJ+xAz3O2WaojHfdt45hE9lF0F6wgbz8Fupok7fS1RtKziLL1RmYq4L
 2bXHWQLzpCnmVg3G1OMcOyVMaLefdAd+3SjTNUit9PCsNOWLLpVYsdsR1DaiHpkW2iny9MzAcme
 lfy0Ej51hSjeMks52SfzsHePVMNwUU8TDeOCFWtCn+0YJGHM8YpiOu6bvqhKP4DHCf0dZsFzNiI
 C0Fg8RsPqPwbRXKdDuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfX9hCpNlRP2QpS
 9VpV/T+UMDJjIMbXi+sEPZBlTJBNNhwa65d9ZsBov4/d/CvLholrVYXzUwSOBojO+Ml2VtJFgPi
 tCpZ7GQKwUNTk3P02HJg5fHD7QPcYTw=
X-Proofpoint-GUID: sfUFnKJ2a0ksSXWcuJDpM43CNL-fPMru
X-Proofpoint-ORIG-GUID: sfUFnKJ2a0ksSXWcuJDpM43CNL-fPMru
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2b007b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Mwvjr24TsYbRRF7WmgIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110186

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access and the 36-bit DMA address width.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f4d4b419a76277cc6c56f03bb10d883cd4dff424..59fa8779e4e4628ae585dd5625168fca824662b0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -326,6 +326,36 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
+	{ "axi",               120000000 },
+	{ "axi-noc",           120000000 },
+	{ "pcie-tile-axi-noc", 120000000 },
+};
+
+static const struct ethqos_emac_driver_data shikra_data = {
+	.dma_addr_width = 36,
+	.has_emac_ge_3 = true,
+	.noc_clk_cfg = shikra_noc_clks,
+	.num_noc_clks = ARRAY_SIZE(shikra_noc_clks),
+	.rgmii_config_loopback_en = false,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -915,6 +945,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


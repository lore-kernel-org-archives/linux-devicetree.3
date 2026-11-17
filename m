Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905234;
	b=gq9DD1XftOmKfFNk6/VIVzlF4uRBOKTAcQLYX0as/QVPgWqWs+WHrfz5iP3dbGYVUZ6a
	 p43DK4X1MZ7G6LleNKmno8T70qkar13+atE3l66tQt568xNH8yZusYbfGZLkyLIxTwX8F
	 AGIYAT991xCWyWPZlu+JDMH3THsHUrafqQRjxXfNNFvyYidmcHASoIR+fiOL9MZ91xDIs
	 8+ia/fJhpadI+61xXr5OiKudYWZttT3GLaR+zP0frReTbZAHiD3wFa+rBJqsM+zQSBcHS
	 QtPzlclF5kfqIOIBe48MeURGQUIOjMLWjIL53NK2qlv+bZPz/iFTHx528Z/oMNgBYmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=;
	b=EWowtg/CFp1PzBFjHPxYP9y9xVTCHBQOF8UsxGsqFbeKSL+26Ryg8uzaAwOnu7J75g7q
	 RvF5tPLnIxJ/QCLTLQ0jOYPKUx8m6op/0rec5HA11URkuY+vt0ekXvWCIsVH5lY1iQE0h
	 E73I7/bNM/uC4cEV/sEoe5A0bCXM8dgMfm9bSvVDVU9SrlHuPiLOOd/r9hBZ8/jo8Hah+
	 e549IDajlsZ/TV60jETW37UOw30NlM88BZD2gq16DwOBNnvxihTfnWgrh7HQGAqqGVFGE
	 QexxRNTYEMquTuoGw1fEBQyw6MIDPQXHPD1DaBne6fP9LA2L0t3RyHKCV3DOx2EO4Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lLkXgHm3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2tutv1X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5E8606A329
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5E8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lLkXgHm3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2tutv1X
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aPkn844321
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=; b=lLkXgHm3k4woliRv
	2hW7+wmcv439q5CFaB6tpO1Tk8vus/KHagA9u0U02zYAcz1CiHIzXrB+6SLU6xfL
	YAyThxtwwimX8+8zW9BphQR68TtLRfgGWwJ7U+jl4Yd9EkJHC+A/rFqSAJWoycdV
	rdF1WqwwIdUE0pz1K85wNy9RWi4oHjpCGrggufAosog5yCjF4ex3oNRbkhV6Vi5I
	PrnztpeXXXGoXjSy9njLM8Z6JEFQcqLIOdb4lHOsKNz+ChJbNhfdhU2xwnls7pOV
	7G8bFcufb7Kado+m+4vIGFoYtVT8P9qBB4rVo6hSiVxwFZpVH/G0F1V3Wu7wg1ib
	j3q0rA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h1mnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:47:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a064f294cbso2918248b3a.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905231; x=1795510031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=;
        b=B2tutv1XNX6giCOpEKdXCPL49jgdll73hz8FBM7IiAcrlFzJhuWxptoYvrcOWE7s5V
         fGQAiAqHf1Oi3b3POpFkApG1NnnkfBXPJuNUgd6iS7jZWlRzVTuV2UePTjAgpNk2wKKJ
         fCnTiNN689atszAegI+v5Iu984OyJf3qzcH1CbVZ04ADg55l+ME8neMuD6tlOeTwaGMo
         YvErEHJxds1k+eJtI/3WCiMF69ucvuPuV20aSlPJJnMuQOQbGLn7FKXbXghivzoluEIR
         bVBVXfWZDOh+vYlSF2RjnBZYWjsEgb/Rb8Wy6eoR+vlNYrXAcGnSiorcV/XKX1XLhzbB
         be2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905231; x=1795510031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=;
        b=vsyzmyawhw9ui+QklmYRGh+LI2pxt8VvoUSzIFFnNo58TRws3lbPC17ozhJGoCkII6
         alxvvif8mFNG0WZT448gBSbNiRYdFzWty4+esAPjDd9x1xvQKu6UFJq2OVDNxpoVGHlZ
         HXU/2O/pfe/Hs7J34Ze9/WNFMuRQApA0gfbbu7VxfZi7Pdknx1BB9dxOvGMvAOmXdzkr
         WSrPYIedw/9T9ZV3SmBjGmlKzpSRhoLR+kmM0Qer/HDQffvb3dAj/uPLr3pBo8+ClZuA
         E2U2jSfL06RNxroluJqdi/KhO0VaFknGml72jJgbVANGg/eYgLj3Ck07bFHWlHym0PiH
         B1EA==
X-Forwarded-Encrypted: i=1; AL+hErFK1yYrZ1JObe3CNtk1rQpyfSJd4ANfeL6NShm6RQk/jPzHQ23WMucjqJzZ26ENPaKTJINkU+/hJ4Yy@vger.kernel.org
X-Gm-Message-State: APuU4Z+93JZkq7d8miVN3CoY1jguY1RmUtvN3o/TkNnV4lUOkXrzlMNr
	e3Swp03n2ldfuO3LpGh0DLDx/p09/5TU2XGsphYWeAitIkFGlfKBYDp0QMtJGS1IxhRvnVB5Kad
	8V02NiSqs5df/IyqFOHwl5t/PCi91kKrz74CHUo6pSxtNsTjb1pLBJ5sqcC45fgR7
X-Gm-Gg: AYBFou2ojJAmweMtL1z8pQeOjaSWbbJK3GhUpx47gDOvItNsTPDLHJUMur8zIVZz6kx
	m/Kb9p6AlJIvWKJOVPlzsXIG/hgPihfieL+tiB+gn2e+5Bn+3Eq7+DGRLdfU5V5FAOTV6HiwXBG
	DlTxm1fMqu0jhg0g3kcQnIhcqu7g9MyZhGf/9Ew/94iVPtjG1OPMizAJ/2oCDOiPwdinZUsMa28
	KQp+VRkkDNoXxhIAT8hiUnahjh/gsTKt0Kkg9Y+8WAsO+53F9aARK6fD4KqfvhVU4TcHQ3tRF8X
	QUbn+u7Xuyg5kDvApsxocZGO4z5xIfawHsl/ICMufW707tMtPJOZl3ModPcZeCGgq61Dic3RuVt
	E5mIwCZXFKGYhlOApLrVfgYhphw+fLR1FTbnxpal8HQto0TEnakAvTjno91dNV40tF9r3OXI95p
	cdBA==
X-Received: by 2002:a05:6a21:e109:b0:3e2:97ac:274e with SMTP id adf61e73a8af0-3f7a9cff089mr13052471637.65.1794905230861;
        Tue, 17 Nov 2026 00:47:10 -0800 (PST)
X-Received: by 2002:a05:6a21:e109:b0:3e2:97ac:274e with SMTP id adf61e73a8af0-3f7a9cff089mr13052430637.65.1794905230269;
        Tue, 17 Nov 2026 00:47:10 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:47:10 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:29 +0530
Subject: [PATCH net-next v4 09/10] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
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
Message-Id: <20261117-shikra_ethernet-v4-9-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2688;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=LmuklvsOLR/r7//hiFZqjpLls6fBHeuS30WVohG1EGA=;
 b=NfMTTvibJR3V/sBQTsSWiWlUhRk02rFjcgYQ4c8QIJvCBToeew1dVgAOB3072Sjor39HLf/r7
 uC1cHtl7qB9BOleyFTAe9ZEVacRFORSL9I/LuHK7Sq47guXnOaGZhUC
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: AXdjiRAP8HQiHMOyBi3fPvcXyCOjNN2D
X-Proofpoint-ORIG-GUID: AXdjiRAP8HQiHMOyBi3fPvcXyCOjNN2D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX/cX9loyjsS/O
 WNoSsbnK4TcmY5MQYvDwDjM72nAjYMjao2JhDHOpJ/96gYisUtqqVgrlgZOE5o2vCcKfLIV1vtZ
 Oz12eBx64uRXMNsUGmkmXQQBAi491u2fZ80+gMTG2bKesd1PJ/IKFr15wZu02YCWcpQYwjFbrJ8
 IHXoKWjCQp9vSzusMHTp4fGTXILVAlH7uq+8VXIeQf9E1HWiCBXm/PQHj6w97u1b8USHO6Wr4l5
 IglwSrqNhRjky029H63b/WX7f/dc7f9KWi42FxWlDqGt+eU9bd7eWQqQ081VoAcy5z87qZC8kI+
 /5Ii5bD3BclQESPEIGPqtKFqS2zynRL6EPhOdBObNDfnXno/qpXRRPYN4ZxBaLJJ1sVULmeSv0v
 tWx3xYonUCjOaWf9LYqQEi/e09YTg6UFxM7CFpf6N/hNvh4QgNNCjOxm3cSoA0rvAxoOWymSMtM
 FoPKR4trfbSoEkrFXjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX94AiXRSPNqvk
 /bsbYPdEqA01MCIyymD47WchnaRUrQuoHmneS1rEKT+asnEG+pGFlf2NI9xb3QvIpkwy7clJQq5
 MNYUcj4TcdoklYPJVrGugb1u4+91A9g=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc1490 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tY1s7WPN8UR3DqbNSpoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms. Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access (stmmaceth, axi-noc, pcie-tile-axi-noc),
and the 36-bit DMA address width.

Set the NOC clock rates through an OPP table to ensure proper voting of
the VDD_CX power domain. The stmmac core enables stmmaceth before the
glue driver applies the OPP vote, both at probe and on resume. This is
safe because VDD_CX only needs to be voted while DMA traffic is
ongoing, which cannot start until the glue driver applies the vote.

Shikra's intended rgmii-id configuration supplies both TX and RX delays
in the PHY. Therefore, enable phy_managed_delays to select the
DLL-bypass sequence. No POR table is needed for this intended bypass
operation.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: set phy_managed_delays to true for Shikra and reworded the commit
message to clarify concerns raised by Sashiko.
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 15385750b3e6..a7fdba73da2b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -332,6 +332,24 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
 	.setup = ethqos_scmi_setup,
 };
 
+static const char * const shikra_noc_clk_names[] = {
+	"stmmaceth",
+	"axi-noc",
+	"pcie-tile-axi-noc",
+	NULL,
+};
+
+static const struct ethqos_emac_driver_data shikra_data = {
+	.dma_addr_width = 36,
+	.has_emac_ge_3 = true,
+	.noc_clk_names = shikra_noc_clk_names,
+	.num_noc_clks = ARRAY_SIZE(shikra_noc_clk_names) - 1,
+	.rgmii_config_loopback_en = false,
+	.phy_managed_delays = true,
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
+	.setup = ethqos_hlos_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -1101,6 +1119,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6E47FAE0
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230423; cv=none; b=pCk89wz+Ya62SvojionXvd2oZzBjvb97HDvCbgaPJcDVtQmzH6IjHGJZfSnM7UC/iDNmyZhuTw/v9iXr9HPzTWeUSosrsjx/XhXbLQW3r2vbGY7ewUPx64Z0d2e5WD0e9NkEiwTClW8nolxttkN61MwkY0I6OjZxXBXkpjAk0AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230423; c=relaxed/simple;
	bh=LRWhJyRn3PkcxIWYRNNivl3BW306tPYAnRD6RQt/jf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KpWVpZXRHAy6//PocDlOa9FGXYIsJVI8gGjBlUuXwaG0ocJmJTJjlLRzOrO3umOWJZZtvNTj1mRY0ylQw7ZArpr9YLWOGAFfxUi//F6gCPAaM5MqRI+qj4jFSab1Lu2MtZ4rCsnYFDkSc6fjmBuvVtlf05kFBnUz0Ih4xUw02Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jd9hXNKA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtZyhMdo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jd9hXNKA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtZyhMdo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o2u93533554
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jcjbR8An16SR3tP/GJFloko/bvbeikqy8AxazhWq948=; b=jd9hXNKAnoAHYnvp
	UHBT2ccQ94NXStz29JbncN58ob5j/+V/7QFALT3RyO0krTVQOywkCKQL/IIjZd3U
	Pq/iXiZe2QseoYB2HWiq2ykUlUmkFIaxGUUNYMDRLIt7/jg9NZjZzP5SzVW+gCJd
	KSBZBqfrKbjjgXjyhCpXGx6DIxE7g88JPpLGPfhLCgSgjXg8NaH7IGWmG+kuIzNj
	S8M2221cD9TpCqtJli3RpyFWwTeJzsFgRYEfLHJ5OsDEkFcumxpFgvCqaCPjLtaf
	rNQN4Y5xoBjbpvnLk7T5OBdDBeWuMzMBnqCSALkZf2hwl7SOaMrR65x7qWf/k8aW
	rz9tRg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7rkc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:46:59 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so2891787c88.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230419; x=1792835219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcjbR8An16SR3tP/GJFloko/bvbeikqy8AxazhWq948=;
        b=FtZyhMdoeMYSjkzB+EgfEqHL3ejGDSNqY+MZmaqkXWJW5STGMN2usQsLb0x2o12GnT
         w+YXYYcg8/uZbU7T28Tajkgc6BKwusI9ltRSvd7gBZ1Ls7+WT8ciNTWgjHluaVKEfG4X
         EfGfj/DqngMnMyyPJRYFT4fGqCs3rv46tv8CMgfy1i0MDHnQfYbeJ6c4s/MAJKhkyk9O
         hPqk2mJPeZrDcmX/f2MTmVa2vzrSzY/FAxQbxcZtjyETebPtnkaqpxAvqTezEwlvGQBY
         /Wsk52WCqWWjx2+5EYcVE+P3/Oqyjzu8L9Dlp4mFt7I6H576NDrKMpDGcSri8mzhOl8s
         t8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230419; x=1792835219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jcjbR8An16SR3tP/GJFloko/bvbeikqy8AxazhWq948=;
        b=r/uGe/EZXZwiH63u7BOeC3eL8TvONRhDK2xt6ipVsSZg5HG1X21UD/yqvhoLDaX1hr
         wsaISuLijeSfQjmAUkm5j1kWZpHe9dtFvn48DLqW5HtPVIdB+TZQIZnm/IsnNJ34NNyI
         qSOnvzjtctww9CKidKPVmVxk2lyEevYVoDD0JqRUHRC1suQ5hT3GJUrKvDzDYgbU7Zr0
         Kf9KN37AOQDa2QaHf4cUBub63hoN2mfR1NeS1vDKDmSNQc4X7L2nAJQ8IHvpz5UlAjy6
         BzepeW10hNpqUvxutbvyF/2pEscwKYLMzNpyjuQA9T3yrpj2eDtXhjdCRNrpjEX1XGb6
         lkuw==
X-Forwarded-Encrypted: i=1; AKwUvByp+ABHlnPxBP+F8hQUk85HyhdS4SDtsCrICFIphFifdi44z1vBgckrWO32YQT78RVMTOs5cJhIVmU5@vger.kernel.org
X-Gm-Message-State: AFq9FYIhoJBbsBZugTwjkP+VN1Sxz/LAbeJCw11HU55DPWISMAMalpv/
	K0M1iwWaBOpQWtyhhf22jqBGAdBFZhN+fajI9elO3LG7uM+Vp4ev2MXxOi34pZY/waFxugdcdch
	MRn+MlHUIzmZVm11kM8kmPy7/yvZ3/PhknXiwoTTuCaNfPkU8SwyAlgGLb9uQdspI
X-Gm-Gg: AYBFou0ObRbf48ZilaaYXdHd0pvSOdTpqpU4ZX9cN8ah9+DERTgnMShAXUb8nhviMvP
	YE2QAK5Ci5KTTcoCXQB5cdL81iqnuNE0+co/rr+rFr3IIfhOq9iiLPJoSMQssP+2FlQ6mD+P1BT
	ymkg5p3q//0VqPCnZ/yoPH6RJL6COEPBqf7TqzLIj6fsnHvwyrqX9FwoD3U6SKd3MCblul8dSqz
	CniqPWrS4NAOUeCp+gGoYTTgTyaeC19qZQbHhCHOtQXnhTxxqmNzlZombGYWVHhPYmLvMPekL9J
	M5HpMs9ULK9faAfp8Wj/JgQTygIINPP0FibtfqawHCptkWQgs7k/AD8Xd2oDiLnKX+hDxLty95w
	zGimT2ycOGV0xq5zOwVFJaV2YVjEl6w==
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr3772626c88.26.1792230418566;
        Sat, 17 Oct 2026 02:46:58 -0700 (PDT)
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr3772587c88.26.1792230417954;
        Sat, 17 Oct 2026 02:46:57 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:57 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:20 +0530
Subject: [PATCH net-next v3 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-9-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=2359;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=LRWhJyRn3PkcxIWYRNNivl3BW306tPYAnRD6RQt/jf8=;
 b=8irhRRycJY4lMPeMj+cjkHGT1y1OlkmuNDgvS66f2oU8rsvggEAa5HJEeCWPbUqMEr3ZUG3Vi
 bxh4S3ShekxCm6dM/rJVicTZxfQe9mMakJ0qVXvyZC4RUafE1IliZuw
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX8NCiFflJoCJm
 /yc7/Cp/CXrJtxnHdAyVSOxO2uVNK+cSQm0mM5o+OEbIZbmHNOVlYwu6TD05vvsx8haRCySmHKR
 lhwZp4qGQ70CxVUuC/bsyYvr50cABFU=
X-Proofpoint-ORIG-GUID: ST7sLBurE8j8wZIkwH7MMKqcEmepQb4J
X-Proofpoint-GUID: ST7sLBurE8j8wZIkwH7MMKqcEmepQb4J
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad34413 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zfyZ_crbsqx4_ZaO5ygA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX0/9UC2Wg7qlR
 GksVci4ZQ7oEkVpHcbMAUWd6gogDS9cGEV3pQ49vXWMCVcVkjJIBdMyvvI415qqYFxmZFPwmEZ/
 TWevzVj9DwYLufPEC9M2wwzOr6sIflhYbDw9+Nvo3tdq4rO+NdpiuhxzP+g5j1JgWgmFohPzlVc
 PFodrOYVQE7jGVEIAdGCtk/fPRtuTFQyrNMdzGwkEz2XRrC9W3eayilnA1eaDP7efG6A+ie4UsH
 1HXWZmhvjDnKdfjKe1a2vR7T/wuCjLjJrJ0N3Xa12CfUH85F+NVmcXeLZz7T2xelcu0YSTm/J9T
 910MhVtu2zPPhdq0AiAXReJlT7CyCFo81AdfDhP5Jpf9PKRC6ciplOjl2ekRu3EXNR/1t6+aahz
 MWxclEWdpIGSCSuym+9BTGxWZ8b1fKEq6+BZAGIi5oQeig92ublLyrCJIMWrdmveHgMe597hIsg
 SOPFVpAb95jpBm7a/2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth),
and the 36-bit DMA address width.

The NOC clock rates are set using an OPP table. As part of the NOC
clock voting logic, the qcom-ethqos glue driver takes a second enable
reference on the "stmmaceth" clock, which is already enabled by the
stmmac core. Since, all three clocks must run at 120 MHzs, managing
"stmmaceth" through the same clk_bulk path keeps the rate-setting and
enable/disable together.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9c602755532e141f4b822721686b1481b29b7d4c..a4e083a8517d095e5571b1340f9dd4b5e0c6e81f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -307,6 +307,22 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.dwmac4_addrs = &ethqos_dwmac4_addrs,
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
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -947,6 +963,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


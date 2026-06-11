Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B0C4D2ECB
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203057; cv=none; b=KHOW2ZTP2eyC8SampxDxOfmAbp6VWIVzE6VbBfgopNRamXRIcOU5venpRRSxMD2V1HfDgqFcFw7hgIzsy35/Dp1OAK9P3FPYOC6Kyddz78D9RsDZcmCKOVmUfHapyelKgfCuF7rmX6MN1xykff5gtP7yE4ARTmBoADGaHa+5QbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203057; c=relaxed/simple;
	bh=GtqYv8yTeq4PzlXpWMuFX96v7sPl9ApaMmizTH0wFJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0NFOuR9hrt9W7QdpMYGGCtzQUsnXNw2rBfDb7ebNFpak3riJtjj/W828zaTeLrFB/9W8/FTXxD0NN35KXHS46Zig1J5gamQJ6U/nLP7wa4G9tUrZSpQxStXSAUmMxl1NS73pFuZMzJIzD8jWMZyPRPfqi3KEwXt9WA47qxxdxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5iuHgXg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZBPNh9q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5iuHgXg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZBPNh9q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIRPZ81349028
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=; b=F5iuHgXgf1aSnynX
	P0axqcV/oPzWvCV+xrFy8Yb39DCbQeQiEeyihNrwxlea301CnoMJ2l2boBAlm9Tq
	7XeMKgdqY4Dy/UAmDLJhMy+zADavzOwUjaqoesTGJJZYXUbmdowcGLgh9iLa5n2E
	/zaLl7u9Z/MlXSGq/hPEvbdjR/vdkNj57Or1TgRCEjeM2nFsuTUEzhaIpvgN7Qkr
	+MIIn0DDoL86GpPgH0mA9wXl+TdHQCeghEovmNqJGgJB+h7QdfbVXeEJyrAXut/h
	ZNoRplB4M//3aShd7eOuoBxHBm7GuD1Lj5VUuqiPsDblWBqF8gvjVMYPlBp6unki
	hRqDpA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcg5x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8596e4272aso85811a12.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203054; x=1781807854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=;
        b=BZBPNh9qFoOHkkUaglF0199Y5JIhHwx4imYYGRssofQif3XoPcpLxSnZv3KZyr9YB/
         RvmiMnSVuO2SEaVqmOMOExDapuRHUoBlBdO+7Hn25ybSxkzyUG/HOingrP7+kcqE+9cT
         ABWHPH3AhRRPwADqbMnuVlSJdzHWJH+HrsdFbVy9Cecuf6rBtNIumE62Z7CHjQViXu4V
         Tys/Iu1vLaSNhzE2LJhgGPIHV5GNZiL+YlLSnXzbaXJDQw1CTdiss0e2plYOqfRJrFu0
         SpWb83sZshq/hJjg9M1llpu/w9tqx6t2/OsBgF/uTXeRb28c6R9lWXNxcPPYWQfi2wqe
         WJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203054; x=1781807854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=;
        b=WSs4hnQV5ZzDibrr8aNsADZYKfrsx5sUCGtmhsZ0SIQ1UYjBmuBNExluI0QGUXv2oL
         eGx0qcnJYb3ilaU4ezENLDQyzh5BlpItyiXTm2IDFvVjmgnicRVKJETloSk8un+Zaono
         vluTIc+6JRymAu98CRKtBzMTC4U+swGgnE2HLhN76/Ug6QT+z5fQEmgE5dxd7jrW9VxX
         CJ9/LSQV9JXbTK5JbVzCtO9mHw0VfnxNqJg93o74Z+GRdVv1KZfc2gGom6h2wgdO2q6M
         LKJ1d316ltRdpj570X4qgUdXbp/iGZ0lYxxatrIzeLkFfWeRW+TsO6dgOmKKvDi0n56J
         Q7FA==
X-Forwarded-Encrypted: i=1; AFNElJ8TfJI6kR7X1xetuMLf5quhGl05syPxe0fh5z2RDumKjTUQjz6W2gu75Eh/J/bXczyNECQmNqZbTI3s@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc2OBuDQQ+j/mOse/PS1mDs6hsFO7Sd4VwDZKGGuVdoNEXB8nv
	qVNi0z5G+Ln7cK1d8iFIKPNzoQQE5wZ+x1If//zGG5p3lXaxH2GoOuqlNXJfsBXhtNTA6VEAG67
	/eSV6P2o7V5vt7zVE/HVNxrNDa1q1FFE8+4YhDsLHnrVhBkO/pyHRXw3hnrVBTdfvQ+v5pynK31
	I=
X-Gm-Gg: Acq92OHka03RJd6mIgaouhmh0dE/Kh5oWLp5T4dFELR9XcVIdzL+bvVEEuL1lLrsR3J
	W3vDGajwyYtY7Px3HIhuRe0RG8fgRIOX/8lW1Tr2JnRVnpN39IGb0oGMaC70Lj4dGmRe0fvR+Tv
	4PerVIY/yTctTe3PMj8qRWYX5hvZwA0EGVkHe+w5Y7c44NzICb7w6Bsn4onA8iSFQVd3Xmg/uUi
	Y8EEMe0up8rw+cObpUkVdESFq2wRKQlnDfcQKrr7+CHxMJPJMGQOD5UxLgBWz9s3jQfncs/RaD0
	gZ8Elr6uqLCZxp3I1/0nT4LN4GB3jjRn4mXk1k7WYfMSlqiamUlZ5Sa7g5+p8ddkYFksDVaXuOV
	Tux1S8cKqJUXt6jCyD+LVEKJsYH81fDaa1c3+rJXpVGzphbis2lM=
X-Received: by 2002:a05:6a00:4487:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-84336e079d6mr4799934b3a.38.1781203053898;
        Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4487:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-84336e079d6mr4799886b3a.38.1781203053392;
        Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:59 +0530
Subject: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to use
 DLL bypass
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=4799;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=GtqYv8yTeq4PzlXpWMuFX96v7sPl9ApaMmizTH0wFJ0=;
 b=A+o89b25yP5p1Mg5UsjerNAHlaA07dc6XakrqeXi467eWa0RjVcP6DjQXPcaF1Q9iH4lXirnO
 FRUuZjNj+8eDbM88yMdkC3X/Cmd6n8mAbCu9bcJ0Qil2xlIc6WbjsXV
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX2huQ5jij1lT9
 KEnMEugmdHkOf3BgiW5oaQMuAmpV6sCLkAV/S557r3mvW91eyTZtmjZandzRLClHxm1Ep3vYaAz
 4R6CUkz909HeyS7Mr2f3N7/4Q3soGn4A6x7xT/LC0vIbWSWUOYfsUhJI9qxVSvE4T/LHbLcISQs
 ZMIQxVOtLr4YIJeG9/9brgZKu1QIcVfkn0r4hsM+L+CqQrBLAlCzcaq06TuX89CZUnbD/8PgbV4
 4jp9/hSpZGEkizqu/UhDnKDnLD5ZhzSNtzfU02JdSKir5mt1XCAZXYWdDb7NVYMuocfpceFI9d4
 3UUTLVjKD2Q8g8yaOF1u1mF5qqzLOn9bioKLBCXo2BoWzLuEPXj/wHCHEBFzDbYgUEzUTrryvie
 qGHi/0GdkV87um5ZSWR99GgIgUhMasAJkIztexxNdTdrjDdIeHIA3GcwXBkbhilsi84gJaWXBOj
 r+6kM1jOQ73GSTw2W4A==
X-Proofpoint-GUID: riocj3acrIOJIvE70Ey4UOnjHsVQO8Y8
X-Proofpoint-ORIG-GUID: riocj3acrIOJIvE70Ey4UOnjHsVQO8Y8
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2b006f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vSCEUKm3QqZMBpSZvnQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXxSON73pc5Mh0
 EEhZSjnUdXYGTo1ggj3w46n0iemTDkpqqVjL5zyJOZ+WhUA8dDY7PL/cTxZf84r9uYfqr067GRZ
 MjcOf+L9tXuOpuHoJ0Sw+xyr9mj2GV4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185

When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
the MAC must not add its own.  The driver currently falls through to the
generic DLL initialisation path which programs it to add a delay.

Power down the DLL and set DDR bypass mode for RGMII_ID, then program
the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
100M/10M, and remove RGMII_ID from the phase-shift suppression in
ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 65 +++++++++++++++++++++-
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 44270c25d874f72e7f971757fec659d36468c315..bec08f1eb8cb41484ba3c91c77393e163e7fd071 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -67,6 +67,9 @@
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
+/* SDCC_USR_CTL bits */
+#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
+
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
@@ -183,7 +186,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	/* Clock Rate Requirements:
+	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
+	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII ||
+	    speed == SPEED_1000)
+		rate *= 2;
+
+	return clk_set_rate(ethqos->link_clk, rate);
 }
 
 static void
@@ -405,8 +416,7 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG2);
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
 		phase_shift = 0;
 	else
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
@@ -475,6 +485,40 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG);
 }
 
+static void ethqos_rgmii_id_macro_init(struct qcom_ethqos *ethqos, int speed)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
+
+	if (ethqos->has_emac_ge_3)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+
+	if (!ethqos->rgmii_config_loopback_en)
+		rgmii_clrmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, RGMII_IO_MACRO_CONFIG2);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -493,6 +537,21 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 
 	ethqos_set_func_clk_en(ethqos);
 
+	/* For rgmii-id mode, the PHY should add the required delays.
+	 * Therefore, power down the DLL and program it in bypass mode.
+	 * Program the IO_MACRO as per the settings recommended by the
+	 * programming guide for bypass mode. This will ensure that the
+	 * MAC core doesn't add any additional delays.
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
+
+		ethqos_rgmii_id_macro_init(ethqos, speed);
+
+		return;
+	}
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1


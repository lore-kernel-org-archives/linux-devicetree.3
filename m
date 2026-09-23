Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628232FDC20
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125772; cv=none; b=J6nEHfjxIWrtRrAp++37/jzFGxrWxUwtl8ZMPxcMqLX0iUm7WYIq6Hpp4ovzuJCBp4/bAMCem7sIEc9ProGu6BoWPreIWfms0iOOLxSMNnYQ/EDrIwnCldPoxmNIYhm14rrHLoZB7/pori7UrWkwQewQk+7d82UhiyI+89y8hjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125772; c=relaxed/simple;
	bh=8JCqwSbRwjzmhB8gNr/abKbRoR9Ocql+CHFLjJdWuPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzEIITQF1INGoTXezY+0o5KxCvQqVB0WAwyBZM1okfunNiaLWWiNEmnH1YTjHMe6Y2b709A0sNGYuDTKpEg9Ml2idK4wUa0hqwX4wZFPZgASgaCuUxr/D2ny3MICLsImhwAyWXgZ95meGu+f9Z+QlTmy/ARhp5mP2T4nZ+GveRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqNrX0rc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RT6tVmfm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqNrX0rc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RT6tVmfm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBeVp3897562
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+yRApf16U76+rx2xdScj1LS1wKb3vRI/Nm9Ak6wcHo=; b=bqNrX0rcj/s4LOcj
	+U24rrKUsdaL26mRPZo995FeNweqz4A7Bm67eJqMGbM52CUSGoARdHAdDggHmHOS
	CLccdY0kgLKesnoT/5SL8j7fHzYn0/g6DPGE5ifQuC/4zZnFpGvhVqK/nnDa5sLv
	MR3iVqymy7zGG3I5mU1GbWlcvSD8XvDqX6DOQoApbyOESwMZZpQbkUn3RllHJmAK
	7EifKAOV1VxxvSQEmIYEc8O7SLAgjwRucEtpM2T8r9pbeUKlluu5LKHy8PCPux+l
	b6aemhqs4ebFfp/J2pfk/xco5J3VxXq66Yojm1TFe0GHO5TqeFril+TAhawk1B7o
	Xvw64Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma1awg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:09:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so538445eec.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125768; x=1790730568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+yRApf16U76+rx2xdScj1LS1wKb3vRI/Nm9Ak6wcHo=;
        b=RT6tVmfmjWOSyQFLgk3vmEPChds70f5eK6t2nBIdx/PLkNT3t4aA4m7dms06ZTYv2K
         l+hgRtVsb3MBgeemBWI1HAQdHqaIIQdOMF5jPzw9On1BsUhsRYM2Xb0Bkda5LxbKm8qM
         pkq13Vyi5gDyf8WsSDo/VRNTu2IVrDGAtDZwA+tMrn8OWsxLzJFbawDMTa/mwwuZN8Wt
         UKm5EBJUZET3jbDhNBKaSB7tZDj4/W8b2VaKLCj9/b4pNFkOnOd6wyNsIcfujb89YKe2
         79H/eZFqT0/hGE2Lk9KYPTeqRA7HuzwdOuqzJXYTQxK6FnKP0zPPZyKT+kLKFmfI5+jW
         eYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125768; x=1790730568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+yRApf16U76+rx2xdScj1LS1wKb3vRI/Nm9Ak6wcHo=;
        b=TYMvZ5pjcHaDRxRHkLx7R310BkIrZXb+XEkypJXGt9/mSoXRycq/uYVb/fDWln8fSS
         eKWvLMpLQkhOE+dBwuYPjaUsND7ZSrFfY49vqRrnOkraddXjefNeQ1zSuBsv+ekMl7/k
         LCuCs69dHh8uoBWEciB9reREXNbjmEe+992jsINYPkdQ/I/BvMontO58CJCTfNvWluQo
         1i24KYxtN+2VW+UMkheGqpp9d0PEwdI8bAYTY7giJgmA/ZuUXQdy8z0FE9pxcC46nIT8
         tErC4GI/KbGDFtIg2YHaOyqEcv5gQAJo3xdfk+4dwbGWj0eAiJE8zStJHT7FiNiwMPOP
         OaQA==
X-Forwarded-Encrypted: i=1; AKwUvByij6CyWeaqeae5gB4sIugURZhUsXxC0eaHXJP4hhiblcir+byH5K8O9iL8Hgq+01fZV6cJwfglllNi@vger.kernel.org
X-Gm-Message-State: AFuF++l5YVI+7t+Hg8gvWvY5O7VjyclbUXhxNA761bXdTaOpbFwgKVh9
	zzqdO4Ie4u9/gYB3R8OT3tGkCyDfBhh9l/dHyz94xG5xwOm5MZ5kNmD98q3/+SFEFPb7L9oMm3U
	B7O/pTWMwuGrqqsnLota0T8+CuKUF9v+7dX4OUFyyywoA+jY7luaTADcXhYh523xL
X-Gm-Gg: AYBFou3AF1mnzRzUCGiKUfZm6WNhd9MA/YV/OwzWQSjhxvMMwiDDXQxOnK4CqSKl9xM
	VMX1KkBB6skD84Ni8MD4qTWWmLnp3wIFo1NOLhe5385lN3fuwYRmHEijXCKYf/dXrQaFaP8IjR3
	LlsqS+AEFMI9qWX37trA/19qQfAqJhbFTPTXmWv+scxQQZKcSaePIoxweLE9O+QeaL7nUpFSf1B
	bY3XLgNolAfK/aGjcf4CR4VOI93Iy5+7qngfKJrSGTI072j3ZCLgzG+OmnFv38qkd3nYYpYxj7u
	tjJvcqnjG1cI503H0E+iQ83WKA47PkqiR8EJKipxsAnufC9WOhESR2XKnfWPC19v6bwFSoHJdHe
	yulkdnGtTQKcuYqmPWH2j0+LKLSBN
X-Received: by 2002:a05:7022:fe08:b0:144:f4b9:9be4 with SMTP id a92af1059eb24-144f9159169mr1345279c88.15.1790125767662;
        Tue, 22 Sep 2026 18:09:27 -0700 (PDT)
X-Received: by 2002:a05:7022:fe08:b0:144:f4b9:9be4 with SMTP id a92af1059eb24-144f9159169mr1345228c88.15.1790125767038;
        Tue, 22 Sep 2026 18:09:27 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:09:26 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:35 +0530
Subject: [PATCH RFC net-next 9/9] net: stmmac: qcom-ethqos: add Qualcomm
 Nord support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-9-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=12058;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=8JCqwSbRwjzmhB8gNr/abKbRoR9Ocql+CHFLjJdWuPY=;
 b=XPuoKfGPn07fjZK/71e/KV5+X5ASAjWePOm1hrhsBul/IHARxgE0QWkbOocsV+BWlbydIn4fh
 P6vETEgK/ISCGdG/Z7aCliHPwIg3YENgz6awgJm0fQWrdyEBwhVgv9o
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: gnVbgD2azzSVkc-PpVtmtW5zMhz2hTnY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX7cK4VDwSa619
 knz9q32qK/kMWTmIKL+jJjxyYO8Wh1JYqZaaC91tyUM6+m75cMyKM+ZeGRgORU7EUr5JkMQa9Cv
 u/2W6im7rP79Cx+Gn82Qs1K+Cd1ODPs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfXxGjPTI38qnoB
 JRrFB1MpNJdFIhjJXtI69cWnpVkm3oCrAuAk7RLgbZyC3GCD5S4GSdjwfgKUFLt3ed2w1glizP6
 v40ViZEqjDmy/LvUAxYY/JHzSIH++h4AluIZvWv5mLb1gdZg9iGVPgJNJWKcMlmrk3LCm+wlXhF
 SkDtg2QHMgt2On1i6RBMhllGWlbm6vP78ooLbeP8CUK9D2Zxeo4I1RI3eWTRqx+utuQpfGpkAmh
 19cb4iFJk5xTlA6V92LjIcjbb756rQThuhRsdyDqKnGtjnruUvIr3CHIW2UfzEC/6Wmzkk7Ytqz
 Z72BkB4d1hPH8U/M4SwfSRaLbppiQVtoGvlZ828mwY1s0yj9qbtFSCbRIeqoe+ao2/wagjUthgf
 2PLoIXsuKudbjBoCqBa/DTFsTv69qk9KlgHjE4klS7h31b6Myt03w79Vv57ohks6JN0F+am9OpA
 JHt0Eme1bENOd3bjSoA==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab326c8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5chfiMuH4t9yzvW4qJoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: gnVbgD2azzSVkc-PpVtmtW5zMhz2hTnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004

Qualcomm Nord provides two ETHQOS controllers based on the Synopsys
DesignWare 25GMAC IP.

The Nord integration uses platform-specific MTL queue, DMA channel and
timestamp register addresses. It also requires wrapper programming for
USXGMII operation and an EEE clock vote for PCS link-up.

Add the Nord platform data, select the DW25GMAC core, describe its
register layout and configure the ETHQOS wrapper for USXGMII. Also add
the platform-specific loopback control needed while the MAC is being
initialized.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 142 ++++++++++++++++++++-
 1 file changed, 137 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a99a78880c0fb7858e90b6212b37ebfc7fccaf84..a03c8e203920a70238deff9f1f970d29d1293893 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -23,8 +23,14 @@
 #define RGMII_IO_MACRO_CONFIG2		0x1C
 #define RGMII_IO_MACRO_DEBUG1		0x20
 #define EMAC_SYSTEM_LOW_POWER_DEBUG	0x28
+#define RGMII_IO_MACRO_SCRATCH_2	0x44
 #define EMAC_WRAPPER_SGMII_PHY_CNTRL1	0xf4
 
+#define RGMII_IO_MACRO_BYPASS			0x16C
+#define EMAC_WRAPPER_SGMII_PHY_CNTRL0		0x170
+#define EMAC_WRAPPER_SGMII_PHY_CNTRL1_V4	0x174
+#define EMAC_WRAPPER_USXGMII_MUX_SEL		0x1D0
+
 /* RGMII_IO_MACRO_CONFIG fields */
 #define RGMII_CONFIG_FUNC_CLK_EN		BIT(30)
 #define RGMII_CONFIG_POS_NEG_DATA_SEL		BIT(23)
@@ -77,6 +83,21 @@
 #define RGMII_CONFIG2_RX_PROG_SWAP		BIT(7)
 #define RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL	BIT(6)
 #define RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN	BIT(5)
+#define RGMII_CONFIG2_MODE_EN_VIA_GMII		BIT(21)
+
+/* EMAC_WRAPPER_SGMII_PHY_CNTRL0 fields */
+#define SGMII_PHY_CNTRL0_2P5G_1G_CLK_SEL	GENMASK(6, 5)
+
+/* EMAC_WRAPPER_SGMII_PHY_CNTRL1_V4 fields */
+#define SGMII_PHY_CNTRL1_USXGMII_GMII_MASTER_CLK_MUX_SEL	BIT(4)
+#define SGMII_PHY_CNTRL1_RGMII_SGMII_CLK_MUX_SEL		BIT(0)
+
+/* RGMII_IO_MACRO_BYPASS fields */
+#define RGMII_BYPASS_EN				BIT(0)
+
+/* EMAC_WRAPPER_USXGMII_MUX_SEL fields */
+#define USXGMII_CLK_BLK_GMII_CLK_BLK_SEL	BIT(1)
+#define USXGMII_CLK_BLK_CLK_EN			BIT(0)
 
 /* EMAC_WRAPPER_SGMII_PHY_CNTRL1 bits */
 #define SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN	BIT(3)
@@ -88,6 +109,8 @@ struct ethqos_emac_por {
 	unsigned int value;
 };
 
+struct qcom_ethqos;
+
 struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *rgmii_por;
 	unsigned int num_rgmii_por;
@@ -97,12 +120,16 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	struct dwxgmac_addrs dwxgmac_addrs;
+	enum dwmac_core_type core_type;
+	void (*set_sgmii_loopback)(struct qcom_ethqos *ethqos, bool enable);
 };
 
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	struct clk *link_clk;
+	struct clk *eee_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
 
@@ -111,6 +138,7 @@ struct qcom_ethqos {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
+	void (*set_sgmii_loopback)(struct qcom_ethqos *ethqos, bool enable);
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -201,6 +229,15 @@ qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 		      EMAC_WRAPPER_SGMII_PHY_CNTRL1);
 }
 
+static void
+qcom_ethqos_set_sgmii_loopback_nord(struct qcom_ethqos *ethqos, bool enable)
+{
+	rgmii_updatel(ethqos,
+		      SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN,
+		      enable ? SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN : 0,
+		      EMAC_WRAPPER_SGMII_PHY_CNTRL1_V4);
+}
+
 static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 {
 	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
@@ -220,6 +257,7 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
 	.has_emac_ge_3 = false,
+	.core_type = DWMAC_CORE_GMAC4,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -236,6 +274,7 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = false,
+	.core_type = DWMAC_CORE_GMAC4,
 };
 
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
@@ -252,6 +291,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
+	.core_type = DWMAC_CORE_GMAC4,
 	.dwmac4_addrs = {
 		.dma_chan = 0x00008100,
 		.dma_chan_offset = 0x1000,
@@ -286,6 +326,8 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.has_emac_ge_3 = true,
 	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
+	.core_type = DWMAC_CORE_GMAC4,
+	.set_sgmii_loopback = qcom_ethqos_set_sgmii_loopback,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
 		.dma_chan = 0x00008100,
@@ -485,6 +527,47 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static void ethqos_configure_usxgmii(struct qcom_ethqos *ethqos)
+{
+	unsigned int i;
+
+	for (i = 0; i < ethqos->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
+			     ethqos->rgmii_por[i].offset);
+
+	ethqos_set_func_clk_en(ethqos);
+
+	rgmii_updatel(ethqos, RGMII_BYPASS_EN, RGMII_BYPASS_EN,
+		      RGMII_IO_MACRO_BYPASS);
+	rgmii_updatel(ethqos, RGMII_CONFIG2_MODE_EN_VIA_GMII, 0,
+		      RGMII_IO_MACRO_CONFIG2);
+	rgmii_updatel(ethqos, SGMII_PHY_CNTRL0_2P5G_1G_CLK_SEL, BIT(5),
+		      EMAC_WRAPPER_SGMII_PHY_CNTRL0);
+	rgmii_updatel(ethqos, SGMII_PHY_CNTRL1_RGMII_SGMII_CLK_MUX_SEL, 0,
+		      EMAC_WRAPPER_SGMII_PHY_CNTRL1_V4);
+	rgmii_updatel(ethqos, SGMII_PHY_CNTRL1_USXGMII_GMII_MASTER_CLK_MUX_SEL,
+		      SGMII_PHY_CNTRL1_USXGMII_GMII_MASTER_CLK_MUX_SEL,
+		      EMAC_WRAPPER_SGMII_PHY_CNTRL1_V4);
+
+	rgmii_updatel(ethqos, USXGMII_CLK_BLK_GMII_CLK_BLK_SEL, 0,
+		      EMAC_WRAPPER_USXGMII_MUX_SEL);
+	rgmii_updatel(ethqos, USXGMII_CLK_BLK_CLK_EN, 0,
+		      EMAC_WRAPPER_USXGMII_MUX_SEL);
+
+	rgmii_updatel(ethqos, USXGMII_CLK_BLK_GMII_CLK_BLK_SEL,
+		      USXGMII_CLK_BLK_GMII_CLK_BLK_SEL,
+		      EMAC_WRAPPER_USXGMII_MUX_SEL);
+}
+
+static void
+ethqos_fix_mac_speed_usxgmii(void *bsp_priv, phy_interface_t interface,
+			     int speed, unsigned int mode)
+{
+	struct qcom_ethqos *ethqos = bsp_priv;
+
+	ethqos_configure_usxgmii(ethqos);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -625,7 +708,8 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	struct qcom_ethqos *ethqos = priv;
 	int ret = 0;
 
-	qcom_ethqos_set_sgmii_loopback(ethqos, false);
+	if (ethqos->set_sgmii_loopback)
+		ethqos->set_sgmii_loopback(ethqos, false);
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||
 	    interface == PHY_INTERFACE_MODE_2500BASEX)
@@ -647,14 +731,24 @@ static int ethqos_clks_config(void *priv, bool enabled)
 			return ret;
 		}
 
+		/* PCS link-up depends on the EEE clock due to a hardware quirk. */
+		ret = clk_prepare_enable(ethqos->eee_clk);
+		if (ret) {
+			dev_err(&ethqos->pdev->dev, "eee_clk enable failed\n");
+			clk_disable_unprepare(ethqos->link_clk);
+			return ret;
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
 		 * ethqos' fix_mac_speed() method is invoked.
 		 */
-		qcom_ethqos_set_sgmii_loopback(ethqos, true);
+		if (ethqos->set_sgmii_loopback)
+			ethqos->set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
+		clk_disable_unprepare(ethqos->eee_clk);
 		clk_disable_unprepare(ethqos->link_clk);
 	}
 
@@ -738,6 +832,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
 		plat_dat->mac_finish = ethqos_mac_finish_serdes;
 		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_usxgmii;
+		plat_dat->mac_finish = ethqos_mac_finish_serdes;
+		break;
 	default:
 		dev_err(dev, "Unsupported phy mode %s\n",
 			phy_modes(ethqos->phy_mode));
@@ -756,12 +854,18 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	ethqos->set_sgmii_loopback = data->set_sgmii_loopback;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
 
+	ethqos->eee_clk = devm_clk_get_optional(dev, "eee");
+	if (IS_ERR(ethqos->eee_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->eee_clk),
+				     "Failed to get eee_clk\n");
+
 	ret = ethqos_clks_config(ethqos, true);
 	if (ret)
 		return ret;
@@ -778,7 +882,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
 			       SPEED_1000);
 
-	qcom_ethqos_set_sgmii_loopback(ethqos, true);
+	if (ethqos->set_sgmii_loopback)
+		ethqos->set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 
 	/* The clocks are controlled by firmware, so we don't know for certain
@@ -791,9 +896,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
-	plat_dat->core_type = DWMAC_CORE_GMAC4;
+	plat_dat->core_type = data->core_type;
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+	if (data->dwxgmac_addrs.dma_even_chan_base)
+		plat_dat->dwxgmac_addrs = &data->dwxgmac_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
@@ -817,8 +924,33 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct ethqos_emac_por emac_nord_por[] = {
+	{ .offset = RGMII_IO_MACRO_CONFIG,    .value = 0x00C04D03 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG,   .value = 0x2004642C },
+	{ .offset = RGMII_IO_MACRO_CONFIG2,   .value = 0x00222060 },
+	{ .offset = RGMII_IO_MACRO_SCRATCH_2, .value = 0x4c },
+};
+
+static const struct ethqos_emac_driver_data emac_nord_data = {
+	.rgmii_por = emac_nord_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_nord_por),
+	.dma_addr_width = 40,
+	.link_clk_name = "phyaux",
+	.core_type = DWMAC_CORE_25GMAC,
+	.set_sgmii_loopback = qcom_ethqos_set_sgmii_loopback_nord,
+	.dwxgmac_addrs = {
+		.dma_even_chan_base = 0x00008500,
+		.dma_odd_chan_base  = 0x00008580,
+		.dma_chan_offset    = 0x00001000,
+		.mtl_chan_base      = 0x00008000,
+		.mtl_chan_offset    = 0x00001000,
+		.timestamp_base     = 0x00007000,
+	},
+};
+
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,nord-ethqos",    .data = &emac_nord_data },
+	{ .compatible = "qcom,qcs404-ethqos",  .data = &emac_v2_3_0_data },
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D5401A3F
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732575; cv=none; b=S9cYUVB959OiCMsIbNSZWA+pJ1DTHccbFO4gqW8B44oDbyjSdbYx9vd7cvAYwobkmYbBEtU5v1YPxU9NKNclsOdC8lFLmvd2ffVzUjEXehY1j9vPSI1QjGuF319qsSwpufaA0Ez9IMZ7QpyKoX59Frlgu0wgMPxD2HsWk640/AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732575; c=relaxed/simple;
	bh=o5XoyX1coHzwS5MK4Nao0YTpRLZfe0Qwh6ArwM+K5eE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f/vmZa06cdTpCZBZFvN7Z2pO/pySuuDeNPcPYQ8lQj30l77eNbmoPQdQ5HGqg1G8tqnc9ZbeOn75gscKUADmgmk6hdW8zXt3uBs8C0um/09kECahuMWIez9EgZ5GtSVZnH+0K51s/c3YmQbESworNTM5xcWMJY8bJS96eTmB3Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2a8aA/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3P0xvUp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2a8aA/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3P0xvUp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATErc2647844
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyAtb4Z5AA87tJM4aAbz48OZuPpDfL6rZEVyCzADtro=; b=O2a8aA/h4nhMHkFW
	vsknL2Ick1SFdK2BsJ6bMWbfm11nyrFBnRzojmxlHak4ZBdI7UKqsi4RoySF4e9H
	SqkURymOu0zI9tSec1PWxPZxeUu2GJZ3faf+hdI31bwIUMgaUVv6eM1s6ObX4haa
	jzgJTnmXNoJ+o/PN8XBkTwytIxJxKM/1s5cq4jwMMG1nQjra1HyJpjMXRogC5Q/i
	6DHyPs5S/30q9qTRdY1D2j+y2Xt7TUsRPipZFyUcDV1rJkBU9Z8eSIYgBGKOzDxv
	yJjWCJ8/rz31w+5Y6MHKfIaE9TT4cV5AzNKRvLwMfb3JWqC/wqYneARhCw4ICY4h
	bbED0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjh1jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:29:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92af3d5e85aso685436885a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732572; x=1783337372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyAtb4Z5AA87tJM4aAbz48OZuPpDfL6rZEVyCzADtro=;
        b=d3P0xvUpqvxjjVsi40MJUpf1KCOMmH/OjNTeaNIvUByC3mQPV4uePpiK/WHjZcILaV
         s0EzF7cZv90T4Y1rSeDdNynWB1a3yuySF9JE2ZrDHzNxvoey7yVna8E29I0fpLKYjfa/
         3qxlsSGnxUvosX6qnOKPCx6SxASUKEDLu7XZkr/RwDu6K9ox1gGxTBwHm1ZgFwv3td+l
         c4mf2EDnF4sb0sfP/sb6C7C56O+u3xqAWimsQFDjAqQhaP2dCFZSyzhQCEl8/HL28VOZ
         ImvS28CFwyZH3vhCnVAJdi3gunjptltGmn0EpIPmequi6NVJ/rQ1n3EvE1XALdrIi5OZ
         tvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732572; x=1783337372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cyAtb4Z5AA87tJM4aAbz48OZuPpDfL6rZEVyCzADtro=;
        b=SbTqyLaUJ9bf7Y1nkkn5hbsFGclO+iVEfYci10oldQi/+3hRwQ5ElK7TYcZ4xSM12e
         /2YVrAzLaU4fLVCNgiSUwPyvxSOy4wdmARdVsaFl6aFKXGqhLIkhRX26YaB+RZ1bKqLn
         9Tn5GK6O1evDKipKON3wfDXaV3yT7Kv+sl/77zhSe9HEhJfEYMajMPSdqAR7tMymRvHC
         xDBnCYtauwulX3qgNDQMNhkCLoR22pYN+7nFFsJf5uOtHRqJ/HsrzXnTupM9xa4RctXb
         y5QSxlPNshUocy/mWnqwANKiCm0djZKUxS/IikWHC9lnvP8h6hho72HrVexmf4GOAh49
         dOAg==
X-Forwarded-Encrypted: i=1; AFNElJ9f3UHtYeNYU9pysQY1dFUwQbm6cuDo5KnmUbGexsNSXlU0rdSe4ljYb3jhUyXDbdFDPjK5Q1zguNMS@vger.kernel.org
X-Gm-Message-State: AOJu0YytVdusfWFoLm/SqvqeD84hat/Z2EFumPHxiJqTLR+o7UU0Pn7X
	9STXfaIzEE6j+SqkToFmMrg20xjr7uJ5/Ju+9Cs6WqutB2vL/A2lzjl6WTTe5EDjFLwHtrJxGU6
	5bcj/D4Q2ZazymYJFsP49CECOca4JMYaEdUfHhoFjkoyFqcxXkTWFwYXK1rbdZqKk
X-Gm-Gg: AfdE7cklDVHsS8FBE6b0txm0pdTVw7unYSCIkeU7flMqpKyNw17QUThtB7pzOWw0sK+
	Y4qTPy37C+OG558NjBLxyHseUOxdD22cxzqccj7KoLwI9BjZPm+ySflL/0b7GumLpjfi/rggLlV
	fzRcPtYneZmEt8VXS+md14SfJCHEFt3E69K6Hmrq+vK8hOrhbmt1Pvj2JbMLIT+0dAZcEdqRm0z
	wZld8qer8Voc5A3vU/0g1F3okAkrSVmF35sc0qOzWNpXJ6gNvgVvhkOIuj0BSK1/+UGPGMe5jUS
	VQPYOoL58NYll4XtrzLxBKDar5m5Ha9dytH2ZAjEbA75anwLi1FaF7yXWEI1wg2XfBZDhfeKsiU
	Qb3ESg1BtfnJwKHM8HXPKILLQ0L5ifi/nb/6351wQ
X-Received: by 2002:a05:620a:45aa:b0:92e:4e45:dea6 with SMTP id af79cd13be357-92e4e45e5c3mr483917585a.52.1782732571501;
        Mon, 29 Jun 2026 04:29:31 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:92e:4e45:dea6 with SMTP id af79cd13be357-92e4e45e5c3mr483911785a.52.1782732570816;
        Mon, 29 Jun 2026 04:29:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:52 +0200
Subject: [PATCH net-next v11 6/7] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-sa8255p-emac-v11-6-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=o5XoyX1coHzwS5MK4Nao0YTpRLZfe0Qwh6ArwM+K5eE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlcDTAon0X83/cuVf2FonlyDJldJI+jtgKRNr
 qw94YCFiE+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJXAwAKCRAFnS7L/zaE
 w/hYD/4l+Si6QWsD7+ZZxmaH96VzTsVjckV/wXRff5CAaOIfjpJvFKCtXTaM3YdcF42IaaYN1Hx
 2HNWSLGg1VdwPzcYScIC3MEokznjNOhfTT4g49+bvYwDDlBCtNLiMDc7s3VDTKgVOCHHFu283rb
 ON/ZxL8rsLPQLMe1Zovv0J6E+Ha0QbrbOXCWEIPZMx8Xzef+f5NZWiloH5IDGoztVm2s4V1FDp+
 jXYSCwHCYXpMig7U0ZbGkNwW2VtIZfNOEUQswnoFnP7cxQltjaCJfKxJZwZ3KCzbm5lxjV+KLfr
 /dzqZZl7Ng9OAZSzksTPGeIZTtNkUxIi3UOwtYF8PRk5x+k4ElPxQy/0uVUsmB6Gtpko6JAIL2A
 PtOTpmcE6CbyKI/0xOfhl8+lW4lZRcSGYLpQCbzX/8Z37/3i6S/irGyzB45DjYpLPICGaaBGYU6
 Jsb8gWfgQkeD8rfrBYi4d1eElYfYUFdRemSeg2vS/u4NMaEhOtG2NmwMuLd9vlyr790vRPN/hso
 VwTMBS+A81ha8yuYxdFxURpA4kaZ0pfJrQmpCHbm2xBYkQIZlaM6dH9umSmVRftI83uTfFZ2x27
 L6qtp7zKI00038b7/0ZEgI7Z95MYowxHtqkMs30AHeR47uZq9EOncyUC2xbyr6s4mqqPTwLsyWT
 MpjfoP9Wuse2kYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: K_FcpV3ZSpOcvHVuc5lkduRE4o90HQox
X-Proofpoint-ORIG-GUID: K_FcpV3ZSpOcvHVuc5lkduRE4o90HQox
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a42571c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=dj4JEN0qHmgdNMwDfcEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX6d5dgkvpryP7
 Pxn6hAclZpUSrxQ95WYmAxEOAwvBPnSgo5Laz97UvhsDTCpxJzCFVvI/qO+OCzsZMix9vQxP1Ag
 PSxJeq1hohcQnSmr5bEFWgUZL+V0RUg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX7IPA+Cm46pVi
 zgB1wJ43DIZrI9tcvFgt270LwD7TUIHvCwNBjDFaYqcHRlHarVUbleHdXtqcKiDmycimV/bVDm8
 RUUooxbO5lEeWw5vZyB7Lwie9jxQgIP0T0QIeoGHXgvbQiZ4wJtb9/CegVBFNRwzUWb9AjKc9Ib
 Z2hQVgqpuB+LZbrSqlWrYJxoPjF0SvxDilfu19uCjO3zXcs+D4rzzyWEXUn4bK7M9SN9LrM0vem
 8SwzU9ROJr/TaOe2RCHO0aECd+k1r9/fS3cbWApA72aJ3mVRB3lvQ1vnfQjO6MdXM6zWe8Av0+o
 DAVMd2tEkE36p6x4c9FxXztsFAUsyHuAmJMDm06F8mvTmFzKYAAjL0YwOYMySDXBShQ6j+W+5qs
 gB+YyHlfI30SBV7ECXkP/7ZxeSVimsJQWagHHMPwtCcA9VM9Lnv5z+QEsWxlUNjm8/4cUgwKrDA
 DUVQgXDesGT8i4HeLmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094

Ahead of adding support for firmware-controlled EMAC variants, extend
the ethqos_emac_driver_data structure with a setup() callback, implement
it for the existing models and move all operations not required in SCMI
mode into it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 99 +++++++++++++++-------
 1 file changed, 68 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index fa3447b90315672d706d5ce7d710bdec6214e4e6..f379570f80680e96f027873cda6a6bca398e22dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -5,6 +5,7 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 
@@ -81,6 +82,8 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+struct qcom_ethqos;
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -95,6 +98,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	int (*setup)(struct qcom_ethqos *ethqos,
+		     struct plat_stmmacenet_data *plat_dat);
 };
 
 struct qcom_ethqos {
@@ -199,6 +204,9 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
+
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -213,6 +221,7 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -229,6 +238,7 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
@@ -261,6 +271,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
@@ -296,6 +307,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -685,6 +697,58 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	ethqos->link_clk = devm_clk_get(dev, ethqos->data->link_clk_name ?: "rgmii");
+	if (IS_ERR(ethqos->link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+				     "Failed to get link_clk\n");
+
+	plat_dat->clks_config = ethqos_clks_config;
+
+	ret = ethqos_clks_config(ethqos, true);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	if (ret)
+		return ret;
+
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_1000);
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
+	ethqos_set_func_clk_en(ethqos);
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
+		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
+	plat_dat->dump_debug_regs = rgmii_dump;
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -706,23 +770,20 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
 
 	ethqos->phy_mode = plat_dat->phy_interface;
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
 	case PHY_INTERFACE_MODE_SGMII:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
 		plat_dat->mac_finish = ethqos_mac_finish_serdes;
 		break;
 	default:
@@ -732,24 +793,13 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	}
 
 	ethqos->pdev = pdev;
-	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
-	if (IS_ERR(ethqos->rgmii_base))
-		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
-				     "Failed to map rgmii resource\n");
-
 	data = of_device_get_match_data(dev);
 	ethqos->data = data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
-				     "Failed to get link_clk\n");
-
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+	if (WARN_ON(!data->setup))
+		return -EINVAL;
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	ret = data->setup(ethqos, plat_dat);
 	if (ret)
 		return ret;
 
@@ -758,21 +808,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
 				     "Failed to get serdes phy\n");
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
-
-	qcom_ethqos_set_sgmii_loopback(ethqos, true);
-	ethqos_set_func_clk_en(ethqos);
-
-	/* The clocks are controlled by firmware, so we don't know for certain
-	 * what clock rate is being used. Hardware documentation mentions that
-	 * the AHB slave clock will be in the range of 50 to 100MHz, which
-	 * equates to a MDC between 1.19 and 2.38MHz.
-	 */
 	plat_dat->clk_csr = STMMAC_CSR_60_100M;
 	plat_dat->bsp_priv = ethqos;
-	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
-	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (data->has_emac_ge_3)

-- 
2.47.3


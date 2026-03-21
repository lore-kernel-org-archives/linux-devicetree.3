Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B4938756A
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774101059; cv=none; b=m/fciAcopEloh2I1yAomI5vA9/ZlICX/DRjetSXhxCfSTVJvNEc7xfxWfOzTIIjc1FCDOhLNSrIW+p1ifEwU72sk2CZW8nwChOZZiTqQZSKzvAUUJVprT9nnaoyCnW16EJNE3/S0k9e+fqe1yoCkyFZ92AMMrOInh/ToMhfqxzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774101059; c=relaxed/simple;
	bh=92OGINrYIEMHF4Yj1z89XucWCdQo5x7PD93rkEDJkSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pGH4j/5C1BPizRpjGsaSBm45fhFbYgEaJ+C6ShEOsR651FspRhsfTgr2gvpeOdFDxInLYepugFpxZQbhqZZjpO5GYGzi9vCouXSODVOpnhrB14VKMOBR6vVnU/06nbduZP7sXBQxDVu+Td101nS0CAYsDY943ra49Nyss+i2y64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbRRxNvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e53JOUzf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbRRxNvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e53JOUzf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LBorsp465839
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 13:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dEwv3v4fvUI
	ft8JTog2rIO4fgOp9tun/AvsOV/PcgME=; b=YbRRxNvMbb0bTnKuOUFNjAugrSH
	mbQgzEOVLCNBcbkGentXKXdqKynHhMwdukdelNCMGRLNOdLW8c2AjK+yCiWNKxTU
	SHCDL/h1sX+ZI0t2FrZSpy5X7lOW6B1vGWGfcibHcuqrCgxe4avSPI06cAKMW0VJ
	z749n+4JhMP5MmwmU3EdC6Y6r/7Q+yNh7w55FE8BPyXyyPTW6GWNz2ZRplGTBA3y
	rhiGnGDuiNpUKaGMCCRyOuaE+OzMJgNXo7ncQkDb5BAbLVuJ0nGn3ODGnjF/Xozd
	oIp/Vwz3QuNV38WA3if0WMB/8k8+49WXHcPLSRpnLxS9Pndyvt0TNVWsTPg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1gr3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 13:50:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-359fe4e9ea7so2578252a91.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774101056; x=1774705856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEwv3v4fvUIft8JTog2rIO4fgOp9tun/AvsOV/PcgME=;
        b=e53JOUzfRn7jhJ+kfuFsXrL30/aN2GdF1GOQQjbq/O+jcCVchT5TCjr64ihysT0nJR
         nu0lyfuI+ssnk5Twi8esR7WmxWQ7Fl7vMZb/fPbX4KDpxe0tZGK6Es7u4124RgcB124n
         nFieDFP0dgVM6nxCIVhOBKei4UM6e/g6geOiHbp8NI6qG5HSpkjQFN5gDx4RbOaKmJzy
         lYK5rKpLcPHNiOvMlZ2bZQfusKfAXtjFPl5tZFaftX9/DFkYHYgRvVFlNNPntNlvCCTf
         4MgEfIaQDXFqoWcRdx5oKSl3ELexHXTDw6Ss1qHEbdQ4VoGbtnMOvfmDFVU4dw08aupY
         28CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774101056; x=1774705856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dEwv3v4fvUIft8JTog2rIO4fgOp9tun/AvsOV/PcgME=;
        b=pdUdMjd48/BPoOklEjmUj9wxw5kZj2oM48lNs0iApZhAaDEcft8dux91Crybz5QmpF
         WYSI1+VU/FWFsVoOsgeLTkY8V4/ii0TRZ5JYMZ5O2ikAzieFBbzCz7OV9ZYv/GETXXFN
         rxJvOkkStIKaJWclA8fSLJoqoSovJcvi/BczXXf8Mptw+hlb2rtA1ks79eJuVzMbQDmx
         NBfaE9ehDB2luSICBokhZFlNlM8g/KRs42K6jtXrobGBk+vhoEPeflUd4zr/u2ShACRj
         MM8WtVDj4bv/ZXDtnO60e9jbcol5NpHN2wNDnIG6KlpIvKYdxSAxPY5BriM6XfI3lLLV
         ujtg==
X-Forwarded-Encrypted: i=1; AJvYcCW3dlFtS/5Xs5tkgB6Ng1FkxxqZqiPPjOPTextim2DN5IhqELY2HgSDc6zDg6NbAnP2sdLdfrXWBgCo@vger.kernel.org
X-Gm-Message-State: AOJu0YzXUUmPM6FnPtey0oLN2Z62Vh3eRo0ph1+y+/NzIC0vV77p3Q8h
	nzMx1CPSqg4V5KC9FkUlMm8a+u5A8F7s9oDVpZApg/FxZYfmHwGUbImIaTknz1LLVGICsV6vpmA
	TXM3moLQAc05Nz1abdLiUoxwkwl0tKdsPii2v6S1SJ+tq5rZgXF3iEWpgdjLyw7ZI
X-Gm-Gg: ATEYQzzYiv0pH/nj8wbOMYAn2cnJEWRKbIRGYqpNVxbnQ2KCZahwHxNmXoXtzGnKKPT
	mZ/oolOtE/rB3K8edf61hJvftZyz0eqY9CgShP3XzzVUD73aTvDNHtzELeuSzFsmywin+htyUPd
	DxPaPp0k1/luGGmYgI1WIm7eapo401GuAbPamjZltcBWj5ogYNfMdimZST3qRFUtBsvOy5hFZg7
	q4qOszKFDMQYRDjRypbYDWsuEl7tyM24X/YlN/UDUyKhJHTvxF+uuDg9GNgwxk2rGUV+m/1bAtq
	Id6YPpqdcMSynWv6mOr9derflb3fdfj05ZiK5FzaDCqPcY7HbEKTXrkkk3Lr86kbXTk/oFJ2J6s
	M1Hqmt83/VnFk0wcOPT7Pe7VsBeZcElLKgY2s6Tp+Doj1kqdzcQaw8iVjMw==
X-Received: by 2002:a17:902:e551:b0:2ae:c9be:5f30 with SMTP id d9443c01a7336-2b0827898f7mr62267135ad.23.1774101055705;
        Sat, 21 Mar 2026 06:50:55 -0700 (PDT)
X-Received: by 2002:a17:902:e551:b0:2ae:c9be:5f30 with SMTP id d9443c01a7336-2b0827898f7mr62266925ad.23.1774101055240;
        Sat, 21 Mar 2026 06:50:55 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm54897555ad.2.2026.03.21.06.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:50:54 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linusw@kernel.org, brgl@kernel.org, linux-can@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v3 2/2] can: mcp251xfd: add support for XSTBYEN transceiver standby control
Date: Sat, 21 Mar 2026 19:20:31 +0530
Message-Id: <20260321135031.3107408-3-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
References: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8N3_83eXc8boqRRDxusNH4cT_qs2n_bV
X-Proofpoint-ORIG-GUID: 8N3_83eXc8boqRRDxusNH4cT_qs2n_bV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDExNSBTYWx0ZWRfX3l40Wv0L04k2
 X3oLhR6AcpYQrO/MAridmZnS+11wlWj4K/hewj/5rvxO7pfYr/fBT1mIs3x9RBeXB/QzUd0+zUx
 O4o2DzvP7BnenrrdrVLoBm7FYL2muK43tc617H+MUfbf1hNgDRxFA6/A9gyyUkoOBsAtHbKokUk
 JFM2gtnyJa0q23tREoNLtbSxvnf4UsPauukGtmjxxfm2hpPv/RjFNnPqJCnGrwduq+fn1FeCpTa
 8MB7qrWSfmgXqrGCl3nB2Xma/oOA8t09Jrowgb/9tcRxpesrmdrmbWPTUlKo3VQOjfn5mE2QemN
 sbN3iinACh+B/OmAOCaUvpOsuKw1dVv7PYQ9js4Y+rUrpVhBK3tf+QuqbaEXtazezifBAeZauZP
 x9SJeMNqpGjZb/gKpQk4EY4hYyIKlUnZSXYPaCPixqplWkBZTxFwKBa/FdoG95hRGSi3z3qjz93
 3S9cSxjh1Y01MwsClMA==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69bea240 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=K7bTvPR2ScrnO788fwgA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210115

The MCP251xFD has a dedicated transceiver standby control function on
the INT0/GPIO0/XSTBY pin, controlled by the XSTBYEN bit in IOCON.
When enabled, the hardware automatically manages the transceiver
standby state: the pin is driven low when the controller is active
and high when it enters Sleep mode.

Enable this feature when the 'microchip,xstbyen' device tree property
is present.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
v2 -> v3:

- Configure xstbyen pin before bringing the controller into normal mode.
- Add a check in mcp251xfd_gpio_request() to ensure that GPIO0 cannot be
  used when xstbyen is enabled.

v2 Link: https://lore.kernel.org/all/20260316131950.859748-3-viken.dadhaniya@oss.qualcomm.com/
---
 .../net/can/spi/mcp251xfd/mcp251xfd-core.c    | 37 +++++++++++++++++++
 drivers/net/can/spi/mcp251xfd/mcp251xfd.h     |  1 +
 2 files changed, 38 insertions(+)

diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
index 9c86df08c2c5..92a86083c896 100644
--- a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
+++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
@@ -764,6 +764,31 @@ static void mcp251xfd_chip_stop(struct mcp251xfd_priv *priv,
 	mcp251xfd_chip_set_mode(priv, MCP251XFD_REG_CON_MODE_CONFIG);
 }
 
+static int mcp251xfd_chip_xstbyen_enable(const struct mcp251xfd_priv *priv)
+{
+	/* Configure the INT0/GPIO0/XSTBY pin as transceiver standby control:
+	 *
+	 * - XSTBYEN=1: route the pin to the transceiver standby function
+	 * - TRIS0=0:   set output direction; the reset default is 1 (input),
+	 *              which leaves the pin floating HIGH and keeps the
+	 *              transceiver in standby regardless of XSTBYEN
+	 * - LAT0=0:    drive pin LOW => transceiver active (not in standby)
+	 *
+	 * All three bits are included in the mask; only XSTBYEN is set in
+	 * val, so TRIS0 and LAT0 are cleared to 0 atomically.
+	 *
+	 * Pin behaviour by mode:
+	 * - Config mode: controlled by LAT0 (LAT0=0 => LOW => active)
+	 * - Normal mode: hardware drives pin LOW (active)
+	 * - Sleep mode:  hardware drives pin HIGH (standby)
+	 */
+	return regmap_update_bits(priv->map_reg, MCP251XFD_REG_IOCON,
+				  MCP251XFD_REG_IOCON_XSTBYEN |
+				  MCP251XFD_REG_IOCON_TRIS0 |
+				  MCP251XFD_REG_IOCON_LAT0,
+				  MCP251XFD_REG_IOCON_XSTBYEN);
+}
+
 static int mcp251xfd_chip_start(struct mcp251xfd_priv *priv)
 {
 	int err;
@@ -796,6 +821,12 @@ static int mcp251xfd_chip_start(struct mcp251xfd_priv *priv)
 
 	priv->can.state = CAN_STATE_ERROR_ACTIVE;
 
+	if (priv->xstbyen) {
+		err = mcp251xfd_chip_xstbyen_enable(priv);
+		if (err)
+			goto out_chip_stop;
+	}
+
 	err = mcp251xfd_chip_set_normal_mode(priv);
 	if (err)
 		goto out_chip_stop;
@@ -1805,6 +1836,11 @@ static int mcp251xfd_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	u32 pin_mask = MCP251XFD_REG_IOCON_PM(offset);
 	int ret;
 
+	if (priv->xstbyen && offset == 0) {
+		netdev_err(priv->ndev, "Can't use GPIO 0 with XSTBYEN!\n");
+		return -EINVAL;
+	}
+
 	if (priv->rx_int && offset == 1) {
 		netdev_err(priv->ndev, "Can't use GPIO 1 with RX-INT!\n");
 		return -EINVAL;
@@ -2271,6 +2307,7 @@ static int mcp251xfd_probe(struct spi_device *spi)
 	priv->pll_enable = pll_enable;
 	priv->reg_vdd = reg_vdd;
 	priv->reg_xceiver = reg_xceiver;
+	priv->xstbyen = device_property_present(&spi->dev, "microchip,xstbyen");
 	priv->devtype_data = *(struct mcp251xfd_devtype_data *)spi_get_device_match_data(spi);
 
 	/* Errata Reference:
diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd.h b/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
index 085d7101e595..d3f4704e2678 100644
--- a/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
+++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
@@ -672,6 +672,7 @@ struct mcp251xfd_priv {
 	struct gpio_desc *rx_int;
 	struct clk *clk;
 	bool pll_enable;
+	bool xstbyen;
 	struct regulator *reg_vdd;
 	struct regulator *reg_xceiver;
 
-- 
2.34.1


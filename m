Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905195;
	b=5NYZmNcSCLuf1rghfdtGTV69XMpttdVAGQS60rAL+V2onnQ7aztT3vAN5j7enmFSWYcy
	 yMYSg7Fl2gqCqzw+GhTrXUrg0RZnAQDnLLPoplPQOabuw/z19X2eS9aMAoVqbqGcyaRz4
	 aKBQxY+W5NB9WJ5pSErXJE6VZVgjkWj2mbCZXLxaKnranUSHnnFWXu88wUwyHNbb+baxL
	 FOWiyp/QV4IJ9TUj7MBj2h/KrcOYe3VtDwvt/BOwHn6ZttwfA6ocrkNaAb5o7+nysmKTx
	 YjJCsmOtnAYl6nQBRsqFEGtuumSYoPeWAIPqoE67iSJblXyskkmHi3S5+X/e2PgI47A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=;
	b=d8ipy6kxlPnfYKVu+SsocpSwCntv510zzwlU4BbB/i3YoTYqHsTuWWjapEq74Pcs6/E+
	 5aFxBJNAXIJMs2hCJlOVoBARCToQV1UXYWASkYHNfICjhPeuFM9MPrxQejhxyi/ryUX5+
	 oX2cEaABPNdLHVIXt7efXP778V2vmoHZuxof2RYSuHx0jXBQr5BXlUohGfU7SjMUPOX2v
	 NLd+tbf5SooKSo42pvF2asK0NZ+huwXnSFgcrBRYKpkDOedOs3w0x4jQwfsOWwyKqoFqd
	 1S9nkO/Xme2fkDpRPMXnE63BV+RstC1FHNvv0VmvGk14LghoyHMG0zQnXV9B2JMqAKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXp8YkAf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5159sHG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9BC606A339
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE9BC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXp8YkAf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5159sHG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8aitF3407692
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=; b=WXp8YkAfLNdBX102
	2b3V5vWFXZCOY1QzwlnF/dlNFGn9Le1yo2w7uog/MdPNGYyLa5yVO1vsOorCAu21
	U9DhTd5Isbqzba9iodGbWVYpsPvOhTyudhvNDdL5S030XsW3hWlEPrcHROOubwle
	qzNWy/Cj01rXlBF0mP9a0luAWjc1+9rz2fbdhx+Y2lVVYrDV6426qIX4nNhYzmlm
	IEZVoKxZEu48vXxDTP11ckc76eJi8ONs4n4vBDYDuo9j7V6aWVN8nIRHYs7VB4Ym
	0pKljB80K+DxUk7OKlUVeICnMZXxiXcgBn/5zgdZQ+neoF1rKtdgcf4ALPHJv8Ki
	ZQA1TA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htj78p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd652c0385bso3031289a12.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905188; x=1795509988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=;
        b=A5159sHGM2cxzEd05P4xfNynbUYrSI0jqhG/O4z1Ux/Re0lvYzHOM7cxQit9lHVBuV
         e5tLOfemBr4SGjATifWrUEZ3M6+uZfjbOVNq7MccR3kcKbGtE6eD41jclFyw2DAGDrvP
         jWC5T1UAEh+Tbfz4gKSUvuWarPb3bL/QMEUjbWH4gWOb0pdKaeeCAVHYHgbZHP7P29pW
         K0FIOKo5uhDHPhb9eiQalAmxH/YJO6YlkNSTBZhAb7JyM6hJnymRUMEOiSC0DKXsqdlD
         BG/WGuOFBYor8kDhBWOyPq/srLq8py0MvQYmDDOPlnFtgapxY6r5dtHhbkpKhkkqNdVn
         v4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905188; x=1795509988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=;
        b=nbPyOvIWfDSSsAJkNguecsSRhijSVNxy2mMoKh4W02S0ai8wqEAhtgEQgLBFQJKH2D
         QFYdWXvu5mLH8nOGXuqfQ+ykiNo8dDsV7bf16eKnfj0jVdhXrWQ0VDiq22d/LTWPF30M
         EppNrDq7S3yUA8vaFQrQjWXUqmxol2Iccbgv4dElmSDtWrB0DM/t8aQ2EOXVVGZjxktW
         cEuEe01SXZX3z7M1C9duCKkrR4RJlwPU0u+cJNU0mWieecUAW+kb0A2aQ/2IlJp/BU+e
         +qre4t1My6nlVnTepq2ZHy9JI5FFFPyf4EFTokKm73307y4UASjY50aqxf0J51198DI1
         dErg==
X-Forwarded-Encrypted: i=1; AL+hErESaW7RsDf1oQkPzO5DdufHFhazqq7KDuDXsPpHHUBuBOeuKC26EHq+gOxZOX99HCd8P7l7aMzUTtAM@vger.kernel.org
X-Gm-Message-State: APuU4Z+bOrTBDKggPSHkGIk6QxTBvM4b+WUi1JiHkCg9m2d0cVaF/HBc
	M9014TtpKXr4HB6e63k02lcvO53+2sn2vi6qhrIbod8Da/5jaiUQ64IsSFuw+rKVOvGk9VN9A6V
	PvERhJIrTtjvEmyYrxOUS6aNkyw2p3zdSLQKwyPCcZRs6bOWiihTL3xjd3TbwErbk
X-Gm-Gg: AYBFou0QhS89KzGVwpaETzk2GbRfMrim7hFpDdsdVEOp0LpGWoZOxIKlDyOp0dbJy6G
	lWDckBVNMNqfHcyAjOoVS5fnioYDNjyzhwmHqkSzp+avSMXKJCoXYB1k1ruEPSYbLWEx9UNPBc/
	vmuj/gPycI7Ki7cQgfnu3reP9gZlteUvpdcbsTt6YfS/9UnVC8+uAO4fJu8lmjO65AxX+4qsmfU
	tPxJR0RZ07y+seEBKESQRW0J94L2pzAgNmBnT5w2SwAlXxb1gmlO86rnmel5s3qIz6DGpCm6fRH
	l9vRO+XgOM49rkzLpfgqh5lHfY086oZGsdubHAEKud553DmkBrBlLD2bPGM3DU2PbqFKKEZTuLa
	JXfjr1TWMQKYypifPZ17KHXaCd4JSx7M+m9k3EEjT2CgW8wpdnSUlTtNa8ieidEs67Van40JpxH
	lHpg==
X-Received: by 2002:a05:6a20:da11:b0:3f9:a6b6:e16f with SMTP id adf61e73a8af0-3f9a6b6e4eemr8182580637.65.1794905188171;
        Tue, 17 Nov 2026 00:46:28 -0800 (PST)
X-Received: by 2002:a05:6a20:da11:b0:3f9:a6b6:e16f with SMTP id adf61e73a8af0-3f9a6b6e4eemr8182547637.65.1794905187603;
        Tue, 17 Nov 2026 00:46:27 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:27 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:24 +0530
Subject: [PATCH net-next v4 04/10] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
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
Message-Id: <20261117-shikra_ethernet-v4-4-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=1924;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=h8iKXwGfP4z+zw3C5X6I1w9ChDSEwoK8RxfNrBe96t8=;
 b=kQD6/F8/rCLDa03R5m7H9YJ6yMZIibUFFYNTVT4Zn796GNjmnhaMoEYXuxPnHy634R57WVUR/
 DSZdcFderHwDrShBS9akj317sJ08LUX1Z6LInvVrBAUvzLKN23VSJ0p
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXwCkrz7ge+/AK
 sinR/RKA6g11qnjjTStrI9Lvw20Y8AEbhE39ib+HPV9oaQCEtakPtMWvFjXGxzzkZTlUBfuHvTK
 QADgHcAetWaKFgPimEIhGWh7nq4CeyA=
X-Proofpoint-ORIG-GUID: gIqvRt0FbH_qysQQ8lWPobmnVfXi_esj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX4EkjMPyaHIr/
 RUL2vfTThtFb5dZUNzgnxA3tFnFXLthlV6awg4lKRodj7mKFKOufclK2ggYy7YwdRv5vR8XK+O2
 D0dwPLNya0m1Wp2s4XDPWryOMjTSJBg2loWdrB1vdLWauwNX5z5BK2WGvlif7QsZ0bSXKTpsH12
 Wk4cwTFpORVziqBxcmh/YxEqgTmI2TYd7vaL7JGY/TJdwuklBIbM+Y5m6VSvtYXsn71O5Hzs76t
 7EpsS97fSmoASEF+y3fSSqnYQRjXAhX7H7ZASMLuLM7gm893t9YDoIN0YD8ZgOEDUXBhZJyDJe+
 auqCjxEHz34GRsKoyam0gO8SKIBVRCNmWA/yeaw/2k//03v/I7cqP60rmFGjUeE/svi4Rdj5+os
 ycn8POS3nI6WtoKzH8TjYrar5MkCebNBNhq2RcKZPIgXuCg6fexU26gXpWUjsMShclfDbpkQ0ru
 PV6Wi5kBYidUAjr2c3A==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc1465 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Vjzh3eGJV6Wj_RHhdNYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: gIqvRt0FbH_qysQQ8lWPobmnVfXi_esj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d24509a4b4d7..f2428f0467bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -411,9 +411,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -424,11 +423,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -519,8 +513,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1


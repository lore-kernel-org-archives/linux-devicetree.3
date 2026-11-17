Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905242;
	b=15kz+K9tCkC+5dTG/soXHuamZIZV3AeITkYb6CeB2kjL/naWo6uqA7c6y86iDMSDroyd
	 d2daBszxjAXoRmtoHQNGm69uAsJsT4tMU64AYbUkx90gQ9/3VuJeVzxKC6BYnF4Ygy2aG
	 v9BFjDimmVj3w6WfhzariVGSnJeKX7Q0qR75zEdJV199a8PcKD2cjrAjZVQO8/1fmI6sO
	 IjcAyC2CHN/DAL2X0nZxe2iGvoniYEAHPveHLN8iU1roiUluy6Tq0rCSFnVQ8Jdr5eGo1
	 /y8iZwIEUgRl0n2lAIQKqJmdQSazN1jubSqt9iAdhizsfMQGrsCZtolNJhIyRxZXzHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=;
	b=jxsMERSi8JaaMwx+yVCHDiTqZQ8sOemKkyPhPp0eDtlNnTAmIVRK+11n9VHCSQR55p04
	 Q4bHkHSVDtk2iOqve1uU55gFHkZYEY3aDV6QgZ7oI3J4+N9jy6TnuHIrKTn1lm8Nn1wv7
	 MCZhkFsMNhg2L8GVdqREXM6x8k0bXyGe7ctSElFfXs0x2KITWU1KfyIzx54F4ldiUAR9w
	 6+qywBlcJEi6yKhrTOINHLhkER9DwuzTV1lUNxg7v8CzdkkP/+AkiBaA8ScoD+CPVif8M
	 3G8rTeYjM7ltlqKWwG2Ok/LCaeLAVtjOWtfC3J/ZtUrKMg/vIO1rJOqJlbmXqV+g/Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hRTRieTb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5s23NFC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3067606A880
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3067606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hRTRieTb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5s23NFC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6f08N2998606
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=; b=hRTRieTbN2H71Hcz
	NetHHMXDVeqveZSMQpuoRLzIRQRjusqvuhVwBBbO+zLnMbHfITksAejBbs7je2XI
	dZuCmKSe/LoqBnVhuWGXsQbCgPsoYAyEPSWPnhIMCoO2RxmJXu4L9j2gK39iyev5
	dp3R4AdsH2yqBUyQXFnKYLodioXRTx1Uh9fN/VOluLwurG7pdEIP+AR7OrBZwubq
	Oanb57PZPRFT/4Evn5lpykIEL4hpJL9fWCANcXS8Ruq6+BPNTBxo6TCb5Stkjfi3
	gSM5IHUATEQS3gMD4FT1gYSaceAkaPQtq7grWRnZas0pAXqNEcUYIzTfUnPPgD0I
	17bWrA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0g6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:47:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso2566160a12.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905239; x=1795510039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=;
        b=U5s23NFCIeut2AkO2rx8uPXX/f5MZsaXruk9eClPaS/wmjKl8ZWxVAOroioFVqOZ9Y
         A1xMqunj/FUsxtoW6svQPRoMuqQJKUPtLaRmtWvur2kbCHFCCHPl8aZijYxdUOtSm5i4
         9doBDH/FpXh808r62mrWKgPLHtuc/BXzE8RfvtwuOg/YCJdNiw0YJYssQSjUvSPaidqm
         H3n/OEqiE5IfKz++DlxO4Sjil0ZXhhnnA+M/AqjotJ0gKgRs+ugeukEv3s25LzOQIA6H
         ep+y2Vpusqy3wtNx6A/n9JN04s0ni3INI60ttRf0kuCdyt0SqpFdiT6OBYBOg8b2BCqN
         JsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905239; x=1795510039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=;
        b=S0S+J4GTLs14FokOfBD6ZtxmJ00QzCRAcLEX+Jd2AlMbiiuJo7sdZegao5gMedF139
         J+ehZxR0EXGfLGPWiQNxLAF6n0+jxGGxfdB5HPuPlcepRNGtZXy4Vm5QmTGPue54y43u
         4hR5tNDCmK7b3iAS0BXHnqk7eHRsC8bxyalbscHboGVqosLHwLb0ohbBUmMEhIu15eHJ
         1GT6byE8yN1vjyyS/I+kwW0Ud4vySn+DlqppOQVJPqYgfGX2vFm1BM372LB17NdeLghY
         un7UanVT1838g4D+JK2ifISfy7rOiazprh47JMmSpM9tB9Q7/eYMaytJ9UIjkjeeVx28
         35yg==
X-Forwarded-Encrypted: i=1; AL+hErHdID4Kts2+uFbC+vtl96CFDhuqDH7QXM9xaKs2Nmhc+/UuCr4r608U2ZgQ+d1WVx3r7eYYgernDLUa@vger.kernel.org
X-Gm-Message-State: APuU4Z9jZwdAwlp4Uu4FOwqEgvoGAkSwKJ7I8mHNqJErflxl8W2WPieU
	SshYbF83eGK2S62LYcZeZoiNXq6w6qnS2rTwJVUd9PYllxDJFJQ75ihj+U9m+TQgL9w2LtMk9aR
	Pn0cA7NxOCgxFNSRE1Huz8rznc3osS9B2e/JAoBAEL1z6r5ckcp9bDjUmNi6+Z1XG
X-Gm-Gg: AYBFou31YjmwYk5BfOwveja63UogFSbZUsCyorYL1TEm2S2dL8XMKr3ul6rGOAh/+hW
	EK5H8AQyr+4GmED+TDhPs+hwwt0tEeargQz07jO14PFeHiD0/V+NffSS8gLcdRFKS5Ulhj2klK2
	aE4NBF1xoWUu+cUdoN/N/oIYVXb8B0RhPM93uYIa2x9YhqKnF+dR9GEEePkFJTdEcsKL5u6X1JH
	/HSuQGvvCf9EFLQcP5B0YeWn3YaKxiKj+hZ9VBQJm2VB8AEIXQf7LvQU6xWS7HZEmVlcT/goOeO
	IyM1CHulM/xU69Yf8szm1F1lTiougw+U/biXhGaeqoKN3c7wau0LZmQkqb4gfxuQTWNDcxhQf7x
	1MHCh/f4/e18Yf40WRDYx2urTCVnicTlwqQrAxzik5MiJxzrwFd8LFSWYPka7HCNtvQ6XOHkV2c
	G2eg==
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10337455637.26.1794905239348;
        Tue, 17 Nov 2026 00:47:19 -0800 (PST)
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10337427637.26.1794905238817;
        Tue, 17 Nov 2026 00:47:18 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:47:18 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:30 +0530
Subject: [PATCH net-next v4 10/10] net: stmmac: qcom-ethqos: add QCS615
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
Message-Id: <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2190;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=CFQDYIAl3U52nN9LE0obd03q0TxKqjDn7YTLgvYGBHc=;
 b=fAch74fvJse1lz8Pb00vNJqw+5n6bQH0vo490NO3MVqTDE54OpN0lMvZ607uPvmPjMjjngfa3
 gUWhheLbt9RBHNf+sBwp+FG0Ls3EbFzzZkRAIpHhpTy/lUoczip7j14
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX1OIkvx3gD3bo
 B10XMgJSzU5vA96C5qoegsop/isnLjM7JIirMobzRKylgjeiQL/pAI2QKKZxfQo1D1LPGkE/NbG
 ekl4/s8Jcak4tO9MQ9XtR5DeChxIGgw=
X-Proofpoint-GUID: 0vacf1VMhqLReerTN_Yt9xDzXZloCVN_
X-Proofpoint-ORIG-GUID: 0vacf1VMhqLReerTN_Yt9xDzXZloCVN_
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc1498 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hVEubRZtVI2ybN1AIPMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX9zf8C7YQagzF
 Co+PO3+o7QIDjr+H9SSJLmeHEpUBaI6kA3OkmsPwcdZyViGpUSN3AvG9UCPAU+lGFI2fn3FPiaW
 MEV908S4Kyl3QoGjwYWWIZVGm7h3pgbmbO/Q+JyROY5odWdG8kjIENVachpzez7BvTcu0cvLrE+
 Ka6D9rhlwvgHYM3QynHS+V7R+yI/LCIxDX9i9QbPkzBlMmuYAWaI8RhgDIG40hF//Hby9n7Ffzi
 qAIdXurGkynJhbkglViVY5nyn2tBJU2HyGzBVJDYLquUZS2RFytiFTQ6ZPfLLMHsk2km97rPn67
 TDRrBbyJNVLywwDYWMOJJ6V1P2Xx/+DhuP4FtRX5/TvnmN1JQJzaIJGf4ST45Db73UKWdTR9LVc
 toLkM+RAOCspfX1aRZhkuhfsfnpDgVYn8AHqg0YLaX5bndsw2bYEN8bn7yZbKhlt9TbaypGkWh8
 jEYYCQzPi51D85YF/jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

QCS615 (Talos) uses an ETHQOS controller which is extremely similar to
the QCS404 version, but unlike QCS404 its RGMII clock source supports
the 25 MHz and 2.5 MHz rates used at 100M and 10M with PHY-managed
delays.

Add a dedicated qcom,qcs615-ethqos match and descriptor and enable
phy_managed_delays so rgmii-id uses the DLL-bypass configuration.

The bypass sequence has been tested on three QCS615 board designs,
two with a Micrel KSZ9031 PHY and one with a TI DP83867 PHY. The
existing compatible binding and qcom,qcs404-ethqos fallback remain
unchanged.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: this is a new commit which ensures that the phy managed delays only
affect actually tested hardware (Shikra and QCS615).
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a7fdba73da2b..790159ae1be7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -250,6 +250,13 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data qcs615_data = {
+	.rgmii_config_loopback_en = true,
+	.phy_managed_delays = true,
+	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -1116,6 +1123,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,qcs615-ethqos", .data = &qcs615_data},
 	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},

-- 
2.34.1


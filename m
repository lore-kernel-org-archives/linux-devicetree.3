Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905210;
	b=3Hi0Vmn2qQKsv1qy+MiL5LRcixrQTCpyzayFdcg6ybxM1HUZb7zvk4S19Mb3lcGHFGB0
	 Di3NZlU3zXX9/VLheXRWmTD+Ck/5tJRpbmVX7FJ/6nrk4Ll7zIDj+VOa+bq6mA8jltuyb
	 8K2ur7aU0Z4k7sbm3alRPt8EDg3o+FtsfShOU9tzhTrb+N6OE2zagJc4kYXi64BanxfrS
	 J6PcSZ1310hTfbQj1khI8C+nsU6aoWrTJGo8pnVrSrHnpalsfVXOsRfmgyQVVZDxsbF8g
	 MEjf6n/B8H3HUR/DbWh+KJJtPkl1WAnDhuBCc55d1MYuuj3boMWbawpEahX9SU/XAAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=;
	b=x7KxQep7vxmumnm2l83AIi140QlA74wsv9WGEe/S2ig5inTba1JKaHBq4Vz35fTbsU10
	 /u5bDx3lG+eN1rYGNZVSwZYI9l4Jw/eAXlHVr4TnGnzaKc4Iu70vog6l6F+6rgvc2wzBZ
	 m/CjRM4XJudOStUZFMBbOxiuBXxibacFjVlxpX6mGqBj9sXDYFNHZTCc/LrPdyNLOVZMu
	 0OpJz+/KKDvYWNVzdNlyhqe2TwxUEqoGU70z2HKi5hHmQW7t9Gd7Pu3iUCK1mo4SOp2x3
	 VbCn9Le1sXManC2C85cUgCNdQu6X8ce6uFFodoj+4dWut7pM2NnZeAkoMcGmxV/rBBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTeIORmf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="URJIJk/C";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CA460A260C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90CA460A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTeIORmf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URJIJk/C
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH53GgN3458198
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=; b=PTeIORmfxb5eviGY
	z3VBVE5lWYUwUurjpxAvW/aDrAqS+NYE06SX37iEiOvSK9zoJCR1Odxwh7LqcHZF
	B3Dttx1axsU1BPhRXcYNJ4xt3j1ChYFhnzoK6V9yGEJDIYCawZ0HRSPBHjdarVvi
	2kAcCRbNxzg1861zDQ5Q42knEwSoxYAvIOsUVIjAxg843OI0r4v65RVLWofrKIFX
	eQcRgGxEASubP4AuQ63v/EH5adsuFvNx44AIRsCaBDME/nUU0WaKj/uxsizDDkHx
	7MHnlrfFpV9DkBeD1Ft/zymg2eZMZpgfOVPa646ZJTcDIP0boEbghbIfDXHNXh2p
	SqiZmw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8sj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd97f89731so500046a12.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905205; x=1795510005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=;
        b=URJIJk/CTmhVRLQ2uJzFw6FrGers+XgrWZX5KCQsvfTxmh9HjUFhTilXIL8k2Mqw8/
         09pQCXmvgJXq9hShC928b5E8fC4/bQzQ1fVC7t8+Bal+u7dKqaj+1Plf6yaqXGbixPYB
         ZoMDdkQWDDNWcajOn9CkuZRmdBwVYeSL4tHIDRc2fNKWORy1P0RzHI3gMXlWUWLclRN4
         pCMhH4S0SJTxePYgelrP1kSNa59BqjD5Pmrv7NOl3o0EQPyzhFkD7jL13oZKzsrOXbdp
         gU1VcOAV1tpA5ys0H/Ny6XjabxzwKedBCCcpZichGFkMA5unS17zjtMjJkTF4Imc9FWe
         Mpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905205; x=1795510005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=;
        b=iSaodGhpTA956P4rzsEFSHkqSm82WaGmwUdK4dHezTRfJe4qcL0vRg1gpJIBXR9Kns
         3agoqSCIglID1sLuMd0qodv5bvk2WXWtMQ6hk2IXNtWpMsyapZdcxQNb6nmgejeSZ9Kz
         JaRC+MBlKRxUbhft6Fcm70xlc+19n4BX9hoMBD6tmo/qkQkFK6IuXcLkSJoY3iXegY8/
         26wdWxp5dOmK8CdlhCI1l7CCvwNA7NcEt+SVS+fQcHYCDFNNkpaEapRJScvAwzREBSus
         1AOVFKGxVqPnUjo/JZmCksiq+hlzKODG9lPBTvz5RyJIKt4k0TMfBiV4QgQl9MNiAznj
         fPvw==
X-Forwarded-Encrypted: i=1; AL+hErEUTrHcAapUqPyMGrbiw8Vx52USDhQevuIwFy9orVHkuHU9Y3qQk4id7yHNiwD/09sSw2RnTHRKG3i0@vger.kernel.org
X-Gm-Message-State: APuU4Z/AZuiK7qGNiUo91D/u2w8FFb9I8Leb0siPzEOM5TIiTh/jyBnj
	wJTUJFn52bj+/frtSG0HFDe5yqFb0Qm1QQcNjR5u+9uBOrgIAyNWNDpuetgL8Xs7NX8Z3gQ9EPi
	8oDsI5FHaVQaU5sk/je3gW6qDNhP1ET3+JCfHLrhA7iqgo3qTJC7GF8Z+E+OToyTW
X-Gm-Gg: AYBFou1qJU/lKYPHHB1NuXe/HjgtF4Qbwo7qoQxfw/gT36pzRzedrV3/9exsFSv4hwb
	7vgTUy7tg+OAaL3AGDCsE30MVW7eZZsHmf3TgZLcVm6DXJwvRgjZo7to0fya6p6ofE+1uN4cYva
	z/SYJyJoIndb0Ay9+lGDuO5eDehUoDWaIeWE1wzjcc8mfgGWtiBlfwV+OvVPeSwtKrSJJio9ybJ
	KFFZgE264tJ48mCAsGAWjMntdb6dG1Urp2pRYA45qjm9pW1KudK520A+xZmIhsfLuTnSOxXNTEt
	I06n3SybXpwRu3TtdOylBZG9TpoNqvx5Le/6cJdIbbi3w0O0xFox3vk5+TdpytP5sG9UM55tLR8
	69hOnAcUqKCbKJT3c/9JNohxcUK4sfRultfXaKxGiNnuizVPg4q6RSTs2PUuKmqCJGhuLn8YIdD
	ZvSg==
X-Received: by 2002:a05:6a20:9146:b0:3fa:2f3c:b00c with SMTP id adf61e73a8af0-3fd2e2ba1d9mr1539542637.24.1794905205153;
        Tue, 17 Nov 2026 00:46:45 -0800 (PST)
X-Received: by 2002:a05:6a20:9146:b0:3fa:2f3c:b00c with SMTP id adf61e73a8af0-3fd2e2ba1d9mr1539524637.24.1794905204643;
        Tue, 17 Nov 2026 00:46:44 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:44 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:26 +0530
Subject: [PATCH net-next v4 06/10] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
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
Message-Id: <20261117-shikra_ethernet-v4-6-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=1511;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=RpifxHIohWwcF3nhiLIn3gCgfBa+VybjsdQk7Cx2Trk=;
 b=LRDHro7v7JC89pC7fis0z3esT5dgan4Jacy+s0RcqgazDgOabVUBiBt+r1r07PWd7aQcMyYNo
 yu5IWG77AJ9AOFi6+o5QTuBYwU8+Jpd5ORfpMUbcU48Qf7jWKisFg7B
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: BPFdJOl054IOnJgrOmCH6Cxmp3tnJ8PQ
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc1476 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=pwD1iIOGdNV7nma60yEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: BPFdJOl054IOnJgrOmCH6Cxmp3tnJ8PQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX3Wt2PoMDyL+Y
 8IbUsO5b/CFJaqVt2l9fFH3fH5hWaGni0YOIR0S6hXBVyyoeiD7w8u3pAtoM3WAM/eacC6px71g
 6zXQ9bLoUtnkY1qGHwruwzRM96qo4QU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX+ipYVpEV61Ub
 VSjMmPbgYc/dksetRwal7AK7frsELkFndf8B4OweA6bCI2Uuc5eVB7SAfD7c44X7D5jHUaHAZxe
 bAyjsgeFalKabttjmNCWW7kgCaqNRxpwKlhBR+L777ijQOhBMVY2CfK4xtOIYvB1VgTbwPhQ6eK
 oouznEuJVthTCLKKkIq2b5njVRobf5h+/PBDfttQDHi8iTWUEcqkbU5lan8XddLXWrVVxHH9voJ
 9NstxebAsWVj1ksH0g/ubudCHPn3xoCb5FTS54jit2ZZYPtbMt9BNJrIK2lNq55yR+2CSEE3K0d
 DyN2JjoxKFVzqmdveMAlLiKycwU/rZxVa33jJVeJkszyAeuVqh3RNahi9Np3PwgnVSZWjhT0+WL
 WafKDTTyKdnCFwV8O3lW1rWgfr5xIPRV4ZQ7wpWvgQyXTZJiAAS2Td6JhIdurUtWNrsrO24qDeh
 29DvbLy4Y3y5zBKpGvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; set_clk_tx_rate updates the rate once
a link is established.

The DLL locking is not affected by the current clock rate. This has
been confirmed with actual hardware testing as well as the fact that
the existing code performs the DLL lock first before changing the clock
rate when the link speed changes.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: add some details in the commit message to address concerns raised
by Sashiko.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 99ea7e0cfb00..192788e00dfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -828,7 +828,7 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	if (ret)
 		return ret;
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_1000);
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_10);
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 

-- 
2.34.1


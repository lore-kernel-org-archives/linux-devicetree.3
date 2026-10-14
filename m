Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2279D4EC66E
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981440; cv=none; b=dc7e57BYNsZVDOxGS3dl8K2KUzQ76JX+PeumYk+CcUYx8P5mDTeBng33YeD9Jja0df4V/6+RhV1JZ2+5HsdofxMX6pcy0M0VvwiqV2qUZI+qxnZRS9ATtBukzbdI66VrcDRw9WX36uynZxVzAwVtI4MlKM6BX64duyaPBb66LQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981440; c=relaxed/simple;
	bh=J9yeJClaAz5Pqb+CQAyiL1LQKIlwch/5HMt+VwNv+30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zz9ejFzzbnZcqKOuxDsf0JXTmGEpABsa/bNM1hN4nEW0gFIhPdL51LBRE2L61QKwgm1i1pK/BnQC1LSwBIotXVEDg8yWJGfrkGtpCczQi4Db59Pso4G9JmYbDdRmaWyT1XZhkRc+XKsYSToe9GScPeCeKvjLgnWfmWfKJvstZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9h8osMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZTdC10m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9h8osMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZTdC10m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBbMnO2685304
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=; b=X9h8osMaq9D2iy0z
	2PFcQUD4l7Qq6HwRsE6sklUHygN3xTYsLtJv/3QFURff7GmrxJPUqFa3/taifgY7
	cor4ZebDvuqyrYmKTP9av8sjIqANT1vJScz98DPcCpIo2MqH0bXGiURQGyRyPesA
	sQ02BXTdCGyED5WI4uE2KVkDjNPPkb+ytUE7GJD9RYmATyxLNCW1xQ8IrCO2adG/
	ZKTPbV3JXkHLgG2jqz+1p4eKORYqG+rFZHh5yqVhFgfEQyMUOzOJinQ/xAV8ORr/
	1CpcI9HFRGnVIF7zfV72FM0xJ1MpNH2/ok8q4RGSAkhnYdVqcTUjfd468+0oEiqq
	JU9vIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1hxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:37:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so1112255385a.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981437; x=1792586237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=;
        b=GZTdC10mjTDyxKprJfoHDeGb1gmPKY69yGsKnfRtAd0fTEGBEDLBzDCiYrodP8TwND
         eab24X0znjr+/V+sVvcMgHbmDhrGR6usLQaVSMS2WkqHNRjwzVpgKeG+LM1s9QcaGliS
         w7EjUMr8WJDcxGTvPK4cgZjcwpysifBW/yN6okV8xbfq3JTHrm44CA98uUQG9Be1bgtU
         4YXG8JxIGwlmTV6iQlG9GshNjYPNBY4njwwJaZMCydKP1zxlZl54A+uQpSRlAvGBRF6I
         6505FycY7axtAHSjYYeJe/UGxrL1ubyxtZookDYibhjd+ESCZtF6zLlovUsO+Z2KvC5R
         R5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981437; x=1792586237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=;
        b=I74NpH2qmW/MRZHrUuFbpCGm+n6KhX3tzcju3L0i/DEot9dvNB3jhyjhgPSllYPkNv
         e9lsc3vVx32Ps79a3XKT8BS/RuZRWnLAjez+vAOQmjiyME/iusNTwP2eeF/mUFkEgoyh
         PAPweYtte8t5xGUBvk8iiIeaYaVeoo4OCbcSJN/Nrhk/oN30iPa/qbiVsnCyeLCkyKcS
         SXy4QKNTSpCVTGfJf1R5YYIq+O69vxLjx9zucE7Ou5+eU990GuPLis6l4734va0XdeOy
         M+rQ9B/HRa6oYcX5G6HGLWoB10tsvlIqCljE36dSPD90Q27T2T0T02IRzxiE/pqn7Pxg
         te8w==
X-Forwarded-Encrypted: i=1; AKwUvByZe8zbMFcMvQjyP0MLnQpuOu4Lz9xjd4DBhM2lXZToPfR1wmuREfeBOAGAxFZZ/VGFEroJMkPPEvkc@vger.kernel.org
X-Gm-Message-State: AFq9FYIzY6PEOs9DNepazHIfnai7Zbh/HxKaORZlxqNjpUNYcOtynQq8
	0tTO6PROxJPdyATQ6SOC82WTfg5WnAIeXUHc4MMC+YNZREMNBgAgLgPfhcK5FccgLs2WPgIQxxo
	LvrNlkcipGvo2qFNnhoBgIXU4rUUfrsOraF+bFleZwYJiYh6iyyLYK8rvmDEaH4m5
X-Gm-Gg: AYBFou28tp1sz4imUIkUa/UAww41D+wxFfwj/SVYzR5Yg3Y4F8vRMnl5qOqVEn9A4j0
	HPrr6001T//vf3OtxYflSLjnJOb2Cp74EZ3VAQQ0nG5UjFzHKSEQShtpkBXAtFXXo9NKEwAXOUU
	rxuln56Tf/SkABZyTarG+/UJ062m4rN+hSqFmgsGOduShJp78r7BiPqeLmo38x34NceRozmY4lV
	6bQUQNCF1Nf7yAjudzao6P57WMRXAunbK4aDcu1YFW0rbDTadQfVABvzxoz44xKEVRS4l2We3P1
	xJi2vruD7g24NgIQZ1q2GANqLM4pb8n++1X6jfVWTI8xQYGZvVkeVEyDwrLy1WMFj0fxJL4Gi8i
	MqpVghHbnEaED4TruKMB+OnnyAJyp
X-Received: by 2002:a05:620a:4611:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93ebd0c0178mr2571764485a.3.1791981437313;
        Wed, 14 Oct 2026 05:37:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93ebd0c0178mr2571759685a.3.1791981436618;
        Wed, 14 Oct 2026 05:37:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:36:42 +0200
Subject: [PATCH net-next v16 3/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=J9yeJClaAz5Pqb+CQAyiL1LQKIlwch/5HMt+VwNv+30=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3dnI32DHykdHRara4SxS9EMHllBi8RbNpVvb
 4nM9bknjESJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93ZwAKCRAFnS7L/zaE
 w7dVEACYXQEJ83Q/QRV92yGB7cs5znjC4RvZ8Gfcv+TeLoU4qXA+kMEYugpyaPG1/YjlURDT2ZB
 uAFF8SeBV8Ul11R3yaqpMOdy/Hl7TvT/EtEzZ6o4dzkfE58+4KvCKwJGZiv7Kd8yfw6QS5+a/Lm
 JKKUte4f8WA+SI7SpSpXO2blXJ40JKryYVK5Dy9F8cFK69kDBxcOC0goo6+j3BCbH4ZKku0y4Tv
 HeJ3OWXpkVz2VhcBFRQaWC3sDZ5KsN+DSaQfxTNsgnjI87WXvtyR0M7msV6/0tqCSoIDlN1RjOT
 6JuM3kGD9PqzYuwRy7zmFVsVpLou1oeZpiQqHwjBPHYfgb3SHhtRI4bqhqCvmgqoSWuOF87veTz
 Pcs0S5b6MwESHuClnn0DEXVm+/SOqqMcDXz9BHQERa3gYzglJxWogGmTU2ALIMst4s4GqhuoJ9l
 zbE+Y5xRLfDEJPwI3Tv8OJVjNwhUe8PwTqsecOd2XC0cep7xtLfwFnFmlXJ3b/hLDdGxFzkhRv6
 SGcerBJ4NUdI9sNVqm2xZJ0aRfmhaw5oqL7FnYYlHX6NQsHMkiyiBC1Y4LNYg1vQZ40YDfx5Dgo
 gsQgc+L+xsjrtl8c/6ZfmSizWS0cJ3hykju0KOVf1Y0iqcifh1Ug1TdZlU6TK+tol6J7O3QeqRi
 SK++5yF89e03Oxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX+qoLgNx5DJgE
 BqbpOJb732fDVGxweQD0ih3OZuasKFSdU0F3MA6977NMXGVjQtx3GjNUGGW4bxiXyCYUzZ3gJgj
 HoUluKrh4COhka/ecKGzyulrYD/WrVE=
X-Proofpoint-GUID: hoSlEte3a3KW1sLRmzIQ2_oP-_unCf74
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf777e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX1zJIddygk+F3
 Qa1lfpEkvtwaaxs0weeq6hoS3ufGdqeTVxY7eJpLFX0VcJ4ww7oYGj2yGLkmKXCXfCiE2WmTVeu
 NRN+4SuLCEJXPdAJcWyQziyrj3hL6ljmfWOppDutWW6KQOct6aKIKreJHGdzA+/6GKBjsMpNiqF
 K6sssNewRDgJjNedy5wSzOiyEo5L5E1KXmQQ8DaaTCvAk4LyqJmlVUHoV/qk1403eK8OqL0/VWo
 pV7/kSL3x4RI//fLobyHUeUs/0+f/8AuvNBhm8jMDI6pQYgO1NzgGy4/whpNBZpsH+pIIzfJVSG
 FThfPD/5l8Ucj/sIep1o24Vwp73wF4zemHsBG7VhCaX3fDNZ9s8Sjv+FEqwOGXyw2c+RlVB/i5d
 LFEJbMGp2cVh/Ot4kPFnSGGmfpTVMamjK0Ol0/g8ubDwmOMUmewogr5w5a7mPwJqw2bP7PIjbYY
 6/Zb4B7ad9s/GJKZe8g==
X-Proofpoint-ORIG-GUID: hoSlEte3a3KW1sLRmzIQ2_oP-_unCf74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140050

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..e2e611a4d2c06bd567e9d5e353b3a4893623de6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,22 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_SGMII ||
+	    ethqos->phy_mode == PHY_INTERFACE_MODE_2500BASEX) {
+		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+				       ethqos->phy_mode);
+		if (ret)
+			goto err_out;
+	}
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3


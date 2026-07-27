Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B0351C2F
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785118287; cv=none; b=HtGHEw+lhR9Vlrnuo2Nn1SF3L/165KCjelZsFHxKq5QUsOGmJyQ8q2wt60mr8XdxOThAYrESfdF9R3lonnvp+zr7w9NMG+gL4WVzx3fcdcPEzZzqc0Fcl3Pv3EiZld9Xblq3KKVpjhdF1ARvdM2cNrXpzb9lKmgRHT0RGzxonMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785118287; c=relaxed/simple;
	bh=ulcn1ONX1LKOvS48LR+Zlazfgeceskv/+G7RTNzpweE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLukkETfMbF7dHbuQ1+rPcdfX5K+aMVEGp/Kp0PWcd6gATeCj2s3cIdrX3MuQGiomVDiAPvk/pfxVbouWySAdGD4cO5WgJ9SmCX1uC6cj4oA4B+YLe7VNNK8xjz8W0AnrCcyKgapq08r9r6frht3KfuuDooOFkpHcTFsv2/Xx90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5qVb9CS; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5qVb9CS"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381b831d535so2711731a91.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 19:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785118286; x=1785723086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPr6vbLu8PqQb1lWRy/QmQ4lRtcpmb3vtoKOeXxnr9U=;
        b=m5qVb9CSXLqkGb+r586ipZ4RfoX2a6yv1o+y+AcS0hKlGmjTRD5XTKy6GARfB+dsAt
         PoOX8B7re2fc8F3Pw5U/HoLy+LtGvOW1cB9VqSrAlrdXC5f79F0+RmnQlY3KVZcuA+UW
         OABYqTJEWLXMaRJNBkgUCYDO7A51pMRcuW3h7rxJ//6ev7dI3o/TK5VZk+8hTQVMm9gN
         mdQPRvacvw3pNjlSl44GIH6gmQMa5zB2zwQne1K4p+KYyjOKgyI0yjsfn73t4YnfDumK
         E/Kf0iABfkFQa+a9ivfquIeuaTUM6Nh+qoRfMSamzB60giNxePt6xi4aQ2dXYjmY7eUY
         1Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785118286; x=1785723086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dPr6vbLu8PqQb1lWRy/QmQ4lRtcpmb3vtoKOeXxnr9U=;
        b=kQUQNFXRNN4JHaZf5N3oF1B6ZK8FZ1Bn1N5IyQuqUTuQsCvEIiHsXiIx+90oUa6l5Q
         wPYGDvHCHNKIr48yHIYkMxdPYvSdmzdlv1szhUrv0/N/VMVZ7gImrQYiNu/hU6SkybR6
         8T/trd62xDikYUp9iLHgjhinCFYtKTY234jKYPInL7syYjFtcj91OCbVu8P+oo1VXUNj
         LWYNywZ/IeRcRAqsOKpDMwLllHF/MDbaT7zX+nPeTbNyt7GHZ7hhl3/kqzkSzoMi9pC+
         zyhiOIsvRWhofTo0UECwL+LjCywogfWYTBVu7bhplUGhYMoxZqusu0pO9k0D7SJ2LOTk
         mVJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2ILZLbcGm1Xj1s8Rveb8VxRQekKScuw6gGhH1I9uZXTuhvNXJYEs+GyXS9M6E5nUVKjh9HFZVdiuf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2+9WzlCNOnQLzdHULnaZUyDm87swSMxq7MSqLHwlX7h4TDckC
	vfDtmt8M60bhNZlhrytWsmW4/FG/vQEjxszoqu3ewRxx2VG96uhBNUva
X-Gm-Gg: AR+sD11N3EUyvLtJNAaUtvqDy1WY90vOydKBlgAEZ3zzNSWsOwMx8uA6Ev/9jM0sEWG
	W5HnZm0HwyRnWISEL1vN/CuCb2wkkbM8fKW7a8AT2LL7SVhQbadAyLPP+qfc1RlNvtBRVLiIpob
	Jk3K9v3BhFFElwGuW+uprlZO7GAAuBuG8BHH9cO8wXlJ1pkw5wChmZLcAzBSmwrbFqlLsWsvAgR
	zefbyPBZvVF8BW9eRKPt8oU3PWAESfj2ENYrWUzoOF78CepYG+xMmwk/Bocjh70CsaaHlWkDoXG
	4FCHU5RW6tIKTjVvdMXu72i5AibMIImi2YeGTTsz+vFfPA5NZBln/K+24VfwdCL+AiEEnndT17S
	oNxLSXi/r1SndmExTunfC8UG4lZ9rDNxgMXTv6+VXy2XxgyKnfEbCWKqzhi/X8OXHW68rrVzivq
	wSW2E3TiMY8wLYLQtMQo6F24s=
X-Received: by 2002:a17:90b:584f:b0:38e:79f:76c6 with SMTP id 98e67ed59e1d1-38f29641ae1mr5689783a91.24.1785118285724;
        Sun, 26 Jul 2026 19:11:25 -0700 (PDT)
Received: from attina.synaptics-inc.local ([199.33.119.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e53094d65sm19162200c88.13.2026.07.26.19.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 19:11:25 -0700 (PDT)
From: Gavin Gao <attinagaoxu@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	nicolas.frattaroli@collabora.com,
	sebastian.reichel@collabora.com,
	sashal@kernel.org,
	alchark@gmail.com,
	chaoyi.chen@rock-chips.com,
	attinagaoxu@gmail.com,
	amadeus@jmu.edu.cn,
	rmk+kernel@armlinux.org.uk,
	horms@kernel.org,
	alok.a.tiwari@oracle.com,
	david.wu@rock-chips.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 3/3] net: stmmac: dwmac-rk: Enable RGMII 25M refout clock
Date: Mon, 27 Jul 2026 10:10:47 +0800
Message-ID: <20260727021048.3375444-4-attinagaoxu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727021048.3375444-1-attinagaoxu@gmail.com>
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Boards can set clock_in_out = "output" to request a MAC-provided clock,
but dwmac-rk currently does not enable the optional 25 MHz RGMII
reference output clock. The common clock framework may therefore disable
the clock as unused.

Request the optional clk_mac_25m_refout clock in RGMII output mode, set
it to 25 MHz, and keep it enabled while the MAC clocks are enabled.

Signed-off-by: Gavin Gao <attinagaoxu@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 643578266dfc..5e7e5e8f8d62 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -81,6 +81,7 @@ struct rk_priv_data {
 	struct clk_bulk_data *clks;
 	int num_clks;
 	struct clk *clk_phy;
+	struct clk *clk_mac_25m_refout;
 
 	struct reset_control *phy_reset;
 
@@ -1419,6 +1420,24 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 		clk_set_rate(bsp_priv->clk_phy, 50000000);
 	}
 
+	if (!bsp_priv->clock_input && phy_interface_mode_is_rgmii(phy_iface)) {
+		bsp_priv->clk_mac_25m_refout =
+			devm_clk_get_optional(dev, "clk_mac_25m_refout");
+		if (IS_ERR(bsp_priv->clk_mac_25m_refout)) {
+			ret = PTR_ERR(bsp_priv->clk_mac_25m_refout);
+			return dev_err_probe(dev, ret,
+					     "Cannot get 25M refout clock\n");
+		}
+
+		if (bsp_priv->clk_mac_25m_refout) {
+			ret = clk_set_rate(bsp_priv->clk_mac_25m_refout,
+					   25000000);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Cannot set 25M refout clock rate\n");
+		}
+	}
+
 	return 0;
 }
 
@@ -1433,9 +1452,13 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 			if (ret)
 				return ret;
 
+			ret = clk_prepare_enable(bsp_priv->clk_mac_25m_refout);
+			if (ret)
+				goto err_disable_clks;
+
 			ret = clk_prepare_enable(bsp_priv->clk_phy);
 			if (ret)
-				return ret;
+				goto err_disable_25m_refout;
 
 			if (bsp_priv->ops && bsp_priv->ops->set_clock_selection)
 				bsp_priv->ops->set_clock_selection(bsp_priv,
@@ -1454,12 +1477,20 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 			clk_bulk_disable_unprepare(bsp_priv->num_clks,
 						   bsp_priv->clks);
 			clk_disable_unprepare(bsp_priv->clk_phy);
+			clk_disable_unprepare(bsp_priv->clk_mac_25m_refout);
 
 			bsp_priv->clk_enabled = false;
 		}
 	}
 
 	return 0;
+
+err_disable_25m_refout:
+	clk_disable_unprepare(bsp_priv->clk_mac_25m_refout);
+err_disable_clks:
+	clk_bulk_disable_unprepare(bsp_priv->num_clks, bsp_priv->clks);
+
+	return ret;
 }
 
 static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
-- 
2.55.0

Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F083F787F
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629953; cv=none; b=Bt3AtQNKwHrQ2Gw4BcUigLzt5zPvVcP3MAHaM/McSzEbmSN73Hha/QW2o03ZoQV6AvRyrw5Xr/bBc6WihjCZuhUGC61WiaDk6qqAYyx6QCc2wdrffewuewk56o0MF4TLOrmKF6r7lhAh/Z0kVCMhxBsbf5/D3fpzkUIss4Mh5hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629953; c=relaxed/simple;
	bh=XgobmVnmfw+VKO70t7w47aUKtQgvvletM9pYZJJk38s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ul3jOYd5bfn3hhEF0aMIMVGNEQou8Q2271/3gqn7/K08/WVXHpLqXq6jWskvzu4CNVr9xqfT43THmHoay9lBSBvT50X3sKoLVK/EdaP3+idDrqF6FZpbuIexXeF1FxpUkoHDKDKlP7rc0X9rVH7X+sgEmLKDvWp0tVY4ckdJH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso298345f8f.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 03:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629946; x=1792234746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAObO9x1QF4WrfdAIN5+rU7Yr3xIr5PVFD+T0h41GXs=;
        b=sVlT0PvAFVltP3i34npoGhK51BrghvUdGXvaGRXAHCe/reZAIWyp+9YQ75HMQ0FH2X
         kt5im3tQy/HME2Xi2XONb/FTij+ypPnVmu/1EZZZPdpI+lI4g90ISEauw038VugBR9lj
         53fuHFJC/nQ7CyzmNrZXLIprbgFiqkbGDyl4GnDiHydeU5/tp+JPyQxYzJmaZ567eIh8
         T9WaSvs3pjRvHvJT61lV11FLo/PYHVlQN3uTD7Tt35MikGWn1zllMNx6eiWIoguoEPDx
         6TSj4fe9BZd38J6lq4HbP54T8NK54rpcfIRdOrlW0/LzrEYE6lIVgtm5pXw7CIoe7xDj
         7lKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+n5/uaZF5ZZ5sfSkN0KZEdUvXQSOfFeUbVo0npV84QoRifmfeLtjA8wqzavENSgwVfoNARLOfVURU@vger.kernel.org
X-Gm-Message-State: AFq9FYIX44F1pRu9H+vfXIsV+ttbthPLD9mNXrwvvs1zs0AhQDttDZzu
	cFOo+jkxKxaTiYio0pMWCprzQjJVzvkw0VsZV57DKXNJ7rIv869nvOQX
X-Gm-Gg: AYBFou3GqgZc5KtRz4OIN0TTWDsiExs2Umy5Ab2dXbIw7nluZzkEJ/xm3WOZ7TWuJ1I
	q5zMGDVbBq7E//0+OiNojyIKk5WMdR+sZg9iMulkR+bcXSZbRjjazkAqJ1AKNl2/+TexEtU5i9A
	UUKsx77xavHTA+KyYi9ZlSbn7xDqdp0kZQPkOhFAdYcwOHBb/+t8YhDc+2/xjOmiYNoVzXND72g
	kOFo7Gf9Ju7J+2F0TxxC+pgjBnguGH84etW6Fzty7DNRt9/Bq+BuKOvLwUJC9Heslnh6a3tdZqd
	iXhhblIMhWLDoeeZu8jNkOBUh7wdT1/zyj9hrO+3ahsDlReKYtN3i43PoovFPgJUk35HZzitdmM
	3wPHQaw/0R11vI5QUxqTAbPrSIvFCTu4UIlPvtAoviutlRrdEOmE63hV7NtHykwFzLur+yONmda
	yhLHAwQubXS7mn+JXTT5N4iW8aSRzuoeyLtq+93tRP4NMj8SubwBbCICQXnBPsJEz16PtxIAaoN
	Uq0dsNgsbNtfzjdHjr5Nt/C9ZBpuFoTzMo=
X-Received: by 2002:a05:6000:491c:b0:48c:4272:86b2 with SMTP id ffacd0b85a97d-48dba9bdcfemr8482673f8f.11.1791629946574;
        Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Sat, 10 Oct 2026 11:58:55 +0100
Message-ID: <20261010105900.247342-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What it does not share is how the controller reaches memory. That path
runs through a pipeline stage with a gate of its own, and no other
device has any use for that gate. Nothing claims it, so it is switched
off as unused and a transfer that has started can never finish.

Without that gate the controller cannot do DMA at all, so it is
required rather than optional: a clear probe failure beats an
undiagnosable hang later.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e4d5c41294f4..450f7b4b29a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(dwmac->timing_adj_clk))
 		return PTR_ERR(dwmac->timing_adj_clk);
 
+	if (dwmac->data->has_pipeline_clk) {
+		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
+		if (IS_ERR(pipeline_clk))
+			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
@@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
+static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
+	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = true,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{
 		.compatible = "amlogic,meson8b-dwmac",
@@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 		.compatible = "amlogic,meson-g12a-dwmac",
 		.data = &meson_g12a_dwmac_data,
 	},
+	{
+		.compatible = "amlogic,t7-dwmac",
+		.data = &meson_t7_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
-- 
2.56.0


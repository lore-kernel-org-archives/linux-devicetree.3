Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9F441D4C0;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231867; cv=none; b=ql3Um0+5EOqXdMa+WS9jpXitlJVTdORPo4RTU6rCcusCB+MlgDTZRhZyqAbcnhyYxDb8NUopWuxBv8pvPbHXwd/lqI+BetZZg+1ORMFp8JsmCcWpZxc8m4dd9XFu7apNP5CniXJujyUrd77BWYcNMJdh7elZ8FwsZsadAYKuIJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231867; c=relaxed/simple;
	bh=erZkFTXMOMihPG3tf2Kjcg3MRSbkrk4OZSGbmy7Rtk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvO6WfK9lmwQHZssZr/XoWUdymBBHLRaaK8N9v2K30+cVNG+JRb77AR1jyoPbPrWOuqZWkqNPZwerOxBjQhn8JQpBFMQDP0fVVPf/4XsPAX+o2+iBf2xrNufmJk2PeTuAPeNUZIzuXAT4IHgUGX4dGZxRgK/1fwyzuPVb3taI9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GK4sZQWw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GK4sZQWw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9D93C2BCC6;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785231867;
	bh=erZkFTXMOMihPG3tf2Kjcg3MRSbkrk4OZSGbmy7Rtk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GK4sZQWwd6EKlsXaL2KUJVaWL0WXwXyisJn7I+B3cRt5Y3tyuUFvjgaP++A6fxp86
	 KxA8UtbjYVvyP1l5C3iCfSsrs0RWDVEqVFuT9khMC32iYLoQAvJrUj1+5FRzIni6XY
	 7MupKd+Ac7CJaL6girxeENPQLMt3UKMSqIyYaaqy2KPvifDQUH1ckQ31luBk4zVC7F
	 ATy59phXUaiK+ZSQRB20h77sYcrT4dryVrVP2W4BL0xy0X/C9BvZdR0l9W+6rEKel7
	 HI74XZdSHXeCRe3Tlm4oWKR4yj46eYMV3X3MmsEshqW/lmbjIg/KkRA7lHPNkv3ht8
	 4LWtWZ7pDylEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940FEC54F54;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 28 Jul 2026 12:42:48 +0300
Subject: [PATCH 3/3] mailbox: mtk-cmdq: add mt6572 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-6572-gce-v1-3-750bba32689e@protonmail.com>
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
In-Reply-To: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785231864; l=1755;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=wlNt8w4pK42NOY4pipdycMZ5TzX4r9IY7xlPIXoIXu4=;
 b=em8m3keAx8V+DEbFxfHYM9caC9+m2KxyazIAl9NkghlYodMVJLxPtOwvaJrzxthYwgXX8ILn6
 O2oPz0eD9uwAJe10xMRTPsdOBs/VuAToBRcn98foH/+ksODxndUn4dX
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add legacy_isa field forwarding to the cmdq helper and a platform data
for the mt6572 GCE.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index e523c84b4808..5e7bc52baaa1 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -99,6 +99,7 @@ struct gce_plat {
 	bool control_by_sw;
 	bool sw_ddr_en;
 	bool gce_vm;
+	bool legacy_isa;
 	u32 gce_num;
 };
 
@@ -119,6 +120,7 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
 
 	priv->shift_pa = cmdq->pdata->shift;
+	priv->legacy_isa = cmdq->pdata->legacy_isa;
 	priv->mminfra_offset = cmdq->pdata->mminfra_offset;
 }
 EXPORT_SYMBOL(cmdq_get_mbox_priv);
@@ -787,6 +789,14 @@ static const struct dev_pm_ops cmdq_pm_ops = {
 			   cmdq_runtime_resume, NULL)
 };
 
+static const struct gce_plat gce_plat_mt6572 = {
+	.thread_nr = 14,
+	.shift = 0,
+	.control_by_sw = false,
+	.legacy_isa = true,
+	.gce_num = 1
+};
+
 static const struct gce_plat gce_plat_mt6779 = {
 	.thread_nr = 24,
 	.shift = 3,
@@ -848,6 +858,7 @@ static const struct gce_plat gce_plat_mt8196 = {
 };
 
 static const struct of_device_id cmdq_of_ids[] = {
+	{.compatible = "mediatek,mt6572-gce", .data = (void *)&gce_plat_mt6572},
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_mt6779},
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_mt8173},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_mt8183},

-- 
2.54.0



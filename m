Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745F740D564;
	Mon, 27 Jul 2026 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157312; cv=none; b=OAhuSY6Q85s1SwEbHI70MWkD2/k9qyrkU73Nbd0ReAVlFABwCTDtWbdFnL+j0SxVW1D1FFeKixGDhY1p+41zF0FL3BDvV2VKlerunoQovlHDWp0SLWFK6gBLyDDYQq8SWaSieUZxUJFWRu6/ij9uYMEhFz6NbbdFgIf70jUYb6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157312; c=relaxed/simple;
	bh=Fhv4c+ZnGEXAA70jAieaxPRIyQiFKfw6zR3nQNL8mUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MpmaSXlj4jJN9lej+0k/SlknDzhz5lhHP6Mz9rXDaaqRX6yGqHidwXr19PnxyzVkAcikEghiI+YgJFQYaNzc8yobx1eRhtnhA2yU6Ono4mixz2y8SeWU8pcD0QFSVR/MjuJBlWz4Uvj5XugNe0EqkYGXnB36FaQf00X3ANQB2mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=bGdP+aHW; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="bGdP+aHW"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Bu+essrG2ROqqAPzBEqDLFkRuZID1PteLr01IBJ0No=;
	b=bGdP+aHWAxFlTKEoJDSBCwbRjUwkIM/9fKRW9YEjX+7ck6OILBPEp0eN/MxLh2kNq/lwEG
	r/GxHKVb1cy6Ml36rp49mRRF83Ht8WmxOagO1tETy3fdAwmwwpZyICR+arGZaavejXwmde
	P6CVi8wLVlBSEla8ruJXyvfLEnrZgABClmzxFWbPJd+yvHGekHeIu2LzQ86m9L7w/2DKNC
	F7STykgtZDNtpgna9x1G59jTBtCK5pCJZQ4IoB/XefIgoR8QKBLLHboUU7wLMHCvkJjcFk
	DAFJ8afQbajwcAvyHDYQ0YpDhOILPRYW4oVCxQfPrqKCJzjwHEOPIZe+LwEhwQ==
Date: Mon, 27 Jul 2026 15:00:48 +0200
Subject: [PATCH v4 05/11] nvmem: imx-ocotp-ele: Remove device-specific
 reg_read()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-5-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=abU63Qg8wVbJYjhdQvSyPAVVf5ob9YRUOYMGHB17x0Y=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bNVWm2tSud9e2q+evOPKtKBVp9kkD+X4G+RbCaas6
 zXlXiPaUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJG32YwM87UsDv/jTeBcsGaP
 TuSfeavNihvLrh89mjRLKO+00YVLrxgZdnxqf2G2wFqtRLRiw1eTCVu2WkR9ffFt/+dDZxMvbWE
 7zAYA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Remove .reg_read() callback in the device data all devices use the
same implementation.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index dadec19ca252..9d3f94e35508 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -33,7 +33,6 @@ struct ocotp_devtype_data {
 	u32 size;
 	u32 num_entry;
 	u32 flag;
-	nvmem_reg_read_t reg_read;
 	const struct nvmem_keepout *keepout;
 	unsigned int nkeepout;
 	struct ocotp_map_entry entry[];
@@ -158,7 +157,7 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.id = NVMEM_DEVID_AUTO;
 	priv->config.owner = THIS_MODULE;
 	priv->config.size = priv->data->size;
-	priv->config.reg_read = priv->data->reg_read;
+	priv->config.reg_read = imx_ocotp_reg_read;
 	priv->config.word_size = 1;
 	priv->config.stride = 1;
 	priv->config.priv = priv;
@@ -190,7 +189,6 @@ static const struct nvmem_keepout imx93_ocotp_keepout[] = {
 
 static const struct ocotp_devtype_data imx93_ocotp_data = {
 	.reg_off = 0x8000,
-	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
 	.num_entry = 6,
 	.entry = {
@@ -207,7 +205,6 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 
 static const struct ocotp_devtype_data imx94_ocotp_data = {
 	.reg_off = 0x8000,
-	.reg_read = imx_ocotp_reg_read,
 	.size = 3296, /* 103 Banks */
 	.num_entry = 10,
 	.entry = {
@@ -226,7 +223,6 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
 
 static const struct ocotp_devtype_data imx95_ocotp_data = {
 	.reg_off = 0x8000,
-	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
 	.num_entry = 12,
 	.entry = {

-- 
2.55.0


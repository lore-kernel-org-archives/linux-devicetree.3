Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09A8370AE5
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295758; cv=none; b=Mcav+RMS8A0azRtWTXeQLGiQzA8yrEySuCwB7e8hchONsGA7fxipHQT9InffPaudey11KzR6PXKF+2QNB9KHh0ZohYK74D94V8Levq8NpdNQowIvHSNlC+mkwHmDYy3leKy1jvoj2rikostIJp53TjtA6a5eBU4af5LWX2ln3a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295758; c=relaxed/simple;
	bh=IffwwzS6mxt9E+MupQMia2lUc0CzJ/JnFkty4R2zCW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPIogL3wOSn4Z4QfnPxyCRCHToxLZn3kmL8OFjI5sheIjU1VnY3s4ntFa9tHbaip0ylJi800A9BG3knsddIJ4/6cNkWcXBIcDKP9CtX3rUMxqr6F2vS95UEucL0QO+u5YGwyiupD9oechj4EdcR2ZhVx1ofI2xwhYL8396OsHXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfqOhvwa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfqOhvwa"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so56851585e9.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779295754; x=1779900554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiT4GoPWpBPCpjw1giXUMYXIVEB55hR/7Bfzyfrs5eA=;
        b=VfqOhvwaYZ5nbTtqH9+QVNvTMfOCcRSRbtBVcBCStB/h1ef9Rf/7gjbtTQkkWzYhpu
         kbgvzobzgzM7LIC/mRLatc+lsnBqTLsSrsFZ7ShQ9mImOL1wYhvL9Ce5oSxFdR048e5T
         gkvjyJKwy4jvlFXdiT1I52VpuPq2a4x3ANZRgqQlM0qTiIY3YKZEW+lE/hhZhpogOXvU
         EPCXX1UzDhTIToCgwf4/eXkS1Ew0HHmke7uNDrclRAaVaHtavjmxNO4LIbZzhYP70ia+
         mFIkxl0C+ydNBfenUW5g3GAV/Rb9gEBD4L7KsE7NEHdw0zBPWsKE4q73lPeoSkbWh18k
         CMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779295754; x=1779900554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GiT4GoPWpBPCpjw1giXUMYXIVEB55hR/7Bfzyfrs5eA=;
        b=i7m6FG6iMOkdS1z3p5u80U7tHtcxnjnF0YA+SElUVdCQnrLcvFfXzSdqxg6259MEOb
         m2/sgQd6b1iEvaeMukcWpkR8L39y1DCuOelzZ8WXgQR4Xk/aC9UUvWkH9VGDmqCMv3YD
         OZ80LiqLYzOZk33g0+TCcB8QqSZ21vsNgyBbcxxFl+TlN0Vddop1zo+ZfzsRLK4Jxsmo
         XswqOvwhNNtT4dSlDidsLt+zCQZrGCeBiRDlukqPETm90/L+SZyMxe1q/kA6eYi520t9
         EI3LPkMx2mXOjsRL7ben7Md+MIsPqZkAvF4QxytNy8sSwtW85mNTPfUrdI/xmcnhS4UX
         C78A==
X-Forwarded-Encrypted: i=1; AFNElJ89GiThnm+7tVsSYGtOgUjBQoAs6CHjuSOVvFDeFk9FI4uBcWAx/Wk9jDG73lxtq5z5RJcPArbO/CCU@vger.kernel.org
X-Gm-Message-State: AOJu0YzQQgs8w13rMpPNJxwHeziYizXPMaERpjUL6C6sOlBn9XTYe55s
	GF7SZXjGaJuZKo8CCR08Sl1PGvd/LNEUJYMEWBlKbYjw5Gaog6hV7dXW
X-Gm-Gg: Acq92OHelTpcJ2t97+G/Q08429u8ETu0/5uU1mY1ejtZHxJDpq599KPXdLneWg1xoLg
	cRDiw/EZMupk09185qkjTSkJ2wSDot5E/LpwetmiPw8Tn8CTKByqkVu3KciloBDAj8fKn+OVaL4
	K9BjQb6DnXq8J+3A5Z6GWbiTc7EBA6kU1PR4wSb/xicBFv35Xg9ILfhx2aH3CYFb7mY8ZcGfvev
	W/KT/t0qSds7FnMacCv8mcSx7oUeHrJug2rRzdvZSaj1CqdvTpJKVS4bLNsUAaLTsDdyY5b4SB+
	B5YMhMPRshoJACxWNK0lZAGd2lEtkbHW5UofHOB6MkpogYoI3buykr+gkJETW1KZZRcKwrqG9GI
	R5tuj3DjcNGKABiAp+VS5skEGDZewz4uNYMuIbTR9kv4PqWe4mXEw3+qtN/UA02kMSnLqn0ko2N
	ERB2YpoZmJvJKZnCsEfQlnYic3yrCXXQ3U3IivdqEiuX1Dz1mqgochBXKPc+bEbmUtJgXkRm7wq
	dGTKY0D6W7I4iDghSfkK+5ohaxOZJ50Vyla1BRtECuZn0tASQTKw5tJSA==
X-Received: by 2002:a05:600c:4692:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48fe632579dmr384304235e9.20.1779295753642;
        Wed, 20 May 2026 09:49:13 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e71dsm3110285e9.9.2026.05.20.09.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:49:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/4] PCI: rzg3s-host: Prepare System Controller handling for multiple controllers
Date: Wed, 20 May 2026 17:48:22 +0100
Message-ID: <20260520164823.436992-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver to handle multiple PCIe controllers with distinct
System Controller (SYSC) register sets, as required by RZ/V2H(P). The
current design stores a single sysc_info structure per SoC, which is
insufficient for multi-controller configurations.

Introduce controller identifiers and extend struct rzg3s_pcie_soc_data
to hold a sysc_info array indexed per PCIe controller. Add a
controller_id field to struct rzg3s_pcie_host and select the appropriate
System Controller information during probe based on the hardware
instance.

Keep existing single-controller SoCs functionally unchanged while
preparing the driver for RZ/V2H(P) multi-controller support.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change.

v1->v2:
- Renamed RZG3S_PCIE_CHANNEL_ID* to RZG3S_PCIE_CONTROLLER_ID* for clarity.
- Updated commit message.
---
 drivers/pci/controller/pcie-rzg3s-host.c | 48 ++++++++++++++++--------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index a5192e4b58df..edb49af7429a 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -241,6 +241,18 @@ struct rzg3s_pcie_msi {
 	int irq;
 };
 
+/**
+ * enum rzg3s_pcie_controller_id - RZ/G3S PCIe controller IDs
+ * @RZG3S_PCIE_CONTROLLER_ID_0: PCIe controller 0
+ * @RZG3S_PCIE_CONTROLLER_ID_1: PCIe controller 1
+ * @RZG3S_PCIE_CONTROLLER_ID_MAX: Max PCIe controllers
+ */
+enum rzg3s_pcie_controller_id {
+	RZG3S_PCIE_CONTROLLER_ID_0,
+	RZG3S_PCIE_CONTROLLER_ID_1,
+	RZG3S_PCIE_CONTROLLER_ID_MAX,
+};
+
 struct rzg3s_pcie_host;
 
 /**
@@ -253,7 +265,7 @@ struct rzg3s_pcie_host;
  *                power-on
  * @cfg_resets: array with the resets that need to be de-asserted after
  *              configuration
- * @sysc_info: SYSC info
+ * @sysc_info: System Controller info for each controller
  * @num_power_resets: number of power resets
  * @num_cfg_resets: number of configuration resets
  */
@@ -264,7 +276,7 @@ struct rzg3s_pcie_soc_data {
 	int (*config_deinit)(struct rzg3s_pcie_host *host);
 	const char * const *power_resets;
 	const char * const *cfg_resets;
-	struct rzg3s_sysc_info sysc_info;
+	struct rzg3s_sysc_info sysc_info[RZG3S_PCIE_CONTROLLER_ID_MAX];
 	u8 num_power_resets;
 	u8 num_cfg_resets;
 };
@@ -296,6 +308,7 @@ struct rzg3s_pcie_port {
  * @hw_lock: lock for access to the HW resources
  * @intx_irqs: INTx interrupts
  * @max_link_speed: maximum supported link speed
+ * @controller_id: PCIe controller identifier, used for System Controller access
  */
 struct rzg3s_pcie_host {
 	void __iomem *axi;
@@ -311,6 +324,7 @@ struct rzg3s_pcie_host {
 	raw_spinlock_t hw_lock;
 	int intx_irqs[PCI_NUM_INTX];
 	int max_link_speed;
+	enum rzg3s_pcie_controller_id controller_id;
 };
 
 #define rzg3s_msi_to_host(_msi)	container_of(_msi, struct rzg3s_pcie_host, msi)
@@ -1698,7 +1712,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sysc = host->sysc;
-	sysc->info = &host->data->sysc_info;
+	sysc->info = &host->data->sysc_info[host->controller_id];
 
 	host->axi = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->axi))
@@ -1891,10 +1905,12 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
 	.config_deinit = rzg3s_pcie_config_deinit,
 	.init_phy = rzg3s_soc_pcie_init_phy,
 	.sysc_info = {
-		.functions = {
-			[RZG3S_SYSC_FUNC_ID_RST_RSM_B] = {
-				.offset = 0xd74,
-				.mask = BIT(0),
+		[RZG3S_PCIE_CONTROLLER_ID_0] = {
+			.functions = {
+				[RZG3S_SYSC_FUNC_ID_RST_RSM_B] = {
+					.offset = 0xd74,
+					.mask = BIT(0),
+				},
 			},
 		},
 	},
@@ -1909,14 +1925,16 @@ static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
 	.config_post_init = rzg3e_pcie_config_post_init,
 	.config_deinit = rzg3e_pcie_config_deinit,
 	.sysc_info = {
-		.functions = {
-			[RZG3S_SYSC_FUNC_ID_L1_ALLOW] = {
-				.offset = 0x1020,
-				.mask = BIT(0),
-			},
-			[RZG3S_SYSC_FUNC_ID_MODE] = {
-				.offset = 0x1024,
-				.mask = BIT(0),
+		[RZG3S_PCIE_CONTROLLER_ID_0] = {
+			.functions = {
+				[RZG3S_SYSC_FUNC_ID_L1_ALLOW] = {
+					.offset = 0x1020,
+					.mask = BIT(0),
+				},
+				[RZG3S_SYSC_FUNC_ID_MODE] = {
+					.offset = 0x1024,
+					.mask = BIT(0),
+				},
 			},
 		},
 	},
-- 
2.54.0


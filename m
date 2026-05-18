Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A2548AE04
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119627; cv=none; b=eTT1LPDOIQKtn7kyMCHB+wn5TqasBG2crt3lhAy4wedlgRoPDk64HPdhSlSvOp9bqcBlRlL9ry9/T1gO30aXzQ5h2Fh79Y4A79SzSbAqlhqsSc5SAAXRyyf59tgKo/BFF9pSIK1fIzvl30S6b/bVn7lLLBNAGKPdhrRJLAMe2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119627; c=relaxed/simple;
	bh=CxSAlqZ7dba8WGLnxqT4rZJN3bByhcX6cqdFZUyiWjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0oQzBB0J1+2P88Q3kJJQn9L9oSQk/+tE3RzeWzhIDJhQceAnXs1d2u/C6DItgUg2ygQCxBhW0PGFsUIeTK4eAa5uL/n5YIxm6HzE2fyunpL1R7GRpYgBJtcAFAKfRy2/Sauyw0D42Fk016nW9Hvg+N++o5Nm2bu04EbC9s/P7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOCdOr/0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOCdOr/0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ad135063so18375905e9.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779119615; x=1779724415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okCjKKAtcfvdbZqaxqshuzwevShGdM2dj7d3ZLxBJtA=;
        b=nOCdOr/0ehr4jX61giOzQ11IXCLFALd5neVGcRnEPl+2VuBoEXNVaZWI3HOIFPhtH+
         NMKmC3tef1njyjN/WU/5bnfAwI2HhsJHJIGOB9dzF2uWPPrFPTXcKGra66orULHbtQjr
         smKBns1f26oyy+J/TxegvWZotNnHxyMjt1dPtlKQ+tVGUxBDIome3Qf09FvtoPEtfVbX
         30RxV471CCrJDRBD2L0eRFnnzR1DBo0mtYY6a1hdZ+8uFurUeGxCgt+qa/9KS7rrPYQG
         YtU4keKZ30+vcyA3GXGc9IOZRmx1uwMceQ9PIDM0HYeMfZ0i24TgX+wo35jiDigmnlNA
         bM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119615; x=1779724415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=okCjKKAtcfvdbZqaxqshuzwevShGdM2dj7d3ZLxBJtA=;
        b=VvxMdTWfAr+8vwaTU5XtymwzExyGp/85IBsR+WO7ESaiOBLLk0aqez4YYlhv2TTHc7
         CJmzrZW5vpCVJXlKSqHuaeiuiAE4vKGMXbsYys9VaYMjRrDQxloJEgSoLo58t6gCZiap
         8rA5qhD6iTWmPMCBVD5wXOCkW1J2aokMRqrWfvzqge0oUDOnMxjftAgCeQq8ATIIiLZR
         qsztBJwiNQcXRsKcvDKqXu4DJtAKjrtxh4JQpEI8oCJSK39V7+VovU/uOvLrhfqMOHdd
         TN3UStpDKQ3d8y/Fao8k1+E7YjqF4mh0q9qsQv5nEIS2tNF2vkaGcN4wa9hYdmXLNeb/
         43uQ==
X-Forwarded-Encrypted: i=1; AFNElJ94QGuHYwAKeyLImXRmXzZI3D72RdyhpmwdBT3aPzmAbnxCBoADCcS0OE5RGOvxztdyHXHRRqODpPCh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2/uZqFhA82kEySc8Tw77QijP8lmn9870JK+CfZ2yolyiM3Zh0
	KjLsYSx7iNPGrbw10ap1QcsqwctoD30YY3NERRLS/1zwmjuoKWotZDCu
X-Gm-Gg: Acq92OGNSryh3m6oSBIE52n823BFpC9R2XDCy4Uyid4syJtvnxxclByNrSIosAFOzhu
	kzXJOjuld08p4RF7SlE7ihK1I+OueOyH+JsE1tHwpdMleQ4KivUoA4UriPviq8M54dW3vcy2DiL
	5aGATOdUyj9Udw6uMdWcXDv5UbgN0SP36RfFFZ05b712JrvkPSr3J/ljnVPZb+jC3vnqBn3//tM
	ZKua6XAa9s/bIc2+77Lk2aRgIiOltTzm09MEZRrxvXJmQHmZDaWfGV8YIZZeL4F0yk5zd2CF2ll
	u/4pIDRTYS/ExzwwM3d7P3NfXH2e6pfV1qnZaVX1imLA3vVgMjPrILk76gZE1G2Q7YSniuR3ZXe
	87CR2h2R3EMP1TDTYoJBneKo8UW4IIKptqr9DY+eANej+eIQgBFs3IzITcArkod/2BH+i5hUzD6
	ggMkJdeA8mT1dW9pbRjM5T4lGYjeGBP72eELKdUOpBRKUOssvFfMboYfu426iaM/sTbbxcV/z8X
	AVoDZwIwdpvR1dDb8szC8oQiQGIo2TZXXN1iQ==
X-Received: by 2002:a05:600c:5296:b0:48a:65ad:1881 with SMTP id 5b1f17b1804b1-48fe60ed846mr243140075e9.13.1779119614693;
        Mon, 18 May 2026 08:53:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2409:d26f:6d8b:b2cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm450054575e9.1.2026.05.18.08.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:53:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
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
Subject: [PATCH v2 3/4] PCI: rzg3s-host: Prepare System Controller handling for multiple controllers
Date: Mon, 18 May 2026 16:53:23 +0100
Message-ID: <20260518155324.168948-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41453CB2FD
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076666; cv=none; b=L6zo93hGYvPqZ3xFxQ5FvL0Qt/jr3be0MBeC1kFMgI/tKsEZ2Ipn920JA+d5yHiGpyFhvorwzppykTSnI840HnF2ryIe3awwSSjldAZQ2ZIiLQEdtUmmQrRbsk3C5WCtG33WXX+M+1bgxrgKx6V/Rx6Vb959BsrDHZ36vH7MHoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076666; c=relaxed/simple;
	bh=+XcbT4Ma7LbrG3VMjTGW5N37dlNbr2BeNFQ7+Bh8UiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZyK5qQK+QVhU09vmXOBTJZJXft4rpc5G5T6Zm/7gj6Al9NZJEJEA8yXSt5jBKI+27LAzrmh7HZjFhib34F6kFZ6QFgu5XATeM9taMoonRf6Cqjplg2pPvn268Sbq6HmEkhDyyJGFog6x081nCtWWG3wc3uW6WOrDuMCcZlEA8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gfNPbrek; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gfNPbrek"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso4509555ad.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076664; x=1783681464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqdlZomoyNAVRvaeXkG61JOu1jmM++65FkGRpMf9qL4=;
        b=gfNPbrekSlfTCxCGGro3/zS82ql9FyQX34dYjLJObGDM0NRU822Uwt2/dPhtJzmvbi
         zSZwC3JMQY80KJqpP6haDEnl7J06AhuJiUZQqfzzMLHi/PhWt1Rl/uhurOvbSgJEdxn2
         5W4tRGS7OxNURp0AQSuEywOq8yNvMy0ZgJjXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076664; x=1783681464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xqdlZomoyNAVRvaeXkG61JOu1jmM++65FkGRpMf9qL4=;
        b=bpCn2aG12RyBvAkGpBILPWMWOIYKXb5ICYpU5egC0IkFlwnQZ6z0yvgDcEZJ3a17/f
         Q6vo3ErA4Fw0G2KrFZRofioP9OaH/BzqmRvlklqgoFTlFhFZnC7ZLKWjNCAxDUmgSdJu
         JCOZMsyPrEaE2uiaAlBPKG1LIcvYDGuplnL95blAzc2RBI2EIRM8dRscrj6bPrmLEG+d
         2w7wVrxYwFkw/gezi0stEKMs3olrE8aQeM/XO5hHtJXBFQ3swhq1Fpx201QFe9ReNq7u
         BDJj5BZE3uzuOVbCJxibYOjZfV0Zv8Y6H5leWxHGU25V+qlO8uXTR2zQl5JOeqFb/TrI
         6m7w==
X-Forwarded-Encrypted: i=1; AHgh+Rr2M/YtmXZFhHe1MZdSSlJRvOV2+V0WmCNW6cbPgWyYoqXlfm5Tea3pmjoozlA8Fh4vY0bo3cJMu1eH@vger.kernel.org
X-Gm-Message-State: AOJu0YybeEAs/8k/q9Zuy84luUw2nPRUSbz54yURs6V3qEGGlyEqRXni
	6zj8Tzm4pKx7f5yQbDkdR/IZWlS09KYkvbSB3iugzjYbfpxPztLlStnqlaGEwd5Q1g==
X-Gm-Gg: AfdE7clc1Ax7QjZZoNUXSVdagM6p4hTjMRgvhEKL/IMDyIRx4jLIgbKJvXLNEcIpqJ/
	syk4VRBdt8iap5QgZFaQ06FbbRG1MvIkAiXODtqgjeBGm7oHYpgjMW200/o3puKKv0yLCKV6EvM
	Vw+Ll4qq4DMnkdgPEd4ywuuRhVeeNKIVH3TR7HxoZnCxUxHrFM8vv/ZIElcpUUVzNQgowE+0l8r
	h0f6+cQvS0yw00A+hBEtSVDQIA4soFSuc0JqaG1sTPWDaZt0pN77w06PjqUT3vh0ueQD1lS60IY
	1o9FcECCuOd1AapxYyca9CI2zS4I4nylLr/mvYN2c1/YBdvXMxd5DBEHX242OfAE4sx1hhv4EnM
	BZ3Wd5Kb7qSoAf4kCnIQQOlhk6d+VG7izxW4rBRMI/tjHwarkBdfiUbSJ0xPa3+cmorXAW74lmB
	67YX6qK8QDglFDsZcnu+WDw0lxtBUZrYDga3qvsPNfvtleSYY0OYJF9gbGCMo7RLQiwQqbVCBcV
	uRRA/nP
X-Received: by 2002:a17:902:f642:b0:2ca:ecf6:9119 with SMTP id d9443c01a7336-2caecf69930mr5132115ad.5.1783076664127;
        Fri, 03 Jul 2026 04:04:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 11/13] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Fri,  3 Jul 2026 19:03:12 +0800
Message-ID: <20260703110317.1283411-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
UART for BT. Currently the driver only supports PCIe and UART.

Add power sequencing targets for SDIO and USB. To avoid adding a
complicated dependency tree, rename the existing power sequencing units
"pcie" and "uart" to "wifi" and "bt". The existing target names are left
untouched. The new "sdio" and "usb" targets just point to the renamed
"wifi" and "bt" units.

The "unit" names are internal to the power sequencing framework, and
should be confined to a single provider. The names are only
informational. Dependencies are tracked with pointers to other units.

The "target" names are the strings that the consumer uses to acquire a
descriptor with. As these remain the same, existing users will continue
to work.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand commit message
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 16a47f76e7ce..029ae39f6e3d 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -69,46 +69,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
 	NULL
 };
 
-static int pwrseq_pci_m2_e_uart_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
-	.name = "uart-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
+	.name = "bt-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_uart_enable,
-	.disable = pwrseq_pci_m2_e_uart_disable,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
 };
 
-static int pwrseq_pci_m2_e_pcie_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
-	.name = "pcie-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_wifi_unit_data = {
+	.name = "wifi-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_pcie_enable,
-	.disable = pwrseq_pci_m2_e_pcie_disable,
+	.enable = pwrseq_pci_m2_e_wifi_enable,
+	.disable = pwrseq_pci_m2_e_wifi_disable,
 };
 
 static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {
@@ -130,13 +130,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_uart_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
+	.name = "usb",
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+};
+
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
 	.name = "pcie",
-	.unit = &pwrseq_pcie_m2_e_pcie_unit_data,
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
+	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+};
+
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_sdio_target_data = {
+	.name = "sdio",
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
@@ -147,7 +158,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


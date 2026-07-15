Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4BB3DFC99
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105727; cv=none; b=FH65oilGSqrDSQF7aY2PDRbkYYtJz3RyraJAXC/SyPxetQzJ6RBcjXDcaK3zCGEXXvrHa6ttfSmXxMcUIVloICXFQRxOpa1j9jJnYrl3fWOjiyHGQM6tqk9CKzHCMAku3ohdlA5nSn+rwvUvS5Ln15JrNKLHHJYKzeRXcf3gujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105727; c=relaxed/simple;
	bh=S9qazdwnsr1QgW0osAkaYIzoucgKhcC+gdhN23cyZxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asClGFY770yVTnmn9CZM1/81BLfH4nEI9ydDqQTF02aqu2WM4fr+qJgDkZnTsGmvd5LQfJ6VP4MYYyPAj/1sC3hW+BjMp+JvzdkC3X0l8u/6nHAksPRim2edH0qlsMODogkGnmCeT9ZYqhVYvN5M5ZdbOCMBHdavMkFCAwepQaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UJdH6aVp; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UJdH6aVp"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9aea40d799so866601a12.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105719; x=1784710519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R59ctZio0nbgqHRQ4JYecMwYKlS4svhcqsOXKq5o7ro=;
        b=UJdH6aVpvcxq7poyI7pN4WpXDbtvcjl3Gajb+p9bZ6Mf/iN6Sdnr+pTkawsVmtCQHb
         bGJa862wQ9cnUKRTEH0Cinkm2kizRGy/Eddyumaw1Xs56rf+w/u3mdMv9VSJeMGdEfg5
         x4S4qLZHFMDhDY985fB1VxdVAC9CQT4uawi1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105719; x=1784710519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R59ctZio0nbgqHRQ4JYecMwYKlS4svhcqsOXKq5o7ro=;
        b=cyZBeXHBOj/A2QGa2Tge74bTuOs9jUD1LKVdgHExEchfCRdA+TxopYJL6KZlpCgTM4
         RkjJgX+81QHUSJqAmubvyyMiby1FNsT2iz08OzpJ3OS79aEHfviUl6xlZ1XB4+TLvooh
         l47UaU3QeNCO4HgQT7BkRkeAwi2dGNcwuhruGcLWkcXOa9RlCWg47SKL4MhEzT0BxLTC
         QhHt7lf/Q72B/Kz3jWrjyX4KiWZ/MJAK4/JO0Skkjg6xf20VYlJLHyG8tnYX/UkLlhaK
         /37S9tTn6I+OupPKigh0MiqBi6OTi7AsmO4PzdLoSZrnRC5kKM2q5T56+ZgmuyhR3L57
         8BGg==
X-Forwarded-Encrypted: i=1; AHgh+RoHSwcZXY3WBu9HGkIsDQ8pwAfHZxjgZIdjk0Xx0AAjzhFG7PL49vo9WZwmKnFh/VrNjVxafEKOo1u1@vger.kernel.org
X-Gm-Message-State: AOJu0YxwOX5YI6txNgxgQUe92cw02al5tXkB2kfLYOPZqm6+emc416WE
	0Bh213rhdVIH/MalipWEx9n2HiP9NXQOsFe1q3dSiscALn7JMQTmEf9KRa30fpsAPQ==
X-Gm-Gg: AfdE7cmgfmKDOPGoyje4q3lA8kLuX4F2IjvP9hwYmPrTnXW4t+6/IRckCJ3RRzGRJvf
	bfukNxFX8OGPVf0Wq8fzpZAlHdy5m0tnUwG+KYF/g63eYbZsjn2xhOcWj7l6/+SFkmut+BiyzRP
	GGVdqztGCs+PXy+2cSrWJkLQmLaupa3JNxe7iftmGeYuyrhOMjt5+ADmjtZFsgqgbmS92CsUnmi
	N5F7dOVz52S0C0Gg9KhQej/vITsgjGimt/+Iha/1yvwatinj58R5i/9mxP/u1kHaEzdaSE43Ggn
	PK10Rs3GgzBL/Gz5LqWYQdYenL3WUv1dj6GFMzA3q+F5sjo+vKrt0uH6Al2WHIgHHQzPx7XgvPu
	cJazSeRTteZxetvsU84MbhW7n0wLVzwJR8RKlkmgW/Gy9p6rcbjnMeT5xWg8me+Ges7Q7yWB2YG
	xxNqnIHTL2TqQBuCrYq/xcgMpGUjBGXuJlN88/hukEo9iGS7XbzV3oOdpm8e+1lW4eXY1HPQ==
X-Received: by 2002:a05:6a00:ab8a:b0:848:48e7:437b with SMTP id d2e1a72fcca58-8488985bd87mr15890965b3a.69.1784105719486;
        Wed, 15 Jul 2026 01:55:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:19 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v5 13/16] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Wed, 15 Jul 2026 16:53:43 +0800
Message-ID: <20260715085348.3457359-14-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
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
index 691cad0a6dd0..693b0d33f8cf 100644
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
2.55.0.795.g602f6c329a-goog


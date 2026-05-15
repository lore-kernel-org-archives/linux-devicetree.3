Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C7542E010
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835740; cv=none; b=mgmKfkAk82ZHatNJNeO0gi91FPZkcQ1vDQB8gl/2nVSf4KE/9QMpvnT7mn4GlJ0HskRVOtur00Me2w0YQxppIjp1BJNn/XzZDARPcllpoC3M0klGWofybiZyYTDIXbWyG5SifBUUZYUUug9fKEIYCbhBW2AHvujtOT8FMDuiHXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835740; c=relaxed/simple;
	bh=vOEO0AyQPFcIP5Oepet64iLw7BJ4UcNrPP/hNlqxr94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAzuLFqXLASgSsQD4ZByveApWT4lKptrvYZzpZjtJvx3t89r8XShrGcNcjDpoJ1YxiFKXVG1KUGmgGEH9RiZi1rsTkwJqEnFXY3AgjxgR4mZ/TbJBHeBJvIIWIMgQLgrvk3qqBJMq19RrTZ/g/rJYWbz4I8TAxplIATUCJ3ZaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nmGFmDDh; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nmGFmDDh"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-366be8040a9so3807942a91.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835738; x=1779440538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkMXWQOY3SYOq1egH+Z6kUsiL0nTYxohMUH/RmfCF7Q=;
        b=nmGFmDDhYtbSJbIfmkvcEEz6IMBYLHqawySsgWUdsZ60LRJZjfZowRpT7soor+1YpC
         1810YBzjQUC+IFoK8fmC4V3+779tnUjc4ha3iYaG7ZaWhl+X7teLvWx83DnJBKG+YNYQ
         AtZPpE+RLkEiWn9hrpmerbtsRiGy1ebcBHoq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835738; x=1779440538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lkMXWQOY3SYOq1egH+Z6kUsiL0nTYxohMUH/RmfCF7Q=;
        b=PPaGNM4PPqga2xVpSUDOPo67pOf/cF7RX9AqRpmJmgcxp8xMvEqs1MsBidKMk2dF9/
         NFFnBIgP/G/EUun2/xoaNiT+80WytkLYWYMLn6N8eoZPy4ttk7sx73Qe6d+WeLY2n/ar
         tWUraU7Yh7gtxwh8ChxihEtworTSjgCCvq2MsERgfDmb+pSNvNUDiJUkjHPYg50Jbaqb
         uPw9TjLK8ArzDOBUXYvz8XT+yPagkHQZl0DF1d5KscAlnwZcXFaxH6q8T57pTllmnh3g
         rGHx72rmucLHaHdlP+F7uP2UROmaIKwd/DWBv3hODKR0GgL7hAMyDV8SqLhDGBZwBmu7
         OrFg==
X-Forwarded-Encrypted: i=1; AFNElJ+Hgv2USTcqFR1HM/7/fxtQnmU37iFHW14pX8MtmEpcJSY57oayaWlu5EfxQwrsrN1WBKTlecT6u73P@vger.kernel.org
X-Gm-Message-State: AOJu0YxhJkvNrvDKxeqN9gzN3mQXwEbeALRKDJgWCgVFaqIiMI+hobgd
	AXZxyjjgKpdyid+MBPTxwdrV4Q4fewhQhGkQMI89XVLXotdkUiVpY2JgRmy0N+OyWQ==
X-Gm-Gg: Acq92OHS0HSuHdBfReHnqwETM+aSDL8Y3Xh9ULZyOOnrEDcBkIYSA14BFFhqRoclhcJ
	DT/I1pQdONS7TyDwmRaDKGteYnH25xJTyydbTWkVkRGM5GJGN21JTs3U5r3ne/WU4/CX2uLwMNc
	5YkuXo0b7Hq458ckApcx8FN+tHGpBfuUU9N6gvX1FajktZmhAb34QOoI/VPjkRAaVwwQTGubQBj
	wHJG7BmtPaRZcUrynesOaL/wSJnE0safbGmL4M1cNhJfM6Uxu3NiXYIF5J3rGyjBwHLDctIbNtx
	a4XYhBXeIYF0SAvBxh5tKAt2PiK2Q4eNYsntiXASYYJ9YvVsiaJCrNlX53BXzA2e6+tz3Ot0sWi
	nPZg2iFKwaHDS1XaOyP5T61WC8/1OjW0fM0y+qjmX4AVgrXWN+F7x/SOv0LT93zrPHiXrd4L8lW
	1kHHS3dxsufKVQ9K+TKh/3tRc2EaXLFBkJmildeDFIPCA9dDhQZpQywRjDbrwlpKzhkASceeRV4
	ZOcfKhkpEZDp6/KNxY=
X-Received: by 2002:a17:90b:5744:b0:366:159a:c17e with SMTP id 98e67ed59e1d1-369518af9c4mr3451493a91.2.1778835738088;
        Fri, 15 May 2026 02:02:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 03/12] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Fri, 15 May 2026 17:01:39 +0800
Message-ID: <20260515090149.3169406-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index c9aed2c02e81..a5585f000ef1 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -62,46 +62,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
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
@@ -123,13 +123,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
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
 
@@ -140,7 +151,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.54.0.563.g4f69b47b94-goog


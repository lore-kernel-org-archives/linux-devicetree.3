Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4CC4779BB
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545589; cv=none; b=O9Qz+31GY7Xp+XNvFnR4lZnxIzdUbYrp588r566yQzMTlVIsQTe9/FvweW2O2m/pP1W5jRqq0Wf/Ik4LFQxsJ9Q3zDEVOflOG3RAgmYcaibWIXBgAiM5CPX+UDKeMPProTY+NVsguauNO5ococxATeEzh6BTzjQeYL06QmGO1Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545589; c=relaxed/simple;
	bh=KzBRa+RHmHfvRkSmrTiTEZJDRCsgTkmMAnZOypFRNhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3lInX3TlQfhuFPqcpTX+31hDNaNyC4efgSL55y9Va8prm6wq6ZLlOC69aLwFPQKTcTFX09cHiReIiTDHYeLtsNfSu34/eodA45KKgH0HrFc+OB+/+vHt1kJmVLNgWi4BI8MoDVd3VnTsFEUAhepQNYWS6ILOzCElObpYBIeFxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MPGm4er8; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MPGm4er8"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so483696a91.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545566; x=1790150366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=;
        b=MPGm4er8aa5ZKi7sW70lq5LixCUx77tzPTczvaXQhr/j87gnZaw7ymIgxEq0oLQns/
         RmahgFk5Nf2BBfext2RpCNYAAL+Ra/eM0SAjijf/+BsIoGTVktuCbTCNqzBCl0HaPTeb
         5esJFe370PFwfXgtV+j+PsTzrcXkRRtOhZ6So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545566; x=1790150366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=;
        b=T+kpl7xCL3bP+tnDahD99ZUhwKZiXi7ne4AAChewyD+twXpeSwOF+Orim0BGlRIxhJ
         JfgCw3dCqIsorWWoDKC8wEvYHPYMQD3Rehc01Iha7IEXGPsdXZeu1XQWwH67FMhk7ON0
         6q1vmZhNTZBZH8yYshf1W3q3BJ5D8DZNTDgAQXsv/a9hwST0JFcKXk06fHntPkfcMs+0
         qMbf4cx8lxJrB1CWf5s48wZPDku82hHNYzgiTK0AutQLfznFA6OilxUJLvCfcrAnoPRX
         19bNtZbSa1h/zBzladpkdoWrbU+nyb9RxFSHXPNJ9pwMznjiCNFU6hOX5r9M+Q06kTM+
         tdzA==
X-Forwarded-Encrypted: i=1; AKwUvBzcWxHUMWM/trRlyb/a2jRNEqock6jFwqbmt1PM/RmErphpQzGY+vdbnOEu9mZKjIm8qbKalYqIvrDl@vger.kernel.org
X-Gm-Message-State: AFuF++mZl7kApilW2eAkgajisMs9NPO7oosUV3M045N+dhUHVbMR237c
	opxApm8x2FL850UnVaKStJ0mWXpa9PKqQtzBlfiaOtDf5PS03zYnYBzZgUiK4YNiTA==
X-Gm-Gg: AYBFou3BPcMNe6sQk43GflKZosXN1zxZ2V6u4Dg+qo2fq7rDeupsAa3GLf6wrU2PJm6
	NImOwDk5r/bk3grmUt+qDweV3NMoTTyLUkpYkEBKDtNcf7Bh7JyTQKI770/p99zMTiQCprRP/5M
	eARip3ZBy1tgARv1/0PByFU4KZdZDX+NX2taYpx8aeFMV59ZSNNRkamqQlVXIlO3Uy6MFPPkm/V
	XxFk6fwanSzmEbVO9/g11vZ/+az9X3kNwXBu+5JOiOP7wfk8wMxmx+DH487fSZEPxxbHVtSpqfU
	d49LbdhN7rmvWW8BCct1gxUX4b1ypsts6mH9h5HD6kaIc0XGh1BxRnGP4vsoUcDMi8b7ggIPsKF
	4nZ7RdclORUelMBNqkIdK2GDs+Au9qhpWyNPPc4PxSHGcHAacyQb7xQa/C4YjvoHQW4AonIHANG
	1kanbUETwxj08zuFIUEKD9PTXkZ8N2h+t4+6BLhJwtkUfYSRFEKyILWyz5iZ3iPd5FNnNOaFllx
	3uWVD0kYHjVt0yC/PrzgV8st23gBaITQqMjIBJgi9XE+2uaY3t9l5B6xi6NT+f6bez9
X-Received: by 2002:a17:90b:3b91:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39e1e380e12mr4028912a91.11.1789545566189;
        Wed, 16 Sep 2026 00:59:26 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:25 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 12/15] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Wed, 16 Sep 2026 15:57:38 +0800
Message-ID: <20260916075745.3549953-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand commit message
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 350a4c8831f7..499cfd291a39 100644
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
2.55.0.1032.g73a4cd73de-goog


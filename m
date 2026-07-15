Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268F93D902C
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105730; cv=none; b=SDhrPs/T4GyTorgLYtWqmrS1lddBL1YSoMQNy0dE+ObBD8XMsAXdpZF1c4GriWljL1ADBAS94TCWUDlAyXezRYJgD/pqYzkhkSWFzDX979Dw4saDoIM0QcXPhc55PZw5oFXPA7inRdwD+KbQOmsNXEsggDDtA07t6/0WShpNWuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105730; c=relaxed/simple;
	bh=5/IN0+syw1+quFd0dmc3wlZb141a8fcAYXzlkitn7j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s22ADpil7LucSFadFNNDgijWmAyUNdpfMq+5of9ie809g99qsWJ1XSFdAFWVFZXIP8lkCsBJJGiV2e50wSp5mxDQWcT535Rq5+LoDlM/1/uJZ+y5U0ypxEykUP0xZIYe9QQJNfaa195AAZ8gr4Fdg1+yEUWQ8o/n/F6zrzGiaFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=idup/aKM; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="idup/aKM"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848593533cbso2778903b3a.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105724; x=1784710524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4sxxYjabBMDuNPYs/dekkLCAVyFQe7dZPVIfnECI90=;
        b=idup/aKMYmrAJ1Br9sFr+Q9yHCeHXIN8C17e+SZneXQY8JqndzpaAfdJu5lIsVbNgL
         yb9hUBj7fg66XSRjTwK4Q7CuerbGaXIMJUzhQglNB6yAH0msrd8hR+ecdL702cPlQFd+
         9WjDkaQ5ZSuCp/qYwJU1Mn397kqkJvQ3E3w9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105724; x=1784710524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4sxxYjabBMDuNPYs/dekkLCAVyFQe7dZPVIfnECI90=;
        b=nyoFPu2wYEKPSe043I1TVFPQ7Kb9CX/0U42me5N2XlwbSB/amp5SqtDRkv9Afng7Ss
         B34+icoXCIJxqUDw6+ZHg0KyMUT8BfrpWcA/aWcPblHwRYTOCMgy050Tb/F80WyDUE5V
         9EB5n3y1WEr1wKWDE6RQ776m3jx2lvocemhQRQzJhbw2wf4rLhjf/+M2sJa/d6E/dY0I
         5XpC/D7kusJYk4sS3hDQHEIQTbu0RrAgXBtRB4Zs5HK+UFg1/Sf9rNDO1yYrOLQP7h0d
         3U20al5LcguPQyaKWrGIIikNg2wF1sCC2rBylJy8SMgMkY/EDqriJjmN00v4Y2PDnjC/
         MVcg==
X-Forwarded-Encrypted: i=1; AHgh+RpAEHytOsolufF8cTvE49RmqyUxobHTKjquEwqUCyv7wQTF1f8SvQFnxbkLmK06iSqtd4gdLlgOR0/b@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4pcgjX4lDBn8TvoCxPSddDRJoovRRaL7KHaK2lNKke9sfDnD+
	8ldIfIC0f2MM96rlt1sZ6sQ5I+8UoJ6iE5IvMp3Nlh/0Fyyk+uwwygYcGlK0LnLlQA==
X-Gm-Gg: AfdE7cnaNkc9w4HGP6cAY8KlDFJlSXQM33Ir6VyscVHmEUkQz83XkMhYG/gOfgs27vy
	GK0ICbWLLQhx4R0lHDD4LWpqxNAVr51240DL5jTmk+WyHCGq953I5leLNnCm5sO3ocQZWx0awmW
	+YBkTKV7yQcJ03wgyQbP6yJc7SmlHR88OcP0NUTiv46PHougTB9Md5ocliJvd3Xtai/4rcc4nvo
	8cEyA75UxABNetCaIzJ7qvUXXB4D/oMvYWC9IYrp42dEehhFKedlpcylaBb1KehMwQLjhxqKEHV
	DQDED8UbkM7xL0HCwJnbvizMK4inV7fgWn5OlTxz0/JXTrDumMfB2Wl0TOXmZMB4PyDWLSkkZYc
	imoV2po96G8s2ivkThrQkEzRrCD0rT6p9euVnNeFZ5pmdY0Zoy6oPoQdleINfrdwKXnSQXFCHVE
	qTDPu9PIIYxJr0kTR3LoEiCCjr2wj48TxiJX+8wtjbBZo1R8Muon9Or0+lMqc1YdJCzlZ1uN7+h
	bIIpXxH
X-Received: by 2002:a05:6a00:12e6:b0:847:712d:19ac with SMTP id d2e1a72fcca58-84a67242621mr1719045b3a.8.1784105724146;
        Wed, 15 Jul 2026 01:55:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:23 -0700 (PDT)
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
Subject: [PATCH v5 14/16] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Wed, 15 Jul 2026 16:53:44 +0800
Message-ID: <20260715085348.3457359-15-wenst@chromium.org>
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

Some UART / serdev based Bluetooth drivers need to be able to reset the
hardware during initialization or recovery. This is not possible with
the current power sequencing API if a unit is shared between USB and
UART interfaces.

For now, split the Bluetooth unit into two, one for each interface.
This allows either interface to independently toggle the power, with
the last action prevailing, thereby unbreaking the Qualcomm Bluetooth
serdev driver. This is also needed for the Realtek Bluetooth serdev
driver (hci_h5).

Having independent control from either interface unfortunately means
that userspace is able to shut down the controller from sysfs using
the USB port's "disable" setting without the serdev driver knowing
about it. On the USB side, independent control is also desired, as it
allows the USB core to power cycle the port/device during faults, and
for userspace to initiate reset and recovery using the aforementioned
"disable" setting. However when USB is used, a serdev device is not
created, and there is no conflicting usage, which allows the power
sequencing to work even without the split unit.

Suggested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- New patch

This patch is _not_ squashed into the previous to provide clear context
on the change, and the less than perfect nature of it.

I think what we need in this case is some sort of lockout. The serdev
consumer would want "exclusive" access, locking out the USB consumer,
which can tolerate "shared" access.

Something similar would be needed for the WiFi if we ever add support
for SDIO for toggling the state of W_DISABLE#1. At least the SDIO and
PCIe reset signals are separate.
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 693b0d33f8cf..56e4f40e0480 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -83,8 +83,22 @@ static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
-	.name = "bt-enable",
+/*
+ * XXX There are two Bluetooth units to allow either one to be able to power
+ * off and thus reset the controller. In practice only one of the interfaces
+ * is used, so there is no conflict. However userspace could power off the
+ * USB unit by disabling the associated USB port, without the UART unit or
+ * its consumer ever knowing.
+ */
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_uart_unit_data = {
+	.name = "bt-uart-enable",
+	.deps = pwrseq_pcie_m2_unit_deps,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
+};
+
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_usb_unit_data = {
+	.name = "bt-usb-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
 	.enable = pwrseq_pci_m2_e_bt_enable,
 	.disable = pwrseq_pci_m2_e_bt_disable,
@@ -130,13 +144,13 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_uart_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
 	.name = "usb",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_usb_unit_data,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
-- 
2.55.0.795.g602f6c329a-goog


Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9142C40E8F5
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882719; cv=none; b=QMvykJngje7+lly2FwjyqmnmeJDfWGkIGZnQbs4eIOzXOH7J7G+JWqP2eVHl8Xw4oYwqAN8Bgyv0qq+NvV1RBarYtyYkNw2cOjINVtuU1aeJfRjRsxy+ss5Mp+47CJQpDaUpyFyXh+m22I9U8NUt0dOEFjP3mTdkwaMQNlJEU9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882719; c=relaxed/simple;
	bh=2bdpJglUXNu6BBTggJFiuCLLgE+aHPv4Z4H92NilTHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrRb8CPDxWJxUGwHGj0T/piQxJZ0qN413CwbjtDeHrheAP2ZN7BIAU9uObrgMs4xwwSIzH6nVSUltsEQjlYrgyW/9yPhkYiSm8au1f2Ng3b0KIXCWRVmlMqnZlKBgVaQe8DJwnwC0u2UogkMr3TEjCXsAM8lq6cdVfggxP0rYSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fBcHxtBD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fBcHxtBD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e041ea211so163167a91.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882717; x=1785487517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=;
        b=fBcHxtBDYDTinFEZmdfv8EXfL/aqfTCX7skCt+kf1t7650ZuFcp3pbAa5jdtaDy56M
         HPsMQ5C0nwrwRD3c+GPOJ66XhMmxlQrMik+UrHqboVfMNcLiUB9go7f7BqMYPrIAX8w6
         5E2NLpEf/b3fGwjkQ4e9I7qV0JAxn4W1Qn/nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882717; x=1785487517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=;
        b=borsKwq5MeifTO/sUE5b6HsVtJBaBnZf0pLL5ZPCyfLBxTrGXUvdcbUNnn5ay1MSVO
         SGtzKLHhkpL/bZVx/gIkyUvLL873Ap6/ydBSAuvreKW34fpZdVjqTzTAXJU1atGbHi+N
         gkzSaodItssCZCD9UJ066QO5J+fdtX7dxQgPukKFe1WTjmJjloLjSI14//qe4wlL+Cie
         QQAaRcTeZ0mZmK8qTA89pkDFwVFhbZ2NeLFGgJ1Gvn3Nnp7twsWwX/PbLFEIij5ftJ6V
         Vu5QWOGlU43jhahr09DhMpxUvqMzx4Of8FZM7B0u7bo7f7QNSmRobTjZ/3cokyJuLIA1
         KzDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+BjzuPuSkr457BQE8CMk9n3JZxrXUeClDNGA2jyCkTEO6a/pgrbJqAUOZd/JY4RvHpha4AHZQdWdz@vger.kernel.org
X-Gm-Message-State: AOJu0YwNLKmPQtSkDrROW/PdWfrkCA72w3QiqA0JEBgxfmV72LeJCqLl
	6pIaYCe3KAtQyX/DkPOQ69oCIJClp2URLP1o3bTXA8wVayZPpuz94HB4GS2PELWSgA==
X-Gm-Gg: AR+sD10WS/eJHzCQ6d1FBBxM1s/lelwC/GSBd5gBHwdyuipEJf4Xkc375R+M/uUMTSg
	g404ETpfInUsMFo1I7jlWcOWW5nSVgIbBeS8/VmoDQRcRCm6VTiMRoSd/nC9hSt43wHVach/NTC
	dAdPix9wL88mXv2y3Okd+KJxRUImBksrYqZl2R7fsKxrs9Zc+p4UQb0Pk9+xXTc1+xtMx12Cwqp
	02tD7lFBpmRvCwzQxZBDZOSI33T187+1mR+DHTR9juGxDBW/5CTBqb9Tue8Nx1G1vHd2HxSxCIn
	EQitFW8WFXpBosc6chLgA+uInhpaXFeip+kGCAHwswq2dSbZIJc7M2UAP2yYW33BBOBv3fOXOXe
	ySV4fNDJrPOCsskwv/686a1NpkPRVWJBT4uoAnWwYYcKNj+1BxSe4684cOZtTYP1NC6gmPZJG+Z
	Ba64CSA1LwViiUGbC+Ry6Vj44i9I5DF0z5Qkmjd6m4WUaDxpNSL3iBP2YX31s=
X-Received: by 2002:a17:90a:d64c:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-38ec6985236mr6392312a91.18.1784882717037;
        Fri, 24 Jul 2026 01:45:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:15 -0700 (PDT)
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
Subject: [PATCH v7 14/16] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Fri, 24 Jul 2026 16:43:23 +0800
Message-ID: <20260724084328.3943997-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
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
2.55.0.229.g6434b31f56-goog


Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE313F65EB
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511355; cv=none; b=jaH4ycvFxD5RIT6oOXAaZprKTwXEeV+99oJ5qq0etazhLRB0QrRY+0H5DnnKsNEng9PNSmbVRVZgKZ5NV0oG8HeEZgQZFaE3/233qtZxVyFXiQdEuBvzV8GMWd5/x/YdXJTm/7p9YfDxUydbz7QXqQ0YDUQpGWi3YLVYe+tDlvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511355; c=relaxed/simple;
	bh=B7Lu+PyhQKrwbSeiWnA/FCibSLvQ75jT0I67pSzcZQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9dzpKyHUIVX20j+Y5cr+eyu5VU7sc+3WGwR5zqUxpc9urW4ssLHgYLqtGdCUSBfcoPPlKC26MkbrzBC2B3Kx2Cs1R7O4dG04MOHDxh4RiVNezJ70pGaSBhKpyJ1HlWkw6v6GxW3CABb6Lmo+JSYUgh5UYwUD9Crpok9vEIkd5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h+g1pKBE; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h+g1pKBE"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1040731a91.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511352; x=1789116152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=h+g1pKBEmSf20QLY5llg49jgQylsjtbjFvxfP/fbBHy4rESg23r/liAcIo5ecMNYYA
         Z/FSNmOWFnd01kkoitWsqbWItWzuQgyEUEmMNTsvksJdk2SVFDLxWPkXZ+D4kfaIxFtC
         nRNKUdCW0bNipWdS7AzycmJwEy0AxLgkBTVzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511352; x=1789116152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=NZjAwkVlncB+dh4xwipOxhMKSZccqW1FUHdRcsLw1nXHN7DMALTP8lNf8y1JR5n0H8
         ahIL8LyBIp5bHBCjOUC288KvWdgSIFSqgnC4aAqHRrWxbn6Y8ZORVSmd9JC88fft2n8J
         gXwag8cZQmkia2p/L/mD1LDbTuOwWkW5xaWbwEn09E2iC4oD01TfMPPJiRD+jr0uUpaD
         5NmbMwLuixMojiPkHB5cSKB+J6QAzT7gBpyKeQkG0NaCcRM69ULp8WiPuK7M9L6MJE61
         e4CCHq0kFNvpHpFDjTgx094rjpa0ik0Rg9BsnyqdB5arUnPEuBMxeY0oo03Ylazt0mt+
         Hr3A==
X-Forwarded-Encrypted: i=1; AKwUvBwsjKhSFKJLPdwwEJlvfT9OmuB2oMntq5BxI2t0zcxdNyYkdku88B6VXfIR0T3hdsPwToUdkLyi6050@vger.kernel.org
X-Gm-Message-State: AFuF++nuq8zTNijrb+8rWa0l+SPyJkp32kVL2GlnpHu46DO2LZjOk3/A
	40hfqo8WmBcsupcYqNmGiaQztm06SrYzZVTr2QoJqBkuBKyi8M6n5Bp91RQkO84Gsg==
X-Gm-Gg: AYBFou1cEZeZwlNWBOytVGoaKWx/OawFfJPYV9nd1GcV6NBx6mm9YdzjUkl+Jayg5EV
	449JOlZHBmzN9VBCH513+Xv1Amrn5+xUtL3jgDInwYEyragjHTyh2g5JFnzlP5YIG3qqLhvfwKx
	pUCa/tkH6GGhlc+m5oN/vOIZrJMMgBrP2vQ2AZ8qn9o54leOeY/hsfejHwfcT0jIo0+AZ/M6Bge
	CJy8aIsdtkfSMuJGZO5i6eAvJIIeGnMEV8LKrW2KoEAD/n4WRvKh8QtOusaNIpy7uzaSkRXJaLN
	Vc+W444jf+6OSeCABQp/7DJdQ8TvedkxrubCMHqLmoyCNycTSxBnpzU0qUhQqSa1yFa59eqP0YM
	p+uemaK60hLA8LyPoQnS8QaBsOrILj9l7wX7J1Bl9mSmI5Mv1Af442zY8Ba4QVdT1/RQjfwDFnO
	QGMLt7vo8S623CaegAQmd4eMMJVv1wzgx0zwiBBeapyhSVUwkWhLf9kEB2uM2UslPsRlfpRPuCR
	w6zZFlwEJZC2lAKGKC83MXlXelTmoV4bvgJxKM2XG9S
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr7387796a91.18.1788511351714;
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Fri,  4 Sep 2026 16:41:43 +0800
Message-ID: <20260904084158.1341550-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Attributing suggestion to Andy, since the change was originally
requested as part of a review.

Changes since v4:
- New patch (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
---
 drivers/usb/core/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..16e03ec8d1ab 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -899,10 +900,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
-- 
2.55.0.979.g7e5102b832-goog


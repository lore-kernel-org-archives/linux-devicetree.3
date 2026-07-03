Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C423C345C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076650; cv=none; b=suEhbqR6KqoGADfzbd7Yg7G+GL44c/TA2GemngMMN8N9dwICfmjLQsssMN679ZucSzcOmv5fAR7Ggf1/4SBYEE9bY3OS3fSiatlFcsBisYd2XeZGKi25ekPK4JLnSCLdwHuov4DW8RJGxLIfys+KqWvv/GKW+bDrpA3COiX2WWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076650; c=relaxed/simple;
	bh=kfKxqCT0AnFtztM5LFloMbjAp374Nxm9lZYgvpDSr08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKTi23sAEiPQINihUkNPqSXk2RrVH09eEflYPKyPGvCmNoAjP/vt6wSqrPK9LVpayv1zPIdZlQUN9BQRtuunW5UywOSnELYUEfDRVuBqYjfxPHlObS9tAZ/5DpeyURknF0VUBLkf+smVmRShWd+OHdnLpT8qUYB8125De9xFx4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O+y53hif; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O+y53hif"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caced6038eso5208905ad.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076647; x=1783681447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWC74RHfH35yZoE+4T5JHX8GhXugEkV5aHendXMIUrQ=;
        b=O+y53hifkvRjzCdB1Ewt4af9ZOm9SggDwvEJcCMPVVHKv1yp8Gbw+cRAFQico/sdvB
         hNaBm97fEzqrTz3tgnzTaz88hYMd3i0/OXT6/quW1A71tbzXOy7TiyxZx934zPiQhWHA
         mGEHwld6RTwBIzuxi4JDKIsosRAdGgEZg21LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076647; x=1783681447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWC74RHfH35yZoE+4T5JHX8GhXugEkV5aHendXMIUrQ=;
        b=m4VnkcA6ibvb8IMaNbT2HdYsnGneXoyQWQuMtjTSA48fkweh7EWBET3MFoPIDlPQAG
         3a+Dqmnvf4LYJVMrWWWUioWl/PslLfTVxuJEW1357sBzAWGfaFT9y8LJxbPbntvzcYxu
         /luti7QeivmENvZ39fbaO1JuhWevPEV93s0vct/Rp0a6dW9LbnZJIjRpUseFgTbOCvrZ
         lb5yiMKB6YKEC8lHKzCOUa0wHHVttELZK9L61zGy8SN5zbVQ57VbpJPXDKDYAAbj6+it
         Ru58g5ISP4Y17C5f/lDpNkY32Ok6L58RnrFNgOc1Tq/YTG9OcDTzNMqI8Wi9bA3HWoFf
         iWBw==
X-Forwarded-Encrypted: i=1; AHgh+RrhPJSX5t6/g3RwU1K0dbcFF6H25M6VwEZa2cYaePJj8eChJB6jwLWS6u5w2bZ3MwzOtEIWRVg/OwjE@vger.kernel.org
X-Gm-Message-State: AOJu0YwRC9yTDgwKayKM7ZdXMZ7xc1hV76o0V9/VbnpsBxYiFhXqH/Qo
	A5uylmG0PtixME+t8p7ym2msIJ3wLYhZYpOWASC05L0PGKMTFGsQ5twZFITCDXoJtA==
X-Gm-Gg: AfdE7ckr3FNFhK8vBfCIvYd7gGCy6YBFMDiVT1VLa2qXwImvWJ34ooFwCnuwpPVqE/6
	tN8ywrviKUjYGvtUBBr///fbriZTONtLQs2cQ9jTbyb+GbrK7HideY34XVxh1JmPOeh2gOTQJk8
	GT7W3bZ63PpiCmM431gsxyrbvVtkYm8LAqQy3AYSU+oSdKGUtEXozL9kTO4bjMWLXH2tYsHybl0
	bvt41VIr/STEwSq5wLRw54EH5BaACIOczkKl4rBsHXQaHpykQJy++LkVovtRTN23jok7Xt5G9vC
	C/7rgA3QaiLr7QaAPcFKJxRedojfifFt4zJLXHtZdxinnnD2PUMxPzPxr/kk+Ca7QUoKJF2hESa
	dDq/8F+D5AAFQTQl7ypm3wn9lMHIyRHgqX1n4P/+Uun/aU47Ge3tSI+zzVDjMcTdfIcZUWViRak
	s48R5+1f8It2hkdhEIWM1tSz8wXqSnC6fbQngTFcudeYUbMDEgFriZuyAKuDReKmm63LsRNA==
X-Received: by 2002:a17:903:3b88:b0:2c9:d27b:af11 with SMTP id d9443c01a7336-2cacacc3ccamr39740205ad.11.1783076647262;
        Fri, 03 Jul 2026 04:04:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:06 -0700 (PDT)
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
Subject: [PATCH v3 07/13] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Fri,  3 Jul 2026 19:03:08 +0800
Message-ID: <20260703110317.1283411-8-wenst@chromium.org>
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

There are still some instances in the USB hub driver where port power is
directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.

Switch these instances over to usb_hub_set_port_power() so that only one
unified function to do this exists. This makes adding external power
control with the power sequencing API easier and consistently applied.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index da0a4cc8e15a..8ae97e8c26aa 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -975,11 +975,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
 		dev_dbg(hub->intfdev, "trying to enable port power on "
 				"non-switchable hub\n");
 	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++)
-		if (test_bit(port1, hub->power_bits))
-			set_port_feature(hub->hdev, port1, USB_PORT_FEAT_POWER);
-		else
-			usb_clear_port_feature(hub->hdev, port1,
-						USB_PORT_FEAT_POWER);
+		usb_hub_set_port_power(hub->hdev, hub, port1,
+				       test_bit(port1, hub->power_bits));
 	if (do_delay)
 		msleep(hub_power_on_good_delay(hub));
 }
@@ -5452,7 +5449,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.rc0.799.gd6f94ed593-goog


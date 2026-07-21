Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0687B42A793
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616920; cv=none; b=T5LVR6dIemvTHTty3DrJgcSm05y0Y5TisqV8ZjDIXY/Zt0KDy+qRR12EMxH2Tn3CUlpxx7tiwWjY5xM1W6zBmiU2X4pC3I/Fa82BXSIahy4DtAoRyNBF8xZDjzT7JvFW3aw17yXFc8T7G8otu+DgC1iSJ1yMpg4uf5BqWNAeu7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616920; c=relaxed/simple;
	bh=DyEec2Z7+FSSh+lvskH9h+/zSvQpOnJC1n/aL86DbdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8VUz2xY0HfIGPv62CIwN0IJrhRobBMs7Wo9JBR3kA/2i4SLX5Im9ce/FdHX31bdLAHDJXWXUcaaCvRymMb6l6wRImZV68ABsQpii7mUMCHd5DS2A5ZiI7Y+Sp4TMKYaTwX+UGdPStymbqCMLVAgWY1OC35djd1/yvrJI7KKa4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kr70JVPy; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kr70JVPy"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cad8076b01so131935415ad.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616918; x=1785221718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=Kr70JVPyDvE4ZOMszTxjcVJZp2HTNwUDsDpuPnUHjPcmunxwvoTzW49334Pv99zn8i
         rjuIX5eODThjRRmnpbyXCZSnpiBrBL7ZX5oB2Wa8bbRVo9xyD4IPleUwA5U8L0EzGAcb
         eA5nHpKqcuOilQyZX9MWvmPxkjSeV/m3wkYRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616918; x=1785221718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=fhBPfnjmvgsaxCTH02yTEDJ4147LLjsloopFILqH00T9iRbdZXFwyJLTDRNkstdfK3
         zOfo0r+YrUOaHaCMR7J9YsviE5qsh+MisTY+MIz9g/lRkDyuakz4cUcA9BydAjTdR5qN
         ps57D31JhBjVh8aEI0PgC6rzYbWoqyULFN7fi3BlB27uS3ByvULCJmqxZi30ZEdNdFkY
         GLo49finQx8rLK64vmbHXWbB1dht029y/FhykFx9/x0kmqB8r7Wwj2DgzZbglb5yCPI4
         bSvbP0efXC+miehdN11VsY/t8yXTgukQw0S7jjsW4pwG065feFZtW0mfl+aWrOzaNQPF
         Xx8A==
X-Forwarded-Encrypted: i=1; AHgh+RqUWK3hJK3/dTMJtJLayOUcANSmvdeTwI37PWfVw//6aM2kwdt737xIyeplTfaL/kSyi8kfnJOguB9X@vger.kernel.org
X-Gm-Message-State: AOJu0YzLuWontVBbavYLc8bOOTf8RvySezF8T62QKlFRlfUGP7SlNd6+
	awkqhUQ/YoJXRal7QrrYP2H7LUGJAoQWXyMWDyr+xSWwdufn5YKR06FYdckZ6jDRZw==
X-Gm-Gg: AR+sD13xiZmXcO+p3omdfaK/md1kwvASm38yagJiYwTxH0MLTaOT3BnDAI8rb0eg/BR
	cegjq5bkapcOForQFUsz3iJAyrlFrFmPamdWgO1UeNc9GaTa6mP3p8jZ8GyH6BkMYPvjBjsDaH2
	W1BJwbGZHxjfa91Zve32GC6PaAyfm7zyNeaFk+Ik745uYBCVxnBhlk02jC01Crm0LfdluiZKY1Q
	hA/oOthkrL87l3KsI5SrFd7O1bJahoqDby85r0p+apCWBI81MTrn4UP5DwFgRz1lH6AQx2W0x2U
	7kPWnRm3beLO57RjxJ3LsUMDAf7tciQ5fylagBaCBnRxMg3Hq+axZ/uej38xgtpm3taPg8YqxH1
	R9WP3LB7INuC59Vl1Chd418OEm258Sl9fLX/XHX2uOUzU8v7DQ9MErkpIRvgaqCYwhsvI3sJKG6
	BiRYZ1tRc741rAm/ofEtHir3rFl8w0mMNHGUeRL+IP2LBZg5Ut0M+NrOcbotT9ghZvy0yb+Q==
X-Received: by 2002:a17:902:f64d:b0:2cc:df15:91de with SMTP id d9443c01a7336-2cf349d30b8mr204344825ad.42.1784616918417;
        Mon, 20 Jul 2026 23:55:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:18 -0700 (PDT)
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Tue, 21 Jul 2026 14:54:04 +0800
Message-ID: <20260721065413.2306137-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 6671b5e45191..a5c5038e1604 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -976,11 +976,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5437,7 +5434,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.229.g6434b31f56-goog


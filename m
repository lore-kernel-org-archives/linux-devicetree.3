Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80223C3458
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076642; cv=none; b=Ht1ZtNqS2Kudb9sHlsxit0FXKiym/HIUCh5cfqUGtFiaLMVD/PEeFn4kwokjN+5PzqMIZYAiD07ybLwQU98ycr/Ilanh9TMIW0y3IfELSBGUZ/xU02dTpTWuISJrrxSK8SlvN05rpoIXrGcU7bAu1bPLa59fmaaxPCRfUV8mpEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076642; c=relaxed/simple;
	bh=KSKcoZhcUNUQt6mbvtajVqwGl+bjGPliu89rdk9IcV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShorBHFf5KrmofX4iNEDMsPFuNcJN19tpfUGl+U2kqjl/C6RC7cK4DohefP50DhcoXY+7oJMv0+agiPrGaUtzdb7SAjxLLOOXo9A8Df3kDi5rNpWowom6MXPzMTTdl32gKIbluk7JcMqG5WUCHJuF9NJ7fnKzkzZqBKgN/wcc/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KvtWtgZf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KvtWtgZf"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cac59f8b64so4385675ad.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076635; x=1783681435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXNEvMizuglXOCjkp4mAG2muXyzVgQAtby1OdmgJjvw=;
        b=KvtWtgZflkdFyH3Vz8ZXtWc4++GF8XRZ7Rpap/TYpW8PpQ/edQUeloSAQycBcHxSj8
         /oe4VgHNNuW6Hl1Vjv+B5Avl5+S4Qkla1OfkXp/Qe4REkztQ1qg2BmFelb4KEtpzZQTs
         ey9qzpu2t6VX7COz3OHdjyEplNfgjhMIKkhVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076635; x=1783681435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yXNEvMizuglXOCjkp4mAG2muXyzVgQAtby1OdmgJjvw=;
        b=W9BNL5wwI+iqSzeNcA+whQqSzuegCMM0ukmR9jUhe6oiAgcHFV/AHYUSCIwPoV3TMv
         daM0oV7Wp9J37PS2TwAqeb0QVszHJiuo0r+y0KAbU1NSvanYLMnTAYCUQlsZ4A5g6FC7
         je6aLwNLjvzKYXZdRHX/B/5IOiszgca93yhzH2cFlA/QOA7XzneW6yYzvNj052Mo1ul/
         ddCAia3WVV7kYXzj/+K3rdX8EBLoi2wHT0wKEGUL6N91l5jk59KQKdmQz9rJdGFJCUIO
         NVsfELD4mhI/ILfA/9DilhyaKpgWe2m0ssmLeYuvbPISC/Tp2oSJ2RSXSfnRJX3KP5+p
         hCZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoczlATrep9oFt7Ri8iLa5L83PaScPmuDwYOI0snYL6kmECM9bIjEy+w2RnbSwN69VI9CPEbb8F05+Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2a3/pGBWxGlQ2xETzz9h0caar8nt6an//41SjUPWDBjnAzwgY
	Rb3pDJOwj2WZg4oTncDyD5NMsIIfYYjksCYOCbdnLKbZ5mxHwuLpR9CNQtLoMSHhpw==
X-Gm-Gg: AfdE7cmLpwxsL97LrxCv5u4j+IwI/NE1rzsRsi6CIdIuVzz2f/UywGR2XCIsWkBdjOi
	pMELimXPxuFRAWQ1vwWG3/s0cqkBsAQud9LSZAfy1YnuGWsUfNCmcxQFBINurrTHj6V6j3GnyPa
	ZsCdZrsaLG5M/kmlz66thFN2Eduq5KWvz4L5uK1JA90gAftInsKBGcWnwpNDHFuJCSaNi0lut7x
	2l9iLFKVitC7cx0cHDGu2dje7OJN2wOmhBafzN+5Nqzi8QroYz+D/vFuu1K6fTNi/bd87fvTALj
	dPZNuVI8JsR/0Y+L8TklDN4CJ9cHWKmgbIrCGFjd3VfhbXThihPCOWFKHxMan1rvImceyta3CYJ
	PdGb3MWGTCFq4tj+zKYX/Qpi7I4pXdc5rJeom9Bm23ctQHXEBUlGForaowQS9YBTDHnfFzX0anJ
	TzJ+wvoeeJAUPMsc8gMh4zNnjoI0S9xykx0F1Hqp98g4WuZEgndeSW/LO/uDkXaCko8G/oXA==
X-Received: by 2002:a17:902:ce0e:b0:2c9:b01a:fbd4 with SMTP id d9443c01a7336-2ca7e6c4036mr107709695ad.16.1783076635124;
        Fri, 03 Jul 2026 04:03:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:54 -0700 (PDT)
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
Subject: [PATCH v3 04/13] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri,  3 Jul 2026 19:03:05 +0800
Message-ID: <20260703110317.1283411-5-wenst@chromium.org>
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

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Also rewrite this section into the standard error handling pattern:

    if (error) {
        # handle error
        return error;
    }

    # do more work
    return 0;

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Rewrite into standard error handling pattern

Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 13264e86bc6d..fe10d72ef39d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1874,6 +1874,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2005,14 +2006,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
-
-		return 0;
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret < 0) {
+		hub_disconnect(intf);
+		return ret;
 	}
 
-	hub_disconnect(intf);
-	return -ENODEV;
+	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
+
+	return 0;
 }
 
 static int
-- 
2.55.0.rc0.799.gd6f94ed593-goog


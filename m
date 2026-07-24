Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D4F3E49E6
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882671; cv=none; b=rPhHPOSNi2ho/400OYo8P0kc60gkDrYhzQ6kJGsZtW3D8lgjEdPL6sy20jwuVbllW0QnfH2xe4BUO+IoeaLIpbWmCo2qOx8rSxlLnWSThNIcyxyQVWQrg/OcFwrr2xowCINFkT/wu947hx6M0Qo6v+CST+McKvbekNCvvj5Ic9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882671; c=relaxed/simple;
	bh=a0af6mRfXl6o/3aQ3C/YjqVxExTXT9xiwTDCu1uF7Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeT9jdEq/9lSlO3QW62qLQtw0XJN0bAb5qW0rWZH+7LUupU9EMsF+HZ4a3zByOqjeDY45EG615fOmlpKzdwJPscrhfZNWprSJQPPtM8Lo7i8sX/6Ml4zGLHE1s69xKZCiRIHgABcjX7YqRo8FBvssRzBOSZvnaefhPY09cq7HyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fTOr5JG5; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fTOr5JG5"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so94505a91.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882669; x=1785487469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=fTOr5JG5MIirJf39aUCrW8evnhhd07B9xb4kaUT+iDmksZKkPaCIEP/4MVOvrqyJmd
         8U2tALDlNUYd5j6i8aRsyaNQdyPPDIjsxbuIxMF5m9VSrIc6havZye2eM5XDS0flqt+K
         Hix/kclbTreR+HXWmW8haNTiIxW5gssdg5BjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882669; x=1785487469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=qE7Z4UBNs5IHGN/tazSbSm7Wcj9YlrtRpjAxRSSUNhAUvnGFAaCRzguvlhKlneErvl
         o7uMSEJ70ni9MSIS1OXLask7krAP/q59sHpv3VZPcOK5zyIArqoihtiNUxfeAHLix3Ui
         pZMEVMzNPGox5p9nnBj4WFfGXwZHHuOjrkdZy6HA3wBykXJz/q813yv0gFgl1aW6qtKC
         GyfBQd/j9r76kjDERRU7M5cvj8BGnGG7j5kPCsOWihEPDUYkO+FZtZTIlVKSGZMyj0iT
         i2mBnxeD5zdwbP3nPABy5AkfH76BZVZUT6Kp/ma2U4xZuqwGTTGjtUrcQrQmr7fxWzF2
         g4vQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZPLCXqvI30Pdot7aRfSTvHudzCXxAl5Y33un0pP+x8857cQ0CmZOb2Ww5ijQIpdnJ/s8eA5+WXsBR@vger.kernel.org
X-Gm-Message-State: AOJu0YzzHamB7WCmJ+vJbRHQrtOMXt2lH6xAr/4bSaWW07AAzYA9m2IF
	Bw9bae69hF+X5uasPw/RzccN8nEjVe4rXePr/ru7IvZyho2JRcg3Pt0dyZQuGV0BoA==
X-Gm-Gg: AR+sD138nPa/93k5TIKiVjlbohjpbMwC+H9gVlA+AffuNr3+UygFlYJUd7iBHcCUsse
	PUZ+27lyamHPbS3PC5nq1jU1BSlkZxKY/6BNN23kfTJCCGIbYBoHPK+zuNTiPuGW9ihnXR7633E
	ukBXWgUz/fJbRag9qXUZnoKciRB18IRRU+08rhQ8KBoLwE2iqLeFkvwP/OsRd1g+dQP2oFOQrrY
	1QeFhZLHlQ/voVqE0+yAHQcRph4j8o79pNiBCXCFcFiMcU17L3+H7xQ/z88yNaumC0c0C83mwAG
	+MfJfhpYe4M0As1TbtDtAjVFF5f0F/NBNytEcgpbLmkILhYSzVoiU58hAMXNoXHoznibRIyj/hH
	/Ypo8LpQiJpz0IU98cHDy2u8jsOcinDB2oNWdKnuMZuZi58LrMhUIVXzB6Wq0Nce/eyRf65YwRb
	ZCQW/cdLLTPOHOvRuDVIIaTQSNSQ3rZ9T6ssfxbMiz0ioheLeGuHfvjFwJt78=
X-Received: by 2002:a17:90b:2e03:b0:38f:1f8:1fa with SMTP id 98e67ed59e1d1-38f01f802b5mr3474310a91.15.1784882669036;
        Fri, 24 Jul 2026 01:44:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:28 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri, 24 Jul 2026 16:43:14 +0800
Message-ID: <20260724084328.3943997-6-wenst@chromium.org>
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
index 715f26f05a31..8f8624a0d36a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1875,6 +1875,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2006,14 +2007,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
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
2.55.0.229.g6434b31f56-goog


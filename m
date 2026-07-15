Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A4B3D6497
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105705; cv=none; b=C1u8GHlC9mYsU8+AbvytT40KtZ93xcF1gBUBZSWN1wQ+j3rRaybJQz6f3WdA+5tYKZMqbCasWsh4YKveqrXoCo6S7ZQ1j8q69cUAPylmuQS4ZlDbS0DSH0bjZbcTNHb0vTKIPUXVtRI4I/tt5beedKVLxE+HfpjXjGRyXdRRFvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105705; c=relaxed/simple;
	bh=y3WhF+SuyleAojl6FwQNCSw5fjhd9v1zDhHyaW9zvKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBH5ER2fTGUU5aAUQuW/8K/gvYj4FvMQ/6OmE7lddVaBtI7yM6qINDFKsgMwPIlRtgkdcxYp3OkujSBux4aoPRubFA6y1tVokjbj27/tinZc9XyQn8W5VsZNiCh4SGteXbEBsAFf0JQSIQRCEwuJvnHhejKazY/wk7wRTw0JyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U4KiaC8Z; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U4KiaC8Z"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84a2c90e383so303871b3a.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105700; x=1784710500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=;
        b=U4KiaC8ZHcotD1jLJItMvlRs1LXy3siwlGpuWwcVjaYsH2uPgbxhrljMsmmnnTdrr1
         7RfAyNcwK2WRn6W4J6jlrEh23rCKQsvuExVUc6LwyJLCH9L3hkelsyQsM7v+GW89vtSy
         VOPwlU3gDFh+6S1Id18vmddoN/2FGNbbNfknI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105700; x=1784710500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=;
        b=CmdHr1l7i76SatC56C3PEEvPoD8SaHEiK8ikzx/5A2wE02eeyx2qeAVuEXzABnSPDI
         Vyjd+wF7y+kIOHSRGghGwrhntmdt4HI7aVAuzzUcmbrHV2yFEICmCkKYukbSVONaD/I1
         BgTZLXL31Wygm79amnqlYw6I1PHxjvnAFTTTYhSl10rK/PQcZT1CMbDOw8jw8iYtbxEL
         hQnVtkbTKqUkaW5W2GxB4kfRPQDXyAZhSNRJ/NrOKq0MUY88jek9sbdyrvYW8EMF6s9u
         zsp2o7BuZIdIq3v2HkTR+833ap6d6vtizz8s1sZdEuCFYvzxNPi9cLBW807/4Gaey8el
         dlJA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9hfEZsWowmihoW5baCbLh1yo7boGVISpjIg8qXFG0iBuPmIxaLU56YW7XDgtGuHs7LgVQKlqXIVL8@vger.kernel.org
X-Gm-Message-State: AOJu0YyeIW8MV45Uwj4SEpVsnYvO2ivqq8YSNr8Pf6lJ3evne9rlWIaI
	NgxzOneNbDVRTlKusiKvPksTcQcbCOa3m9e2UQWuRIYIgoJH8yFFiKATuiesvqUJYw==
X-Gm-Gg: AfdE7cmHIwuYcUj3jRPIbWM/1FS/BRjFZwGOAxId8wxIMQ4MoT6Pcttu8dNEcJsbRPz
	vKX/N/6ak7w21Jfjc9Otl44OaOEZdh2iCBSAVWmY5ec9YYyKQARUTjBtTFo7QeXLuSuYrNuim8/
	0Et+veQL+IEhHbk3XX0qGcpbyYbFXtH3+/cQ6W1yHHJkHL0+NR7jdv+oDZZ7SRWfEry4lBE9DHY
	a41rxlcoXVuUvuEG5cZ6W7A48UcBh53i3bZtn26hYLazpCJ3Q42mKC4JPmuPtQ+t9DYBAsde42g
	kXeEPt9cP0DWhtywZT952klaVJ4WDMEPlbYOgR74GyuV0u/6H/tnuuL86iTrZdiG88xLln9fVGB
	+IbW4urCiMu9ju83OwznWQPuJGXPtfzvbn7PN8dPQpywVxV3t8s4DQ7r8WZhuFlDdiAcpnHg8Ab
	DZ7bGD35S3p0bsVv9gNilx8/NRZ4dGzpNp0uNDIlgySdEWQSwGsfY8NtsEG3iaolnPjbiqHQ==
X-Received: by 2002:a05:6a00:3928:b0:848:2f58:e1e9 with SMTP id d2e1a72fcca58-84870790b80mr18374319b3a.36.1784105700341;
        Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
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
Subject: [PATCH v5 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Wed, 15 Jul 2026 16:53:39 +0800
Message-ID: <20260715085348.3457359-10-wenst@chromium.org>
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
index 40cdb63b5333..47010090d3b6 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -973,11 +973,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5434,7 +5431,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.795.g602f6c329a-goog


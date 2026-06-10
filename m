Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58983BB665
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080903; cv=none; b=GhTjiHA5Z8fcpzmnzIiqu9t93ArfivWufVk1XDmbaBZKdix8W5EGLKuDF1B44vrGYh1wRMBJLvps22hRicpWTTSSR595yn8VgqTrqAbi313ujwhEXVwUKrHQZ3fdcOxn9qoj+Pn6GRVbPdjSKO61cgArsNWlSP0rD7ooH4jPAYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080903; c=relaxed/simple;
	bh=R0+Z0BHMYu5U4Yu7kD4UWXq+2W/gGTv98A8HYveuJQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1O0BnQnjNhJ+cx+lXuOAkqMDPk0gNXtmPVC9L1TIER/ncNAn79CDh2qyjzQnvifSPMlbZDMVydUvZftDIAr+WbBS5M0AoTsZHivsqDiIHSfTt88jF7ilDtIuX5X9CZ+17tp4rHAq8d1LvpmfHeow7uK+LdC+kke7ju+Cleo0RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JdLVyMAl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JdLVyMAl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0bd02d97eso72502075ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080901; x=1781685701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=;
        b=JdLVyMAlePWYtAxi75yrYHjcBr7CvOeRurE6HQUnMcRhS8UHz39OpP7Y1/KqNYZ0eg
         RtsVZhfCveetdt872SVd/CBQpeKjt3/3R8w3aH/P9iORfAKXhu1I8J7GdMk14LJBRPn6
         eZL469YAH3n7fwc4egkD0faL7QMz+9tawR0eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080901; x=1781685701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=;
        b=Dxg63ODP2PBSEVdwMPqC1ok0Brc5Lej+1Etpy4VYaHo0Pwd5gwllm8ruRvkMFPIC7K
         UjKXWxOsG55SpBs09DJX+BRTgWdZPfIhMnnDA0w36pkh3wGp8gpDT7a128V6Do9asUB1
         8gFbABfwMkPGuPLrJWa2l0ak60oUPD9chxNiqTVAVm0C7uLnHWjIrB7hrprvmLMA5v0F
         rdV1zmVf08DIZSJKSrimTUFjP0OpgpezAJBh7QWDYu1KCf3zn3Ol62QDQvKeioqBmI53
         xOLngJEU0sP9iNAjzWps6YqId9Czjjo9lXuVpDxWEwMWbL58ez12Cr46pTXnIEDEUnwp
         +UVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CxSlUuQ4y2um6ppXAQap0KW2cWWNDam+xvfGUHfCMvUigHwUiTdLPtEH8vV9jhEvzHs3eTyc36xEV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7buTlzTOGjCXbLeY4xZlD6NQRt82N6c58PY//ZI+8ZJ5HEXVl
	njJihSxo1fcSKAl+v/hdpBSr2lnbOFtPNlq3ni41eDgL/hHQ0wBEHOpznSNvWMx90w==
X-Gm-Gg: Acq92OEyxx4CsN37fkU2HES13jcmvwJ5Jvq12XratRLuxXYhcwI24gBpLLRi3o+hC4d
	aq4pSDrDvZEY5Do822p7xoc5ylMdCjRoQdfVjn/+oclyUK3E2NB3NNTORvUQ+DemPerz77UDlie
	vpaNjJjbRxje80MVM5brU0cZiNYpN/9sZ76QcK2qWKMaEgebk3F7TQaq5XYAzMxyvj8jf4O+6+U
	LhlZhWpJVXXaSfppti1zlVEzzjeHh0WIW7pYXULBi/Q5aAG5KHqcHx7IqS354pZ9/nESjdVyUjt
	MOZg1/YBHOAk8mWwaCDit1kY/ns01WGvD1SfwXx8sMRRx+nJmYpDDhk8qUqmwRCEncLxbyCAcA7
	Du+xxXgg+hJ/lRVQY9ZTk9QlRarIyUlug1Sz4YBYOYs2Uz2mZUp58QV+LhuJpSd4n0lW28Nna1m
	MVC5eTpLpr+KpZZ3G1PhxUDo881Y8nJUEZIQlgZlyEbXNWzLcT3Xw1IegjrW9W/QG3tPQpMqauF
	G0x9ZpdtFWoHtRX7g==
X-Received: by 2002:a17:903:46cf:b0:2c0:d91d:c3e8 with SMTP id d9443c01a7336-2c1e80cd78emr274569985ad.4.1781080901116;
        Wed, 10 Jun 2026 01:41:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:40 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
Date: Wed, 10 Jun 2026 16:40:39 +0800
Message-ID: <20260610084053.2059858-6-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a USB hub port is connected to a connector in a firmware node
graph, the port itself has a node in the graph.

Associate the port's firmware node with the USB port's device,
usb_port::dev. This is used in later changes for the M.2 slot power
sequencing provider to match against the requesting port.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/port.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..1846eb1206a4 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -780,6 +780,8 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	device_set_node(&port_dev->dev,
+			fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.54.0.1099.g489fc7bff1-goog


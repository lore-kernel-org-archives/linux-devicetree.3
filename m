Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D4D3B4E98
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080894; cv=none; b=hSr8qpfJsOreQB+JAgEUVzYcduT9S3gH6r5YEghl1Zx+BzZDilJXuNhHHa6jeJAh/rFxpR8+gaCmUC/s++iuWkg4L/JABZgw8Lbl02CpexrfVCPlGZRiNsecUeXvtZuTIJReOh6QKxXppnAE3XfrW3SuYsw9UkBs+zrq0S0qZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080894; c=relaxed/simple;
	bh=sAi0MURaPjHAXe7GjHIr2vzfcZt5+QnjAoJMj8LuBqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpfwtCjm2xE02V2OTI6U+vns0ZgvmgIZvSSBXnZnsme5GFi4JGtkv1H09xreC8IzjNNOXpr4vaKmEOMKmeOEruExgo00vbz9f392TWkoPRspAzH7tdETM1JKLOILIrf9fK3CgHu7TcL4JuwcNXDN53rPcmUov6PZh7r0UlflvCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WUVjfzI8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WUVjfzI8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf22d29dabso43396235ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080892; x=1781685692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDEOB4zDGGA532YGopw6vfAouEtuG7p7cdbO9K1VfZ0=;
        b=WUVjfzI82etRAabNHQ6HbAxofP3BN440TN41o5OswepdmNA8IVuahtLZUskHeFe+o/
         axAbywQs3Mf+ku4DOxzed2TnCrSoOZY5yy8S2xiVd0LtTfG70YB5KO73ZwqsVA6qC+h+
         YP/HsFEWVAeCYU/AfFm+fdP4tOJSRyX/fjSUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080892; x=1781685692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dDEOB4zDGGA532YGopw6vfAouEtuG7p7cdbO9K1VfZ0=;
        b=TOTUqEnPOjBFyBlrMWKDaI7GXU3iJ73+ombUJDLO1YgP53i0971chyM6RqcsR5kUt6
         b300nal25IRJ27hL4PN8zfUS5+Ybmj0pvjS2Hc2aOWk1/nCRywa1m4wSkrMxF29ncnGC
         /JYupgscX7Qjxq3OzswU6W5XieMvWOpZP3Mh0TpkVFlu/GkcHyTUGitay893YGrMu2Wb
         /gFHWwvziC+z79pYF4chSZetXGQuuBttwlvqBchD90z0GF7LQ42nvkl//sr2xqnWm6Dk
         6L1Jnz4q2YXemiT3N1dlneB8Okdz0civUT7cL7spuSbFp7UY6v4PPqxTB4aoHggv4HHn
         EZxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YA7tmTeAFCO20Ff7GX9WNioLY6W/lgZFX6izrXLM9XuDF3E0xEQoV5jmkANIvS8Hpi1J99Y+JR8/W@vger.kernel.org
X-Gm-Message-State: AOJu0Yzek4xTQqoi1NLfRDjEUEzn2pu/GjKlqbrErtV7/4Q8w1+q+wT4
	DchvnxH9JvGmt+m949OYdAsaefzat5RGurCiv39fIqGHgLJQ+6z4oW980Z/8UVGBRw==
X-Gm-Gg: Acq92OGiSzSt8I2EHOsE9J9K3uz+folp2wkaNfFXhsZGUwSJUPTAVhtEYwIByb6+bld
	X7F5snlZ/7khb6kpZHx0WY7jrkaMNTntja+FljuzeTWXgur9/m0awJ7cDikVcL/datjU8AJ27Un
	KlIsTWk0JSYSHGAwog0KhFuB1VVfoCllTHb2SZOnfZedFP/5Czh9+H0siMY2P467EHacpOfIMB5
	ZAE0DvUFKqWBSEsjMZ7uESzwS5x1Y6hCbgoFFK2+J0MJ6thJ3xRxC+p/2L7V0hzJuyOEMV9Q3Po
	pBrfufqOIvwIM/hFnFiIeSOfkrf49AapnwQ5hjITCDdf9GiYIS3PJSLduLGgqb5bFmnVXLNwLOi
	X2zYs0gfSwgOOfpN1t/77m07VlOsj22qo9onA6ndpOdIXZQQZ4JiTet//tc6MuQjCXwxThm1WS7
	5epCV3yjaKQvW5W9Psj6Ao+2cDKcSQMPNH9LVIMIMHHKGaRRAKJvuppbeye+EhR+1piw5zsjVS6
	DpKdlZdpEJDt4sUNw==
X-Received: by 2002:a17:902:e74a:b0:2c1:8fea:4dbf with SMTP id d9443c01a7336-2c2a1bafeb4mr79293415ad.8.1781080892355;
        Wed, 10 Jun 2026 01:41:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:31 -0700 (PDT)
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
Subject: [PATCH v2 03/16] power: sequencing: Change CONFIG_POWER_SEQUENCING to bool
Date: Wed, 10 Jun 2026 16:40:37 +0800
Message-ID: <20260610084053.2059858-4-wenst@chromium.org>
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

USB support, including the core and hub driver, is bool, no modules. To
be able to use the power sequencing API in the USB core, the former must
also be bool to avoid the latter being built as a module.

Change CONFIG_POWER_SEQUENCING to bool.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 1c5f5820f5b7..27448fba9dc5 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 menuconfig POWER_SEQUENCING
-	tristate "Power Sequencing support"
+	bool "Power Sequencing support"
 	help
 	  Say Y here to enable the Power Sequencing subsystem.
 
-- 
2.54.0.1099.g489fc7bff1-goog


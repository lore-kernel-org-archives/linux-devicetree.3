Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5037463B75
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545551; cv=none; b=mSsei9YzKwWD932lBGW08iEOHt5+H+6jlY78Y1PSeB5awYOs8pCcPNXzkjiHC8MLqkE7fE18QIhIiZxxwNCI7yh+CX9DRsbbVH2Ck6vYmewV6uYNqdVRTGKdiERgpdK6MghwttnhK/iUK6gNQPsarqvFatLojHxAsCYaOOHjK8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545551; c=relaxed/simple;
	bh=guAn9TMfJdLxEfb0LTGkrmmVx3DDJgyF4Kcka2QfUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDJ+iWUH7KZIoK/XhX5sGS7SCrhIOGMb7vWvw+75OiX5+hyeasE3rQUfTHVY11rUE52us4qcgs4BFkI67Y1jXFULEUkIYAh8I++5JcMHf6npRsnOzUhSaGIPBPREqGSV904h3tomYMIqhQ+Ub6riB0NK1AZ9sHjWQAHsyUT2kzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bFRS5K0f; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bFRS5K0f"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba91so453568a91.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545523; x=1790150323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EP7B7Ij+uzgh7ozqOWENJmY+4dziA6HYdxmCK1rOAM=;
        b=bFRS5K0fJAFRwemfCnobO4KDZTJ0Upc+aurdNPL5HXxuXmicqD+uwP31FwD0DPH+2h
         guPLAibJTdNgLyZ1K8XB7SpjnWbvJ6sd6N2NPfzzBbnRJUZv5BtKeDkNWIzn/YTEs1p5
         p/SihHo7CsS/rx2z6z70oTxKTyoxlUNDjUrVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545523; x=1790150323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EP7B7Ij+uzgh7ozqOWENJmY+4dziA6HYdxmCK1rOAM=;
        b=ScKe0PAetci7AS9gsnqURXCnhcjOM1lOBCZe9KCgQk/W/X5SErd8hxdc2I6NcE1NlF
         M08ichElzZhJT2a1KCSRGIkelt8i2M+YGPuagu4vMf5CtrAb9oFK+8YBtfxPyYKyXZeJ
         Ti7izwrijZAEG2wu415CniPZVEKtb/mEyb2GBzro+6/cTTwXPpHOlqhAZ2uctgg88kGF
         TlYethVB4quy5YGkSR7b3iXLoKXZQkA9IO8Ad59W4lI7zpfaJxVdhOG5bmFxtyMPgua4
         S3x2x6LFHEJFfa5GVUwj/tvUI69x49ljVqDo43rqz23lqeY2AC8THO1lLFjB6DAX89i9
         5YLg==
X-Forwarded-Encrypted: i=1; AKwUvBygyh+5fMhN0L4b8hsk5aXh1D42AEKGU9E6rhgz2aSoqMPbTw7vneqzUIxzfTJAxJuVLy0SYky9HTPo@vger.kernel.org
X-Gm-Message-State: AFuF++k3648Of0TAUt/gtsKmsyafa0KjpG75rC9+lkQpniBExFY+ki8p
	y/skbhTmYjNiF4KNQSaUtyRaQLPkwLyQHlSQy+49y9ozj9weeqLWy9eGTy3VKTJ1QA==
X-Gm-Gg: AYBFou2KXOZREOIiRHTWT06Zg3RG05KXduV/bkRcnLgoUPPEXTAexMJZxQyJHj2PRQ7
	4RRvpm9CDhf5P0ehIwOlg5Qr2LBQTG6FdgURKKLL3XGikeRn+q4ksBun05E6kLWjMugLLFexTxD
	MnU/Kqu/sN21Q3QqwLFIrhvqJgXHzcDnTcvBKerjAxlMaun5sxpy09skgh9VeKUv9kz5u6sLYMw
	6C+32HACYJFh1WrLXtLRsecoQ4qIfUes62deQUW9+XnzMR4gMNt7tj5OVNAFunW7Py/2WmJhu2m
	xOUJyP1vGmEWMoxa5PsKTBWBsq4/5ilOeGWacDgzpAAEK1hpYBYYYGip3iwBq9pbq6r5zT13sRe
	b1tpcAHYVA/Xf/VUMxIS1zRBROStFnYPD07qI/Iy5QUJeUahBa5ZX7EGTdduObD6YKT30lF3F0x
	z1QvGqBoib410LiY+p3ps3HQLj9IEvq38Wo/fJQmHtOmkB9M6lARVyYa4Ipu2/PV+nhwjZkCFQG
	/f1tu5EOqsIDSMtcwr/bVnmfhzwXI3PJp4FCaj/mOiq6FyNQu2a+xZRHA==
X-Received: by 2002:a17:90b:440c:b0:39d:fea0:c17 with SMTP id 98e67ed59e1d1-39e1e309c21mr3792094a91.8.1789545523106;
        Wed, 16 Sep 2026 00:58:43 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:42 -0700 (PDT)
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
Subject: [PATCH v9 04/15] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Wed, 16 Sep 2026 15:57:30 +0800
Message-ID: <20260916075745.3549953-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
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
index 199d3f535a89..a4ec79a06a5c 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -902,10 +903,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
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
2.55.0.1032.g73a4cd73de-goog


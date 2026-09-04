Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735993FC5CD
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511452; cv=none; b=P5Tycz5ngygGot1EVNNqkG+JuuYwL2xII38160nZlIdks3zzODjZ8+7dVGfsS5zije/5rJ8M87CWz4X3/wieSmt0Kb26dvClr2GZI1wt2lnwzeQNrZKhqc7M0SZLbX5SHE4oIol80pmWwWthIRL4R/T5iXwB0n6m9qOsl11X0QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511452; c=relaxed/simple;
	bh=GKxlf1sAAAtK88H6DAU3sh0iIYsWYsT2IYOx5SXsE3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjT1Gydm7ZxmXsIWQFepPLbUJKM84JETKcI0jmjhNryaD41dngI8116BMa7UDLZuo5ZIRVwpZGuHwNP+rwhNSkQIbQ4am3tRR/25jKOQJsJWokE1kS4e2c4BxXLIrsWn9+IfouknrJobOdJMo1xrUuVUyIw8wL6BoANM95t7JIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VdY0iG85; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VdY0iG85"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso632003a91.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511447; x=1789116247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFmIb/8YvdtZL49BMQqQktnO00n+EPHrLzK7Dg1eMRc=;
        b=VdY0iG85RNkm9SkCaEqHCBCPJvjQCFRiRTVVxyJRlLXY6gFLiobguT2Ne1w6cUvCEM
         D3gEkgdol74YqaYwgxJXUdsCppnNHpFiUmzVvQrESERRM8iklThb3xVXk/Rppwa7UjPv
         +vVBhxRX6VVvPxyF1/pgk2dEHHC2eEOOggwpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511447; x=1789116247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFmIb/8YvdtZL49BMQqQktnO00n+EPHrLzK7Dg1eMRc=;
        b=CWf9h9Z5Bya0k0yBHbo0EoFvrqm7MFtulutz2SxghXmMUjNqkfouwblD2HVt2WETn3
         aQAZD2o9OmQrXbalama31HpB0l2TJRpJBLO0BubfqKxmgUZZysLfH+eLxMF3YCLJcFGa
         F75ui+aA9MAwtBdQ5S9oiYZ83jjAlyUolpCrM8gPd9X4+a+MigGWDx2XtGqHjBbjOh5x
         QvAQBhBZ1ZADCf75vOuonR73s26230ecsHsAGKwsr4seI9/Rv4sfuAd6mUaf3auendnr
         B+xfauHuI16r0mJyZrCavwcqGBQYxtjl956rObvUG+BCD5RZMMM2mbs+0DIlhmyv0dKD
         UUeg==
X-Forwarded-Encrypted: i=1; AKwUvBwp4U9gaU7Rh7x2ItdgUPvfDnKkLcKmVZmk/AiBFM2q0yYPjxEznbhEnp4dydWGsgprpy2ZANse4A93@vger.kernel.org
X-Gm-Message-State: AFuF++lkS0FfdjUKW+6uXlf+YwMUKsKsz9lBkyQTKG8R17S+sBUR9DAr
	R7w8Rq9TQ2X6NbKW3FvDBUVC6kpPWIKfA15sRjG8k1jY/YGj6casM4TCDliI3iVxNg==
X-Gm-Gg: AYBFou3GUN6cGCj2ZQBoIC+DK3rln4f8JKT/25MfjW44AFNPvnmru3c7RpM1lSedrW5
	lN+Hf9cswRanmYhCauZ6P55Ie6bQ/OCrqbuEztF6t9q8Lr48nqo9IZC599r/+pbYL4GCGJRUpuL
	Eb3ErCyjBolR96QHScSYLw5aAtEnK/BHS4QdPFCpGjPOpNnk6qgZI8ds9K47blXoad9z0NLIdLX
	T99U/U0UioXLoHoqRZSzeQGTwWO/KqBhQjlISpAwNhObKUy+djJ2it4bMgoLQAIaQlgi4vBNqGl
	RcVpE5aHmus+VU8mkuHASnMtnb1yrsGqT1eJD37Bsec7lHDaaDK4NBxHyAK4qZWco0ojn+kqi2U
	/uX/uMExcwH7A5R18tCZcIU+RIrVFAOsHLmWcDn6PQDBN9LutlxEywr28K8416npLBkhwBlyTmW
	u41IiezZkJC6ZHf0n2tcm1gm6DWufYkx0rZGfZ21Npu5SCUll1Msuy6noHCAkLkpVx6A77FkE/f
	CggBCgB+Fdhy9sDWM/Ua3FIH+dFX14ocXhP0UM/LVNZ
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr7127157a91.25.1788511447090;
        Fri, 04 Sep 2026 01:44:07 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:06 -0700 (PDT)
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
Subject: [PATCH v8 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Fri,  4 Sep 2026 16:41:48 +0800
Message-ID: <20260904084158.1341550-10-wenst@chromium.org>
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
index 1b891088a653..b7991eb53197 100644
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
@@ -5440,7 +5437,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.979.g7e5102b832-goog


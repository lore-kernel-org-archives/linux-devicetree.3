Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD124343F6
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616934; cv=none; b=YMIE/BKTEyPMSGM002dVqEvK9RhVxsJyM2ThR+jl9vJ91ot9iKSWC4NwSjrNXv2L8xG6e1HuGRGjFQcXLXY1fnl77xnbBCF/qzMffbW0Ff4bfFcIsIFDKtYM9u9f2gm5v1g92VPVTr1bM2KRSJj8t/DwcdkQJRlL8Vp3Ez0SfdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616934; c=relaxed/simple;
	bh=TPxqymmswATTFY0Ts3z5ZJsgeicU9hkYXr5TZUF7F/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJZoWuPwo4eCmM1aBoRe7H5Spjz9Ysot1TiAbAC9VlEc2ieeaGaMc2UzKKUVKFE9UjQY9E6RxKZIpkVLiVJttPG44fDO18dIg4HmhpeNQFGDmAjer3xy1uQ62MaJeEfiyqynV/Nu8Oc9apv2R3KGGM0IzIbddllqwzj/wdN4hnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HnrE0Bfk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HnrE0Bfk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so70228125ad.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616932; x=1785221732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=HnrE0BfkJcQENp+fx6WYE1H9Xyzox5+4j72mtBwMiaYOcnFTM3sELlbFIabUtbj/Uf
         Z5KtAc5aXXtFdTn3pIAfgdjjUrbGm82eZ9JFz5lAP9wXJlCTnINVXZDx4eznn7uhUugw
         daqI5tczffyFEOFQTjOYT+Mq+KQT0rTCRx908=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616932; x=1785221732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=qEy4JFn9Z+HnDa/JVKB7hXzvzMClNQ+EjX/X8dfFgXov9cS+ElqIvSOK9xQJcZGwQ2
         l0Lt+J/egvpS9iWgqWqXTyCClfodLnnQfI+Q+5aJi8z5xNw/WmKZZBUlRqKBBX38r6QX
         vAWmDxsUGd9/cvfifwYTnTJRUvO3ru08Qo+qUKPN80B0W9SZQiD4GMzILsc+3JrNUzHj
         uB+u6TGeQSfIWooRRZmhK1d0VnORH77yP8tOaqw8C9dYEuUx9PhMNywJi999iBQVq3uL
         MlCII4TJo5k8M4qNNirl3MTEHtlqGCrFXvyRlijs9lNiPpvUWwWIw64fLo6MaHqTpjJA
         575w==
X-Forwarded-Encrypted: i=1; AHgh+RrBX9Tj/humu97rxI9cNS+c78KtZtk8ibl9TTBXfQgci+RtWlWP7tJz+XSFmmGf5qZLaGqsxotOi+GU@vger.kernel.org
X-Gm-Message-State: AOJu0YzhN+CwX68mADv1oFm/jum9uyOMPb/msaOJ0+bVL0hPaL591lFY
	2+BmXDKQHCmmwLH1HiAgwXIONu6d0Xdr7db/7n1GKj+oa5wvd+yvacK0ug7LiL6FZw==
X-Gm-Gg: AR+sD10Y1xugLg1hoJTl6CAQ0OoUpn3U8IKW4ItF/sFuAmPWmcLXtwdnfNnVnnqZpV+
	d+feaJxBLQrAIdFlVSmpZpkXlNouXKiZEEmJfQkK7E0Z2ZP2Yptwv5BpiPF+D7zMsWP70myydhn
	ZbgjrIqg+rZ3NDPitLGhz8Ctc/VurCL3hJh2JNJv47VuaS2DlcEi2bGRDNt4XxjRO1UCfuxCa8Q
	VYcx61AJle7lmi97AgJ7vzJxL5XQUAxgLukutGDnpnXsT1mbo7Rw5yGMJfGFLJwIzwr2Ud+0Ps0
	YQFD4NJNZoAuzqHWZNLgjUvdtyfLW6BwO+tX3sjo1iLhqtx+qLzNZ+AAYSM/FLHt8WLYWQYqRbp
	XMQ9f9ul1Gj1oSXUl8wxkmkqldfR+Nd7I08XDXaMImMSDtj0vi66vXBFEMf8jIOlcPjirADH2VT
	ZABMwuwWW/RRk2gWJf+W6j430kZdMxP/nrIg+sXAHzNXvKfwGYVfc3bOPlZvE=
X-Received: by 2002:a17:903:2287:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2cf348366bfmr176522085ad.3.1784616932321;
        Mon, 20 Jul 2026 23:55:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:31 -0700 (PDT)
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
Subject: [PATCH v6 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Tue, 21 Jul 2026 14:54:07 +0800
Message-ID: <20260721065413.2306137-13-wenst@chromium.org>
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

A USB hub can have multiple ports, and this driver needs to
differentiate which port is being matched to. The USB hub driver now
associates the "port" node with the usb_port device, so here we can
use the remote "port" node to check for a match. Then fall back to
the remote device node for the other connection types.

Also rewrite the existing "remote == dev_of_node(dev)" with
device_match_of_node() for consistency.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional

Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 83fe6a1396bc..691cad0a6dd0 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,16 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+		if (device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+		if (device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.229.g6434b31f56-goog


Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147663C10A5
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080916; cv=none; b=moadNY97L+o/3M7sqDkWktq/9FPy6lXNOtcopRgV2RzOgnhtu0xk7EprKUcKLOdB4OP/0efPqIzeTSQ8kYyYRBXRHxdSXBLEa9UbF4noCouosqeKEi48LbnfAOWvrGZdQikfS7Y+IVPz9wbmgg2OxeRkTIWWjxHTt3ESfVJJc7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080916; c=relaxed/simple;
	bh=Pm31+hL6qrgMtRuUHHiRRIlqVHF08y0dXaprDA+L5Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JstpVGFqa0RmhmwZqhtSMJcH+I/JiquaH1HUm+ZhPX3KQbsyh2CNmH8KaLcIATjh6ZsEUMKzLEpbH4etB8p1OLPisZbuDphOD/F3XxyHNJ9BqkkQrbEfysIxKK80lBt0gcEddoDJVjIGPoH8/rES1gHGluJGbSK3lhIWpdShxMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e0MJTeSt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e0MJTeSt"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso62700525ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080914; x=1781685714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnO3yRdxbnlh4RjwbvilfqRxY8jsmsz+8SVoyh3JZE0=;
        b=e0MJTeStxs1K2v8xXr5iAdoAKYw/aTID2+7aH4ULJdHr+jUKUekXK5kky8CbD6UHi0
         bMz0yD1cO2yESHa1YBfh3dgbhXbqMHo/2nXSoifuqWxOV2YF2eu/6o32l4RWcRMnMDGA
         eLyjaKLHw2StxBFiPS79XDLPHezB2oMVMK3Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080914; x=1781685714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YnO3yRdxbnlh4RjwbvilfqRxY8jsmsz+8SVoyh3JZE0=;
        b=QQsP5ZAQ2capqp7Et7dgpTcBpdYxd4VoH6Mkdwb/ededrsypW/JsDBURXTijcUvolR
         wkuMALVRH4/OZ8FRdKO3Rnd4Pk5jUYStY79jUp3oYQxhU45GCJhM1NCGi2kW+NulMEz9
         /y/ws8ZvNwLjo+xP+GM/6wLs6UUFU64xA45XUanYDvktpfIUBjL94I5rYMVUJwZx7UxG
         w9iAFfTYxZgWLFucFPOFvJLoVFRLRlCAPABGuv0+njMTUyDOVBQ9QC0TQkwPZiPgI8fy
         /lLPVJrKDgLcYFMHityiaIQbBPuxV2IN4LAVbg1hURs4AQm5iZsFTgoF4ViPoLOwwee/
         jgaA==
X-Forwarded-Encrypted: i=1; AFNElJ/vgC+77nkTX4s0lwwT+rGBWlO+zHnTXHt7+9uMvalkES/ospgt19g6W//b9p0rhjFIFxrJWQs5LoVv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/qzrRp/2kf2ZnadCpE2GD1ioEUoAdizLDbd+hAMObP0/0TGvH
	ENsz6tlYDVtTXQSTDu8V7EBpCkhKuJkrym81tv+D3oQUKWn51qcL+VpB56rIxHO0/w==
X-Gm-Gg: Acq92OEST0mGVyOazaBtMmR+lotNGfsMlMhNz37HWgaJqRb77a97X0HO2zjzuYGYO2x
	jhxDtc3DQXkgj37xnqD8hiFiqHWwCNPwHQE8HS+KCeDck4LikEjO6/NYL6ZAQIW9X+vmHOAu0aU
	UWlRo2rSbDEUWMKj7OmFNkFBz+bOO1+RGxV7imJEiTMFJ5pSJcl3kqvX/ts+catv2HFWc+7Nac6
	9edz/cQ3EhR0+Xjm5zjfTX3MelMAV8vo8xZRADYRf6/g0QjBQ5z0ur47AHJq9K2HOdLzVAAHvch
	MFrpnrwzzJzYaTINKTB8xjgYZSQw2UprNu6790EuJ9tdNiaTBtitlZfdEkXQDEwPHejxx3OfuJo
	O7nhJbVDCMFBljr5VTAI5DPnxxrJWbNd3oAXhewL61SghBOz3N/zOmg9BWakI2Yd8RPQ7g/O3Xj
	YjTy6LEFupTLbbqHzlxesfDqEt5wRQ7LpzRzT6dd+P3CUprEnAIOEc087juss14djnWRehARL3V
	qfbiBWU5nzZFiFbpQ==
X-Received: by 2002:a17:902:da8b:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2c1e85ac571mr292987545ad.31.1781080914415;
        Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
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
Subject: [PATCH v2 08/16] Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP"
Date: Wed, 10 Jun 2026 16:40:42 +0800
Message-ID: <20260610084053.2059858-9-wenst@chromium.org>
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

mtk-xhci handles both USB 2.0 High Speed (HS) and USB 3.x SuperSpeed
(SS) host connections. And there are USB 2.0 only mtk-xhci blocks.
The SSUSB controller handles the device or gadget mode. Saying that
SSUSB handles the HS portion is wrong.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..75ecce3bdc7a 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
-- 
2.54.0.1099.g489fc7bff1-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895563;
	b=N4UR/Y5W+EFURJjB+K4iZVJuEitnj+U/hd8c9tbEhfvNj0tQmJvH2rLwGDzIWNwc697T
	 q+D7IWaWOkoc4Muov7Swq3f6ryycZRbBrEIqH0Twl/0uRyY7aKAkCJx+U08so0tzKh7Km
	 NtxZopI9E6WTYEHZjprnbaRLzOG4pV+vWd2w4rPtB2Uqr11mx+NSPSu47d7sKQXEQsfgB
	 hUWJ94VAjAZRr5nwDsqabmi+3omVqDGThCxkzoBrCjCWHyyP7D34GJjFyCuInrHbEegY9
	 ShnYQR+TdBK0NMEdAgPFyNKpjJZ9kqhSB2WYv5VPv4UXnkLV8zOeZXB4MinQu5FY5RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AZ+Nts8V7XrClS1oZQvmfEVzXa+kntyG6oy84QvWVxM=;
	b=zPY/dVmpJXmUHnyXYpaI37nUQ2s02G3jotSwwzYcE/EFWLrsjGoZLhG/xGoHkU4jWY/B
	 HA21izh016YQNw9Sg0Jv/iVy5Da//OHyiVmEkwg6UDpMngTGQUI7Oo/loV9uI9aoa70f9
	 a2yoTSgppa7tkhAOEX63Ng3dA4ETYWSqrMNGG6AbqP2PpaY1PrxxjuevOM4eczIWjAXX8
	 EW2sZLBHW7C5cnk9D5qqr5xgrKQmHtMSX58pN1ufb31TR5I+dXnNtCmd6kqha+z34vkDm
	 7NiS85lvXoQ7JOF5wjNuUi9ZakM8aFZCcwL6LzVKyH7HAGE2SDjEiS7fDU5ySZeclJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtQkGBNB;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08B7606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08B7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtQkGBNB
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1936600b3a.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895561; x=1795500361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZ+Nts8V7XrClS1oZQvmfEVzXa+kntyG6oy84QvWVxM=;
        b=LtQkGBNBtFlMhQ915KOkq/VELhj0hHpL9kotE3e1lf+d+nrQmIoTNN211bWM1OO1Xh
         xN0Bonp5CY6clcr1V1vBDBXNhwlEEKLccovysqMH40Rp9Vfa4BnwtODC5rwqkLlHecVr
         L7pNw7s9qNoDKmlEbQmNnxhi+DRJGMLxVkQ/icdOCyZYjHe2PG34ye5dAeeOZEvCQbCo
         v1V60CRBu/GmWgKwXqRhmWVQ9vD371jCQayNuW86NrxhZLBDRTHXJ2cK7RcZ9+L3wKvp
         MWecAqjErbYOUipKjoKZWAlMveyVbZA9zyF6KVL09GONEVrti79GHQliulOLp2BRiOIc
         04gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895561; x=1795500361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZ+Nts8V7XrClS1oZQvmfEVzXa+kntyG6oy84QvWVxM=;
        b=jHX5GylmC8JXXkZTy/DvdrR7Pb2F/a3dibqtg+UuKHjtPOyjnD7Cw5/1l5Gq7FXHzA
         6shxVLxXbZ2/zWaXKKgnZ6l8C5ghbqo+wFv4A2BZbFCgnP9O5z9j6Da2DAl6BjxLcRTK
         90vdgiDJ3LnDZRCJPw0+w6i6nJAqmEI9ziXCdk0jxkII6qfbpJzlYGlBD5bPtD3O/+xY
         6QD5GCo24Qy4Yz0kpb4BpffigHVXoDeRh432NOqwu4YZ4U+cBlkD38hEfLuK/31HJyRW
         INOZNsF8jYj3CDDlRPXptQ0k2BJluM010apzwpgUHgDyE9eDow+3LJE83kyvmZ5eltYA
         GEUA==
X-Forwarded-Encrypted: i=1; AL+hErHMVILO7pDVagGKRwPe0qdSSdIVybzCi+Hv33imRedE46QUDsFQLvftrtTVam1QAZeytGo8nmyI5erL@vger.kernel.org
X-Gm-Message-State: APuU4Z+l+u5FGWEI/ypGTpLw3u3TixhsZugw+1w9mFPa/2qmszBpvLHd
	1B1cu7yBaYmgr8sNzvrzhlkJr0ITHeyXRDYPkBRA9u/fAZdqa6SwN1q6
X-Gm-Gg: AYBFou2Bx8CRsZ62DGhrM3QqaMCCD2JUnsMsMKako8AZTYb7x/xnDQ7oj/z8/tS+CWE
	oibqJg5smKRkgAHZFt58KcKCRqjT1VnhdbJQZptoch37VRKf1VEFvtEU04GIWc2IB99JRG+mv/n
	7IU5GB8nLJPPU5n98W7h+7CgI17Gr51ndGMK7e/emkmtmPhPtcL8Flo4SyzVNI12qHSgUSaM60W
	aM4O0yAIBNW+dhGna1U2roykkT7jecuThgEyixYtemRuSr/jl31VPnKWDCTKGRVxNfbalvPaA2b
	UaUBB/i8j+o8G11NWjJGvLB9+a+UtiFSYc+xg+IN/+qivVRruai0JQL8Bh2yVVbpqoUaxTkjNa8
	2tDUSS34mW80VsYJleKP3ulKze5oGmdyHuRH/jhgzjrZDYYUg+pKAqpcjAXVJwe9b4//Y20C3m/
	FovZQqAUb4zVqHJ39iXJjNMFoQjG103twPQZDfcDFApNSj903xqOOEsSH1xWxeHmXUi4dpaL55q
	1KdGenV6QxkUiW5V2SQGfbo7uxPb4kW4z+ALxsL6hSYPkTSW/YGyf0BYXNWAqPdDalVKWvGmAiY
	qJPSn2vByZKTrXHSIadTsWaCI6ATGiOyrlW7SInd1NmZqLSjg1ISHJ+XRZLabl8ig4bf0V4i/vG
	Fgm6y5r5mlkdy
X-Received: by 2002:a05:6a00:94dc:b0:886:a52a:316f with SMTP id d2e1a72fcca58-8beb2e7e862mr11025811b3a.4.1794895561290;
        Mon, 16 Nov 2026 22:06:01 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:00 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 0/4] Add Nuvoton MA35D1 thermal sensor support
Date: Tue, 17 Nov 2026 14:04:57 +0800
Message-Id: <20261117060501.2611071-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the on-chip temperature sensor of the
Nuvoton MA35D1 SoC.

The sensor has no register region of its own; it is controlled through
a single register in the system management (SYS) block, which is
already described in DT and bound to the MA35D1 reset driver. Rather
than adding a child node that would only exist to instantiate a driver,
the SYS node is made the thermal sensor provider, and the reset driver
creates an auxiliary device that the thermal driver binds to.

Patch 1 documents #thermal-sensor-cells for the SYS node, patch 2 makes
the reset driver create the auxiliary device, patch 3 adds the thermal
driver and patch 4 adds the thermal zone to the SoC dtsi.

Tested on the MA35D1-SOM board.

Zi-Yu Chen (4):
  dt-bindings: reset: nuvoton,ma35d1-reset: Add #thermal-sensor-cells
  reset: ma35d1: Register auxiliary device for the temperature sensor
  thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal sensor driver
  arm64: dts: nuvoton: ma35d1: Add thermal zone

 .../bindings/reset/nuvoton,ma35d1-reset.yaml  |  13 +-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  16 ++
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-ma35d1.c                  |  11 +-
 drivers/thermal/Kconfig                       |  11 ++
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/ma35d1_thermal.c              | 149 ++++++++++++++++++
 7 files changed, 198 insertions(+), 4 deletions(-)
 create mode 100644 drivers/thermal/ma35d1_thermal.c

-- 
2.34.1


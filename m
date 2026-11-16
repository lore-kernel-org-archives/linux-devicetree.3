Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831113;
	b=bcOlbj/1CZpL7FeZXM106HUQFeLVCbuZeAhjfibaMBsrAEVPK8DVa7Efnx9lbwvQ132j
	 SQOgU+qd9L5L1jW5hzp0fr0NRlDx8jSdPWxX0OTzQZGFy/L4NFBoyzejZhjVlEn+GCGIE
	 qt8wiAneEV+MJ4hI0xbgFfMcTiRm6WLAcy70kv1n1nvcXN0fZBXglE4DuAzHW/VnPKXCI
	 TX2409SfDm51LDmMiFd+pCTk5WGhFdmU1Ge/eVIEc+MNnH5ruggcYF61VYQUT1rexc+ss
	 sUrc7CAR4OO2K7lzkMZ6u52fELTG7QmM07f+HjoPp2WlxczvPSmHglsj2nFuGRCZYdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=;
	b=faQLWt7QaOP8o1W9wg5TrRlJgmad0JrzJPaIkQZQIQXKrRS3tj+Cn+ZYT2RCz3OmvZSd
	 MFrxh56dLIje14ztXAZpkaC9dIq1Jrzr1dOAK1TeE87IJHmilTiT1B2hoipFgfTe3Ijoh
	 KTRkP+VbgeBKCiAe5vjob2E31aV/+2yZ8StrC/84xZ3RHzQ81WQturqWtQdtXWqg9DQss
	 JBpm+H6SXbevIG9mRuKTcK/au8uWofF91vzWaifEv9yc7MXTE+CkBv+5l0x6AX7b8U0AK
	 /wLNyaopitxtYJM/nuSA33PtLwjCkGnYrCLcb0BXrVNxvAvwCWN5DkFmCaDycYu6yZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fn1pkVOh;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B23606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B23606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fn1pkVOh
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so35926615e9.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 04:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831111; x=1795435911; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=;
        b=fn1pkVOhZJ2vJRwZ8IT0PQbNtnL8jVHqGxa4l+jf7COFOQRFK6NpETv6TXMIGdH5c0
         g7+GoC9bpH9k4XHOJ80tVR/UDJpONGVE1zDW4CYGqabVmm6frk6RzA4DgQLOqmj+bMat
         QVcTQP0KEulZhT4rF08nZ68tjs93scMrS5GXo8VMnewh0cYrNg+7dhjBqj3GInNRGNrt
         uXdPFQSYsTyBigXr4SluFICLtrFYl/EBW/Iq7kT32N0O+w1n09NBmZgmNZkhEzkPU5wz
         n815oRyAO0hrp+FrY1axZgkxb1Yw+0v3v7lBLj4Y7oLmWEDSmsoQlPq9tiHdu44wuWuS
         cMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831111; x=1795435911;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=;
        b=Jfb1aadJrWZlom2uxOigKhpzJUXROsDHtgM02Wo/FCQCOMEsc6bQvepawcACEiBvNh
         tp8pBCnJi+8rvl2amXGl1Nz2Z4YNU9UJSjaZsEqRfzMzQCytVaSWx/dsVv0BAt0fFp4Q
         0X1Vhs1T5gjMPMecX0KUICQQcVsrUVLdTeTxbT5Kk6ZIjND0sKUzrArB5VeL7nKV8frL
         U7+iED/AmY3R8s7xOCs0AMAYLoDeM7z3kwendzDhtfFbDsInO7O3t7zWUiPpHpj5xYmv
         3fbgnJXhy2dwHAmPYPqj4Y/L5pz5FNoLwUGAj70yzjC6OqvD3wA2O9zAQ5oQREA0joEU
         0IKQ==
X-Forwarded-Encrypted: i=1; AL+hErGROmZyXTd7hIcV7c7VRRPRcZXyxJOU6vegicowXSMdNnSQlRdyMrWuVRDvibTDzeXINbD0/jQ2opNM@vger.kernel.org
X-Gm-Message-State: APuU4Z8lpoLvcuEXaxVBQuZrcMY/8a5yKnetINmbrrk3Z9weHbMrJT16
	9DykO9/luvuMt2YLezzikpPPJccBj+6EhTkH/38GmMuWT3SdrdSZ/l8U
X-Gm-Gg: AYBFou1aUIN8akf24A3jgIebcE9/f+hqPIDzH+4eE+pc1ILBwDxiPYgXkSa+vlvS/iD
	4sEhsatI/pqgMkejQK1xyZ/bR6V/fqko307zTfk/KKaQW6zFppySKZu2JxNSZvtlZbCzSOjJDCB
	lF8yRqeLiIi60hCViEVPPQfmBIdKVmChRpRqLhW8M5PRw2fo740y38s06FfdXl8utPhjpj4XlP6
	RMuR5+TeU5x1dGNSML5VbKE423TXaJHAkuCUaAfig6RaxTd6y3Hunvd6w1ivaNnhM+7CMb5fomx
	eMJpfHk7muEUJhdxfmJxWpJUYiKUEAuHGzh8n5Z9PDL7IJllo1B4XvVBLJvbiydw0aigCVMW/ci
	QDP/5z+Ghp3Bo8m+XcMKAFp6nlUS09tJtdxFqiTNP73a2K40urx2nCbPsDKfxGyVTCuoN+c0u6j
	SSXHjO656RBZTkGw96H7kGew54rvlr5kefVAr0RBZGsGfXKLefgFEHeTg3Opdg9zunkUHJZuexj
	+48ZL8/YxS3eQ6Hk3SBjaEPDqGgSu16AS2uAT6T/np2g/D4QSyrJpcUzERp5UcRraDxY12ax1IR
	pUdJPhQNoEGY4NDQq3GZ0aOKTkBC1oGgnQnWyQ3uEvFLtG3BZak7dqzpjTJ738DlaznFmk0CCsw
	fGskEGtiA2R7U/6fMY3BuPGfR0Vqks/XA/UlYjuCrh/1wRqzhGF0eUD8rtsjAGy7uvB1uVXJ2
X-Received: by 2002:a7b:c009:0:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb55a832famr162798335e9.13.1794831111064;
        Mon, 16 Nov 2026 04:11:51 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:50 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH 0/2] MNT Reform 2: Fix the internal panel on i.MX8MQ
Date: Mon, 16 Nov 2026 13:11:47 +0100
Message-Id: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDQAwAvyI5N+BGuhW/Ij1Em7YBjZIVEWT/7
 uJxYGZOSOIqCbrqBJddky5WIDwqGP9sP0H9FAaqKYYQIrp8F58J1TZx4wlXNpmweY7ti5iHgVo
 o8Vo8Pe5x/875ArE+tEpoAAAA
X-Change-ID: 20261116-reform2-internal-panel-35c872aabb28
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

The internal eDP panel of the MNT Reform 2 with the i.MX8MQ module does
not show a stable picture. There are two problems.

The panel-edp mode for the Innolux N125HCE-GN1 is a 70 Hz mode that is
not in the EDID of the panel. Patch 1 replaces it with the 60 Hz timing
from the EDID.

LCDIF underflows at 1920x1080. Patch 2 connects DCSS to the MIPI-DSI
host instead and leaves LCDIF disabled.

Patch 2 depends on patch 1. The video PLL rate in the device tree is
four times the 138.78 MHz pixel clock of the new mode.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
Christian Gmeiner (2):
      drm/panel-edp: Fix Innolux N125HCE-GN1 mode
      arm64: dts: imx8mq-mnt-reform2: Drive the internal panel from DCSS

 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      | 52 ++++++++++++++++++++--
 drivers/gpu/drm/panel/panel-edp.c                  | 15 ++++---
 2 files changed, 56 insertions(+), 11 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261116-reform2-internal-panel-35c872aabb28

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>


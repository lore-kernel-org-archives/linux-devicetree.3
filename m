Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7498A388E49
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980256; cv=none; b=u4i0g+jYqIXKftEBX09D0Fp/HeZtZn7C0vYQYFO7ySnGZaIkEX7I/MmDpWwqeopfdVbYXBLzbm5GjKCfCTp61EJvWcKhS4ikkrs+M6PxSLYPFjtrzPz0tyspV+fZ4Oibk4u4Zgvlq8wry3RjlpoMplMcjXGFACvYbt7JTuFdxf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980256; c=relaxed/simple;
	bh=91K842evcD16Ucl1KjEyczWmeAeIibln7xC0ChPpD3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFdYVldWtVKKAH+7Y5OFMp+E6MWgXUcnKz4l5qKSTDlzYaHWzJZVblHmiiWNA3BsFdtWKsC+6j+xritbFf4+UdXaEaiS19rJjaAL0GKB2LYUXa1vzSWi8JWUDftHrEbM64OOXirg3FuBToRbm7I0o9OIC/rgI45nIVzJ2gp2FwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFJy1OYG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFJy1OYG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48896199cbaso45444165e9.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777980253; x=1778585053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBWradkhizwSf4yE2yoAp/RFCrxwteOMoA1zZzyzf0s=;
        b=lFJy1OYGnzCMYuhTUdRZgzOUoKNaYYhav0G2OQk637GOefYk6F+iI5c8Nu2rP/tiOJ
         tLNapp2XBmq1r/uy1oYiV7fS6bEZsBiOF9fhmqeddGPl6Omw4xUL2xWhNytOA+6ZUrCy
         SsNKrFyEuStMqJsfoJuHZJ1m9Nz+c6XJqEAIvQ29mV84ByncPUZlX/zIBMjggj/pNggD
         g7CNf0odFYFbCDe9MAC/4YoEuKTEwl/lD4MJ9P5Ha93o+KbRulSef3qjaThYMl1yg9BX
         IEW/cCXnJRoAuU9GVMhiyPCMcxEZva1HwhwRXlkPIBfOlt1Dz61GCc0wTsH0sQ7c/8HV
         yfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777980253; x=1778585053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBWradkhizwSf4yE2yoAp/RFCrxwteOMoA1zZzyzf0s=;
        b=BKoDgLSkeYvYYQQU0A7+V0UazIigUu1T2wvhY9Jv95dhzhS8n+gzQAcugKMsPEEB8/
         hH2ZFZ9+4AasV+GPbUXpRM+tk2zVSz693ixohfs45oedfidvSoP3h/bIbXmXynieYpkB
         ADRmpbfgzQwm/Gc61dAqJHtCmVLn7P2UBzxHed8EcrZUnE6uPW0fY8ZjE/hvQX8/2yZs
         Vq1reiSOGkH5y2l/d0PFE6oxT8jxK2p4ycEQDzrGaU5R403HRHTYINihtjPqNHms9A5n
         CA/mX5LE/7Agyr4Dr59PIVUG4XFR/tScF4iX8kT/mrR6knsUf0bNNiX7qESpp6fj2bVB
         B1ug==
X-Forwarded-Encrypted: i=1; AFNElJ/vtDGdJBuYS/levA45xWBj/r4dfjh3D3fOyLsX2KQi49P936fgNC88IgpHNKMmo7T/BkWiQRkcMpyI@vger.kernel.org
X-Gm-Message-State: AOJu0YyKShi5ww2iF4lUm0qTpndLklGbAwKg7hCrhoYTvwEabi9mbRIR
	nNsFS8QGpqU60/S1pllr8kN+yQGo8dorWMHieAcQnNWw+sRi78u8lmMe
X-Gm-Gg: AeBDieugC7M2qxezm7sD1WbRsnxvYHWbf+ixvFsGRoOc6zWfrHRSHzgEdXdK0XDAwra
	/Es8ZYllWa69Qf3xYQmiLQC6ovsPzDogsCkg4uQ6Q7B7NE+1Roiu+I5mndkSsN5msMrMr3kMh/U
	ydpQ1eDy5jNHL1V/SyLs32+Hd8wsGuB6vDeWK7aXOPD9JBhDfawdiFcxKBBI6n50ebbmstBB0d8
	IG6ByxAgf61Sej2y7dPPuGnV9hYAp18s+SrSk8I3ZgUx9SGM7hxzes6bQpGx+I/YW9ZRdPB0U3Y
	j/i8wHG1VHIwFo3as4erP/204hNhUtNxoE+3z2th5VBs0RhXyHlF42a/tR0uFMdVpQoBgLNuJta
	p5jibsMyeKyhklyfKsQYXXc4xilhluQNW9/Y0i3WpZ20Q6rNCbpNehh1RczXu8eeBU1uMPYHwvS
	XGJdEY8sztsJV3wdEqshDVlOJCdqvhcMPWltSya0wfRAIp9WUA4KP3ghDCdjplSGAv+F2Dr6zg2
	9yUfkLHPdAvxg0QWRAGr8IxXZ+e2Y8dCWfrIl4i7xfcztObzb7RUATphQ==
X-Received: by 2002:a05:600c:4f82:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48d18ce240cmr39137725e9.20.1777980252724;
        Tue, 05 May 2026 04:24:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm339946455e9.11.2026.05.05.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:24:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/2] memory: renesas-rpc-if: Fix duplicate device name on multi-instance platforms
Date: Tue,  5 May 2026 12:24:05 +0100
Message-ID: <20260505112405.667796-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On platforms with multiple xSPI instances, the driver fails to probe
additional instances due to duplicate sysfs entries:

  [   86.878242] sysfs: cannot create duplicate filename '/bus/platform/devices/rpc-if-spi'

This occurs because platform_device_alloc() uses pdev->id for the device
ID, which may be PLATFORM_DEVID_NONE (-1) for multiple instances, causing
all instances to attempt registration with the same name.

Fix this by using PLATFORM_DEVID_AUTO instead, which automatically assigns
unique IDs to each device instance, allowing multiple xSPI controllers to
coexist without naming conflicts.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- No change

v1->v2:
- Add RB tag from Wolfram.
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 0fb568456164..3755956ae906 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -1034,7 +1034,7 @@ static int rpcif_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(rpc->spi_clk),
 				     "cannot get enabled spi clk\n");
 
-	vdev = platform_device_alloc(name, pdev->id);
+	vdev = platform_device_alloc(name, PLATFORM_DEVID_AUTO);
 	if (!vdev)
 		return -ENOMEM;
 	vdev->dev.parent = dev;
-- 
2.54.0


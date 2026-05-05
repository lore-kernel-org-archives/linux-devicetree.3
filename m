Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87D1219FC
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985972; cv=none; b=uGnUuW/tsZ45AaC558lW8viRdVl27h9w55eLgkBQ9hDsymaS2IMSBzm7HMQ3gIpbbYeIrk+HJ6O9ZO+rPWXoNukm2fuYfB4nHpbYJdSw8sO1PeEUc2uG4JI3fXlol954A1fVUOxOH6frPxovXIv2WBCo3o9G+lv0X//IfqtU3yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985972; c=relaxed/simple;
	bh=hUzf6DhWUXDvkdX8HD9Gwj48RIJFkDs0CZ6OQcnOoD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZY0lDvqcqRfZyJlMyTKaSEKhc2Wf5SC1MjOv4c07Ep2LdESuH8NsvzNOnx23f2UhorZQskoZzHmuQbFOZxvRGBIlcbvq9+wjtASILDR4+0l5WRzI+gLSDD2lWJCjdFrUm4e0xagn5lEfze65ht37HQJ7ucRoZY967MutgR3DWjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsQD3jVy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsQD3jVy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488d2079582so55809165e9.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777985965; x=1778590765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPKJ1OltZUIEZcaxYTjZIm1/li/hs+r7skSVCHusmnM=;
        b=LsQD3jVyeiMymXJ26yQJXyGbD+0FYoER0Z6yE3ASiGOMn7GEoPpOzPrHHUSkGkSAfm
         TLSr9B70TmtcgfZ/zMTkgeh1gywCpuVjucF3Kr9C4qMcpLlILhhHzVAWtVWBkAmdoejT
         t6AstnVIXqX0ZE8I1kMVspWvZfizVcV16PxCYSjKdelEJi9KD39a78328IZB/d2WJxhP
         L1OqJh9SSHv3uauT662G6xGlOvhZkD0xmLgwydzWOAH9lqht2a6i2Nyt6hjDZBvgyTeg
         GFSWsBxM1ijzHmI9zOQJHIBvbaEuxiVuEGMb4pZqpn28k1rg9kg/KLu/GbKtwvhbOpYO
         +bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985965; x=1778590765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPKJ1OltZUIEZcaxYTjZIm1/li/hs+r7skSVCHusmnM=;
        b=S52A5REy4x3gO13C4GtMcAMvvJOiZnhTg+eXCts3hM8xZx1L3b22Qgbd0qLwR0PFyJ
         XRJvVpvnZP4hZ51nWef0eX/xh+R1UBcA50tDFbJ+xjClUNH8CNncmeuPOabH/hrdA0D5
         Yp2rsZ2yDLbCQawGo5rrET0M9qwnCbykNGgii9qPdfkQXIDJ+oKNyvQS/urU5nD/cPMe
         hBp4nB4m4F8wX1HJiUgNRnnREF6NajcR8ZlfSttp2+lLxJ/nvaEP5StJySHflBT2mUr4
         pNHMfy0HEQSdrR2LwlA9qqXxVw+W70JwOM/KQ/vI+OWTJu4t4BfyH/7C4LeXGLOyPvCP
         gaPw==
X-Forwarded-Encrypted: i=1; AFNElJ9ROzd9fzdSX1TzzQFoAR7reDVElHAl8uecg1DJnSv4Jdrk/nAjX4xdBKzTnDSsm1hotNJyMicqcfWD@vger.kernel.org
X-Gm-Message-State: AOJu0YxbJVxFLpGJlkh1fab/F4mwDsuyUCXhhnRPwgcaFMiT5diphaFA
	GXQHnksmqg0+ml6lPPuNfteJKVQhvT/0hrajHo4jD0hR3C3mK7t4/rVO
X-Gm-Gg: AeBDievEPsgUmBa4QhNIsC6gWp//Jz/gqgglePV4BgF/lGadQkE5GdYA+pqlGgU39hv
	IRIoHUuM2JbbPUZFG8GaPggJfbj8ZZr77guImjaopZ4/gh+1gHSyMmhm0fYT97uKWVtAbj64csW
	+YtXjnVUIlDrlOMAGvY9EmlJy4E3yhhac/WRGoSy8dOpJ2CvzDX9fymgolPMquACfPWXb/VQbYE
	OZTy0pPRckOskEh13CKiBorl9ljPrPEMb8MGVYd1SZRyPQc5yukbbv0wUbVv/7GD0AZFbpjrRXJ
	JVLUBeMemU9dmxirES75DNdRsXOBvWAP9UD2b7R/1q6xoGPYWd+67DzddW1/rgqyeuYDI27xyQo
	TfAqXm6DANWNeWGWc26jIjO/R3ZevTfp+eao72kSAtRbQFnq1sv2IdV2Iv6K67obaQuan6HIIGy
	ICgAzdfftAOODikprbTuzYqlm6oz/E8kvedCK+AqGvrn52gukK9JubFJT33T8=
X-Received: by 2002:a05:600c:c174:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48d1a94087dmr46619075e9.18.1777985964912;
        Tue, 05 May 2026 05:59:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm625634745e9.9.2026.05.05.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:59:24 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/2] Enable watchdog on RZ/G3L SMARC EVK
Date: Tue,  5 May 2026 13:59:15 +0100
Message-ID: <20260505125921.149682-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SOC has 3 watchdog timer channels:
 wdt channel0(wdt0) for Cortex-A55-CPU Non-Secure
 wdt channel1(wdt1) for Cortex-A55 CPU Secure
 wdt channel2(wdt2) for Cortex-M33 CPU

Enable wdt0 on RZ/G3L SMARC EVK platform.

This patch depend upon the binding patch[1] and [2]
[1] https://lore.kernel.org/all/20260206112227.233229-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260505123708.134069-1-biju.das.jz@bp.renesas.com/T/#t

Biju Das (2):
  arm64: dts: renesas: r9a08g046: Add wdt device node
  arm64: dts: renesas: rzg3l-smarc-som: Enable watchdog

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi       | 14 ++++++++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi |  5 +++++
 2 files changed, 19 insertions(+)

-- 
2.43.0


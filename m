Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107075;
	b=bvASGE+6G/+/De6KKD9QepTaJ4hS1/NP1k55ek+FUSlmkRd+C4m/QDRxFoTwJrEhPAT/
	 K9VXwREKpJDskKelJ+9nmkMdL5A4xwmPX0rGfDXHkruw0vVo4MNQsag3iqliaCFjsddBI
	 sUhueAhxKVGEaTjkWo/3q+yGnalnDtZHNVmUQDMve640Ro1WK8Q5g3XCwdxSTam8ciSgm
	 +sMZS4AMtT2/LMRa0wUz1kiPIPHv2jwtUICswcdsVVHWuReEjWLKEzGn2hRrCpIUiWc+o
	 Mj5jRxu8n+XVmaGPXaVXvc1EGOxwzstKssIdWCGuVpTHbBzy5mAXPLIM7kTxgwXw2oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vqZvXjV4n8be69kPlaiT6+hlyFGKWR2Jg6RBdmE5QhU=;
	b=i1nVJomjqMoVLl4oknZUXyONMbSrBWjg5E3sP0UUmmfvkMg17VwluCTjk6t+CHTiwT9j
	 mvQo4yIzGj6Yx0OQi1/DA35beX1aLKdLRB3xmdT+TG7oUp/8+2LzmXSgx0p/OoAfshKjS
	 wJT9rqbgLn1nTmMnozj1L75V/7fF5jy798ls+LV5k5VH1k+81isUqiYUuBpC9PrIEapT4
	 l/AmAXg01cWV7kKvS4MHqCQqn3ddxqV4P9BgcAUuXlsTrFlKgGGCv7hIQXlOw82cVx5DA
	 Dq4BtHio3eTCrMS/b/9KM12FGkFLe27PrIPjN87MHxgX27hikdlzklYBGKD9JR/Xw8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BYgNUIEe;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B40A606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B40A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BYgNUIEe
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-475920b9ca2so1305510fac.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107074; x=1793711874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vqZvXjV4n8be69kPlaiT6+hlyFGKWR2Jg6RBdmE5QhU=;
        b=BYgNUIEeS3hiXi91blh9PUmQR/bJNGta7wvmoZ3FwonGZIioT23eWMkAcUOKA7LqZo
         Te3tK7LJMpdK6nB9f4ov6enkvugqkiB7RSA9O6DINkmrq4Sve/odgXLSaXcnDhRyNdqK
         N84gkYAFxaSAhtS5mjpEWjjDvaYeE+AaYH9C2dXwQ8fen3pkJnbX0LIRUZnt5dJnK+73
         ImErX0SydSxgBDl1Z+UjjfuherJybQtZHUXJuZRw1coGldPpsLtI8qqB7XKaaSPicw2w
         8VHHe0dTyRvXzAzsqDz+MXhrq87uBSPToyOnpfOGlgCnYBXlSAZ6DJLetXVrHdzxnMs0
         r+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107074; x=1793711874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqZvXjV4n8be69kPlaiT6+hlyFGKWR2Jg6RBdmE5QhU=;
        b=TibXKNCUeadxDX+nTx58Pm1adOJh9lo4mSM5+jqMm3MZVbbNqIskZIBf1+NQLerCYm
         mziRjkRjG6E/oLefTx4mQRTJl0kkdt6s6qUY0WG1PCZ19YC/yyV+yVf468hO5YDCT/PA
         C316h7pFN9IyJ4BaBUL5mLYfQzq8bqZao8dHxXRs4CBIG3DE6X/amrLDO5npp1mklE6r
         0pYe9a3FXOV+WgANc08Hh8z24ci6s7LjXDlilYnVEqWOGmonZYHWgw2sT1LWyS6dJcVv
         w35NlHdNDQxFcK6i/2P64YhUczgaq3VUYHsw1+Weld7OxzhYKCXiom4YScJoa8s0JGyL
         Vw6Q==
X-Gm-Message-State: AFq9FYLovFkiZ3nNVz6cUPr8RcIEnSapR/gyVAKo7XTRmbXpyTehEDHi
	Jy4oE+ToI2q84zgc+URuKKWEuN02FXsU+G9LEm56jSAy7/TSgyCTxdkW
X-Gm-Gg: AYBFou2t2BaFBE38SQkxUE1k/JXW6/KgztgyQmjXY2qygf1VbSzOGuHIzbvw+QqPYtY
	w1a6wKTg7Q85CG8IRAYqxqn0ANtlxJ4caIj9V7tPFuyc7vrOq31gY5AmGxLhOByom2aMSAhUQNn
	LZ+Gtq/YzL35WD9aIKBze0kQ/89F+up736dnQtGQGZ/iR2ID0FPWMRt2vgJlrNkcnNhhdv9mVlc
	S3ZQd0J83bdN6TlCXhzcLddkBezWSc0bhWgTAdGxU/NJT5ADrwQbafoQ+/zRxSweHmDT6zZiEwg
	SmLD+HQqZJvB4EnFCsh34vSobw2vg6zM07REeo0OC1QtbWCKvMyB9L1aa+aUpJtp2jdnTl29+Qn
	Abtjfer8xaEQqEOoueVQ9iKujqtvFq5SnxW73so++re+eaI5t43BZm49Ojjujv2MUQz4X6daSat
	0SP/ZGmUE9C5lQ2t/CGEGFcM+Y+9nNIZBzVlE0mn2xLLvGk4BwFLqR9xw9n+mYOoil6+vYIUlNP
	O/qsqxuSi7+ztu82VMWltFfMcu3V8t3g4PsBFaSInukNG0Eb7c4mTL75OppInLGWjp4KFeYU1fa
	uX5NV0gJmOWdTilJJZzP10qXqVq69g==
X-Received: by 2002:a05:6870:b0ca:b0:475:a112:1276 with SMTP id 586e51a60fabf-4a83f5d3533mr5799677fac.35.1793107074123;
        Tue, 27 Oct 2026 06:17:54 -0700 (PDT)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b74c0a7fsm23412fac.2.2026.10.27.06.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:17:53 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-pm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/3] Add Cellwise CW2217
Date: Tue, 27 Oct 2026 08:17:48 -0500
Message-ID: <20261027131751.1724448-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the Cellwise CW2217 battery gauge driver. This driver is based on
the sources used for Rockchip's Board Support package [1] but has
been updated to use the regmap API and devm helpers.

[1] https://github.com/rockchip-linux/kernel/blob/develop-6.12/drivers/power/supply/cw221x_battery.c

Chris Morgan (3):
  dt-bindings: power: cw2015: add cw2215, cw2217, and cw2218
  power: supply: cw2217: Add support for Cellwise cw2217
  arm64: dts: rockchip: Add Battery Gauge to Anbernic Vita-Pro

 .../bindings/power/supply/cw2015_battery.yaml |  42 +-
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  |  21 +-
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/cw2217_battery.c         | 818 ++++++++++++++++++
 5 files changed, 885 insertions(+), 8 deletions(-)
 create mode 100644 drivers/power/supply/cw2217_battery.c

-- 
2.53.0


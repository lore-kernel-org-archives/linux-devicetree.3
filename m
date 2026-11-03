Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721115;
	b=eetAF65pImxwjL+9FjKz6JRqJ72uh8/WdNLAZTPXrxIrKHBTkN4/BL/w7hbY4bAi/DdU
	 iAcFMuXSbsoyXtMgmHQZmhQqVfcOd3w75kBBCo7kN5bR4QuS79yP0XkZYjKFDzNTlkbim
	 3tCvx79iZeNCNdXNPID10xfjPODkpjo49QE5l2NYYo7d8jfuxrgL+8zYMTOMeRO/kgy0Q
	 MLAJJWnXmWbm5pTyzf48wvqIvgfaq+7+ueCOjo7aaCDC6ODVSnSo8V1Brjjj/KYqBK3xk
	 FGZTUlT3tgCGpwwo9U55j9Cc86pg7K5NdycywF4KUiZsoY/swEiOeXZlUOSxR2l6OaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ElunOHsCbJmsk6qqG837NqX15fcbk0oSvq6+bth2r9U=;
	b=shAtf6dh/MGfm4F6R2H8oUwmdhaQApqm0vwGDrWbAg6xM9GxR9MqPtLDT41eC0HHP81i
	 QVutSfyPe/o8XRHD1mb74Pmb45Ie4nPDudoGXLxcuTdqkZz/G6x3HUM/Olwv78ltUGh4E
	 OaBMK6Uytf4Dew3J63tXfgOcec00BzGH2ecZc3J3nIrL1uhCPNVeYJJ8pZFEvRYValop1
	 dofZuqKmycWjEhsPXEkjBwNSGw3JcP0PaWOjVgez6tUXB5nP2tLKveqr2p0duvj6GQ4kJ
	 gWpgih4I/j5c+XeTxQ14oJB8mQUM4My3cBBJxDKTuECby74UcyayaTm5Yz3SykkjqHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=my3X4+Tt;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C56606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C56606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=my3X4+Tt
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso35524095e9.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721114; x=1794325914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElunOHsCbJmsk6qqG837NqX15fcbk0oSvq6+bth2r9U=;
        b=my3X4+TtDs+etsFJM0QPWkM4NeYyEbNHjCYNtWnJnUlBuQxi682Nl2lnTjOA35mrQX
         6HNYFaYg86KIh3nnQvpw26zuJthu/MISqFjldM19hSY0VLKfqwuf2ufqr4zQhNVg7rQ2
         hDb7buElKYxoOVIZS3F9b2fPTL2VWXGMVgoywQj0oBxKqThU5l9JzjL8UtUAZDAR4uUP
         Y58h8Pik/FZqlPNcB4czEP8KwWH2a+O9XNbZA5xMo8esnijDlqYhV53efebJ44um84pC
         tlI7Sy15vS6QsqlhNMEeoBm3SP1ogWRZxV0Z34LENUdZGvBsxYhDD+1w+aLjHyP3sbSA
         0pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721114; x=1794325914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElunOHsCbJmsk6qqG837NqX15fcbk0oSvq6+bth2r9U=;
        b=Lh3HZS8pJw3ekba7rHrihwWVZwVVOi3zE7iUwBSQLQMBICtQ7zhaTLCXFAhY32Aoz2
         NLH0Z48OH54lnsHx1bdzOB3RqaDVUjcJYGJdyFuNgFAfWI7UAeBN7yl96CalcLDQfotv
         AXQiOx2fmyydhcSrQCiByUrk1r9LnfdfOZb2nutS4kBZjvV70IQwuopaaMimvriRyU9L
         p4yGZZ+IZ5nqXogtPRAksyJfA+NFiEwGf4Kasj1iCpA2sQ0CQ5VwgHRrYRK5AJbrL+aU
         ftVe8XboTa9URr94JtMcjWyTab6YNafck+/5s4cMCSTUUjz8MsnYIn9eVp3ZrMiKwPTK
         q8qg==
X-Forwarded-Encrypted: i=1; AKwUvBzEKEhhE52HLehAHG3EMmOMkRwtSOcWK2+oVxedhxUxXUyMmnI2CRHluAsc8mBvLSiN1//ntxxLAZQw@vger.kernel.org
X-Gm-Message-State: APuU4Z8J7sFosTKgjhr6+CBcv2Sl0u++ToAiZjqM5GhCduddHRXXy5IK
	mkKpFn+3SDqypOvaiOJGIAG4G6LoSsNd80w8vuBbdZtykUc9YlV37dHBssdJ4Q==
X-Gm-Gg: AYBFou0U0vK+NWPMci6jDEOywcyrfbGPrvXZRDiCztQBU761q8QmNueTILS+dzZ0mBb
	Y2d4a0l/JeKI2C2YRjP6uTLK/z//XyCQ0rtr7IOuzOhrRE4l7tHaA2C7GfTGu8RDLu9U9UNGq65
	3KA7C5//Xke6nxKxxBbpASSWGONKctOEwcOmYZWTmdBQ3LmbPZc5u4spU7108BzpClB6foWYoPJ
	Sv6iwIvYeWxF6WTUmqY4PYOc3u3cBKMrv2GglNPBLtqyIsMSC8MM6eUAQZlhL2klW3pV/P+i7FU
	8gUu1exOqKiIs6LRGsw7SN1vlBsfPw5nyO8QFJukYD8lxi63lAwoUyKrpOAtRxrDF4f7xXHRwtW
	+c4eOFmcYYC6Uz7VK0qOZOrHt0dCDUBC9Avhaf8cs98pDeDhwUxJWNuUevcnmVGtewIKFQbpV2B
	T/Je5nMetbJpzsQB0AQkd4EDaORwe8s0XPZT9uH1f8z2yZ3jappl6C9bgKOE2kXROFVTKp5VuLA
	KwZgM7xSuAx4joE01qi6Lec16txHDuasn/FSHBD4E9p7bOV9R1WboZsN5XCjSOtDFMwm9uI8jLO
	kurAehWzemIWEruYN5F6fLg5cz3/Tn8aKzeqdxGS9l5Ivvk8enYCkbJKBbkPY7Yodx3oMZHcD8k
	g1470cW953OlF2/89yvJYnws3swPulKaU99DndjdTA/Kxn6+pCH4h
X-Received: by 2002:a05:600c:46ce:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ac18a88820mr316895325e9.33.1793721113383;
        Tue, 03 Nov 2026 07:51:53 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm25680750f8f.46.2026.11.03.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:51:52 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luan.r@variscite.com,
	alifer.m@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Johan Hovold <johan@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Fugang Duan <fugang.duan@nxp.com>
Subject: [PATCH v1 0/3] serial: Support driver-selected TTY wakeup defaults
Date: Tue,  3 Nov 2026 16:51:24 +0100
Message-ID: <cover.1793719239.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

The initial goal was to enable TTY wakeup by default on NXP LPUART ports
marked with wakeup-source, without requiring a userspace write. Instead
of keeping this entirely within fsl_lpuart, this series introduces a
common serial core mechanism that other UART drivers can also adopt.

The new tty_wakeup_default field in struct uart_port lets a driver request
wakeup to be enabled when its TTY device is registered. Each driver
decides whether to use it. This series adds wakeup-source to the LPUART
binding and makes fsl_lpuart the first user, setting the field from that
property. Other drivers retain their existing behavior, userspace can
still change power/wakeup, and serdev wakeup policy is unchanged.

Tested on a Variscite VAR-SOM-MX93 with a Symphony carrier board using
LPUART1 (ttyLP0) as the console: with wakeup-source present, power/wakeup
was enabled after boot, and the board resumed from deep suspend when
Enter was pressed on the serial console.

Stefano Radaelli (3):
  dt-bindings: serial: fsl-lpuart: Allow wakeup-source
  serial: core: Allow drivers to enable TTY wakeup at registration
  serial: fsl_lpuart: Enable TTY wakeup for wakeup-source ports

 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 2 ++
 drivers/tty/serial/fsl_lpuart.c                          | 1 +
 drivers/tty/serial/serial_core.c                         | 8 ++++++++
 include/linux/serial_core.h                              | 1 +
 4 files changed, 12 insertions(+)


base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
-- 
2.47.3


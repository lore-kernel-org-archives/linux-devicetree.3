Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918007;
	b=1I/gWJrEdtEUYeECDCKyS7daX9uM/oRPMNMNdTF7jff0BABvk8p/bZPfRCD3cv8XLBsn
	 9VB4kxgSlIoKjXmnJihgbPALRF1/D1n0De73prDAoMk81fOX2uj7A7d9uOJLhlNjh66KB
	 5tWSxuirnOXyHd9sKxEz9q5tlJU8jmoV4krkIaOWs0dvJlNjMhzRDsa+OnUjAm9usTQv8
	 OSZcMwc1Y3jf5CnOpRTwcl8DvJG+Ngb8k5FhDp//X9FUyDT8uh/6JyUTMZ6q8FiV5DI/P
	 sYL9K387wcFY3P2UVuY8y9iBC7clMdJAbVdXTpPXtVq+qSYNZdYBHTJeALbrONHGW9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DZJtOePkQrLq8/ateRl4kiNkEI0jrsHtDIwcRKpyDC4=;
	b=BienaXkUOufXkNpO2IpAKOxDrc9TT/vq+lKC3RfwDz/a+8NHqiAoSwZVG7iJ7j1Zcmq0
	 er1D1tniG71xY95kpQRyXQl3xWjYSwzRSSni2nrQiCsOA8zYyJEoQOLkyb2MMqX4zOR+i
	 7lP4ptE9rKF2IM6be8edXxQt8JvCO71dShWlx+Q3RwQLPqCik/XkHcrIey6WindNypdYG
	 Udf5arEf3sFBw9IWSz+GPnIVxOZjjfSJjyJf8BlxijdCAPCcOJyRpD0QncSWdXqEAJXXo
	 scKqTGeWFwg1N55GMfmvGjLVijgzlIvJHbH5mP7mMxLYGM+J62VbbQpyH/+HHiUvykQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sacsCAWC;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785E5606A31F
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 785E5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sacsCAWC
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso21671715e9.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918005; x=1793522805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZJtOePkQrLq8/ateRl4kiNkEI0jrsHtDIwcRKpyDC4=;
        b=sacsCAWCmrTu09sFa9ikOphxuUASQYHVKM4+sRpN3oU2QRipbZ2KT7R5klNZ5NVSpn
         EYF5PG3vg855Hpev/RvIRupc+rfVEAop1PtZf3N6dLpU/awS6cMRWyb5kX5ze9FLkXez
         /cl7HIK7KKreXDACoIh/vIHGt+861Gq8/SJxYtxH6tDT8K+4K1mGRjaT19l2kyPzuBXB
         8fYRtE/ENWgC2UL75Tjivj2lakzHDNUKTC+zfGGZXs/a1A5RrutEubIuqHhCXlbXNpT8
         /UWaI/frABxR2jsybSGBrdzxNo1MseEPckhm9FS910fnwZWfNR5IMMi7iZpXEjqvOoF+
         RH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918005; x=1793522805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZJtOePkQrLq8/ateRl4kiNkEI0jrsHtDIwcRKpyDC4=;
        b=aP/+iLOzZlMw6P1GtMLbBNZc/0RzhzdjSN+qywdLIe1ximRHEH7ls7RyH2Nqs7edzq
         tbFbCdJSeUEiovh0lEsue56iwvqF+xgKf9pZHqPxvx3PqS0i+1JVAwKjQkcJNGlfTwdK
         AAqLRhde5b56PxHrpw8f3Zui9pU9jztnf4sO/5TXHN5ABExL+my82Le15oIDB08o/ztX
         sRTr3Zj3UWUW1wF5TWDnSN6x8atmcTxtGPxGtaaeAlEm+TCA2zyQKeBGaeZgzWn9XGGc
         ILGJKFSsnSGBempNsdbhTFeXelCZWm+seYldbeQggdd3MCD4jd8bYRAQHKI0w00jLR4/
         ZIzg==
X-Forwarded-Encrypted: i=1; AKwUvBxacYU8UNiqLy1ldwQ4jug46t0WxsdhFxdG5cOOXvNolmfm3RKZFJ38d+vlKmdvyy5kM6jAXnvhqnqa@vger.kernel.org
X-Gm-Message-State: AFq9FYJBKDXmc/Aj5xSi7zCCVjg3Ma2+QbTMcK+wHboQR8oYY/KwYQ5P
	0MwMxkUjjsL8RZHu3+USPC99Yc+4bd/5nH6XvbURDBS/XpudGy0Wn65g++94+gnqhPk=
X-Gm-Gg: AYBFou0KJjw5dFw963WS4+7TCCTMic+/+rgPke6DhgmjCc+J0K8cCO2riXRVyIj/5v2
	5Vk7agbO+bRqYYbXdjOLDkIOfmNlCcU26bXWzag3c8zTOMrvSSZAaIyn7FqsMTCQe7lgXf4jLl6
	mvat2WXQbPrblhGc7SXg28TyYWiBS5QsFf21HsLY5FJDLoB6R/nA/O32rylDXaRvKRjOmtSy0AQ
	N1pURd4U/BtgFHcY7+RJmcMjHM2+SnVKvI2Gr46xJrS+YbSWSRUzxUVtvkHtlsQTEo0CkWvciGe
	KUhiR2zKphjUvUV/3S4fi/fBbhq0mKbJN7lTSQCG3O6ahgKRo8EjFLZuoWgae4m47IGX4ZagXZx
	SdjHEoYBEE9PlXCjh8LTvN8MOMRjUm0Z6pXgNexP5OsLOAXhqwZEWglyUO3iJ+ipqCtsKsEANLH
	1VrDN3asbTZkrN34mha6E+DloeN+Vj6tKg2gFx+wTNz8ZNVyPytFe5pdtIUpnGEMTy5GP4cxQjv
	EGrsqSudkDqDWSXEJwJFbyPbdHtGNz8lFEWUP0Pyr7ckEr7eqChVT2qlScoknpe8mnvOe/DmWGz
	m4InEmS6NQrAlsP8BW8QFxbrPKYx/B5Wfaoc5l9E4xNR8t9gzATk3bcU7YV4q0ghe3kpeSBtYg=
	=
X-Received: by 2002:a05:600c:524c:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4a35ac8c0fdmr68412805e9.7.1792918004829;
        Sun, 25 Oct 2026 01:46:44 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm8616707f8f.23.2026.10.25.01.46.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:46:44 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 0/2] pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 09:46:41 +0100
Message-ID: <20261025084643.93167-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The Ingenic X1600 has a PWM controller of its own, separate from the TCU
timers that pwm-jz4740 drives on the earlier Ingenic SoCs. This adds its
binding and a driver built on the waveform callbacks.

Tested on a HiBy R1 (X1600), whose backlight is channel 0, through
pwm-backlight: brightness 1, 25, 50, 60 and 100% give the expected high and
low counts, 0 and 100% switch the channel off at the right idle level,
and an inversed 250 us of 1 ms on channel 1 reads back as INL 0, LOW
9375 then HIGH 28125 with the clock divided by 8. PWM_DEBUG stayed
silent.

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time.

Olivier Louvignes (2):
  dt-bindings: pwm: Add the Ingenic X1600 PWM controller
  pwm: Add a driver for the Ingenic X1600 PWM controller

 .../bindings/pwm/ingenic,x1600-pwm.yaml       |  47 ++++
 MAINTAINERS                                   |   6 +
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ingenic-x1600.c               | 260 ++++++++++++++++++
 5 files changed, 325 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ingenic-x1600.c


base-commit: 00e917df050d79ac26ec700717680ad6421d2808
-- 
2.54.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814805;
	b=xBAnVPCaOebHqVTNwCYVW3ULMeEW/MbdSTHpxomS25uMFw5bFXZk4swXVi9kC5CYZM2l
	 xPn1MPBAPqaLtfgEe9bxY2VbAeGqrssJX/osziaRVvBUCS46pRTmR/K/WStUNEe4MVCMx
	 p5xExyuXlkjH/ZROgZSInjwNOuJm+OUC/14Cm4Jv5PSpeJkIFSB31T0BXpzSBZbDqPz3X
	 N025Iz2YrCjEBb6melVjexdNieC9TlvdZ6mlyl08P1vI3uwfjdyX60nXoq4t466r1cYwH
	 1gLolSW2JsQSA75jNGlxvsy/s+QcXEJsDueRBWYrFMabV5JLDgty0s4ugo6E3AiEtwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rKMBgpb0mxyP+6kb+ZdWDKHU+yeBE20Y58pj8NkP9p4=;
	b=SFQiUSRQgfeH/wNNrsOinAsr0PsouPZlShWo7cb6tHKRZBMQEHVBXB+t1SgNgcg/d9xa
	 jozkh/vccYWd1EJiMR5yNIQ9PKcr4+H3mF+24auo9tBqAB5kzYMFNv36G4DbIWoz0YkMx
	 QBaF6tj00pouvCGl2gX5wbw0q5uwVoYUokmh9gkqfXUWDOi5zlJRvMXw6mL0ph7LyDN2w
	 Ble/U+NLD9OzMvQk+01NRUzp7W3P1Q35razoCmAEg4TrrwrFnoOWqaOu6mUkc5rABG6V7
	 9Wd5SSL3U47iEwTncaT88nz9fk4WkfTUR83KVTo6ha0+mpHteiNLW4k3xyrkCoIoCVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mojDRsKq;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46EB60A263D
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B46EB60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mojDRsKq
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so5470025e9.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814803; x=1795419603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKMBgpb0mxyP+6kb+ZdWDKHU+yeBE20Y58pj8NkP9p4=;
        b=mojDRsKqwRrJVUQ5AuDQp92qQp6ai02Mt7rBOXHrgEvaT+gJ1zdQl1Ey87DJi+FYgi
         0sHEMpTaur8fvoBkWjwVO/PRg5JU+6NUw/Bdy/elN9fbPjgtIolRr6zunPblX2MdQRXH
         3Pf4N34SDEvwXAOhzNj49/roxN2DTi6bIiDoF9GLEg1vc+yOr/yKZz+dCddpQWF4T8Dc
         HwtB17SMeTjl8gjSpOAFSnSnukq6ih2u9cB7Tpr7h641/dmzlCENZWP+NSV+JA3/uvaY
         PoPf+lvIKkYr/sq8xjxz5mJ4AFCAPqC8aL805+aiHIyJIjFJFU9KDDitp/53X5L1ns5y
         vjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814803; x=1795419603;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rKMBgpb0mxyP+6kb+ZdWDKHU+yeBE20Y58pj8NkP9p4=;
        b=d17/C27YixMXedbkjdnl9BwCqGudFGfJKCGKh+CAY0glPi9jYPuLBEIM8NL2ikKj3V
         bHYRvmWocKHj/VbPRwS33/cx5sxy17OLQ9pN+m8ErKzg7ks0i9vQlWvcBViFQlOt8hqd
         JZW/bR4x9oxVUJnkgjigNtfUxzIPRMhULC4RWUSykhBXVndXmq1g/oBbYIeCObhX5E95
         CYsj8atFG70W64VKw5lWHQIs2uOyw98qPc4eTyROQ0V5cedV0RepMmtH/vrmrcBL+3S8
         NgmQvH6ufi3HAynVBjjIkWxsKSBj/Z//S+A3T2weSLv65jmTnLCz+nB/2PtacColf5ks
         Bdsg==
X-Forwarded-Encrypted: i=1; AL+hErHPwQGBqiRJW04JAy184feio5Sc2FN3l0buZX3MLvzqEB1+tiJkAfZCzXx0K2/uyyhazw89Gq2to7sj@vger.kernel.org
X-Gm-Message-State: APuU4Z+x0Ff+UN2Z0g/CTMAzweDeROUyqXuNh+uBDYkrQ0j1udjf66EJ
	D5beTtQ34oIwPaMMzEZGXioOdAHkJytWttu/C9AWrUowcuevsEUiSO8U
X-Gm-Gg: AYBFou26JSBUO+DeryUYxM0bLNbTqkPD07e8qnyyd5gU5BNeyWPNZbWu3QHJhzpn0SI
	LADTNZZFdtF6zG0f/ukFCiMVasM/3sIam8BdrVtylvp0xtwnXaxYpNFAKAgOyDVQ1/V6/C8MW87
	lPjHgVOML8fUjaCZtdVkqp9JbbkfS6Z+YDmqeBO84ESo4YXD/llkiDEKC5xa6lCJmPWLWn7ZrKi
	DpNRQdkvjmPJMa+LXSxWu80ZJ/C5/cWUXqftROnh+Y63tblXiv36lRnees9Bj2Zu25CiphhVev7
	+GB4uy4/QvTLQ/VZJsADnxbSR24y+JRiYC0H6TruDkgPxAtHT530nO35EuHVe4k7/K/AWMJqzUP
	6B1VKUlMwpkoUu9VmjhF1cU2t3pVfjCtV+w13iPXnMF1s4yIlH07hok/FTZxiA7lxFhMzEy18li
	L5/Tru8LRAFo+3R96z6pWUEijl5qvg0nCQLCqQGz2fWmHnwXHJbBIms2W2n2DhODCnxhrLwxzMh
	O3UvpxJSkCjs4G8iJQqYIjBns8eYdqsWaDOYXfdoEhd5bNg42bODyjfS28VXFwdX9gH4n0NpCua
	Jv4uH7o2k9lIARSaiVL3jgsDOoPHgQ3v
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4bb55a99ed0mr197499175e9.24.1794814803044;
        Sun, 15 Nov 2026 23:40:03 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm20354115f8f.35.2026.11.15.23.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:02 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 0/3] power: supply: s2mu005-battery: add S2MU106 (Samsung Galaxy XCover5)
Date: Mon, 16 Nov 2026 10:39:57 +0300
Message-ID: <20261116074000.355176-1-tadilhusrev@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds support for the Samsung S2MU106 PMIC fuel gauge to the
existing s2mu005-battery driver, for the Samsung Galaxy XCover5
(Exynos850).

The S2MU106 fuel gauge shares the S2MU005's direct voltage, current and
state-of-charge registers and their scaling. This was verified on an
XCover5: with the s2mu005 driver bound to the S2MU106 gauge, voltage,
state of charge and the sign of the charge current all read correctly.
It does not, however, share the MONOUT average-monitoring path, so the
S2MU106 variant exposes only the instantaneous values. The XCover5 also
does not wire the gauge's alert line, which patch 2 accommodates.

  1  dt-bindings: add samsung,s2mu106-fuel-gauge
  2  make the alert interrupt optional
  3  add S2MU106 support

Based on v7.4-rc1.

Tool usage
----------
Prepared during XCover5 mainline bring-up with an AI coding assistant
(Claude Code, Anthropic): it compared the S2MU005/S2MU106 fuel-gauge
register maps, drafted these changes and changelogs, and ran a live A/B
comparison on the device under my direction. I reviewed every line,
tested on hardware, and take responsibility for the series. Review
comments are welcome and I will answer them myself.

Adil Hüsrev Tepe (3):
  dt-bindings: power: supply: samsung,s2mu005-fuel-gauge: add S2MU106
  power: supply: s2mu005-battery: make the alert interrupt optional
  power: supply: s2mu005-battery: add S2MU106 support

 .../supply/samsung,s2mu005-fuel-gauge.yaml    |  7 +-
 drivers/power/supply/s2mu005-battery.c        | 71 +++++++++++++++----
 2 files changed, 63 insertions(+), 15 deletions(-)

-- 
2.53.0


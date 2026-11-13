Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529968;
	b=R3+ajIaRKh7cI5QS5wVtaanIduMire5i4NQJhZrWFGcZAPsp4gQ3MU+zMWdgsKMcZX5W
	 kEyEsD35OaaF4D9GV2g0MLQByqwieqwc/cu5vUG70IqdN+a5Zl80MUNXif9viSqj6Mnqe
	 L3ACOKbjqapsiZXJlV/6GVjBm7cQ1sNhiY6TmY75OafH15uxb8qr86V3IPBnpeT46B/kC
	 +yt2/N1TN3xHB3PLqoZVGcbSyeVVG+lCC7cPKHhGCFy6jmX1I7UOF9hpKopazAjJd6fSb
	 4oKbmsQ+SH0ncp/uYZEV/ysgP/oPjXFXSdTlYfET4JyUQGxWn3sKefcPNvuXwTQPmCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=;
	b=EsAbSQRW8pdcn36LqkPNbO188GDdY1Ly/psumyeRv3qwton0j4MGxnVttbid1VdeDWW3
	 Dnt8C2+YgGsAUwQPaCmXJg+za33iWKaHnB5X5kDU8LubWxMx1rGFOTplaz45WzjIpmQse
	 0aNlm/LgC826nb2AR0i+lAtQTI25wWZTX5P6nb2d2+jdL0TLxFTr0XGmmhvfM6j7WTRMY
	 4dk7VjBrg7ttCEjs0Mjc6WGhSSHUEoRaoH/7s+5ccICFjcJYi/6Rbr+4GDHbsUzn8zLrY
	 OEMA9L1L9HjneR4QWh4SIO1BIbKLUr1JO0ArqfewHeK3Ho+19aqIfHGiBUsyZGcYeeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvkGxqMv;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2C660A383A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B2C660A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvkGxqMv
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so4865865e9.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529966; x=1795134766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=;
        b=lvkGxqMvQWMXc64vEm/jNDjeM0AM8DCieajGiUbu3tQbvfboeSE3huEeC5Hv/fbz+/
         IP09rQsngUi4srwf0Un8zbenKSg54mNjc8SM5lLmwrXzcNIHAbOxBX0whBaJhOFig/N+
         maL08dlo5PQx/GuUQ2LtedbHVXiBhJEgbi8xh/7cFJ5tAFL0iS9sJDqVgErE2WuGjRD2
         +4xcgn7XGFmJt4lTdKJDQKlS+FsLSdFS05LSmCx1JSjNeKj4RoeAyvz1qr54Qe7ERVDG
         WnwvnvRjwJ6TKr5Fe3GbEAcvtTjhS+sXN6GYo2r1L2NlnImngrG7T47XpzDFD5VzeKJf
         qOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529966; x=1795134766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=;
        b=2sd63xqg0y++dNy/lVkKETRF9Dc80DY0aB8BkqKlwQkA0bss+DNYVj+fIfzF4xmyqk
         k1xgIB7qb8cYrs7VdlPdCTMe+JN8nHeNvCkerM1bQtUWIp6koLMuuDt7Dme0G3sO6RFp
         PIpUVqZK6gPeb1Is1SP7lhuq3fdkqlnhVyyFiN6+AmwlHqnmKTnF4JToP1Cx2oE/704I
         Mh/EGkVBlR4CzUg7n33AQ9b1+KRJZfxkn5TIJGWi0HLeTy6yCOx4C6JAcoEh9TQcb2xb
         r7YAG1tLW27L+y+iWf8kRVGylq+OwdpNAdvemogEaa8iblqY+MfzIOcGywhI0PJopJ2W
         xIFQ==
X-Forwarded-Encrypted: i=1; AL+hErH6McN7YpmLBgUiBicjA2XXZ80KTfi29AnzEtfkMvLlSe+uRrZCT7RX+hQyLTfzkDNK4YlA0ZiZPgG1@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ii5eD40WuQsjt80AnvaEJsG3sw5z/1s+NhT01NQmjHxPfN86Y
	GCqHLrcOg+i5bG2n+eRUt7USIe/DdQNFqEV5BF/fWk+cHwLwQ1nMOTq2
X-Gm-Gg: AYBFou0QKOJOaU07bia3VjaYPIFs9v6V0mczttABRNYuHNorup+ZfDUdYUo30w9SRNe
	KLxMNY3NU2kV24kk7atM7SV8yFupd5iJyB6vUpB6ERw2pPbTokwKpQcWigY9Au8MSuMnVFycXde
	/8u8rUF3SZQtaATpaY7DqkQ2/STXH/SUcYZGfgyo8T3fy9X+SQ+fgaY0YIXGx9CJMJcpHkuRueG
	2TQiByUsc+UptF5T/vjpOoZKpZ640Ty22eKDelOs9IQBjpD5Bg5fmjp8jJRfsEYsRP83Mp/3mfe
	fHXrp5QxNXI3+4dt+RKEZEkWEtK0iPFXKO4+yykTgL+P1TCpG8hgexcvwgnaZVFVjpghN9lCseW
	dh7R++cAcR5vqM2/3aQbRICB98KDh8AgELXHvWqkZm8Yt7FUKZnpsvfr+Qu/kiG90dQIQ+z0kUo
	1kjVJmKitbhhGfzp4q68vAY4Qt/iiLNTTgLsLA4tdN15kuEIq/hPipkC8SxFPY7TSfq9vGdUr5L
	jZhK+nzPoESbSUVN+4fAzzN6pep9EALjyGbXZMyxROWOSkiWfzgwAlyb+j7Tmm6LDRy38uTueMU
	N3b6q4Tf24lHNK/9a4pT0zpt7CKqcOWp7p8oDY3LYSDscpKm/UikBMm15vXplJn/nRHusmvcleq
	RZlZ8Z6bXZoB7JzN2IY/uvaegahYjp4nDiNwiVYFmTlCNMyVCwMBotn4=
X-Received: by 2002:a05:6000:4917:b0:48e:2114:8ab9 with SMTP id ffacd0b85a97d-49c71d47601mr2274012f8f.31.1794529965915;
        Thu, 12 Nov 2026 16:32:45 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:45 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v19 07/15] net: phylink: add capabilities helper and track modified advertising
Date: Fri, 13 Nov 2026 01:31:57 +0100
Message-ID: <20261113003217.197757-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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

In preparation for PCS release/late attach, it's needed to introduce an
helper to calculate the capabilities after a PCS is removed/added and it's
needed to track the advertising in link_config changed by the user compared
to the originally one calculated in phylink_create().

To archieve this, introduce a dedicated advertising in phylink struct and
update it when the new phylink_calculate_capabilities() is called.

phylink_calculate_capabilities() will then compare the advertising saved in
phylink instance with the one in link_config (that can be modified by the
user to disable modes), compose the modes that are user-disabled, calculate
the new supported modes and the new capabilities, update the full
advertising in phylink and restore the user-disabled modes.

phylink_create() is also updated to init the phylink advertising and
link_config advertising.

linkmode_xor() is added in addition to other logic operation to parse the
user-disabled advertised modes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 28 +++++++++++++++++++++++++---
 include/linux/linkmode.h  |  6 ++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 918aa95e5a64..9f9715403215 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -61,6 +61,7 @@ struct phylink {
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -715,6 +716,27 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return ret;
 }
 
+static void phylink_calculate_capabilities(struct phylink *pl)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled_advertising);
+
+	/* Get user-disabled advertising modes */
+	linkmode_xor(disabled_advertising, pl->advertising,
+		     pl->link_config.advertising);
+
+	/* Calculate the full supported advertisement */
+	linkmode_fill(pl->supported);
+	linkmode_copy(pl->link_config.advertising, pl->supported);
+	phylink_validate(pl, pl->supported, &pl->link_config);
+
+	/* Save the newly calculated full advertisement */
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
+
+	/* Keep user-disabled modes out of the active advertisement. */
+	linkmode_andnot(pl->link_config.advertising,
+			pl->link_config.advertising, disabled_advertising);
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2250,6 +2272,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 	pl->link_config.pause = MLO_PAUSE_AN;
 	pl->link_config.speed = SPEED_UNKNOWN;
 	pl->link_config.duplex = DUPLEX_UNKNOWN;
+	linkmode_fill(pl->advertising);
+	linkmode_fill(pl->link_config.advertising);
 	pl->pcs_state = PCS_STATE_DOWN;
 	pl->mac_ops = mac_ops;
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
@@ -2273,9 +2297,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
-	linkmode_fill(pl->supported);
-	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	phylink_calculate_capabilities(pl);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
diff --git a/include/linux/linkmode.h b/include/linux/linkmode.h
index 3b9de09871f6..a8290d021994 100644
--- a/include/linux/linkmode.h
+++ b/include/linux/linkmode.h
@@ -32,6 +32,12 @@ static inline void linkmode_or(unsigned long *dst, const unsigned long *a,
 	bitmap_or(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
+static inline void linkmode_xor(unsigned long *dst, const unsigned long *a,
+				const unsigned long *b)
+{
+	bitmap_xor(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
+}
+
 static inline bool linkmode_empty(const unsigned long *src)
 {
 	return bitmap_empty(src, __ETHTOOL_LINK_MODE_MASK_NBITS);
-- 
2.55.0


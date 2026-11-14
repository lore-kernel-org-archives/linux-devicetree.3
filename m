Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653089;
	b=pDudT23FlvL2VnEhBpX8zqQLMintzszekFW07jlHh67DUAL3UU9nrZN4GNtHK9cCmYJJ
	 7eTwFnGl6odwmL63UguL0oAGCP9ziocgVhi9Y5uTBminFJFZSBXp3/i4kS+YQEWLaOkFF
	 KfiTSaKX3XT6sfV+KEZvUY6Y1KA56J5F2Qon+5gI2uStINLeFuy8cvu0UbWqYQusd/2op
	 OJhH7hEj9yFhPxlLt6LIu8ppSXorFhaxCmO3t9bfj/QFODFzhhp0gPLASOEGJ+S2YtJdN
	 NI7ySGVCRLp5/Sx4yIa07+NkYW6chRx7OaY465akPjbBKRKck7ca/zOSg445S9E9x1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=;
	b=HCCjAb7S5+dppLprMe+6gBy3mLipbYg5sf9mkTAMelHkg/l/ce+slj+HXvigcWxVj2Zu
	 WgVHywF/uGI/jkL88Fxpl9N1htfjeD51VqmiVAwnCHJxgvTL7mf3oFoiSKnWXb8zxpkSf
	 ApI3iivdctzBrzNq/spHE6op2g0WLKl9cullqPpQo2WkLHLEiSXajDZGzEBNznVWFZ6aY
	 Y0Px6j/wCFQQrAna4+LSO4sv167UaHvmaNdVYPykeAtzU844Azwd/uc2MqU+2ivUpIEYS
	 wgHZX/+sLc8QJVGu1mmU7PJ6yVFj5A91aBzFR+YLqiuLRrAfItYKToCn4J6MQFG0I3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4grN1dd;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55C260A5BD3
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D55C260A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4grN1dd
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so832628f8f.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653087; x=1795257887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=;
        b=B4grN1ddAxi7Ixp4eWbZq+F6Q01xJI+b/QqS1WMe54DzHVFq2qwOjEOOzzbpyZWPbg
         93q08kDZO1/zrYpCtnPeykw/27SQHpWcHGbN4etXdjPUG/IAFF3xYPvi+RdecRsX6QYe
         MHB0luDU5jjMIjnPZJLhvnW5JKkN2GUYD5c++a4tbnjz05M/UDynAheFbbDm4dbgFHFr
         GbbDaps9530Fgb4dFtvatg3dkBR4vvTKzmJ2lwvpXcGMjTbaLtUI/AsCtHjKDGwbyXFj
         63RnW0RtXNqo+HEOHTh1JaefThtPSQ+qdUqcA4wQfT/VDpDasHNu5zFNw7Kg3yTUJAaZ
         zq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653087; x=1795257887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=;
        b=1T7KRHPscfQGjN+8A2lHGuSTjgXB5UVA3JwGjWtKUuCLeekg8U/v/VaKdXg6b3we5+
         xZ8IK1J62nxoc/Y+Nf3TaVdQnnLfBQc3fW1wZKztznaltHGs4vCg1+MiKVqaY9Qgr4yT
         n67TEH2UBQQBo4lleKA0MQvpyQD/Zx847CHEmmWvaHMtSqU62dhdH/aOGnlSda+oV8EN
         mI3eb7458vbL/aJnaGgw4686AQ0XGueeaIu/mN+hHMTFNPNImdMKRxfj0LbP9MQuukaX
         +fEdacbxiYvArlg7kp+h5k7USFWycY8XopL5m99BJ9L+ZyDuxD1ipzMTa0KedKnPEj2U
         fPqg==
X-Forwarded-Encrypted: i=1; AL+hErHYt4fC8CXSSuU3ow2TXtP2xlHoF+WqX8ez/KprJ3T93ZW4PwD5q7dy6YgdhrbtHag5Bpt/UEs4kBc6@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZGFTozZ4Zk7MxCOdlVv5/UikbN31PKNj1hf/Y6SAG1dQftb3q
	WHHXprzzlFBY+Xf6eE1S7GyUgp4rrOY+Ii5YAVODTGN3IhbychfuQYsQ
X-Gm-Gg: AYBFou3nudXlFEs3FqQJuFj4ZaKP26OFcEgTG3Ha4CXsB8qxGqBx9hIrnHvs8AIviyX
	w5nyEwYSwlkGcuCXh1qNUVPQfEkz2Akx75DmeLvtHCZIrXQwIRfbW9l3KlVh64w0u2R8tzxDuzq
	hdLXffK5qkS+JBjhWrVYmHji8Ff1goLAEWQKQl2/6uM7K88KtCPsz81w/uL7q71w7SE4WgUILo3
	gFnFIAUaBqunjp9LsIf6m3958lcOf05VPD55EkvBaz0I8y7m46ZKuElrqR0oK7DmQBzikiTysf4
	HU3hVePPKW9nDccZaE3VpgRiXoiQbCj+NugvaGPfoOe99esesjMmsU/zjhAiFuQ6DNZh1T3sGVv
	WHANu42jmMfVq9bAXkQVh7ia7bOBNUz3DoBYnEf70W2yn5WZoVOdjYP+Twcqs6Nd2EiowtvpzD2
	h0E0aCksdb53S87CgWJC3MnH4TuQwRutWYqoDx3VqebjExU7WllIQnEqutoGXO65VtqZUBZpxhg
	UkzZt04U5xjx9Uc4sQ4+3u2AJP/61Izr7CVGZ3zRMwoOXszvfKJ7fbkOaBXLXUIFIiXPAJ1KEYr
	sULvFjya5cmqm2ksuv3uGkXBkExa3DsCkdHxMWp3Hug7l0wtxWRsnKP06k5kqGd3xhHdH5SRYWW
	WqTW+Gyfv2PL2dYRhXPG9ItWaKuaRNh8M8w==
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr110359075e9.11.1794653087248;
        Sat, 14 Nov 2026 02:44:47 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:46 -0800 (PST)
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
Subject: [PATCH net-next v20 07/15] net: phylink: add capabilities helper and track modified advertising
Date: Sat, 14 Nov 2026 11:43:46 +0100
Message-ID: <20261114104426.235620-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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
index a7ec4feb950a..957241652525 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -61,6 +61,7 @@ struct phylink {
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -717,6 +718,27 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
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
@@ -2252,6 +2274,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 	pl->link_config.pause = MLO_PAUSE_AN;
 	pl->link_config.speed = SPEED_UNKNOWN;
 	pl->link_config.duplex = DUPLEX_UNKNOWN;
+	linkmode_fill(pl->advertising);
+	linkmode_fill(pl->link_config.advertising);
 	pl->pcs_state = PCS_STATE_DOWN;
 	pl->mac_ops = mac_ops;
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
@@ -2275,9 +2299,7 @@ struct phylink *phylink_create(struct phylink_config *config,
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


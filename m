Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653098;
	b=K6FlP9t0ubEwT57PP/YIgLGpH34wklj7QG2maSvJIaXataF9AecdcWkb9OUA0x6ZYSPB
	 EzxQYkkOvF/es3V9UYoYRT3OBRH0RBq6YdhpIFmV91Rx1AG37hn1Rh34v4hIqKghtZIYJ
	 lMBjWyHg2/jAMewuCaPzAnvnIyvxpjaYumVHD/YHqljTD4hwuXUHK/9zOw1D4hMt6EpR7
	 hJfkS7SLEmHtFV2rZ3LDObHCcvwUwoRWb7OPOwTvL6tffjzJ4fXqDO2SRbgbdajm6tiTF
	 H9+L3RRQ0QW5kaPRW1D6qmw2jNu+pROa1SLRO1CiZFKeUg6FwfEh28DedvELkHQDyaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=AveqzbmzKXclJWR/13rKd3ZMEB8kaeYUrHbnsLX0b4m89exrnWzQKOH/v7Mn8kKrExl1
	 8zK9lM7lN/b16J22X0n4T2n8/HugIrubXvYgrMhDhyYXdNGMT9aIuHTEBqVl7lNCtc8r9
	 U8OrImZjqKrD6pPVFYLGEb32vFTJwGThurQr60HHvzVDV4SBt5XMYf8QZSRaxXEEaH95s
	 +hCjxtE3j3KKXK/16L6RFTZ4GkC6bG8B/I41EgRVRGgYD2hrQ5BdyfrbQSRQeoc7VCXZi
	 IPuVrpRAp/qCXGsKfpeeCaGljb340Y3OQGzF+7nWa7UOix3PdbbDpzqBthkiN8StSdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pntf8LZb;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7096606A8B8
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7096606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pntf8LZb
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so14098275e9.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653096; x=1795257896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=Pntf8LZbqHpOVNNd/h1jSZzUejSxbTz5brbrkG3Tq+qe6YNq1BxEBY9d8GUioE+sSg
         Xw3DmSOCiVbkQPhvxxQ0o9r03NqpkIcU6OIFqUSdd0Mv1xrCQCygv9CfMdX/LI8iwqao
         sYht5dHs8vHj72C87rB6RlPbiYRxfZhlOYxN5P7EZzppWGI4wI69FXXpKTdJOS2pS+Sj
         7M3mSjyPHH48IdKyUCU6l879Fv43QlS23+qH2nLdwyLRuOD2hxZQsBX7lM2mpONYB3en
         m0AiIXxCvT5mi5zLPcCy03cIxq77yaHPFmnS3PBu+plfy7NXAyyC00Y9Nwb3r9NOQUSA
         VqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653096; x=1795257896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=NFjysNXlhUwMohFoQ1CenZll7Sq6IyffY4qY+ElmokmbmOtr8VDBfvFdOyrY9xrMww
         CgMKRvpNg0MWnrFImpkslbk2Suvwpyb3MqovVSiLgqvtYv8MNPlG0nnxkJPCaZgg5Zpg
         RTUqjBuoMVycpeDBAvlpeXXw3YThpr59JltH11H2XY3s5loV0DxyUYLR1MvxP2nKx7En
         vAXaH1mWp6x9T3W9XaO6aSG29TOiR5KXTigzZHAJa7krdqJmAvv6lMQx6z6WyAz601p1
         1Jpxj4+WqTgfYkktFvAHjmiAdJVz2RRVdqOCEL0en1oCYkgdt+k3dU4Y3PXhrMu33NpS
         HqOA==
X-Forwarded-Encrypted: i=1; AL+hErGeAOy2PsyAlvvTjfIXmZgmyiSPhekxJGCGa/yLPP0tg1OTKd7H9YzR0Z6+UUipMxmFZyNGMQSBGeOW@vger.kernel.org
X-Gm-Message-State: APuU4Z/IbvZVShTyRrF+2/AZj3AOfOPqMh6JVbwP1uIXOpmzoPePasf+
	pHw/RQjn5E1wBdWEpQfmrskBvdSdNmVV2CpwUvy3rgs43Dw6FoO7e+Ah
X-Gm-Gg: AYBFou1y6wfLp+EVpC1rCCzeIItnmBDx16byyOnW6r4qUlVIjxQ99Sgn85/HrbVug2r
	5Hgnq9IktJDaEn2jr9IoFt7DpO39VOH+tL5poKPrBQRLpv1LuQ5S4H8vIP7bm6hzv1jqfd6gYsd
	iBHZ7arv7nO0H/chKs67W+McK45/TayNVZFIWZkCbWR3Imcs3Xt8bbAOX5RcSDGTexHggEXWQBa
	ZtPn6QV2e8thC+soZZ+ivXSnW4Z+w2gXG5UmcVd8BQsvwPzwV2R58IPgRCGiZwKSN9mwJJ+sRUU
	inDUSNAgjRsmEk45MQu1dzvNFnX8pxmwDlUzEJ7SJ22+gl4Qo1hj96ht6TThmYwKl1qXxV5s7ny
	AISDWorW5nHc+lhpTv1b8j8hRF9fOiIx/+AGgKS3MPae+A8ZrcLUdGT0kj/KVD/VPtz6PUosuGt
	WCzfINLqFwFcdkggV04EZd+g8JYtqPEj74Hgs2uiChRnH0RpxQyKeNVRG/6HUVYc/rRb62/GwwH
	n9RVBF8FtGNVa56BBrYLCsYxFGhA7+UJwj1h6A8x4VkVLr38ck+yw9tzna3/c8BCAgr4Rzn4UJg
	rNzqS0H9SXkZi2olv013P6Dejj7rZnlGaZjkjZ6cc6iRlKzBZaPDTUlZc7SpsPSHIUnJWup2GP4
	+2G93sAzgouiOzupI0xorXCCvy1zSF0ikZw==
X-Received: by 2002:a05:600c:4e8e:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb55a8faffmr109717835e9.27.1794653096148;
        Sat, 14 Nov 2026 02:44:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:55 -0800 (PST)
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
Subject: [PATCH net-next v20 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Sat, 14 Nov 2026 11:43:50 +0100
Message-ID: <20261114104426.235620-12-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0


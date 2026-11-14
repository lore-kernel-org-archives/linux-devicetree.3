Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653085;
	b=UtNP4ctrSFmW73nF+HWmVCB7v+2PKTuR0OwjgNCn4uTcj4aXHgVI8NBNjyThWaVMCJMc
	 iU9JqXJQUmoFTabpW2rho7GmixavBv78cIHf0fJEp3Sewxlv9tI7UNewCPQ9qvGdTAvsV
	 s3VF3K49ApGtH7ZAwkBCgppgSTbELChLqwd9XzWV8fxlIcyhObAwm90FLKL/I5gpUiwut
	 hiJYbBwZYq0Uz3a+OrURAVo1DvyVYVO9us5i3vcv/bzqDLrwsXqtGl5YI616AayNxVKvQ
	 SCsOh3efMEa6B+vjUYZJw3VLGMTntSYZUcKq8kuTz8Cs8zziDEt4sdJ5UcESbdydYvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
	b=Vdk6KZlf77MAAR1rksosu/IfY5Sm/FVy+n8FauTip4iFa4/zUKUFbaVmFNmqdTVNfdqE
	 EaRjbOPH7sIdfZghKHJekeQZiY3rZHJaSEAOZGW8PSSiiFWmUxPBMmOH+pI3Mf7St3s5l
	 3l42FfLt/vTVSvjxx0FKAknergc1QTJcAVKBwutCnCpwxW9UaURPACQZVBAQsvV8Q2U8t
	 WKUE2O5lEIdmf5lVErpECfbs2CyM1Yz+gzb9ht58LXDJihb2LmhhHS/1jhkB6qi6ENGKA
	 ZlFRzHOUVtTvjE0henecqjW3rZSceu3QFgCd5iBwwlyW3lc1FzarIL2kDvGoujhaMNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVOWEp3W;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9128860A380C
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9128860A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVOWEp3W
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so14097675e9.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653083; x=1795257883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=pVOWEp3WOe28qHag/t5ZSnvAb/yJWXgEYMDc9O/AXCJJhNh87hjSurMqxSevp8BUPA
         47os7gAgol87q1XUkyFhP4KDC0Rrc0HKpC/MGriNoqvenaMsS33T+8IfzXvwfqqZqTZN
         Y+8IXGqhR4fb83HfwdqYMWq0iNgGQpv+ISOfWgGe1V8odOo8doM2JLdocyDkQ3HHO+XW
         /CKSh8dcfjaweQxN1sWFHQeDhMTXeZxO/O4nvPutektuHyQ+PxWp/gcSmKUoriJ1OLNf
         5XV0hBqrXgILz5Iey4nz/oJvMiMJSpqJUklTXmzCeJWuu6l6w97xx2/6sJd//3fxdqkw
         zqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653083; x=1795257883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=GSFhtzxbCZWmzPPSU+LRdYudAzb4PS0THiIZw5gvlVaFAZmirdqmG4hEAC0pWiFTCJ
         M8Vu74uNekR3oCiMaH05Sxg4D3GBLHRqGf4Ux24m/87TwK+zmw+3YOKLgCzRdRfvR/WX
         vttb7o7D4g6nIhdUHm18hYEEhoz342xmgFawpCWyf6sDI+z/0oMSLJFcvFZ3Nq7btBWK
         Oy6CuCn5Rp5JMItT/IAK/5qbF1Urixq7WBTZ9hrn9Hs221OJqwIQhCz1nP6JbSZt6kTC
         vHyxpTJS5f4RsEd+8qb/RQfDXrbv2m4YseFk6AsdKiAZpc0siCgV5PHbD4ql5PE6/P/P
         BGzw==
X-Forwarded-Encrypted: i=1; AL+hErEc0uHsgL5jRK0b28/zpE9rwsmkwneJt9WZSMzRrMmTdafuH9uWKdRcSZdFVT34WzmX4jJuHstEuBx0@vger.kernel.org
X-Gm-Message-State: APuU4Z/hFC3IlTGr/mOkbwiwWhQ2UFuVlArVYGvWdBJ9POZbUFv5RwNr
	Y0qonOwxXE3/nDXqL2LT/u4FAOimr8cvGvwpDF6pD1Uf10Dbwxoh8oDI
X-Gm-Gg: AYBFou1ry2nH88lD2/mFS6FzK3W45/B0DY0QRn5s3nHcD8IZakuI6J72bY0BmjB7iwL
	IsK/9TBMusnFeWaavR43KBw6/jjKLuE52YJFpTndBlAy3CXWipU5NGkvNeK0O8r/slzINSg2q5/
	5ob3U63y3V6JHmROcBk53FnchhKZ352QZfjn7b1SkzF3e+UQobO7VjiYZxAKyIJeUbb0Jc4jpGj
	klrw+Xl4cNgWdATpmF2JxiN00NlCALhyypjv1r0m52JVngfFWbd5TTJn6cJ2ONaZk6Y2GqvCS3K
	NG+XXyXWuGDCykD4Mdhnzg+a15NKmWaRztVX1f5UMH66TdPJOEAFK7I2BXEKw0UQC994Pl/q7Xi
	ykfVm0IPVcC1hO2B864fxqUR+fwc+0PQvObblQbaeKI+aAvN48QMPo1Tc0sLEX1Ys2dJM4fx6xX
	U4XdKFeFyeVWkUwo+ucvYSXXzXCdtPJ8S6vqtq7pUZL1WCJ/uVwwXmj/vOPeKQQkFPJ9hvkZhUL
	XOyhQBEj2uNj8L0V6G1yjAQMWDv4NJhXtLSHr0pW+Vl70V6ZLIzsDodyHgwiZkL1G2XQJnPhNs+
	OZJc/l14D3jp2UPYpjfaHmhcBCV3QQMzOe5ro5h35OM4CmCgNK5qLc+4+qdlZ9g3ljpyL+lhupH
	2hhyUfvD+zaw/r/Y/FXqhWBEXhwi9bEAobA==
X-Received: by 2002:a05:600c:6089:b0:4b9:ff94:6b7a with SMTP id 5b1f17b1804b1-4bb55a7ed16mr107792215e9.20.1794653082907;
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
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
Subject: [PATCH net-next v20 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Sat, 14 Nov 2026 11:43:44 +0100
Message-ID: <20261114104426.235620-6-ansuelsmth@gmail.com>
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 64b00d324988..e2e0b313fd61 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0


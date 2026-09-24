Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372744AE107
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290970; cv=none; b=NTG3cs65EMD4V6LAKWdtWQcWraQ4/gqXRNoEwGOEw4/OT/n23jQPW95hiwEPOUBcGUSDVmeWondauHdWlgngUMUKwnNSt/W7DdxVF97L8qPPZo/EtiEo/kzJdV2xReT1upIzpSvgUZez3HfeQKl5Suc52b89nRjXo0Taggt+5q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290970; c=relaxed/simple;
	bh=EUXDAGX3bnyzYv6r3b1FRXNkC8ANmtHE534oi8SYwWQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NfafxCDN9JEdiL7Ag6vddJBV9GFVNUARVixTFkRTSxkgYcIYbWbFCPqBonuM0y30oh2hWNrIjdVupNyby1EYujmj1P/eFLl+Ucbr6LsGoH3EeaphQinSuHUQdNfdGXiGo9uye2O/U1/9wbvz0eRzHcWB5fcmWD0Fh1LvWoaTBOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q36n2vso; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q36n2vso"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so2618665e9.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290966; x=1790895766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=;
        b=q36n2vso7xVZTTXKCe2TFRFtCsASzx6B0cRhD9VjayT1RTplBD5ZuW4gOobYWLJ2s0
         vhnZaY9dH76ApPJLxpwXSGexmTqSPY274zrHi9Uks9ITTQuXfY2m+djBHhHjPTtpAmfw
         kkIShFwEbJ5e1F/FQexjcvpf9vQBm7k/g4jqdaDRfJ89Y/fYfLX98SazR6mTHNzuJdMN
         vQMt9PnkGG3g6pYFqc53JPPsP28KBx2l/Vxzu6QuL9W73ulm4p+CQokpmaG+2ooteWIu
         dD9RHaIJpx5/yK9EXQz2OfdKnojlnOgXHDbB776QqhckTXTqg7c8y4Lv+nljMioOLJm2
         iz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290966; x=1790895766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=;
        b=FdUnHlXGYaaAJzyz1+YTPTzxMnjFIaI4LBa7qvyNv3Ni33fPDWV4UxQWrUtcysid9G
         rm/5iexhgbYj0O3ja9UbehyNNDIffvyggbgNXDDddd/qp882FAeJ13afp/D/UjGCCb2W
         tW3/uPFHfAYvnmfyA8fZ0wSXKG/+cjzldlawjKmmqg+7IPOol+xlmfkRs5+o5ynkh2YS
         VLHlUIi3ARg6yE2NZB8MxD1VIVEI9kZb7nnfpcAfCsI8ahbuXhmtgjeRdlp6p/hOXJRI
         uLlGTkKSUOjkQq1VsTjwvG0tE44WCUWgaj6NS1yjQqu3uKcgOVKftOzVswsY+f0Hve5S
         /QIg==
X-Forwarded-Encrypted: i=1; AKwUvBwvEtZyJNRFGvAURZxh0xbjOhFKbHhBF2YQpPGgeK2sBk5QUK5a2Nvad+Fw3u8RGUe7FIxonabyqwGE@vger.kernel.org
X-Gm-Message-State: AFuF++nSktx0ExVXoPavYotYndfchSXukpaRNzSQtT6JizJU/MBI22ky
	ASsFXy8H6lp0Tr6653eWh5vYYZuyF/o28cQu3AWa4cCj2grZCeTGU2kk
X-Gm-Gg: AYBFou1g2PL1YvMuLhXfYc2/UoO6OMOz6t4kmOFVLsGL6SvL/p9d0HiXMN5oUKc0gas
	JdVO5rl2pu+PUTowbfiTimfdI6Bz9e0lWpvp/PztSVi9Pwik8RXOVYszzJMaohEoLz9sTPra4Cz
	XJ7tKEq5ZglLWuOr/JDRs9KPu3SVqLdBx7uyL7mGIgUhpwsWoO7Fni11p/mjhjJCtmPw08T5ENf
	b/QXy4ZbSqZgEg+F4I6N8PavJDE/gHV0hvVraN/SvG80+aj3H7e1fV+pGUGvRI45PszHac8Ln3w
	wxjF3gGCTVsnHN0sAxIfbYzLZbTxxBPfjlfT6u2J+cucrsQl/t9M5IT751AsFkqlgZxCOkXxc2b
	JHkuE2LhtlhYtODuUGehkLrgTpwXXPm+xB5O0a/QPwNa9k1j+gVh4kfxBM+fom24G+hS2622ACX
	iMTSGYW4zjuEPabh0znhgTI+8pODH3jfZ7wJWf6gaQE30oSqUBNyhozZbQKuKleKXEzq3IVe8nl
	H41Er0GaXz8wPXOMzUBMNU4sZsR8vAfom/MylX2uNj5hEwh68kBbDw5Pj/MaUkt
X-Received: by 2002:a05:600c:37c6:b0:49e:81db:4926 with SMTP id 5b1f17b1804b1-49fe66ca0d1mr65872935e9.5.1790290966498;
        Thu, 24 Sep 2026 16:02:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
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
Subject: [PATCH net-next v17 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 25 Sep 2026 01:01:49 +0200
Message-ID: <20260924230211.11519-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6de1ff058db6..a572e845b8a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9757,6 +9757,15 @@ F:	include/uapi/linux/if_bridge.h
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


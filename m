Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919232;
	b=mmPzkUYHrDmJx5LcBvok8Fx1fVxERPoryInatE4XWfWIDoFyBnvrOE82LirGgHsF93Sn
	 FXAulF1rDsdW8kTE7ceGWO+p33C6EzSXG8FUBswyVSljG6BaPIYy9yNPuftfTfyV7Tvhj
	 QA5fguWbPF0C3SCUhw74N1AYK8NslYtumQPAz/PXhFdMlH8wzaqrhFzrTTzK1WBP5eiwK
	 W91gDDof+0WIaY5ZIYoRCsDKwmSQVT6QXD+xRmnR43LhI39cTKU7zfc9B88Pw++KTmKtY
	 iFlBM6MuG+ewjo++MquP27li/+g0cLukGqw5SeWJ7z4uE4BG5JYDrsb0h81Cq8sP6Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
	b=k6EkXnkSKB9k7s4CBjofpErUnAp3QNHg4zXgXdvgX4SfLhRdPxpPKbVGqgs00ehHdmsJ
	 bX0uQkqXfYpXHBFsxsGKhGh8SywCwNKc3Y2WSN/6pCplr3AHOviXYi2KiWP0svriq06aY
	 lBbpgT5CAk7B/EDFnw/zY5Pe7QQwJ5PlEuWpsWUXovtPS82pzYAUT7zn4u2Xi1Tkq9VSt
	 wN64d16YM7CaLHq84Js8Q8cwfFRSNTW2m6FLfPFR5ahjfv9LA5lv4tyV4smRR/m6Pqm8m
	 52XQkSRHa7xO7VRibS7nzvBQ/KxiSMnMSEjeXKEXcDAozjm5so3idUSkrOqHTf4BYQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mcxx8hub;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353DA606E82D
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 353DA606E82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mcxx8hub
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so27912805e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919231; x=1795524031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=Mcxx8hubRiGTRxjKYFnIkSuk8Qjz/YepIITSFGaoBDnrueKoUwvb8bdQqSsWdDqO3h
         BYpDduC83/yUmYurELWKjjcNFuGygXph2KnOvlDVfsBYn1M3MY9XvMwrK9t0VODnpKFD
         XDW8keofNMMQTFt7ouJLEpcVUo/Dekwl1zqziqcTClZx7PQfmee5tqf6qT/FYkes8AkR
         l9U4HJTr1EhobnWrmYO3tR3sX1/DUDOn4GQFU0iywt+BSGJHutOaPMFVu4lwRCJeSSnE
         OkurMitNrpvSdhNi0YbJzKCgPeRB7OcsWb2WHPrQxoZdJc2NM6T8aLWi879t8sFhFl/M
         Sx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919231; x=1795524031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=zUK9VMaROz+jYlzPLNI9g7yd07pG1b4IhX4VoRVnsue+oYCCZlvlDr3FRVaE4mrsAf
         NAjPDU7Aax/KF89zLnIcNk2W9CAwQhEOme/qplGTFcKizVPJg9Kg0QRPp+JbCBN95PGB
         K+nycOcYQqY5QjTWiZSzwJJYOZYhkK6kprzfYYLzETyI/5OuYp2X8TteLBQR9UeeFHJS
         fr5gkDZcQIZF5ntN655LFALpYa8WcrJ/yKWQRUnXgwo7s/Cmyucyupd93I5Cfk/CVaWL
         dumLfKpXWNsS6zE+5H1ry/tc+CyrtEhdaA+i3wkrwuWcnW0KjoVn7axzHduP6xJ5kpMA
         5NsQ==
X-Forwarded-Encrypted: i=1; AL+hErH/NpJJ4zstE+MXHxwbXKaw+yxUEKZVt8bw7sKd/fQ8jqH4ECHgCm9wvkKkbqh2kwdNyxuemov1rcwd@vger.kernel.org
X-Gm-Message-State: APuU4Z/sVaPAmryIt9h9EbWNExKpbZ0Bzf21aMGYjzW9t6KOfmju0Fl0
	KlGsvXbB5uJUGzLsVw+g0AMDnDIjNroWaQgQDNfqZNQVpE6KlKtzvpiH
X-Gm-Gg: AYBFou2F27s8vPLR5ZwXhoIdxGtodMneN9Vibtkyp33sdwr7jdYG4XCAom1fw4d6wKE
	yCfCAJaFtDE//bIk0JlnnS0ocmNhdlMozBwz9Wqxf8Ec8LApSa6gaK+PZEYo5hvbhFEra82qNIF
	5NYEqdHEhIktpXjKJOobDL2psWPI4E17UWH3wQjPNtUm5dP7UzJyE15e+sowG1oLrv6uxUeiTKw
	bFelvrTEQec9GokWtWv+oyUb/VT2T6rpamAQ++j5H9uDWR/N82cTHEO9xrKN6bHcgmSk7iUA0d4
	QUnBb5WPnPv4W7NapdoE73T+NDYs4xfJ+szIqianknbUAZ71JnLqqwXOUj4VjnnILy3ZOXYvOE+
	2LPLNc7oiMTSjrWm0EEyuZRPD9sA/epAl9PiMLtNc9WcmnBxfZ91YL0hzZAZgMQW4cGBedyUNVk
	lO+Gct3/NMfmT5dQgZBa7UKB4fhI6h35OBHyo7USqNDUDg4UwUTCVwsJayJ+Mnfrug9ZXV885lr
	JBB95+CdOsplbMjqVoj4X+FWG4U5tQ8Xni0IxK6cgvuxoI4oD/aWF7+CkoSxBl8KUvDkfzHZ5k6
	b3xy1soJmsYmPWOXOP2yUseoQLXyO8TaIQSHPyC1ngptqpAAmuwUDSti3rcf+caLnSry/IqOanX
	N30KNt4opaYDNFCO1yFWEbKVu2CwjBaxniw==
X-Received: by 2002:a05:600c:c4a2:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb75812c05mr102919215e9.22.1794919230626;
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 17 Nov 2026 13:39:51 +0100
Message-ID: <20261117123956.11981-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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
index 32e218c0fe68..ccd2d04c5a07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10034,6 +10034,15 @@ F:	include/uapi/linux/if_bridge.h
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


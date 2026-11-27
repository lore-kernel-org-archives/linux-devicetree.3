Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795784034;
	b=W/TBKe1UxaZYXyULkQMmISEkxoD/RzvT+nmhbVwCcq+Glsfkl4iKsM507O9RH5sxgQQg
	 ALPY2hAlHsqLBK9FKtbg4wGrlJhpZ54/1DdzIdhh0djcR2oaFNQhXo4Xx3QW+BexPDyO1
	 ivV0gbJGQ9zEERhtSUc9Kjz8cLXQYHGYqjcsPUuxEI+N14+BP0TlPKhEJQWJeBeF9n8wP
	 QVRs5ytrHon9ADKz1mVXEzYK4qFABG2V8aJqQueid9a8Qk7TdKW5u2I9uisoC6MxHISEg
	 oxstSkTFhkVcURhwA5vGBgqzeTeekdg10hA6lRgbnjq53Kjy6SUk1N8lne1Q2DRPrww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784034;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	b=xrJ9nbCjAhhM/GR89xIt15Rg/CpAf9+YGhZw44/XUR2+F5K4Yygn01Q28yC7BeKkxpQM
	 OlbkdlqmAQq6DY5WVJwwJi0S1UYODT0rMW/KHC/a9U3ISlLgIFEryDgeDguQ5tREp0QsE
	 0LHw9z4wSyZhPNEnL6w0GKztT2XxoqTAYYfG9BwQvTam1wYnpOiv+C2/cUiqt3aDVmedg
	 y0fpAmTtraVxR39Q0EvWfaryGD2h28VkLvKvhobBoAeXLL8L6cJfmngdCc6qiu87jefwt
	 etYY/DorlXPZ6OC0uLqIfEYAfMoipHHI2cs76RdYdzC04Y0ub6gTv5AgiP40IHHA0vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VG8CNZP5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA4C606A33C;
	Fri, 27 Nov 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VG8CNZP5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795784034;
	b=s6UkVKhqdDwIboI6gPY1PWdyFbPJm1iLtHe2zO+Hu60WRA5qQzyTf1RkHjsBczep7O+3
	 C9JJtbf7c7uDcGORMHtHyY3Rprz1fNG1HZAV9HNfGHfK8YOOTVPAnznKzoKBSxjzpTHBd
	 9lH2rQDRpW2DU02KnwZEpDO3/5uRAhuD/S0UVpdfwjPtIEwCAarjK/HltKOMoI569adF3
	 GV/slDg51+1w98TC8G1PMc43Tgfol5UK3q0ZuQQkSpQ1h7/ivbzTm+wPkHlljwA5eML8w
	 SEErtHEt+khIdNyT4ptXoDDSeDPw4q7+rn+r6rTI6iLif9KSkcoXJlj2isRirZaMzNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795784034;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	b=V0gbUxd00GBcJmfQeVbwKb6iNJ39+z49z6Dc7ei1QmmJM1OHXUa+eUnjptkUaXiCBJ5m
	 0lKagHAJYOW40oS0YZuN1nGQeDyUzyU/gOiWmgBcmyqPGLlcunPjfQ2BDtVSjhRS9gg1b
	 Bce0jdQTnzT6kCZBSuxUihzKypvQPOI4HXdeJ+DR5AnqAuMd2O5dV/nRKhDEEYgz6qvMH
	 mD9xv4PI01b9oi2SgZgq+vMPkxIZLWIoqW1v1aDkWA60yjYxWpud/rV6r/5WtCSnnOiP2
	 gCY6FZR9bsPylyMRX26Ks5hX6zEcj5GjChr8/2HoQQEGKrdR9S9190NdV60ajOVEC6w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DFFE1F00899;
	Fri, 27 Nov 2026 12:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795784034;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VG8CNZP5OWKs8aaSGKPucj4YR3RGOCH2GdFJ9cokA01uPjyd7eBpsg2lPyPEJia2J
	 qMwedOrfz2ukRCqS1B7o9wc75I6OxU3oTaNxePYpfCocStN/KVXcoJKZzOlQYmLx0a
	 fTbom2MezfBSmHO0dnFCQhWwTcTJZPZ5LCLkEVb0a9yjGiOoBslZGmf4PU2XEj8huw
	 E4aNh9xEDtfF/yeMq/qiJP+Z9Ln35wFAt27iy2r896u1GoeyRGIFVh7pm11S8Y7DQw
	 dv0B1L2mlspOUgtLCdsE/aIreEEm/q55QvAxOeBh3YJkYYeoG7FAY9j6TpJASb2LN/
	 pkocb2oAOsXqQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1D3184B7C1;
	Fri, 27 Nov 2026 12:53:45 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 15:53:46 +0300
Subject: [PATCH net-next v4 3/3] MAINTAINERS: Add CS7542 network engine
 support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-cs7542-ethernet-v4-3-ea4d8cd6ef18@gmail.com>
References: <20261127-b4-cs7542-ethernet-v4-0-ea4d8cd6ef18@gmail.com>
In-Reply-To: <20261127-b4-cs7542-ethernet-v4-0-ea4d8cd6ef18@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795784023; l=937;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=DBRJjVV3hiiIbRTZ8foq3X1SNngfkVeImNSp0P0VJEI=;
 b=6Re59bHObrOCuxL2LAcVczKsLZk5Fkw6w4rUxaF1POtulDz+bIIzOv9zUKg+xhTADpNoGpgON
 RvOPA2pnOG8BCAD/Fv7yyyZ49lK9YKxcb5ctt5myf0RFFb9yPxXOapy
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Cover the Ethernet binding and network engine datapath. The shared
global reset provider is maintained separately under global control.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 703e95e83..53d482457 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2961,6 +2961,13 @@ F:	drivers/reset/reset-cs7542.c
 F:	include/dt-bindings/clock/cortina,cs7542-clock.h
 F:	include/dt-bindings/reset/cortina,cs7542-reset.h
 
+ARM/CORTINA SYSTEMS CS7542 NETWORK ENGINE
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
+F:	drivers/net/ethernet/cortina/cs752x_*
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0



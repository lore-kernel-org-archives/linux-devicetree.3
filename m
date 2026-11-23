Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466449;
	b=Zk5d4mocyHgskMwas8w1XCQknlVwYWtK3sgl45ChhmSK7/iMxrxNYEwu4cVSvEk9KLc2
	 n7gdhSfgspKJGGJO+ioXx8YLMiDdwrgvXoNk8dMjoDS268Pn5BZK2ynJUWAHwZY3tasFJ
	 cd1SS5suA1HImS3U88EmJkZHKOexzw5ZfsWbT6GSNAXH9MTN052TK956chBnRcNd7rkL9
	 N7PUYY9+uMES2t4g51GV/dZOLvQBzZF1lnqQYPAJzcD4ccpi0cfl3xjrd5nCObEDbl+GT
	 SWJhfEEYiAyHMTpiLOffgDx7rC9so/dMo0SweYX0ZhYw/6zFqIfQ4G1rP2DfDPR/Jdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466449;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cSPfx5VZMmgPwRxjxT6Nr3BB6izaAxY6WRbmr0OC6sg=;
	b=tuoltPe66sPFu+FqyuJb4y78Jfy0IlFCiHIhU5xA7SXF39OhnZ5U3UyOUlM5VtnQpx3T
	 Zky1bfCb/UzZU6if+Q/N3b2syQ/+JjDF2xyArwUOxTJeD3p+2MKW82R1TDe52QAJgcciN
	 Lw7pqMDA3hNZx4CStL7CjBjclxDgXmuYFA+T9q44jVYnzfTFpnkjvKw0rfIqjiBunkpP+
	 0cvhD6GbwA8plePb3uxEbKS/pskt7d7Dl0q4uR/3XE2Ol2QVHAYcf3Q0U5DxJYuzvomU3
	 VZPCZsluv+6m0rfHCplIM2w6jJRlPfWC44ElKOnCVZCaguRBKXw3HYKn5+1lQQ6i+Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PEUDSmGX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6D1606A326;
	Mon, 23 Nov 2026 20:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PEUDSmGX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795466449;
	b=h9VbIA4+H7tfx+zTbECmXojW2OhFvGnII/LTnVbDyRnKxAROMWhwQI14nZrlYEmqNNF3
	 qUMXzDBnAypUUTRUtvWskCJtW9Ru72eyYkKl8daMdkN1f4OJGn7AwKH6234EuSEBTJPXq
	 8TZYPWjvRH9SQigRjRQ/qHY2/HGT885X4bsInXWsgSWLKXQQl84Mo9bithOsje//cKBOq
	 qITjzsOWnkQ/v44ZZxirqilZiRYEsinnw7N41okLczGEbcSpNduf95MOVoA0M03K/ps7n
	 PEEZVXKMtj1dBfKj7C7quChGNghXACeoeuQnIgWPvmsHOnqqiLbnt0H+Af5yUAdQZFA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795466449;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cSPfx5VZMmgPwRxjxT6Nr3BB6izaAxY6WRbmr0OC6sg=;
	b=ZZ2PGEkpNIMj17zfSwxOPRacFrQoV8CHzPEA/fSdRwAoTwdReGFQVIE45JugvTwWjV0n
	 BNyd5vM3N/bSBKltzoHyzKDufKusmzVFICT4clM+BONyU+frDSnUiMKfhC0U4Kof/txtZ
	 4AHnyTa2hRM53mbv6cYrha5NpYbuTn8jInTXrcxwRpFsuPyQFM+iDmpcvEaxlRjZbEkr7
	 whGRVTE81Qw4iP1ShPogd0cT9epmW0vW29Id6MxXrlqp3b/KDV0yXF8JZsbLmJNoqTuWw
	 fJj8WL6DQ6E12cviXYzrZUMNeNAkyVmbCea2E0rTFvJwVf96hTOIF4wgqMHE46vkSlw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A86C1F000C4;
	Mon, 23 Nov 2026 20:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795466449;
	bh=cSPfx5VZMmgPwRxjxT6Nr3BB6izaAxY6WRbmr0OC6sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PEUDSmGXr00DmGOETLR403tmlsJsJ128iEUYfBFw1JcRxF1J/fiNQS0JpfS1FHdqt
	 zYMoEI1WuLmB66/GpvOBeKZsJq4rAaaZNIRdGQBWeYs1DhjgAOcuDEPcjo5NcFOXGC
	 /BS+/NdZDxrnZ/80d3YyMem/7s4tedsSbrMKrZ68LO4pyRKLJMnHOMlk/0bBJA1ceM
	 HxV8NTnEELSBJApi1opJz2lB/ih6suaNT7OohaydtQMun4aWs/dLwWzMvL9HbX9qqq
	 zjh8f7tzZJ1OPWO+OFTTcPlTQZm2Y7lM8bBdcE6qRScH3YfbIvsLX4dG9/V19PhKZo
	 pZrqdIxugSlXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AB0E54C729;
	Mon, 23 Nov 2026 20:40:39 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:40:40 +0300
Subject: [PATCH net-next v2 3/3] MAINTAINERS: Add Cortina CS7542 MDIO
 controller entry
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
Message-Id: <20261123-b4-cs7542-mdio-v2-3-30465e831853@gmail.com>
References: <20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.com>
In-Reply-To: <20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466438; l=883;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=pa+eVVj3dWWEgeMEgkzxsEwVYcHck8BeW/HLISWO33s=;
 b=10TWF0h6UCEZPEUa2pQ0J4G29viwmslZdQ/+szpfUCtovqWEXXTYRSBSFhElYfXRW6Ftlazgm
 f6a11oYnSvPBIzo0w/LT+wzNZjrcBOZpJGisXCCDTlA5hXz7RSHM9Oh
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

List the binding and driver under the author maintaining the Almond+
platform support, together with the appropriate subsystem mailing list.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb..312d3b4af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6918,6 +6918,13 @@ S:	Maintained
 F:	Documentation/hwmon/corsair-psu.rst
 F:	drivers/hwmon/corsair-psu.c
 
+CORTINA SYSTEMS CS7542 MDIO CONTROLLER
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml
+F:	drivers/net/mdio/mdio-cs75xx.c
+
 COUNTER SUBSYSTEM
 M:	William Breathitt Gray <wbg@kernel.org>
 L:	linux-iio@vger.kernel.org

-- 
2.53.0



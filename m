Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459346;
	b=mYwpP4TiFHsh/OELFm3CPXAQkLZ51+TEqr1C073r1eptydtFNgUQjfsNcQvSoWOT7Pgs
	 rA+fv27azy/E8cRz+O78U107KORwy6qGB+Y9MSPkpB3P03zfLVzE+/VRmnR4GpppMKKi4
	 5afpVejsti/530pJgjPXaQA75oJoeruNRTkT53hlVkIFc7TPcwtSHpe6u5I9M9Aki+Prk
	 biJOvmcifyonnIA8DalMUl7W8oaj0MKZ+iGZcwLDq9S/DT4tYr3mLkNFhpJXB3hHKEmXn
	 OUVhGXRE++t2JUyD9jMl0Erh2oDuQ8kev9eUx9wdPCwZLqg3yRg2JMl+NtVnG/vwapA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459346;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DY41IkVCLTmNKdwt5l6WzT/LmVqXjoM4QnfN53r17ow=;
	b=oo5eEHPy2Rlt7lZmYz3udH46mcvBg9qfK2VkohYRugSaDia+TMQ30N0O6m1Zoj0zMWD+
	 ccv7p8llm8M7N3fO3XP8qO5hYJgWKHp78FTadAMgYj4HOHdhEc6biqztHYrujjJaZJ8Tr
	 JsB3pKW0/HxTNAgAljXF96FyzNP2s40NLwWbzcypD51AJ7ED8T0aL/zkMMlfMrORENSzA
	 DWzZQfTVMIQTmEWdh/U0YfkLzrTelh4DQm5piK87V7UxfSuzs521NhIEE5fo0UbEk/v+r
	 8LRoKyVxnTrqgz1wForF/gSjnRddRPACMSJ+wEundzMreIxoxwdTg/Tscjugt4Ypxfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkxoVnm8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F579606A684;
	Mon, 23 Nov 2026 18:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkxoVnm8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459346;
	b=feObvqQeIoQ3mTtyV4QIHImA+cG8i+VVHG5VuwdaV/BrsgsfWZaH0tm7vc7je1Bfxq3f
	 LtdEErJde//IDHMUetSNSbAtVy388MzFvQ9gvOxAdDgmkVLri/BMaHxh/jSeoEBAE5ul4
	 LbGFysmT2ymW3tvH0rFKijYd0u8SoLNlxOjEU34uR/qvzZnXA4WHU8NZTVEp23qBq038Q
	 HIEYn7L3RYqNfu0c71Lg0UR3rV8afs1F/SAqPcrKdkExHNvdIVg8qMnR6+LZxTzudJV1E
	 H3J1jXpv3Qmkz1KINFnEh4hkKFL8l/MboFUpp7elQnZbgVN5kIvIHqdQ+WBmqptk3hg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459346;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DY41IkVCLTmNKdwt5l6WzT/LmVqXjoM4QnfN53r17ow=;
	b=VljTsuAY7vjNVOGW5NUrHQOTw9Is5X7X6gnuX3Z0GHA7k/Fj5ii3H3/TsFS0MixUvYD6
	 ucNx1CQog+RQ4vs9b5XH4YTu3pcTekI8XKJRnVU+gT2NA+2wWvpLo3U9/9iwjMz/bxpXU
	 XBehhuVrN/fgUJtNrdT+OJP9NBbLeIvqWKzvyHTaZ+P2wzsL/uzs2a2utGDYQeKI4RfiZ
	 hAgzpuFzxJWOXPdEAePQwc4qGg8163P5mVOCV6RKpHfO0ScnsSC+/Yepw/OBQ1FVkK02R
	 UMxBSj1cHIhcmVb7dTAPB/oVALT6oNwuCT/itbmP44RYGz/Dlw1IKPxQGXw+5gq7jTA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68F141F000EB;
	Mon, 23 Nov 2026 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459346;
	bh=DY41IkVCLTmNKdwt5l6WzT/LmVqXjoM4QnfN53r17ow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FkxoVnm8mK5dy8reSsWzjxjyeNAGmwRYYeEAmddxo8CT43LmrTf0N1WNs7rIPrpKi
	 iElz6j4oF9oAvjVm6VKwQIbmp1RG0YVHEDVbObVogsrYR8gWoQiheSzn6ia1GjYIIn
	 XCgNoFo8xBK+/Z7suiC2Nb2vA7ON+7kYnVHj4BQm3KMBnwTS3vfKD1lIULGk8guqmM
	 nkHl+v4wBKj7VCTLVWulEGLJCcTgRzKKhI5iPB3x7Z94qHmq1BWGsRSYeqrdzXl5tH
	 qssQ+9Vh7GM2sxSDSSfawiTJtJ498RITllH/udSHG60PaIXMXU9FeNfRM38YIKTZvC
	 RmkwWG+YOf8Zg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 159B74C5F9;
	Mon, 23 Nov 2026 18:41:43 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:44 +0300
Subject: [PATCH net-next 3/3] MAINTAINERS: Add Cortina CS7542 MDIO
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
Message-Id: <20261123-b4-cs7542-mdio-v1-3-626d0a0e3b4d@gmail.com>
References: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
In-Reply-To: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459301; l=838;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=7hyTZ8aMLyoFLsCxfW13JVobmKVCIXTMs/pjAkS0zwo=;
 b=X/jfnsDdWuWT7apGD4RJl4ZcJmGJtFXdHWXqWBPEYAegiWgdtI7daoQNOK31bQX2TqCvMjyOh
 BGGAA8OdYHqDOqcvy9Evs9G3GfS2xKXQAYbM2g/m4G5ph+UynaG/L+2
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



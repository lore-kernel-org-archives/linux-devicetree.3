Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602998;
	b=F/fOzR42DietB0bTr/FSaXv0r3H68o6d4cpoFTRNO5CAgyGG5hIENRsHmED3K4roj/uK
	 07UQAd+ccByEwkGQ75h5KXaWdZSiQ6hthkn1yuNKtIdfLyVH7xkslD/N5yHJcvIleMaH6
	 gWHWf8ahvDLwG/61tT0jXClvhqCBtI8DZp8Nrdf5mB81LP8sn7QVh7lEbO4K0SLznb2kd
	 fGt9sG6tCHXVlzq6DCxHizTNK4It3aMp8h4EuIeYbd1oZp8h3upUk0VLsBdFSOh6HJd3u
	 cSzfX3bftZz5v/n5W2Ql8Eb00SfLF2kXaUILnGenvEWS9nz+3nzEPvLk1PjX7C4h5JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602998;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	b=FW/P45vVF43B8UFGBXu37zISt01drGHHqLp+4UsojAQC2pEA+TQT8pZkzKzp1f/vd9nG
	 gj+XSbVF6ctMEgdw9CgNZWzwW5rrS65s7DFlHT6Ej1wWplYDOWvciwrMKXrpj4byrvGxG
	 qeKKPCv2Qof8ujuk5M+TuJQPCQlM+YSsj4LFsGljdVxSubqFWwgxIK3NpPNaAoxgCZHeM
	 3Z1273fNA5v2zkn0kpsY6fWw3eebyAuaNkXKAeFD527uo1IiaZb+yw1pdNR4f+jofedZ3
	 C1Imna9gInjno0zJSDKRLnU0rxoLza9laQZ7bYvQd4KekRZgHaky3C/fPmsWYqZAXrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAuDG26z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB81606A330;
	Wed, 25 Nov 2026 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAuDG26z
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602997;
	b=bCJQCM7n0C5ehA747q2wsPMi6a2ZiRz4GM5k3pN9gbakBjoTpiFKD3uZUv5XJonPCnZZ
	 wA6e4p+Dv3kKwPWX+LCnrYjXMxZjDFbSJxD+mRqcAQjETHMI3RRRnIioyStAz788NYYbF
	 nXk0fWgTerNkRP8t+s0s0WjzeitjpeIHkzmlGTgQPfAoWKBpcWL41Rm7XP3w1xxnQAevr
	 i5EERuL8EC9l9GC6Oa4nn/sweQgbDH4LkwbCqcTuYvCUIrgD3DF5mOvV9MduIkqExVxx0
	 0fRgfBTKA9Ltz9y8aNcYknij2Rhd8kdBYdg3Ane88bNoQXin0brPKSDQynxP7oIcPuw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602997;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	b=Gp6Pg0WgTroQp970wPciwJFWj3pnZW9iWzXbq4GM7je04YaUuLmBMmLXWWCoRO+P36rI
	 sYrQK9Cu4uCoF2CFyVdyOGV2Rt1WC9X/ZYkid9H00nhiNhLFNOdmV4zYDjhaurhH6fSzB
	 9vWqDFEmFoSJdEK7rCz/qFDE/JvKvblM8nIMFgJ4tqC0WieTUyt/fjGs+eaayvd3pfmAr
	 MCj6S+zo1PIC6t0wSiIs+m4pdmGJ0s89cj5E167+WJW3X0vdQcja32HgUNPdbuydOsHx3
	 NR9luZgkeXU4PC8IkkKfgUl6Mcv6ui+Wnu/QbIjlg1vUnFXwclh5RolnlMfPac7WlSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4545C1F000D2;
	Wed, 25 Nov 2026 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602997;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BAuDG26zVXJuRbJ/AuiWb79JjbzH5D3vC8zPaVl1U+XkieHcYyViuj9GgunLZPcdb
	 Ma5lMlqrHr6WSk4bnup7HsuHVTrBiFJ7gfN7ToiVTfY+L3J09lI4b9C+k/fuc7/YzP
	 8GAyh0Mj1pu2BftGOC2rtNkb5eWFVZ+sm9CJI8hCcKqbKRnKBPkN0pFPAhyHHSq3UY
	 qW0eHU8PFWnduyfNN/jFBgWerSDLBceqwK8GOXkROSVAuZEqmbkhvFAA+PhddW9hdb
	 gsAX2FQsD1cTD0HR1GyjewQY97HPh/tSf9t/arkfp/e66lkohtd1P7fRqf2wy23mK6
	 mS4lCXwa0YPVg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AD30F4CE6A;
	Wed, 25 Nov 2026 10:36:32 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 13:36:33 +0300
Subject: [PATCH net-next v2 3/3] MAINTAINERS: Add CS7542 network engine
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
Message-Id: <20261125-b4-cs7542-ethernet-v2-3-d0ea3c6eb375@gmail.com>
References: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
In-Reply-To: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602990; l=937;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=DBRJjVV3hiiIbRTZ8foq3X1SNngfkVeImNSp0P0VJEI=;
 b=WytHn8t8+oyEMkF3t9YfnXXkpxg8BOu1XUNxrDoQi8oj3WHXS0vg/ozuXGkWskxW99Jzivcu2
 Lk+QO9nRKKBCsWPOJpEei44OKfZy/DXMcX5Ey8834fMJ+n1HCcsVpNg
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



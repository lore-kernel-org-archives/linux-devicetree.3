Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459476;
	b=RBlCnkT5Qufx72GmGoJRnESLXiTm33nSqBqtt78oPON/G0jsPYrYx1MZKMvAsYkXYNnk
	 Ost8WaqM7UTajcrp7/dQHL8mCHQHn5Du7hE68od/u7fB7MgdbWgcIMUTFdyIvijf5YDbG
	 y+T1MREc0gNahgK3fAIHcVNNQSD4F0p88s9rWiGnMA5ugXCVFx/Zql7igw+uCNmD1c5Gs
	 2dX12UEZ8Iyc89xpiJGbeV6rzQEvi12ThxhfeQUXCxyu+8RCWi2Nh7nu73iQ5PzRRY4lb
	 5jx8mFs5eEEJb/M6KMT3XDO1kgcboRs+67ZEpjP3J2/uyoxW4Eoxl054lo4z6Zct0zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459476;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hUFvvMrtcN3xKAWIZoqvLk+7RqIxx8dguKgTelmkfsM=;
	b=rAMt+gdzKo8URmndsPf0s7BurRCHVzSPHmyiU7kcqNxKKVQjz5TygkvALbOkF5ah000R
	 pZel0Y2+BVXmfBU6Ltt/wsiG3HIf4hWjm7dPcyzxk1Ml/skl/qazVkE3I/MJOlWTjiRwU
	 /nrep9z4i8PKJn4/qdjOFsISR3coNLdO/BETJarE60HLl3wvVonqIkvUPx2DMEBa+/OrF
	 nXOJpLB6I5Eq6SEJDcgHFUdqKLT817JEffZpv9+1Hiu7hzpLjnjdjBIn+zfJmDCCv+cIs
	 Lz5CIhxbEMtgkK3euXw28SICiNUPepvIfbDcJqmw7GzvP1A8spz37EielUDAmwfgCqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OV4JrOj5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB07606A327;
	Mon, 23 Nov 2026 18:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OV4JrOj5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459476;
	b=KzT7mAT98CCBciMIiudfpRF9OKpaklN1TQ9hHJo2QphWKijMdY50nGkqPACgDAGCaBg+
	 3+DLzqdjTEx/7MKFtRqCYeNsic5GIqvjHTJJwEHW6tq+VBpGDkjTOVaSQnLfOtOk3yuFH
	 MIdPV9u3wZNKzhBgtIBleuA3cpP3olwS3Ot437r+Ukh1OthY8e7SQJOzgs7Jvxnig0Qga
	 8DRQuNYK4t3Pmy+8gnT18hmWcsWGZH4RVwvFCe4+DJK9DnhFBw1DIhHJf5cHN0T2vMqb0
	 I1OyO4rjx2kMIhVbHJUx/vpePvONoMv6WwBrS9w+IGOGN9W/0DYG3iTIu2ocup5AOyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459476;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hUFvvMrtcN3xKAWIZoqvLk+7RqIxx8dguKgTelmkfsM=;
	b=P+sg0jvPPUNrO6bG8qQN8uIxYmMyFrvZV8iQkm/pXUkAM/XnJ9mYUCZIXPgJfKZ843mG
	 64RzDbI7zXcamns6KDuBif044L6WW4eDw8dvqeU4nB5PSMxtBZ03H7Gij2vXJzbMdoEO9
	 s7ULIfNS1F+6TALdr7pkKV69/1gMPU9oml1FhOvoM4N37Ar334RCkiqtlEXI1aY+tGqJ+
	 IiG9W/6i2NAYBujBUwDjtYmz4UfDjWcGZngCrjiPWCE6wrkFB5VJ7BtEsE5dh2xpUALs3
	 0s9NbbuJTXK4fwxOWoMmLmptkhS/NPBhwRtMlJTTA5zOYXM6rtrGuSQR3oangDkREiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 280751F0093E;
	Mon, 23 Nov 2026 18:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459476;
	bh=hUFvvMrtcN3xKAWIZoqvLk+7RqIxx8dguKgTelmkfsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OV4JrOj50sAqztog0hetQwa+bPERizMvGtBxtvU3GCoAMV4MUFSdVbLurgPp1YzeE
	 +//pchrpUTm8FWFNB3AnTbWvUwL4f2u7/FVVlHdrNWNx3SPdbNs4RX6v1OiNJBEgzX
	 G52hOi8etMZfCPFNjr2i5To1vQetX9YSs78Di3C0W2nk0gLoaOiDJfuxx1dqsrL0W9
	 S6Xi0Ewnf7oFNviVPb0y0OOYZ+S2g+uA7X5YixF7YGL4AoKhZZ2ee8qr/GoaTm1xjF
	 SXuxQKRSFykuxQS8lH/i3pqEZrb3VTPmqyYCa7FtpAXoOIhrcaaCMEFdfkbaWZaadJ
	 Gqcl8OO8U7qfA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AB97F4C625;
	Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:44:14 +0300
Subject: [PATCH net-next 5/5] MAINTAINERS: Add CS7542 network engine
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
Message-Id: <20261123-b4-cs7542-ethernet-v1-5-fdb5e8c2d508@gmail.com>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459449; l=1003;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=G+m7gJTK/NeHqNoGXUe2fybpj2Fx+enthhwoUjEoXRw=;
 b=7ecsMKI92CxEavAgE91R7+aRS33PjSd5cBpv9g0WV8kA+QieWXLcDOLx0NYijgRNp1xIpfZUr
 2EjrS+tfyxXAkzlfCo2vL7KTb7EQCGjP8pVNMjP32958r/NdAhVg+4h
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Cover the Ethernet binding, network engine and reset provider under a
dedicated CS7542 network engine entry.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8835aeca..e5d1edd7b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2959,6 +2959,15 @@ F:	drivers/clk/clk-cs7542.c
 F:	drivers/pinctrl/pinctrl-cs7542.c
 F:	include/dt-bindings/clock/cortina,cs7542-clock.h
 
+ARM/CORTINA SYSTEMS CS7542 NETWORK ENGINE
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
+F:	Documentation/devicetree/bindings/reset/cortina,cs7542-ne-reset.yaml
+F:	drivers/net/ethernet/cortina/cs752x_*
+F:	drivers/reset/reset-cs7542-ne.c
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0



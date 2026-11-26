Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697147;
	b=QGz16hwoMdzwYkgbRn6UGNvqWDKvEVgu20FJfE0pLxD248SYjxR3mK8WoZ5wnj6l+L4G
	 JFJsoc9UL2a6A5H9HWzb2ftr33U/+lCUuqetg4qmufkheL5R3khsvNBrRUNWnKGuZqeTH
	 Mq41g4M85NEzXUk+pixwDjJ9XTsLQsqlNwbV/yz873GtKY0CJJL1aRjHTpXcozmA9r9hm
	 euPpoKprrg/nI59vPVqyVK/ua4nNhZUtFOSfxx7ZBI7AopIWh934PMli0TjuH0uhtFa4F
	 /IomyP2IPKXn6E0+0ZuT2pAXe6ZYWmzbf6wvS3Vl9SeELnpDRjmIveyEx6FmO3toIXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697147;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	b=LlpYSqyhrxWWYnnOdOS2nl1UP/tp+Sl7+ZBkmJCIiAd3reXQWM7jmBFbf1/TQ1LiA+KQ
	 HUjtqc3bkFmvaOy8B89TBWiH4lFd2Y8N2wCQPn3ue76Vp/q41DQwG7LoPg6qLjIGWgmJV
	 oPN978o4kVpuevtuMPpO1jcI68WyxosJ12QcVQuvoMEVw0rhDJx04b0q2qRywUQ6KW4U1
	 Mcd/zA/7L9iWOiL9AIhT/4gycvMLCeAAtbCHC7BZ+JXNtLfT72zMqi4vW42nxA7q0WiPF
	 /7lqnlbV64P+lfsEi9Qh7Ikuz9fMC7geFiTIc7msQati285aBWXrzOytozI7MUzjpwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLmOwNlv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2088F606A695;
	Thu, 26 Nov 2026 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLmOwNlv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795697146;
	b=2+2EDq0HFYCa1kHresX9BmbZxcxwCOM+Pl+uMDG4ktKcpvwemfYzQBl6qyYBuvfYgBUV
	 Y/4dHxvqC4jT+6cjmf+Wh58quR9MsddS4W4DXpfMHWnrifxv2yiEKuQye23Az8dLa86sO
	 1rY3mnWTo7CnrgtHgP17swEaulBjJtinVeecx9MQ0KJY2/n5VoQFa55heMVB9Bu/gd8PS
	 OFTqvexXZx6KSQSUV4umC6Gw43IYuAnxwXE3GV5YGS4u+LQ1Nq1b/xlRevjekyvRqp7q9
	 VnAJjyXL2Raio1IZY/d0CZy+KW0KEAZ3yPVMYt1vgH7+8XAtR6qjx++vIlifCP0qtwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795697146;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	b=NnqTGfElOlJ7UdBB1ng+qZdJXuiZzce/8GgdnTl8mi6wxpVsJ6j91eKTaOdQw+ExFWHq
	 erBaiUsvx25H5Cwk30EAAgwP3FIzP0RaJCyIA/o0pG/j9fBPGGGmbETbOw142wposzonM
	 tMguFmBABlvtLSOYc7+Z5JbNd1Iu6IhYJHdhKLxjON6HP6yiQsl5Knm5xq6CFWvPsJ/A2
	 FywIolOuqOoZENZCPRKySY8Bp4foDllEx4XH+F/l3L3h2JRJ1DyprxXquQqgTpLXvz7J1
	 eHlYfEMlFSFJDpLaTHjOEsgjfpMmM4tzHVklyBnu5E6beq7EWm8dd1FUNGKbZ8ZwfXg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EDA0E1F000D0;
	Thu, 26 Nov 2026 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697146;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aLmOwNlvCmETCf3C6i9RTBF/9oUy9P0sNFs5ku1TRH+52iwyWvF3Y5EnssmgP4BLe
	 eeITK7g+77crmyPFYZZoPZjcr0KpyFa2XiWxYhy/iSIkPZc1s2AK5JNhqGVD3AIlgE
	 WJgN4usuRMBpkGmNYqnsNhMSCej1XC0Z7JwDSU0zJ9OdEyS7nhPUb0qUeVHWlpT+VM
	 LtEdfPaA4GSbTz/0+jjbRakQQV6Ro//VVbFRvpw3T4DJEIW3v1idQHeB/FFurSkfKc
	 pc0nBlaEOIfJUvAcxhWgi6/Jg+B9ynq7BEntk57d7faDcZsKCGAlqixVbTvXcPBMdc
	 +JL8RxtBglcHw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BF2D24D512;
	Thu, 26 Nov 2026 12:45:33 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 15:45:33 +0300
Subject: [PATCH net-next v3 3/3] MAINTAINERS: Add CS7542 network engine
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
Message-Id: <20261126-b4-cs7542-ethernet-v3-3-5db5d372e1bd@gmail.com>
References: <20261126-b4-cs7542-ethernet-v3-0-5db5d372e1bd@gmail.com>
In-Reply-To: <20261126-b4-cs7542-ethernet-v3-0-5db5d372e1bd@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795697132; l=937;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=DBRJjVV3hiiIbRTZ8foq3X1SNngfkVeImNSp0P0VJEI=;
 b=/KqYH7qQ4ZNcn9AxpVFu6L2VJWCldJp4ud5ZiLrxDaUV6zLawJhfWaerlY0U3ZG+vS2/RuKQn
 EfsuCiyKimmCzdxxLF8VWtspmHUzThUGahNJmkLYVvPuV3cHh+7uTzJ
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



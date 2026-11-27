Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774489;
	b=LOo3WE3q0rLDNDajfp89GcNdp+4pfIChc3lR2RMdyABsIWa4LXPhTtOxhJpFFTXS7vm6
	 D2RfhtHHFyKJdT5OPnoPIGndAsWLdsDYCBWelc3ovcYci0tFjCn+9uTychzE1s6vnvb1W
	 tXxRHw7W+hIw1fFgBQXxv+NZ/ohg3eCpgcsxlJ+9M+8G8/wkYRmWF6qS09byg4rPqlPt0
	 VXsHwOv6bExD8LohKPUX0G1lzoONGcjzTcgN1wfrAANYo8PK53og4piZTeuR10hmRU0P/
	 5qLv1trSJytixVfZMbOn+zMrUHizGAfLUeMiIH1+7Ejqbp/ddSa9N8wPn3Ah8J3sUXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774489;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cSPfx5VZMmgPwRxjxT6Nr3BB6izaAxY6WRbmr0OC6sg=;
	b=t6hCUByUG5rLZunOU1DnTJ+uoLwcmXn5nhNiHSp/DSoEBF2L2kKZ0IyuPQql9vjaOfCT
	 f8t5/HyIJ4CfAyqDYGE8ZWBFwh7QwHblC9EhkV38EuaR9NtlnNeurvMxssxNSR5javIHB
	 IlvXr0hbcNC7sP8fVMHA/0rNjHPuFahJ0FDnSJ5axFBVMBwNmeDi3zh10XqWvkCKbBisz
	 7pgbjKkX2qf0YSL0wGDGWo0lcgjgBjT6/mCh5WaIvwxSV1Ngs5TX4eLLdPb9zJfpie59q
	 v27vzhhxiFTv3ou1A4e9irocjkI/k9Z02k3R8rcS7g280XR9yGU/dT6XWN1PDL5JHXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PiOvlte0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6661606B3F8;
	Fri, 27 Nov 2026 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PiOvlte0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795774489;
	b=PqZ+/q6vZNVq8ajidxS5ZpP7O9GhT2aSOhkWR3CkI2ANj4KVaaSGXSkwalK5QawJzbaO
	 7RpTNWZXxfgxeW2c/uWzHDdiuckKPVzzzeRAVvZTK0UiY3BbnSjQfmPU2qJ9L3wEw3VSd
	 GrlLxDINP7UDU3fyMd1E5GZxF0Z/pBx6mUJmcse9lQDi/Xv5E3qVfC5RlZDUI9yukOD0l
	 hpUqYoct0NAtcu6jNgMh9kzp3bNXhzqboceT63kcEtrKGIee+dWHxJz4Zx/+a0KxXKru8
	 9Sf6qo7xeeVh69OWCYt5T5PLQN3ETHqC36GAw0UKAh66rCliV8XzD4XdUh67ErDF0cw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795774489;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cSPfx5VZMmgPwRxjxT6Nr3BB6izaAxY6WRbmr0OC6sg=;
	b=g3kpkxNVLr65vZ2FrKFSgFZ3CbJZs/bo1Vnkd6u/DVn9xxn2a/t3A9OXXtNeFeLx+1Qo
	 lbI/Ad3ygm1xoav3z5e7tjJpKf+WLHTIPHjX5eP5lCV+0m4JYgm1OsdlRRXx7EO811ZTd
	 8ePwUnbJrpfCMZMUJV6T89IY01xDoozQHh6C2r8vqUVN4qBx2QO1GV1VLIt5pVrvHQmEK
	 rNMXt3dMa0DiDPk2EjcJegFMM5Y3Icc1YRiZC/u7et99cHW52XHrBygwoe15HtlTN3JS4
	 MGKlp4bZaPfRz804HDyhptvMhUrzGrXzsTbseSoXlI3aOq/yEtNvkw814dhmEamgnUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 296B71F00A1E;
	Fri, 27 Nov 2026 10:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774489;
	bh=cSPfx5VZMmgPwRxjxT6Nr3BB6izaAxY6WRbmr0OC6sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PiOvlte08TUx0FaXZWK47pBTaFBc52oMlRbnGRobeWAdBj2zjuDxOwvRJi269oLk9
	 LPaBfgFF1VUWiOVeFKA5ib/WZ30KQxr69px98Q9hTaecfZH425Alp46R2eS2tzTiVK
	 POsJVveHA0Q87I8AH37HiGUinm9o0xvMgYWLUCHDKx23wQBOIybFCOqJIC4au+AUzt
	 q/I862d1Hn88bIyNBuxE6KyMwc8r+MDTDQz4zl9F9NXClVjEpKsnLm9UFJMcnVeLB/
	 Eeae0SBq6A5IQeKs6RBO7Vbr8GJOvYG4GqR0pDmYztlzIiRR0/u7NGb/DMHPF8f2Lp
	 9TG7cSlPq4emw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B28F34B70F;
	Fri, 27 Nov 2026 10:14:22 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 13:14:24 +0300
Subject: [PATCH net-next v4 3/3] MAINTAINERS: Add Cortina CS7542 MDIO
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
Message-Id: <20261127-b4-cs7542-mdio-v4-3-0e37fc0c47d5@gmail.com>
References: <20261127-b4-cs7542-mdio-v4-0-0e37fc0c47d5@gmail.com>
In-Reply-To: <20261127-b4-cs7542-mdio-v4-0-0e37fc0c47d5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795774461; l=883;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=pa+eVVj3dWWEgeMEgkzxsEwVYcHck8BeW/HLISWO33s=;
 b=g3Jh+Pl43tdz0C+cublxzG/7UDeZdbFb6hlWy5KmyBJ7fjcb4Qt3oAb4LKCYibO5VT4VsOVoI
 nI2Yhed+wepC7RTsVQNwrtrpXR5yQiBThyf/kS9nm8g4WsKXyRIHE5z
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



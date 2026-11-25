Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630542;
	b=xBOaUTtN093gEdnieVX1ugXLqqDKyLYypJZIM30EYXVfjTb1h6BItePLliR6AQQBJp+s
	 4372BeM2spTpzKkOYc3YQbo8nuKNgYMqZdsnCUDppwp1gS0GdUn0kAw+78CV/bqbiqxlN
	 RW/WB9fuhLAi8zs7wc8RDSvXwA+GliJr6SJiT7hpkFHyxkUc6E6ltdElujZMblQqcYu29
	 1dFVB03ijIb24If8vJHDM/vkDk/8wWeBePOCLT3kSlnzS1tQJWqKxgfwq8Avj3G0psdV8
	 RsTppZnSbQ5VIX6cb9hTuqDp50oHt228WuQK8BuBcIeMdBa+LpJA1XZ1pySfuv2Qqyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630542;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=GrSfPBvvBR38xMwMMUY9NoVwiwUE/+6XrL8EsKZ2CFWN7Y48IqrY5omI8VyA2TBeEqAT
	 XL7010FsZcT6j9Fp6tgCTxBzn09NkLaDrdTn73dWSqx99VPaffsUmt7Le7xM8b84Qcvda
	 GvlnaUrgNwh+RaHesq7YTdeYfTAukTQn9ngQ2NisqkR7HANs0ODwvlF7v3ezGcl8qUHG5
	 ktYwU8nvRSrU8KlYwdCH12rmZi8nhyC3bBlCz1u3nQmzoIvb1kuSPc6ibc+h1D7Vv7GOY
	 qAus2fFjKtli+uQP5WCWXJloju3Ka14vocufAn4rVBwWL/AEW78wbHixUmgBEblXEgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9znuZVu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77F7606A330;
	Wed, 25 Nov 2026 18:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9znuZVu
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795630541;
	b=FrSi4VqyvQ3peeW2ia4f0ltTA0qccsNlj5G/AvpI5HPxUKcGzLhYIE8p5EIFIysV9w0V
	 7kfa+yqSxqJjNghfZJXnc5K9YK3A6xsMBrBXK5sn972Ev/ncBw/+XTFDR9FTwIl6f0n+U
	 3vR1zPzM0drIKn//uVrtAliyl5b2WnSjZsu+MHesl+HMj7h73h0AgiVC+d+nzGP+WO32w
	 00rKjdJ2QWtpn852kdmUMo3PrKDh2Xg/QHxj9KRFFpRhpIlUJfutR/YfDBOtOTaFwBBrv
	 C7o1zJgJHmHRIYcx+IvfzAd2A9X8W/MIOEIlRdrgoTmicdOWiy4OBT8vXNARmGTAOdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795630541;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=lbAj6pCnFao7yHaiIQju2N2rKHFbgC0eay4lUC2VXkDCuqUYLNXZQupC5TQYMwU4MjnA
	 NTtENxkHZOINiq7B4mBGzerpvRE1vora/Vlv7aHYrjPmqgHbT1iRiXAysdEcXi/rwJSTc
	 YMDzYpgTO0kE7yzMH8GkYsr4LotdVvTBnn1WxB/IHtQXCZ2I1r71+1IgjMAA/hfy8rrYS
	 NAWZU1tKMBhloQylP4/Ou1nqNEMh9PHFI49UdnRW1PZUtIzFFf2A7BfMfpvhn0t/zfavc
	 kkT34If9UDgE+qzS7P40IOOXwiSZ94wHKJh3PNU0bvrxgXWoTsLgegfCCDOOpBv46dA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 656B31F000D1;
	Wed, 25 Nov 2026 18:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630541;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n9znuZVuxJGRRUbpODpx+SjC6HjR3NacCDLEft25SkzBZFQb1wLKLZwocd+o7I9Ga
	 +CK8CJ9o3yW1rGNPksT7ZraolSFowN1NbEp+CNrRrUqgip+yumZEuxW5v5BTV1M5N9
	 N3JZ9Gu8IpWk7+2YC6emiekLYkEHlSDc3fmPMolp1DkBrZ0/Us+0T7e2w3brR6uPZO
	 8Qvyj62mcjuaY69YDPeCbSZcMsomJ0m3Akoof7fb56IWKrvNVuDb1YXogJfo9owZoY
	 IP8SMB1bCC7sQOv0wGqV5K4tO9NXwLoKZ+9AxqxlZ8Enp6s2u3PKc5Biv3XCNlWDH2
	 XS3QjUp9EYIlg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E56974CFD1;
	Wed, 25 Nov 2026 18:15:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 21:15:30 +0300
Subject: [PATCH v3 3/3] MAINTAINERS: Add Cortina CS7542 NAND controller
 entry
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
Message-Id: <20261125-b4-cs7542-nand-v3-3-0b6d141c102e@gmail.com>
References: <20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com>
In-Reply-To: <20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795630527; l=849;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=k0G1zLfM4Qxwcp8LEzFwCNkEfCjNW435EmJBWtSiLT8=;
 b=HTTxtWnubcKlqAAHEifZQNnhvRKw7/xLuYWtF1TklVw+o/qGeJlfmIwTd11Q3gd3leFcZH5zq
 L3PzBZtwKXIDIwam+AXsJHEiU3U5k1qwBcOdzCBk8gVna50rzbDVGlg
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
index 44540a1eb..2524c5d59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6918,6 +6918,13 @@ S:	Maintained
 F:	Documentation/hwmon/corsair-psu.rst
 F:	drivers/hwmon/corsair-psu.c
 
+CORTINA SYSTEMS CS7542 NAND CONTROLLER
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
+F:	drivers/mtd/nand/raw/cs752x_nand.c
+
 COUNTER SUBSYSTEM
 M:	William Breathitt Gray <wbg@kernel.org>
 L:	linux-iio@vger.kernel.org

-- 
2.53.0



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685267;
	b=XuWvO/GmF+Ki0d7KBnmz+Lp50sh9KOPB/mdlX9uNqpNTHvNe8JGW1OX8tkmCuWBscgKh
	 XHpSwcLB7k0vuxirQFyAm+cG/YkAxy/Yp1f7Sq9vKZRjIzZYky7j1I5PLXF9vGe+NQPli
	 ciz+XeM/RF9lHd01VqlwB6FZXF7GeyqWBL2+Sdtf6M6NKVamVoqbzS3GMvqx3ta5bwsPq
	 UeWKyRKEgF2v734csTBLW35e99aeZFR/Nnx4IbZQEUNldCWKIWvFNSoz246VaNX7WYjI6
	 JPPXBJelhSlIH2opinxBB5bgNx8bJWZdgb28H6/wk1B0VJTyN62awv6ohHo207keQqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685267;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cSPfx5VZMmgPwRxjxT6Nr3BB6izaAxY6WRbmr0OC6sg=;
	b=LQfHDMiAoCsThC+01hcv90MkDYWNP0OdVIAupCBiQKpG8QEUcPo3lDBQTDbr0Rete9fg
	 elBiNFNCNXoHZqPlkRYFo/6lc5JsEJe010OmAiPsL6cIm8DRbrFRtq5jGGlkBtQnbuQsZ
	 EUXtR6h9y1J6cqiN7Y0U+1T15zmEIXnkWn8Byw+5vxecrOiXOOmN+yjeAWvRpZbar2Q7J
	 swaU56VhIxSfqgqgCqBo4Ms5vYF1/IkL5mpths6+dh69CFpxsVuwk4wn34wn3oA8Mfp1O
	 oscNh+Jhl+ga74CAhr03ZeiuNGSMlBkyzrrqp7g9HB+HLsFWhf/51LbSaDGg/Hau+BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuqxUiLZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F13606A33B;
	Thu, 26 Nov 2026 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuqxUiLZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685267;
	b=Fcnbvb1aZ9wTlYpMTN6Wu7GvjF1jzeDHgjzxLuNfsHZ+NrSu4lklxtMnTrKzs5V6ilox
	 QuCugdNP/yrQYHAmQNOr6XL3yJaXhDwkYoOCbnm/XKz625JZ1rN/qk+E3aDD6DYixsYFB
	 o7Eaey5Js7F+ve8hms9EJlsXEHd1YMkf0xzbM251O0j9E4vv2qc5V0oCK5DLxmN/R0lQ/
	 qWBObTfskVBJ/lUMh4XpHOfgBXjnPeInBvRJzGvMM5PZI/m9TwM57vINwpT/qb6yM61eg
	 TKIY1HqUnQcrhFmkiIQNLdykK5B9Jntif1fO9mbv7CEU6YQLCqa9gboj9TtSNWwcn1w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685267;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cSPfx5VZMmgPwRxjxT6Nr3BB6izaAxY6WRbmr0OC6sg=;
	b=fzHTwHUwX5VE05BJOujnuybcfvjv4gN/mMYEQcdqiUXmVz1ODS+MeC+femtYyxYdxelv
	 jQihkAOgMddxn9tmPLIP+z2rgBCc4bndZdJeMKSi4qk2jTT8QjXD5xH5YP79MEJs2f5cP
	 hWrcIj9l3k/GeLiUsDiKl7nZcxlvdZdhBiyHLxaIsvfZLVCPJc1WOAerkk1GMGar8EtUM
	 NU/u0+coTBBFGyQiYtGw1yQYGsWhRlT/VVEasCJ2HeI4ulwUhVTCiFlFyWoBkUkFjkLXL
	 jxvUAXIcnhEG+XKOSgqFHGDKXSQx7yWsvjhRrQiWaOmTOq+kinYYu9thYFDPTHjEuiA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B766F1F000D1;
	Thu, 26 Nov 2026 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685267;
	bh=cSPfx5VZMmgPwRxjxT6Nr3BB6izaAxY6WRbmr0OC6sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AuqxUiLZnQdt2QiUfKNjVPiqbSWiIRn+C6vSQPz8hSYwCcXuuN0liG5f4bSoCBq0D
	 9APeretLtQ5nRcfXGtcfI1LsGte+zh3p+UAmBu7SvwlKxu3l+KZwcUEBQkN1JP6DsY
	 b3GTLbPHiZb06Qaq+TWRSRtnt/YA0oF5bt+9dbUOig/NZ0hZn+c5+4uP/idOR90a/b
	 U9htFmQwNIxwWcXGUUCAKQCowbzN1gtBO/Xe71xSVuaaRlsK/T59ibXkg7/Foq5lFH
	 iO3c2jf94pqne46U1Qp73qHzQE7ZNjxylhpcczIuG5Z0fw6y1mr0VotSDusYkpXEL/
	 spEjRJm35teTA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 478D44D36B;
	Thu, 26 Nov 2026 09:27:35 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 12:27:35 +0300
Subject: [PATCH net-next v3 3/3] MAINTAINERS: Add Cortina CS7542 MDIO
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
Message-Id: <20261126-b4-cs7542-mdio-v3-3-35739a0f3225@gmail.com>
References: <20261126-b4-cs7542-mdio-v3-0-35739a0f3225@gmail.com>
In-Reply-To: <20261126-b4-cs7542-mdio-v3-0-35739a0f3225@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685252; l=883;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=pa+eVVj3dWWEgeMEgkzxsEwVYcHck8BeW/HLISWO33s=;
 b=9RlLK4Mr4o+DSwZ/23ESsstNH1NT5bxxAh3/Qu/deQkLEcTP/lYEVu3cJJMW3cZpkF3kkhSPu
 wxWTMDDsgEbDGXmbS6wCJd/JHEQdMbX1rQz4Z3SInJYzL6UtqsUVflO
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



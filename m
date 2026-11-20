Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134377;
	b=fsmImxacqd62EXwzubW0K2UlFSEqdYjhTUB7hwTgiEe0m6wgms5/nCvrk8P3ztQ+iESF
	 5A176Mj0XDuXJguwE70B+DYcSLnRHI6hcOvFWlnelS1kD5+wEFlwTeA3fUFUHa0ZdHXSm
	 wzvenDQD/tVYkOx6+0qgAtw6C62QY47MjcJoOT2XUa0mA55HtDy7y6aOmlSg4oYvWo2qX
	 xfsp89BYVuuxbIeAasNuIfxm1mmKhQVyhon6zJgVdo7RV93rQ1Hd3DkJLTnfjCZ91Y/5I
	 U46xWxSmwrrE8LFAmfX23ojgQbqj3ak3663YjKRHaAmqr7dC/c4l0sPJY+z37SwS82Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Qk3aVd4VbRKTIc00sE53YNcKxH8rylinMd/aVzIhDmI=;
	b=SR1kupW+i5em/XvqpMYV2VS1YzvbaGjWO4TQdE2sAA0Dpw1gP+xzia3HreF4VsOVCQny
	 rxULPih0u4M3566T4tAcxJCps0O3ZdQsHhHnBaaf065IVzI2XMR37pzHIDqsgNAAY1CUp
	 pgV6jZw7VezKdwWLHjOQ3ES0LZFPTckqdbQTqtZPBh8NCWe8yFCrTd8rSAthPELdW8fIr
	 cWzwCWmVxlcNZ2Kw9occ8cUbCXCK0c/7sKEbOe0kALi3kPJ+mLgB5MXzHMEfcmkYFvuWn
	 X6zO0vXoEH2eOAjVvaviJIePRjIQrvmjr5M2icm4oMAaonrgDUe/rdBaiHw/1eKUWgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzGwlSSR;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008A3606A95E
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 008A3606A95E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzGwlSSR
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492f0a1b685so184701f8f.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134375; x=1795739175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qk3aVd4VbRKTIc00sE53YNcKxH8rylinMd/aVzIhDmI=;
        b=JzGwlSSRnJ/pM1jzIynWx0Mj9l+P2kGmykNiNarXiqYNS+A110hdsPW7czY7Akpbm0
         Xz/CamNAUbrx1m1XphPuLG49RNDJAaHotX0PR6jv9lEPsm2ftb7wm+FyOMxJJOi6s5zG
         67bxUbbB3M70YuPHUMb7H8f5/a9lFgXF1zXVFrNwqifN8DwkoHmTvJNqqucB8SsJZl2n
         2pMh8AF/BURqD6PAjDG7Dxe6A/dMBjS3CGsqunyde88cETbwjlsqBwveXf9NccFk+YXg
         onPxtbW8vQOLE2M2cGEE0HsaSOVVu9XYvc1TEgeaFIFcvMW1fXez2DogcZlGApDJfJP5
         zT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134375; x=1795739175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qk3aVd4VbRKTIc00sE53YNcKxH8rylinMd/aVzIhDmI=;
        b=Zcfp3Il/tYhcA0dnbDtLmpJZjCIWL6hlg8+UCPJ7mtygeMX7h+sFBOVynpiiWGFVog
         ZWowhjLKnTXn7KfkN73hvdZJSAkIVq2Czk47Y1J+n41DCZT8vP7SRGqMJEBpvrkyDZ0O
         4KjZa6EhnvNm/qo4ZJhDJLbwEiYpV0GPqURsrW4U30x+T/7vpZhN/DVso8oZRXlxpqX4
         frWKfketUQe3RrkR6m6Z84PJzYr/mLeJoIULh7AjOfrpEWfPi8dAZFbJNeguw9IHYggA
         CcZogbORPCvgS9YBoadMLxYzYLsnTqYErea78/PTi6Gz98JS+qeQb0t/IdRs3dYobvPn
         CLKQ==
X-Forwarded-Encrypted: i=1; AL+hErG/ofNk6vYQ0WC7ieQSiBAmF4pBxOf9nGc6Emdv6Y4E/iHYyHrtZldZrCmuFrfXFx82UdOJKH2qATcr@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZEOjgMcx53UKTe2q6zQVrLk9zRDCIkOWHZEGpUYGKfTODJbOO
	zDRP8vvDOGKwBxU/42m4t7bScxb6AOzIHijnHQWRmQwKRDmJ3qevfoYz
X-Gm-Gg: AYBFou0NwXPRleKXOXli08JmNYpLNZQ0g3Okww0uMCPZf9Y5tJrl7QOEMt86cCtz7rX
	JmkGOkwlZo4tSaPSUoPslXVHfQWJID7ybdYTwycK3gJfjg/305POap53DXRIP0LTai1erJmegi+
	hduakJbGsAuEUa3r7bdPAt5VnoFYGOh1kFnKocZ/yqw+IrZqRx5uYE2EiY7qrJWJaXrvduO8RqL
	t27qcOZz6+Ilk+01/S6ckoW/+Cu8f8Zg9tAwfo0IdPjtWu+9hFlFw70JXNey1i4LE5YcqB7McDe
	9gV09C5dDBSK1yqAAQSnoxDmocLR2IhclITxOKQp1XKbrnTGzKB6U1K374ICa9JyOlBp5gQJoWl
	60Cv7zAVXbDTuNnRMcbdN900VgGuv6oPpgo4+5dzf6ICoirpP8++orKJA4gz6VW+9k4ItzXpm6O
	VFbEoUQy1rRECrLutT3I+bF/Zdo/A9ppnQ1591QTEv3aFYqVfhJa+uLn5+ATW94iirLzw/0m6ie
	3X5FNFbb1Demp4dE5qrPXtOaK2LdpS1sxLazgaymBS8+VzLqMZ8virZ9pC8DLD8L+9XhcAbeL12
	OJ5BMhqSVEUTeWR4sQY+MnDB4s0Iqlc7tBq+ze5E5OaGgNTHqJS1F0NVkfNC1o7bEbSL5gLMIHF
	uqiwtD/0gXtIeBE0CEGB/MVc5BYQaTdNdO0nAAo7hWdUSMDYOrdYTMUxsUGgr8UCqe8nVBvcotF
	FCh5690SN3/+EZEW8Y3w==
X-Received: by 2002:a05:600c:848d:b0:4bb:694e:496c with SMTP id 5b1f17b1804b1-4bb88810b39mr28871365e9.22.1795134375399;
        Thu, 19 Nov 2026 16:26:15 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:15 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 24/24] net: dsa: Kconfig: Enable support for RZ/T2H and RZ/N2H SoCs
Date: Fri, 20 Nov 2026 00:25:34 +0000
Message-ID: <20261120002549.1908299-25-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the Kconfig entry for the Renesas RZ/N1 A5PSW Ethernet switch
driver to depend on ARCH_RENESAS instead of ARCH_RZN1. This allows
the driver to be built for other Renesas SoCs that integrate a similar
Ethernet switch IP, such as RZ/T2H and RZ/N2H.

Also update the help text and prompt to reflect support for the ETHSW
variant used on these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tag
---
 drivers/net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index d62f0cccf13d..5af8bc1a4dce 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -103,13 +103,14 @@ source "drivers/net/dsa/xrs700x/Kconfig"
 source "drivers/net/dsa/realtek/Kconfig"
 
 config NET_DSA_RZN1_A5PSW
-	tristate "Renesas RZ/N1 A5PSW Ethernet switch support"
-	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
+	tristate "Renesas RZ/N1 A5PSW and RZ/{T2H,N2H} ETHSW Ethernet switch support"
+	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
 	select NET_DSA_TAG_RZN1_A5PSW
 	select PCS_RZN1_MIIC
 	help
-	  This driver supports the A5PSW switch, which is embedded in Renesas
-	  RZ/N1 SoC.
+	  This driver supports the Advanced 5-Port Switch (A5PSW) found on
+	  Renesas RZ/N1 SoCs, and the Ethernet Switch (ETHSW) found on
+	  Renesas RZ/T2H and RZ/N2H SoCs.
 
 config NET_DSA_KS8995
 	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
-- 
2.56.1


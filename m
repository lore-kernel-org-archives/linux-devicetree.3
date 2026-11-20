Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134359;
	b=wa3ygIUMdmNCn2gMNKJLIe7Rg9KnZoFo0/OO2Me/01RTE/VL+sX6F3r+DBVxgBBW3L5W
	 UaGEqS1+KI1i50lAIeh4v23Nh1ngd6nU4+FJ1x5upPug4nBnWXJsdsJRchZHR6Pp75EY4
	 3u7yZcIZbIgHUpYSle7ccJhz4Eq3GDAHwETEc6hIvu7Su6K7Is2gnYStPUwZbDLs84uFC
	 mXvCOdAYbyhwMeOC5LT4AA8ASnT6WlH4pvVtjCB7yq8h1JXT73iB2cjCNrgifEQDuv92n
	 D5wVhn1Rg6UIoDEUNV+Dom75BQ8rzJMBikAGUvvUKyTlqlAXt/WW2NHLzKI7YkpekVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xaopBpwoWF+RnZA2cd1duCoPdrlWpidx5tjByE/+bhY=;
	b=oQmZYJb9FTJjOtp8a9+PFwJLYIXY++E3uzL8uYRQ6h/UErVG2vAIhMiN8HsqubLoAsft
	 5hwj2QmqFdDBdJ7oPj3DUYarVEZqtUciXf6b3nILKVO05WXivVTxUKqSVei43FUau/hxD
	 pXwha7Ah34K3P/ycf1joru0oq7Cm4kkaizB+7dFi2aM14GyrMrO98Ex1gUY31cgq4RobP
	 mU+Q/3rxUMlZV5lGk2UqmOReqmGHZjujMTSy2YJcDaIJwVz1GERxleLZ08NAd2gBlqd6X
	 tfYs+UHxTNqVp7h2lUXXtrv8BXl4w+KB215zz3yBR7l/7/9K/J+EoyHpST5qkFdikOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+68JXiw;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFF460A2620
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFF460A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+68JXiw
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so152667f8f.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134357; x=1795739157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaopBpwoWF+RnZA2cd1duCoPdrlWpidx5tjByE/+bhY=;
        b=Y+68JXiwd/j08nP+pIDYDnrw+BUax68CSMjbEUagvJEJ1zGW2O7NTGBVo22nVZVbcd
         kjPzUA+KXrlyPpF0QX0Kd4xaVh/It/jnKEcSbZ5yP7HFEwEPf1io5L7Piply6x5s4TEn
         0AEFaNip/3lk3KPAkrxqE4U5kju9s3r/QvZ/ViR8/KM6Zx5IapY9LGd4bjCC5AMEgVpB
         TaJyZNVj1RrHswqWcyaPCyYCqDOz8UxjHM3rMAC85EHFmtKsaN2pOS2BLUmXPMK/7Km7
         1bLbV8WaxLIl1E0p5vaLuqA7GItq1UWIYfiZQcsbRSgP3fIdi3yPNl1paaDacZqJjGgk
         0LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134357; x=1795739157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaopBpwoWF+RnZA2cd1duCoPdrlWpidx5tjByE/+bhY=;
        b=jflxVvFmvGdAU194vGFHJFNAEiyMmo+tXkkKbwKyNkcQ91Kg/x4sX7h8ov+RBD3Mrq
         wWPZPxYMkHKj484t0vHdr7KkEiudfQSf6BDnEqVeeavFm4BJMSDGUbO4RXHEGzzisRoV
         lWVDrqMV5NLDgHVitqpG3YwMCntmcHQSPJQ39Bnbp3JTP9ZiB9wPNcwTvlwu1DGPtx//
         FhzGYJZ+w/FGmN3QdcpCFYkt1wBwJUjfOy0eb/BJ5KuUr34UAj+6a2aGBB4P/fIvHYnl
         dkRyvevau3T6159i8pcIACnwtSXY/d3ijfXNivhvK443oGlS+dH/UnF1n+cLzGrrm9c0
         pIiQ==
X-Forwarded-Encrypted: i=1; AL+hErGnseizN1lgxzt9hUWY06mrtF97tk9YF9ojDoikAH+gyg/GEh9WWQwWmqXoWzKXSxPDyR+zG9bNY0qd@vger.kernel.org
X-Gm-Message-State: APuU4Z/9M5VUODAt10oTRl6yj1RgjU0AZtkRzq6beTh2ewcsThDT/Ahe
	1afFoEE19JqbuQZqF6WgbsGr7/E4AENEKYBbbSQs47Bigy04nXSM2B9T
X-Gm-Gg: AZFdTZePyDEy1OWJsbyS82LnkFChBSqszNL6b35kwHIUlo+uMHM++Vu/f7/ng3C44Gh
	pXRnoOdlRtrPEJC6cPaI3M5XyHzqTuW7BiPBG86DhF2ANWU0OOCt2Ra4z/NhJVQ5kFmebxE6l3E
	wmvQ5vpFu4ykX2ynPo1QYjbgja+D3z7WCu5tFCyxgkV/K/9UXKNiQ4TK9Ekb7xQsMQbANV5NIYa
	cXdNrKLwMLSWvLHsZsALBL/g1FSlWvLwYm2uqelo8Xumc+gseU7J2EAM4zDZBmSIZrwlg2jKDcj
	ML4gGBTxW25SOzqouzpVUj/0JIZZuShgapgf0of3c0ebyZZ91KjrKxrdC7re/lknioPfkpAiG/F
	x0PUMhrqpJPT+tC5qJT3uJKNtr2M/gpDKnlRsMcAvhjGs5EtYtsJdSzOxSLK+hNWe3n/ztOGp5T
	hAcVEdMB0hs2CXRuo3xccrm0McuCugxg7TXiegeyeDW0hEFVWrjiz7TS+XM0PhkNcbo27AhWse9
	IW4lib7dUq+n+kS3oy7NLK4ZDkXGYsfjLzG4cuK2DKce4e4NfHJVzNyAnYW0VOSBoIjFhtEr22/
	0H0+5Pw24VO7lBvBoiGh776Arspk+uoi6zTSS1HwAZVkRmnvEchx0q0WGoRoz43UNJmQsvTdx0b
	tO16p9eA7Lq/yV4JDW5MFI/yXetMY7qrgUraazuk6OMrwtzuotBwZ9PAPorRs38hB1yiSVVeY
X-Received: by 2002:a05:6000:4705:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-4abb225e5f9mr2180361f8f.24.1795134357345;
        Thu, 19 Nov 2026 16:25:57 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:57 -0800 (PST)
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
Subject: [PATCH net-next v5 03/24] net: dsa: Kconfig: Expand config description to cover RZ/T2H and RZ/N2H ETHSW
Date: Fri, 20 Nov 2026 00:25:13 +0000
Message-ID: <20261120002549.1908299-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the Kconfig entry for the RZN1 A5PSW tag driver to reflect that
the same tagging format is also used by the ETHSW blocks found in Renesas
RZ/T2H and RZ/N2H SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Updated description for Kconfig entry to cover RZ/T2H and RZ/N2H ETHSW
---
 net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index bdeb60af764b..3c18314aee95 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -199,11 +199,12 @@ config NET_DSA_TAG_RTL8_4
 	  switches with 8 byte protocol 4 tags, such as the Realtek RTL8365MB-VC.
 
 config NET_DSA_TAG_RZN1_A5PSW
-	tristate "Tag driver for Renesas RZ/N1 A5PSW switch"
+	tristate "Tag driver for Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW"
 	help
-	  Say Y or M if you want to enable support for tagging frames for
-	  Renesas RZ/N1 embedded switch that uses an 8 byte tag located after
-	  destination MAC address.
+	  Say Y or M if you want to enable frame tagging support for embedded
+	  switches found on Renesas RZ/N1 (A5PSW) and RZ/T2H, RZ/N2H (ETHSW)
+	  SoCs. These switches use an 8-byte tag located after the destination
+	  MAC address.
 
 config NET_DSA_TAG_LAN9303
 	tristate "Tag driver for SMSC/Microchip LAN9303 family of switches"
-- 
2.56.1


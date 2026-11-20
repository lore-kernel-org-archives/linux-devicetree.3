Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134358;
	b=d+n1zsBZfl1TeQDlmaUytXhXbhoBZcmy+yCn9TVzr/nrG8LJfe9FCfoTHl6b+as8zZla
	 Z9BLJCKbEjWfOj1VteA0M2hBrEHVRGlq4BpJsFAil+aZHLBbeUhgpbLI0amxhRo/+jsVO
	 vrG2wOue/usxPFH54SljQhbEiMDAdRyr/qA8/R7jpPukLRWh7LIGsfOmRtiqY7HnwjXuJ
	 7NUUgNaHVAjJB9f9GU+fAjaGIcnpLCLWL6upkV7qj18eom57v42JZ55c7ULBnFjpfsyho
	 jjivtXU0x/3aNQBOUWSbIIcv94P4q21tZjObZAskAtqDmZEYkm5phoGU7LNvMvs4NBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bej6NsSjfIEC15lFnYpJOiNPHYir/2JVQbFGd9Xe6pk=;
	b=i6ebUyxW8mT3PpFHJ204Jemc3z2V9hmwsPNWLDR5HmGIrN++O1sdgDuapbwJ/pNIzljw
	 jdHt+L1b6yWYSvQ46Ju8ZpgDEqV8mtMkbfP46qaLpNr1YBxQLDBGYlJ12LDhRnjAWhJB2
	 W9e1S/DS8on2OmaiI22O/cS+Wo+J90zKMQKj8C3wDFfWtMRLeDqxCdshzRs0/KCZNadqp
	 xMqfnwUHSNdHdp6dBhbV6gOTPIxqLRrHjaceBxVTHDHNsieK7Bz5aC2h7qNNxUkMK11/D
	 2OvMVUb/HjU4JI5Avrp4nF9uWTNrDbw5Gk7D+UOSWLxoHIlCDMf7ESgfgbQ18KHOBnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKkJgngY;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3045D60A2611
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3045D60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKkJgngY
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49412eb1474so155545f8f.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134356; x=1795739156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bej6NsSjfIEC15lFnYpJOiNPHYir/2JVQbFGd9Xe6pk=;
        b=NKkJgngYss6DYT4q4I6bM1MtlHUzzx9l6XZ3zQDqP0oho2qx0uW5dK3GaT54tOfsPh
         v1fo+sho9zx0KUYC4dnTgUSp0gSaUpI6HV0oTJTcR76Mg7FK9htJ47bXigpqFzoIyMnm
         W3ot7fO3A5hENnQSE9PNGvM4/7J9MLCD5dC9GfdJYx+mtRExOIyAvS1lXb6ivBmalBUD
         npecZ7yn8Q1DUDdZph0tz3giECEaxC5WKsrC3UTXl//ikG0epOYHS1dQYVDxaYGnSeGX
         XQiuYOBB5ChFnt2FOjEnFYzNZUBP+ZUU4n+zAgfe72f1Lsbg0tutadfQ9V7PzlIadwN8
         ze0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134356; x=1795739156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bej6NsSjfIEC15lFnYpJOiNPHYir/2JVQbFGd9Xe6pk=;
        b=gwuSr40irjEMBk9r2VpycaY83Mb2D44yTVcAHUQz09XcAHv2UL78Nb/4FcMbRZ4WfK
         mmN4vZo7+7QQxXHUatBBLU1zuflvBphLXpJEmUWhagy4pyH5R1xR5FSwh4r7ur+Wq+jx
         7z+IT6MVR+fR2oWw2+Vjx2ONOv8A2R3oOv3maPKNTtY/qh6nxJJbEzbVuxXicLTIWr50
         pTBwFn6QyCcISkQYIubq21hbD5ar28H6JZKGdrnlvpbs2d9wnZ8CO71Yue/onAtjACIe
         9veD9Ft/IpTIX7cRqTAuW0zE1EkTFkPsM+2GCtf35cdHBTYhiqi6vRNnYV+kfCl9YKAo
         E/ig==
X-Forwarded-Encrypted: i=1; AL+hErGBP1iMgOa8Sfce/auRw48NNjYud7CqtOrnCVWsH4hjKWAT8EAnAzsaMirzFGkf2WiikzZzUsz0u+cN@vger.kernel.org
X-Gm-Message-State: APuU4Z+X2w2Dmyh2n9jzMy11SmxItbnnsk4YkecjhW2DZllWZNzO/p/L
	CAccaucQz2697sJl1NPuggHFdu5CKdCvoBD/KR9WzHrjIb7OZ9so/FFe
X-Gm-Gg: AZFdTZcxVDHMKuXSbPoBToWpTMQfsnf0/axm8d0FOIJnF6jchg/c6ygM17psdQa4x6I
	qeVgLE13+7XoKXeO05tJAHOGVKF/5OjwbrwseGQmeWwWLRqAZ06Bc4KR6TFHI7XLag+oiZf3L+P
	7d3C0FwOfWl3c9KmlgOwvptYen3Qjt8rpqw7yQ4jzqbHZdUQFsH743s3di8gxfX4QyCn6vNqYJ8
	hnIk7nb0OBm2/HTV5BYufeGOKFihu7M2yvP4ma6nSL7Ux5FiYK0FDV9fiWadQ7ZcVx8VkvlFUOs
	usGu6geFxlJp5903UML3a8CyXKZhw2A176B0MNtOQLLiMMnDztr65DtknY/sq02m1LmcPtWVBEa
	xdTUmddnwuyc7pl9CAENTLLrkZoG7b9SjIaLZjs0qDlmQe9Et7m/WmGsc7JeRzjmsbS46QaJduU
	66dGVK6BkUOevKHZegEZP472PbBZ3Ni7KbbSpmxCPlrfHaAFfJJVKZW2reCTVagxcit074kRRxp
	3tEi8Igz01diTVvAB8o4RNud/9i9EwR9uSvsIcfhaUUg5oz7cYtk+/NUydKf4itbgQLfSL53IXa
	hrYvMZpjJZbAPYX+eFLhqJmicDalalYMYly82cf7itpmCix0GDUTisRrPWoGicZcyYTvgPdEI8x
	yLM+Z37ibyS0xBuqvD9XR5OpssckpywlsXip7fywD/rZQOEKlF4VAcpopRWKqVJUhIl+sA4fk
X-Received: by 2002:a05:6000:2310:b0:4a2:ee0f:4fa3 with SMTP id ffacd0b85a97d-4abad6a4224mr2489161f8f.8.1795134356478;
        Thu, 19 Nov 2026 16:25:56 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:56 -0800 (PST)
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
Subject: [PATCH net-next v5 02/24] net: dsa: tag_rzn1_a5psw: Add RZ/T2H ETHSW tag protocol support
Date: Fri, 20 Nov 2026 00:25:12 +0000
Message-ID: <20261120002549.1908299-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add a distinct DSA tag protocol for the RZ/T2H ETHSW to separate its
semantics from the RZ/N1 A5PSW, even though both use the same tagged
frame structure. The on wire layout is identical, but the ControlData
bit assignments differ between the two switch families.

The common tagged frame format is:

  +----------------------+-------------------------------+
  | Field                | Size (octets)                 |
  +----------------------+-------------------------------+
  | Preamble             | 7                             |
  | SFD                  | 1                             |
  | Destination Address  | 6                             |
  | Source Address       | 6                             |
  | ControlTag (0xE001)  | 2                             |
  | ControlData          | 2                             |
  | ControlData2         | 4 (timestamp, portmask)       |
  | Type/Length          | 2                             |
  | Payload              | 0..1500 / 0..9000             |
  | Pad                  | 0..42                         |
  | FCS                  | 4                             |
  +----------------------+-------------------------------+

The differences arise in the ControlData interpretation:

  ControlData field (bits):
    +---------+-----------------------------+
    | SoC     | Meaning                     |
    +---------+-----------------------------+
    | RZ/N1   | [0-3]: ingress port         |
    |         | [4-15]: reserved            |
    +---------+-----------------------------+
    | RZ/T2H  | [0-3]: ingress port         |
    |         | [4]: timestamp timer select |
    |         | [5]: reserved               |
    |         | [6]: RED period indicator   |
    |         | [7-15]: reserved            |
    +---------+-----------------------------+

Because these semantics diverge, register a new
DSA_TAG_PROTO_RZT2H_ETHSW protocol and corresponding tag driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Rebased on next so DSA_TAG_PROTO_RZT2H_ETHSW_VALUE is updated

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Updated commit message
---
 include/net/dsa.h             |  2 ++
 include/uapi/linux/if_ether.h |  2 +-
 net/dsa/tag_rzn1_a5psw.c      | 21 +++++++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 09f3043d57f0..a81fe7ae4d18 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -63,6 +63,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_MT7628_VALUE		35
 #define DSA_TAG_PROTO_KS8995_VALUE		36
 #define DSA_TAG_PROTO_LAN9645X_VALUE		37
+#define DSA_TAG_PROTO_RZT2H_ETHSW_VALUE		38
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -103,6 +104,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_MT7628		= DSA_TAG_PROTO_MT7628_VALUE,
 	DSA_TAG_PROTO_KS8995		= DSA_TAG_PROTO_KS8995_VALUE,
 	DSA_TAG_PROTO_LAN9645X		= DSA_TAG_PROTO_LAN9645X_VALUE,
+	DSA_TAG_PROTO_RZT2H_ETHSW	= DSA_TAG_PROTO_RZT2H_ETHSW_VALUE,
 };
 
 struct dsa_switch;
diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
index 1ffac52c39df..9fd25c5d96c9 100644
--- a/include/uapi/linux/if_ether.h
+++ b/include/uapi/linux/if_ether.h
@@ -121,7 +121,7 @@
 #define ETH_P_YT921X	0x9988		/* Motorcomm YT921x DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_EDSA	0xDADA		/* Ethertype DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_DSA_8021Q	0xDADB		/* Fake VLAN Header for DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
-#define ETH_P_DSA_A5PSW	0xE001		/* A5PSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
+#define ETH_P_DSA_A5PSW	0xE001		/* A5PSW/ETHSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_IFE	0xED3E		/* ForCES inter-FE LFB type */
 #define ETH_P_AF_IUCV   0xFBFB		/* IBM af_iucv [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_NXP_NETC  0xFD3A		/* NXP NETC DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index aab0ec143c77..3dff661fa58c 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -23,6 +23,7 @@
  */
 
 #define A5PSW_NAME			"a5psw"
+#define ETHSW_NAME			"ethsw"
 
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
@@ -111,8 +112,24 @@ static const struct dsa_device_ops a5psw_netdev_ops = {
 	.rcv	= a5psw_tag_rcv,
 	.needed_headroom = A5PSW_TAG_LEN,
 };
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
+DSA_TAG_DRIVER(a5psw_netdev_ops);
+
+static const struct dsa_device_ops ethsw_netdev_ops = {
+	.name	= ETHSW_NAME,
+	.proto	= DSA_TAG_PROTO_RZT2H_ETHSW,
+	.xmit	= a5psw_tag_xmit,
+	.rcv	= a5psw_tag_rcv,
+	.needed_headroom = A5PSW_TAG_LEN,
+};
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_RZT2H_ETHSW, ETHSW_NAME);
+DSA_TAG_DRIVER(ethsw_netdev_ops);
+
+static struct dsa_tag_driver *dsa_tag_driver_array[] = {
+	&DSA_TAG_DRIVER_NAME(a5psw_netdev_ops),
+	&DSA_TAG_DRIVER_NAME(ethsw_netdev_ops),
+};
+module_dsa_tag_drivers(dsa_tag_driver_array);
 
 MODULE_DESCRIPTION("DSA tag driver for Renesas RZ/N1 A5PSW switch");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
-module_dsa_tag_driver(a5psw_netdev_ops);
-- 
2.56.1


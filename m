Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816477;
	b=RQU7wQCLkZP1cTTvyAsyxEsNdq3a/9UGqRhbqIsoXuVrYpSD37pMphPVhQTzpEsTx+fx
	 Dy5XikK8ybc6pDINv0yZELSEZTl7/7ZTTVu74mZxRL9SLM8+h4up9ABq3d5p/aN7mweCq
	 WqT70bQLgq7My5I7/MrYiKN/CSCe7g4edj/dfW/+HPu3HBMUpl6/9Jk7engMJI1jJIm0N
	 DuspFfOTxbCV/ZK4CljeQ1YM3L7clcsat9MV0qNBZ2UJ+Nc/qGX0TPklq2XW5S8ZW8RUg
	 phA5dbQIqlenJDV3S+ldVwnzc2HKVjYn/KZuFmC96BsUMSe1yIhDtahl5O8Fn/VU31Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3KWlsc/MZRnBDaOP5Xm04uDW6oFxIqc/gzrmAKgcexc=;
	b=kLY5Xe/XLp4FLR2Tikv4GGnX6Siqc+IxJvpvdOmdmI5/FHJQf/0iKIQfz03heYOWVjrF
	 rVn433diq4v+XEMSbRTtSo/Iace9wRT8MKfNF1vZcl67Kf53bKbKtMJThi2dtnFofm0la
	 5VZQtrUGVqMgGrXeV6Tg/+H1mq1P5E5l4BNCvQbMI/Y6hj9RuhzjLo2ECgS0hv3V3/1hy
	 10KoWZfJAt0JDzM4tqWa3C6GIGixYgn+Cqrbpnb28QPv+B1YIr+Hu84WuHesCRFG7loWV
	 B4YRkvNOvlzVcK17uTrozBwG/b1rm+vtVRMhBYIKvfsqokAB5scXb/QuzKDGUV++XLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YyCqQvQu;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BB9606D821
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25BB9606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YyCqQvQu
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10917645e9.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816475; x=1794421275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KWlsc/MZRnBDaOP5Xm04uDW6oFxIqc/gzrmAKgcexc=;
        b=YyCqQvQuEYo69t3a9xwwzjVfNUuHUWilbjAWINrDWWKi1yamWhH8BiItOVbO4H/yWm
         XSZBQ2gJ0ztDtXDJ3kBFKhq95utIIsNeoXGheZdoEThPVP410gnp25KySXX0fvnEuLPw
         lI2xPEh2Cz0X3q/CE1csWfQxcKdNYonViM3NqdI8b/DSDfd0SqWXuDVXfrLiiibzQtS9
         9cljp0HmqiZKA/8GY/P9NudfMlhL86Bv9FcxR06wZwVye1DE7XPcy3vRExOBaVOyGegb
         96ROIWvAJFo1/+4z+PMFXlWBJ/ZmAgRSprxXrkqQv5kWvz+KNevuW9Koc780rFGt4KDF
         AUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816475; x=1794421275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3KWlsc/MZRnBDaOP5Xm04uDW6oFxIqc/gzrmAKgcexc=;
        b=gnyj9Ym0lURYDUWc2V+UpTJ6IZbR3p0Xcqz4mllWFNEKoKz/8Tc61QzPAK2sIjDpIW
         BVtZWlj7ojoJvMm4xlmOBj4eh0kBIfhtp0NFY7VlMDZPwjU+3EKIorhCibCkTnlDz7c9
         1BP7prPmfUKlc+Oftg9Vx6XDnohdfnUYBjOne9CTxUm9Ai6o9ixzKdIeYm3bqq2E//SU
         FDd3BXbD1nSQfistEc37HHtutMlR/3qGezvSO/bXgM6+1mup2F0Hg8ZIftYWkWD3nJM1
         dFZ77Ar/po9N6EJqXNFk4rvdiIbpHkvDkhDM3MrIKfmYgS1EH0xRLYh0O/jv+UuaCHFl
         bE2w==
X-Forwarded-Encrypted: i=1; AKwUvBw4nkc9dYVxnulLOt0EdfPM2QmEsgLCk0kpbIkDsfY8IbQQdaANpe+SUn+sIcch0JhCD2IArKZqzzUB@vger.kernel.org
X-Gm-Message-State: APuU4Z++a4pPbEPTbWx6WlUXUZWf6l1JFIgyabodCpG0d1Nf7A9C2Phw
	dQALV4d0NDg36bnHkvE+9sJpedIQQkS1HhcG+HFK3SLR0I8rxqFtIrWS
X-Gm-Gg: AYBFou19RjjtKsKECU5t6wKHP86tINMLg/3erfpNs/eGxmFoPtQ+CbSkkCPUJrSPo2G
	xHrJSzcy7h+GeY7xhjNVXhvnGwHwZjezGzhUY95dwVEufyTBTi71Ly8nMn1JLQ501ZGIzCz92bL
	qqokIG0UHm1USTJh7sVYqIxb2z/vi+rQ4FGWZdHt9e6t8zAix+YoG6UCPcK/7hq4ncabKNAkwBx
	ebr5GuWtMgdkAg7dYqdHr3OE90un2edoECHBRMhHXuRbYqrQ06sdtHFn779ynFAN2pDo6xvnEoe
	PDzpNUGhfUTVzR6gs4+2cA4W8Wo1TeY5t0Is+tYUMXf/ZT0Vp10idSoAYnUtzrBb6V3sdD/UlsY
	P6KJmjXp+9Y6Wnj1uPvdRgTACscOY/TTVWn6Pjpn9nXrWWS6b76cQOUzpta6t5jZL8OjIt1l6Yh
	9YAprWeQKyH0GkaVLqQuB5j7SndYtu6km6cVzDQ/PIN/2DEqs2v0ffkQKUgwqm+EKNgvuM44Ty9
	7+ii6PxevX8ANihQgyV1f1GRapG1kU8yeZSa3Dh7QG+hG4qCTPg9mxOb2vP5ck0gjmiwFF9+6Si
	kI3qXLTO5ky5OhblVebFI5a7qbZSVVP2cagQHv7dD5ChUkCHhzs72P+8qcWootOwORGYUwqdVlj
	7XWpbObDs7CknIT8g8nboEA3iw9ibN+qCFN+YPg==
X-Received: by 2002:a05:600c:628d:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4ac17d16b99mr372467265e9.11.1793816475506;
        Wed, 04 Nov 2026 10:21:15 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:13 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 03/14] net: dsa: Kconfig: Expand config description to cover RZ/T2H and RZ/N2H ETHSW
Date: Wed,  4 Nov 2026 18:20:51 +0000
Message-ID: <20261104182105.1102555-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 4f44bf3ede23..88e181ad4cc3 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -188,11 +188,12 @@ config NET_DSA_TAG_RTL8_4
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
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134374;
	b=N/Bpa1TnrQO44n/f3uFVe4frg2TJ8B0YQ3R9LoqkaqmOUO1PJYtoBXJHSVti1hEqdt21
	 8qRN9uGBsgV3YZU81sDr+epZ3mwsw1V67Fh8bKCX4OQJHV7uRQgYOzYlvUXeENhuqVHCl
	 PhAgoJ93MndQdP6cn1JXEvqPE6QUdRDqBMUebU7mO6Axa+RmuJKbPMvcBBlb0vmuwQM+t
	 w2r9l8G7w6ERboEmTUBM3dRdPBpsbgvzWtloSYYJsr+ENn6e4oQgeKWzfMvqkiJA10CXp
	 RLeYDtTmbnrBJ/KDUoMoUre5tSNYVPZQyQKfqRom/WZRQLriDQSdWDIsX6bj4AwJoYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2HI2zoBly3+pjWajoQlzGpQeohSyK8NQtkZ3jxbEecU=;
	b=KH0Y6b6+XHIFxOV6yyx4qrbEl/yf9Pz/hin1aAsZE2Xi9MSFmQs8rIeqQXn0w8h9p4SN
	 CD/4ompizRsmlrMJfyC+xh7XEXUqVtAChPYbsFWkLw4eAqb7cI5ndQEFAQcf1P+CqVHUZ
	 IqtleTNKKVfbWHym+/rI9Px1pmeSbBypQUZPeCNKemmO+gK/Q4V94xIcj8BKtx2DtoboB
	 IHbPmSeG6LLbFWQzOZrLSBXxBXg+X2DsQjJVVxfansE2fwpE9iXuVr/SwkIgXEUpVZQwb
	 2dUi4kroFV2vvAppjudtyXlZTwmtaGpI3IHMoykTNI5MoNwQ6Ne7TeBtTJfMb1PkK+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbnpkyVH;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5729060A6F72
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5729060A6F72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbnpkyVH
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so2375485e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134373; x=1795739173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HI2zoBly3+pjWajoQlzGpQeohSyK8NQtkZ3jxbEecU=;
        b=TbnpkyVH+yhTrKOHjWx/7zpM/66j2jIRzeSvBMJR+qCh6qNpfVPHDkV3ya7jF78JaM
         YPZZVeawh3qS2OBUVieNI3wwKxN5RGICbyG++1DUKKhsLzrs1YkHhqnNnqfJaoMdjpFx
         IClVzRMM8NUUg0HKQh0vXIF7rkWwSOVonKyLsr219Q7IYmV5/ONWmyhcdW8tFUlzG5kr
         E7jPN7CQXMLSQbuiw+ifctWcvpa7bQ9mSycRILdAZg3g5xG6EduSDZtfHIiA2KYxpr/E
         DKx2Er5qb5jYmfCpOY1Reou/72dMQFpmG41Cg76BEZPkSvCHJQMDimpVsbAdSWn2Hk6R
         9Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134373; x=1795739173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2HI2zoBly3+pjWajoQlzGpQeohSyK8NQtkZ3jxbEecU=;
        b=LqMnZc+dV/83ll755/ZjRdVJ/ILo9cZw8YeLJENo1dOoIlZ6R4r23iPF5Nip0CvnCw
         AW0CfUAvhSSZXU9Y14uEAfbt5DyOxHbbIU9983nzRHIltBqK0sNFlipz4Wog5Sn5u4BT
         bQLACidE75dUfq26PolGa0Jrifd3D+FI+o/ClrJm1QJ3wRYIMpLYswd3xQl5uHHdsMzb
         IlOzbhGMNHDgXNWcmJv/iy/HuHJQccRm5oJvjEGPVaTF3T3WROHu3owXamPuk0+Lv7hA
         TVdxPJBbvN9dRZE6wib9gK7/5RxLuaOGpgIYGjduM9tMUQ5I0YwqIzsyR40HCifxadtd
         Pl5A==
X-Forwarded-Encrypted: i=1; AL+hErEVZcTfW5By87p40LXeO0R57k9QcSvNkoEiMFZAQduBec8T57+le+Du0AEnj3zQyBc0g4XXoEir4/Wr@vger.kernel.org
X-Gm-Message-State: APuU4Z+imKEwUe3D3Mp31tCzk4qTlg4qAm/sp+YAksoWvmECPWBcvNqY
	+J9ZiuNqS3BB5gBbvZ2sUa9oQlBgTunBVZ7OFK5isjbvTqeSIbOWvXfx
X-Gm-Gg: AYBFou0RSgI6YBYPDjS7TDq1NZZyz8zrxD0UgdypxDx7EapBXmkPOA8SkKGVVNlZVnm
	Di/ghocytEol6pzcbMezosDM9H2Op9c7CKcqfZ4jr5P582EIKbv673U9jZ4xt/b+o1E5sbUCHkU
	FpVw4xL2Psm8cIgLqOJsMJQtMWtN7bg3kl3vMo3TZsu9jIg4vI4Xc5Ozo4lrG4lgCcqIObE12TJ
	CnBXveLUWNzWY+V/jonlc7fs9FGJc2vu2ffyr5rdy5baIYjYCg6cZ+tTIOhXTf1qFFl4aCbSIEh
	cMker2gMmueMBYYq3FY5jAI+0BVEM0/cbMymAleuG4AfM5FY8cHONB1wtQM8zJ2vsHkkSFDP+oc
	YC5QBsSJwswsi1GySM7dh9bUPVJk1IIOSlA5KlIxSV3TJMODOkuoJx7cA8A5GdP5puBWFKVpW6n
	disoEljjhu94leyU73bVi6Rut6TTVjexzpoOPx1lKANpPq93gQ+uvxUAFgH2sQPss6QnWVZUljo
	BFXQqyZeACgTkhm/uIlcs4oWdPPBOofoEjVjxKhsWLRjtJU8h1EqAQBcx8t6+QJJXfBnO/+IW3M
	n+pXbBVATDWYvBCNyvZgCkM0HkYMYlM0Mx87vvnEhCn5GPOu+fBS5nrM6OM30gVC9WezFtgRIE7
	fvnAFJzwJK32mkxAl5QK/MfZtpVTl26p90dC44CnQtgMZrD8uBta+ERjW7B9IeQj/IFKkuDud
X-Received: by 2002:a05:600c:4e0b:b0:4bb:68f1:5bc0 with SMTP id 5b1f17b1804b1-4bb88920967mr26725725e9.33.1795134372763;
        Thu, 19 Nov 2026 16:26:12 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:12 -0800 (PST)
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
Subject: [PATCH net-next v5 21/24] net: dsa: rzn1-a5psw: Update CPU port comment for RZ/T2H
Date: Fri, 20 Nov 2026 00:25:31 +0000
Message-ID: <20261120002549.1908299-22-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The comment in a5psw_phylink_get_caps() states that GMAC2 is connected
to the switch management port. This is only true on RZ/N1. On RZ/T2H
and RZ/N2H, the conduit is GMAC0. Update the comment accordingly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index c0c1f45852da..751d03b0bde4 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -237,8 +237,9 @@ static void a5psw_phylink_get_caps(struct dsa_switch *ds, int port,
 	config->mac_capabilities = MAC_1000FD;
 
 	if (dsa_is_cpu_port(ds, port)) {
-		/* GMII is used internally and GMAC2 is connected to the switch
-		 * using 1000Mbps Full-Duplex mode only (cf ethernet manual)
+		/* GMII is used internally and the conduit GMAC (GMAC2 on RZ/N1,
+		 * GMAC0 on RZ/T2H and RZ/N2H) is connected to the switch using
+		 * 1000Mbps Full-Duplex mode only (cf ethernet manual)
 		 */
 		__set_bit(PHY_INTERFACE_MODE_GMII, intf);
 	} else {
-- 
2.56.1


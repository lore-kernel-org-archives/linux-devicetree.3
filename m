Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134376;
	b=2QLUogMazPljTxGkOTRzCeK3h8S/OumdH8I73kl4Op+RgQ9CFQfj7xS6ScCJgavawE9m
	 s9ho7XgKxXRy2Lc7Ce746Ql/U32tJFsKjHwZDgw4i9aAeelqnwPsjCnT3yrdFLj7RNR2+
	 +UWvzNL6pr6sH4ySVwCHvO0+sxo0SBwdVPBVPU2e3uRhDGNwEyCqyl8b7yLVHcH6MbA3D
	 YezL71kQUyORdq8O/MTWUITz1XSPJwjg3Bsu/Ty/anAFrXG0yZaKbb6SgNN7B6s7P5B90
	 sCVO7g5dxAZiDlHOZsKJlZ1qmTLgijqERHa43eIfLnpX2hRWb/R2SVHiV8rQm9kWciQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bL+lHPNXWqqyhS34rWZtGwllKD/FnXm+N4qzzKhnwjU=;
	b=yZoAByRUyjxHPTQg0sXSQf8s1zX90k81wAgOeyhKySOVCiPyj+/pKrIBoxwRkWZi1a7N
	 UxBZ0CuRq67hVQbLAEF8MvRD4vNHZfB6neVO5/Y8clV323TYhbpoLWbLsNI23Un0wV2Fr
	 rfApXq2mMW2WoRTV+07GiJ8IcX8MdDJibLTjmPvOpM8854Z3LVZsI8hiat8k/Mw6HrkGw
	 m1EQniEnMocsso9p5ob4rL939RfKpmYJ5Ab9LZR3NPRJV8WvcEH2xMpP0jl3XTdfcEWrb
	 iTAVpCN0oxYs47pYrbg0FuuJRRQStiVK+fnqIbG5g/nSDgPtMvSiRk8XP5jd63bEJiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtac5sXg;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC54606A94B
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AC54606A94B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtac5sXg
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso2380575e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134374; x=1795739174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bL+lHPNXWqqyhS34rWZtGwllKD/FnXm+N4qzzKhnwjU=;
        b=dtac5sXgErpAGOsIJ3nV+/Ki18CF/Vn6k6uPUkbnq68JDFdPaf2JC+StEQuEtoNmTU
         qXBzphnLagdky6qDTom6O2KOga51GIVfYwWmci7qRuGsX+pMfUYzKppaGl4ZWQvGOSb3
         s7yY+19y/FEp/fwfeVAP95YTucen64JK+wZE5b39avE17HFcQCE00BmO4i9kxT7ysE5D
         6fEL/w6PaHugkxugh1Aj92rGDYgSAclfIxQt9umuBdf57RQuW7mgG8QlvCVZsOKrR4+E
         AYa5dYFrNt8q+9QrRU7TRbDAqPn5lGrmuHL33XcOEX7rPR93p2Fnj326DiB0VeSEyg+P
         05Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134374; x=1795739174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bL+lHPNXWqqyhS34rWZtGwllKD/FnXm+N4qzzKhnwjU=;
        b=FWZ4kT/NKpzJZQJmSIR4jTyp7xtZMeGrW3wDCD01XlL5CejthNaUQpPzLW5sioQZRO
         BOJfCybG4A/DspYYDZCnRNzc5BQ4uolZEn6engqoYMEGUyE/2nNrW9AJW6xpoHwpx8nw
         Ekfn4qe/6Dk+1CejgOWy9qDDY+mHqEk6A6Mr4i8EYj1D7giW9zUvFZ0c5XexlCQBOJaM
         48NW93SHZJRVnGxh/U+OQU+/IgA1pE/P05CXvTqgSB5fcNuAlQNkFMDQhfyFGd4i9y/S
         Snh9lG8nBWP3yXJFam2juKn8zfcIILEuPiBUKKNSnc94kzsWmHsmdUHFxbcs3ipHzhkJ
         6zGA==
X-Forwarded-Encrypted: i=1; AL+hErFoheNLrAm+EbREqkhnqMsApRvM8BwzUq9Qsnr1ryIwXpxczjUDH7RVUU8iKdsHfCGgA8iSubrzXb2t@vger.kernel.org
X-Gm-Message-State: APuU4Z/LbJZYSAmOLns41hzBhziPH9cl+lIlf7nTbvAsE5c4T/wWsWkN
	+VlUGJmgpF05smkfKAaYOyDAXT337PGxGs++GvyyTFXDQNXLY0OsZ1yj
X-Gm-Gg: AYBFou1yAWSCidOvOk4mVA3Ogp/E1fF7Gw5vMly+U0toMGEvpfrh1/binLxm4A4uHYH
	Qz7lm6/yipHITCt9b1TO+cBEOnCCPqNqD21QbzFfWgwfgqA1x+H27aDMLbN5wdf69Qb8+fPDFar
	NpGHzpov5na8+x70EscZH7PQ14pCoPZKxrgIEM+/xIWs545GhqPBqLscXcDG9I3j2dykNr05nJL
	I4hGRI4doWPoULa8S9OMWixbt2EH39lTf0+IcGbnqXYZKk/C6ES0Iu9H8cC02cAEvq9igdfAwiF
	CTqKjj3VtVApVuKzW9OlsTSR3kPU096GFbNoTL+ze5vKdia3SlsAkG/H7/qxgKdWSSGXSivC6a5
	0s44xdMynSQFX3r68/pf7eiB7zB0SdEpBweHkPMlP66pxNfvnAdUCJO8COwK28yYZ9L0aI5JkxF
	U7JOFQeDzfxEvAK2B2hdxDSNv0Xg4EVq2vuKADSCH4RcpR90mgAAdelYawtJi59ASWVw+TcG2tC
	Lg4WxAh4xws74XyOnF3IejDB98dv8qx+K8C0vzpho1cabEaxuzaD+9OSD2PhF0+J1UQHDkK6IKL
	vzsLGw4dGIloTm9QpcJ9RhBvhNMiQESNWU1mEJbrUt/Wdx3nNhQBHWeKbFuvJkbAq9x/AMuU4kT
	bfgq1hz1V5v7hi5pqpa1p6uNg6wVzN4ogypj0nHi9Mait46A6HTStGYaXXBR7VrHdkfbJqQnhhB
	Wx0qMJMnELH7yrSLo15A==
X-Received: by 2002:a05:600c:6219:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb88816525mr25360005e9.19.1795134374446;
        Thu, 19 Nov 2026 16:26:14 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:14 -0800 (PST)
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
Subject: [PATCH net-next v5 23/24] net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
Date: Fri, 20 Nov 2026 00:25:33 +0000
Message-ID: <20261120002549.1908299-24-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add OF match data for the Ethernet switch (ETHSW) found on the Renesas
RZ/T2H SoC. The ETHSW is based on the same A5PSW IP as the RZ/N1, but
has a different port configuration and register layout.

Configure the driver for the RZ/T2H variant with:
- 4 ports (3 external and 1 management), with the management port
  at port 3.
- DSA_TAG_PROTO_RZT2H_ETHSW tagging protocol.
- A fixed management port frame length of 0x3fff.
- Pattern matcher register offsets of 0x3f00 and 0x3f40.
- VLAN_RES fields using VLANID[15:4] and PORTMASK[3:0].
- 4096 lookup table entries.
- The odd MDIO clock divider formula.

Add the renesas,r9a09g077-ethsw compatible string to the OF match
table. The RZ/N2H SoC uses this compatible as a fallback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Updated rzt2h_of_data to match the RZ/T2H hardware configuration

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 86d5b9d52f8d..2b69e92e1853 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1411,6 +1411,20 @@ static void a5psw_shutdown(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const struct a5psw_of_data rzt2h_of_data = {
+	.nports = 4,
+	.npcs = 3,
+	.cpu_port = 3,
+	.tag_proto = DSA_TAG_PROTO_RZT2H_ETHSW,
+	.management_port_fixed_frame_len = 0x3fff,
+	.rxmatch_config_base = 0x3f00,
+	.pattern_ctrl_base = 0x3f40,
+	.vlan_res_vlanid = GENMASK(15, 4),
+	.vlan_res_portmask = GENMASK(3, 0),
+	.lk_table_entries = 4096,
+	.keep_mac_tx_enabled = true,
+};
+
 static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
@@ -1424,6 +1438,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
+	{ .compatible = "renesas,r9a09g077-ethsw", .data = &rzt2h_of_data },
 	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
 	{ /* sentinel */ }
 };
-- 
2.56.1


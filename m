Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134370;
	b=JEO/Mzm2/+pCH45vOWKrIArPNJRbwz74b/VhfO1mtviuuSREQtd6Ki8ewBVK0CNmHhC+
	 diJ3OMemRyrGTY/IAB7Bys21oa4iAefnD9EWJGwdtJejwiQcxPm96nXrsfvxp72HxBWB5
	 ydWnRSJ7ie5K8oNTNawhK7niOAYl/6nsuluZQbtUISwO0Fn0waHtty/KvlnrNF6b/RA7j
	 eyCHG5DAuZpX3aYJ02mSsqDe3lwoQm0vCbVoEcIm9DiZ6IR7sSKVhWkeDM+ppeWwtFB9/
	 M3CcK7R0s68K8cW6kcUYVQmRGDWnizYjUd0DuW8t16y39N9rvip2T8XwNjjDbWU8xag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rVA5e3lQLXXpuEDBEQldt12KnrRmz8Phbwb1K279DPo=;
	b=cMMpwdsgGLe89bCxo65v8zJjQyfjpGNv5BKP9ANRkH8aTfvNviqBYopgYN7seVBRNTG+
	 CtDFvk8NCkN0DVrB4UfnXHiFU/2ZJi47hzhMvwqePBX9X/ybNI2s3ZW/9r4QRncpOsPcl
	 2Oi1zwZ+MF1+OibEMusacQhx9/+DmNZUfZyOYqOFrA2z3/HJxQ3eNdNZtx4ZGHt4kvKow
	 LwrL2OXcvYwKyr2E2ythZ3sqWd6DqlZtgg7yYg/bylhK82ycHvEuGog0680h2AnkWb3Qm
	 3zk90u134PiYxnbABX30tLWtyUk1Ngfn2ZkbUulvRGbNi4O3MxceGWlYDQt6qP9VySA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0JoIYtV;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F960A3801
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 358F960A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0JoIYtV
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a32576da88so150045f8f.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134369; x=1795739169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVA5e3lQLXXpuEDBEQldt12KnrRmz8Phbwb1K279DPo=;
        b=Z0JoIYtVPDmE0A2ZiREqXrdoxZvq/jv8BTPl8NaAicVXaC4oaWIIfcq/LTKyqhMwqs
         VYEwwvJM0A75vnFvaE776F1TqEBZM0peUil4646fN8B/4HBg1MjcaXZHB7fxrLQQfv8Z
         heBTmSWHKACeKB7bQqs0m9DXupWRiMTfbmQj2qgzic0n9NOWDmPWl3I0GbvHTx4CcgLB
         /W3QJbTE264YEqBJl98oFIhuwCAAYcwRWXiXaohPJQJO+G5w+eT7j3AZKLcYSONytTK7
         VJxISqkTTt2ZF8h9xyVaLYOeWjJRb4NDjJJPbYPBoAzyuXeSZcA1mZsu4JSmI81T4Qiw
         Mwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134369; x=1795739169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rVA5e3lQLXXpuEDBEQldt12KnrRmz8Phbwb1K279DPo=;
        b=VIARK8u6HIMVgRYw5vNangv2p6vQDrhG4szgElSp6Ax32pEdWBLG84HQ66wiu3OYYS
         s+GdXRCwDe57lqxbNM+yWpx4U9e8SqxBk+SJc3k/N8cBxcMWR6WqRFkTgAAt2DKPMPyU
         8UxbIGw1PD2eYY8LULoitEfvbCZofCLGO+1Xfq99IRlOiL7GAqqyo6HiY4+dhm7gMjqw
         aDiPbpylz3THn7AKWYBUv07aaR96CILY9QdYhvBUvb1rVfiUusX00OwBuaNtB2yhBlgB
         QYtRPgXDxQ5zwdjRKTmq1F6O9YojWo1/jf/Jgmd2UTWHa3749qwAPkdKUTT4VYOABo7e
         sI+w==
X-Forwarded-Encrypted: i=1; AL+hErEZDTRzauFfEMKJYR1llfPCTdSaQ4MMiOBE+b8If82TE8DizHDe1DZnkZaffYJXkZ7d9TkOMeTI0fNG@vger.kernel.org
X-Gm-Message-State: APuU4Z/2q2lMxqGJsxOJE4B27gwx9o+/uZt3zWJRNgq3MuyQpAIAIMdJ
	CsJ62I3UCA/Ik+qd5wgAqmHALqz+oJ6iv4HtXTl8uYuYdLhaNE5DfTL5
X-Gm-Gg: AZFdTZdHV3JBvkNklqimB4n/5rNm0feGAf9BNiONDNjptsbu0yA7L5vMZYn2zgCjVKW
	V1BKxoi5h6f8e3gSSaxNWpXIEjZroHs6FZXZqNNP9k4xvLYTuPO1JpdEEzzVhhWEtnhtlzayMLQ
	BTrV8wH4YLxAvMt09NXp/BcKm8AAiaS03qWCMI6uUzbHGsPi+4nhqQXo3WfxNEzJ2UGmAvZviNy
	/a55HdJ1Ftju2I2Vdcpj/HtrWhM+AUeqHyK1NeSldQWbGiKECuqIqKiEoCtXPH3xhVgsCjtzOtz
	28fJhqbjHTL8/N5758m1ojIHGRYtnUm97X19n2hloSz/Bpo0bQkLJ4MGEOvDopHAPrZ1oOBpwqZ
	mplwacOiiK/LG/7LNYrzeQQi9TVJxRJfPi+HY6T/daDl5039TvcJLUGZV7gRAvrmi9L3SoyHbYZ
	l8BBnTZ0CM9mE4N2nONMwEUOF5kfHw8eLi5YEag6QK54GIeNPf86kkxYA6cHvKCfyFVuP0WA6Sy
	fQ13vDyRXtY7o7UHLzVhoFrv5RR6qoJpzFeaDTrkxg7LDFBSK3R/hfs+q4ZS3tTD6cdXYjtmKJY
	deCvIDZhE44SBVYYF/VMNrnj6HtNC/0ekM0ppRO784p0dPp7fJL5b8q1QrxesupBPA8DGQoyowD
	mfUvb7aY0wNJKFi5PMKcRr/zxuwqEphlk3mLjrE8ULuyxak03/qDThMFDToFDAgC1cwHCKkSH
X-Received: by 2002:a05:6000:400b:b0:4a8:dbbd:69ab with SMTP id ffacd0b85a97d-4abb4f58c75mr2298190f8f.27.1795134368583;
        Thu, 19 Nov 2026 16:26:08 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:08 -0800 (PST)
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
Subject: [PATCH net-next v5 16/24] net: dsa: rzn1-a5psw: Choose tagging protocol based on compatible string
Date: Fri, 20 Nov 2026 00:25:26 +0000
Message-ID: <20261120002549.1908299-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the A5PSW driver for forthcoming RZ/T2H ETHSW support by making
the DSA tag protocol selectable through SoC match data. The RZ/N1 A5PSW
and RZ/T2H ETHSW share the same tagged frame layout, but interpret the
ControlData field differently, so the tag protocol cannot remain fixed.

The common tagged frame structure is:

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

The ControlData semantics diverge between the two switch families:

  +---------+----------------------------------------------+
  | SoC     | ControlData bits                             |
  +---------+----------------------------------------------+
  | RZ/N1   | [0-3]: ingress port                          |
  |         | [4-15]: reserved                             |
  +---------+----------------------------------------------+
  | RZ/T2H  | [0-3]: ingress port                          |
  |         | [4]: timestamp timer select                  |
  |         | [5]: reserved                                |
  |         | [6]: RED period indicator                    |
  |         | [7-15]: reserved                             |
  +---------+----------------------------------------------+

Because these differences affect protocol semantics, select the tag
format through compatible specific data. This allows the driver to
choose the appropriate tagging protocol for each SoC while preserving
the existing RZ/N1 behaviour.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Updated commit message
---
 drivers/net/dsa/rzn1_a5psw.c | 5 ++++-
 drivers/net/dsa/rzn1_a5psw.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 8d7cad90d613..c59d881ce10f 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -99,7 +99,9 @@ static enum dsa_tag_protocol a5psw_get_tag_protocol(struct dsa_switch *ds,
 						    int port,
 						    enum dsa_tag_protocol mp)
 {
-	return DSA_TAG_PROTO_RZN1_A5PSW;
+	struct a5psw *a5psw = ds->priv;
+
+	return a5psw->of_data->tag_proto;
 }
 
 static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
@@ -1330,6 +1332,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
 	.cpu_port = 4,
+	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 26d201931453..58690f5f3887 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -236,11 +236,13 @@ union lk_data {
  * @nports: Number of ports in the switch
  * @npcs: Number of PCS connected to the switch
  * @cpu_port: CPU port number
+ * @tag_proto: DSA tag protocol used by the switch
  */
 struct a5psw_of_data {
 	unsigned int nports;
 	unsigned int npcs;
 	unsigned int cpu_port;
+	enum dsa_tag_protocol tag_proto;
 };
 
 /**
-- 
2.56.1


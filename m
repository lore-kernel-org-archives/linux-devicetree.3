Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134372;
	b=I9vkTUN6K/YJGFy/N6k2hAU+yWvZIq+3eruuLUTQyaBMK7lk6N2ZxmEP9MDLPfbJ4nUI
	 wTXsQM3ScahrTEE2e6+HhMEW4ZXsk+m59FJD5+sp7bYevj5/RCqPOAJZfIP7lqqqqAeTG
	 0zmjkkhyOHvvnlNs6LSHHqT40Adl6dwBvbC2/aGy0n6eWJRRwI1DvwoX99giYYKBJhrUU
	 XYlYyRUYrSQ43CGsGgscBcTT1wHeIo/NyCDijbvML+cEDWF9cCFB5GyWFdXiAfJoyNf0z
	 wIaPrOCYotUK9TZ9ULO14//to3A+gkut0pRSGVpeIgsj+ZAk8vZz4HUWhVrq60gfVFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+MYuoPEXokos/7FC3STr/BeJTYcH3uf8nARH/KURCuw=;
	b=o9GtHJ6UAL0aS3rqhNB6N041flTmJ+pQlx4fFyh1aoRodHAxkbTvg6d8nGmmTj35NcdB
	 9s9aPxJ09dKDNDyRa4YvBohnm44qpDRwaMy07yiS0cYxKKRmTC8h0ZZTQi5MRXqC8rQ4a
	 h/w8GD/xKcEXwAWIcO4MLe7wnqi8x7r+4bn68P3CLzOgbAVSzcSqUtoS8CBgIdP//egU7
	 ofSN0sn6Zy7tcggTCcYXZMItCEdEKcbxAavRn7qxbQBz9soYQg8cVtxj9UIIREs1jyIC/
	 H9o6tZI1FvBIiqP8tBIVqX0xFtkj13+zGzpUk6b1Z3ruktrjs+UIrs/aXfcJYOe0/UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GiZW4/dA";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD6160A6F5E
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD6160A6F5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GiZW4/dA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso2643225e9.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134370; x=1795739170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MYuoPEXokos/7FC3STr/BeJTYcH3uf8nARH/KURCuw=;
        b=GiZW4/dAH9BIl7CvYo9gwvJdIS5Wdn//a2nc1Gq5CnnI35dO7CSUUEVDmikHc4mio4
         9uyKwKkDpA8KHzowUCfRFBGuJbfkbqXNZ7V1KF8aqy7CyjmTGahrsxWhIO1fD3XCPiTu
         wjlDAanNYCT3voftYyUuJfNXhhZOvEGVa3uCQ3tWD1ZvF1tU/FPuUuhVB2G2/ShAm27I
         wRJOe7hGgvauz08SfLaSIvtTRJLDSVw9pH5CL0bG41vVPWVVw5ugGOi8HGUzoDXKUg/f
         AY5YfIRkanNgSemfmg1XjmR2F76cR6dBrOaT7ksAqgSoQVN5ciaZgBkAW+9ij3Q4IkzN
         87TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134370; x=1795739170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MYuoPEXokos/7FC3STr/BeJTYcH3uf8nARH/KURCuw=;
        b=NtSQo8tEGLlCJQRRQsaJA774H7dmJbmVBp6ntInRT7jF357+notGimTCQ3vwC2qLkt
         ffsWwVUqleMKoNX+9kvv4o9891/rnJWt6KqRRytsiAFroITP0msXAv7Jkd41PF0+JTC+
         i/EEC+tiau7KO5IZ08lwDPVaMMmAwQjPp3yzBeZy0V1wX17tY39nn9chBs8QceLRUTql
         ThTYmGeJTpDd4VdA/s2jlUpi+2lo2vwI+5MuoDOehahRoV2D+fUIGym5NYN/dC2ChYFG
         ryRWfuS9Uj0dJuB2hMEYyELdCjxoGCebd9C1JgVPNTUqQiCbqKsRFWy/i3etxpoLBPWJ
         d28w==
X-Forwarded-Encrypted: i=1; AL+hErEUFxxI+HTyoVj4xcu/eX2ZYDDvDJwH7wxGhGpGF6qw/v9DRp6x7Qo5PAorTZtgT2g7QPzx8P1x0YQF@vger.kernel.org
X-Gm-Message-State: APuU4Z/3iwuR58m16asYQzr/LsUD53E74y63GRjABjjhfundyJYt15D5
	fRFuwDxnWs7dhyHBoJwETnvfCB9h6RGjCpKqMrdtcr75grQXND0ffvJ1
X-Gm-Gg: AYBFou24eR0yiASXPqvD73JOFkC+xmZLnmvVTsL+lLT2csp2ziFhhHexfW7HyihfnoJ
	sthBH/R/XpVyBfGDjZgX6VhGS3GnrYL1nsVRcd5R6f5bwez+j0llVNPo1DXWmObkzlRmTQ1vVrE
	hllVw/PlWSTVrDUOrYjUYnfI7w+w4aUy/FtkBIWAdsG4XurySJ6RaxnlklK7tQpSoP9FoINlEeD
	LlQA4f7tnRYc0kJO47NCBPI55nKtnIvo7HdRmljDYLUGbOM69Ltq1i1aDcFzGrvD6DdbySTnNa7
	udS5jAYNN+Y4XmEpDytEz6Bc/5+FyjONs2xcdi/gzQVoMhkxuSdnYQuniu4+2QOWpLiUQ2oyZeZ
	AaqZVjXTaNwIx4BNybESxN8mL10870oYx8hchIQ0HwVFWm/a6BjgCzciT0AinbK6YiwEKQ414Ie
	HX/j5DVQDGvL9vIzrX8o1DJP9QjsbTR2SuX/FjYMV7eBBLhgh6qrB5QBZ9lNYd3QlOcXiRsOXXu
	/D2GPnRJtd5DRMOvR1VXlE5bqCh/ct4GmHeaxEb/KMbnJz3+djgN6TGxKCd+Q6ry3qf6MhRFnKP
	N0e2JADbbziwZdX9fVhCIfGFDXUueXcnkb7WCrHZvZd3l40yXou6qhZyrDco85o/CBWORH6CUL/
	YFYvTG4st2cIJVGSjKL4JVo2G98g+p+Qje6FR800rFFONcYP77yAWE5OVVgMF1123hBIayvTu
X-Received: by 2002:a05:600c:37c9:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4bb887fe7f7mr23286075e9.5.1795134370234;
        Thu, 19 Nov 2026 16:26:10 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:09 -0800 (PST)
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
Subject: [PATCH net-next v5 18/24] net: dsa: rzn1-a5psw: Get pattern matcher register offsets from OF data
Date: Fri, 20 Nov 2026 00:25:28 +0000
Message-ID: <20261120002549.1908299-19-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RX pattern matcher registers are located at different offsets on
RZ/N1 and RZ/T2H/RZ/N2H. While RZ/N1 uses 0x3e80 for RXMATCH_CONFIG
and 0x3eb0 for PATTERN_CTRL, RZ/T2H and RZ/N2H use 0x3f00 and 0x3f40,
respectively.

Move the base offsets of both register arrays into struct a5psw_of_data
and use the correct values for each SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 10 ++++++++--
 drivers/net/dsa/rzn1_a5psw.h |  8 ++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 9475e53752ce..6f3f902f9f4c 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -112,7 +112,9 @@ static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
 	if (enable)
 		rx_match |= A5PSW_RXMATCH_CONFIG_PATTERN(pattern);
 
-	a5psw_reg_rmw(a5psw, A5PSW_RXMATCH_CONFIG(port),
+	a5psw_reg_rmw(a5psw,
+		      A5PSW_RXMATCH_CONFIG(a5psw->of_data->rxmatch_config_base,
+					   port),
 		      A5PSW_RXMATCH_CONFIG_PATTERN(pattern), rx_match);
 }
 
@@ -953,7 +955,9 @@ static int a5psw_setup(struct dsa_switch *ds)
 	a5psw_reg_writel(a5psw, A5PSW_MGMT_CFG, reg);
 
 	/* Set pattern 0 to forward all frame to mgmt port */
-	a5psw_reg_writel(a5psw, A5PSW_PATTERN_CTRL(A5PSW_PATTERN_MGMTFWD),
+	a5psw_reg_writel(a5psw,
+			 A5PSW_PATTERN_CTRL(a5psw->of_data->pattern_ctrl_base,
+					    A5PSW_PATTERN_MGMTFWD),
 			 A5PSW_PATTERN_CTRL_MGMTFWD);
 
 	/* Enable port tagging */
@@ -1348,6 +1352,8 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.npcs = 4,
 	.cpu_port = 4,
 	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
+	.rxmatch_config_base = 0x3e80,
+	.pattern_ctrl_base = 0x3eb0,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 942931cbc402..5c5f5ec25774 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -74,10 +74,10 @@
 #define A5PSW_VLAN_RES_VLANID		GENMASK(16, 5)
 #define A5PSW_VLAN_RES_PORTMASK		GENMASK(4, 0)
 
-#define A5PSW_RXMATCH_CONFIG(port)	(0x3e80 + 4 * (port))
+#define A5PSW_RXMATCH_CONFIG(base, port)	((base) + 4 * (port))
 #define A5PSW_RXMATCH_CONFIG_PATTERN(p)	BIT(p)
 
-#define A5PSW_PATTERN_CTRL(p)		(0x3eb0 + 4  * (p))
+#define A5PSW_PATTERN_CTRL(base, p)	((base) + 4 * (p))
 #define A5PSW_PATTERN_CTRL_MGMTFWD	BIT(1)
 
 #define A5PSW_LK_CTRL		0x400
@@ -239,6 +239,8 @@ union lk_data {
  * @tag_proto: DSA tag protocol used by the switch
  * @management_port_fixed_frame_len: Fixed frame length for the management
  *   port to account for the HW issue.
+ * @rxmatch_config_base: Offset of the RXMATCH_CONFIG register of port 0
+ * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern 0
  */
 struct a5psw_of_data {
 	unsigned int nports;
@@ -246,6 +248,8 @@ struct a5psw_of_data {
 	unsigned int cpu_port;
 	enum dsa_tag_protocol tag_proto;
 	unsigned int management_port_fixed_frame_len;
+	u16 rxmatch_config_base;
+	u16 pattern_ctrl_base;
 };
 
 /**
-- 
2.56.1


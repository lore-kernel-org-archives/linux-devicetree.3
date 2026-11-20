Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134373;
	b=Ax5oVOyBgF5gZHtibCho4M/T+nbxxjUDjulNqn8VoWEC2VUXxRmrWiMe5q3Ly375rfB1
	 V5ri02n2uscbGYXQlH65OnVOyppIxD6eLm5T7yQG2lVghsO/nn6RU7Z0N9OT/kIFJG21B
	 W/XNGpw/D888bUCaoeOdgAQHLN5TVQFQhTKPvEc3lILssy2s7Bor+2acc+StI+3SQpuxe
	 KmOzCw1imn/UWpph8yhYdGPaWvkxv8cvqjlRbANSW1R/XKqbCx3TXkiMh3CroUsTa9OP1
	 vV9Fl3kJt+uRAWTzshpSCuWC2VA6rfWdlbt0k+lF0ZMibS6x6CN3MYOG+GwnCAORniA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mOagZS7KAFKo44G+tzdlLS8PcffQ89K8YxtJsO34uKo=;
	b=FqP80wahjd1+Jav6KJuND39P5ouUno6guFSYe+8EAK7I9dag1p0zpgdS1rE/L1xTqBuZ
	 y1ZKv/gIQbQ5+dcAYEfVixEtmg5ZnXUG7XCSaTi0om7tzMphlxvLYd3/CilnS36PSR1Jq
	 diyzJuGsDC8fBP7wnWFhYgQjnDmflxx6huu5Pza5YhwRJZSJhusb6jigupUwjsNOM5DZ7
	 cEPDZY2nsyXvJT5JUE231DEzWpq/VFFXCbCJsPpiRD7jCRIGWn13TT8el91ydhReQHfvQ
	 Tt1i4kLO255RTlw1J94qs4IE6sQ9Bx7c6zJkkcjlfVBlp5EFwejy4xVNzWnEj5oLftw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLHktkA4;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3EE60A6F72
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A3EE60A6F72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLHktkA4
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492f0a1b685so184685f8f.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134372; x=1795739172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOagZS7KAFKo44G+tzdlLS8PcffQ89K8YxtJsO34uKo=;
        b=xLHktkA4z+MREgOPIaJJMK0ppf56iAg34EROcEYPZDErtMcoCLZkusRo25bs7Lcfzg
         AND9tJqUhGMi1CJH/aTmGB13Ix04icIlcBBz+TKYY6BRVlaSXWhFvk03Yw6qe+iF531D
         f4joEXAW4puPL/fEhrAguYdMn4IZFPA50T3RxViYAH7YP0EI+8yQCacN1fakcOgGk4lb
         /fqPdXMW7/ZC5tG03rW3bxiVhnfa1lpsTRKW0CBwtyqCVIkTNcLEq3Eg8x7q/o3++sB5
         HMW2g9Q6Gk/PgnHsmmshl1rXa+fPuIqpU7Qlh6NdKquvv2yYPE5oyo8K3xV0s4vzn0Q1
         Ro1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134372; x=1795739172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOagZS7KAFKo44G+tzdlLS8PcffQ89K8YxtJsO34uKo=;
        b=0sUSno+2KYp5UMLVN0hPAeQ78Ki8DwcoaF3vP0746YPkAAQdilnmede9lZpx260WBE
         NVCSSdPUNKk7qxtpShess1LtmswokekFiOAkF/YhcAfofmOGHan6UwpK171nFOaSNI15
         owrOjlouhic5jFrggU9g2jh1GvrxnyUU6mDv41MKAXmF3AcAzynAYo1416NW56e23vAd
         7v4qJSQyJP9SXdfH+O9acVdtoYnjng0EYstG7uI1Kr1qGyCFAO9/V7exYzrate7DzD4o
         Mlfql+xqt7LsJh6yF13C4ffzYPgN+Vp5cqPbGf1x6HASTXsmALXTr6mW3uetH0RX+wgd
         XNAg==
X-Forwarded-Encrypted: i=1; AL+hErFNYThdCAF3tGe/zEk6xITWeSv0OUGGygP7o8k7+NkIS3tw7nAQaGyziwmewRGxMiONIb4ao1jQ5Qi/@vger.kernel.org
X-Gm-Message-State: APuU4Z+O6ZsU+Cb5zWnbgjPJbRESCYjIjof8fY+pVI7EDB81GtgLK7yC
	El8ZfRAwUdNenRzKam+EVit0R3TyHlwzETsX+g8dci8jiRPis+s6fg9i
X-Gm-Gg: AZFdTZdJOn+Ndol7M9bpf24eEcG/825RQ36CBeXA+KCuVuDS33wtvQnJ95A6ovNtt+3
	zayPX3tZueJEpBTfJRrS37oJ6scZ5BQUOVWh7wgqxolh6gyN+1zYwEdGaWnzoY59UGW8GPk+5j5
	EAMaZ06rfXrAOzAvN3VTvuK7XRLitzdaMPqnFu5ziLWL1XBODW6bPiG5r1xK8pCaNGF2xxsB0gh
	WxcQPOuZPhrwQOjZ5lUKwSV0ZxWg5mnhtDv+bSKY1/rw30dkmFDGwJwa5h/dc/gYTBPeIIZgPef
	IWNUPmB7RTkk05daIsfdKRrTkrm5I+6PANnsUhBPGx5dQ47jvRqYEzbvzG+tc4tvy+Hr5aSRsAP
	eWk9JjUMZWUf5STLL1N72y9oDu1lWqlGu/hqIhE/UPnTnTgVT7CwwynJSKXL68SQh6hVN0Yw8Di
	rN7Cjpj3LgKrYoXl7+jsjPweYKO9CLRhwmaE8LR3t2+b75SsLW6ZmLMvzYADFqAbvs9QJmXTOmT
	hx5G/B3EvmcFWim6VWjC5qlZq1SHdWuK4kdVxfFprqHhbhiuzHEKPMW9IS+ujlAr1Be+0vZs4Y0
	RXKldyz74tEcI/Aq0r9/y5nYTrWsgsx7HNLhyPTxsL/WCmCR5sumvKKfoc+BQU6TxXCgBRNGjM3
	XL7nqd8eRFlWx3TPOMICYTLTGGdj1mMLf3ysytIuyfrU9UFMsQ2OIfxHb+3il6pe0gEJzzDWL
X-Received: by 2002:a05:6000:2506:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-4abb47b0f64mr2492662f8f.37.1795134371827;
        Thu, 19 Nov 2026 16:26:11 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:11 -0800 (PST)
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
Subject: [PATCH net-next v5 20/24] net: dsa: rzn1-a5psw: Get lookup table size from OF data
Date: Fri, 20 Nov 2026 00:25:30 +0000
Message-ID: <20261120002549.1908299-21-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/N1 A5PSW has 8192 lookup table entries, whereas the RZ/T2H
and RZ/N2H ETHSW have only 4096 entries.

Add the lookup table size to struct a5psw_of_data, derive the address
mask from it and use it in the FDB and ageing code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 10 ++++++----
 drivers/net/dsa/rzn1_a5psw.h |  4 ++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 7e9bc252d92a..c0c1f45852da 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -311,18 +311,19 @@ static void a5psw_phylink_mac_link_up(struct phylink_config *config,
 static int a5psw_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 {
 	struct a5psw *a5psw = ds->priv;
+	unsigned int entries = a5psw->of_data->lk_table_entries;
 	unsigned long rate;
 	u64 max, tmp;
 	u32 agetime;
 
 	rate = clk_get_rate(a5psw->clk);
-	max = div64_ul(((u64)A5PSW_LK_AGETIME_MASK * A5PSW_TABLE_ENTRIES * 1024),
+	max = div64_ul(((u64)A5PSW_LK_AGETIME_MASK * entries * 1024),
 		       rate) * 1000;
 	if (msecs > max)
 		return -EINVAL;
 
 	tmp = div_u64(rate, MSEC_PER_SEC);
-	agetime = div_u64(msecs * tmp, 1024 * A5PSW_TABLE_ENTRIES);
+	agetime = div_u64(msecs * tmp, 1024 * entries);
 
 	a5psw_reg_writel(a5psw, A5PSW_LK_AGETIME, agetime);
 
@@ -511,7 +512,7 @@ static int a5psw_lk_execute_lookup(struct a5psw *a5psw, union lk_data *lk_data,
 	if (ret)
 		return ret;
 
-	*entry = ctrl & A5PSW_LK_ADDR_CTRL_ADDRESS;
+	*entry = ctrl & (a5psw->of_data->lk_table_entries - 1);
 
 	return 0;
 }
@@ -638,7 +639,7 @@ static int a5psw_port_fdb_dump(struct dsa_switch *ds, int port,
 
 	mutex_lock(&a5psw->lk_lock);
 
-	for (i = 0; i < A5PSW_TABLE_ENTRIES; i++) {
+	for (i = 0; i < a5psw->of_data->lk_table_entries; i++) {
 		reg = A5PSW_LK_ADDR_CTRL_READ | A5PSW_LK_ADDR_CTRL_WAIT | i;
 
 		ret = a5psw_lk_execute_ctrl(a5psw, &reg);
@@ -1357,6 +1358,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.pattern_ctrl_base = 0x3eb0,
 	.vlan_res_vlanid = GENMASK(16, 5),
 	.vlan_res_portmask = GENMASK(4, 0),
+	.lk_table_entries = 8192,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 29d205e2331d..fd523fe7bf47 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -93,7 +93,6 @@
 #define A5PSW_LK_ADDR_CTRL_WAIT		BIT(27)
 #define A5PSW_LK_ADDR_CTRL_READ		BIT(26)
 #define A5PSW_LK_ADDR_CTRL_WRITE	BIT(25)
-#define A5PSW_LK_ADDR_CTRL_ADDRESS	GENMASK(12, 0)
 
 #define A5PSW_LK_DATA_LO		0x40C
 #define A5PSW_LK_DATA_HI		0x410
@@ -210,7 +209,6 @@
 
 #define A5PSW_LK_BUSY_USEC_POLL		10
 #define A5PSW_CTRL_TIMEOUT		1000
-#define A5PSW_TABLE_ENTRIES		8192
 
 struct fdb_entry {
 	u8 mac[ETH_ALEN];
@@ -241,6 +239,7 @@ union lk_data {
  * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern 0
  * @vlan_res_vlanid: VLANID field mask of the VLAN_RES registers
  * @vlan_res_portmask: PORTMASK field mask of the VLAN_RES registers
+ * @lk_table_entries: Number of entries in the lookup table (power of 2)
  */
 struct a5psw_of_data {
 	unsigned int nports;
@@ -252,6 +251,7 @@ struct a5psw_of_data {
 	u16 pattern_ctrl_base;
 	u32 vlan_res_vlanid;
 	u32 vlan_res_portmask;
+	unsigned int lk_table_entries;
 };
 
 /**
-- 
2.56.1


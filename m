Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134373;
	b=pxEt3+hkVvSkmSJTjkRy9iKvPMeyNF3sP8yYQq9FAJ02q93fsJH/somkL9SESG30WqRm
	 dWIx+tiHpG9Wjx5QYoQ9c+cSxLAsC2mFsDVeWSw+x+KYJ+WdafUJef/JvLsqa5efLevYN
	 dVrUnbL9RcqgCDopcWzk/CptDHr3nESDiAIxteun8St4tyzTgrLC/nMOsSmQxYirmqAcO
	 ZgL8P+452GnZYuSDZ7vKCd1k2RYJhg1BS3bhxswKZaydUA/sAso7tDMGVgb96javIuyTx
	 EP7B1k7EUQccbzwOISU71/GsT50r7bQCGHeWjLi5RH+OXYEWr9eqcZcYIA+ivkDsZUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZHhMBFGaw4NGI5M1LLOmxtMxazFzLRptQhTvV19ZnVc=;
	b=dbQhB43iHFk6QCP1e3gbLVEAPw92gUJGJSCFqqbL6kzS92kjGcZz7Sxsala/aOn27R4Y
	 jEwIbCHtyQzvrVCLgh14F4cINjF5aSjfa4G55aUF5Boa+a8vT0a14MO+ikF3TmMQhOk2s
	 RZir5v2rMclIVanoB9tx4YW84G3ZZ8hxXEqtjQrqCjpHATDCrQsp8T4I8RMf8X++c6/zn
	 zZS1u0j4SSO4W17t+OOTkOsfKxYcfJ5SmjOqGyp1KeMkWyV+aCP6yoKLIqCm8eZbwJmL5
	 L51rtb2kmAnUlbfTsqX30Lt9j+AVmPY48cvg/9Wlh+Xbw9ZZ2hgZ/IooIXTlkMhx0bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMLRrTNs;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD4D60A6F6C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD4D60A6F6C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMLRrTNs
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso125675f8f.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134371; x=1795739171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZHhMBFGaw4NGI5M1LLOmxtMxazFzLRptQhTvV19ZnVc=;
        b=cMLRrTNsnReXz0DEhroH2bdIjvqagWBw0Ch+yalf3RR0zlVdoti6aXH2VG3S9xxPXB
         fCyd1oGWWWfH6aBxYQAD857pBxWufXZ1W+fzwg1ECsaL/DcxSUq06ugBXdqvuLiP/gU2
         LvBrgkKKIuZBYodcDNzgJSZwVjoVgo21HZCQwlMZgjmyKiwgEQ1cTT1lv8pU3Qeka20M
         avoJQB4VqyBDajRoZVJVcOlgrlqxGo9DafhuRJCGoyN9ftvlNasGf6JgjqDNMM61J8PQ
         jeRHQBlAarqPzbJtEqnH3t0wAMfDF3hVEkaFkyE2mFHvEvuZ5qdzDmRwVYPt4o9oafo1
         enkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134371; x=1795739171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZHhMBFGaw4NGI5M1LLOmxtMxazFzLRptQhTvV19ZnVc=;
        b=J/66mbkb3QEiKjS+32vY266n44cDqUWx53qlCAtvT6p5EeCL5VB+LrVRstKZnZ8brt
         +8eGQfh82K2SU7dvx9uA+X/4SP0SCoXCqM2pShyLSSTVRPYrt7bZh1nlCqKcb+4N3adc
         gAcQ6AP2nBJFCvvh1MN0AOMGW1+xjnSS7R+YWzqsvVNVijvBZs7CveX95qE5y9mhA+sr
         51O6vPpnDFJ8UWsRkVRb0THy8UBVcT2dQG7YjR1oFs2vq1jo4GYJKtzwbHxTsSjKYK5p
         20QjnCXTGEgcMvA18CXuDJisunBpJLjFx60qXXNBPJaYZora/VWqBAeLcp5i7bGMwRBi
         oNzA==
X-Forwarded-Encrypted: i=1; AL+hErEKES45OGwGrapW0ihS7CH9mgsS6WT4o2LManTx3MknbMUgkIZzoCtaRV2Vmpn0hffpVVNqK0UeXepJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/nSvQVaXW/Uq61UR0yX/l7HpX6eZD2UC3M+qee4MMggz8rR/XR
	SoRs1RvpLYeChyVMUp6UlwzSg5s/KzgrE5TWmyXdp56Y5ZrMGdQCYynB
X-Gm-Gg: AZFdTZetWntW+IRtbIcg4w/ohWIfvjqpiIIgeLhL6TEv99PVCSZccXvn/j7+GT6r+3Q
	RWJ56F+6Pc/IXY7RirLzeAlXGsPS9z8UTv+pTGPDPFdgqa2UDPl15dNwFH2LOVZaVrJlzSdr/2Z
	u11XYsDkGFo2UIN5+Gxy7g4L6nvMiEZuVbj+uITIobNcRkD2k9VI01By4VbL8sB5Q8/9L4enwWF
	YJHXTTAerAkF+jeEnsQ4AgMDnwIKM36yivhEebc/5avtqrXr/CO1UFuQWHk7++8X5sEDqfRMXxf
	MnklH39dSilkEu0CLGSkxVAske+BTNRBwNPHOUyfzytZ/g0lwO4d1QbI4M9FuIPc0YTiypp28TH
	a+JhkSpzMkg38rZwopQAqNuM4x25qcjcc+YhEZ9+br05VqOJ42wlB4H3GuIhja1L7dRVwxG3mXa
	24+S0/iih1Tbu4dLQSDoLrNpmdritDQkn1IsXCwr1nyWldojZbmhxHd86G6kcfhZZqV52KyyZhX
	bUkxGsQft5o+57c+OJlr9CbfyeBHyc6Qz1zr2m6hjzrfB1G8DQF4aKdDj9xyQ7v20aXCYZGHBCN
	hP6baL7V94MTAkbAOkAEMMJMgMC7ZjdV4u7kalMPY8e+qaVhMB+KLS5OaIEvzIhWBZw8Z2QXYpB
	LQ9X8RvADhzJcshvT0HQ82qL94mzcYwf0QIh6xlDEEv8inDrfpn5roOy9rhvguzgTW6MBFMdt
X-Received: by 2002:a05:6000:981:b0:490:369b:f50e with SMTP id ffacd0b85a97d-4abaf7402b4mr1962291f8f.19.1795134370985;
        Thu, 19 Nov 2026 16:26:10 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:10 -0800 (PST)
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
Subject: [PATCH net-next v5 19/24] net: dsa: rzn1-a5psw: Get VLAN_RES field layout from OF data
Date: Fri, 20 Nov 2026 00:25:29 +0000
Message-ID: <20261120002549.1908299-20-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VLAN_RES field layout differs between RZ/N1 and RZ/T2H/RZ/N2H.
RZ/N1 uses PORTMASK[4:0] and VLANID[16:5], whereas RZ/T2H and
RZ/N2H use PORTMASK[3:0] and VLANID[15:4] to accommodate their
four-port configuration.

Move the VLANID and PORTMASK field masks into struct a5psw_of_data
and use field_get() and field_prep() to access the respective fields.

Populate the OF data with the existing RZ/N1 field layout, allowing
SoC-specific layouts to be provided when adding support for RZ/T2H
and RZ/N2H.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 9 ++++++---
 drivers/net/dsa/rzn1_a5psw.h | 6 ++++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 6f3f902f9f4c..7e9bc252d92a 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -691,7 +691,7 @@ static int a5psw_find_vlan_entry(struct a5psw *a5psw, u16 vid)
 	/* Find vlan for this port */
 	for (i = 0; i < A5PSW_VLAN_COUNT; i++) {
 		vlan_res = a5psw_reg_readl(a5psw, A5PSW_VLAN_RES(i));
-		if (FIELD_GET(A5PSW_VLAN_RES_VLANID, vlan_res) == vid)
+		if (field_get(a5psw->of_data->vlan_res_vlanid, vlan_res) == vid)
 			return i;
 	}
 
@@ -706,8 +706,9 @@ static int a5psw_new_vlan_res_entry(struct a5psw *a5psw, u16 newvid)
 	/* Find a free VLAN entry */
 	for (i = 0; i < A5PSW_VLAN_COUNT; i++) {
 		vlan_res = a5psw_reg_readl(a5psw, A5PSW_VLAN_RES(i));
-		if (!(FIELD_GET(A5PSW_VLAN_RES_PORTMASK, vlan_res))) {
-			vlan_res = FIELD_PREP(A5PSW_VLAN_RES_VLANID, newvid);
+		if (!field_get(a5psw->of_data->vlan_res_portmask, vlan_res)) {
+			vlan_res = field_prep(a5psw->of_data->vlan_res_vlanid,
+					      newvid);
 			a5psw_reg_writel(a5psw, A5PSW_VLAN_RES(i), vlan_res);
 			return i;
 		}
@@ -1354,6 +1355,8 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
 	.rxmatch_config_base = 0x3e80,
 	.pattern_ctrl_base = 0x3eb0,
+	.vlan_res_vlanid = GENMASK(16, 5),
+	.vlan_res_portmask = GENMASK(4, 0),
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 5c5f5ec25774..29d205e2331d 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -71,8 +71,6 @@
 #define A5PSW_VLAN_RES_WR_PORTMASK	BIT(30)
 #define A5PSW_VLAN_RES_WR_TAGMASK	BIT(29)
 #define A5PSW_VLAN_RES_RD_TAGMASK	BIT(28)
-#define A5PSW_VLAN_RES_VLANID		GENMASK(16, 5)
-#define A5PSW_VLAN_RES_PORTMASK		GENMASK(4, 0)
 
 #define A5PSW_RXMATCH_CONFIG(base, port)	((base) + 4 * (port))
 #define A5PSW_RXMATCH_CONFIG_PATTERN(p)	BIT(p)
@@ -241,6 +239,8 @@ union lk_data {
  *   port to account for the HW issue.
  * @rxmatch_config_base: Offset of the RXMATCH_CONFIG register of port 0
  * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern 0
+ * @vlan_res_vlanid: VLANID field mask of the VLAN_RES registers
+ * @vlan_res_portmask: PORTMASK field mask of the VLAN_RES registers
  */
 struct a5psw_of_data {
 	unsigned int nports;
@@ -250,6 +250,8 @@ struct a5psw_of_data {
 	unsigned int management_port_fixed_frame_len;
 	u16 rxmatch_config_base;
 	u16 pattern_ctrl_base;
+	u32 vlan_res_vlanid;
+	u32 vlan_res_portmask;
 };
 
 /**
-- 
2.56.1


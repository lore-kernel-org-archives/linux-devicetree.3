Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816486;
	b=BHyJ6y10rwHnQRZUmRdnY1oIQtg4w+aPGUnxxDsVTTeK7LX21EK0YH4D32eiLHIbhbK7
	 6598cS0hdn1uGqGfodKM0SlAICHev9unS46wFj3X5TwHkoN3V37pSZiMpaIiKMNTDIGpf
	 va0GFSFAxScVODYl/d8aIJBFDDIUTLC60WT20VxxkiOxo5PnblS7onYA7fTRCKfKU6vMe
	 VNhMgOtQ2tJhx9yTmsWedQqpqmGZ701/49VfF3IFnhrNvz4U3c5NRtwAWouafKDmc5FRe
	 JYu+IJpIg4DZkTcqPPHTKqrxtGFMS2NMgm+KKC2OIdngg2LX9vQ+7vw3UUztclMpNsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cyAGHCPkA2zIGNE1s41zUFh8GTp9SbTWyYT3VeBaM0w=;
	b=hmuGTDLZpXPqqkV2S1G5p8ozZJiGW/gDcMrB5VlBTjdtKfE303Da7N7+76RJAmj3P/6u
	 39rnKvcR9KqeFzm05de+raGZFoN7HW8eUpCmT728Dnn06waAP9KGw8k8Usxw5Z/w81qMB
	 hWKVl2JKsguQuSeuNzc2aRddcpRsc3FybeyH18ZOPCL31G2xjwvqXMJcNKj5CUZi1Upz7
	 dJYjWQ0y2dNsf7pwFn30kzhxtOnmbjx3Hmqg9k1zGpiMJ/2zxTPDCA7fkM7BKnu2qStE/
	 4P7EYH55bYpsbTlntNDwSp7DBX9xOS1AGFUsvtR3V1cPwtFc4uG8pRvxdS+jRyYQ0lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2cgLMeZ;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B786060A383E
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B786060A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2cgLMeZ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so10630095e9.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816484; x=1794421284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyAGHCPkA2zIGNE1s41zUFh8GTp9SbTWyYT3VeBaM0w=;
        b=V2cgLMeZZt/RrMcjTOPGqIFR5x+T3e9ZJqAFvwV+Kd+/sgH/TECjzHHEh3Wqg8Dtmg
         vUUWzch3y2voBzpfsFrZxLTCJJI8ZLp5kTwvjniMN2FqbHDnytOWQISIevoo+hhVWA+B
         xKM0s6gVt87TUmdYMkgMES0yiA5T0PU8Mz+Wi0JbAbvhSfj7hLtS61j64zaMhJwk7so2
         ILfWWDGRbLoaJBXVqIXwETLwer6IX/mtY6FETllRw9lUcnd5ezevvx/AQIwub/s/G2rk
         OFB6/B6sA+DZCt67zT3bDZTIBu2eexm2vmJ1aVzM5KKGk4BTwBYXF/XYgoUpo3rPcvEl
         hTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816484; x=1794421284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyAGHCPkA2zIGNE1s41zUFh8GTp9SbTWyYT3VeBaM0w=;
        b=LqfvrmUQc3BKPjO7JgZdawr9u9utO2pvpr1TfR8YC4Di4ciRZoUCY0FM//vezjW8MZ
         btNYzd1LpZL4OkEONyryWBn/hGhBM2QF6CuOTY4Ojmza2sZ7nWBNf21C0+yd0bv76kKv
         Rj1wgCg5UOGsJ67jCD2oauGhf8cmqny6H2xnAejIoz5C6sDo5poZJv10FeuIUjI64qMW
         xNw5/VmpFJvqUuENCc0g/Fo6yo4jQFTUAAz5oHe+yPSFhQMHsXpmBcXi71U3SyXclKny
         Gp2FbZ/cs3NCQ0tgHLbywCqjny03OYTCQNHSmFQPi3kdDmfUikXYnYHsOydHXlNCEcOt
         KcvA==
X-Forwarded-Encrypted: i=1; AKwUvBw6MdseFsr64XOoknJUXK5drq70xHfZNlt4G/RbxvZt0uioviyZRBlDWdnjUb55TTtGWdvGABVj44AG@vger.kernel.org
X-Gm-Message-State: APuU4Z8k68/PeRqqwvnjcf2AOw8FSx1BK/eRGvSNRCPlrt5hc4o8Z1G6
	RDGhrXDsUm63TXINIGyXReNOJsFwSJQ95TueSuhCCjHX3AqOgQLU4nCz
X-Gm-Gg: AYBFou3RkcwZwnedzVOlIkgdKK7WSfaeKBWTD/WqKBbLpxeJhy341xHTLnj83u/L5o+
	+/CfnDySh819rbIqHf1cHbee5D7sU2RY/L6KKYtpCTRwJPFaZ/qcIbtyt12lU0jFQlHNCe6YsIH
	o5SQSoFaigrozXP4uygbSVtqKxwFpDrHwNpK+lc0GTFP2VZiVtBsXPMCh74AWmR4jMBaDh2YlGd
	UBJeogHg8W96JQdVpexM9B8qsFZATwojzMX5KRCpx2K7Mfmf3brAdoQjlKlXdgxc3qGYU4d5KQd
	SrRzDFkL1Nhjbp+EamHrXhQv42DTgj2Ih8w9LIRlwZ+09H98ECxFnvaOAzh161PX6rNfyTWPzuW
	cMgKPRNxfQn5hv1CyzsXknJM2WG5ZrVkWdD6+Q9F5GUKrqJvGoxOJq+tCinlIW659ev9aXY1nA3
	rwYMP1UO+ismOEYuApfimW5TsCycsX6IIefZ2xlJPJGvzc8FN7aCGWpKf6KKO+TdiqGfgfy2KOK
	rSvz5+gHYaAlkXnZQgr5qx+KeAu8nRh7/wwL5UR7sVMvCnnKbDi2rzJ2OqhzgFda0koZU4QMu0i
	eou1EepLuaQWXO7AXvc0gxdeiGcMLdahiAsXxVsXrf76hjLuKvb5B028ZBnxrdvpZ5v6d0p00N+
	SC79uPpTf19mBK7+zsmm6UVcKcdC63g5PLtNepA==
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr373949755e9.31.1793816484012;
        Wed, 04 Nov 2026 10:21:24 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:23 -0800 (PST)
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
Subject: [PATCH net-next v4 13/14] net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
Date: Wed,  4 Nov 2026 18:21:01 +0000
Message-ID: <20261104182105.1102555-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add device tree match data and configuration for the Renesas RZ/T2H
SoC Ethernet switch. The RZ/T2H uses the same A5PSW switch IP as RZ/N1
but with four ports, the DSA tagging protocol `DSA_TAG_PROTO_RZT2H_ETHSW`,
and an additional 8-byte management port frame length adjustment.

This prepares the driver to handle RZ/T2H and compatible RZ/N2H
Ethernet switch instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index f3eb8646dea5..66b155686474 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1338,6 +1338,14 @@ static void a5psw_shutdown(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const struct a5psw_of_data rzt2h_of_data = {
+	.nports = 4,
+	.npcs = 3,
+	.cpu_port = 3,
+	.tag_proto = DSA_TAG_PROTO_RZT2H_ETHSW,
+	.management_port_fixed_frame_len = 0x3fff,
+};
+
 static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
@@ -1346,6 +1354,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
+	{ .compatible = "renesas,r9a09g077-ethsw", .data = &rzt2h_of_data },
 	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
 	{ /* sentinel */ }
 };
-- 
2.56.0


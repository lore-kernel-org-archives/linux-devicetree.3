Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816489;
	b=iWz3s24kUq5v6iBEv1cLNK1eA1kWf/Ds+FOx/KLdndjBPcc4B7j1VKvQqTzlse5y9+99
	 hYhFm25Kpq/WmVSEknLKe1EQioNO9Kw54/84spnQMw5V5793d4g8g/Bz4pG63WsBnIw6E
	 /iQVOVgvvgHzrz+8Y31jvlJtOx/O6dJrDwgW4uHx45b7BiSkrgQ53Ov+plve/+G8slQhD
	 BFZCHx+5iTlUwg1x1xwTEQcLFGsQJyCAA5Wu9GqoFKNRa1Vc54X8n7KtalTtlzjSHrJaw
	 ZoNVDYkcRLhNgV/Rjiv/yoYB/mIZ/g7r0kVlTQDqzDR/I2GgebM4hi54yNb9rWs6LWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xAFQ4NIpw4G2h3WAzyEmbQDopp5teXSrxNa8N1logrI=;
	b=fDF/QC7blyrW3bphf+b4JW6+5COR8fjTKx93OOvEOhXE3/zBAAxDyz3L+jwep+H6+Yjy
	 ewNrZnaAyrnyubzUjQCGJj1Ot3TS25cQi3wUTJPYfAzX0N6wA3EPmM6lYGpOeH0zDjDyk
	 NwQw4b/LnF3+OJUpw2KufGNfJOFJu3AImYY2DK12QjV+N5p8quY2/jTnd7vpFFp5hwEyt
	 7B7dZ91XULUgQ4W30pyDGYE6u8/dABNpV/WEFecSsWgHA+OnLE+qeZEgpNUPsIAJjmBTK
	 Zd2ARhATCpP23bT33UwoiGyMsxGWOzFWpYlB3666z2b0zA88/xFjsRIMCT7SI+JTjOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+cJhG4b;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E822C60A2618
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E822C60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+cJhG4b
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e00eee27dso590606f8f.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816482; x=1794421282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAFQ4NIpw4G2h3WAzyEmbQDopp5teXSrxNa8N1logrI=;
        b=G+cJhG4bvR6+Z+oY8S4RJlEN38IG1EGgaF8mSO5/bCTCqWATVsH+4Y1VZGtcuLRjMk
         VAFY+p/LPm43GaDRFhaqT+bL9cc5Jte+JSMCUNHxmogmCbkJMi533Q3QF07rFa+eR3C5
         3PWz3vYqfDX15L8ZdXL0oAETyLZj2WU9Cxzxpi7YJGR8slBt8rBqn2m/JXVXVbzZxAW8
         Wpb3HqBbwy670/5bgPUsSOOXWR/9wcNWZctApoIgpEW6rA5gtzwotyW6S9Gsn8TOwdMQ
         gwRXdgmEGQXbCKkelU52x4emvfJjeRi07OAnOnUcqD0bdTy/crxb1V5NoX1rZ3KXk2FG
         sQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816482; x=1794421282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAFQ4NIpw4G2h3WAzyEmbQDopp5teXSrxNa8N1logrI=;
        b=zsyMZD1iaESADqGvNT816jRVTGI1BrxVRCE3bBFIjEeI3XiPHsuTRztHD6RyOLRlAk
         GLagHL0WH/lVB43nPnLgU+UWmoVW7pT4whHL6WBoznOj/Ngw3RjHas+JPVbPol/PN4mz
         Ebg5dGe9N2mB9mfVP62QfZ1RYEvXOaeB6m+ZAu+sgvNs5J4nPHIz4t291SqcD7FzBKFa
         MM2fNlX98sg6TrNVrlgJUjE1HjCNVmUo/SQVHTQIqy5pNrvjAShJMtcF1IM5yYII3snC
         jOou3C9rEzYwlBhfjJV5wJOPNpGdeVM3aaM6n8TmKTrP3PjLbmpZiK20SHSUAKh/9PXd
         5zjA==
X-Forwarded-Encrypted: i=1; AKwUvBxdKnbrpCirNgB0IaogAwhF3pBFwAmvRS3Vu+JxTyaeA5t8fHM861FFEX2LnBO21ZNEa7kmaL4939XF@vger.kernel.org
X-Gm-Message-State: APuU4Z/2mSNyAj8+yigv1w994ZdwFOl4gdNWeGAHvQtoCp5caKiclTHN
	xH9ESgompyaYJX4kzXj8cAgkB76q4uRHFVMVPmEPuSkIaUfhoyrLTFYE
X-Gm-Gg: AYBFou2tFyKgWg29DIriy0GNYrNOtddrkcX6GzpfIdtyqqSGaIEQ7USzc0oPjeEjEfS
	sLGZmpGVAbzDuwQ3o7bQzH4O/26SkKkcp5mQAO7jZP1cozaVlNiGM8QIp7Fd/KxypWY9xmpcofi
	3Qkr1EYZ+rzZAqLhsV8k6ps+YEyD/B8lhirxQC/Ty6ONVX3JbDZSP3zIVhw2akAnlkkUOo+b+14
	hL793aeCTQNTOAdgdFlcNPrxPyQOr9FoRrT0Xow5OWNZoDM6JXUZIZq3GPOQuvhbIuI2dSTuYnB
	D7NgMHjUp98aFfbDlp/xczRKo0jjWw2iNtUwP1VTvbAzlqG6bXPbPqXZryyaEhwVk4960ISEg8y
	e4z1gldKSrFaEb4u8smwgy0+DAFz0/OQZiuupffYB+vjZ3vUkHMmm2O4uozlyp47/6W5wboOWQh
	HEsOZZHfHi6rYLAeDcmsnjBPUfQStar5KblD5wPUYivQnkHn8R3zj+gswPpETO3HHtfL+w64Gqx
	mkDYp9R4YvzD2MageH7XVsHG1r+tnzcLz2850ydhXKIQpJiU52brLo9no3tEWBQ6N1yYRJ7WzSp
	4HvTdGbYDIaQVYKMkv9oEt8AVgcZldcn/Q2r9/aw/v5fifPm2a+k34lk0/QrKvKjcJUbAaiEEmP
	jvC/d3zY9X7zBgjXBIv4b3wlXVsAP0RS6w+xW/w==
X-Received: by 2002:a05:6000:e89:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48e6e4fac5bmr27612625f8f.43.1793816482340;
        Wed, 04 Nov 2026 10:21:22 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:22 -0800 (PST)
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
Subject: [PATCH net-next v4 11/14] net: dsa: rzn1-a5psw: Choose tagging protocol based on compatible string
Date: Wed,  4 Nov 2026 18:20:59 +0000
Message-ID: <20261104182105.1102555-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index ee0187aae2bd..f8fe6f3b8e12 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -97,7 +97,9 @@ static enum dsa_tag_protocol a5psw_get_tag_protocol(struct dsa_switch *ds,
 						    int port,
 						    enum dsa_tag_protocol mp)
 {
-	return DSA_TAG_PROTO_RZN1_A5PSW;
+	struct a5psw *a5psw = ds->priv;
+
+	return a5psw->of_data->tag_proto;
 }
 
 static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
@@ -1324,6 +1326,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
 	.cpu_port = 4,
+	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 197ff5916578..e952afd95dca 100644
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
2.56.0


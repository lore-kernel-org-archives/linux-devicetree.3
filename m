Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816474;
	b=JtXIq56kMZQWvbo1zCezLOIgu2TgtRHLJxQQDIQPR1vDji9W9bJ6J8EBzFXrSCSR+CgA
	 ES/3/JbbDOQ9rcKjd9oZQecik3pZLYVF1zyhM6jjQfRaNA/DUkt3716sGF9aQ5L+vlS7z
	 qE+VRpqJCtFhkdXyrfS117H2yCib03eyaKzNh1qnMpo3x5O9ywXqTUcjEylEJ6JFWSAsr
	 4DWnelvrdScFTs5N4vC13WZ/yFqFF0K/E/MOUzzfeJiI5dl5eRcouI9rVZKY1Ghe558K7
	 eKQC4x3nUPsJGdROrlnb/+biSmPEFsR57G+3fP7KL2iM6PrZx/ucmMlu3QJGhXaiteg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Sr6nSQY3uWEqkIiMYzgpKENOs6ABbPBnX5Q/I3z4scA=;
	b=kCHAb/oWFbkacZtAGs5DYNBriI0/Z37kFjEnx38/ObxbB2yYBhA4sXwsexVI+9tktAq2
	 a0ZhoaSG+c1a56Ddsmuk5VuGjd45QS07eVcIcAO77fjBC3EXyZvf+itMuTfWszSRQqZmY
	 Dz+rZzqYmEkpyKBFjJdMGpUbRcziBAVw04RBM09aZo7v6x21raDMIntmvtzpxZNdhKcts
	 Qc1rcEqzuttJOse2j7f61FJa0srZdviauZxpaegisgi+VMoJ1UaZrRHToRk8tH6qyEGwz
	 JJVjB9+T/PuGFwsPOZ9G66surIyXuC5kNbk5BUCol1jfZzHe1rYM3febDUXdlH/3ZCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAEQE6J6;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48A1606EE85
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48A1606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAEQE6J6
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so688693f8f.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816472; x=1794421272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sr6nSQY3uWEqkIiMYzgpKENOs6ABbPBnX5Q/I3z4scA=;
        b=aAEQE6J6Yd08SLoynnSdAXVwopPn6rtlIDJWOD5R8ioPI4Aouvtdxf/xvyFkxsyk4T
         +H1DeyosJh1gmvdcTb2osWw4xOEEqFOHPjNDOQRom9A022bCE6TWjeDkzda+jx4ugBfw
         Y82DNo8MYfpJzNOUY7c0Qk5keLwWfpb/BCiClIZVCrt2jRR9stgc82IxppQsTZiIn7Pp
         hWWGOcRY0O6P2kzykkA08Xl4YcSuQaf0chOjzl+iCqv9/WVrxucS+mbB/Bm2xOqahBR4
         wqxLP6rzpkE42Evn3Frr1K3hyTWRJs01Nfl9NKai0lKiGbEkCYdDDlUtZsSldH13kEQG
         gnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816472; x=1794421272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sr6nSQY3uWEqkIiMYzgpKENOs6ABbPBnX5Q/I3z4scA=;
        b=xUbslHueBCQjJC9YfN+nS577PR5+47TUSF5Se9hrbO8GAmgtnQlBnBtXQTMnqB9Qw9
         4QwhPcThAU2VmYqop70Wr/9T2NslSfEcEL/gUOm5IKg7v0kdFoPZQLtXeYjyTKwu4Jj0
         56BpWFGsSL2SwqzIYUKu97gvwax/no+Uv+y0EmT6aZH97ASLQUGGibo260UVCPJzLG9G
         tC7LzgaHSJT1m/SqiMgMw8+r15/OT6wmTED8L3gIR/q5BELuWxNsmwFMlkSXEejQBhKJ
         uua/bEOquOvb3qRIz5SzRsVso1euuJM2Px258Mit1Irs5IGZ1xnqzTVa2887rgXmVDiv
         WhEg==
X-Forwarded-Encrypted: i=1; AKwUvBx5WiHiTML9vW0mWPMeTZVPO9qGGG7EZZ+YY/M+dehzC4bd5ogt9/pUUioyRqxFq/2fnAlfWn9FslF/@vger.kernel.org
X-Gm-Message-State: APuU4Z9mm/4TLvcIoQ70R2MT+3/5jPiF3tUG7M+8XmjbEFL6Qtdm/Bvr
	/66DaNRaV0z6qOrbja/6bXEjs2SYMaYe694M7l/quSXT+yeOjSnQbVTL
X-Gm-Gg: AYBFou322wSbSnXaZ8mGbDvZ3gkCXLcKTAzE8bYtzaLZukIjFdbeTMXT29Uu5T5bUhP
	NCHK8QT9MrKWct8U8kt0AXrWYUApHBYv5rf2XxWHA8jLer9DbHclGTYQkZX2jqHM1yZMlRfxbOs
	Ielv/5/cENNinW9hfDRMPwPJZESDpXbcpnYn6A5PYsmA0dQIRnwpifYIL3s0RC4qHEHsKuRwQof
	V1op8wMlJaQ9UqGvVDIWfA/gj2oXcnSnP4tTKE/1ucmqEQTaqf1zPKh+ap2ibSmbBAcdB7IXesy
	xCtpewyvmh1HQOzMfxoYzv82Hqfbkf3Y13mwYKBB30CfvumnEdAyW0iyVjY8DWB/00Z7eUFqRvf
	yJO/OGcIZyqmeEoeff9iMMXZmFHTf5xnsuae3e0WkgKm9m+dREY5lJwAgA6iYvrX6rlVwC3VOay
	zKwwAsc6bAM0NdAX24XxE9hJ6So78KJV45j/3Ct5iqS6xhwtj0wAFg9ZOlkQjKaM84vXMmkxPTQ
	ymnF0VQYH9rqTCEx/H0GxJeTXkPUiGnBy8XVUy5qSDp5JBpRjn9GO21fW/4gZONUBSj3SNa5xlG
	Kcsmn3fb7/5R3uzgwiITWRiVU2FLcvsOgZdD3jPvl49fs1QcePgVeTShdp2FF/lLHendBXUaWpr
	2ZmF7COExZoyBTfp46lzRQ1ZVNKiRK9twgRMW0w==
X-Received: by 2002:a05:6000:2089:b0:48c:4f6f:62e3 with SMTP id ffacd0b85a97d-48e6e2eb736mr34348488f8f.18.1793816472184;
        Wed, 04 Nov 2026 10:21:12 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:11 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH net-next v4 01/14] net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
Date: Wed,  4 Nov 2026 18:20:49 +0000
Message-ID: <20261104182105.1102555-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Remove the locally defined ETH_P_DSA_A5PSW protocol value from
tag_rzn1_a5psw.c. The macro is already provided by <linux/if_ether.h>,
which is included by this file, making the local definition redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tag
---
 net/dsa/tag_rzn1_a5psw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index 734910156dc3..aab0ec143c77 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -24,7 +24,6 @@
 
 #define A5PSW_NAME			"a5psw"
 
-#define ETH_P_DSA_A5PSW			0xE001
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
 /* This is both used for xmit tag and rcv tagging */
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134357;
	b=iWN/jyZneyduO2idymoOwsht8adDTXG/f85b1ncXZ7Wi6LD5Hed89BR3MwIVKRNj7MIw
	 RNCB2ur6HXdwvWWsmsgbTGFeLbj+wPS9/IsFxvUk+4JWxRn4SYX8zjAJHd+L/drNSbD9a
	 voYoDCQZ2XeSeMIvoZMe3vUhSxwN2+vBKuXHHGR/2zBtln7TJ4R8N7Y28lh7IWvwr6OCR
	 bT5U/LR2CNNtFTI1LPEcFtdb/VSY7q0QuctFWpXcJFEz1bZN6IeK4xsLs9kQp/WgT8Cdf
	 zUwE6btSlVdfQT6XXw3q6iWmimzfqEEYZC4EyXDk0fXOT0NPHu+4hCdtfVkvvhPdreQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Rq+rBhuc4c4d0wbSM6sllDNZWB8d58n6PTIrLy0nE6E=;
	b=cWER4s33Vtp72Z6sKvKNfVsMyACwDKg2kUdtOn+Tyh5VQkzWo3791ODjTEzcQtRj2iEi
	 AXT6YtCJuXPcWRWrkCpDy1+3dH08uAKNUQPowQm1HLNBKLX0SrCffyIGseDlZAKnPT+FS
	 63bC48Cu/MO2IOWDBt+oEA9zpgNebusu2qDAw+DEYzaR1A4wkTLhmN7M1FhAWn0VSyTV+
	 dDQthLk3fLjEmoGXPgAsPX2gHk0y/4ShAEkxh+pBT7dzlD9UZZehAJ1s4BblWkUJD14yd
	 QAw0Uocq65l7CBUvx92JrpJpx4/iiv3qbau2JDnGoEc1cRfHI21kiRWy6vt2+WofMjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iuwbdave;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC7E60A2600
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC7E60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iuwbdave
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so2374285e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134356; x=1795739156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rq+rBhuc4c4d0wbSM6sllDNZWB8d58n6PTIrLy0nE6E=;
        b=IuwbdaveVu0dQdWfvEKuykC3MeQS2t2S+vvZyH94+kcwIftMXRbZ+6Pgek6qeV4riw
         rXbJE1Qm+Tq6Mw3Ey1ExXSX2tTPQkh7s25kULq4Iw1c+DPaXDMlleephapy1Ls7ouQM0
         kmP7UuFVttFu9ELPBdGGgGEOMMkZtaVWXQnyv19fsTSCLYKELQSvsyXskFn/F2gFTHEg
         uT5iIlFnB3yd3IoGMf9lkLdja1EHYMy+GFnZuGN5+qog8YNLsYl3o0aIaWHNpdtvwFl0
         SEfGLr9V/BCFvlMXDlryoCC4Cm5QA67us2yaUBWFZF6AE4jdwseJxJXS7zANpaGPrPe3
         DC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134356; x=1795739156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rq+rBhuc4c4d0wbSM6sllDNZWB8d58n6PTIrLy0nE6E=;
        b=0Ep3bSNmDYk4iRJPMeTQW3TImp33j0IALt2EKUeh06RR4W9ByvTSBJHhUHUIZVyW1x
         abveJVxedqniGTJxEUQGjwQxicnLgI+twGCBpcXM0UNbbE3/99k4qocPN+dw9/G4ZwP+
         /CP2pJUs1U2sbvZKMAzJ9isASBrrjuUx56rYL1RLCfSUh4NCixRzSIiPHEjqpEeBIyH6
         wkT8hZ6QPBUK6i/UXnRf50JPZ7wGOUg1R02klH3VlxTvATwuoZKAaJ2cLluvzY1Go9fC
         g3bWnOOuv0X+vMVM4iENUStPgPj/7XczwMQEBTLjmesglr8JQPHYL2b8Odtv47T5fp3h
         Xtcg==
X-Forwarded-Encrypted: i=1; AL+hErFUJ8RyqYoZQ+l2fX4rfwokCkoKklyyuJpDIAZ7FBhlOIcUEpCbFVGYOcPRGmR8DhqjDYmRaebI3hA2@vger.kernel.org
X-Gm-Message-State: APuU4Z+RDY+RMjVeOUzWjQtCC7DrgFvNiJLB4zRf8ikjq66ZhI3rlzue
	ceqjNsZb2uVGel0RZJ9zwAAQ8u/SehE/bzzSGXJ76Isv5ZRysGv3W977
X-Gm-Gg: AYBFou35Yto6qc4rLWq9Mnfr0uz1cYEQZx13LrGPkCoTqweLQNaF6ipsGkiq2ozfYiI
	UZbMCGvZt4G3C2gI0H1ASwvElfYLliQA6ncNfuqAkT2yZDG1S56f+LGj0nb3Y1WCkJiT6A0c1+t
	tSDl10zGAp9Tm9BvhPQCkpK5D82e5BbSaULhyip6skyocxBGXD/S/RPhzGqjG+NzAnkwN1AgPVu
	AYrOuTPGd2jRvcCEhlSs90W6or3gN3cRZgPMCOfPAvf8f5kcKs1ZbEw3/5E8m/YmOxPrDsB95VZ
	WAIHE/l1mdp78DqXWvpLcHMDPsDvwpj2HfO4uW1Lyxjk1XY8gRf2/hIB6RW/M3MRSlCMczJP5Ir
	hK3lT4B5qJmdTTsohkGzG1Ly5pnvQBnVlTKIn1n+ty2q8baGWoLQVV2lLcQbWju8Yp2aB5bjQTb
	KgwhOV147cxJ2F7kYEJGEQG/1W3lwD9q1CfDvzbOCJb05DQoDXbVHwnQDtO/AUukrRkreorXWfu
	eP9A8hZ60czzWEQkF3MsuDfZpbqkwuaoqSxqy/6ujkdIyNDTYXjMCUnS+42ODSoIAA4po52WJ6g
	gwBvE4u64rzgFxoMTO5Xcw9RUZ69VyWvSLUQbXBz6V+bxNVnosP9iCGGbYVBQO+ZEEqnD4qKMM6
	VY+kAfu0M5uU8CIvRKwqZCnR/NpE6lbSFbyfovWKl6fKKft12xFDUE1i647epR9aFP1r4leYr
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr25136615e9.25.1795134355703;
        Thu, 19 Nov 2026 16:25:55 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:55 -0800 (PST)
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
Subject: [PATCH net-next v5 01/24] net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
Date: Fri, 20 Nov 2026 00:25:11 +0000
Message-ID: <20261120002549.1908299-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Remove the locally defined ETH_P_DSA_A5PSW protocol value from
tag_rzn1_a5psw.c. The macro is already provided by <linux/if_ether.h>,
which is included by this file, making the local definition redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v4->v5:
- No change

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
2.56.1


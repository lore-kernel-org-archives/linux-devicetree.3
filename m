Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300D123FC5A
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680892; cv=none; b=PUJCIjuJjC6GuTk2tgbakO8wHbnJSvFiii3it2EwWU5EtkUNXDQrxjJxvcjJWJGp/bI1PSiEm9sD5HdMVRLsOk4qj9dXcTpwyELlVvY8kspTt6B3KmvezlI1BAFrR1M1Z0Rck+x5eWFQwhhTL5yiW81SM9Y/xCIXIsfmKdEPmvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680892; c=relaxed/simple;
	bh=NWU/L9LyNdI3jkcdYcdQ0x+UBiKXh5qxqTH73c/fPpo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TxGOJHy9TVe9PLBwBqVuvBodm4ZpfAjc4Z0cP+9SF5xDgCsoSWSrJtaqcZeV1R2C5tY4YkTohHNUSlmSl6QL3H14reJANdn6/tXTseZ4r2sBWxM9FP7tvVK7IOYDOYQS43l00C/lh7zdVPrg4DPaDGQjYy1oEfK23F6yDS19ojQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCBvAtwX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCBvAtwX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso1008249a91.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680891; x=1784285691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9M4o3iN5nWztVryd5NG1m3lFycIITbNkOd3Ijgz0aSY=;
        b=FCBvAtwXMkiTTP3tThQa0+LS4rS+Wh9++a6sJwjqnZlKjw0LJ6Y7n0yopFTmRvCS3P
         +tlaWwaMBWWdA0UN4p5MHsrW1FF1I71YxivknNqB0bmhlS/g21D+MyQNIT5Ruae0dQY8
         daCqy00Cx0bhcjpGvGRqcXuIEbA1Iblrxl24D7T/dRFZwEyEQwD626TJAo2sKbRcsREQ
         ldYl+siDVWiqkI9uYa3CgHxHzUAZAgEicT5OUzhwrMv9iBWq4gz9n0xspyHOYLz1BG1E
         cG2ik2YFsHxR+voH3Pj/L+G3N7t4CPRgWYo2L9w3siAyRCqgq1CwRSTkJj/IusRsRJcu
         OO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680891; x=1784285691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9M4o3iN5nWztVryd5NG1m3lFycIITbNkOd3Ijgz0aSY=;
        b=Ww2jiDwlcVYeu0D6mM1XIT6xNGvFQzDZdsCP7cjfwvw0qDLEV6qcOScM+s9qFxo2FE
         9SPhN6pw2iESZGjWRfzFj077Ki6axM32zzao8lNayYMr067NFZsqxBxFi9lsXhObaPph
         spnT74F6u6w7qRgobSOHdv76Y/wGSSo0Upts+8pse8CjTdoittZO3U0fnznGiiReI//U
         RHOthlmCzAPvbqgTNCDzVBGbOl2m66BY1+RMv6eORqK89g4d5t5ylGldmIXz6KgxYGfR
         b4oI2dW7sfL/WhVmc0FbjLmAeAP/A02m/tG5T9vcY/UFPVdrB/2MP8fgMzclRwHrsW/K
         3cGw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4HsxyvncqSO/eHkSKD4rFRDxbV5rBQSxadw6DKOaBL6z36nEG5Fhw55A1R0I5LWjbeOh28E47Lzd8@vger.kernel.org
X-Gm-Message-State: AOJu0YzAg4mo1N+CQBPAlgLshNv8oaIQSV4sk3MTxTHm1TwHMQjPIrte
	tHOazsQEGqhcLNntTrNRERcrsvWXR8f6hvmfn4iqiPZ6dJNoyFY6ypEl
X-Gm-Gg: AfdE7cn5eMXuQwYuzzguw8gsk8h4ZkRAzuMXnDQfWXWM69ttFedjwcQ4EzDgjj/p1EG
	J9kc83Ge3eI0An8lOW18A+Ek2LnUxASY5fO8gtsYGFXuhURjcw+0Fc9Op9yHRCSyWNdh1OMGmu2
	+ffgv6gTfOEtIHVqqJtBrsEPFie0xmerWmBg4NYjx4giWakUQhHzNvWaoFEdUZJxxuEDKr/oWDj
	c+cF7tyzTZ0aRUJTCHKuG8QQDyL7ZpAzy1mQgTMz7p6Fv3HQhhhhqacB0+G5SWdsUhBWPkC+pmV
	sIek/ScQ76Jkt8kwHUGxdYlzJUTN6d+Glr2NpMUOlrk5/ATUZEc5Bkbf3xqnPg9YKXvPKav0fl0
	YRPSS4giiTggybY119PAys9ukRNKFoZbar0gR0PBc+1GWs0UibyE2gU+DjkI7W5NeDxnqBENBqA
	lScfjRWpueVL7U5ppKgMbz
X-Received: by 2002:a05:6a20:4304:b0:3bf:e24e:3afe with SMTP id adf61e73a8af0-3c0bd206c10mr13691119637.43.1783680890615;
        Fri, 10 Jul 2026 03:54:50 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8572sm40752937c88.9.2026.07.10.03.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:54:50 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: dsa: mediatek,mt7530: add econet,en7528-switch
Date: Fri, 10 Jul 2026 14:54:23 +0400
Message-Id: <68e85666b6dfedab719aaa388450eb86312eccd0.1783680864.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1783680864.git.naseefkm@gmail.com>
References: <cover.1783680864.git.naseefkm@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EcoNet EN7528 MIPS SoC integrates an MT7530 Gigabit switch,
memory-mapped in the SoC register space like the built-in switches of
the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs. Its four user ports
are connected to integrated Gigabit PHYs and its CPU port is connected
internally to the SoC Ethernet MAC.

Add the econet,en7528-switch compatible, with the same constraints as
the other built-in switches.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 815a90808901..90b3582b7619 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -100,6 +100,10 @@ properties:
           Built-in switch of the Airoha AN7583 SoC
         const: airoha,an7583-switch
 
+      - description:
+          Built-in switch of the EcoNet EN7528 SoC
+        const: econet,en7528-switch
+
   reg:
     maxItems: 1
 
@@ -318,6 +322,7 @@ allOf:
             - mediatek,mt7988-switch
             - airoha,en7581-switch
             - airoha,an7583-switch
+            - econet,en7528-switch
     then:
       $ref: "#/$defs/builtin-dsa-port"
       properties:
-- 
2.34.1


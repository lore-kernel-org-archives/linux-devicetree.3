Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7545E1E47CC
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 00:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790295143; cv=none; b=OU/odKFyBYsRdkc6nCTozTmpnwh9u9soCRjQV0W9fURhd9OtYzvJv2Tkxn1ECuuGgkF6ON5RNTMok2gVSZQ9dqFMCJSCApzrRS6v6SnrMETsD0/6Qassq5gu5yUIVWwH1wND4TvFLbvrMr4bDTiCWxO/5a86Wz9yXwmGtA3tAnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790295143; c=relaxed/simple;
	bh=MO4DCzOiJvahncAwtOSB6K819MkQDQH4Q0Oaw+W51tY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9N9DxqqDskghbF3fnYo3UBo2X6v0iodK3jyRZijC040wl6l6YjjqQBrOWxoiU9/yMIPLKEKmZT2yvAaWzIA9JeA7HUdZ7xmedIQVH3JcZUe+LNGuU7e1bPuXAravzITC5izDxgbwDaxSB4+YkJExnhnKWqtI4x2S38c4vhnrBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=MhTl4yyV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="MhTl4yyV"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-488615e6cfcso628808f8f.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 17:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790295138; x=1790899938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekkpP5b06Snvbo4ruQYW5bvGILgj8Lx5k8thlgPN0w8=;
        b=MhTl4yyVl5ha7wKP47uPI7ljVaoa7qGi/LbXWE1L1mcNCAEuWVqn4IFjP25b49wGYO
         epGOQtJYcYRM3womKWf8OmkScAWCzkb0oygVXpgXOnbrENuBUuW1uWf2DF81jLZpfNmw
         mc7mYdx5z3KRBtAhcUNbPQKVFdQKVgi4fNuLLlh7WRxSQiou5C/eYbwSgEw/LLH1hrYU
         WT1ZW82d3/fo3oNvz+bTr0dUAi5meTAPXCict2Hdi0NbKAMzsOH/Kj/omxUiGt58Xsnb
         m/wTNZCLxLJnDbbJHPq3iI7ssJdpdmzOx6FW/a+ma5RpevlbmIL/2Ee19DxbwzewF8M7
         UOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790295138; x=1790899938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekkpP5b06Snvbo4ruQYW5bvGILgj8Lx5k8thlgPN0w8=;
        b=il3xTq95oXAHz8gMyx7dNq4DmJSpymAGlxBKN2xMu68CLn8fWqLswqwG0kHxxs1Xwn
         8O8yJKUh02kZspgf+PLfqsO7TViTjmEUKvKtCkmNEd0pUNBufd213TAIbhICaiTZlZrN
         RJX2moE++tzL8wkqptJhZVHmFTdB48beTGm2MFJrjy6YSrv0onmsR/e2sQ4/89W/81ix
         XmVCFonB4aPTiuk0lq6PNEDP9nbnEUfDWRPLlmVP/XHXwAliPYoScOW4MrYP3qzzWfm+
         esXEnZwqtXHC5PQWV8xU/x/1hbN6yl8wfLgOE9dhGidBYw4YB9M7Hj9MqVVZymgBOiuj
         TcmA==
X-Forwarded-Encrypted: i=1; AKwUvBwnhAkWYunfEUKKECOXtIpUkUPsq0+If3E/k7RF2BlsKMTfbE4gPJHERAvbhbMAZKIb6YK1i/PIsNRd@vger.kernel.org
X-Gm-Message-State: AFuF++le3hnQtEtMHO9YZo9HjjEjjbji78zYt60eqVyDltZymeM6U2pq
	czGU7IWKUBJpupUJqJ5rlUgoDbgzDefyeSrRyU9H9fGvDaJwtwCxn6gpXXyaQfkr5UM=
X-Gm-Gg: AYBFou1jR3hbtam0nMkngta5+cieEllH14F1ncMOugbgW3cv7AXNJRcLdtZS8preBD+
	vuXP//Tsszxs8EG0t3DYOdk/h+C8axSFfucjaSbWx0VMs05MAOFhWNQ3Jr4wrBX+lYBMysonfOr
	Khmt4M7Jjd+ozmU3VNmwGyu2ATmk/qP2ieAooQFf3KrpN6gcKVZ4I+x2JwSpaRZZo9EQ+kvlV88
	DQYe9TKgHyIFK7QSRTlAj/yRHN8UCLoU/vvuudskPLatKviQl4shqTvEJq2uE35qyJ58ewvjx6x
	CrkeWKxlN/w8cJb3ijQfeSSUMqrhIvihOuZNaYToGuXHu6wgb2DgvJy5zAu3sy/R6fu8jWo1gfW
	wb7V77DufC7ZB/Y6Uo0K+4ZomFSywq1PELtqbOv/ariKrxCG9aTVqvqgVcNLcKoAhDne0+iq8Ia
	CFcSMdZ8PNNvt35R8QB56TqGc56Y3UWN7QIsG2lsV+QCoVHXUTI94mbb9cutZI
X-Received: by 2002:a05:600c:2254:b0:49c:f13d:ffed with SMTP id 5b1f17b1804b1-49fe845cbeemr50823335e9.17.1790295137252;
        Thu, 24 Sep 2026 17:12:17 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm2331621f8f.5.2026.09.24.17.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:12:16 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 1/2] dt-bindings: net: ethernet-phy: add needs-host-firmware
Date: Fri, 25 Sep 2026 03:12:08 +0300
Message-ID: <20260925001209.2334139-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925001209.2334139-1-f@lex.la>
References: <20260925001209.2334139-1-f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PHY can be one that the host has to load firmware into before it can
be driven at all. A controller that connects to such a PHY at setup,
before its driver has loaded, gets the generic driver or no PHY at all,
and one that connects only once gets no working PHY on that port for the
rest of the uptime, even though the PHY works seconds later.

The flag declares that. A consumer that sees it keeps the port and
connects the PHY once its driver binds. It describes the PHY, so it
sits on the PHY node and needs no prefix naming one.

firmware-name is not used for this: it names the file to load, and the
EN8811H driver keeps its two blob names in code, so it would only be
read as a presence flag.

The need is not derived from the compatible because the knowledge that
an ID needs host firmware lives in the PHY driver, and that driver is a
module not yet loaded when the MAC connects, so it has to come from the
device tree.

Found on a Keenetic KN-1012, where the EN8811H behind lan4 has its
driver on the root filesystem and the switch sets its ports up before
that is mounted, so lan4 stayed dead for the uptime.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index c3ebb3af8b52..73827662ddce 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -215,6 +215,12 @@ properties:
       used. The absence of this property indicates the muxers
       should be configured so that the external PHY is used.
 
+  needs-host-firmware:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      This PHY runs firmware that the host must load before it can be
+      driven, and is not usable until then.
+
   resets:
     maxItems: 1
 
-- 
2.53.0


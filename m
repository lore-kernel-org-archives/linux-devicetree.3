Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134368;
	b=OEhZYlIseni8gw5hF/bqWh46w1tAjc5ikZqaA9RvR0vt+byXMXwbH9SBjstqQB3BH3hS
	 PYRu1tOmXWvuegIDvuX+8I46WoyST5cChuNyHMCyKQgktM2WK00B567M8/E3jBYTAmqCx
	 8cIbBOHIS5b3cvWb1CI0KdbVSEYF8LHhPJv30iwYJ+HMtAhB4Bh6a1l8pF8K4OfXAtqPC
	 mkTwjiS4Sopy9CimRu+tTFtnEBgql5BooDHy821bAXFCsUTEUFSuZUyhiaU6sUjr2HshW
	 A/OxFxVAUFwzcjOp6T8grgTyHywDyBBu/CiundLZDEUBQYSMOmpDdd6QdUBhLifX5Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VK1fNNRgahgZ5UbyQMtX297sn1lHlnpRVOZJQu9znQU=;
	b=HFnDM/0Z/IdsReaEOJ/ncbXHRD3UGbb39HF16VnWj2dw97nYIcD/NbqGDc0+QXwzkZ1d
	 f1kkNFdsAKV3Xqvd/d/Zmz1vgwOTTaoZioOvdFQXOo3H7o1NgDKxLd79rAMpAxg1H5Kfe
	 N3hVe8Aa/6DDYWMqQC1jIpmD882Fn06V9kIfM1cvSiL71jD//o/fPV59uLzxoEP/IMkag
	 sC6hHSFtKdNwl5sv8kRP7csNTLQR7Ps7oSqHyz/6P/c0XD+jSPSwCLRsgLDfU4TWzyMyy
	 Fmeh7bXEU4awPvlke5yPhTCq+H+RB7Jbg8B9xE9TsVIrUEcGq7asHZFLckU93e3d1SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFR4Urhh;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C8160A262E
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C8160A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFR4Urhh
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1056105f8f.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134366; x=1795739166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK1fNNRgahgZ5UbyQMtX297sn1lHlnpRVOZJQu9znQU=;
        b=hFR4Urhhy5pynmaEn2XSWln1vfQRlQu3rV95ts7/CSzJHMgltu1s5vMK+GlZFtabnL
         uhEcjM1QoN+HW0NKsZxsJfRpPZFJDUgxZhvCw+mYjKBvEIThRt1KOCbN8txky8IUY+d6
         FJ8p1o3z0gp6qxxOZaRt+DWG11k1VrjQEvphx1igmfwBtK/YOagfh6f46fS7XZmi7Svl
         fU1wIXA/1jJ0WU3VSfIqYvEoLH7gJivUCtpwgiKtcLPzPjBHaZm3MHw4RU4ZpkFFA9o+
         1F1P/oAX9LdxiPLgAivCuOg9Js3YxNRAhBngMqEKisrmCXCwUbNw6g/dmulcZIoMS8wO
         vMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134366; x=1795739166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VK1fNNRgahgZ5UbyQMtX297sn1lHlnpRVOZJQu9znQU=;
        b=g1vBDArp+7z0/HaxP25uZr+2WzH868QwhLKWLM0legTWZKraJk/qmhxeELsRIFI7yB
         XMZpXj3Mhr92bU1Fd+/v0XuMSMDJ+zQSKu2eLFE8mkAf6y8L+xA5/Z0zEY1kIXpv0Sp0
         p0CV/sHVnnrgSW6660UsjPQWRCXsZRaChSUle2zBwRerkOls1SGOIqHRCDqaOWpS3vD8
         eWYLatjvJrLl8Eh3FLTLi49U+MVAH6a564O7alyp/kfIYKpeA3n10bUYU8J7d7/aYs5+
         lUf2H2oi4GboD1JAMjd9+FqVdEQpoZffRYQMbe2yPBNW3MqkHOsB4AWTKLAG6oGy91UM
         Gkqg==
X-Forwarded-Encrypted: i=1; AL+hErEhdqe50561gB8iLrjnmn7sgF5iVbBWfgG49aRWdiejHqUE8aleYKlCYki99RPXGL6YCPU5ytGSQ/++@vger.kernel.org
X-Gm-Message-State: APuU4Z9s4tcLLJ9c2MnQEnyAsXmfCM9c2wkOetan8j7AkadWQfImivqZ
	wQCh4szvSEmYRYsDj5bIMJqWw4g4Zo6EyFNiUY9fgfxTfReJTlvwrykk
X-Gm-Gg: AZFdTZcmlSHFpIyV43/7sU//sOnZvwFUBAMj4JSd26JxCZRWF8DAeVlU0Z8eA2aqPGY
	ZCAVkwl6+pGz5RhQzn1ETaKP0Uu5V3jJQ5GxVqwI/IwNQMs19lMLLTlYGpFEpmn7rSOQ6iVIDrN
	Pi8zsI10PHKt+WJi+Iw6hZzs8MNBG+hMqsPd0h6cYF7y44ngdFf/HNJaWOqWEWegwTMbDFtNUfF
	JKqmZjoz2ajK8bagjfEMkJBkbuoX7HWxJ9uzDHau/wMEpzsDMT9fLrx6o0Hu7ogj3GmZiEYhmzY
	YuDQerO/PAhihIgQKK9g4hjHRUlPMY6o/wC5edzIXL9k23Y7mZFJXvZPrJP2RnrjdAH5Isnakjf
	DHCqYOLt/Sv6VjVzbSzo+EIxAzPYdoH0J/6DomOAPGyONLekECFTCxNSTUygIc6yavCFjXsy4g9
	wI68IReDTVNwuvwm702zSUaGbYxTmg3B1mh2tsfD8Ju5+DZ9VGxP/2iKgcWEcORuo5HVHJrLPfG
	24fANRj7ilUZXdpmIBFEAdGLgTnnl5v9yfcazgATlSoJCrjtE6dP+08XlVZoFmaJmZiEshpSrNT
	iOsX6DPyXWC9iyroUpm23mgk7be/K2xk9fFWXGAMp4ED/2vgr+eLOdmKUYFJ0AxG/vXrg+07pR4
	yr8u+7HZZvbY7WTzwWjHj7MgkNQGcPDgKLMWU7kawRplS+D2EgUTCjM9DGrU8FlaJMgJwxHEe3q
	SRi2qvPTjFOL/QUaU1Yw==
X-Received: by 2002:a5d:5f08:0:b0:4a7:1428:13f5 with SMTP id ffacd0b85a97d-4abb2448700mr2097188f8f.14.1795134366161;
        Thu, 19 Nov 2026 16:26:06 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:05 -0800 (PST)
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
Subject: [PATCH net-next v5 13/24] net: dsa: rzn1-a5psw: Add support for optional timestamp clock
Date: Fri, 20 Nov 2026 00:25:23 +0000
Message-ID: <20261120002549.1908299-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
driver. Some SoC variants provide a dedicated clock source for
timestamping or time synchronization features within the Ethernet
switch IP.

Request and enable this clock during probe if defined in the device tree.
If the clock is not present, the driver continues to operate normally.

This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, where
the Ethernet switch includes a timestamp clock input.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 669dc584e6f7..4b31a1d331e1 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1217,6 +1217,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
+	struct clk *ts;
 	int ret;
 
 	a5psw = devm_kzalloc_obj(dev, *a5psw);
@@ -1251,6 +1252,13 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	ts = devm_clk_get_optional_enabled(dev, "ts");
+	if (IS_ERR(ts)) {
+		ret = PTR_ERR(ts);
+		dev_err_probe(dev, ret, "failed get ts clock\n");
+		goto free_pcs;
+	}
+
 	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(reset)) {
 		ret = PTR_ERR(reset);
-- 
2.56.1


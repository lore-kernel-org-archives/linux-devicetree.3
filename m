Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729482;
	b=chscefIqOUIkGjoAJSIZVBXX0x1imtjt5fURLN7iD/MLf+aAhxu0iwCO2PhJgNr4nBE9
	 ujDu3uE+C0O5C0x7M90Ai8vGEj4BhBx4YNAD5QI0lJJd5vWuMdzdZwTZZKlBn5mShIzAB
	 DzvwntZDMEkKMC/fzOA4RD/Na9ZQfjMiV9n8TAtvutyMXltd9UDewfNCMFpaEIgQKbaL5
	 4tznO8PUFKe98726b/nS6Y16FrCCxKoSHlo0vFcM1yL/egVcXUjJAmcMAAZap8wkeuO6r
	 kv/HqNw6DzeUNtjRXhVd373oicWMY6rufIKUjmbcFS5B1JdpnLvfeRqhBeHOTbu+uFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=;
	b=2aoW7hsI6wxyqbIshmOCisgBJpKl6GCPaWT6omc0OdawdPzkb89eOjVeDDNFHWLwnSHo
	 GM7Juh8eFMZkprFR2v6BmPU7/cVyR0A0s+G5mf1zF48E7usJJpdd+kwM1mqdpZjVeQYyC
	 +96nPHoamu++CFOPh18Nwzsj7eXt72rD1ROVekvnKp8zZ9vqpDtgiInDKSF6LejkYeYGe
	 iLFd2I8U8E4y1bFgIlv2kEIiQ0buYDJ6BNcGiMnncqcU3eNNdyK7sK1OGe+Y1XDufN2Qy
	 pFJBGwS/y163f2H818FZUvIEGpw644gV3HuPEaveZd/nZWKOYQYGJGe0da2uS1U3q/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pnEVLE3Z;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE80C606A686
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE80C606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pnEVLE3Z
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so6744218f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729480; x=1796334280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=;
        b=pnEVLE3Zj8JRaPnukXM73IKSuY4i7eNUSfAHaH9vo3XABHI9BvQhcP7N7h8XXrW01r
         nf9RYYG5btSl5KY6o3gyp4qIrTJBcnXld6ynLda+Jh1h2MmuJwnmk4iZCK/Rdo+kqPkz
         tkiwHc6H41tJ7L5mUh7WInIbvNrvUtj1SyNqnj/O0xLpQ3GxxGWdVvgGg9ej6tAY30ml
         rYjjyGJ7YR1Ct2Y+0CK1BmoMo8vw4I4WdJdwRQ93Y1QW+1PX7MlTjIjnOf/fRn5LoIIr
         OUivlcU7VMPsfvaBtON1+PrcUxLJQuHXNMGe4/z1jMbXnbfgBt9EZvCamVXjScXeaL5D
         kOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729480; x=1796334280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=;
        b=BanPjedSLmiTYg0/Dbi7J8MSuIzUZ9npiOcVaeao7CDpICGqkpDhWq06EIT7t/mfFr
         SFT8vRGS5EuJxXfsMIeo2U9+t4fiWZGZaVw++hEVU5BzPHWDac+t+R954USafXWf2FxP
         MeEJeYkOIZM5iGwaOT5lSMdPseR7s90vHDP/JHDJnnPrw4rre8FV4bNaPtE5AGQMuvAs
         gdsITrxWktHcZwF3H+RQPZhTLjm2wJq8GRTuNKelnjS2JsyjFQnDIqOz1K2uwqreKbO1
         J3WcbBsxpvPCdYKakSwLAY/lOZr4gHKWVWsay0hGaEj/8nN3xDfQkdlM5ZKMs88Gtond
         oMkQ==
X-Forwarded-Encrypted: i=1; AL+hErE+SYQR4y0lffq/Y7ob0eHiiEl/t7iGmx2pB2Z2gUw8DMfI5+mAKfmlL8I2Qt0KUYTAhgq1cXJlkXuD@vger.kernel.org
X-Gm-Message-State: APuU4Z8CoZnUglz4O+rxrMjUukmMNRac2PQmvHgRLmBNYZeb1sgKYiVL
	oDmTV5fnua3piDohr/f4xJDef524gNWkVwzdNQtZGdLR5YZwBQ9Jm8ho
X-Gm-Gg: AZFdTZew/zzVaWH7qQC+4JSeYV13Cws4X8F2AdSDQh6Tm7biebZqywLSKzXRqNJ6GNx
	IdLS/awqr6fiUQwaTzYVknSHkJcpO+ZEtBKKjouQet7N9duXyaw6fqElVMauiabZBttrqZ7Hxwh
	CQJISWTtc4tib5NG0J99PL0OfdfoEtUY+9rQlWL0dnUBRWtoJWjuFrps6isyQnHgGz6JQc7O4mg
	eGwUjNvLgAwAEyu4zRxCDLzH/GMjw9ZWTu0LDM6lGBPkk56T9SnwK5GGfSFRCD3IuPR1NqhfzI5
	CiKa2wQ6YorhMG84D2zMZKNFLt3vFuCkdxz+sDt5ZZ4dPvElpiWRXpZ2JsE0yIiiPvec11tEqVd
	E9LYcd5AZBXO7mIy5xt5yHX6Ysfph/PjfoJnEgem5gmJk60i7HCMPvIMM9cXIIv3bTGwVs+XyH9
	4/DjtZyKiR4Fg6GLYaXoFJWnhAipFHWgJLtM0jfGr/8etyadqRkqOzJd4sNzh1bvsonpHuwjSca
	hESz7PjiapXdPj75AYNxJujKSEoKXYioDHSGGtQTb/Ur83Vvh9y8GDjOqbXrOqNnTGjWA4qlczu
	CKeI/VGd//GQHb951RzB7R4Fa3LRu2dFL0z5F7jkqsa1Mm2VFRYEWhYSICDPXuyCAvtpLnZwS6P
	gRzmuxya1nxG0Zv8kl0c8llq0lKC82IihxPkCkXSQPI/TWaU4MJziX7o5u75CqnxsPjbG0XX88d
	9dSPFBsd8rwqB79nRyPABM8Vi2XnBx6+r7gOzgbeGPfRA+lZLOTbWrPP8SbUhOkId/QYYrMHYu2
	pBXdEJcrNG/24vgsGPDVHFay5pMB3LZwCJK5o9kkpc=
X-Received: by 2002:a05:6000:2997:20b0:4aa:d196:f325 with SMTP id ffacd0b85a97d-4abb7f2ee9dmr30913744f8f.40.1795729479959;
        Thu, 26 Nov 2026 13:44:39 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:39 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] dt-bindings: display: sun4i-tcon: Add R40 TCON LCD
Date: Thu, 26 Nov 2026 22:44:23 +0100
Message-ID: <20261126214433.3562326-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

R40 TCON LCD is similar to the A83T one: it has a TCON clock, which it
also provides as pixel clock, and separate LCD and LVDS resets.

Add a compatible for it. H616 TCON LCD is compatible with it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 724d93b9193b..05ed4ddcff3a 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun8i-a33-tcon
       - const: allwinner,sun8i-a83t-tcon-lcd
       - const: allwinner,sun8i-a83t-tcon-tv
+      - const: allwinner,sun8i-r40-tcon-lcd
       - const: allwinner,sun8i-r40-tcon-tv
       - const: allwinner,sun8i-v3s-tcon
       - const: allwinner,sun9i-a80-tcon-lcd
@@ -231,6 +232,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun8i-v3s-tcon
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
@@ -280,6 +282,7 @@ allOf:
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun4i-a10-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
@@ -297,6 +300,7 @@ allOf:
               - allwinner,sun8i-a23-tcon
               - allwinner,sun8i-a33-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596880;
	b=mxzArrgLVlSupY4+8PntuD9QYCE4QwsPbnlH0/Nteb6XVsnqhxx4pIQpS/B6Siv5kawu
	 YSHptJIFsRNpSC1b8iMH21USb5SRbdcwX1vxx9un6w/NG0cU66yA7WNEn3u6aYb+xP3eH
	 aAVrQHTZz4JKvGfg/1mrB8/EAaX/Cw1YDVL0kf8gHW5UyjGTvTzBRv1wzKzggUJDuVyXT
	 rwnbAqHznnsYAMv/yF6fS3vO1V0T9O9uQXtBjpmCcO/M4I4qe39nsh4EOX2WSqzEkCdTA
	 BzMRgKtirZ849BNiM+dOSdQCWmFyZKVV9cn2P5cCXyGI99L0/oaQkx5cRLLREqlq4Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
	b=M8J6KjmpalKf8shClLBbVt1MrOc/0eG8/g1mW5nfgNM9h3+sJOyvTWFBgi6oUfiYCGCM
	 BfSFQGIgcjg4HauLY7BbFIQhtUJ+TwKNSpA7VqjhLNlfwUw8vzpMjIb0hzOvd8MgekJtJ
	 LZ+/BHvNqQ/dQ3d+09heoqQkmVNVDVSmZ0vwfEfhRW7dVpdFWUAif8iMdGwvWZlMaqr18
	 gIXI4N3EOH5CZKsO1yFtcBzrEe69kQ2DlllS0Wj5RuQSdzQ80UQxD5wsT93aLIqdAu2Su
	 MAxD+QfYeXYfJVpQsWIZp7tC6Jo+uYD55ifeYEDXZT+BIX0rxNHpxkKi28TLo8bRd/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abdJekNZ;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ECF606A8A1
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1ECF606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abdJekNZ
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c247f6687dcso323061966b.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596878; x=1795201678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
        b=abdJekNZ8HxFrzNGohRBeEoTf/523bitcDzqsMoXfu/U4MopGkOP+b8MXZ5tWxql83
         +H4idS6CeHAz29Ea3I8Yr8DkY2D1+ljIBctRuNZ1EQHnxCBrrSzbgBs4xgLyJVibQTIQ
         LYPvOHevrIg4Xv1JpSAMiLR37kb9Qq0S0VvubHWWazdzfJLS1TikFNzYi8HMMVqCOQbI
         eKti5JdPJe5aXqzgfLGy8UYM3/T2YWQ3JRtjF20hkIhmgBcvDm4bRhNg46dcYztv2oc6
         BEcFEfaaFNumUsm4LprF9aHBwJYDZeY8ItR+D6Dw/wamqL2ToslkaAQt7JXd/JPGbXXY
         Xx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596878; x=1795201678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
        b=RR/51m/cLeNHyVT/3S7ELqBmwmGqzprPi2J4/8byVqoqqppu7L9m66cSpQ60oOO0xV
         4wTiYsC5H8XvtN1NL7CEb7lW1lRcbPzdZSjSNrvM+usVQk5wIDNveTWMd4dVueIzLnmn
         +xQGN4pEwU4exKA5b4/dzrucEi0mV6oK2WtlzGyTmfYUNiz0z205P+UugiVO39kUKaR9
         44MLhLB8QaEeaEzHjLaEpeSZXh1aY8IGevjxcclcpgdQd73VhJBGyObD2GChGagc0+XP
         LPaPI5btBxRLgUOnTGJNY60SkFypn6/zmh2I3ASQDFAoZgvNbzeBhBxs+H7B60tVhSmD
         eWFQ==
X-Gm-Message-State: APuU4Z9+T6/3c05jLoPeN9yTd16iZ5lxx/htdqsWZOgvgnsNne6OR/I6
	DxJVh6PuuebzUGfhUlj75zB/zlspTJbNNyvflgmBytDFNe2hhQRWDAV6Gu2yEici290wmQ==
X-Gm-Gg: AYBFou1TNA9ZBldNk+OuKEBKgThZR+23WMusnyliU1S/AdPokjmJebKYaHT1+/zJ3ca
	gq72oPq2eIXXcF/TukiBVhE0tQ/araR/cWUVqMN0VCTUSySDWtt+3C4rV0op2w2EU6dpV5ydRv7
	ynpDC05sUTAyDqeDDLoPZscoi3mp9aYtrnDWH3BAEtCckQAH4CPdrmh/qOYpO6D7O1koOvPQiFl
	XoNI4x9VrM6/JK3FjxETYpRBp8YCPmGQ6ACqzUUe0UXg6dTIKkt2Uq7ldwYXM8Seybaa+I8BjPE
	5DtQ/uzwYWi/42ECljEjb+KrlLqeFb3BMnGK4va6Nm0OdlM5tMzCY40jc2LRkHOeeEP8IolEkwx
	p1Qz97E12p1jXwT4vPDf6HRo3Bya1zFUnPEsdeT7HyrWH0cfbrEDg+6t4oOlb77SvDWQgqQdG3T
	9tlkCdpp1441MHOpWefIY2chD4ULCVSOVJqC4CF5+OuUnNA5pwY/x0jtsz7VgtD6KkQ6KoD3fqe
	ncIgJR7LuiLjBBIDsVJaoRlOSjkmHXc9E9U0kcxTIfD9Fltk4103/DO9nuWgppREL1HzIBTwjxW
	1y8l7ue4TFl6Q3hpKMFnyhHx0EQQ0rL6KYxq4ksIi9k5CG3zhOILWejY+yZrG8v8
X-Received: by 2002:a17:907:2d89:b0:c46:8063:220c with SMTP id a640c23a62f3a-c5096398047mr303416966b.11.1794596878270;
        Fri, 13 Nov 2026 11:07:58 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:57 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:02 +0300
Subject: [PATCH v2 6/9] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-6-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its registers are the same as on MT6779, so it works
with the existing driver through the mediatek,mt6779-keypad fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 9f0da1240187..9a1369c9ff4c 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt6572-keypad
               - mediatek,mt6595-keypad
               - mediatek,mt6873-keypad
+              - mediatek,mt6895-keypad
               - mediatek,mt8173-keypad
               - mediatek,mt8183-keypad
               - mediatek,mt8365-keypad

-- 
2.56.0


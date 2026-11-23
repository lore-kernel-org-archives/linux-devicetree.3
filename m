Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432751;
	b=msfo656kEVdP2Ov9yyOUDa5wJ6kpLukn/vlfMmVggYV99b7z80jqwdlpVGrll0vsFONw
	 +ZWO7YQGBSFda/wH+Jpk3AncVDQzLCafryg7vop84RIg0kdxiW1BOxI6sadhpFXtsgOTf
	 hDnxhqdKTEzQDYiMafutkPxI/qIrZ5KckFySEWDWxh1PkjvpavT6xVwwJiqK5Rr/bAhFO
	 Ms2BGcZY8ljA5vvfrORtmOIveZopY529Y4TF9q/ysaps+u38NduxkFERU9tMr5GRomcPQ
	 aWNFFh/AkuKyED/uilh9Ntr9Y7c3Uo1HCVEkYlTyTvL5/htCgYYJC+10fPpV0B517jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
	b=LZ6mu0ra5+oy3fe7pkrRtgdDZt46TwHQemPnJ9e8zyTWwNrSiUl8HZh/uuR154BfTxyv
	 6crQxwN60+MJJKupEDh8vwM25/ESNypSXHCV5o7ehYB7ToCNY1JRwSGUNjRyLlnweV83B
	 FKUKDbGlEmvsYM4LF0lp+Nrzln1rAIQmh6lse3ixkeBAbtZMZPEykRLxJY7Y+E/t/OuBC
	 fLw/Kx2yAXy4Hns8Wo+aRbgklTO5m2t3L5omNkjCs9mxB1thqzcSz5PZ89O2lgy73BAzZ
	 CkEE5tfrtEpfuQD0/EJzLMlYNDNe02VzDyJXi/Bk0KaQCBFnlVhMetUWZel8xJZLj8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcoKie5q;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA1B60A2622
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA1B60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcoKie5q
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5188e17487so28295466b.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432749; x=1796037549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
        b=JcoKie5qcPIy9VJGNJOeooy8iE89M63mPT4Tj1eTTLSnqtXq2b1lwRilTuF8Wo+w30
         2mxiL2i3Kgv1GdMK5qHeDH7IacTvYGU6YHektDgrSNsjjnCE7wnipEghpMjLc55Zi4Hj
         kgzPLiOhYpRTUT4KP2wf0Oo6kIWuFOkV8cF6MluV+qhv6OhNdw5ZYUmNc1PDQCzxjgcM
         CV+RTr5c85OgIHVnYYn4g2IuTNj8mjnugocu6PNncbEOYSkWeudE4IVx9G5+bwbOTt7i
         HgpA9vdDoDQCptPRtZwyqsw4GEVjsXpuOQPBTB/cDi2VXoVWy684JhnOA2J1Ipoh5CfY
         548g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432749; x=1796037549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
        b=f3z4ISC6aH8Cw9DYLy+oxI68lzdNfFO6S8IE/i8NkD2Yu+joiAB4HO2u1ufXMcfX6/
         M00hSqhvhLzRCjCOr3jPYkV9huZjKVPTCv6GrMD2E/XvZmWk8UFqKF0Pp+RCef9+Img9
         rUqESEihYH6i+LyOfvvzZh+InEA7SzgHK7kxq75EyfYYVFYHkONXTgt9sqNNygaeLesX
         gO3C5vJP/PfssPMbTcf3f1jffz7dVEEf03843iaS81wRhV+6MUE/io16aBfIJ+kFl5Xr
         ZgnFTKBnOeqCUC8cKlo0ysiGP5xvxSHXC3Py8SkcUpC00GZNMvrgQUK/htekfKqp4fmv
         9IoQ==
X-Gm-Message-State: APuU4Z96ncNIwX8z4hG+Lj2Wi7i5ygULwKB9+LnEtWD3qaUcIBAsSIik
	srnEvO5XIRN/qwkhkQl3iC4ec1eutyi/hbP5VpNa0vsbTia5JE5ZSeOl
X-Gm-Gg: AZFdTZdARQbbBRS70DK/YZwsY6RNM/i4KTwwhTgXDtdiFEbEJtRiNy/LJ3qs5yvSieS
	GgQrqY81/kgpvg3Q8tIJxB0YOUKrgoZQh/x3WxQ/zncdp0Wndp61v45y+gBFZF+UHX+kS/of0lF
	Fim34LJMNuCYuxZ2mqbWlWhV8QRylkGGqM3Z7p1yW0ewt9/Xs5QSnoBhmCMRBxcjomsHjp4uyoc
	P06/Wbki3pv/68aKUl7r0ovf0SLwpic8lQUollYnEYz4nQSBa95IwJ5dSl9NF6J9RiKxa9NukuR
	FHQMk6J9WxSjY4zIVPDEdWk1/fxCSNFPE133kfkh8PwSpkehUTwm6ayOoon07CYMEt49R4A7737
	G6c4gPts5X4YzrfxelNQja2B1TJlKn00N/JznS8SMe9y0jsjQja/6DWQy0+lFa7aHIIH+aHm0fw
	0rIklwXfyTNQ+z5uZAooE9B/gMuxvOVuCDHq6H3xnSHewbgl6Xlg8Xyrnap67OtATnEuSOkROkT
	6qqKgabnmhZy7fHUdIy0AofxsJajuzenaaE5JoJKPz85N0pQI5ptL7+mjEN83kzmh1XkRv3Gtxv
	kQOFRhtZHLR/tts6C/KBcnyScrw3GiZJ4FcON+XZJONfz2ueCn4flphG551Xp15KwQ==
X-Received: by 2002:a17:907:84c:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c513acb5be4mr952960766b.48.1795432749405;
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:37 +0300
Subject: [PATCH v3 4/7] dt-bindings: input: mediatek,mt6779-keypad: Add
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
Message-Id: <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its registers are the same as on MT6779, so it works
with the existing driver through the mediatek,mt6779-keypad fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588192;
	b=TBEYc24wD2EHCilPghEsOXtYbfxPLjNCoFFcxKakyrcHD7/4kD88icKIBtNPOfKXIRbH
	 tqwUsGCA01oTm/At4ySBG2+Bk0XD8H7EdBoWKhkXAzixmQhLlVkG0rpS4w1WHpvctiOPK
	 uX88yVES7qGnrz5/KysTDERLjA0ZmGuFvFT9QKOTJkKrrSxDaJBkVZmGlLJqU8fyDQmDo
	 9Ivqj4wa2rvuwtv2YXPS4x6GF9EYPYuwsT8CUMyQiXq4xB0NHr9JBzAydLdRBFa7wZtjs
	 WDcID2BmVNTBeC7Au2p6T0+5M3fX2yyraP2Jif3puDeNqVh9Q4CYsVHKbJ8jU/Ji6Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=l7HUW+ncuH9lkksRwIY3oA2dBuKo042zJ9HBGsvTacY=;
	b=ebe1kUvvxIRju6MUeOHZeEzDm0aE+eGKaadosmBcI3GUJUOkq90XliJcaS5DMMsBs7Bk
	 Pi+vilenb88UdPeSdVzpNFWNEUiHAggytwIv4sQ0pJVhOEWbBe97H4nxpxF1Y5SxHlihN
	 81bbJ7kqcOhwAKmJLc1Y0ki3At73rVD0DDioYSJDD18H2cf6DCYNJp1My5HZXXDwlN3xi
	 T//NrnICXbNZov4Zu61wB4EbgvAjlLbiMk9o8CskUd6mtz6Jlj8jpNhw8p8tqZcTuri4Z
	 3cVlMQVgqcIWcZ/w1a8KvN2X2XnYURDWKUtxdPmWpp3gPb9zV0neTs/8bP2E38+LeEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jmHn1N29;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF7660A380F
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF7660A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jmHn1N29
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-84e8a9fae57so492706a34.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588190; x=1795192990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7HUW+ncuH9lkksRwIY3oA2dBuKo042zJ9HBGsvTacY=;
        b=jmHn1N29vwT89iRdWkH14RT1lU9HKGsWm5GLUbBebiA9zD6t9Vn8WmoyOa68IfmOkS
         NEZLlOcbXrXWkyenJaQIjmv0ej2Gu+PhPewn9fIw0K0eJ2lVC1SzXrJsbcT5XojJD9zc
         BneUYK5QQdu3iwcUHT8qc8wgOvD6Ej0XM/VdKUg4dFpvE4SEG76meQGrBFzBzx2ONiUQ
         TcDBFAb/kNQNRRoL+y4JtCiWD1aUob/RLG1v1etLHYrQE+MO8tO8C5aXYAm3aR1V7aRo
         vy9zQQacS76phtujz2M/CD0CFjgpw+sWmETnn0xgzVDPpuMu2tqqKD7i8zeDzz3VnXKz
         b1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588190; x=1795192990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7HUW+ncuH9lkksRwIY3oA2dBuKo042zJ9HBGsvTacY=;
        b=v/eBTjCsN0bFQBXYCYH35NTtX7oaAHlO/+Hw7IZj6F8QpRaXCyhUST5tdXkh4X8vTb
         TzGS+ZgciJJwUBr+iWmpI625B6gLD4TmQuj1fnw3V7LuNLsPM/SbQd0r+0bcpvrm/ZyW
         CB5ZZMHPbJ4EmRdAHGsm6/kOxzLzHZ9YSxmsRz+b9WZBpzB4Xulp6pbGVl2YzmUzari+
         ghLa9zNV91RA7gDz/wXY43BQPWv9mQTt0zrw2a0kJJVQ/N2WVrQxJR0OGtXKPz9KAtLg
         gEvgFTQaQTGrlACkNE6BpGsUPM6WIz1HOxSRtv3H2uWxYy8fGf5/HcK8FIQFwVAnv5cY
         57eA==
X-Gm-Message-State: APuU4Z9pVIsBwl9kPtGCWt2a+ouW2UVBnvz74nGRbvAndL17pFYZtVDn
	ro65yT8gJ8L+sVhT1rqN56b/gJ+s4xj8XmBen+dHW2mlJGfiXyT2zkrZ
X-Gm-Gg: AYBFou1LxlPt2rfz9t11B21+dmU4PLvUWhFsfu2k9Sw7vmll40cBmF3i41/X6DXQ9zo
	q8iIh0HveCApeM6B7aI5qh3o5rd9J80tUcSFrrW5J4j3zfXZzHShTmqgsE4VTtn7rVEb6+rOUZx
	l+5+v5O7itMxW3bORKAkB93zpxcOXhWxEv8lqx32OTJNIHUGAM9RAuWD5GfyzQiOPSKbVa2NmPG
	gKRG0RoWkOxGYvHZpdzF+GtQzi+uLXOrjI3sQKXaG3ZonX6s7RQvz1E8plrL0xXp8zlJAmCZsqO
	Ns4NTVhUVO3AXrbl23vY8NdedMerxGMfONFxMpXsXN1kaWq77iz7jEUL+3zRMf3zD6SRUKV0a5j
	y1VALSbAP5crK0aCnkC8ZlKHJULssUjm+Tm0kiSyBKpFPMTaL8+OuRHZW4MfR9Pkqsjvcl18O4+
	JkF5LHRuXjfqC7Mp0ySwEfeaMia6eazPXMF5sMbUmkmLLE51ncf0YikcKPrwLl2BfpopuSRY4gL
	W32MQoK1B7ezHvuaAij7pP91si18JJbg5uvZwuqWfADGGK2p3u6uhrLUvY+r4PJX2TcjdvzCzqx
	bLvKaEI3zMRR68RcBdBGP850v/RvJvmoEdsGk2+Y45Xj53NHLneYrkkIgWwzroN4Kq1wShRZj+p
	r87F+YxvTc1FE+SlQSUk=
X-Received: by 2002:a05:6830:2709:b0:822:6f0d:d04d with SMTP id 46e09a7af769-86289866833mr2450881a34.16.1794588190361;
        Fri, 13 Nov 2026 08:43:10 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e5148sm2712816a34.10.2026.11.13.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:43:09 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 10:42:44 -0600
Subject: [PATCH v2 1/3] dt-bindings: arm: mediatek: Add MT8173 Amazon suez
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
Message-Id: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-1-d3b8865fa50f@gmail.com>
References: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
In-Reply-To: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588187; l=882;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=I6NAM91xiG7y4IDUJHiYq0Fw7LL1iEfDMhzdluyzqJk=;
 b=hFxh2nuoCt+M9OhbQICBEs+ke7rF5fRGCqw7H2cvfOLLCmLg/RuSD/8xWWVTL43MjLHeuoI+e
 PTT1VNMJ1OyBTfk/s33BI0jXHT7JcrMz5LW4pwiYIr0wef1T5m2cxBx
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Add an entry for the MT8173 based Amazon Fire HD 10 (2017) tablet,
codename suez.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..26f096587631 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -157,6 +157,7 @@ properties:
           - const: mediatek,mt8173
       - items:
           - enum:
+              - amazon,suez
               - mediatek,mt8173-evb
           - const: mediatek,mt8173
       - description: Google Burnet (HP Chromebook x360 11MK G3 EE)

-- 
2.56.0


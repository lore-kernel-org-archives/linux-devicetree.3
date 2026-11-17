Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936529;
	b=e5yu5jKTZEYASNUpwyJNQ/5EEdYj2oxvKxa7hqaSnbr2T73Ja/h0ay/UvHzddLmoaxRY
	 lzx8wA51Vi+sdjGHCBDmt1Wu6vfN25UoxsObyMxzbesDwjLuiZfKdfo22ziGT8/uFGLiQ
	 dRExw0i5WEY97Gw0SpE5c43YA9dxBKDlPGJQwIsMjfZ2Df3ZbOoVF67r18LkwZuBiYao7
	 Km9Fvya9PHrf8S+KcgAN8qn0oTlCcmqkk2miMT4EIOJunS35N0HLbqyv0sHKecFH7Z8n3
	 TmWQWVGzgfsK1G2r0wgFbUbYdZv9QUamIFHV0znUTc3UAjJ6JSFLQD94z9UBsOhC8Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W7aGstgLUF6fF7qIgrzP8vyvffLZGpRnglxzQ7CGySs=;
	b=b0+uVyCh7tADT2uVqbdQ1httDk6ijysnU1bNVyt8ef+XI8HpbcjYf2ZdVAZ45bPp258x
	 MBVOJSXaOJbE1iKLzD+5hOkY81BEWSLjN/XKLrI6UlGKJY/CwPUJCrhO+1VrJx9wP7dCl
	 qVnZhWUmJztfFIAjA1r6r39lxax3sgz2z+R2QdO9sdupEqZtdldPw233WPTkzGC6peFFS
	 pYlUaJvhuzxm3uYUaUJpthhRQajlP2hY0aG2crXQARAeMDLDkOCkzy+a8S9YZj/DDLNdy
	 EthnGuZJB0VkYVRKBbY4hQ1dnGLlasj+w9BQChASfYFDUqBS/I0mXXDjD0l7ksD4erQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oIr3nYAh;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C7F606A336
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C7F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oIr3nYAh
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4ad4072943dso21876fac.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936528; x=1795541328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7aGstgLUF6fF7qIgrzP8vyvffLZGpRnglxzQ7CGySs=;
        b=oIr3nYAhAtqtoBHgFOIIoMNOSQ7p/KonG00DDzGT0LCsb1NqhyqEVe7c9J1q1do7gy
         GmmRkXB98CR9gY81LBP7V9e+gVAil48OJbe4kDrFOKOM0BXt0V/7o7KFWTKI54NX0SKw
         gUYroQqOt3bBQhCEIWy8CdhAEOlYGkyx7BUTxtanwuxZi1LlX5v0HQtM4Wg51ayXIwG2
         /XbZxpAoaNmGi/7UvR42Dh9ZXXBZeVfhndlfexdpAw65RYVpbW47kPAVe6pheTdncvoO
         7rkUwOtshkcbBVxRpLXmdHjHTjYO78iyzwI2wdEfN6X5XzxvHMbRq+o5NU6dF1/FKIDp
         dk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936528; x=1795541328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W7aGstgLUF6fF7qIgrzP8vyvffLZGpRnglxzQ7CGySs=;
        b=m6EOVElldp8kDvaLbFC3TNNJu3oTjgqp9I8PMUVV2CSY4He+2e4ZskahhtCGbAQVL3
         t4QIir/A6EuEgb7PtGmFTHj+Cm8a5kjvtkSZewyIWfoCIt4+ndKomfvU2VVmfxPWZ6Vq
         DUcaWzdE3C8WPAQIjrCn4qIwnRklD5zjpbcbzPSv9/IFedcwg2cv6GQUt87fP3sD7BCf
         8n28Wqk7VO5bLZRRW8Az6JRw19Zu2v3r1PuQ5dbGbCdkKgn0MAv7HM9E5bt+T2531OvH
         q/igVNUoHUTt9vU0gtA1GQ8ldP3ruvIn2sSeRuOvNtvdZXVEK64eVxSiR+/CQxvsxndc
         vDjw==
X-Gm-Message-State: APuU4Z8taenyq6UitOxD4GqRN5b6qCDMj1HzCWp4AH4JjSK9ZVIuGme0
	fJaSRfu5kIAM052h7G3tY1uyYZ6nPz5YbMyvwNMkjJYh7T+cmrJJdcDS
X-Gm-Gg: AYBFou2LcfMjtebh0UuqUh8JdihbGh/z+S9TTeggHyYu5iDU3xeo+rJ98mlCbCDVqVE
	xN+l5V9qSkX1dY3fAu+F6s8QSPKsAqhyRuoOTs8HPbFNKZ+RP98N4E9/fGR1kLuvCEFPUsXGF0K
	KwoVHOygW2iUjuS7WISTariJB+AtBaFsQp/uaivQz+q+eUXNXh/UInoGJFxA/Xxl8guQzAwAccJ
	GFUXaWsNAmygQbVOPC4vkCx6HXDpGjcVsC8VeEg8DRSgWTMB2uJ0i0N73vuaFYToNZvmWwfRY3Q
	RO8moQ9vgkBepedYuntJUQyyI0qEEI9ATUuUJuvZCkKg5wSEcoUV438ajPJDgRaTwH4DPcjZMsy
	sQzIgbCWynFYDTtvQ02BgIi03iIeUNhVZl5eYveNHS3Y8hjF0zahfHz0I05DOCKDSaxeDbpTBrV
	KKisA+TPnKdZld8YqYYj01qjz/rmdfPjKLBULgLy0HlIWVRXcxBrN1edD9SgQYJ7Vsqf86YE7UX
	rE4lH/9fKZr9uiDkVQz0lJZKw82cJqsLhlSJ4Urecac2GG1w346yR7/2aDoGgMzqYH6jokziip4
	e6gxIl1X7TRm91OSDcdzUW2du8pSuQ==
X-Received: by 2002:a05:6871:2e87:b0:491:88f1:f3aa with SMTP id 586e51a60fabf-4afdf3ea53dmr11909331fac.26.1794936527583;
        Tue, 17 Nov 2026 09:28:47 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70d5b1c64sm148358fac.14.2026.11.17.09.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:28:47 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	david@ixit.cz,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V2 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Date: Tue, 17 Nov 2026 11:28:41 -0600
Message-ID: <20261117172842.65346-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117172842.65346-1-macroalpha82@gmail.com>
References: <20261117172842.65346-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for Rockchip RK3568 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
index 6d0eb0014eee..b245a3051d66 100644
--- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
@@ -24,6 +24,7 @@ properties:
               - rockchip,rk3228-timer
               - rockchip,rk3229-timer
               - rockchip,rk3368-timer
+              - rockchip,rk3568-timer
               - rockchip,rk3576-timer
               - rockchip,rk3588-timer
               - rockchip,px30-timer
-- 
2.53.0


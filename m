Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596866;
	b=zZw6cAEcOAkUY4qifc4vs9sLW3kB/XXq8Zr6MpOM+Fhj2BAmkN78P8ESdFd0V469Jl+5
	 HbEZoZ/nSiw0S+WvFmnwZx2leUM22KTfVvh3F4x4XpXPB8hXojnU9A1fs2pAAaUdvm2g4
	 tJZOH/b+LeuRmvgGDIra2m56beM27mYvLR+R/D3as9OvZJfrj1d3bgdSSy8DQx5hzKzjC
	 WxSwCuCSUoJ28ALslJYwL/IH6jj1ErFKWHMiEg0tCYwhYwilyTWWyAB89pd8zQTJIQuuo
	 +pDfNqWdMxB7GVcPjywqiZbV6pKg8ZOL44tUhPir/nauV0UJr7FNbKG13886fVVIIjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
	b=xPmWcW9kXQwDZSMTkIKQVqKUlpdo6XZcTTCnerTvFnmEZR9sjo0uqsTz/AxITbA4Dc/p
	 TKhXQD2EEoP+n8rpFsAaC6urHQFipS09N7UEqmrK+OtgQv6STJFZaOMueMqPwMud56vrC
	 xgIdoA3f/JniHPy7xfQQrPsszSYkkHf2OHkuY5cO437YyJNy2+XUyjU1zUjUSr2NGlu0m
	 B84f29iEvHV47lGNNL8UeQBcZvfP3YZHQnWwwrwhCh7ToneGzCuHNNrG+v+wBspKb/1fU
	 szjcaGMQ3nyNm6DJBc/84FdLXsN1pAWNNnvU5q+/lm1hK7jym5CP2AYfg7Ko0HBMu8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vm6v1RTE;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C86606A33D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5C86606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vm6v1RTE
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4697404c2bso227941866b.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596864; x=1795201664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
        b=Vm6v1RTEA4FWJq25ASY1lb5MR5BgXMe4qoAyAKawSq9cDnRLqH/msUZtMegpu8mO31
         3alveRSeEqOlea3xa03rZSdDRmVsFWBqx0LvtXUYw2yHjLyfgd/DRtnPA2Kv33PBvdzq
         6/D04/Ychb3xeD7h2lFwdXVW9kehjlwqs6tQqZ6ir45YeFHjeC9p+tqjQCCzhCBM80Gc
         dDUSPmVKWoIld4xsa0FObxQKQoUQqEjgaxbgyLvcnnwHmjG7pd8skw7SxHTHjtYmY7Vu
         m8wlHEZ/BrlQKb0qUoRYpWhitGlL0IDd03p5YchHAQXI015wKWpYldCg/LZsRoMg6eGb
         Q1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596864; x=1795201664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
        b=gQK6n0JgZDzgJgfWdce09KSJyY2gnzoXaxvP1RF9FJ1/daTmD3IpeFX0V166feMQKO
         iTZnhPWzUKxkszlMfglnkd1kodWycGP24f3jBeKlJIMJBBNai7QhFq/UmQfD+KLWJWVE
         1TQK+kTdPrqEbyhp2qF2cIgAYG24mrjT5liVaTuQ/S6Rbc2vF4Nb5CJBzzbnQN+ANyIp
         gOzGVO3g8iz7Av8Ik6xuURF7UqbiNyLY+RIhQioNdcoR9S3MoPRMPqDB3H98Ppqhx0Z4
         OIdxtZaXo+TgantbwRNAOihCO7Kv4rQGVQWTbpRhgAZ3uBwrK+qGm+vVCxIyg79zO/tq
         WKZQ==
X-Gm-Message-State: APuU4Z938aZ3h3Z27WoJvdpUmI014edUoDEmf9NUmCvCXKANMnkC+bQh
	1w6AebaJ11TW0tk2PeIGG7OsCxR80wExePa/HmfAUUYH8OFc1OXY9w10
X-Gm-Gg: AYBFou3Krm6XgHoNogCzVNX3zOHxl4kX0lXbnWerX0DaXPLk2OPVZZtQs1FyjLrf0Ig
	A/M7rWZspVaTGiFQS1gqVD1/nPQcqHZ+SAo9IIggm3YznsFwA2eqjJH2MO6hlRTR1ZOszk3lSZZ
	4gHn5qpItgP7UELZYiL7lhwXh92IAvWy6m44MkOiqulVrUwT0f072m4A+bCxPexBiMCY/ba6aya
	8lvBYK9fmx3+aDWfnBIcDR0PfaKv62cZyYCDJ0xAssBGFZ18slkwQvXBugc7aVHkjY7bAWuKrrB
	M9VwEo3zkxp8kJU9nZxK/+bGQZhAipLinJcxOf5GjfBdRwLzt+UW7Nk7tM3tkROJUe5BoBI/5ja
	yuAv5Uc79RnWgp2/GPFMDcHC4cvmDDj0+ZJBkbCigFhXb4Dqfhb2W7lT4usTFGyFLObp2br8GO/
	Is9oi9qi1trC3TewkwoyO3AisCxsVRaP77gX1YU/worqfOPVmCFJBSk9U4XCfnUAXSombgcqm0C
	zRwmAqQv4LX6BkJ42Qkqu7PBZ4oF+Sxtrtrcv2k84bI2PIXdEjZaglk8GsM3yP9AABhB33XOy3h
	icmzuOsRrhlbL3QjpqslFcVdoT5CUVzpa+WeAwq0fZIPDro0oQezyAZz5gzF7u5p
X-Received: by 2002:a17:907:9305:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c50963d50e5mr310340266b.16.1794596864130;
        Fri, 13 Nov 2026 11:07:44 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:43 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:57 +0300
Subject: [PATCH v2 1/9] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
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
Message-Id: <20261113-initial-mt6895-v2-1-4ab0aa9fa391@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add the compatible for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
along with the Xiaomi xaga board based on it, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..28180ed0e815 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64

-- 
2.56.0


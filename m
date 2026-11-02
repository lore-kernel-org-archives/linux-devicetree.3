Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649221;
	b=wwvkGYZnClrgvlJ7y2vLIBpgp1UQNhlFjrS6lEEDmvgAVfacBm3W3UJ0+gsA3ZxWe96Y
	 qyzLVk0jmmuFG7xn0BWh9kc66vD+x9OsNL2foxS3O/KJRs4K4cg/VzMLBy+ly1xmi5hIZ
	 7HF1Qovjwyvr8vF2aGw+BB6lwJnifOJqqLbI42JG+MyQE+xFQG8E4Fzwsj1Mm2sPA2kXD
	 Lh1skUQjoS5NwL2pYCmC5T4cBPurXaGbq6LjD6wpHaWBTdZVnY/ODZaq8PrcYp1gRM1FG
	 L7Di3vw/2BrL+NIMWQm3Bs2sYUnieyP28ysCB7EwP20TvPOdf2hhqtwWm3nOCL911Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0fpz/uw2nhdb0euDYGKBTP+bqdC3yE0PUdZgdE1EJC8=;
	b=czSSv1kYXllKPDTN7iFTHvzk/6LaEH+735h/brdLlKMnh+rxYwRFzDUeX5cjmbVk4myr
	 Kx6gHiB+P2dJ/jTcWrCzKI6jsXya9gpcTbA9ClRbxYmkTgoIHaGobdNF2hc+PiQ8xbxuF
	 tzLONhcQEV0SZAxgsC7jkUZkVgS1TvxmjNa1KmRXBqCbEtFukfALn1emnALNTJTtdL1aE
	 bv+VQn4/n5MUqH67mxTVdSOkn+DxvNCnLtMQ6fWP9m+E2oE2le6uWaclJ19DsUZabjjaJ
	 ldSCnAvat+Jm7Brt2+oPSUUuiypIWxyKPKSkA4sXijoVc046h+0yArGU6JNk0xB2Uxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rVr9EIXe;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A23606A331
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A23606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rVr9EIXe
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so33058745e9.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649220; x=1794254020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fpz/uw2nhdb0euDYGKBTP+bqdC3yE0PUdZgdE1EJC8=;
        b=rVr9EIXegK7MvTJ3LW+g+Z/AsJ6mM66GF3AgBUJtVngRLoA4OihLKNRtkB22JnZKFS
         rEz3HZK8Li+Xp1xKgmH2ZjHAwbSaHjqwV/acRWJqunhpadxp7NcRJpOBnxQaGF58WHlt
         RSdU+VGM4JoNgxBbvF59mh4pOQpfPtawON/q6pOPl+HSMHbLXvhReMdB83Yb1LoQzUe7
         3aCWyW7H4e6EroWAJNW/g6SU20rBQM4OkpLkzj6TiEHZTROw1qq/lVznf1fUHj+p77WB
         7onJOlO4ktfhXTOgXVSTPKcJanpE2EmAk7gQZDpY7nImvJJlKotzrYjb0c55/N8EiuGQ
         0FTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649220; x=1794254020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fpz/uw2nhdb0euDYGKBTP+bqdC3yE0PUdZgdE1EJC8=;
        b=oyZxdnr0vc0spJqQG2LY6WYsLffQuhG7DN1KtRwBGvmL7XgkiB+5mGcCxncE0RIDvn
         1jPNtF/lSaEKfGSCFnab7hxfbNZZkz9pl/gnqnTzIGrge9dcbzPREmrbVn/1pt/4JMnI
         migt9gouTDklf+UMnH5tOxOggndu0+UX/QWgsDx1X9Ow3KY8FWiV2XL48JiVLy4IZOmL
         3f29bU0PR1XfZy6QzJ4mpeMfto8b1UPlCgKG/6UVOye/rArP0nPNj7mvUxIZzkVBg6SY
         8LVxHKZ5+1t0mX+RtOrcndOhq6zX6LKhVu8Di8UI2PY7zosMRzlNT377+zv1BvMHHtrO
         9PbA==
X-Forwarded-Encrypted: i=1; AKwUvBxHxs4jeXj4aV8hRqbIZ5aJhm1VqbYjztIpP12ocSz/M3lLsScR5HWJzN1H1PIF6OpJJqUWKj/1Ea41@vger.kernel.org
X-Gm-Message-State: AFq9FYJBfl1pL3gtr4TJi8B98V+ysU2PIR9JQliGOXI7DS/Eyc1cbFhN
	s/PcK5AaAJy43WKD2y+9aIUsn0H7eo0pVVQf8DqE+IvB1OrAo1Tkp5xOrCxF+KE0emU=
X-Gm-Gg: AYBFou0PnQpJ4NbG0zH3OsyjTwCgW776MCQKc4OIsao6aMGd86NCR612hCB2NHXDu/x
	lPKyYAIzcU/lDVMhHwqPTNjiVb/YqW5rTXhT2MHHE5NZN42v1hh0RaHpvz6gz0y+4euXjyRGWWK
	1loqGhABp9pOj9ZHBHJILImWhZ9wHUJJgGHP2OwIJz5VyHC87Ahz9uVSQ+XkIwo2tOUOna36+d+
	Ie8xwl96SoXn9awd8lcL49UUO9gim8n2X+H9I6XjVGfCwFxSgOvNkOMAy3ivCDksiuclzmUxUNf
	V+XI3KWMwB582jQ1CZG8jZvmJFQ9CHozYc66PHKwLNWW/GDHJUHOwJyGsD3BWaVE5RM8pRC3PVC
	9f/y1kJMBPRmmRc4dYF5p+BdVN9cO/7idgS2t9632E/2R4ZspI7NnSmlyGhhiFhimGjxrgab4Yn
	kDIs1Joj1nnVt/p7upyQdBymuwkdXHS5hP6I65Y3V3CqqySWsYJV31+bZbPXqSgFQOS6xTCvhE9
	+2we6nouPUIlaAFSSXKVOYzzeghK5vaIDGVVLdvGXw0F3JnN/1g0t5wO1nDuiwl/FGUY+yzAeNQ
	65bRzmyTBgiNDw9IIkuL8QR5Ew1HQiWDR0L4QZt3paEUtcscyVibtAlDxHljleZCanlN5MwYnQx
	m9s4grIv66a02f9rsN+m8CRwWGw==
X-Received: by 2002:a05:600c:19c8:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4ac1913ef8fmr260265065e9.27.1793649219912;
        Mon, 02 Nov 2026 11:53:39 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:39 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:55 +0100
Subject: [PATCH v3 9/9] ARM: dts: omap: dm8168-evm: enable MUSB multipoint
 support
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-9-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1481;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=GPDgtWDoINKJrraqXEHk7avh0mT0fUwCN99SIrQYwCE=;
 b=rdyCT6dPdNGjEGb0mGj7AcMz0ZkRYEhJcmpAPs44qs2/zbWAbI3Wlil1MRcniIsO6bUaDt8X4
 vYzMD3bLdtQBzai49938vlHle0a73q/YWslU6vw3k9vpk6Jx12fmEy9
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Christopher Obbard <christopher.obbard@linaro.org>

The DM8168 USB controllers are used in host mode and must advertise
multipoint support to the MUSB core. Without this the kernel disables
external hub support and warns:

    musb-hdrc: kernel must disable external hubs, please fix the
	configuration

On the affected board this also prevents devices from enumerating
reliably, with descriptor reads failing with -EPROTO:

    usb 1-1: device descriptor read/all, error -71

Set mentor,multipoint to the default value of 1 for both MUSB instances.
With this enabled, USB devices enumerate successfully on the host ports.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index a6d42766a496..4b4e4d850231 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -198,17 +198,14 @@ &mmc1 {
 	wp-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 };
 
-/* At least dm8168-evm rev c won't support multipoint, later may */
 &usb0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_pins>;
-	mentor,multipoint = <0>;
 };
 
 &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_pins>;
-	mentor,multipoint = <0>;
 };
 
 &sata {

-- 
2.56.0


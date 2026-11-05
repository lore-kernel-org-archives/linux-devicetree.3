Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904682;
	b=08Jrm5AzEg2SGI7Kj9lXXsgb+a2XGRhCetrIGQ3pZIp4SW5EqAQJhJStskh0YSyC9XKs
	 CrtAA8q1YM/QU/T1RLwswQUdwI7kHUCCaMsDe4X1hVfsm1LpusOUnw5nD7WbM1K55Wo1b
	 6eB7utGmv3k2JU+6hRRf45Xkk4wni5try4ETHKvDF400isN5yp3lxhhf97+CmybJZKN3o
	 PkT6UYbsOiKIyK3sGPbPk4kcXjIpT0f6e6FyFse7I6yl+wJLTR1AvE5rKommZNLsrFbGP
	 gJ1a/3vJRhK5Tdj6dFBpmbhfheEsgU6zw4YB8peX6CYZbM1NoYMi/M8JSmFmI5TjY1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jnWVUTUnlmsJEpFB8nhtjDbr8Y+ZTWe/nqHnts4RQXs=;
	b=xsIkw+HEeG4G0YM8W2OmCRsfAl0yD2kjf86SQGwkPmk9fXIdp2qxJK0K/6Ggl9U7/oSF
	 XSl3/4X+JXNdolY2OM5lYYjQaw5GVXG9yFjrfFVrBhpO5cRUkO7XhvK4GI0TgaerOPijW
	 B+czQBpy2CaWI7p5W9jCfkK6Xl4S5G+Uoqn73m9aB+A54fEdnu4EqridXB8b9NU2cj3Xk
	 GCSlm39QA6CfAIMnkJn9LrrYkkz6hn/DdCLPto15shZtSwQlxNJ0aI6HVSZARQbwjylMY
	 L8CfpYsmFBq0+Ltn2FsODMRQHvjuHpZZm1WLCrIDGPnw1H/wgIamvcL6qSxyY/maigA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X8eqe9u/";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA67606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BA67606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X8eqe9u/
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so21004265e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904680; x=1794509480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnWVUTUnlmsJEpFB8nhtjDbr8Y+ZTWe/nqHnts4RQXs=;
        b=X8eqe9u/Aq1FrN4sMxD/pefIzG+YXzeOqvrZ8COqfqapO8Q/M1H0Sj1aD0TqhpMLI2
         AmrBQacAjif6fdKpEU+BLEmLC+oewe604mdifwCPdOv8erlIeU5oNwnF3Iy9LL7J8sxq
         PlQgueiT1Olwo5efl/bu6lKuYT85HXTali5gc9szgbGNdqyUrkeDjRdP7E95sVtqCTQI
         VhOsWyufCye5KbdgYYFgpgWSlNKXELlW5y+xgS+Jikcq8fro9a4x/lZSZch5LBeP9NQn
         Jg1xlrjJKhFDmxd+OR1rys5baX34Jvcf5xBAagOLSWMOBBAGXDlgEIq9UvZKeNhb4woY
         BURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904680; x=1794509480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jnWVUTUnlmsJEpFB8nhtjDbr8Y+ZTWe/nqHnts4RQXs=;
        b=ptd9+46USnVdfrFl6iJu2lABhOkend178sQ39iznfyhhkfeKjMOGK+Lop3si+Nqad1
         TFm9osF0EiR8iCLUqgX6tG9mZGTrNdwBGAEAUF0Tqexi+CtSJTpmUhuaKWtbu5MAQ+Hi
         iZmsug1rwP/CvZFBN0E1B9VyWCnksErEC6mkzeCgEItasdfv8uRXyP9u3/5EURjRySHV
         paF5yaM+4G+Az6E+G1Ov/GLos0hORHjkSy9+z/9RClfU2PaacZB2jE2th1Jss6LIQcnw
         L2hG88LciCZCV0WsxFjAa0RdDsR/cOZs0SGYMcf6dXb9OXoPDJh3wm+aMvykA6Wvvk6t
         xZqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpS/1NJNnulTefTMmWbqITpFp1qBCYAeWh2bVM5kxy5nzgo9286ddQfNwN4i8m0BJ6TjiLnQSECoK7@vger.kernel.org
X-Gm-Message-State: APuU4Z9MRpVFG2a0FIPSsTI2WpaNlcWLcvtZyDZQGV635ojTVsEUHYV9
	Iz5l9b0Ik4i9gPo3XayR72aOtn5t6TqszGAnw9seVA9dwmrv/rHqG5sL
X-Gm-Gg: AYBFou0yA2j8o1RxUnv+BIZ2uUHI5T5CtRC0rC8VMsmkyGts6hoVLsNk9NDjp5GoYAT
	gH/vTqg4qSvFXechcAIu5EVFIw8w2xwfr8GkEQ3e/OxfijT//we7hDZjljlO6OP9WhOv6oprvkU
	w2hMCyrKvk56eGYHYgPlv6nMv+Xgsgth6IBPwVzJfwh+eoJDKf13NjXoT9lVerIV50O7qqms7cC
	i6Y5x4jnUhmBsWeusFTXKE6Ipcc2vn+NVXdulmcvauL7ZdYsOzhiDPv/0AcriDQ1Hl/kkI+uAfK
	GrhNh8X6P+XqdCEZXZux7WbeIfvose6UmalrbFbN2wxV004UfpWCRIOhZ2VjJvkD9g1BNBVphdY
	IPAzHB4yXHuktfERUfiDPF9/L1cMNUNDR38+lqpXytLwo7EjEEWjPlqbiCFXalUKDo9EUvqvt7C
	MVLueMdP1GF/CEyeEpurX6AUFEpk448zAXD9FJAORC1V/yH9cBfNSMDu0v8EnMb9LiJxnrlICbJ
	Cz53AQGow6d2qY5EXXtfTMMwGmcy5sDfCzBtxE5HtfstsnipEASc7eP1fLFPH9KI7XttGcAu9b4
	wMc4pSNYiIrIE+s//tX7d3JqsgGYUCo3ceytWQAZ/qgYc0yLj5LfaPuFveyN9At4uUqKjvraWtG
	WAZ78wKxhhSCaXLeq5T/tWMvLVzx/LsPPU+2SXD2V+5NqfxRZRWtOjpp9On1foGyKwJVf9lU9b/
	BAMhmaN9s8qAL+Uj62CIA6i8DRfUOp0hqUCj+ypon4v8g3MYlqR/8Y6fWQrb5Y4rkRvm0bClu2Q
	ZY=
X-Received: by 2002:a05:600c:46c8:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4b6dd82aa22mr395975e9.7.1793904680202;
        Thu, 05 Nov 2026 10:51:20 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-88bf-3a8a-f542-868c.ipv6.o2.cz. [2a00:1028:8388:a84e:88bf:3a8a:f542:868c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae72dsm137150875e9.3.2026.11.05.10.51.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 10:51:19 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	=?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Rong Zhang <i@rong.moe>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] leds: turris-1x: Add support for CZ.NIC Turris 1.x LEDs
Date: Thu,  5 Nov 2026 19:51:17 +0100
Message-ID: <20261105185117.83189-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104150229.GA1650678@google.com>
References: <20261104150229.GA1650678@google.com>
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

Hi Lee,

Thanks. v5 incorporates your style and driver name changes,
dev_ext_attribute, and the layout of brightness_set(). It also drops
led->on and the fixup. All includes are used, and string.h is new.

The global brightness files stay. Generic brightness is per LED, while
this is a single CPLD dimmer for the whole panel, similar to
device/brightness on Omnia. The level files expose the eight steps of
its button.

The reset flag also stays. The LED core reads LED_RETAIN_AT_SHUTDOWN
only during unregister and calls led_classdev_suspend() only on PM
suspend. At reboot, software triggers therefore keep writing after
.shutdown. Unregistering the LEDs in .shutdown, as leds-sun50i-a100
does, would also work. Let me know if you prefer that approach.

The devm ordering stays as well. A failed probe unwinds like an unbind,
with the LEDs released before the reset.

v5 also preserves a dim level set before activating the hardware
trigger, including across a colour change underneath it. This follows
the behaviour of leds-turris-omnia, which I used as the implementation
pattern.

Finally, scripts/checkpatch.pl reports only the 75-character warning
from your list on the mails I sent. It is on a URL line in the cover
letter.

Josef

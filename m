Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406521;
	b=4C0skSWGiewT+iD79KStnbPhpeNLznaJ8g5zB/miVj7omZmu37qUhm0nkiqQMpCtF6ye
	 AuQN+oRTtv2Wm16a3pQSnv9QcZN/CQ4vgJt6WArXoPN6jPNZP2gFMae2vHMauxP1mJE2S
	 q5TKJy5s4h6bX8B2r8tpmloWFnTlMXOoUQD4qX9OX/rBuetPhfW/m/nInor3XUomaObYH
	 LH0sJhZGK93I0ElVDceCrGvpjRpuknY2/q659QtjmLO2TLrsqj8cDIwRqH0Fx8N1sRY+Z
	 82eKaqT7vRgjjdOjXNX6qebSBLA5+2Etawz0/QOndtz01yjhVkfJIr4prs+DdOduqDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406521;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xIAsVGVtPyP9fXWaXMVuARlUn/cDK8XAuH8s23G/FDs=;
	b=eliU0ctHZI0Fqp3+ej9MaGFXACcJ3Zrhu/QBwnmdHSdk8seHkLHSGfkrEDplHR8nhLqv
	 s/qy6q+IRlIsGaaPHcD7PBin6fdWAK9cfAMPTXkVs3sCDj588Vnx6uyGoGDuBvDAH5MAR
	 nId2HETG5r14NWb/s3uiJxbLTd4qO0969YdZTeqqh4l22cJduPQSr0k4YDtUKzuRAjaBO
	 We9wlS29Z+FioR7VWopO/AABBUniHpzJCidg10u5jWUyahTpYWEKZPVNaEB9rXihPXo0o
	 hnTF0nmc0+prjiGmc+gu2cAxXjbij2Lvo3fkn4QofCQdzqwqJFrq9QHJRXSn/arPlEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1A4606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A1A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4fb5d96b3so41510497b3.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406520; x=1796011320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xIAsVGVtPyP9fXWaXMVuARlUn/cDK8XAuH8s23G/FDs=;
        b=cBcEkaGS7qsrDqe6y1EFaKwi24ANEVegKef1aaJhzTaTJ7OyJDb7xnXZ+eJuVXhMOP
         5HsLHtwQf258uFLvMjcBr4D19QFKkimrILQsuEtJSSTqqG1L7Rj4XkS/Gf27qMzfd1Nr
         jn4W+Ou7nLtvot2wHgAufxuw3Q58wKlN1OoGwpBeMDecEhRivVVgMmpW5ufFQ4BG5vg9
         CU9mImvzks56N/8AJzJAoTFwjhk4V+6bAY8hjivSFo/C1xebzR8vWqHfM3tPu/ww8bxt
         ecrWPU9b3kZBzSyVdiIZeWnQLH2nPrdpJedju/3dYfmV55Mm//BR3hL5K9Pb/3H43+/l
         YpuA==
X-Forwarded-Encrypted: i=1; AL+hErHh1Jm2VhijyUUN2a8DiAu+Hn4bv55ajaLmPH/xkpuCHAyATFZQLVBjL+Z46aSAaod5GDbvKPp+PcFp@vger.kernel.org
X-Gm-Message-State: APuU4Z/SpPZs4y32Gq3nirTFtgLbs1tsDZSlTPXGLo4FezKknPkpEfju
	MdoKCltHK5EpYLPOWxszrd7HxH6Gznm9pf/f71rAz7FffG7dsfmMMV0o
X-Gm-Gg: AZFdTZf8EwpLEL66rRDg2nTrUSnuXhqKVdZRzW+MytXeVhz0Y9P/ZShFW+sFccC6eGJ
	4U3xTZIGy0pNwKUwdwi3tTg4OfA87S6ysRfiRFFK6keU/Ff7kJ9cNLHU+LCq/0ON5U5Pvj04r61
	36EDNa/P5P+kUsX7JxRe1L+lpIBuJQ4kyqFdKKy9NaWWTVWqn/z43kP0nBe7vOG9i1x1QQ+8iAK
	aJAinc4M0NGjjLuF1OpbG4LoCsBMfpN1mg3Pj1RmCgHFJ8TdEYy892ZMU9vWXhCPRQsavj/F+xG
	g2foBbB4JpzAc8ubponm6py8pVmkyX2GYgZ1iGZKULq52DKtO0t4n8znMjRnuBgq7+hmMnyA1+l
	cV4AkNtyZ/12wf6WaqPIOhPS01axNFzDPr2wkGZ1nJau71zmKLQmHmvQGEl08gdHP/VuK2Tvy14
	rUjI2khmKmwYROMmLGj6A4SUqdXjq5MyHpNuESNqxtjV2gm/Pv8RRWNu7rhwaO2U5jfTtcQB5V2
	6jkbyvBKTgianCBYmFKgApuu37plCHULEYccBbIE2c46hIdWWw133dw2r7PPo2gceDLfqn3WIew
	tGdgoDWxqkArbqDkz3jXduNd9Unmkvoqgf1mMEdCdaw5T2GtargGGygAmGVMrxloHaRGpO3OeTc
	FH1XbpVVsIqXl33zMa03oy0e0TVQfXf8Xhp7wgQ+OqsbswM3VWcpK
X-Received: by 2002:a05:690c:c513:b0:8b4:e4b5:485 with SMTP id 00721157ae682-8b518f791aamr44178197b3.32.1795406520494;
        Sun, 22 Nov 2026 20:02:00 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028d628sm40344847b3.8.2026.11.22.20.01.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 20:01:59 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: sashiko-bot@kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] gpio: Add Siflower GPIO controller driver
Date: Sun, 22 Nov 2026 23:01:42 -0500
Message-ID: <20261123040142.48880-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <sashiko-outbox-228534@kernel.org>
References: <sashiko-outbox-228534@kernel.org>
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

> Is MACH_SIFLOWER_MIPS defined anywhere in the tree?

It comes with the MIPS series:
https://patch.msgid.link/20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev
Only the SF19A2890 is supported here; the RISC-V parts will add their
own dependency with their compatibles.

> Should sf_gpio_regmap_config set .use_raw_spinlock = true?

Yes, v4 will set it.

> Can irq_chip callbacks dereference priv->gpio before it is initialized or
> after it has been freed?

For teardown, v4 will follow gpiolib's own irqchip order. The chained
handlers will go in after devm_gpio_regmap_register(), and one devm
action added after them will remove the handlers and dispose of the
mappings before gpio-regmap unregisters. That will also cover the
undisposed mappings.

Probe is harder. gpio-regmap takes the domain only at registration, so
the domain can be found from its fwnode before priv->gpio is set, and a
consumer that requests an IRQ in that window passes NULL to
gpio_regmap_reqres_irq(). gpio-rtd1625 and gpio-axiado-sgpio are set up
the same way. I see two ways to close it:

  1. sf_gpio_irq_request_resources() would return -EPROBE_DEFER until
     priv->gpio is set (smp_store_release()/smp_load_acquire()).
  2. A gpio-regmap change so the driver gets the gpio_regmap before the
     gpiochip is added, for example from an init callback in
     gpio_regmap_config.

Linus, Bartosz, Michael: which would you prefer, or is there a better
way?

Joseph

Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8944639283C
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776940434; cv=none; b=M/EeOOCP/JGwBBDO0tZPYYc6ikMQDXhVwD+YLY5P5dMWDsKsGqP/EZSB/LA3MLJoF1vlOYSJrKXasj42Qq2H1utgK0mfFt8s5e8QmReSRdOkneoXUn6cuNKSSCjH659r7Sm8YOe4fLVUrtxeQlKTWQ0lgcdgMiWOYUqITZ61bQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776940434; c=relaxed/simple;
	bh=FuFFPSBds7JdQYwZRc+ISiNU0G+m4ysp9ZWfxhulcHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OSnkSXZXLoqIsZKLfZoUnARXziML10QsBpNFXYmz7eXejmjrLyBMSVb6DgmxJu2og1K/1yB5rpjqpw/2JSV5ZL4IXcfLOgI4NNiI1zNvCFELd7yHUHzlqcOHwIk4FCR0QAotDMGGxjggDtIrLUk3f+a0cdyLo3mXGbdWr7SQSXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oUfOUVXB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUfOUVXB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b4583f0a1aso40998135ad.3
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776940433; x=1777545233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmnSHj22uqwbFUR/x4tk20OSrPifUESdOxTfNr17BdM=;
        b=oUfOUVXBPbTgwdYdJs9rWCyCOeA+A9tPZls9eU+bOn1wrZPuY17DVDTGa8+xmeJlsW
         1cyQTWbutitdAauFbmIxFfyayKzcypOKbuS3SDdBYk9Xz6D3YzXHvjCpidwGV9Oa0u6p
         qopZ9d8p6vcceBkvsqjZgH/CKqALDAdcKSdT0caz/eeNgoboAqLayHIw4wNw9mXAXDRz
         tqhd+egC0SGS7InJyV+myAqjxxlhJxR8xzht2JK1A7EtDE5355dn1qQeUN89sCiGA9qt
         aqCv0Ow35DhbY1IxAOs8pAm8JK7U6zXqfZAWDynql3nejgXtM2D4GqBxdM2Pu1wi6dg0
         tEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776940433; x=1777545233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmnSHj22uqwbFUR/x4tk20OSrPifUESdOxTfNr17BdM=;
        b=o+cMXV7yNDh3BLWfCLTrYP5IawkCY9YtlOHKMAhoOS8dmmjX1CNvpDroEEbhyqc6E2
         ZgRCI8TcIDad0Pa4crtIRKZOB12Lf8i6CCK/oAI+zOXF3V51q5AAAQI6351DlbxjMZJ2
         dRvmA+toWZG7G0I9RyFQiCLwDS2NKnhFiSs2xmvPq66JV+QPYX1APXSbjZfw0v0M8vrt
         Z5c4aTTlHC3ok1DRgJC+3RXezfsJJ5GgvUMXl17+tdBB5N8ZrrzVzyQ9QNnt26kgduzp
         w+sWnsNAa1p/lik5/IR9hx9HDnikLMABe4WVArToFymJhAP5xRhzBYBuNZLPkclmNH/m
         I1+w==
X-Forwarded-Encrypted: i=1; AFNElJ8peTyzFqnmlq0bfKu2xM6LNXWDj8541MVRZ3zQEKyGkF4LyqjMFJrgG7Fs/6A9CJKyLI7J66QO5w2j@vger.kernel.org
X-Gm-Message-State: AOJu0YwS3AYebU4rlC+CPeIiHwVjXKqrvAm42M7Bjcmi5YLWf2+KbmYo
	uc1AYd0nzbHGZlGp1d2fWI0avndDHqbyRQT8SZpfzPbxnV7vyN3d+vaG
X-Gm-Gg: AeBDiet/O/vqfDvZ7XsnLgb1w1IQOSWh/dhof8evgTpdZ3oGjAnkoS3vtQTT9Xp6Gv4
	zJejtNq87rljaAwGckaB8Aef/cEhD0iFcC7laTigjs41GE1pQ48oYaR8KM+qI30sIW0qPwNSgk8
	Kp80UAFXToOFWf8pbkQmb1H870GTVhd21G2t0kyNSRVJ1vPKRgOnLvs0IWH9yhux0OK5SbLgut5
	YWr9Lr1ys3N+KQkCn1OqQDM+KaxKXNcCMQDlXNIg/xdzEmyDTT2tB9NWUEprBMUNeeuPJ+5idgG
	MDsXei0HKB+QP+VykNoYDJ/ucxIu7Al406yHaI2u/7dC21h5859Cqos6K4dhN2mOcUZXIjKCQoo
	/Hep8hSj1Pm2Rl/K0prCPzl9c3puX3kvUoxH4KikfdBeNPdSmE1ow6aC51l7GQKW9hRgM5Pjiv4
	6Go3yIe29fg5KWRaAKHw+s94xatVtZCTmKaeqUHloH/S+uva3jp4eoXx0vV7P3sBv57V+L/3zwJ
	yc=
X-Received: by 2002:a17:902:bf4a:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b5f9e79fa8mr205033755ad.5.1776940432649;
        Thu, 23 Apr 2026 03:33:52 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab30f29sm189376925ad.68.2026.04.23.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:33:52 -0700 (PDT)
From: Chanhong Jung <happycpu@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanhong Jung <happycpu@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: fairchild,74hc595: add registers-default property
Date: Thu, 23 Apr 2026 19:33:47 +0900
Message-Id: <20260423103347.4054425-1-happycpu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423-quantum-precious-mantis-2481d7@quoll>
References: <cover.1776872453.git.happycpu@gmail.com> <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com> <20260423-quantum-precious-mantis-2481d7@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Thanks for the review.

> You can fix the driver not to do that. Or fix the driver to properly
> parse hogs. I don't understand why exactly this one driver needs
> default registers stored in DT, but all other drivers in the kernel
> don't.

I thought about both, but I don't think either works for this chip.

74HC595/74LVC594 is pure write-only: no MISO path, no register
read-back, and the data sheet defines the power-on state of the
parallel outputs as whatever /SRCLR and /OE do before the SPI master
is up. That's different from MCP23xxx, PCA953x, STMPE and the rest,
which are either readable (so the driver can RMW) or have a defined
reset value. None of those drivers need a seed property. This one
does, because there is nothing to read back and no defined state to
fall back on.

Partial updates aren't possible either. set_value() has to shift the
full chain every time - see __gen_74x164_write_config() - so whatever
is in chip->buffer at the first ->set() call gets published to every
output at once. If probe doesn't seed the buffer, the first
consumer's set() runs off the kzalloc'd 0x00 and publishes that.
On the board that motivated this series there are 16 active-low
indicator LEDs on the chain; the 0x00 publish briefly lights every
one of them before gpio-leds finishes walking its children. That
glitch is what the probe-time write was preventing.

gpio-hog isn't a substitute here either:

  - gpio_request() refuses the second claim on a line (EBUSY), so a
    hog and a gpio-leds / reset-gpios consumer can't coexist on the
    same line. This board already has gpio-leds consumers on every
    output of the chain, so there is no free line to hog. In general,
    if a line has no consumer its initial state doesn't matter; if
    it does have one, you can't put a hog on it.

  - Each hog is applied sequentially by of_gpiochip_scan_gpios(), and
    because partial updates aren't possible every hog produces a
    full-chain write from an intermediate shadow. Seeding
    {0xFF 0xFF 0x00 0x00} through 16 hogs walks the physical pins
    through 16 intermediate patterns. A u8-array property collapses
    that to one atomic 4-byte transfer on the first SPI transaction.

  - bindings/gpio/gpio.txt describes gpio-hog as a mechanism for
    lines no driver claims. Using it to paper over a missing
    probe-time seed is the wrong semantic for a chip whose only
    hardware primitive is "shift the whole chain", not "set one bit".

On the vendor prefix you're right - "registers-default" is too
generic. In v2 I'll rename it to "fairchild,registers-default"
(scoped to the fairchild,74hc595 compatible), which addresses the
can-of-worms concern without changing the semantics. If you'd prefer
a more descriptive name, "fairchild,initial-latch-state" or
"fairchild,power-on-pattern" both work for me - let me know which
one you'd ack and I'll send v2 accordingly.

Best regards,
Chanhong Jung
<happycpu@gmail.com>

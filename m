Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760488;
	b=ly0S9wmy/3jV0jqPI/rLq7TLEj2k75iRRKoP+eEJepiZ8oUZ2qYgoV9/RpFmo+/q5Imd
	 sZH7Ir5+RGwrOMcJXxYhIFlCx3mGF/qi3i1HPHm+UyGgaO3tTOCd2wQyIBPXOZbdc5gPb
	 wIIDMP913UMTs7PvEWvw7Hg6ok6+ISCVDGj61O3+zOSq2pbRGadoDE+byrjdn19/2AIsS
	 ou6eHYUMj3if7dHeq80aJZllZ9115lSgzHBtskzxbV+OXVDvJjVFvjuqM6N5LU7eZwyAQ
	 DlGC8m8SKgHm7n96AcZii67kx9JofAHRe9ukHzt1pftRrqB9E3LkuExXU3LSg1J4s+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l4MqBiu+6D9UqT2D4Jf42GEvZrA2Lb2vwka2d+l2yW8=;
	b=TlOTPI4f3coiY1HyVa1ZlpDggT3MAyzPiwSSukeo3RmtsDBX8K47QJKf97HDhyBb7ipT
	 VpsewyPhMkwOZcEfPNEq6CkvJn6vg7mClDCthZmYCcWf7U9wu+yuPMUGUqetgK1jZYN5H
	 d7s1gprV9T/ezRNbewX9Anj5zjSJeE6VONFTIjhR+L0IdHG5QLvqJB7C2P2rZW/XQxSjF
	 uUkt9Y6VhEEH2CS0mQVvG6A5ywMnbgg4NY3FrnYoNFBES/zQ2Fs0GFCNHRPMqcM85hnqK
	 i15kTPzAsC2y14fOkxwIAsRcFwzwG0nRlBh/PeYKgrfak1xHbSATei9FzE9mRqAoPOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=FKcdBx3Q;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CEF606A32F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 16:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47CEF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=FKcdBx3Q
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so19742935e9.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794760486; x=1795365286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4MqBiu+6D9UqT2D4Jf42GEvZrA2Lb2vwka2d+l2yW8=;
        b=FKcdBx3Qdi8yNwMxAo83rqPSg9b7Ri9Z/aQqRlU2zJy5m27il0OrqrUT4hzxun4CpU
         RO/klRpCB4aF9sZrBwQFAldWlJYAt5NoeY8HfkvX13bP874421A1sILxpPcRQf0VjOIN
         d5+i3gIVrnqjMCD/FDkYNiyzqescKVePrjrsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760486; x=1795365286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4MqBiu+6D9UqT2D4Jf42GEvZrA2Lb2vwka2d+l2yW8=;
        b=bwzC+o/J3BuxFzV3Nl6ulH0gSo3eO7+NLknU8zsv+wemvLmmQsreN9BU8hZz89SHWa
         zTnGWqo+jzubbmaUhhwg9HkvDtzJz3fbba/vfbkztxiUYAtMcakS4qMVd3fgPZO7t235
         5v38G3JkqYpAo6bTVAJs+/B3XIRIn8tW2U5XSeBUh0+Devyvx2jL/ComdmyPH1mS7s7l
         GOB492ZQ5CHPyiIxMLDWAeGxPgX7Wffh84qt4K1uQPMiG3jfV4h6L1/mllxdND0rUBxj
         dkZsWjWfSNYe8tzUI/qlHALDX0w3zOlOf6deq812wcPX/ZTw5HcCjm8L0A/Jope4JrGN
         IASA==
X-Forwarded-Encrypted: i=1; AL+hErFRjvUGloMyfv53Ys2SaNnXGfY+Aavrm/u2RMBuArnS7L0YMg2frGqsEmty3H5xbVFz+GuN/lKjaqbs@vger.kernel.org
X-Gm-Message-State: APuU4Z+mpf3oJtaDXy4kD1lnH7rqb9PStJ6ZcF2bs3McGimqkNZzgz3b
	Nyui87W1SWLD/RFiuu8DfqQKZtWvy0X/dA0Y4QU4E8hez5Rd282shToyCFtHxE8ooH8=
X-Gm-Gg: AYBFou2wwbEDyOvWu5615SBqODcpylJexPJj1qbLLgRKCrzvpr6pOviHSX1dw25hPQO
	60er1nM84dP7kpA838ElGeb8bFYmt8wWk7OXWTuy3n+idJXMKIxiUt7MNVInJ8W1Cn2yiH/xyRq
	SVSGyFoOdJy7VoCozhgUlgQEGr3yeia0BkLoPOZ+hCKAde3Ndv+u0RQOni0F4tTqk0zxybPYNhH
	+DIM1G80q5ukMKdvqhogbjljhCmXXSY4AN1dWASSZfTPIWSTxhexLxAj0LXsFbVTDvC0mrUiAw0
	9CO95EOFUbeNyS9f44zVSa1+hlsnoc1NWDufWs1l6fX66cGmBwGQUJSa5CDlnaXiOvqbtBzfVas
	1InQBw8jMhc6X39DpsKpqE5r5jk6p3kropqxZZB4BVL64UIOfJvUoR1OnTQeX8L6wUyLtiamypw
	4VV6ZFJCfviE9c6SwfM95iwWe51MH1TLcFSR2s+AIKwEGGw7BygoYcWcPucQ9jvVvTmVwHAF0CV
	/W9492oP3nzWm9cePIImg83MnqSO0cUXprzJgdEDYMFAXeKlNHeU6vH+/Ex2Gj9ubRYbo/KeeQN
	HEDxT4lhSmj/TYv7imeUPXeWe5rjWbLx3EpEHSnNVa9jEJrMt9FA4LcxAxMpCgPuhYGZUM8W/sn
	mIGVBLgFTNaV7hOFat8nW+tqbeJdhr3dLyhdRut+h32OSDmcVUAReexS2EzZz7QtQz1ZdNZpMsX
	tweihE2dOYE1RyEHBLINdxjrMZMQ==
X-Received: by 2002:a05:600c:4343:b0:4bb:5e8a:7c9c with SMTP id 5b1f17b1804b1-4bb5e8a7cc5mr89345295e9.7.1794760486606;
        Sun, 15 Nov 2026 08:34:46 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f782396sm17500021f8f.24.2026.11.15.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:34:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/2] arm64: dts: st: add mmc aliases on stm32mp257f-ev1
Date: Sun, 15 Nov 2026 17:34:30 +0100
Message-ID: <20261115163432.2601947-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
References: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
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

Add aliases for the mmc nodes, so that the SD card and eMMC host
controllers get enumerated in a consistent order on the
STM32MP257F-EV1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 9c38c4fe0c1f..69e3ff4cecd4 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -22,6 +22,8 @@ / {
 	aliases {
 		ethernet0 = &ethernet2;
 		ethernet1 = &ethernet1;
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
 		serial0 = &usart2;
 		serial1 = &usart6;
 	};
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
branch: stm32mp257f-ev1-emmc-aliases

-- 
2.43.0


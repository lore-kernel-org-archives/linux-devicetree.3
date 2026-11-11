Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426280;
	b=yt7mIDS04NZjNkHPUIX4PoUDAcGeVz/gjupkis1TxNLlUjuUhwXqg8KZ02asbSL+01iE
	 qiVYh+kQZEFC58yA31W7o66+M3FPii6Gg0UUBiHQTswyohazvdzCVDPTjIi6cmNYKg2dC
	 NyLSsilYzzg6CFu/1w048zYeIIaGa1nWcSNrsKcLIK9C5HLw8jEM7sWkccuLN6dPi4wkf
	 mWiP71Y9tQt5LONV1KfEdeq5wKjxao7C449s3iq1BjzRHgGYrMtzo7oSm49WVGkqb6fM4
	 ZUreSMH33fYv9rkPVbLXa9xSAkBIhIAzknMOVVF+zwJqsYR7IPAOF4VvB3VZzKySejg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426280;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
	b=LwbgFosM8Dz1w3eUsbmJ1Ktt56kxXukqryCsJ5lkrmbZaJTr8GnOy7PUplIx5fncKv4N
	 P6g3J6RcsMT0T74JCWbJIZcdtnpGEJ7o/O/q1okbdPR9VlTT6XafKNZFWvQL5bgDdEE1e
	 Am2pqGlBbF66jIsKmv2GDTz6UkeCMRj4xztni/SIddA5GqwzNqvUQ1q16gTMhdf38kZrf
	 DU9h5f1AAJmwnJE7kcfxQgg+8VEjrHvRXC0f7Y8kociBM2W/vgogjqRf+BbVkMCx9sta4
	 x9mEF6ht0owbbPBIbDGoX+gRFnyUlrdi51a03Ww5sEYzVF44c+0v70Gs85C8qiuL7oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HBFXkPmZ;
	arc=none smtp.remote-ip=209.85.221.228
Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE7E606A327
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE7E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HBFXkPmZ
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so144982e0c.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426279; x=1795031079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
        b=B7FNZvEW0GwJwYlvCLGlAEaPncRRkCQcL7w+1I026o/seUVzOiE0LZe1mxwX6y4eal
         bTrm+A7UeJAsvxvdk9jX4O2dhqUcHaeecPe6P1n3SqzhWUoCF/D6b/jZpQQhreJy4KVE
         IPZIBqsz02ho8pD7+OzDd+FVrT7P+hhh0dwhwRbqEFWKMO+g9pYLQz6/gqCM3wc45EUR
         aMk/3lZ/nuJ/U3UW//LBk3NFoHFL75wEdPbtTTT8fgsZMKnZWzwywao8+faxOwaI507u
         G4JKhR8tij8gW0mTWQ9xai6/wxZEhFS88b4NjjXmMEfKlyk/PspT2btp0qN4uirhwYml
         +sLQ==
X-Forwarded-Encrypted: i=1; AL+hErGaNWkC+iHJY1L5eOiTdE2JUuiBSuIhIStGW8925OsbUy9aU3dvTioMpmJuguC0hmzarQLHXr6avToT@vger.kernel.org
X-Gm-Message-State: APuU4Z86uZMoLK2Fj1loqMVntR3QtKi5HWkIC+uBkgRB42n7vES+vc2V
	ZUW3U2e4M+7Qwg4/VEv6Nwc2F0NQmKV8TCRLm6RBGWiOzCiOWTdDwWn3jSdY8WHfmvEvlQC7mOK
	jppIGgMtfk4ujDxrt5Kl84oQg/4nGOYOmPYpAyGFEuKfHEgfaGpz9Ael/HNj7PyEspmP9ddpjje
	cir0XowvVwKyBtJVKTJ5/nbdyqp2mnR4FeJ4s0fIQmqDQ/BIhAxMgdz6aUp53jvT6R4kpTkRbL0
	p8rK+VHPHc7sg==
X-Gm-Gg: AYBFou1ppNz8KXE3mgY+9LYBYTD0+PybZ+h29HlidVZ7JlSTkYoTpBS5Cvw/lENWlmI
	oLRT28f8I9B4DDJgPeql1Lk7ZfAw8J762588WqYr4xpQECeVIn69z1SZYV9xJAGb5RDbJnZ0eCK
	KA203sch6Rk2kPCNQtaeONQXtc51y151G8fyFIsPX4TBffHZRS/yk5DuRWtfMZH/HaoOoY8NaeR
	Ny01+CZNOFZTsJQzfmtRCQwZmBJluVxN7zWoeA1lG+hH4Lj2CWT7mCSeuTgSe7PuR5U/q8yQgf/
	cPzjBR5/cUppP9gIwrmZLU3ZyXMjPi+MVno/OQGBTfok58moybUtCedSkxV8KUBnhDDb5cVrtrO
	zsmrtlqq8bVCsivcILQ6EMUAgWy53HQzkS7fD9PSUJGQn7ZiZR9nqlnQ5BAbcGOFg/uysFUNO9c
	8MrMeDyn1fFOmyzdyqgTHK08EE6xApcT/L
X-Received: by 2002:a05:6102:2c14:b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7d6317bd8b7mr184288137.25.1794426278630;
        Wed, 11 Nov 2026 11:44:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c2001870asm346706241.1.2026.11.11.11.44.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso143801eec.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426277; x=1795031077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
        b=HBFXkPmZ4z1sEy4//jj5YWIesewdqhX+n5LKP/wpke704q2Gyb+J5Ss3tyU62FnDvS
         ypWo7OL1oRZ3oGk0rlKl928/jwonSgXWtf3lt0HKYILiwuq5wj4eIJA7VpUeF393Y9ii
         iHA9pImpAXWnuqACUONhgE3/CYVjivnn4wwMo=
X-Forwarded-Encrypted: i=1; AL+hErHlOG9ls2xwObIh8AGDsDYSZJkwj6qsjxM4spKtgpr46rAoIwfka43O6UzWeAyOldfWmw61SiIonafU@vger.kernel.org
X-Received: by 2002:a05:701b:2313:b0:13c:f65c:d5b5 with SMTP id a92af1059eb24-1b4f5ea8322mr355070c88.3.1794426277347;
        Wed, 11 Nov 2026 11:44:37 -0800 (PST)
X-Received: by 2002:a05:701b:2313:b0:13c:f65c:d5b5 with SMTP id a92af1059eb24-1b4f5ea8322mr355034c88.3.1794426276383;
        Wed, 11 Nov 2026 11:44:36 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:35 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v12 1/6] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Wed, 11 Nov 2026 14:44:21 -0500
Message-Id: <20261111194426.1652644-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
References: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

keep-power-in-suspend is currently documented as SDIO-only, but the
requirement it describes -- preserving card power across a
suspend/resume cycle -- applies just as well to any card type. Drop
the SDIO-only restriction so eMMC and SD platforms can use it too.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 8b9b3b036129..2fc8e06d5ec9 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -301,7 +301,7 @@ properties:
   keep-power-in-suspend:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
+      Preserves card power during a suspend/resume cycle.
 
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag

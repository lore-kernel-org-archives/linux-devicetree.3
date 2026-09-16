Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CB83A83AC
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532138; cv=none; b=EhFS4tfoByWgrUjADifD1X9cscSRJlq9OfUN4S+oYYxz4KRTnoX0T57E5Ko/XnVljX5CTgipFIiFLN49iURQ8XnIH91s9TuekNgLoyK4cbCTEzrzhgzvMlEnvAsssqaYFJHOtEk5spmQoYq5Dg7tEd+3qEmdmWltm+BE4u/qgUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532138; c=relaxed/simple;
	bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEqgWUie3yFduhhnqNF/SrMnZxedb2IErZQcS8ka/FZdxp9ngfpx5lvX0U5YMzbU+KiQqNCa0dunxjTF6qkLpQrkIbY/ah374vNQkuXqJ5v5TBv/ih0I7S5kdiy1zzY6FGW3iB3TZlsvMiyWDPPvcKBOxq1SaJfVau89DEPFnko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1JVgfOO; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1JVgfOO"
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-7f4ddb9adf4so2110076a34.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 21:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532134; x=1790136934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=O1JVgfOOlmU0I4Tqxl99oVgfDcJEB5svW7Y90jaLi1SAMgvrsiIkFUgbqvugCOM4u5
         tfGkUdjmWc1irLqpUEp/ZY10ug94aw9eWqJ503nlKLg+tl8vOxheEaR3aEoeEJ4Ptqkl
         3+xmSLdrISG7uD8E1ngtDPZ5Dw5wo7uEQPS8uRABttgCG6NNpD4Zbl1ghc3PiE2D0vAW
         WZoQGrt+uGNWHy3DmHM7n4LfLYKMXFv5DJdZWlzs+RnT+Kx2ph9BJFFmTW2Hzf2d6oTS
         akrctkyRFCggd8kPssK3lb6M+bTQ1ZrDI1tHR2wCwRoTdhIj1GYam7xtqChI4WatQYod
         68CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532134; x=1790136934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=v50yzOr4L4sLcOOSR/HNQ74uTagvHEsmPhDscvoHdkqaoSq5cDr62y2krqIU3zD9qD
         vaecRgypm6UE9lsJdkPidI4kPpl9pJzZ8AwiyTAoFAJ3PufOy0krZZamDw8EOrV551fv
         QiqpdKsWkSSDg0Pqvk9lbvTMdmMxUxaqk2Y6KN9xhUTXS8snewUpJEavaIFlrVnexKua
         JGvYtVZEg34LszpnH8B3TINVYe4/BPbrER0D27l7nMU7PjaBmFnvI3uqO2lNH5/2/Owf
         51Mh7m9MP3eNJsFFZR+uNz/ZvfLfo3SjzdpRvvIyJribBa98SnnQMm6aYMxAXgI5IgDV
         YBcw==
X-Forwarded-Encrypted: i=1; AKwUvBzg4QbrgCTO6ZKOtNSCiVdJMdrBJP2oY1qmHPmUpYM7KPHS0nutb8LIO1UCCfJZJvMSWVlxzo2LRV9W@vger.kernel.org
X-Gm-Message-State: AFuF++kR0Xx0GXkc8OtmH3wzTPhVtYkE6symNixmOGaZCAu86dZ1sJoP
	CQi/F5dSoTA7LtTYZ7ndZPXbaVQ6GniUhIKI39P7eR4CweB3y9BIL5fm
X-Gm-Gg: AYBFou1uUpnjjh0zraLWlaUoZCzr6cdCAmJvU5eeOoqwQKUCzGaLdm11+7zVzgEMrUk
	raLulD3FMRUQzMDY5WFl0WbeUtfoklPZ6kncnp13eFG9uzJqy9qB8vNXPinEyvSe/JFGIfGDnEK
	etUKyR5emjU51nmEk67g8QKmLs2KN4LbjnNviUIGTRFwpSuhOGHDh3Q7OVSoEZk3cBTi99tR+19
	8nu0dzncbcyEvEPogz+fyik7hly02/7U+oj92wMEd46OeZsZ8kQjDItebF5ishVv/QDthDoMix2
	d+CMKo/CNPPOx0BqM5o/LIMLNI4ix6K/jN2P4KvZXrdR96eASn6gcFF67kGYxw5Ad0U6Mpfy6EP
	Ma/3/B/YG+ewlGbgmSw2UEpp0viQ9fR+lQ7LjZVx2d1is3o8v+18BeAmhOMXHV7lOky6JAApEy9
	COqOyZTWL0uKriXr1SEq3RCiXv1Rka0lB1Ns/8Yw0xTqXjr8b8kQfqIGC67d0yqxzarDw=
X-Received: by 2002:a05:6830:a257:10b0:7f6:8bfc:ddff with SMTP id 46e09a7af769-80b2cdcbd2dmr963693a34.5.1789532134233;
        Tue, 15 Sep 2026 21:15:34 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0373sm1440484a34.26.2026.09.15.21.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:15:32 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 15 Sep 2026 23:15:28 -0500
Subject: [PATCH 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-3-d35d2ac3d6f0@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789532127; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=Qdf5f6KxhlBn6zznJXIHm5ylt2/6A7HbBfAy+GlK4uGnXRE5GEfZMjssKRRjN1v/McHSPhcj7
 o1QFlFIYqhHBqBAzYR+NCPtMKgwVYgLdEInxZcyBNZ1KMNPGeCtuh5w
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0


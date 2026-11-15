Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733538;
	b=tnLueXMLOwMNz/OcQFRlwY+iM6xOgh2lkGYXq9wGLWqvdxdooNPwtDmKCtu17KLESPpu
	 d1n4ZN099XUVjWvS3rFMdx6I3dzPsOTX9+kE6bZMDY45fhfaKBuMavCu6vX2vpnagSbv8
	 uFMa3bdvXG3nL/1D0DN86F0yLhaYq5sWX4CkbIyZtO2BSUnRfPQWSBFpABRdUvQK1MEwU
	 8kr1ARZgx76MOoSXjaY3NtrosnMen94LV12CA238HUgbNFbAtcmsQizz9bf64zWmCO6rp
	 dIsoIOQ0c25B8GakujPZ4ORr90QHysQj3Azm1cLNtxgECWKEZIdcfQpvLig+w6dnTNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
	b=Q+VYGvXv70/lFg+MBWkbsgm2By+pIhdMMVjnnKRxEjtFDcs+KVLGGmPiY1gPgCmqCsXo
	 d/23lq7o2Tt5gQ/kizRDU+NovzUoZ0hg+JV1OzksZk4uSru97m89AYk8glbumAIJZSiLb
	 SAD2aINlqfTuni1+GxsgprzV0dmpJzvZuPpjP5kvqflwCGQdM0IzsbpzFhjKgXYei54KM
	 YYrGNc4vdul4QI4PsgZebX5dGHAoKovNrae91l1OmoH1LP1DpAAEhwGdXLGto6QdTfkJw
	 sDP2pLSLbnecYEvjM3aj5X+pFfrclNzfaS0oELrQkeZcZ9ywxZMmzM+1emM0r7T8Qig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+VIalj0;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A5A606A8AB
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A5A606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+VIalj0
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d427836e9so329618766b.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733536; x=1795338336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
        b=n+VIalj0TasjhIfTTf5UY2D+tyfAVqLrVCiWdkKqppita1mkmg/p5t7LxJc1e4ehdN
         Ls3s9M69wPhAeB9pqo1RvAEflRLqORiTs4xlj4z6AX9I3Ompp77/hm0e+tof/H4Qt1dh
         aumUrir8j8VfgnZiMfGY9n9+/jZuL90k0flDnv+UgD2uF4OHYkKg+265ZibJ6QZiprkC
         FhGFfdgMFJ6U46rbjUqhj0JyLEOda5rmqwmhO7IjSGvKJX8hZGTrXuD94Eo/zdxg1OxA
         OhAcHAo/eBd1UHq96f6W8tA28A0bs+WFfve8QxaznXc0CHXY2uomeAT0Upahrqu7uQZo
         H6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733536; x=1795338336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
        b=A+0jeOzdg9s9YCc6Zh1pXX6Aq+xcWdnRQ8+6e/ZFBHv6c0w7iD/ST2dzg8xqA3Lzp9
         7Kpydqw7gzjMhPlOxATkXmgfr4uVxOdUedM8qX9Cyr/kExyNFqdNg9R9DUr5JQS2VcvG
         z5aNP8ZqcgfJx8Ejscq1RriHr4aizhQ2CBnbxs+0pqN1mmopvxuOeEGxhzMJXVUADQZK
         2tPRvSi488/eajqoLd3ikRUQ3rS+1Ym3df0+J0rD/0p0xZqwo9faLlEJGbhG7zPM3fTz
         5Y1UemzETTYUUX69/nMzFpNxYi4UeF9fV8BF7VP+EsJ3FRBD0TUUhma8JEgj8fKTqsve
         cVvQ==
X-Forwarded-Encrypted: i=1; AL+hErGe3ZNgj9/7kz8PIKJI/f+Eo3Ba3J9eKmI+ipqjbzwwZvsHW7Yi6pEspd7iHQrZXcsUEL/yKjW/8rin@vger.kernel.org
X-Gm-Message-State: APuU4Z8wGZ1I7UvNHs3XlscP4uP/60V6l4b2t4TZLle1ypJ7zwhCARij
	9vj1Ve5C5U7SsuBgc0/TwrYptEm3S76/Ui0UN2NJK8eQtma/i1NVhFJs
X-Gm-Gg: AYBFou2VYvwkZJYQdWdK5/qTHaZQ1OoOyDt//Iw0l4GxCUkOz5rvCEYySly0ldRVpWJ
	fz5AUBDOhBr4FKwPYaNncqz9D5WFjrzDyizMmHrqnT0A6Ja2u77pguiOAPxsU3fj3QbK9N03XBP
	rI2RwamzxKXlR8Z6tdXs8yrM+SpzL4sPl8WMIUzshJvB8ADl7G/jRzwKzYsH3DvPse5JXdLqww+
	AAsoylB8j+M+LIEyHB+iKqPQMtf3BbjwefbLI247SjFMFNk5LdyPJVkBBcVHwOzjrHO8J2H5taS
	F55rntSCF8r0ueCXS/pMt/5rhc15aTz0n3R5wb6s0heZOPWjQkb1ng4KOaZjv9ot4D50Qg9I8rw
	1xJ+gAEi4M+bbA9AChpRyFLTjsOXe2mlOn5sXp7vZsKZhSTqYYdQYR3SbaFL50l5E0jLXEsuWxx
	KLEa85ugXaOfrNWOtx1AE7SP6QZ9UqlmMsIsiom3xz2rejMmNamHCJhrx57jQIMDrRthf+Nv3UD
	HFYSHQEcPtDhqb2lZf0fFuAR3H5w39/NhBcFQP1O60Y5Y+a7JdxpYVGCrfQ/k3p8zvByoMLgPFz
	YghYR0Lh3eNYG4e7FefnHAOz5zfIfD1iUgTSlAwiJI1qs4zjOp2xX4uS9qTkVHRsEXQqBjlN0WU
	0McfKuiDX/Q==
X-Received: by 2002:a17:907:6d02:b0:c46:9ca9:f524 with SMTP id a640c23a62f3a-c50963b6917mr589522666b.32.1794733536111;
        Sun, 15 Nov 2026 01:05:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 3/3] mfd: max8907: Add LED cell
Date: Sun, 15 Nov 2026 11:05:20 +0200
Message-ID: <20261115090520.102216-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090520.102216-1-clamor95@gmail.com>
References: <20261115090520.102216-1-clamor95@gmail.com>
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

Add the LED cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index b57c497334ea6..f492ade8e4cf1 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
-- 
2.53.0


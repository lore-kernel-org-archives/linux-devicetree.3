Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266214218B5
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971840; cv=none; b=l9dbh8Jx07jX0aHhkstO7nHHLSi+MzW5JW219lPm1wNwAma6UeWBamVCHYk6d2e4oPbjVoSU/zr2TujTh3aLg5Zkmc9gkHJI2Zq/oNUG5NIornoxnl15isKJ4i0QhlLC1LzG+3A1+vK3aNwl5xefJluSgm0eYI7KyKwCVhwrBT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971840; c=relaxed/simple;
	bh=Vj+thyx6im8c/60dw5piAk8vyroKtJcY1a74UdrGYxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwUw4Klfrk6u7zl3LQKAGDYp8ji8f3mXl+oSyeO9Xu0258E/QeaTiyTyD95IOvOprCjFS8rpStcyhIWUPT2/6P7r/3rRWTnBpvqMAYNF20dDZmvW7m+/m7WQpPYp/oF4u4tv7eaO4SMtaJmYmZlV2zOg3XhCFjKuzXEwm2qOrr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=diS2wWQd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="diS2wWQd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-482f454be5bso196935e9.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774971837; x=1775576637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wsphdPWc7OLP974m9ulR0tmXF0Yx3Br+A797hF6by8=;
        b=diS2wWQdXlR0qqXVtr2OCyu/PeY5JO0EPhP/jxJl6b7pwAtOVf3K/IwehqpR8R/0s1
         7nrjoz+hLic/U8601qU5LL5dbJ54qS2lqbRGIXhmXBIabpQY7yHwcNvIQ9lwJHalCUny
         7bh1iawzoEuSuwSuLLwPoZ32CdXkb3A7HXQ1JbIkK5+wHBmyYpTV3ebxd6jZmSzN4uQE
         qu585xA5JD2f7mGVxqK70cGB5ct+wRnmDU16c0ZGE4kl12bn3VcuWsBimUt9GvE4oAsM
         nDwnRIN43a//CElr17L0MWhe6AmsLRv595KrPP5nM6cQmNVBmLbeHjoZwMMWYEcfFJD3
         +0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971837; x=1775576637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8wsphdPWc7OLP974m9ulR0tmXF0Yx3Br+A797hF6by8=;
        b=nvOfWEXcwhqFJ2XOHoBPccZPrm6HxrTaUBvaQ2O0uLFnOb7GKp+Aby4RzmqXE1eIsR
         a2wubs59BXDbwEkM2DAQqaBaK6qYZwC6VAP5fLU0i6QsoR0/c2gHgWzbH2AW7dGWl6Ej
         JfEt/Y8CBGBRnEejt74WqZ49/nQDc5WR8euY+67ABuqB88BX9TYOX1LSQYEgwEWVQhYD
         OLN3idv2pOnInIzmtyq7Ja3+Zg0mgmoS3tVnhSSYQUSRsSq9x0JmKk/UWjhZYc1oJuzl
         Zf1e9/JsqlxQuXFS/HkaUC3MK43qFb/6vpCqMyY56j+6SOkSG3EyKYZCuuJBphzVpzuY
         YBxA==
X-Gm-Message-State: AOJu0YyvQ0JNi/JbIRFbmdg/xge4cjq9c0GA6r6ZIVq53LF3jZ26xzTh
	OCpQjUikWXDbjtnn/Mm20Oh8AKERnKs8oIC+2aURQ+FdYKuV2YZSzcws7Qfa7J/l9JY=
X-Gm-Gg: ATEYQzwcKte0qJYDg6sjRj8XyQDWSjXdvKnG5MjWl4wHFWpaSY9xQ0BXvOO3Q03hg3O
	0AVooAMpd4qgsFRZv4u95QOPepp7AnK03Q5o5crAg/aSoUIsnXG7ojn6583xAUHCnzJMemheWzA
	Tv+VyStdaeYwCCRwWGBE2N1oyCDw+RFZ6tL+de974rNplhJYDlQqzXuGPSOCdFev1WYFWSNyMHp
	hxnSAgQGgMwtm2E6VFJOn+ImGfU/WSODz2g3N72EhSJnNtIaviuy+bSxD78eUkdOoMv+W9/sSMl
	HQqWz1lG1DIv03zNXKWOtJOmt7aZW7k4jOU2VOKLJ76T1BBj0ofzg/vZkqxVLKtxsYQLUmrvUZh
	mwGMscXzO9RgwX6DK0iDrb8i74T2/Fc0Bm/fYLbz5eb45uvVgWBuO8k/DWCo69cXWCn7bCw36WB
	byyDN77nkY5og3c1CSP/g2TbAd63jxgxEczU+MRn7a2IvAMagaIkDHJtZztjSO/zngylv8U+bm7
	asl6g==
X-Received: by 2002:a05:600c:1e0d:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-488783ae683mr69431825e9.13.1774971837562;
        Tue, 31 Mar 2026 08:43:57 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8852a5sm48412605e9.9.2026.03.31.08.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:43:57 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 31 Mar 2026 19:43:41 +0400
Subject: [PATCH v6 04/11] regulator: bq257xx: Make OTG enable GPIO really
 optional
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-bq25792-v6-4-0278fba33eb9@flipper.net>
References: <20260331-bq25792-v6-0-0278fba33eb9@flipper.net>
In-Reply-To: <20260331-bq25792-v6-0-0278fba33eb9@flipper.net>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Vj+thyx6im8c/60dw5piAk8vyroKtJcY1a74UdrGYxA=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSefr1e2Xt63Dd3w51LWyon7VGuF8lcub6+W6nq06uPJ
 a0ZGRsiOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 Q0MdYx0jBi5OAZhqYUeG/1GrrB2nL/uzzLOCwXJmM+f93I5qw+dTwxNuBL7+u8/u9nFGhuVFBoU
 3N86w3/fv+TLJavmg/A+iM3qPyC85ophdf+i5DDcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The bindings describe the OTG enable GPIO as optional, but the driver
gets upset if it's not provided in the device tree.

Make the driver accept the absence of the GPIO, and just use register
writes to handle OTG mode in that case, skipping the error message for
-ENOENT.

Acked-by: Mark Brown <broonie@kernel.org>
Tested-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/regulator/bq257xx-regulator.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/regulator/bq257xx-regulator.c b/drivers/regulator/bq257xx-regulator.c
index 674dae6109e9..0bb58ab4b8d4 100644
--- a/drivers/regulator/bq257xx-regulator.c
+++ b/drivers/regulator/bq257xx-regulator.c
@@ -126,6 +126,12 @@ static void bq257xx_reg_dt_parse_gpio(struct platform_device *pdev)
 	of_node_put(subchild);
 
 	if (IS_ERR(pdata->otg_en_gpio)) {
+		if (PTR_ERR(pdata->otg_en_gpio) == -ENOENT) {
+			/* No GPIO, will only use register writes for OTG */
+			pdata->otg_en_gpio = NULL;
+			return;
+		}
+
 		dev_err(&pdev->dev, "Error getting enable gpio: %ld\n",
 			PTR_ERR(pdata->otg_en_gpio));
 		return;

-- 
2.52.0


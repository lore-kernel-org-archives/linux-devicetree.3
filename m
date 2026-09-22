Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF01223DCE
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035614; cv=none; b=JLr/lAAS368GLshmS2UiQXTQT/FJj/l5Z4xyW5cStyB5zDnXR2rFVGR1ytAoLA3CHh9bseupWnldR2AhdJ76N2tn8Dv7CGlsjPt164ZzdeeQrpKErDPsYAt49Qqy/jJPyqvlXwM9J3zZxjZRA+0kKNFY1v1xTzJ9WHVergvKu8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035614; c=relaxed/simple;
	bh=OJS6mQlRWmTTimOyj6kC0TvQSBszoDm45iW9XPqV2AQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H8vR0l9LQniyc8GajDfR9CkzOS9/uh6Y2K601f0qVqmcuw0PPfbLSezOON3A57c7K9sz7JxfnwfOVX8daqQ0r5AEw2wFVliDh1d26T8NnhcU1C5Fg9qMyo/I/VYRCa+/IXrcGUpGXQZj6DrjPE8p1YP16/AK9TJmUZA76PV5L+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mELEbMC8; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mELEbMC8"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccdd76a9so3216098fac.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 17:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035611; x=1790640411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=mELEbMC8vP2KT2ZWY8+ENif1pwzjJPVXEwcm66ZjSyZNCkRause6ScsffBjqyHKA9z
         OzsVNpw7WW14B4P1CdXYyZtEe2mnPd4GGGeQdjphc4oxljynOkxVd8aZDRfCjqdjdeg9
         2IkSjQkZvxFHNwk6a2/s8Ah3D8DYjrGlHyyX2+fiCWTR/PjP/fdOEcMiB2k7yj3twpDw
         5YVwhHUkU6IJ6vkRFAfQtr75Fb5l6ckReIRD6JxhA8cBRe/l2jbZgQ25yl3q12IzDnAT
         2OIAKly7uLHETzaRJ0zlmVGyqgD8+3CwjIi5WWPqXT8RcCr4xN6kfZb5ZViYo7BtXnDG
         9Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035611; x=1790640411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=uk+g9p97jiLQ6b9A2lMaaEiZLnkqRRsgyuNJMTHNShgOis3yyONHcp5gF/S97W3tPI
         x9P5CtiVbZwZdXAKvE3xu0jq0hQc7K8bkpJax8IJK8sLJwfZ9TM+h/zg4pvbB39FW+D1
         BaH2/vVzWJDwicXiV1uKF1nGjxdwoWtYIpqlzNE4H89fqdGCPu1Ec7uBQCMHYZC/4pWA
         Lg2umqd2zYPF1LX5pQjtj4LyvVlMg9ZyF5MYJbkNVpDH59Gp3cb3ch8Bv1av6AvOkAYW
         y/J3E487S3ue/1YEKRYA3ZYtOfrF6QksfaxXRxYUdJFUtmsPuW42ZLj3AlnkVvw2kdWn
         WCVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPzk0/bbJdSCLgBNVhS87BVYLAr1EEVmMyu0Zd3HHi6Pn/uZNWg2MgGJG/Tkf0sf9BiJKCYenmNfAi@vger.kernel.org
X-Gm-Message-State: AFuF++nD7Q2kF5eDlEFOEhWcyaUYQY7Xf3YVUvxymygK1jxuAfbHr6eB
	A5pBlmvoUEftXL6mOfoyHeReHo4UdcTSDSMttY4rX2VL8CwqAV1kXXOu
X-Gm-Gg: AYBFou3yD1OpprU8UBNTOiCheqM2gAIOO+zMIqVYP5IwIyeCjOR8gBbr2+wNjp1LEys
	o5Iyii+ze421LjKaXlcFTi48OeCfGKtc0PGPiO66EASdR20Ssm2d3KcAvIsbt+KWI80u30Xixem
	7NY551w8XngQ323ZllmK2lSCVymQR6yWjvr1jeVMlPx5hCbXISGLW1Y0Eieckdd0WbjIK3kQSjV
	7NWHX+AywTw01mbOPu1Zsq8ZfDrBHLqC0tF3GKfiJznTVuJJo4X5Te8EaIrBi2JdZAgMf0J5F9Y
	9mDvZj+hyOGeO/tbMlp6ykTgemRq+jj3uutb2i7WJTAE1SkG8rqc9vKMT9rv/AjCfkuf4SSrOL2
	1tuAF5VZXis797D2FngfEojCcL/MQlq2nqo/UHOw1wxUWjAdpVba2PvCSm5/uIL/226G/xB1XEf
	pu3rVrWCGuTj3Tpt1yj9NqvdnNZDMnHDMH9p7jvHy+hkaXjQYHDwAgcNZZVFywKUkJVyJ49zuY5
	tOHYkpgmPOVcV2SwYbWbNJyZDXzIsKpJ4ylLtvq9/+h6TjOS65RExIBI9UONPnJm9zdri2fe8nt
	D4WpXbZyknhL3+5Pn2eyhbyDOYh1QhaAzcHDHGbya0pZ2HHWypZqOfQx5xZSWHzJeCc9LL93TeC
	7EomzsA3nItlYksl3oE+U
X-Received: by 2002:a05:6870:e24a:b0:483:d19f:334b with SMTP id 586e51a60fabf-486e6eeddb5mr12235098fac.24.1790035610897;
        Mon, 21 Sep 2026 17:06:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f7280cf14sm801683fac.13.2026.09.21.17.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:06:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:06:34 -0600
Subject: [PATCH v9 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-h616-pwm-v8-v9-5-37bec6201ff5@gmail.com>
References: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
In-Reply-To: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..d9713b1044c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -918,6 +918,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0


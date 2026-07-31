Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3DF453A2E
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514914; cv=none; b=jR7evJo+ODC9avSo51c+PuGEcNVxwiCEDRb83uUOt4E2FcINXhjOSjFFeq0xa01taLbaCbYC5lOiyW4MjrlEHBPuaBmaNj7aJX7YJXVW2Hlu2qFmqcbBxh0vx5Egq+qIoAzGjFN4Dy6xvtvW+d79ryJG+j0wZNAn76a+6veOBpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514914; c=relaxed/simple;
	bh=XxPxlj15S9GHxpbr6kayVJohduiQuJOZXJICcGUo5pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iLOK33pdZ4yrgdv1B4R77nUbzhErDbnuOPXjFNuljyE40CFWKhA81n2xs5qaJvIjiWbI2bUTjKfvZIMciZGl/gNOhRNWzHqslwZVdxngNy2a6MoO6FdudfGS//WCdqyzSSeJAX1umutZxF+e5EJQA3DQrnI25CJmUcDGSobJ1XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aI1guHNR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aI1guHNR"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso775344f8f.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 09:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785514910; x=1786119710; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uJ1sTQDdzGH3L1I7c5cySgVgb/wH3f6ziWC+LNjIF5Y=;
        b=aI1guHNRJprcHVYaZDag0eJX7ZB+82dfKJCf7YgZ1k9pgdAzeK8oki9YG+2iegX+vp
         Smaq8mM0YfhbtQ8vUqdvwiO114sU76wpao2ffOSSaoIlLA/G0BwyVbtKuvbDgQWeepCs
         Lla+gKtU3yh3SIxBeA5DRz7vHp5sLdAR1Ps1L4lTmb+cWxHaFjH6/DiMEZnisV48AtcN
         DjLqYaD9drWuVde72grzdPRrNqb6d74xk++w8fpVx46dM8Lalr5jr5TwuWVhFF65y2sN
         lv7RTU8XVdWZFVsIn9+c5kDwV+WrJXTlcn6IJxQyhh+ayiVAbt3MMOYJr6aFj4IzpAe4
         +Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514910; x=1786119710;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uJ1sTQDdzGH3L1I7c5cySgVgb/wH3f6ziWC+LNjIF5Y=;
        b=rSIFHTUF/PZY13L08k5zd+8biahWBpVmu2AKMuJ8jgyN6uHDURb3gKl2ns+K1pWcN+
         i6/S8iV2XR7+f8uHm6RGm0ckdaQWrTbJ/ezQe68mw9quIuuwXSn0i1o2pbP3dHU6md2h
         M41ZdsO8jG4YdDokMQ0XRJLuZHRtJczv/n5uPmhizNzjjiESWrEcJc8W8h5fCTtVA1AN
         Yw5yz+912qUmngoSu74cLkMXiHC9+j3xJBJbuqFi1t2umbXswSgc2BfbLKfeearvVp4w
         khs540YjAXXCUQrN1wErzbEtOKYLNVNQCRP4uW69/11X4gqtc0Qucp1PO1jmYIlq8lN3
         FBSw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/K818BsxIIk5IL+VP9ZmDqv8P3L7aYTQHBEC8wKjIIUFi/Dzi9F1fF94TARKuJ2yJbrWleC7jti9B@vger.kernel.org
X-Gm-Message-State: AOJu0YzuU305tJxadEeCFPftAv/L08dsD18uAo1OWh1ckZAexWnli6KC
	kvucAMmQVw0nXx7J17klFxdglsGAHtQ6kCQNl3Iyr5DYwyJfPcEaSyNConG8JZCzwWg=
X-Gm-Gg: AR+sD10nzX7IQncjA1bopp5Rf2xZ4rHgzLLfRB4HNVU8SldqISO6wrKN2Y9ybu2kphk
	zhBW6t0AXWC2719pNRjJ9P1lgF6Yf8okvQZJNKh6946HVxlQwbkteAj971PEquhnDKMuZ4qYTij
	J6+4NwPZPTHCJG/80DnfA45I2ZPdFIdW2GN7tv19TG4Pa6+8LhnLWxO/koH0zl8BYQJy9j7KWMl
	kNyKR2IW10xuqUbqC9Ib6EMa1YtX93d7MPNSRX4q7dQFdSjsECm6OygbGObi3efuZTU2Ju3WZUZ
	UF57FjzNIVjPUfNk2NWbIogiFp4Uqn+vkpPPqMXlQcbMaWxwvfctUNI0tTHt9tjtGf3wa6Czqpf
	i8FUkJ76lwDPwufUdsNM2SS5q1oHZwwYe8+FuX0DLi7SAJsbBPfeVCyUKj+XAEV8kdZHjW3ZRMn
	ZtE++AOWhujEx45Bh1jWcQvT1qloLYGHTYNZa4R9PaFicOg9nwyhCYNQYcE0zoakFpK8Dk
X-Received: by 2002:a05:6000:110d:b0:47f:59ef:bbb2 with SMTP id ffacd0b85a97d-47fd72b904fmr539478f8f.17.1785514909845;
        Fri, 31 Jul 2026 09:21:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd41e296csm6440334f8f.12.2026.07.31.09.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:21:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 18:21:45 +0200
Subject: [PATCH] dt-bindings: mmc: sunxi: add compatible string for
 Allwinner A733 MMC0/1/2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-allwinner-a733-mmc-support-v1-1-e9209e3f9761@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJjLbGoC/yXMSwrCQAwA0KuUrA3MByx6FXExjalG2umQtFUov
 bujLt/mbWCswgbnZgPlVUymXOEPDdAj5Tuj3KohuHB0bfSYhuElObNiamPEcSS0pZRJZ6ST8x1
 FH5h7qEFR7uX9yy/Xv23pnkzzd4R9/wAckiuRfgAAAA==
X-Change-ID: 20260731-allwinner-a733-mmc-support-c901bc312eef
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XxPxlj15S9GHxpbr6kayVJohduiQuJOZXJICcGUo5pk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbMuaGBEtOXw6eyEAQdb4ueNcKXVnLyzMw+3Ow
 a8chhWa/IaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamzLmgAKCRDm/A8cN/La
 hR1PD/sEk5V/TmB+PixkJKTl+qwb33DuOqRp0owY1d0HZF7hDO+R6nDvpCaUe5T2Ggv5kjSICDO
 5oxaZsYafCk8FDT2kEjEMVEt8ip2q5IaCNCvU6wrOr8XntnbCJV7UAW7QDPEOxhuKET4J7lLL/k
 fdajXh53to6Jb7TnZUnws/ji73UQpptTVgcj2iowcc0/yzxYjENuvx4jh4FNKpvhjYLS+JwvL2w
 MJgvjIB3YVTHyHxFvhC+3rdf6XA47PuIuX1Njj2xn1hKoFsdRvISZedaOWqdENe2dPHcQsDw6BP
 8hJQb9pMAgorYFy53+c0SwdLz/2yS+272cUOGW4mkFY5zUfngSLFhCcA/ObOorfsTtG72l0MOi6
 Jdxe9ZOsWt77g/zNj6nNh+9L+o/Z2r6iIRv2BDJsEZe/JQkVev1vUIeoGQ7mQz1Gk1nv+Ug4vV+
 PCmxP4HikD+k3uaDOeN/tTYB5+GI7Nf4aEN5cwjt9VuXl8Q6474tnY99TqB5abiMt/zikW4vVhN
 ZT96Hz9gCkVJXSeCFxyMFimDrJb/WWhH9e5afLEsy0oPV3hRt+souELk+e/igMJfaqBNYmjgJGo
 EkeOqbsv+NOEiAHdV2BCYd/basqgQB/C27NOMLgF1N9AVz5A4EADDZdnHVBhN4vebI6e6obgoDR
 If7GJB/TYksUT/w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 MMC0/1/2 controllers are compatible with the D1 ones.
Add an A733-specific compatible string, with the D1 as fallback.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Like the A523, the A733 3 first MMC controllers share the same IP block.
The 4th is known to be incompatible with 3 first.

Unlike the A523, the A733 4th controller is not dedicated to eMMC.
This 4th controller access the memory through a different bus. This is not
supported (or tested) yet. It will require a different compatible when the
time comes.
---
 Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9f3b1edacaa0..9e9610bb1eda 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -56,7 +56,9 @@ properties:
           - const: allwinner,sun50i-h616-mmc
           - const: allwinner,sun50i-a100-mmc
       - items:
-          - const: allwinner,sun55i-a523-mmc
+          - enum:
+              - allwinner,sun55i-a523-mmc
+              - allwinner,sun60i-a733-mmc
           - const: allwinner,sun20i-d1-mmc
 
   reg:

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260731-allwinner-a733-mmc-support-c901bc312eef

Best regards,
--  
Jerome


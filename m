Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B43477995
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643405; cv=none; b=FCWL3XFFmV2GnwhoiujusMy+OfQdGyNZos6ExH+z93JMwfbz0isPpTtGWdxwfpgU51vQd2ghO9MkQt3+bqiexpxaoEkrPxbldNIoo6mZY75x6Nde17AaBXsZlinQHsbCOdltSKKbj4yZIhDEn1ntBeQJrEDFzZrphsUPukHhNyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643405; c=relaxed/simple;
	bh=hVTb0DesiLB14DyOmgF2mSD+qdL2FylIfKbrjfTiu3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8lukNCe8wycbgffn8vw5dFuJumd+3QW2qs8C/kC0rco5v/2I9oXxxkzC+ZoJCgiTTrYsE+h7upLIlE3s4kxqlRnNjRmTysKs1fjIXUjKS14uyuv9HxpV9f57ufOtnE00kGP9jxvqcY0HCfzc92qK5oIWTMjbN999onBbA02/gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeglxoMt; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeglxoMt"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46015dc517aso1284832f8f.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 00:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643402; x=1781248202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRiUKaQT1nJBPq+KqxNJfa8ue8e7/Pl8K6UY0lHo7O4=;
        b=TeglxoMtxklcy6nTqFAzsR0oMiH8gCsf0xd6YP0kVCj3l3/qNrbAO05Qq6olTG57+8
         PrQf223Lq1rDdixXUyya3OpujCwGqTtl0/ESXn6dylTY++6SnJkFAjZw63yl+4bzieE8
         dblgvWb5+9GZoRip+eSks2dPs8g8hJAHwoxXw85gjbrrubM+NrIrN/3EOieW3bkz9lBQ
         LpFOtrk8Ldk5lq3McEkL6Mwzh9RlPp7p2IuKGHDt/dA6ph55CrfUcmZI2scQxxqdF3bJ
         z+gTyaG57I3KP+g/Z5X7q9zaU1AbTYEtVU8WMOcClD/NmMVhX7Xd6u06r0x3HCacNVy0
         JR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643402; x=1781248202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRiUKaQT1nJBPq+KqxNJfa8ue8e7/Pl8K6UY0lHo7O4=;
        b=HC5UWJRNWz9nTQTXj3Kj9kF5lzuKKiCjSgCJDy+Oist4J975tQRF3wdXd+Ezc7d99J
         2RpKUy9BD9y1K7801fqJvJ3qOCbRrjJWTikY0jZJK+6KkFQRzmwCIBwY3Q9vXVpGC5OO
         osRh/tnu53GXtKkI2dgpB4qxULBRc3ldAgFoWRnfrM69h5CnBKKXx3Uz6EJtKMrhZ1xz
         OYb6ctUiYiHK+yTK+X7cYl0QMV7pP7MWUa0UMefBF53+Tg5GVQXD4LTKDduc1PYcy+/Z
         b7QGJTXFtapuYC1ZBdtd3X4INpNEyqKp3vsYQ3VnDZJPSsCbvtaMOzGOVYBy1EBiXZvj
         iRLg==
X-Forwarded-Encrypted: i=1; AFNElJ/fRfkf0pm+3Se3n4MJPwbpb5hGyN7qKynEE8Ge3B2WvBwNiK0SfY7EHZ2YBoYN00uvEPKn56Lujbrf@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ2FLd8DSqcrddhVW6OLwQzYkoZWG3/ea+s2F6D4MZgtWeudC3
	O6j3p1AOdC9vSa4b1VgzwW82E12QwQyvVde5GpUUy9FU3kqglUntxsMQ
X-Gm-Gg: Acq92OGLUNMJd5S1pmSk+yMi/gd+vj6Kt8pAhMuO7K4yg5qU82hSq46z6xEmI3QHoUj
	fh4rVMD0iH3fzx23cRMAJhBEFx4/NuLXGJmnrGBzW0Y7T3Bk7WmlTDrcmM32Ez0E12aEwiMJ1U1
	EySvaPOozQAvnmCU5jskWiqCP9XD/efyQ7F3Rqz1a7fy5xPgecvO/9TLyUvpG4nLcvc5irnuuDk
	oMP/BD+MXlCSBH2IF7y1UyfiO8RE7cvagQ8O/kZcKSDg17KuiPBMnlZYJMe9DXIfGHI0g/O95ep
	risFsXWVkHSi0Agp7TZtea+2XZYDiEw1/AEsRcn7zsV9bLKH12VYIKQv710ZCCmpcX2tHk9t4TK
	2LPWuayaPbBcJmOfnJTr5KE21o2zdGx6kItj7jRzxHhXVGdnd9KA1ccD+7s/ljiuMTT26JCkLTX
	Nx43H/WVIqdyP8I9S9OF7LFTrkth8XusIFVCUoZdVGSYugFERXXCJV08s3CUzzobGEsRJPD7Its
	pSNi7DVlhpRZs+3pI5UEg==
X-Received: by 2002:a5d:4ec7:0:b0:45e:ed7e:f900 with SMTP id ffacd0b85a97d-460304ee4bemr2656740f8f.6.1780643402240;
        Fri, 05 Jun 2026 00:10:02 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:01 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 4/7] dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
Date: Fri,  5 Jun 2026 09:09:18 +0200
Message-ID: <20260605070923.3045073-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A100/A133 SoCs have an LRADC which is compatible with the
versions in existing SoCs. Add a compatible string for A100, with the R329
fallback.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- new patch

 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index 6bdb8040be65..524c8b51f53f 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -23,6 +23,7 @@ properties:
       - const: allwinner,sun50i-r329-lradc
       - items:
           - enum:
+              - allwinner,sun50i-a100-lradc
               - allwinner,sun50i-h616-lradc
               - allwinner,sun20i-d1-lradc
           - const: allwinner,sun50i-r329-lradc
-- 
2.54.0


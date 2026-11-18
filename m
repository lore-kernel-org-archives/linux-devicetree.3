Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036693;
	b=q9CVKuW3NGrGjPNa8QSsbs+ByQebZpf+XQPiUJH9weOp8JMu2MYr3hiTHa/McCeCnMUX
	 bY5Luh3GbMiJY0CamCFI4UsrwffUSP1AHcd8H5dB8IW7cxX+0M+VVKUZRAdTCwyv3wbL5
	 s23H4F0GR1a6xb2UXH69xCgx8ve4TQmOBQn1uHQkvW0+rb5TmXgiWK6xNV8gebSDuQy1Z
	 eJpF92ngriLylykxp+lsuMay5uQLaCkiPy3Yw/uL2MRV3SVYNly8wtJJwKue9eHGScxTg
	 I1/A6ay6f1o8+D+BlNfQZAFIAvyO7zqIwyocC8Zq3dyqPy6zBO6ArUvz35/Z2oYJANg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LKlJADHwH5NqUO0o0wdmoyXzEqNGvmRzK8dmHnsCwl0=;
	b=d/C0ZZlK0bf28jOdcXO2Wif78MrrR6Vxc8tDgYFhBn3lCUWCqLobSTa2Bs6TcwdCn6s7
	 39NTxvl6F4i+SkjkgMEPLNS5qw+b/kCaGa+QvjWe8BhtYaQdZ/8HwxPqnt7eY2rUiusrz
	 w5XRQosWFvo220GtH4cp8JtOHUwh0CzajW9lVLjhDW+TFaquNtNp8FZs1WXO1nJLWy4r5
	 TBqTc0BASUHSX18sSXyBe3uohT7BCI69Z3SdzQ3pzIBGx4mVPbIR/vwoBk404OlAsMTfV
	 LjB89R5Cq6Lb7FytdjrBf4vL1ktPVm5SX1SWiRissTCVqCtQyc5d//TbL5iYzvsHK7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COdceWXC;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27163606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 21:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27163606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COdceWXC
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3028647c88.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036692; x=1795641492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKlJADHwH5NqUO0o0wdmoyXzEqNGvmRzK8dmHnsCwl0=;
        b=COdceWXC1oh1o3WBBgewEsNco92OICaTqVnIacXcPxsH5zYtwtdhg+uwnQrB9fqxqB
         g/xHfyRSnGghl54HHGs9f3vY2LQahFBzTBRY6tQJu46ysB9zMQsXdiqL6v+zg9smlOZm
         0J0AEzGJPWTDRw2LHN/dorK9Lvg5NT9Ne9hBJOMP7ffNNIlMGPMSR0u4S0yWgMHo9jUS
         iHHJ6AtBIR3otH3Cx85uE098MAv1AOU/WO6xBGvDp5uzuADZhkpWVrOdjejG76SQlgtU
         JU73EyAzRY+rO+V/ZgyZNU4xzpYG6X56E0QmqV3SoVfOwpPpV+rFTczzVYKCawS945oY
         0zCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036692; x=1795641492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKlJADHwH5NqUO0o0wdmoyXzEqNGvmRzK8dmHnsCwl0=;
        b=YmKOHXQd6GMqpMkseedsR3Egebes1buJyaZDdkhc2V4p0Lodlz4ooalFUi3P0Gf24d
         VZa6XeVSvHw/hQJTuvvbqVZJLfQLelVfWa33kYwSCPQuxiIlDAP0NfG/xbTvpskvZBLR
         +qKtz5OeBgSvws3mkTzqI8zH7SElu6fn6P4REAqU0B4taDiCN4+0sg77HLdFfX9F1LKi
         JP/kzVVYNIFC3X0t6dMX7ckw1jv/3dl7B/Wq2hmKsK/hvUjSpYg6jvJXcDnnIWG+1YdC
         K3/pbG/DsUBn/R6qE2LkW8ko6aiFfArSdUOJ8p0oLJcKE+xGAwiHmwyTQWTwRkP9KYbh
         RoiA==
X-Forwarded-Encrypted: i=1; AL+hErF+AMgrgQp4Yv2HHrpkTPmfBgUj7kPluxeJVzcpg6HZpbATovlcq0hzCl4pXCiT2fcPzHb+nmkLzlUl@vger.kernel.org
X-Gm-Message-State: APuU4Z+AA79ikEGQoIelgrVnmcH0Plp7fuJ5i9vkdevBijEoH+FGMust
	ocoTL+2nDvMdejOQeTwZVP6Wv+wUewMKWFDvnwlVGZ+oNDuygkO0ll5/
X-Gm-Gg: AYBFou25nyzpU7qsbQ5r+jsbxkCl0pwv0GfkDkDAJd0h1WFJxH/Q13e9a5jHVqjipS/
	lzBF+hMMx3E/qA6z8iVdc85DBc4y/ergGA1IZHV76QuUv6Pn/GtRqlGo0sJ5luTqC7SgmA41Bv7
	gX8hyhDLoiR82/qH9ho7IH4xmRJo+beFMBlxlkneZvPHtTtRrfGViQN1DltnlxLBMiGQJvafqZC
	LqHCy/b6zjAVOhL0WkW6rUgptXfkyg4w62JBD71VPhC9/w8m+qofuXggY7HPgJS/pTC5E3o90zH
	IT6cGvEYtoj4JHfb9dlbVeOKUZFY7hNdXxAWh/ls7WtK7gf/00TOS8Q2tBrNRe30puk9CLPgrhQ
	kJh07OuN/nnkpWlYuFhyL5ijWbR0IOiaEz7QkUdV9FBnMaNH2/FqXSpXLKxFjFETUL517Qh0ZWG
	DiNEklxyK9/inMazQyP2WOEcCY70YRUSNLkWAxhVKUp9jPAHrHi2PkPXJhZmJarg1M2Rd5CmlLs
	75lsv3wSWjaYcGbvZDqiUU/6/YDgKuDzjsWCUFZFvyAnBRdKSVzsmuj1N9Bt5CO/an1qppJGvoi
	9Fi6QkK7+MniHFOkXxfhkF7fzJAu0JFoEO2094bO0TRqEzEuCCY0AA1z1lLkuCDSJ9GWz9mKBq2
	HpY4mqnuTA002ZD7e50wwug==
X-Received: by 2002:a05:701a:ccde:20b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b543ce5e34mr3635627c88.9.1795036692103;
        Wed, 18 Nov 2026 13:18:12 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:2fea:c6f8:d30d:433])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm8736807c88.4.2026.11.18.13.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:18:11 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: pcm512x: Add mute-gpios property
Date: Wed, 18 Nov 2026 18:17:59 -0300
Message-ID: <20261118211800.63292-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Fabio Estevam <festevam@nabladev.com>

Document the optional GPIO connected to the active-low XSMT soft-mute
input.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 Documentation/devicetree/bindings/sound/ti,pcm512x.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm512x.yaml b/Documentation/devicetree/bindings/sound/ti,pcm512x.yaml
index 21ea9ff5a2bb..58ea52e79860 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm512x.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm512x.yaml
@@ -42,6 +42,10 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  mute-gpios:
+    description: GPIO connected to the active-low XSMT soft-mute input.
+    maxItems: 1
+
   pll-in:
     description: GPIO pin used to connect the pll using <1> through <6>. The
       device will be configured for clock input on the given pll-in pin.
-- 
2.43.0


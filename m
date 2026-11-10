Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340370;
	b=5MetBycCkQPXShsfS9UxT58ALbhSupX7n0Y6JNq/2AyHyRw1pbm2XTzjq2Vs2bC2rxtj
	 SULlh3II6YEDk1El9BJxanqp4YQz4U75NQYmQIM1Jp3/+JwgoncW2w3W1EX7pGWscSvir
	 dapckXYLaD2eMJ+JE1QdIJdcXCGw/eanOcmMPoJgweWn59K4srCBXMeIJxVJ6r5BKEite
	 Nde/DznohG7HFsB/TzU3NSCeLnn2WvWJ86ck9flZ05ElynvewkVUeBDq3D7xiI+kgki3J
	 Y7J6zsfYMN47LiY3rugQ9wg7Y6Eo2USQwF815MUbB5iPOl//NF+0CrnZmilwwLUvNTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=WV1W9nBfS3ldLXeMMEvma4A9q4C8mtYJggnjjv7e4es=;
	b=Yxx53/6Mwu2Og6bklVVTS8z6/JXJFo5PoRCy5F9rvkN4mYRPvnaiQyJrTBkvt4UJKFg9
	 lS/FBlXjZDTU7TAToorgSq4pcVKUDmtpFQEXcU5xsA/oIpjnuTNBGCzmG4UwEaOrU/GGf
	 dBZSHNqBR5esVwpSvfDg20TulWodK3WLdzNbnWS8XwmZ/d1MqV9MKvU4EClVj8PFkO7xt
	 6HHWTtK7Q5LgoOXvB1VJ8vD6drJ2mI+iMotNPxr5ULj66suQL+7skGO2K9h1PfrO7clq+
	 akjJn3JmeFeJfiUrsZcunF1IOFa9rupBPTkNKy2H7GZGdBG5IungnOKIRE6k0bhnppA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUH0io+d;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3BD606A323
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A3BD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUH0io+d
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36d1b3b9974so217239eec.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340369; x=1794945169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WV1W9nBfS3ldLXeMMEvma4A9q4C8mtYJggnjjv7e4es=;
        b=lUH0io+dIJkjL80OHBeuKDzqchC7AbmDLhSqgQ24PZTwwBvZVSDljr1Gk6w6sBlv+r
         z6E8eBSxdKpeSmSe4zz7QT2ba4CEHDv3Ew6q2+E5CW9BxmI8i28cGvkvFu2eSX0uEGiR
         K9bWyrgI/pnEFPGB+ziuvA4CEI3YGKfG6JhJRlXHRZ+hPNmaLMEmBHfEZqRlcw6gSM+R
         Ygiw7gYN9hg6VLk03KzzaB0HYc/PAliPad4kJNPBu5Sdjwyq1j68bTAcA20pnVD4gzFX
         0vHGphWMEw5Opw7ZrvS7q4DfabU5TDDyiiZ7jRbVo3PJE21w2gtn/EYfKg8okA8xdyUx
         zzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340369; x=1794945169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WV1W9nBfS3ldLXeMMEvma4A9q4C8mtYJggnjjv7e4es=;
        b=tkuTspjW5wIkGFfcITkeIvgYfGJOII+X45eI4iI5QUNCfFWWANcVUTdsb1+y12RpTD
         zSKy1LoZrblz4Uxnlg0iwQdX4X6ap/MkxIgscbywyaq/n+9RE2eyxAE4M2oBpFkbTKUJ
         ju0FllAcy4G20MsB2fUbYBmro2I+xvXRYjZJndAquy2b6tKQcfJzaS1lirRxoXLEamVS
         OaCGtIZpMW0oiJ0n/RmyCzCeRBb8oGkK/sG/owcDkkM5/Nc5sBsLbG0XrJqqG1YxC4A5
         Hr1EEczQBDdgTHGGkiwKy860xzQWcz0gRq1P8GCVbe341TDgm0SdWOSLvzwd5k1xQG2M
         BRwg==
X-Gm-Message-State: APuU4Z82xMK/bQM1YsCDkZGme9D0lfpz8rGh74AGV+9yEafD7B1GwWc7
	Wh2vlFkFtk2tFZ2GZSUi/qu6TXZybNAKyy4tK3F/Rm6b/JDkgd+67y5U
X-Gm-Gg: AYBFou359nNtOeLCV+hEdE9txCZej8JFfmfyqH/5+YQKB8ShTDsglk8weojDcEmZPK8
	wHGQ/ckXBHW6e1mw/qkgyMLglXuYvn1EEV1Qg2EvtWQW7CU03eZOrajlBD+1MWiBqEmid0jj1zt
	LVQ99E6NxvdkZWulBUF7coQpx7zFRiUj29Y5xV+qHgkbYjYFPptSExxJpXkgRpGdsvko0KEFStW
	WXxU0M/DCHTYhjIvwujZlcgqJE2BR6ORDbaaUM2qFGJq/1GExYJBypNUFDJRjfc31LhVXDFyht2
	vn0Gz+uEn7lwGPs26SJtdOr1waArxW7EF3UlxT1pcqubTfBmYWIRIOO3L+daPkliNxJHbWkQ4qf
	sVKUbu2oBxiskOoV1R1nAW5uKsqI7i5hJ7bsRMomTFe1QsB4vkYBA/Hc+G3dIGCB8v9u4/DkXa9
	yO6IQaexdu92LxO+vy7nLMPPGS9asL6ULmZhA3ts0RLpFE8loQX5JODHqTcArxSD1C52XgVis26
	bzKYD+VXBXLz4XKUjjJV0YSGZ7vjs3MF/ipTAv7MO6NWmmQmtQ4F1DwCHfaO9YXnem8TbzvgVQr
	z5xavGbQjf1AOcbOzgVsGawB3bERfDGHzTrYT/U=
X-Received: by 2002:a05:693c:20cd:20b0:375:f846:5b3f with SMTP id 5a478bee46e88-3767fe8f34bmr696317eec.0.1794340369276;
        Tue, 10 Nov 2026 11:52:49 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:52:48 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:31 +0530
Subject: [PATCH 1/7] dt-bindings: vendor-prefixes: add eets and newflow
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ti-omap-dts-fix-v1-1-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=1238;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Rt1rSWZjPfM2baFw8ge3SHaMBlN/XHq/0c9xsidb0yE=;
 b=6v4DY+409b2gCifH+22DH92JVjmI9DIm2x/tQgiJPVFXbnbXc8PIVuxrQH2i0KtZqNevRwJMy
 65XBxJLpJ4hCQF/vGwm7t8wMI02uMT5+FGlnsBiPmI9wxIpm1dMZzff
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Add vendor prefixes for EETS GmbH ("eets") and Newflow Ltd ("newflow").
These prefixes are needed to document the compatibles for the in-tree
AM335x PDU001 and AM335x NanoBone boards.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f10..447f1424bf9c8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -505,6 +505,8 @@ patternProperties:
     description: Emtop Embedded Solutions
   "^eeti,.*":
     description: eGalax_eMPIA Technology Inc
+  "^eets,.*":
+    description: EETS GmbH
   "^efinix,.*":
     description: Efinix, Inc.
   "^egnite,.*":
@@ -1198,6 +1200,8 @@ patternProperties:
     description: Shenzhen Netxeon Technology CO., LTD
   "^neweast,.*":
     description: Guangdong Neweast Optoelectronics CO., LTD
+  "^newflow,.*":
+    description: Newflow Ltd
   "^newhaven,.*":
     description: Newhaven Display International
   "^newvision,.*":

-- 
2.56.0


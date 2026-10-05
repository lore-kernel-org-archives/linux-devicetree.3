Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CF84E433F
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 20:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232109; cv=none; b=WXEUbvRIieNxCd5/KpLCgqZzShddfVtLTbXD1WhYVgKJBsWSYkfGZ5luuUYQNAYIV7g4tpnkuLw/gg7JIVVvm7U23WXXKzLpaO3BrpRqG4Jd7kQEeHSBsfWpWBuPqaaSxxmDDNal9vlMc06IFGEtE4HFZJ16f5LUsrAS4z4SQPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232109; c=relaxed/simple;
	bh=NZEhLjw5bMgmkKPM3eQxIzDQex+0YWm9iF8idBHlWBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EF7F10tH95ahts3uDhpkfkdr/sFO8TLabQ7nNQ1W026SbN+BS3cfpDjLpVQf46thlZBhRFtvlT2GeET6g0FL7ORpZIJUj63sxilQbx4JUZ4AnSEGx5CbVKlE6rt5vOluFVNvgWsCtYBX915l4ZrGiOUDwQvL4aCOjR/6GYoBoBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTipE9Pk; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTipE9Pk"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6af82ce3c83so3349980a12.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 13:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232096; x=1791836896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMBmc+FSRsvVu6rZt6CiLXXT+vdxKxbXygP51xvHLZQ=;
        b=VTipE9PkFBuucZ9lUSB2cuwca3vlxh8wUfbnubBX/6qYuh3jJyvHsBD/HXHfaSONCn
         spGZbuTOXebLkV5AfhMGXDq4Q1nYXY6X3UB42L1eZ6nkFlJVs2/BxMy4yff21jyimo9R
         qV9qvTqoYRvaBODo0g3zDFTBTznjZYeew72H3yIPQR25LxrpAUXtXLlSdXRybblSS35T
         uWJE0YevfMyYRRRn0+q1EBNzNMt0Zp0gkyS1Els/LKiCB9d9lCFGWX48T/b1Z4gQNtSB
         GOEBBwvY8Galdmd2oDGLbSchq5KwmI4iWtonGkeCWj8r/w4zY9LsDx0c2+dncNF1F7kY
         bSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232096; x=1791836896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMBmc+FSRsvVu6rZt6CiLXXT+vdxKxbXygP51xvHLZQ=;
        b=TXotysenV+q+HscnXRpJaVFHthWicAv6AvPfXWijKcHLS8jFGINO09sGkOI+dQxuhu
         K6Jm/JtsiMn8kM6doaWRKp5oiHsQzkQzHJlJKQZmQXMcJ6WblpZKG+ZbmPTi86OvWwAj
         s83aholUASXH7YfB4U5Z6/afVZjcpPVLwXNSwsvY72Yj2NMECGW+zw3Y2GTh8uUyctNH
         0fSiItksnWXXk0WjhXanWZwcR7twqEAxZurZ4pVMwcgLmRe94h4z1CXg/yLQAGKCxGYn
         Vt0PkEI6kje70VyxXgiR5Qo+YcYWjDewszsRNYUfjlo+owD9r6DqXxuT1kMtqBLWuE7v
         hkrA==
X-Forwarded-Encrypted: i=1; AKwUvBzNzfC+QoBoCYdr3SXZrwOZMHKpmX+Q2rByosIGt0s+cguIi+bM9x6c4V/3+T2olD+770H8Sp4DERio@vger.kernel.org
X-Gm-Message-State: AFq9FYL66d4xrVjo7x3lCrBQrtplQcPMI3QqtGHxNlF0uGXx8VGJqa6w
	ACJM0ps8LGQ2/jMjH1GO6EqofqoJEUjwQf54SZeQGagDP1w0o68PsK0U
X-Gm-Gg: AYBFou3kgRQkoa29suISnD7S/d2WeGjuHbMM5Pvb2bILIjsahjpZnnSEia6mkSy1se5
	SfI86DNXpOljyhneFdu3iQ26wBYjM57KYM9mTq5E6aygOx5l8342vrVdzUQHyXySazLurxR18Ha
	WHGtMAURiFKrkJTwkYeqtRUQYRV3hkHNiBJMQj93kjl+znPGGfLMCr3GtW7qNK7GQGFcen/X0I0
	TTL5AWdP69QY8o5PTHVAOR7u89QFxemDsYnfn/wfDeyEjDgFEn12EeLv27iQ5I5XQxfddcFlIYX
	WQ9XhVhUExo5SiUsdggyHiLfrLF3IMAbjr65w9h/MxyC0wJIAVYbVTkYYPYoqbMLf4WVeC0co7H
	vBH1GpIPFvlHBaW8A6GGiVFwH5gqE7WlM6MgsUWZAErVwWn3L8hE1KcJG+lbeYOWrzSydo0NLd5
	qQrRNu/w7CMEU5timtpNPEejyWcV+BtVMyhdKZJUXAWUAmAM4a6D9rFkghd/oyQ+e3uQy3tLeN2
	1FUsHdBH2SIVenfnBN0/mL3uRKZm1I2
X-Received: by 2002:a05:6402:360e:b0:6ac:72dc:c3af with SMTP id 4fb4d7f45d1cf-6af9e373012mr9651907a12.38.1791232096315;
        Mon, 05 Oct 2026 13:28:16 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:14 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:25 +0100
Message-ID: <20261005202731.153971-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..ebe35f893f8c 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -82,6 +83,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun8i-v3-rtc
 
@@ -162,6 +164,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.52.0


Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238221F30A9
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226177; cv=none; b=OUJCspUMxyzlbWFZwwfl1osUK21aMs7lFGjzzPkVh9pvrzAH+MS5S5coPX87JvIJXe8Rsi99XsTr90OJz4jyTKsbMHiMIp0TKmwYEWl9HkQvj8CxaZ1UapYXE5yM76L4rYHPL4Q9yX5clGtb+Tx+mpjL1pmLdzlRTm1P4DjtoYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226177; c=relaxed/simple;
	bh=c8pB9/79+XYKtscBDwUyoyHe2iFW4MM6dHj/rUuEFC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H6xfll9YN1XgREnn/0EMPJOOlAM5FlxWJmVmJ2OyUQZicIeiyCQwbbCfUdYJCi3GGiuHAx0hZFMgDQvOXm1JMYIKpBNGuw9VqqlDqLBh02iPe21ZIElj9wv2GN+cOG91JwZFeRXeP/C4QAU9QgygY4eWg9VoPiO0FMkFo1yi+F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=WXPPZu7o; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="WXPPZu7o"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce98cb8165so5441155ad.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226173; x=1788830973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrWkqhCDRL28YaDgCKIDr3MwV/ILAwu/h+TdmEyaV8I=;
        b=WXPPZu7o2wmRtOgs3QOhDknZVd2upvzNq/O+SARoPASim1et1fOhCVJDcsVQGu/eRv
         otUaNKFMbCfi7pGQpFyUw4vqBGDJfHovt/Lu6/el35tiuZlQdiaKY9jQbULyYu89YZib
         fINsCkbLpYczcLct9RtCkRgA7UbCvpfal700b+eKKA8bVJUg+L9U2PLPdwVuGFuW70Cr
         5FVjBgZv2g1f2vJZ0KuywvX1EFlrhQmRX7dl07Yvo++82LCAyKl8fIzGxvyM5yVmcHYA
         h3X3KZ8tLOedCNfyylitdPLLwWbvM9/91T6mnWm9xwEtdAAXltW1HhDh8HPjPDu8w41s
         29+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226173; x=1788830973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrWkqhCDRL28YaDgCKIDr3MwV/ILAwu/h+TdmEyaV8I=;
        b=tUaa3p1BFsPLLRYJ/glmZmuDvWLBZLXeItvsD+YCoohP8mo8oBScMtXkzXOYXDPexZ
         PfWscDXh+ElUieMvd8d4UyMuZRwIFD6PrDjE1MvYXvwegRAsstIuF7Fgo0Nn99v3gfO0
         J+MO86bdnbPnAqOrmbuuf363ieExhCAAgYe7W+XGFXAvxeChe1/DiAj5KAfmaxZxdf9m
         IEb5xJSgExrwQyzhvB9n4wy7u82QzkPZb5Duc3zRWg3ZqNZ63YxO2f9YB9tRbA5N22fk
         SYd7hdd2D50kjyClPyB1Cy8eaa0uXa93JYv6Axd17UoWjtWC+u/dejmR/XiqADj1uUnF
         0bGw==
X-Gm-Message-State: AFuF++m4avouuZHqoo/B9sTp/nMSHLuvLJhlb7vh/2asoVFrkSAcmE47
	G1d0vo8D102ibsn8q9Aw+/YrdcyRr4xkCuRMolK5wK8ALX82BwYOQim945wfpix9T44=
X-Gm-Gg: AYBFou2VQtUCHKIVzq5xAokLMTBEUHc/nkW8ywZwTc3+5SAuhpGpaftS1A9A6XojMjS
	e2oaWgWBziT2dzz+5d/ZmcDCAgKvUk9qK2tvFhVVhBMbB3IGMJlt3iQ3txXf9p4DuL4NJHCOrC/
	Gb6s9lqBtEzzlS1fX41q3qCaPOMvkGe65tQHLn2b+FLXTbGgfx1AWvO2Y9nMTcGj77aZaIZflGi
	/9huqv8q/zNMo8wgv8M49n3xTXT0yzqMe3Z/1BFrEta13/xsmS8tZmDOFbNvFE6p86i4Xx0yiiC
	ff7xTbItIElnszMYUusvMi830Tzq9dMKhNb6EBqdDv+PDYbhImdbmdJv30na5acmkDa2TvlT4FO
	Z4nwRX6RqnahmwedRVnzG9VU/R8BdHZFw1QRqKkiOu+TJv6fE9Pc+hj2Yh2FQ1wIMnYxP8YSekB
	jkAkGg1cYirEivaPM68oImtU1a2QGrL7LfRYmEGFY8gcZoJ+b6/nhm5hQBM/Ly/zA=
X-Received: by 2002:a17:902:e747:b0:2d7:1b20:e98f with SMTP id d9443c01a7336-2d952687ef9mr19828275ad.2.1788226172799;
        Mon, 31 Aug 2026 18:29:32 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:32 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:25 -0700
Subject: [PATCH v7 07/10] of/overlay: don't create "//" paths for fragments
 targeting the root
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-7-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
In-Reply-To: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=1298;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=c8pB9/79+XYKtscBDwUyoyHe2iFW4MM6dHj/rUuEFC0=;
 b=CHdKOdNJTmjOFM1h9ye84tTbvlftg2IuaS9THOiluVGc7bm3lAnxJj4PH6CAymm5OmpoAaLA/
 7/D10xxlD9IB7kReP5j9yNWsuTFHV/R54It6ZncwaDyjUnbbXWH6G7B
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

dup_and_fixup_symbol_prop() rewrites a symbol value by replacing its
"/fragment/__overlay__" prefix with the fragment's target path. When
the fragment targets the root node the target path is "/" and the
result starts with "//", which __of_find_node_by_full_path() cannot
resolve: symbols pointing into such fragments silently stop
resolving.

Drop the target path when it is the root and the tail is non-empty. A
value naming the fragment root itself (empty tail) keeps the "/".

Fixes: d1651b03c2df ("of: overlay: add overlay symbols to live device tree")
Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 51241f16e87b..6f2d7872028a 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -256,6 +256,9 @@ static struct property *dup_and_fixup_symbol_prop(
 	if (!target_path)
 		return NULL;
 	target_path_len = strlen(target_path);
+	/* a root target renders as "/"; drop it to avoid "//" results */
+	if (target_path_len == 1 && target_path[0] == '/' && path_tail_len)
+		target_path_len = 0;
 
 	new_prop = kzalloc_obj(*new_prop);
 	if (!new_prop)

-- 
2.54.0


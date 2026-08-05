Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F76E46EF99
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961884; cv=none; b=IBjnYubZ8wjQhSugLjRoL7hWODp4ggMEQ6jc5BTIHM+e1/NYgG9OYVb/YaVYDbkFg1kppMgMfuciQ2Mco0+WHWGY25YsDv0jkibNmi2re4ZtPgLhGmFDlvLSKplK9ompbtahLgtFHECllZ9eBjTXC6Cx8iFTtnPO7KfepSW3cWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961884; c=relaxed/simple;
	bh=s8bjlOSsr5bX0LzXLOFz9o7IoNCJxpjSj7XFRKaOCXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fyeudo/ISJwjYqTvLrHSJoCtQUuNA3f9x/PByF54nvUTgHJroTqLIEEIS7pNBM5D+leIy9s2xX0JmbySEuTaRibD0Up9YWljVcYM1qlvNJSyLVLWhqEF8yTdK65GtvySBXCO0ykEysxwZN9vh+nk89l88b8OAd/jKj/fxylewek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=IiswPitx; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="IiswPitx"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so215490a91.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785961875; x=1786566675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9DwRuIawSSg67T12t5FthYSXOeUaCNo0SS15ivwagg=;
        b=IiswPitxu4AnNQCosuvUK1KVqnrvCuOnscd/448kJmWH9Q8X5+GsZ7Eg+J7TdKNhYE
         k21Q50WtA2aooSPPamwZcSFKXaXeqKgahjZPCoB4aJluw/Z4ky4XIcYcCejhK2euMlBd
         H7n2L8iYvTHJme5o66n+xeJucAAUcVyvCl93lUKtRkTSEhtxoSugfiiXAUK4Z9T8xCWi
         Ft/OfBtLCk6olPj7wrHH8Qwtg8cLy9vnAtMSU0g7HwPiPKacVSVUgrf/3vyx78RTauCB
         qnKzp7NW6oKd82jkZvhZykjWUGxkxnolnr1wnaP+z5FuJ8rsoSyBkBs2rvw8Ip6rK+ed
         FHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785961875; x=1786566675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9DwRuIawSSg67T12t5FthYSXOeUaCNo0SS15ivwagg=;
        b=HrQdVvNTfsrLPrslBXBktDoI1ceNeXrIqesqX/fpIS855xuy2HT4jFCdUNUWHc2aLM
         rTq/a0Dc8+kJ4kfQ5L3cMr9/h1HALbkM17QE9ibCHbi6KvewvU4gyQrm9q9oORCngnmp
         ZcQ4HN5jRTHxUjXtfBK8J6U7ooXYP+GHfiY1Be7FtZ0yC6jC3qj3ffq/vB22YpclxpPC
         l4WhWyWeDc6du6tK6T9dOUgw6vgqkm5EqJhHxwunlXOCqeEYd7yKtw7b1rN/JVyn1B/o
         EmDoHnovsImEgpQCpkMMUabVB8+AyeFvjBArTkUyNP95z/iRLFf0tjCT0j49iOzr2bxe
         KZ5w==
X-Gm-Message-State: AOJu0YzISxfI+Jm66+KIehpAJZ88815NENUlG7G7f6YCgaOb4q1OdxmB
	196oc35GtPxzoUl5KQHvTCjE7VpsX27AA5XmiRsJPrUy8FPLLyn/E+pQnfLVFtORieMWOnWvIIi
	zRFp2Kks=
X-Gm-Gg: AR+sD11AusnXZfh27ygv3wRPpc01PdakUlpl2LTvE58bUVWeoow+SNerD/+6Hus9OsJ
	dvo8KRrFISDh3RzIRCFGJdND6l09gvfVvY+dvJNTX2JDLWt7KzSxT7Vh8w0L/+TCrBJTx3u9eDZ
	iFXRFkt2agHNDOntQlP9KG2wrzjQz9eONebq5j+YQ0aTxE7ku7PHBukDXNwvMrrtBSrP4UbJXOB
	SIw/hNoro97T2RH8tL52foxrfGIOYA4+cX1kfU6gwgGt/FtXTXlELOwrwi8gL2l3c3uQxz/52sU
	6J23pDsSexc9wIjQkmYny26d4vDWG5t0pbuCAqLQdJMyYz25Sv2ON/WT0mHseeB4VYu5a3kkjiM
	+utXdDQcQTXz7iDjLt58urQvdpvJ1M+X64RT9E7BaZ0UM+wvB+GQEN320Ifgfhpp9KiaIeN5qPW
	3amkhRUETqHKyIzwgijMs3T0CmMIvhfW7y1Q5oKoWbnHVND4//FgcvegWd4tNfH5o=
X-Received: by 2002:a17:90b:1348:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39083b021a7mr892628a91.14.1785961875358;
        Wed, 05 Aug 2026 13:31:15 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm20694924c88.5.2026.08.05.13.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:31:14 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 05 Aug 2026 13:31:06 -0700
Subject: [PATCH v6 07/10] of/overlay: don't create "//" paths for fragments
 targeting the root
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-nh-of-alias-overlay-v6-7-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
In-Reply-To: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawn.guo@linaro.org>, 
 Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785961866; l=1298;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=s8bjlOSsr5bX0LzXLOFz9o7IoNCJxpjSj7XFRKaOCXM=;
 b=N61SjICd3qHdvPjNHn6WNFO12IA0zWpXffAUgUFETIXHwY3zRLEXCf44j1EWEoyvpYKmlXoFK
 G5Uk2WRzCO0DE8FBvmU/DESrCY+HZ38xmzdxb2MVTQLOLpioLG/bLYk
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
index 9b9f198a1d70..89a9fe6d6e78 100644
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


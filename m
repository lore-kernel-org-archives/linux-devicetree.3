Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7432F7EE4
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206963; cv=none; b=MfykdAOcNO/6eTKksKU8bR7EioLcpaS/ac2trPRC09RWrlhT1B1lA6UWClj8+sJqinnfDhJKV9+0nivv5jurB5TOLZ4mg0OQ/Z+j7cvMpFGA7OysZrJAJJPtuMT7k3WjRIZ9r4jSPYtBh5ucvXBC6gAvxu2zUTh8KkZswz0foL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206963; c=relaxed/simple;
	bh=ecX7vvzvXUD/N+RKjcW5yLA/Y13cFZUMxRQHQDuG8VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0xXgCXx+Dh3LZweeadfWqLBcPSYn+NS6p339fl+N7LdKzp4oIgn6kNCEDGr9pjiEhqs7g3IzX3MPlcY9Ye3q7rQKzFcG/ikudx95yeDCUA6HL944F4O7pLLniHQC7fb8r3bu2pVnva054eIsWQJztQtr7hl5SaeyzGHBknwCWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7fM6Lbo; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7fM6Lbo"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ef8255cccso34761327b3.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206960; x=1785811760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJiZXFpLnQ5pvNr1ABpUZxXJqDyWZjVowkdMMOv9maw=;
        b=c7fM6LboGUDKgnynFpONaAIfK4qIFtaXaPeNOaLl+LvFuhQ4A9zLcLBA6xEZb1BLm9
         qCYhc2mktNMAMVF33tix3rGxM63WVerwFgTjWjMxOIX7jqzPX479hwIuy9LHXB/YHhBo
         njVlsZh+Rsv4JuwAj+HyKIzLTEs924jice9Z2s2xjyF6yZfsSbiOyiS2b/WNfnfkbMrb
         Fz3u5PE0TWxX7Oo36Zy8pzXYv2zpP4Mk1q/thNpEVFfppotMIiCUbpSeYsnFNMO6q/Bx
         7JBnMfyrPQG69DtmTXwC5bOFrVPyQChMCngSiLtDWu64OxaoupP9cjBn82nMFQg6QfNd
         8LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206960; x=1785811760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJiZXFpLnQ5pvNr1ABpUZxXJqDyWZjVowkdMMOv9maw=;
        b=nJkKE2b1TMsv7cFaITjFwreHNZWqo6P9SEFmyGhJeHY0rUmPbvaZu9BOgKHnAzsc7x
         ymJOZRDuSy8wgJ7PQK7i7WYPASlNvRweQ4kqDUkmdcaWpjZgYJPKjEZ8qSozX42IWpbk
         x1ode+o1a8Lv8fJ5s0IXi861qN2dON4VN8u6Hz4UNHVC2kVqZft6+ZFzPlR7ng+nszvy
         Y9EL36aWWl0B5BQ1qGXinOLcc2TeKPjO9Cm2YrogxfiFQBb9TxSK+XD+b5Th8Rgeovna
         5jO91oFRVRCymdcqH8rk2Y3b2EfDfgUyNuS903okdEyGrFm/hqtw4I4ZXges+6Wc0C0N
         vmKA==
X-Forwarded-Encrypted: i=1; AHgh+RoHagL+Uq6MPCvjGx2qXWo43iyEBsCOJxuXQjCXx15coEDzff4Wp2YElU+oxpVEwaG55E+5zXhkqhLu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6M/EifqAr8dUvw6k35wLqMjXEwUUelephYVG1r1WHrbXX2BBK
	GLKf4OviCJz0KIAHzgur/mSnprhwxKXuKmjcAuvlZOWZ93VZMDqFFrRnJWZ+uuh5
X-Gm-Gg: AR+sD10LowLO/AIng63lJCv6QZBFM0rilTVCHe9hChVtzdZYmqVnFbvyqUIbNloF+Xy
	g7cH5O0TSIOYg47u8/i5UMnBqAr5zdr+8/QHcUEG8R+Ja0dkJe9ocS2GVJfuQu3+Q8kWoIWp3X6
	nWBOCr2vKafmOU0fSOogNt0eHOQAkAVHbkC2km2UUpcRWoq/MbPcq9nBWCew0GPqF7gaGKH6zf3
	/HVsS5/rZcXrRbWw1w5rvYSJdLcT0m/oYXO8xjSSXASMsIAQkAtBh9AvvDMTP5V1m7Ks8sSVPIX
	2z0Nel65kfLDdhXF36DyoQll7v6L4sV7zqaGWbeqqClF4DZEr7V6OxhM1xS7kX19o4ssLBl70pK
	Op+9uO1oacqlc4mcpQcNSEOcS25w4xp/iEuCBPQtgoKkwJH0uAs3HNE2RfrFoh9wNQu0199GOVz
	aIv3waoY4GvTglrrRnRqV962mp7e5/Yz9ExRqV
X-Received: by 2002:a05:690c:350a:b0:7ff:1a93:be35 with SMTP id 00721157ae682-81f99106fd3mr1842047b3.16.1785206960474;
        Mon, 27 Jul 2026 19:49:20 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:20 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Mon, 27 Jul 2026 22:49:13 -0400
Message-ID: <20260728024916.993224-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
The reset defaults match the fixed behaviour of the older IP, so the
device works fine when driven as an A31 CIR receiver.

Add the A523 compatible, with allwinner,sun6i-a31-ir as the fallback.

While at it, merge the standalone compatible entries into a single
enum.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..18b28feacf83 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -16,9 +16,10 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: allwinner,sun4i-a10-ir
-      - const: allwinner,sun5i-a13-ir
-      - const: allwinner,sun6i-a31-ir
+      - enum:
+          - allwinner,sun4i-a10-ir
+          - allwinner,sun5i-a13-ir
+          - allwinner,sun6i-a31-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
@@ -27,6 +28,7 @@ properties:
               - allwinner,sun50i-a64-ir
               - allwinner,sun50i-h6-ir
               - allwinner,sun50i-h616-ir
+              - allwinner,sun55i-a523-ir
           - const: allwinner,sun6i-a31-ir
 
   reg:
-- 
2.54.0


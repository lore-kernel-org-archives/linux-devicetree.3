Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8CC38B12A
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028882; cv=none; b=aRDvdEUOvSEl9XxKHt4jMqC67MEj+Tpwc179SieJbcYlAwiIG4DuH4uJx91xygrFAh+1Be3dg+dc6JjU5CasxRUrrbDlZCT43grSYS2hpxsUWUac92srZeZBubK31mPhQ5Vgs7DLBxc59L4s2ThVN2i/k9wA8DBEVgtXhQFrT9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028882; c=relaxed/simple;
	bh=zjILW9Q86QgNkyAX/V+hLv/MYkNtg71tImXI0XhySLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=syhMS0NfwEYXytYCzZax8b47knbCWglYvvuT0AjSdzFuC6yltLieCIMH4cpkDYO2dN5C2aa0EnLTBtdHIg8VmJEivMcz1KVFbp9CGYXOud4X+2VLQo+22Yp69yiDNJi8oT/4YZRI+1k8ClqRCDg/4Znpfsdv8YSxVouYRxiKS9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXuQQhsj; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXuQQhsj"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6649ffb1d01so3410955d50.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 14:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028880; x=1783633680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hvq8f3W/S8SM2hfryHlRDSpp/ikQu+f+Y5+keswTDg=;
        b=LXuQQhsjCx2PbMasBU7AxzjLY69mdpunZLg71sNUY9pl6dVBSiJZQuydUl/jWhpoHc
         hXBXE6tXNyh9wCe0rMUyk1a8z4/ExQ3adGDL0YsHfcqA5AilJO7ybiy/8ufZqpjeYTVw
         xrulDX/mEpvPOeA3JraXeeeFZT/ajH73ewW4y5Rf7oAu/fbNAM32gwKuwGV387LKaWzJ
         OP0AiWsp1NxRYcAiXOdegZ7Sbdi0U+l+qcDgCUtdaIScEZzcOEhuKUZqXkyUr6Mha8uR
         IkVg0Nj1cs7D0UTa76V4SY2Ftjf5HrEY58c4qgj483gwCrGXNd0HCPSlUwfcBwMn8hjT
         q1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028880; x=1783633680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hvq8f3W/S8SM2hfryHlRDSpp/ikQu+f+Y5+keswTDg=;
        b=IZ2zIYwQ6sq/+QjUyXfB5iV2fVyUmBMp/8+gu3dh6Vpj73uUa+zqn7Verm6FOSIxdw
         QYQ55s8TxfpKiBGRbU4GePiIsIRvtxAkzELjlLPgIt5NEFLJboKBzHhrWKDI+qVgvxI0
         x1RykSBTfHWagrPRQP/wQZgbiM/QwtNyolD7Uv11A2FHjLYyVA2WCvW25ZUNLTyrxTJE
         756+lMcrs9cd0aQWm0999AsFEEWd07C+CclUfahpz2LWlUGlLRwlhfOTLQAM9hwbkT0Y
         h8LdsdA5rYXt3TXTuEyLt+7OcIyYdpaJMt2E8+rStVsA2KnwaZV3lJ9O0nU24HBVc7jd
         50bg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5nfJG22mQR+hbqkxsttdZo2hUp4ETUKmPmGaTQ1fotxcs6BqaOVK3dMMHjh61wdR3PloXiWSxGEuG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv8nnVHWomw3Z1LumAo8MoWDucxEld533VZlXtq0UOiJVnumgu
	7AS2GH7TYcHoIr6TIWQBOeDUhf1iCY068VjyvpXIXDhugeDHb/fN67Go
X-Gm-Gg: AfdE7ckhQX8x3+Vb4IMD6mpRb3AcmGa2/F10EQfX8ewCJR1K+v9r6v8A25mRAiA85C5
	g962EV1dq9Q540a3Rjo+0jS6UYcmv2Q50RTkZBWBZ5ykD2UQZQr//WJSosqDbUwDznLBtFd7yZ+
	xFgcVRu/kiXkJpe2ViUlfV6ymO4Wfs60OPHvr6h2D8D6VdSw8Sgn6FXE7S3EdoVkBri83RTA25I
	btdj7ZAh8gEMjT+OZC9LFLxKf9kUGTbKKHkfZ5WdsYwE348V/ecp+5pde+fduJuH9bZRo0Ibv0w
	1Tc5FS64ZBVFPlZH0DWHF+ZWf5WNBkxszJyiriRYVwdiJAhjQuOOmCaExhxlinIdniOgMZGGVdA
	1LKc4Jpb0J1ByO64XJmjYhAXJisrqNgzQmSxIt5ettns5IFoVEaSnjaSKyMcNPeTbXbsFu0RlVU
	6qOVb3buRmrmhXC4cumndXKy2i8FmZhJpAWA32I5kjiffNLyg=
X-Received: by 2002:a05:690e:4397:b0:664:ae67:b674 with SMTP id 956f58d0204a3-66521bca8b7mr5877472d50.80.1783028879729;
        Thu, 02 Jul 2026 14:47:59 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:47:59 -0700 (PDT)
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
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Thu,  2 Jul 2026 17:47:47 -0400
Message-ID: <20260702214750.3428694-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
It is not backwards-compatible with the A31 programming model: the
control register has a pulse capture mode field (bits [7:6]) that
resets to a value which captures no pulses at all, and the sample
clock divider is now selectable via SPLCFG bits [1:0] instead of
being fixed at the old module clock / 64.

Since a kernel driving it as an A31 CIR receives nothing, add the
compatible as a standalone entry rather than under the
allwinner,sun6i-a31-ir fallback.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..06656058ce91 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -19,6 +19,7 @@ properties:
       - const: allwinner,sun4i-a10-ir
       - const: allwinner,sun5i-a13-ir
       - const: allwinner,sun6i-a31-ir
+      - const: allwinner,sun55i-a523-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
-- 
2.54.0


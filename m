Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9698C381AFC
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 03:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777086621; cv=none; b=SvMp4/BM/rV5L5fdEuC5qTTfz9XuwAD6qKJsZIVseeVn6VFJaU94BNELFf9g1beIbXvp9W1VKvx2/nKj4VWbN3OHExvJM6IyBziR0JaovK1iUqg+1iTOoOzwowxjkww14wEeNX9258inxQ8VH//rNtq0thFcwNqdOQHEA7qnZzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777086621; c=relaxed/simple;
	bh=1WsG6mh8eYnU72x2+Ftk+KtUKjYU1qgLq17JrvXvq/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpMlvSkdn2GDdx3CUGChbhIvDbcQpm5fxBvRjpXwg90B/y+IQj4c6LVYo1AgF0Nn9/Li7TjEzrf5v4K+nfWRjiMQ5zks/ofqTz4bJGuJANNqi6wUBd8al/Wn04hzmbk53rGn/uohyWayaJ/UQl+hdw9osvp6/25e/hgevL2nFDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=fK3nH2o0; arc=none smtp.client-ip=74.125.82.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="fK3nH2o0"
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-2d96243c91fso13406652eec.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 20:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777086620; x=1777691420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzwyg+Q8PpdccnVWRF49NDrMOdX2e/qspSUaU1qJfGA=;
        b=fK3nH2o0QPKaAPy1M9vJf8bcDhSeUVcQP/uP0rd+3kiOb/GW1Fu+f6dr1efT0YTKoY
         OT61fvz1hcbrrqEJfF389l1gL6lPrmQF8/hgZ8/CvBDbyaMSGlZ/5OgNlc1Qsk2LyFxY
         Wkxf/6eHQ+b3pYUCODqMSlHwBMPcdodfN3HEx2ecmuRnFWVfVVJ2ewXFJ989eX/4pYTM
         SXB3J8prRYKhBfjukfRjU5ObpDfuW/R0Gi7LsIA7h95c4bpBXF+14NxVRMWYvWd0GGKe
         q5qHvXoUB1v5ui2pEnHAKJrB/eVc9J9Xm+F4BH3nQJfaKgODCvMELx0VJP+lU4Du7m/9
         LvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777086620; x=1777691420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hzwyg+Q8PpdccnVWRF49NDrMOdX2e/qspSUaU1qJfGA=;
        b=p4o9PIdPlGjpRAZ9Q/mT1Ty8tY3JokrrjT7Dw5NswLeXp2pes2eWH3dUJ8t7hxpTbx
         VohptkwuZ6n0sHTyVnDli/0IvQ+NbnRG3MeJn8zxZb2AtsDrMqBxvgFiU8zzhc8uecOi
         OyX9i4PrwswrJWtx4cl/o27Lrl6KHiFRp1f23j8tqb1TIhyz5UXIEFRlx8pBmYZIZlqQ
         FvIDJ8bLvpZsnr/jVRdCPyEZkvDsz9/DgQf6q8wk1NOn1Ih8wYPho9kn9tAcN5EaOQiW
         /HF84EXwcN2XrOda3IyixTMG3yie1Chjm1ha2JsYzcZSOg972fgW23Y180grby1czw/6
         LzSw==
X-Forwarded-Encrypted: i=1; AFNElJ+sZ8Ktd179s4+qMiMolFh2QmmLDQDduuCfkYDUBCWwADmbjFTe4ubNyix+kP9VDM+g0wMMedkggSww@vger.kernel.org
X-Gm-Message-State: AOJu0YxoxSevUgnpanATXJih86Dv2ojWKr+XrfVN/jUHC/sx2WOJAai1
	eZ8M0u58uZ3e3xcYMKnh87KCGX8UX2z93rv0rpNka4bUF//CSh92caFwE/LLBVUtnWZmvGqpO7l
	1IKYdJy8Dhwo7qxlLdyLhTkE+yUM1L7quAaGK
X-Gm-Gg: AeBDievwGemqRwpXPKqp187kXqY7lhJ7mGzUthN1U+AY3eVurx0LeWIS51cUr5nocxY
	449yuRjaI0y0cwGlRDRmt9oba5yfFoQjNnnKQAGUbJXLGEzOyOqSRfQUOzPwVigtO9eRIaini6u
	r9gcgISk920SdKIib+POLIzFx0DyNaa0f4aSwbW4+lbC7ZkACD5bH2DEIln134LfFuuTXBrzC1X
	a5h7q4fjLnS5i8rb4L1Hho8NypAOTplMTuBt+JlsV71B0bCg0A2SM0RVVxYtzZ6wuL47jxVuDTT
	8BqimDc3vjA3EdY9sxfltQFm5tvV3BS55IQzqVoFWtBtwZZkbo58XCJ/WwzVQ2WO6gH2hP87pbS
	SXNYo7f26yUeEaoMNqdXdv+RMtusf5V7AcYJ0aXL6ABoEbuScQqjoMAM=
X-Received: by 2002:a05:7301:3808:b0:2d8:7302:d21 with SMTP id 5a478bee46e88-2e479724538mr19046348eec.16.1777086619649;
        Fri, 24 Apr 2026 20:10:19 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2e53a3ae691sm1728646eec.11.2026.04.24.20.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 20:10:19 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 2/6] dt-bindings: display: bridge: simple: document the Lontium LT8711UXD DP-to-HDMI bridge
Date: Fri, 24 Apr 2026 22:10:07 -0500
Message-ID: <20260425031011.2529364-3-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425031011.2529364-1-dennis@ausil.us>
References: <20260425031011.2529364-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
to HDMI2.0 converter, designed to connect a USB Type-C source or
a DP1.4 source to an HDMI2.0 sink.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index e6808419f625..752c736c8f85 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -30,6 +30,7 @@ properties:
           - algoltek,ag6311
           - asl-tek,cs5263
           - dumb-vga-dac
+          - lontium,lt8711uxd
           - parade,ps185hdm
           - radxa,ra620
           - realtek,rtd2171
-- 
2.53.0


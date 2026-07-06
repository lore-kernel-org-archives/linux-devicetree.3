Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E203DA7DF
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367984; cv=none; b=lDLyFNeG3XaXgTDTS7O50dYsekRWaTJbu84Nmsm1xlR+EmQKwHAxmwabzjoAdn59M3Uu+16wEaqf+O+XT6/OHV0s9yE9ZwpkAZDLTA2oWHZA8eJ3RovUJ2Kq3+tzeTwMjs0c8G0gZgJWz7ybCZxBh+Nw6dXqwtA4MjWQKWeOcv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367984; c=relaxed/simple;
	bh=OVH51qzEIe3wtI9H12QfejWrtlsvqUxmDKvM531GD9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcD67CSalScMQrcujuxcupUzzirPHLy2nCyOnSbQT56vzeIC0qZK4VnMmOT4/ByCtMnwtLbeM/a6OomZ9Ie+qyw2im6Z/bw3WtaJ64G/mnUI1N3yL7mP6jwnEtj7c9v61gcip5Ow4VX2vOwirpGi4d7N+Ntajh80IgKFml53TCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aD5mxmbU; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aD5mxmbU"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso2560953a34.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367978; x=1783972778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUPjVrLwJsJVzn4Q29xfovXMjcBST4SjV69WBu8CmHY=;
        b=aD5mxmbUYhYVJjyHxbEaaox5A3OJCb8HRv1eZhb46GBGIW24pVf59a2LEFvzG+WEmg
         SmnbfA2f/rXQbx3tLcRJ60ZbhJtq56d71QrkSJqnUSIj48cHaqjcyXqqOgKNmgtmh4+q
         dx8wd0lbNto5ZLrBH75SW8S4fvGTKmXPyK75s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367978; x=1783972778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uUPjVrLwJsJVzn4Q29xfovXMjcBST4SjV69WBu8CmHY=;
        b=pongnpHCc9YRL80kQGl7m63gr1BYIj35lfHeRrA4N6hrQdu/B28GmOFrKe0XAE8bfd
         nGnKsPfKHKXIsPnCNNmKtpQrlLuHThNKDeWZh3jhzezsu3/c46acf6Y/7KGbgMLTHMSC
         Ol4KOxxPbFQuf0Sbpf3ShU9UqExvfCcWc6/TnvLe0Uvdho1cZeVmUZ7Z5berqpnQO4Hf
         DfJ80SFlg+4Tuz2dVzqSUEuF3EU3DPLYl0UcKcWwtvwUi1K08yy73vIYSYYKvzu5T6gd
         TtMKphlfClLNwwKMN4IMnmpp4JCT4dSBzVDVdONtgR2tIFV7KXf76g4xF6O+ZjnzQ2jb
         P4/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/sHzhUO+ksfC27icytmNGvV9deECHWaI4aUFJUXJrfA1y8B+z6Y9zb8cP474D/XyUizZJsMROGDG9S@vger.kernel.org
X-Gm-Message-State: AOJu0YwhE4Qqv45NbjpFjEQKDD2O5aEyxc2fV02TsqGJUhQaGJxlBVsa
	p2uHrsov6K1yjaBgmjhTPQFR/PYCuUwqGFrNIJUbjWIV2W5GE8sCEg0ZU0EAmnzqyw==
X-Gm-Gg: AfdE7ckSTV0jsGSM0uH0+k31c8olZwnA83GIjzpUi0CjVCmVuA18TvYA0OQP0qbhyUj
	6F2Q+cPt2ftoxyNf/wQt4G2tCNpjJWjdQfU9n/9tIDxXWLSW63SGEAIK27AMxzy00W+wuV/NKci
	OQ5ElWKfwpIn97JQCIXsXxCATxCxNhhW0jWfZjufvY7G+C/ybUbwa4Gw5FBnNcKYt1n4IbJlUsX
	c/0o2Mz1trdjHVyuns/BuYCPVxzthFmPIMSjj8rq6lA+lY3Kdnba8iDqAImaxxJmfGkelIBu42/
	aasEw3LoLBUK3TCcIQxB7oQqo2/9xpf9ap1Wgxxn6YhbSzs0FXxTRTtZOzPAvXRgLQ2bOkJEIWA
	2+8aWMHmLnoD5YDi5olu/GyU2zKFP89IFm4843ahi/6951RA7yfKqM54vH5wcAUvZUpJQ3aU8Ns
	LGFRlzyo8=
X-Received: by 2002:a05:6830:82e8:b0:7d7:58b0:7685 with SMTP id 46e09a7af769-7ebb22cee36mr1427105a34.13.1783367977773;
        Mon, 06 Jul 2026 12:59:37 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:37 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] dt-bindings: arm: rockchip: Add Luckfox Pico Mini B
Date: Mon,  6 Jul 2026 13:58:07 -0600
Message-ID: <20260706195818.3906949-12-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the Luckfox Pico Mini B, a small board using
the Rockchip RV1103 with 64MB of in-package DDR2 and a 128MB SPI NAND.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..711029ee78af 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -813,6 +813,11 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: Luckfox Pico Mini B
+        items:
+          - const: luckfox,pico-mini-b
+          - const: rockchip,rv1103
+
       - description: Onion Omega4 Evaluation board
         items:
           - const: onion,omega4-evb
-- 
2.43.0


Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A6C332610
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007277; cv=none; b=Cz4tJga1z6WCq98LBQJglQIFZiyNZg9uQAzrQyS/E9MjIlNFGAd/3eBYmG5UnekS299veoTIpdnK7qm69NsOdev8G3rg05gylAHVcm1GiSZtYqlf2KAQacYHXyizEJfP9vxgy2S32sZmNIlFGtYipTrSMeFCOM6cSLSEBmN9PAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007277; c=relaxed/simple;
	bh=ucxiE01hSKZsuQq0IwQ+Bm9/3gvFxV+2j4LRrSjRiAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sY1p1K7lntxDpyuIrRk3l3e61thEmU58fKN8EMmpnW0c3CmdxhphdN6MY8+hu6m+n3laURZknUJ/NysPqL0ixwPrhK88QGkFlg1haY2Pr7TNAphrMqg2o++wuCJZxOW98qFpXM37sCApCnhN1aT8kFRgYh8dsbrzECvKOC4AUlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVjzK3iP; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVjzK3iP"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso2630791a12.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784007275; x=1784612075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDpSrlAQ9FmGRYSN7+/NziOaZpQDg6U0Jmn6QAw/EK4=;
        b=eVjzK3iPmS898lGX5ImIMP3sJMeCHZDXVPNKkTfE8WC5kmRz7vM27jNTFg75J+agTx
         X77wyee39FFIJCJpYGTLkuIuv5gmqtV38SQG3eROYu9T8jQcuDyCONGdS6qk4xXvfemV
         jFU4WjDRfPGpOKgU9FXxZ6y/Z3V18hTjNwOo8OLQl8AmrgUToh79nVyvsBf6ZZUFEa2S
         xgAb0o8YyifMtK1jGP/urSuE3JvcsnjzW9JrPhInf4DJtAytcVwn2DuR8E541b8RpyRi
         gPsg6glgCTgJxOPeMVV3EUpJgK40gxuXzYwBy3qMSWseMx20EBbUZO/os3+k0JZCslt4
         ybpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007275; x=1784612075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDpSrlAQ9FmGRYSN7+/NziOaZpQDg6U0Jmn6QAw/EK4=;
        b=TgDlGQqHGhTz0ha6c1WPcDNK5pZITIucUSK1yap5Oe4ilGHXR9TZ/UwUjwtDgKx95R
         doqjLmA7lh6bMACU7i4AY6E36hsvS5zwmkYra/RWG5HCF12CbBg/T8uFqWZVL95KqL11
         DM/fz/hG263IokVZJ4C/T7YLSWzeXVl/NEvUM1SZWUsG5YEfZF7GmYrn8Nipc+gLGKRM
         40aA3mNiOTYXXdnFK7YxwCEfa/M+qqHub/RO7OsxVaWQnJetBewMLmewgttJaTdFfa3k
         IW7x9Lp4Fe2ViEInXtbvJ0cFPyLntDVx6pN6gJ9cAUrf0HX37l68Ky5NfJJscS6p0jMU
         gYVw==
X-Forwarded-Encrypted: i=1; AHgh+RpcBxYQNb/mcQZYD2+Iozfoh5GGGKRAGgqM4vsyy+WCmYcioiInwINDSRtHG24QM3IvacGOlr6wEDE+@vger.kernel.org
X-Gm-Message-State: AOJu0YyEE9A4LIzxIz02CGqKelkQK2FGi7dLxYK6xZoyFpqgkz45hQm0
	vVeZGiLoWpUZ56eq1ocqzv6qAUtTz+dHe5NlcqaV64N0O7RsKaT/hrWm
X-Gm-Gg: AfdE7ckTtsI52SGzvbx2ErPlwF/B5Zbu0EUY7SZVEViLec2VN51wVpE3TvjcvD3adz4
	qo2RqmeX/6W4oXKCJt2Q1oxw8kXO//rfEgmipk9bY0hs9IvN7P2720tWRvUpYinM3fSC5Hen69z
	pe3AssS0WwEtK3gavBjiw5HG73uqWcMjDLgOYRndhQfiIQLlQ3q/dkFVf/24eL4dPZpfq/Lpfqf
	QxLEnYnMz1g84lpH/nmH2/WlxsWrLr5OMVd0WGQd4JvInAjhoqZw65rJUlfSmC+ZeIxV3MokJ12
	sSt1Bdj51U0IOq7QtOQIm1rbAAM0SoYTa76dvYjIhe6qedLvr82mtX67fAIEksM6zoKemYQgn6b
	XSiCbZMdgHcyVqZ0kTodMs7hzZaZ/fjGsGg+l06Gq2At2IA+Y1Dmk8VuzvdOA1VNW7ZZ4eD6PfW
	y8v1sQFrs3eAnPe1y9bJ3W
X-Received: by 2002:a05:6a21:3992:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c110157a21mr13059658637.16.1784007275323;
        Mon, 13 Jul 2026 22:34:35 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm33047165c88.6.2026.07.13.22.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:34:34 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Tue, 14 Jul 2026 11:04:18 +0530
Message-ID: <20260714053419.265523-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714053419.265523-1-hrushirajg23@gmail.com>
References: <20260714053419.265523-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b023d4cc9842 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon
+        items:
+          - const: vicharak,axon
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


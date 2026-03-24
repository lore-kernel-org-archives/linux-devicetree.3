Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790BD3F0A9A
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352630; cv=none; b=ZzWYSh7dGhJj1L9pkkuwdUdi1l+TS4mlFTwcxv9wV7G4L6Kjt3V+yLGNDFmY2TAYKqdJpg0RkWVWbCtWXXyf9GjkGlz6YyNSxIRY+hVBdNWQ1y067q5SIpQMqXCI5lshiJ0J14+DbwA1RLQaLQd9MItu8oLESg0mpz3V8e7s4+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352630; c=relaxed/simple;
	bh=WCsOz191eih0MXZ0OznFJ4IlSh5CQa4XbzsA9hxPo7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f2sUvpWW1v5mAXuhJtkvY8NJwLdGKjC83nK4hnRaJlhqBrpEXa5NLgtwBls7E6PTvozL/tEyyB5CW+OfAQOc15dcDgZqcUpkWf0UJ3Xl/Xaj1usMOdY6tuNqBFXPwDkuBfYhyXssDzimR/velProEB9QUrFu2LCD3JRRvOCqIlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH7zYCdl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH7zYCdl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so39670345e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352623; x=1774957423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNXpm+EocPv/pt5Oe0CQXzjdsdk5Us4vsSky/67Xf6w=;
        b=NH7zYCdlHsaE1baao25TcMDKmlAaUhHZlWV8SLly0LLaKintP+/vkT87LW1OOWHWrp
         uxTxYlTWELYPVWTLNhNl/ogul7yeV+1dbVWK+X2A9Qw9dZHI/z6zWrUzZt/W7jdtMbuD
         e2HI6jK26owEx5ckGZ3JPHiwPhL+MdvfDItRNXi0Z0l+iS8W/3u1wpSmcOtPCbHyGpIP
         SD/ys9Jzg2HIY5x/yMen0TllMRo8eqjhKFlmqBZeJ0Do/Lx2OYqiJ06sG89p9LEgpnq7
         S2/cxYwreaW5jTv5JrcslGsVymWGngUr7Js34HvXlh/xNh7vxe5qQ6WIHTr8YI9bqSlY
         THig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352623; x=1774957423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lNXpm+EocPv/pt5Oe0CQXzjdsdk5Us4vsSky/67Xf6w=;
        b=RuJuxTvKH1SKnPd9cFOqHfc6G5BmZXDTIBaNvpJwLixNj7ZTMsf4aIS2APZTiTV28M
         7+gYdedKJdpEHjdEXk6HYAtls5ThTli3RnKAMk2tMPI6t12+FJkHFJaBWk3G0U9eGq6L
         rrS6cNpnUo3ZI7srIzOvDxy9Whzh7HzU4F0eiHXf0ssBad1dK+jaDNkx7HQp/YkAaoAX
         uKMSh/zfV1p6TRF//+qb1IW0ofvVM9aMRdh60GkHfzCVZTE97CV6qfhOEb31BOxbLU94
         3zVZFWrnwaBpMvZlfOLanqN+0Cu+41OpwSkuepEBvZCIDk9ym2yFxEeDAAUT1aTNLlzx
         QLpw==
X-Forwarded-Encrypted: i=1; AJvYcCWZNBps9OMweAIj3PBUDCMY56LERXb/wsF5khVjpUFZ8T74HuWf5DNbRYMVKKs8ngNWrs4HFGE6IK68@vger.kernel.org
X-Gm-Message-State: AOJu0Yypaja5I+Z10s9JIeXtBrXnshlQEJT9x+gwrtHzs9Jq45SdTD5C
	Jq6H8kCH07zpSbLeVqQzNWOonQnpnAQ4QPZjWbbogD33nH04AoEPg62e
X-Gm-Gg: ATEYQzw38CUAF2p2DtYwehRPRKE/8qfl7br2BvyKd3mJbNV08s9iwTgeHofiKoK/HYa
	5PusyT1Qh8eQxqrW9mvw9Ol90pywvDwJfN+mSKBf1H6qy/YeG/sXhVbHQCzrp6sk27PUTH96Isu
	Xw/3a+QQlxGUCU2dd42QjKSX2o0oR14xaeHsdY424tyORRTsK0bx8Ebafge/q8jFqj7nxnr8Ctr
	DHgwqPVowyMWIg79rLdYM7SP6faqRecjN5uL8ATTLahnidE4mDkpbVaTPiCmH0VNvZdBiRcI5Oa
	yb1joAA1M81QGn78MnhXTDbeCxP1/OdissB8D2bjbpFTSOQpgWzXimyiYaRQPi9Nw0hmjouQ1dX
	H+XgRanF+gRQAtdS0SF01WG/jiPalpJLka9Gl18B8x8JHUixZwcTfe9dYS2q8+3286mfPP5+u/Q
	Rj6pzOCJU1odnUyedknJ94CWDZQseZTA9LHvPAgOY4DdXvVcu6
X-Received: by 2002:a05:600c:c173:b0:485:5981:1411 with SMTP id 5b1f17b1804b1-486fee1a26bmr200847485e9.23.1774352622882;
        Tue, 24 Mar 2026 04:43:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:42 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 10/11] arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
Date: Tue, 24 Mar 2026 11:43:15 +0000
Message-ID: <20260324114329.268249-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The SMARC2 board DTSI is common to multiple SoCs. Move the USB3 nodes to
the board DTS, as some SoCs (e.g. RZ/G3{S,L}) do not support USB3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No change
v6->v7:
 * No change
v5->v6:
 * No change
v4->v5:
 * No change
v3->v4:
 * Updated commit description
 * Collected the tag
v2->v3:
 * No change
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 ++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    | 8 --------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 30ffd458f188..9d16c3117cb9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -264,7 +264,13 @@ &sdhi1 {
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
 
+&usb3_phy {
+	status = "okay";
+};
+
 &xhci {
 	pinctrl-0 = <&usb3_pins>;
 	pinctrl-names = "default";
+
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index b607b5d6c259..69c0101ff7f5 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -107,11 +107,3 @@ &sdhi1 {
 
 	status = "okay";
 };
-
-&usb3_phy {
-	status = "okay";
-};
-
-&xhci {
-	status = "okay";
-};
-- 
2.43.0


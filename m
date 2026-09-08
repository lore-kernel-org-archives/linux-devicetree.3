Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C817598BFC
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889471; cv=none; b=PXqZcVI4Z02KyEaxwrge1i84B+n5c/ve9aeZ0OKrCuTcw4ETInqqRESDQzI+pbPjp/bKULP0a9rm7ZdpQU/EJOg+xGQ9nsc4CKN8rjghI5cJIaVaNuY3pCVzWcIAF2f2ibgGa/blmfnHEPnVF6gzOVxE2JSe1mJWFU/4kNUvWPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889471; c=relaxed/simple;
	bh=lpSyEnjJKtBgxDyeC2nu9mnqwL1Wz57d/D2C6M7WDPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyHfu/j5HMCovxZ6CySJmJkk9WJU3Zv9SmebkNjZRo7E71XZs467EPP38iUZM0znx0Z135y6W+GZ+vOi4syQx85XycWemt+uA03iAgPg9Jth8G/a6Iy2AcPP6EfZ4x0EK4FXftI/drZa7kQCFsLB4Yw9OSd68AK3pJwn3lS5n8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ag1uyLGF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ag1uyLGF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so39885465e9.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 10:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889467; x=1789494267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7X+5DAft/iGazDSb7XtX+r5mhhxFu84ghIc52Wrj0I=;
        b=Ag1uyLGFHp1tZcc1JuP31PbOLxXPPRrBhQxK4O6darDZamAK1x5k5n4jpLA3wE4bMT
         S+8gYsK8MbtyVIC9zSc7S317iFwJ0pcnPdEjL/5dJ5m38ygxz4DEhwCdoxEsNTw8HjAn
         bzD9Ub06+u6se7mJWr3DcFfGbHhe+wrB3dvftiZ2FVDE2GfZorxKw4TjCj08qKDewXTO
         INz1FLzylZEW51LBhaiYvOUKAsFbRKxO4rbH5gKqB06I3JaBi/8vgA2GSf821FT+sD2J
         vejxrQY8Cq1YwVMaxHMjW++pU+Yp1UWF3lDuYMfpihW6lCMCbM7LWOcE6qKWWXJ1FFsx
         OjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889467; x=1789494267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7X+5DAft/iGazDSb7XtX+r5mhhxFu84ghIc52Wrj0I=;
        b=Gx/n3iO9yYc4D7YWZPV/5dgI2+25/RYibXS+qnt9w3AX1YVcG4O2ixaxH89BxTDqdr
         xYOkZJXEaYHxJKEn0Ilv4hMaOxfJDxEGpnnbq+V6MvP6LvJvJ+UUNjUqKH0eAoiS/7cP
         JQKpmlYOYBnQjdOOcNAonDbOQJkax4KU6Z5WbIDcTw6SCu1bM8oqDxUg8QH+7K2HSkIe
         k4COZ2tT1AmEU66N0fHKa3W5E9Kjh7h8lmK62xtnJDFflBqadzgRT67ClRAC8gDpDxsi
         obUelaBStXifB2MWXs/Nk3UMCg1jLoEko4WOx5+oxeowOqt2RTVuOtFj+zLn0xOEXA6c
         M4pw==
X-Forwarded-Encrypted: i=1; AKwUvBxbx0kEo6Hbk2p4/CQYt0F4834lJYjDoQzr7Rz8E3mqMCHjhX3BSBIz1AiWdkVr8fnodf4ZJ/awm1kV@vger.kernel.org
X-Gm-Message-State: AFuF++krYEOoLWOeF2IjuiOyLUcU0JzMYypsmFxkh9IduYaYOYqxetKg
	aATeeGmI/PFlmJpAoGW4B5ayRnqGtgMoAktJluIPM1IXQvwUoGIX/GDt
X-Gm-Gg: AYBFou0ye0JR3CfpTwYFdGF9sHEv3D88le3R6mQJEzWMWa+4QuGqMuU4wNVCZrjy7w0
	rYjPRetf8M3wIOdg4OGuuvOVZWDqXxL0236RL7QniQUF79SW+7u604EQE1bhD4vu6L58qJ1Ml7e
	uD6L2ZneEyH0J41bxDC6dufVtI5T408eOLdY3c/Rh3BSRPAmzOXEJ3FF+B4yyGLk4FHENSeF/ft
	QnOytlzokPwrP1Gh59v4QdKoAavGlGHo9BVsVeOwSzMm+XjR3rOdNFHVV/0zD8dyx2Ghu1s5s73
	uA6TDEc+PDz8umd4xOpRQYKtUyNc9x9nJYVhj2+nwgM2ThucGYJirhiCHj5AkFAJDGMoIGFahX3
	0uCWXD//5IALi9SviNrNQ3oKCmuoZ/D/wX6yLbcdcWr5T22NNVAiqLBl8hQn8bLKxce4SUNwkQM
	g/0ne3jPOXzW5ts0yTmWvbD1usI9N1ORjMQU9k0T/K68NDbNMLObZhkiui
X-Received: by 2002:a05:600c:4e0e:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49cf81e6063mr290969905e9.2.1788889466528;
        Tue, 08 Sep 2026 10:44:26 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:26 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
Date: Tue,  8 Sep 2026 19:38:29 +0200
Message-ID: <20260908174259.9009-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the toprgu reset controller feature for the mt6589 SoC. This
allows generating reset signals for the 12 subsystems managed by its
top reset generation unit.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..2645054a4a61 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -147,6 +147,7 @@ uart3: serial@11009000 {
 		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
+			#reset-cells = <1>;
 		};
 	};
 };
-- 
2.43.0


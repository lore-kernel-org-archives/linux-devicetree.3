Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF332391E72
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246287; cv=none; b=ribC1E8Bnx9lnF+ikJ8RAfUuSTgVXoV0bO2VN1hwlvPFDIC1zIxVGsSUwmZjaRJlDa4gEn1V92GsbXLumb110/yUNqZMLQ6WXUZP+C3YIoVUscAQE6whSkZFr0x7eBSHJD/b0vrK38HonKIkOOD9cZeitt672FR4VbJSGm7/abo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246287; c=relaxed/simple;
	bh=Xsqlm+rF7jIXTcXnCSKMaVUBX15NQaxokCbcRbwJDbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TinVFjy3DwysrJw0acf7gk+wbWGDmhSojG10iVyQiib2fQqRe1r2z1s5mOePl9Fuj7JJERN368sPIW3i0fKPRQnPVy4THRhIat8d8H4A5/qI2JzHaxC9a7ddjHC+aJzUt48gCZZy5v0DD/qJ0nzlip356LGdR5hcNhO4J1+gk8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1NLJkIS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1NLJkIS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b691cb44so12891625e9.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783246284; x=1783851084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UY6T/viKs724YCtcNe87O9J53G3jzdQBIfSFXtvLiY=;
        b=a1NLJkIS8n1xjhVOy5lYXcSxfeWUQbO4dPt8XKHTYwJL3QmyzS3X5FsW8LacxHXOMb
         URmcwDIfMgG54oyiULOIoTvg9vpeUnNEwOhavFkRw/55A4U3aZ8wpPENkrEvnRD8D/F6
         cWuEtjFl5kVYQxCeKdIm7LijNCbyBmPqmX3K1X+eKpl9JBOjl+X1w6VRO6j0iISCx0so
         K4d9fdF1yw7ai1T0gRfcytQLuss8+D4qKtXHR4U+HjE2Ic14SQGoUF8+Wg+jXwJf9lhB
         XR6HnqkMOozn9ek9TRuKBtBoi3XbZzEkGTqQmfUNrop2K+gd1oq915lzcxSy5da3tQJz
         mrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783246284; x=1783851084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7UY6T/viKs724YCtcNe87O9J53G3jzdQBIfSFXtvLiY=;
        b=SM1pwdvtIKJqyXMEFZUOILgg+WWWoUylMks4JY0z46PgXbrA7dvw6kK2omUPXYVU/F
         tZ015iWAP8224inswK4zxS/7RmufE3+w0hlQqEaVSywKQTkYBzCQYQn31RVh/angWPwX
         j//paI5WCRPQwxUgQju2EMSeQnh7TkJpHeIe9RlOzOghZs0tLiTFLnhmJS6ZL2KRm2C+
         X4Tl3iZ6TzJq6TOXFQkKp95rQnAYJPNTQFaIkZW8WK2PSEQ6V/BZHBNsjUHFPvMayIrQ
         Ofxn5qoYIBf+ksZRo2N2E84rnUrvrs+oL6SyAM9oR9sDbVj9aNpHHtgvNxU+YhVlaA81
         FCaw==
X-Forwarded-Encrypted: i=1; AFNElJ/ofgltjRkzUbHoXO2xrHEva8VOGzkswm4KjNf3l+a5pjCHg2OpTNrh9CvH61IUwNTgHhmsh5KmdnEv@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYR5Xved8R7okV+Qr5Wf+bEGuk05ExYLv7GYsgpoZVPBtN32s
	SDsF1UUlUd8IQ40L22hiupwQO/9w1XKFoIBCe5LEjOomCRT8wRi4lh8Z
X-Gm-Gg: AfdE7cnJEvBIUAn1Vg8KLv6dHDJplxHBjwNsjKN+l/YriP9g6ERwDjIG1IBbGYO3f9a
	aCwldQiGmLYwsUwfmdJ8lDd9GYD+I43qwzBQDtN13vchFDtW92Mz4OUtBe/cTYy9SfYNP1s2Wjg
	Jqd3e7br0bbx3B6i/xZaeZe/O8DK0LFow6ovptUusTGgccDriJLUSQirORM2/s5dATTqk5jsQ5M
	UCuytsTZLdQlgcJ5+I12f4DjjZPno6NXalRZeM29tGKzh91rJFD+TH+1D1gOgIRiub9/qpwHJmF
	PAl8lA/emVDVV5Yf4KYdqF4aXgn5sAzXfVuHlGFrFnryqNpAFtL+u1M9NDef9ublYPnUy5PgWAW
	CCCg9hANh7xUzR42r32DbChasdKeR3P+zUOcjqMICmsIoJ5MNtFDKZhmd2iwa+nNc9/QS7VO5TU
	JJEul/9dPWDxuH7LNOqfHx0aMZl5MS1oVs0g==
X-Received: by 2002:a05:600c:8b85:b0:493:bcef:5646 with SMTP id 5b1f17b1804b1-493d11db32emr69992255e9.12.1783246284252;
        Sun, 05 Jul 2026 03:11:24 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bbcfsm261382715e9.6.2026.07.05.03.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:11:23 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v3 2/4] ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for CPCAP USB PHY
Date: Sun,  5 Jul 2026 13:11:03 +0300
Message-Id: <20260705101105.1798069-3-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
References: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the CPCAP USB PHY interrupt mapping to use the charger
detection interrupt and corresponding "chrg_det" interrupt name.

This matches the driver and binding updates for DCP detection.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 6b1195c2a768..51a858021541 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -125,11 +125,13 @@ cpcap_usb2_phy: phy {
 			interrupts-extended =
 				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
 				<&cpcap 19 0>, <&cpcap 18 0>, <&cpcap 17 0>,
-				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>;
+				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>,
+				<&cpcap 13 0>;
 			interrupt-names =
 				"id_ground", "id_float", "se0conn",
 				"vbusvld", "sessvld", "sessend",
-				"se1", "dm", "dp";
+				"se1", "dm", "dp",
+				"chrg_det";
 			mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,
 				     <&gpio1 0 GPIO_ACTIVE_HIGH>;
 			io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
-- 
2.39.5


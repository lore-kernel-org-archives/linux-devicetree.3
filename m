Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00325443E39
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136021; cv=none; b=Oxfhin4WUfRPhpQDc+F/jlZJPAkLv6wot8u7sGs7z5ttWqu/39kHgXrjTn26mA7L2ToTE12EWd2wxFFeD+EKGowRNJ9FN3fgMTfopUFHh2IUT69YWbrObnFQ+M6gv3ncDN7vj/nTj7/lSzQ9zec/6cLgKnY8dlHGyoGFt9DY/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136021; c=relaxed/simple;
	bh=DY0q0xPx63XcLnbKsfqeJS12HVZomAtI+ZEXuXm8Sio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppKTHLRnziBLQoQrddcRvrUnuZKj/TAenxxpZQ98ilJiPNfOxQP4D1U/f6G+NUH1ag1a/OyXjd8JLhb8YXQznwcaUUNX8kaIOaRmQkDJ0n2Qw8DCCRS1C8X2gZmOT31OPKQU37pVaK7OAyxsk6pX8sWdHB2smEODQi+3gqRIBII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=razxKpvY; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="razxKpvY"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1338261a91.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136019; x=1787740819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGtbsIyEK58caKUAI4NkFCHbnbaFbCN/BWCCBxCs0Ek=;
        b=razxKpvYAHmvBivGgHX66raEsksttSnRdC9Ad9+jMaVAIWjWuz65YKSOm2CIDtObt6
         soIuehqYCU8gHleCpUj+Av75cyteLBpSRoZBeRAtwoS5sy12OCcrl+y6G7bTbzPRngLM
         34rW8iaf6TNlfk4zfdlwKK8ncBOc01XCFEbCOaDcrMNCV4GsZ4wVAuvbkKdXVxaF4ANr
         ntxiw8nhhSRkARqLInp+xdu0NCp/WeVoa03miBXSijEaF3RhkaYcr6mgI4/zfpR1hr+z
         KSC2BsfEqz79LMxeE6S+JtgEXgidyEJ2cuGXNr5pthzgPem5tTDaVRQgQETbww6zRcZn
         E3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136019; x=1787740819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uGtbsIyEK58caKUAI4NkFCHbnbaFbCN/BWCCBxCs0Ek=;
        b=Ziai2yv1fzd31XDorpLJK9BnQaiJ0yxoRIJf9mbcPX48a4h3HFMx+9/U6VUmWMWGKO
         y5F0eMduNgDzTel/hSBLBJl8EXmlNHCv1A+rRIWIZMdGoO+ztkk5r+MM3tOGVsW2qX6h
         PZUXMkXWF4IQyW4peeZ7zboti8HPwvtCPTYJfRZyD9YCsyT2lJZVasiyzmLKtYBFrOmF
         n/jRcx74fD7WZmXI9kacWRmc1gB6tsprV4PASDdTPEY/lLZE9g8MWIzX8wmflFa8TV9e
         xp4EQFQtjjbvk4fH4KT8+W8K+WKAmQubnsGS9OXkogzGPGBDF41euMqf3prNjzGk3P5C
         7dVg==
X-Forwarded-Encrypted: i=1; AHgh+RpLtII81DzWt/im4DRdbY6T2RyuPSqXa7MG09kJ6zm5EOyzCpjwzaD0TWQnXM/9Q3HAl8RrZ1FAccei@vger.kernel.org
X-Gm-Message-State: AFuF++ncxdM1RqR5n4Xa3dO1Ro3VSGvQ5zIYuoO7Gehqt4ijwqWyipg7
	26BrF7ezz/TfZPBDHtqYlhsFuvm02dW8PfIpnRoGFfWBJx6/I1tMbv3j
X-Gm-Gg: AR+sD120OsvdNMewJ5CKaPv/BO3XMc69xopI+h90agxLhnkGVM9uKj+AVhhnEmV1Fva
	fbpf4CpUpWqLn47syvpIqc1aSHe1u9aBFVot1zj9vmT+foU020+aHWt7E4Rlr1Dzw+/W7YPcCF0
	hI9URSLY7qHm3vkNZWsnsAxLKFTQMhgfbNTqCBc97nEgJ97c0Qhyn4K4fHcYKMJGHbO/U8Aivou
	bc7h9h2pPx1Q7pMhU3jjRGi/Nvq/Xx8lkNn2y7wiTcXAXrFzkZgaVcgkrZrFQCQKZrj2md4JOAD
	d4qnZoYSATZmv2vIQraUSu4+o5a9ErCVVqed2isuJ3rN2j6/0Oj++MbcCdagxZOMfi6mA+I75Ck
	ieFdV9tw7G3tHbC/GY6Z2j7ihfAsJgrwXHPAm0Rpm03e1AnHFk9bjORYmI8XjIuZ/IriJRVvUTW
	6nXvCN2T4wX1uSOP9/zWR5Sy+Qt8b3LTAg55bYqDJKrARA3FvZ+e1D2djKjLYPtUqfXNGx2tu2j
	7ck5uHE+XLBqMsUkF7v8k4pHuJ/aFZARFYsVOIjVFDRVeByltsp/yi1sxJTB0lEiNHxBV7R/m/a
	niOGHvyA4rU5hejNST6c
X-Received: by 2002:a17:90a:fc45:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-39580f6d136mr7421193a91.12.1787136019196;
        Wed, 19 Aug 2026 03:40:19 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:40:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 05/15] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
Date: Wed, 19 Aug 2026 11:39:16 +0100
Message-ID: <20260819103926.2136712-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the ARCH_RZN1 dependency with ARCH_RENESAS for the RTC_DRV_RZN1
config option to make the driver available across both ARM32 and ARM64
Renesas architectures.

The newer RZ/T2H and RZ/N2H ARM64 SoCs integrate a closely related variant
of the RTC IP block found on the RZ/N1 SoCs. Update the build dependency
and expand the Kconfig help text to allow this driver to be selected for
these additional platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3->v4:
- Added Reviewed-by tag from Wolfram.

v2->v3:
- No changes.

v1->v2:
- Updated help text to keep it generic and not specific to RZ/N1 SoCs.
---
 drivers/rtc/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 01def8231873..d23a0fbe8d89 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1635,10 +1635,11 @@ config RTC_DRV_RS5C313
 
 config RTC_DRV_RZN1
 	tristate "Renesas RZ/N1 RTC"
-	depends on ARCH_RZN1 || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
-	  If you say yes here you get support for the Renesas RZ/N1 RTC.
+	  If you say yes here you get support for the RTC initially found on
+	  Renesas RZ/N1 SoCs.
 
 config RTC_DRV_GENERIC
 	tristate "Generic RTC support"
-- 
2.43.0


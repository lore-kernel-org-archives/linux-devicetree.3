Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38D83A9DAE
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558413; cv=none; b=t/BafeyWJuf0j98OEyRpZ6RGHxeXbMSrZ3vPWUrkTki1GmKCqAtY2FkmIC0e8VpgAVeDo3Jp5d6GxcVYj55JnXZZLXBvCxIX5pSHsrD6ZVIu/XQPdYnaQDSawDV4zsd6c0RsFpsP3OOt/Qsjle+0V/OjARnj+o3jxVug5R6Ytkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558413; c=relaxed/simple;
	bh=ycS9iyHCfiySCdZ6el38VdkD++UrtsSYhhFfoX/jM2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5VLtzwyAtXU8D6BulMnaReDszDLQTb4NeFuVp8z89J5vs/3U9oOuJTKmxYiJTbQpyssjxFxwckcfz+X5+nqjAqZlVRCyes+KkJi0DCZHsgpRX4XeaG8AE/p5d74f1oUCRYMGFyQ0cnkrw7XdOj8l0gi1ZMSsnI5hXIOOjGWSHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3oa7HUA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3oa7HUA"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3649964b3a.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558408; x=1788163208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnfIpiizNz+uh0Nm6+hx6fazu+VGaeVW2k9CDNJDFzo=;
        b=T3oa7HUApnL6YQx2RdzGiqEUImvk70bciKiwbZPq43fG6sjtl9hFmVKjpUmU8yocDG
         Lim90mnAPx+kCSjYq0k1E5zKdcZicEHBHBlahfFZoXw6H4p4nZeMjqcFE6tF7kvdMik4
         ne7roHKiO2WgaVpp1qUhjvuR5eLnOoViwWjj29+OLz4uHUGkXhUDjXaOq6XmK5t31oJg
         zFlsX1TX8U04zkiNkairXiUIQ49uQcG7Gzk4W+mc4QWfTLKX07+7q7N6aQztnCKMuFMY
         zEaViT+UUVX/riNHGfqTA/KYbxFenZtvKY6GzhOTTZzzRgXU4fXna+2sIywlNP4UhXUa
         2bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558408; x=1788163208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnfIpiizNz+uh0Nm6+hx6fazu+VGaeVW2k9CDNJDFzo=;
        b=U3p1fKr1VUYKSAie91EjJXIUG3KCls1CJ6Xce/sre3WgDFD6DtgNEV0M1F4mRUry70
         67OzhDQvujtJ0TTTrfNOoFHT21yG9D5jVQFq50sAYfoTRU3WuNelBZJgylIeaRuj+mGN
         J6+krgyW8d24vJxXU5Ulf+k1xBAsMyQXc4otv+Ej4ljXRoOGQLT6Jleko4EfnjbK3iA2
         aYhy/8PigdA8cRSySl8jmcz7usJO71WtCjvLT5Z4tDkthcp1PXu7mRwINy2N6MLVjbnC
         /f98VimGliQejkSfP/dOXCVPb2QrxhhTVB2FO9jzNvqJ4q6pOpZZYLqqqyujQDwrZdwr
         ttNw==
X-Forwarded-Encrypted: i=1; AHgh+RrF/2HWhqSA7yeFjAIbMt2ER1XSmi7TamD9lx3maBMpOt5a1YQWBnENJc7BmnOBc/eZc0qbRPKwcrBy@vger.kernel.org
X-Gm-Message-State: AFuF++nwSl1p5sNO39gCDd6SQZF4LtCDpED6REAFq7iy/Q042bkJSn1v
	l7u0mwHLDYTtPAbFq80Rm+XY2xXHtyGcu7a9nEyNdqbK1n2w1qh+RYMe
X-Gm-Gg: AR+sD11B/LLR6jWhQU2BmZ2ysY2B83qacCCjfhlKvyYnnOizvk5wvntXJozZ9jYVSNY
	D32HOdL3CwMLA4RltCeLXN7ZPuKPS0HLoVJRtZHkkViOWpL+Hu+xg02mIrCI9hbfffTUR5V0d5O
	h6dvh3Af4n5biYaOdFINi593bCquW6D1vZt2cOE/VTMq8nFlfidNJaE8L/KgqxWymyn/Mp7voLH
	hzXi6xvHmn7OBj+K78Jk0Gcayukls0sXK0PfkNQRAkfGh80xqn7VMguScP7aYJz21gqsVRO+55A
	4aQOYAmg6u7zf+XTuUqBtrR+ZMMVGdE932vVBLxJsqpH+RXKxa1/zcZKQLOUPISwNd10CjY8bv3
	XrWQQyfK+IXZ29lc0LFH9nBm9PZJQ6MjTRGMQRAJqtTcAQ/vM3hVLU4i6dIYAU/1h6lCFsmmCbC
	XhJ+VG+wxcDs//FBU1VYsRn57INMrntfmIIti7esvgeh6qBBLNCPCsPaDKvZ/jPCF2mwoKy61zc
	9uzeF53bWdJGMrN9V7RSE5Ma9Hs48U3QYoJ1lRXjJ6GM4RyfMLvq8DGT3p8XztrDhJa2CRw
X-Received: by 2002:a05:6372:a749:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3cd14fb6375mr30393359637.15.1787558407725;
        Mon, 24 Aug 2026 01:00:07 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:fabc:2511:c0a8:be1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm24887994eec.17.2026.08.24.01.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:00:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
Date: Mon, 24 Aug 2026 08:59:36 +0100
Message-ID: <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable RTC support on RZ/T2H and RZ/N2H EVKs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index ffcc0960903b..2a8414d6d632 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -21,6 +21,7 @@ aliases {
 		mmc0 = &sdhi0;
 		mmc1 = &sdhi1;
 		serial0 = &sci0;
+		rtc0 = &rtc0;
 		spi0 = &xspi0;
 		spi1 = &xspi1;
 	};
@@ -514,6 +515,10 @@ xspi1_pins: xspi1-pins {
 	};
 };
 
+&rtc0 {
+	status = "okay";
+};
+
 &sci0 {
 	pinctrl-0 = <&sci0_pins>;
 	pinctrl-names = "default";
-- 
2.43.0


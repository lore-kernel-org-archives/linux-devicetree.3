Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60FB4921A2
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083108; cv=none; b=Lz5DyBS8xlIiWddNn06f69cze4M6esbFDAZDkiuuaIRNv9BYhtYLsqt6psCjJBi7esfRaADgePFBFUpbqwj/5AWp4P8aXOVV0UC/x2OuXOe+To+W79i/YqtQxE9H4JWUQ8spkd3vGjVTUuDImUH91WCzdI5uF6KxdAUNyFKEEEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083108; c=relaxed/simple;
	bh=FEMjP15F1NE/spmUFlsCVx8qm11wUKk+yt3CUZmgn6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TartVENAhUtebXISSX81PCnTk9dgVkXViM2jnO/M+JIlmjbnMbD0LXB13mZhMYdJD2k0+mmXKUllpZbogmhgSijBDUllyMJqZM1LOXVwISH1iSLoLVHIgwiWeNMig0qaDZu00rBKkC31cZEC/OIW89XPfQ/Ta7Jw8VKAiwL3ZI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJQEDCNP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJQEDCNP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso64133635e9.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778083104; x=1778687904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+ZRECmPK08nEy/eAWzo3z4IcBQY4aiQeVyCDa18Fp4=;
        b=HJQEDCNPa3AC9ykdq1Iv0m/1WaatgmbDix/vqmA6ZkBpx1TfhBOqpJGqRAKeaa0XaE
         hWEknRiv3vXh4U7iV+edNCAFVprbd1Jm5pbPkjnNOTk3IWWxAMm4cI94IdmmBww3TBOF
         /Y/Hsp9wpbJMXxb6dQtYSr/HCIFnz76CI3yQwYp0bXnPZkpaEtgJN7eII6l1h5/xuV16
         u7CGCgK3jonVnxC0zmEV18WxFgfQguPpVJuQl5hp89d4GkwdqQAsmsPwCyxni5pSYbPh
         TWWKwPbbEIH29GpvfY140eBxdm27WQ4Ve87Q8klqfcIvMUCLfBeDBNSV7WnMVIjlqH6d
         eO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778083104; x=1778687904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5+ZRECmPK08nEy/eAWzo3z4IcBQY4aiQeVyCDa18Fp4=;
        b=CrxMqWgeJXhdFDLVeLya6tmBlzAjgA027/gtvDe3BviMN6b0gUxo5IPhKz8b6atB6r
         +oKNdNf40LSeetAuGINULrduJ6lo8jbNcEtGBeKBs75pdCvBfjF8gdWKqMShk/5eFo0U
         VqlJItBNuzpyXllfde6UIQQG7PaIRh4QIndEfITySBnVJEAxWfytwK642m3/NQg1cXWe
         yxMEndbcdBl385/NpA6Z0y/CG7aL91hIPrGRvk9Sqau9q/6YBH9srN6bWzScMqwc/NIE
         f6UjA+sYiGpumY+Ak53O/xMP6hBOulJg46/YWUhtUImvzPnRxmMbtUz2JmW76arSCRYn
         s7/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Twu6+uEiU0mXAbrO7XTufr0bZPr7aQjZcmfrjtSnRR8pIUAao69h96ATBGE6D1Dxp7CqcOfn/zDIV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1WZnhRt9YaG5MGh2KiiMqsNJavt7mkZH01QjG3k4ogNjbxfAR
	n9TLXaGWjv/Ao6uh+0i0TjViPsPuydJ12RnOw5zXUmPsf20D/geZNVD4
X-Gm-Gg: AeBDietwIg3NBo8Dp5CtGzy6XJwMbH5fNqcFLCujlZ5dfd+LNSOj02ii7cLbowZ9yyh
	0zoQ9oJBh50qhi4yRRldDLTPcARHBy+5Edvr4gbQa1RGYVLazE2OvXtRRIriLSlGEIjHe67xtrj
	/W562WpNG0YA7hgS+0t96amnfgMtybHQqTcxBgoRgMXX3v0mQdWihx/vKiRY/+VQafUtR7uk8/0
	su0gCn8tRXzmVm3ro/Q+B6EDD4CtmTnYgPYbFUhXKNquSYNA46/JUBWBT4OMkiPEUp6+YMbzGGD
	ibeQsOwQlp9MB5FGmTTwnoTZYUzoFvNcbYeIaHi+iaCzE1FC6J12pFx8w8qJ0/3jvo5GSr9nwqK
	av4DlRO+x2q7E9ofZAkxSUD19/KC95boUUioJC7ubEvMRzLFTodPgC6phv6rUnWluoK0LdMuqDD
	bXC/HlVmhV9CfjBd+Fyf0NxckmOB6FUCY9/GoWHXccjFFREMses+xf/CziSBTzeGc/Zm9EMqs5W
	0Q31ou+8LfiE+i/uaJXCwPfevHQ32tvem/nn3H62OkaKzHoHL2hqrCu5g==
X-Received: by 2002:a05:600c:17d8:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-48e51f46abemr36488075e9.28.1778083103372;
        Wed, 06 May 2026 08:58:23 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b2039sm21345205e9.5.2026.05.06.08.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:58:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add alias for on-SoC RTC
Date: Wed,  6 May 2026 16:58:03 +0100
Message-ID: <20260506155804.3984418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2H SoC provides an internal RTC, which is enabled in the DT.
The RZ/V2H EVK board also includes an external RTC in the RAA215300
PMIC.

Add an "rtc0" alias pointing to the on-SoC RTC node to ensure a stable
device numbering.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index bd69109a5086..3c1ddacc0944 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -27,6 +27,7 @@ aliases {
 		i2c7 = &i2c7;
 		i2c8 = &i2c8;
 		mmc1 = &sdhi1;
+		rtc0 = &rtc;
 		serial0 = &scif;
 	};
 
-- 
2.54.0

